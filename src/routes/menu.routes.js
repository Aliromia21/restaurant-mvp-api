// 📁 src/routes/menu.routes.js
const express = require('express');
const { getPool, sql } = require('../db');
const authMiddleware = require('../utils/authMiddleware');

const router = express.Router();

/* ------------------------------------------------------------------
  جلب جميع الفئات (الأصناف الرئيسية) — عبر اسم الفئة
------------------------------------------------------------------- */
router.get('/categories', authMiddleware(), async (req, res) => {
  try {
    const pool = await getPool();

    const result = await pool.request().query(`
      SELECT DISTINCT 
        RTRIM(LTRIM(Category)) AS Category
      FROM Dish
      WHERE Category IS NOT NULL AND Category <> ''
      ORDER BY Category;
    `);

    //  تنظيف النتائج من القيم الفارغة أو NULL
    const categories = result.recordset
      .map(row => row.Category?.trim())
      .filter(Boolean);

    if (categories.length === 0) {
      return res.status(404).json({ message: 'لا توجد فئات متاحة حالياً' });
    }

    res.json(categories.map(c => ({ Category: c })));

  } catch (err) {
    console.error('❌ Get Categories Error:', err);
    res.status(500).json({ error: 'حدث خطأ داخلي في الخادم' });
  }
});

/* ------------------------------------------------------------------
  جلب الأصناف ضمن فئة معينة — الربط بالاسم وليس بالمعرف لعدم امتلاك صلاحية التعديل على الداتا بيز
------------------------------------------------------------------- */
router.get('/items/:categoryName', authMiddleware(), async (req, res) => {
  try {
    const pool = await getPool();
    const categoryName = decodeURIComponent(req.params.categoryName); //  دعم الأسماء بالعربية

    const request = pool.request();
    request.input('category', sql.NVarChar, categoryName);

    const result = await request.query(`
      SELECT 
        D.ItemID,
        RTRIM(LTRIM(D.DishName)) AS DishName,
        RTRIM(LTRIM(D.Kitchen)) AS Kitchen,
        RTRIM(LTRIM(D.Category)) AS Category,
        D.Rate,
        ISNULL(D.Discount, 0) AS Discount
      FROM Dish D
      WHERE RTRIM(LTRIM(D.Category)) = RTRIM(LTRIM(@category))
      ORDER BY D.DishName;
    `);

    if (result.recordset.length === 0) {
      return res.status(404).json({
        message: `لا توجد أصناف ضمن الفئة: ${categoryName}`
      });
    }

    //  تنظيف البيانات من الفراغات الإضافية
    const cleaned = result.recordset.map(row => ({
      ItemID: row.ItemID,
      DishName: row.DishName?.trim(),
      Kitchen: row.Kitchen?.trim(),
      Category: row.Category?.trim(),
      Rate: row.Rate,
      Discount: row.Discount
    }));

    res.json(cleaned);

  } catch (err) {
    console.error('❌ Get Items by Category Error:', err);
    res.status(500).json({ error: 'حدث خطأ داخلي في الخادم' });
  }
});

/* ------------------------------------------------------------------
  جلب جميع الأصناف (بدون تحديد فئة) — شامل الاسم، الفئة، المطبخ، السعر
------------------------------------------------------------------- */
router.get('/items', authMiddleware(), async (req, res) => {
  try {
    const pool = await getPool();

    const result = await pool.request().query(`
      SELECT 
        D.ItemID,
        RTRIM(LTRIM(D.DishName)) AS DishName,
        RTRIM(LTRIM(D.Kitchen)) AS Kitchen,
        RTRIM(LTRIM(D.Category)) AS Category,
        D.Rate,
        ISNULL(D.Discount, 0) AS Discount
      FROM Dish D
      WHERE D.DishName IS NOT NULL AND D.DishName <> ''
      ORDER BY D.Category, D.DishName;
    `);

    if (result.recordset.length === 0) {
      return res.status(404).json({ message: 'لا توجد أصناف متاحة حالياً' });
    }

    //  تنظيف النتائج من الفراغات الإضافية
    const items = result.recordset.map(row => ({
      ItemID: row.ItemID,
      DishName: row.DishName ? row.DishName.trim() : null,
      Kitchen: row.Kitchen ? row.Kitchen.trim() : null,
      Category: row.Category ? row.Category.trim() : null,
      Rate: row.Rate,
      Discount: row.Discount
    }));

    res.json(items);
  } catch (err) {
    console.error('❌ Get All Items Error:', err);
    res.status(500).json({ error: 'حدث خطأ داخلي في الخادم' });
  }
});


module.exports = router;
