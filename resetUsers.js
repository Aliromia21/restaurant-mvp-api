// resetUsers.js
require('dotenv').config();
const bcrypt = require('bcryptjs');
const { getPool, sql } = require('./src/db');

const usersToCreate = [
  // خاص بمبرمج الاندرويد وسطح المكتب هنا قم بتعديل المستخدمين وكلمات المرور كما تريد
  { username: 'captain1', password: '123456', role: 'Captain' },
  { username: 'cashier1', password: '654321', role: 'Cashier' }
];

async function ensurePasswordHashIsVarchar(pool) {
  try {
    const info = await pool.request()
      .input('table', sql.NVarChar, 'Users')
      .input('column', sql.NVarChar, 'PasswordHash')
      .query(`
        SELECT DATA_TYPE
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE TABLE_NAME = @table AND COLUMN_NAME = @column
      `);

    if (info.recordset.length === 0) {
      console.warn('⚠️ Users.PasswordHash column not found.');
      return;
    }

    const currentType = info.recordset[0].DATA_TYPE;
    console.log('Current PasswordHash column type =', currentType);

    if (currentType.toLowerCase() !== 'varchar') {
      console.log('🔧 Attempting to ALTER column to VARCHAR(255) ...');


      await pool.request().query(`
        ALTER TABLE Users
        ALTER COLUMN PasswordHash VARCHAR(255) NOT NULL
      `);
      console.log('✅ Column altered to VARCHAR(255).');
    } else {
      console.log('✅ PasswordHash column is already VARCHAR.');
    }
  } catch (err) {
    console.warn('⚠️ Could not alter PasswordHash column (insufficient permissions or other error):', err.message);

    // proceed even if cannot alter — we'll still insert using VARCHAR param
  }
}

async function resetUsers() {
  let pool;
  try {
    pool = await getPool();

    //ensure PasswordHash is varchar to avoid padding/encoding problems

    await ensurePasswordHashIsVarchar(pool);

    // delete all users
    console.log('🗑️ Deleting all users from Users table...');
    await pool.request().query('DELETE FROM Users;');

    for (const u of usersToCreate) {
      const hash = await bcrypt.hash(u.password, 10);

      await pool.request()
        .input('username', sql.NVarChar, u.username)
        .input('passwordHash', sql.VarChar, hash)
        .input('role', sql.NVarChar, u.role)
        .query(
          `INSERT INTO Users (Username, PasswordHash, Role) VALUES (@username, @passwordHash, @role)`
        );

      console.log(`✅ Created user: ${u.username} (password: "${u.password}")`);
    }

    console.log('🎉 All users reset and created successfully.');
    process.exit(0);
  } catch (err) {
    console.error('❌ Error resetting users:', err);
    process.exit(1);
  }
}

resetUsers();
