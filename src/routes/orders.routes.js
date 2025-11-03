const express = require('express');
const { getPool, sql } = require('../db');
const authMiddleware = require('../utils/authMiddleware');

const router = express.Router();

/* ------------------------------------------------------------------
  دالة مساعدة لتحديث حالة الطاولة
------------------------------------------------------------------- */
//  دالة لتحديث حالة الطاولة بدقة بعد أي عملية
      async function updateTableStatus(tableNo, pool) {
        if (!tableNo) return;

        const checkOrders = await pool.request()
          .input('tableNo', sql.NVarChar, tableNo)
          .query(`
            SELECT 
              SUM(CASE WHEN LTRIM(RTRIM(Status)) = 'Confirmed' THEN 1 ELSE 0 END) AS ConfirmedCount,
              COUNT(*) AS TotalCount
            FROM KOTGeneration 
            WHERE LTRIM(RTRIM(TableNo)) = LTRIM(RTRIM(@tableNo))
          `);

        const { ConfirmedCount, TotalCount } = checkOrders.recordset[0];

        let newStatus = 'Inactive';
        if (TotalCount > 0 && ConfirmedCount === 0) newStatus = 'Active';
        if (ConfirmedCount > 0) newStatus = 'Occupied';

        await pool.request()
          .input('tableNo', sql.NVarChar, tableNo)
          .input('status', sql.NVarChar, newStatus)
          .query(`
            UPDATE R_Table 
            SET Status = @status 
            WHERE LTRIM(RTRIM(TableNo)) = LTRIM(RTRIM(@tableNo))
          `);

        console.log(`🪑 Table ${tableNo} → ${newStatus}`);
      }


/* ------------------------------------------------------------------
  إنشاء أوردر جديد (Captain فقط)
------------------------------------------------------------------- */
router.post('/', authMiddleware('Captain'), async (req, res) => {
  const pool = await getPool();
  const transaction = new sql.Transaction(pool);

  try {
    const { tableNo, items } = req.body;
    if (!tableNo || !items || !Array.isArray(items) || items.length === 0)
      return res.status(400).json({ error: 'Missing table number or items' });

    await transaction.begin();
    const request = new sql.Request(transaction);

    //  تحقق من وجود الطاولة
    const tableCheck = await request
      .input('tableNo', sql.NVarChar, tableNo)
      .query('SELECT Status FROM R_Table WHERE TableNo = @tableNo');

    //  إذا لم تكن موجودة → أنشئها كـ Active
    if (tableCheck.recordset.length === 0) {
      await request.query(`
        INSERT INTO R_Table (TableNo, Status)
        VALUES ('${tableNo}', 'Active')
      `);
    } else {
      const status = tableCheck.recordset[0].Status?.trim() || 'Inactive';
      if (status === 'Inactive') {
        await request.query(`
          UPDATE R_Table SET Status = 'Active' WHERE TableNo = '${tableNo}'
        `);
      }
    }

    // توليد رقم جديد للطلب
    const nextTicket = await request.query(`
      SELECT ISNULL(MAX(TicketID), 0) + 1 AS NextTicketID FROM KOTGeneration
    `);
    const ticketID = nextTicket.recordset[0].NextTicketID;

    // إنشاء الطلب الرئيسي
    await request
      .input('TicketID', sql.Int, ticketID)
      .input('BillDate', sql.DateTime, new Date())
      .input('Status', sql.NVarChar, 'Pending')
      .query(`
        INSERT INTO KOTGeneration (TicketID, BillDate, TableNo, Status)
        VALUES (@TicketID, @BillDate, '${tableNo}', @Status)
      `);

    // إدخال عناصر الطلب
    for (const item of items) {
      const amount = item.Qty * item.Rate;
      await new sql.Request(transaction)
        .input('TicketID', sql.Int, ticketID)
        .input('Item_ID', sql.Int, item.Item_ID)
        .input('Qty', sql.Decimal(10, 2), item.Qty)
        .input('Rate', sql.Decimal(10, 2), item.Rate)
        .input('Amount', sql.Decimal(10, 2), amount)
        .query(`
          INSERT INTO KOTGenerationItems (Ticket_ID, Item_ID, Qty, Rate, Amount)
          VALUES (@TicketID, @Item_ID, @Qty, @Rate, @Amount)
        `);
    }

    await transaction.commit();

    //  تحديث حالة الطاولة بعد الحفظ
    await updateTableStatus(tableNo, pool);

    res.status(201).json({
      message: 'Order created successfully',
      TicketID: ticketID
    });

  } catch (err) {
    console.error('Create Order Error:', err);
    try { await transaction.rollback(); } catch {}
    res.status(500).json({ error: 'Internal server error' });
  }
});

