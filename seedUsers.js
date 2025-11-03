require('dotenv').config();
const bcrypt = require('bcryptjs');
const { getPool, sql } = require('./src/db');

async function seedUsers() {
  try {
    const pool = await getPool();

    // كلمات السر العادية
    const users = [
      { username: 'captain1', password: '123456', role: 'Captain' },
      { username: 'cashier1', password: '123456', role: 'Cashier' },
    ];

    for (const u of users) {
      const hash = await bcrypt.hash(u.password, 10);

      // تحقق إن كان المستخدم موجود مسبقاً
      const check = await pool.request()
        .input('username', sql.NVarChar, u.username)
        .query('SELECT * FROM Users WHERE Username = @username');

      if (check.recordset.length > 0) {
        console.log(`⚠️ User "${u.username}" already exists, skipping.`);
        continue;
      }

      // إدخال المستخدم
      await pool.request()
        .input('username', sql.NVarChar, u.username)
        .input('passwordHash', sql.NVarChar, hash)
        .input('role', sql.NVarChar, u.role)
        .query(`
          INSERT INTO Users (Username, PasswordHash, Role)
          VALUES (@username, @passwordHash, @role)
        `);

      console.log(`✅ User "${u.username}" created.`);
    }

    console.log('🎉 All users seeded successfully.');
    process.exit(0);
  } catch (err) {
    console.error('❌ Error seeding users:', err);
    process.exit(1);
  }
}

seedUsers();
