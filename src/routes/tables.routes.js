const express = require('express');
const { getPool, sql } = require('../db');
const authMiddleware = require('../utils/authMiddleware');

const router = express.Router();

/* ------------------------------------------------------------------
   جلب جميع الطاولات مع الحالة الحالية
------------------------------------------------------------------- */
router.get('/', authMiddleware(), async (req, res) => {
  try {
    const pool = await getPool();
    const result = await pool.request().query(`
      SELECT 
        LTRIM(RTRIM(TableNo)) AS TableNo,
        LTRIM(RTRIM(Status)) AS Status
      FROM R_Table
      ORDER BY TableNo;
    `);

    const tables = result.recordset.map(t => ({
      TableNo: t.TableNo || null,
      Status: t.Status || 'Inactive'
    }));

    res.json(tables);
  } catch (err) {
    console.error('Get Tables Error:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

/* ------------------------------------------------------------------
  جلب حالة طاولة واحدة بالتفصيل
------------------------------------------------------------------- */
router.get('/:tableNo', authMiddleware(), async (req, res) => {
  try {
    const { tableNo } = req.params;
    const pool = await getPool();

    const result = await pool.request()
      .input('tableNo', sql.NVarChar, tableNo)
      .query(`
        SELECT 
          LTRIM(RTRIM(TableNo)) AS TableNo,
          LTRIM(RTRIM(Status)) AS Status
        FROM R_Table
        WHERE TableNo = @tableNo;
      `);

    if (result.recordset.length === 0) {
      return res.status(404).json({ error: 'Table not found' });
    }

    const table = result.recordset[0];
    table.Status = table.Status || 'Inactive';
    res.json(table);

  } catch (err) {
    console.error('Get Table Error:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

/* ------------------------------------------------------------------
  تحديث حالة طاولة يدويًا (Active / Inactive / Occupied)
   - يمكن تنفيذه من قبل الكاشير أو المدير فقط
------------------------------------------------------------------- */
router.put('/:tableNo/status', authMiddleware(['Cashier', 'Admin']), async (req, res) => {
  try {
    const { tableNo } = req.params;
    const { status } = req.body;
    const validStatuses = ['Active', 'Inactive', 'Occupied'];

    if (!status || !validStatuses.includes(status)) {
      return res.status(400).json({ error: 'Invalid or missing status' });
    }

    const pool = await getPool();

    //  تحديث الحالة
    const result = await pool.request()
      .input('tableNo', sql.NVarChar, tableNo)
      .input('status', sql.NVarChar, status)
      .query(`
        UPDATE R_Table SET Status = @status WHERE TableNo = @tableNo;
      `);

    if (result.rowsAffected[0] === 0) {
      return res.status(404).json({ error: 'Table not found' });
    }

    // سجل عملية التغيير Logs إن كان متوفرًا
    // await pool.request().query(`INSERT INTO Logs (Message, LogDate) VALUES ('Table ${tableNo} set to ${status}', GETDATE())`);

    res.json({ message: `Table ${tableNo} updated to ${status}` });
  } catch (err) {
    console.error('Update Table Status Error:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

/* ------------------------------------------------------------------
  إضافة طاولة جديدة (من الكاشير أو المدير)
------------------------------------------------------------------- */
router.post('/', authMiddleware(['Cashier', 'Admin']), async (req, res) => {
  try {
    const { tableNo, status } = req.body;
    if (!tableNo) {
      return res.status(400).json({ error: 'Table number is required' });
    }

    const pool = await getPool();
    const tableStatus = status || 'Inactive';

    //  تحقق من الوجود المسبق
    const check = await pool.request()
      .input('tableNo', sql.NVarChar, tableNo)
      .query('SELECT 1 FROM R_Table WHERE TableNo = @tableNo');

    if (check.recordset.length > 0) {
      return res.status(400).json({ error: 'Table already exists' });
    }

    await pool.request()
      .input('tableNo', sql.NVarChar, tableNo)
      .input('status', sql.NVarChar, tableStatus)
      .query(`
        INSERT INTO R_Table (TableNo, Status)
        VALUES (@tableNo, @status);
      `);

    res.status(201).json({ message: 'Table added successfully' });
  } catch (err) {
    console.error('Create Table Error:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

/* ------------------------------------------------------------------
  حذف طاولة (فقط إن لم يكن عليها أي طلبات)
------------------------------------------------------------------- */
router.delete('/:tableNo', authMiddleware(['Cashier', 'Admin']), async (req, res) => {
  try {
    const { tableNo } = req.params;
    const pool = await getPool();

    //  تحقق من وجود طلبات للطاولة
    const activeOrders = await pool.request()
      .input('tableNo', sql.NVarChar, tableNo)
      .query(`
        SELECT COUNT(*) AS cnt FROM KOTGeneration WHERE TableNo = @tableNo;
      `);

    if (activeOrders.recordset[0].cnt > 0) {
      return res.status(400).json({
        error: 'Cannot delete this table — it has existing orders.'
      });
    }

    //  حذف الطاولة
    const result = await pool.request()
      .input('tableNo', sql.NVarChar, tableNo)
      .query('DELETE FROM R_Table WHERE TableNo = @tableNo;');

    if (result.rowsAffected[0] === 0) {
      return res.status(404).json({ error: 'Table not found' });
    }

    res.json({ message: 'Table deleted successfully' });
  } catch (err) {
    console.error('Delete Table Error:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

module.exports = router;