/* ------------------------------------------------------------------
 ✅ الكاشير يؤكد الأوردر
------------------------------------------------------------------- */
router.put('/:ticketID/confirm', authMiddleware('Cashier'), async (req, res) => {
  try {
    const { ticketID } = req.params;
    const pool = await getPool();

    const order = await pool.request()
      .input('ticketID', sql.Int, ticketID)
      .query('SELECT TableNo FROM KOTGeneration WHERE TicketID = @ticketID');

    if (order.recordset.length === 0)
      return res.status(404).json({ error: 'Order not found' });

    const tableNo = order.recordset[0].TableNo;

    await pool.request()
      .input('ticketID', sql.Int, ticketID)
      .query(`
        UPDATE KOTGeneration
        SET Status = 'Confirmed', BillDate = GETDATE()
        WHERE TicketID = @ticketID
      `);

    //  اجعل الطاولة مشغولة
    await pool.request()
      .input('tableNo', sql.NVarChar, tableNo)
      .query(`UPDATE R_Table SET Status = 'Occupied' WHERE TableNo = @tableNo`);

    res.json({ message: 'Order confirmed', table: tableNo.trim() });
  } catch (err) {
    console.error('Confirm Order Error:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

/* ------------------------------------------------------------------
  حذف أوردر (Captain أو Cashier)
------------------------------------------------------------------- */
 router.delete('/:ticketID', authMiddleware(['Captain', 'Cashier']), async (req, res) => {
  const { ticketID } = req.params;
  const pool = await getPool();
  const transaction = new sql.Transaction(pool);

  try {
    await transaction.begin();

    const checkReq = new sql.Request(transaction);
    checkReq.input('ticketID', sql.Int, ticketID);

    const order = await checkReq.query(`
      SELECT LTRIM(RTRIM(TableNo)) AS TableNo, LTRIM(RTRIM(Status)) AS Status 
      FROM KOTGeneration 
      WHERE TicketID = @ticketID
    `);

    if (order.recordset.length === 0) {
      await transaction.rollback();
      return res.status(404).json({ error: 'Order not found' });
    }

    const { TableNo, Status } = order.recordset[0];
    const cleanTableNo = TableNo.trim();

    if (Status === 'Confirmed') {
      await transaction.rollback();
      return res.status(400).json({ error: 'Cannot delete a confirmed order' });
    }

    await transaction.request()
      .input('ticketID', sql.Int, ticketID)
      .query(`DELETE FROM KOTGenerationItems WHERE Ticket_ID = @ticketID`);

    await transaction.request()
      .input('ticketID', sql.Int, ticketID)
      .query(`DELETE FROM KOTGeneration WHERE TicketID = @ticketID`);

    // تحقق من وجود طلبات أخرى
    const remaining = await transaction.request()
      .input('tableNo', sql.NVarChar, cleanTableNo)
      .query(`
        SELECT COUNT(*) AS cnt 
        FROM KOTGeneration 
        WHERE LTRIM(RTRIM(TableNo)) = LTRIM(RTRIM(@tableNo))
      `);

    if (remaining.recordset[0].cnt === 0) {
      await transaction.request()
        .input('tableNo', sql.NVarChar, cleanTableNo)
        .query(`
          UPDATE R_Table 
          SET Status = 'Inactive' 
          WHERE LTRIM(RTRIM(TableNo)) = LTRIM(RTRIM(@tableNo))
        `);
    }

    await transaction.commit();
    res.json({ message: `Order deleted successfully`, TableNo: cleanTableNo.trim() });
  } catch (err) {
    console.error('❌ Delete Order Error:', err);
    try { await transaction.rollback(); } catch {}
    res.status(500).json({ error: 'Internal server error' });
  }
});

/* ------------------------------------------------------------------
  عرض تفاصيل أوردر محدد (الكابتن أو الكاشير)
------------------------------------------------------------------- */
router.get('/:ticketID', authMiddleware(['Captain', 'Cashier']), async (req, res) => {
  try {
    const { ticketID } = req.params;
    const pool = await getPool();

    const result = await pool.request()
      .input('ticketID', sql.Int, ticketID)
      .query(`
        SELECT 
          K.TicketID,
          K.BillDate,
          LTRIM(RTRIM(K.TableNo)) AS TableNo,
          LTRIM(RTRIM(K.Status)) AS Status,
          I.Item_ID,
          LTRIM(RTRIM(D.DishName)) AS DishName,
          LTRIM(RTRIM(D.Kitchen)) AS Kitchen,
          I.Qty,
          I.Rate,
          I.Amount
        FROM KOTGeneration K
        INNER JOIN KOTGenerationItems I ON K.TicketID = I.Ticket_ID
        INNER JOIN Dish D ON I.Item_ID = D.ItemID
        WHERE K.TicketID = @ticketID
        ORDER BY D.DishName;
      `);

    if (result.recordset.length === 0) {
      return res.status(404).json({ error: 'Order not found' });
    }

    const order = {
      TicketID: result.recordset[0].TicketID,
      TableNo: result.recordset[0].TableNo,
      Status: result.recordset[0].Status,
      BillDate: result.recordset[0].BillDate,
      Items: result.recordset.map(row => ({
        Item_ID: row.Item_ID,
        DishName: row.DishName,
        Kitchen: row.Kitchen,
        Qty: row.Qty,
        Rate: row.Rate,
        Amount: row.Amount
      }))
    };

    res.json(order);
  } catch (err) {
    console.error('Get Single Order Error:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

/* ------------------------------------------------------------------
  تعديل أوردر (قبل التأكيد) — الكابتن فقط
------------------------------------------------------------------- */
router.put('/:ticketID', authMiddleware('Captain'), async (req, res) => {
  const pool = await getPool();
  const transaction = new sql.Transaction(pool);

  try {
    const { ticketID } = req.params;
    const { items } = req.body;

    if (!items || !Array.isArray(items) || items.length === 0) {
      return res.status(400).json({ error: 'Items array is required' });
    }

    // التحقق من أن الأوردر موجود وغير مؤكد
    const orderCheck = await pool.request()
      .input('ticketID', sql.Int, ticketID)
      .query(`SELECT Status, TableNo FROM KOTGeneration WHERE TicketID = @ticketID`);

    if (orderCheck.recordset.length === 0) {
      return res.status(404).json({ error: 'Order not found' });
    }

    const { Status, TableNo } = orderCheck.recordset[0];
    if (Status.trim() === 'Confirmed') {
      return res.status(400).json({ error: 'Cannot edit a confirmed order' });
    }

    await transaction.begin();
    const tReq = new sql.Request(transaction);

    // حذف العناصر القديمة
    await tReq
      .input('ticketID', sql.Int, ticketID)
      .query('DELETE FROM KOTGenerationItems WHERE Ticket_ID = @ticketID');

    // إدخال العناصر الجديدة
    for (const item of items) {
      const amount = item.Qty * item.Rate;
      await new sql.Request(transaction)
        .input('ticketID', sql.Int, ticketID)
        .input('itemID', sql.Int, item.Item_ID)
        .input('qty', sql.Decimal(10, 2), item.Qty)
        .input('rate', sql.Decimal(10, 2), item.Rate)
        .input('amount', sql.Decimal(10, 2), amount)
        .query(`
          INSERT INTO KOTGenerationItems (Ticket_ID, Item_ID, Qty, Rate, Amount)
          VALUES (@ticketID, @itemID, @qty, @rate, @amount)
        `);
    }

    await transaction.commit();

    // تحديث حالة الطاولة بعد التعديل
    const updateTableStatus = async () => {
      const check = await pool.request()
        .input('tableNo', sql.NVarChar, TableNo)
        .query(`SELECT COUNT(*) AS total FROM KOTGeneration WHERE TableNo = @tableNo`);

      const total = check.recordset[0].total;
      await pool.request()
        .input('tableNo', sql.NVarChar, TableNo)
        .query(`
          UPDATE R_Table SET Status = ${total > 0 ? `'Active'` : `'Inactive'`} WHERE TableNo = @tableNo
        `);
    };
    await updateTableStatus();

    res.json({ message: 'Order updated successfully', TicketID: Number(ticketID) });
  } catch (err) {
    console.error('Update Order Error:', err);
    try { await transaction.rollback(); } catch {}
    res.status(500).json({ error: 'Internal server error' });
  }
});


/* ------------------------------------------------------------------
  عرض جميع الأوردرات
------------------------------------------------------------------- */
router.get('/', authMiddleware(), async (req, res) => {
  try {
    const pool = await getPool();
    const result = await pool.request().query(`
      SELECT 
        K.TicketID, K.TableNo, K.Status, K.BillDate,
        I.Item_ID, D.DishName, D.Kitchen, I.Qty, I.Rate, I.Amount
      FROM KOTGeneration K
      INNER JOIN KOTGenerationItems I ON K.TicketID = I.Ticket_ID
      INNER JOIN Dish D ON I.Item_ID = D.ItemID
      ORDER BY K.TicketID DESC;
    `);

    const grouped = {};
    for (const row of result.recordset) {
      if (!grouped[row.TicketID]) {
        grouped[row.TicketID] = {
          TicketID: row.TicketID,
          TableNo: row.TableNo.trim(),
          Status: row.Status.trim(),
          BillDate: row.BillDate,
          Items: []
        };
      }
      grouped[row.TicketID].Items.push({
        Item_ID: row.Item_ID,
        DishName: row.DishName.trim(),
        Kitchen: row.Kitchen.trim(),
        Qty: row.Qty,
        Rate: row.Rate,
        Amount: row.Amount
      });
    }

    res.json(Object.values(grouped));
  } catch (err) {
    console.error('Get Orders Error:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

module.exports = router;
