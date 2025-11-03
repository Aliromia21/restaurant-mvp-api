const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const { getPool, sql } = require('../db');

const router = express.Router();

/**
 * POST /auth/login
 * Checking and Generating the JWT  Token
 */
router.post('/login', async (req, res, next) => {
  try {
    const { username, password } = req.body;

    console.log("📥 Login attempt:", username, password);

    if (!username || !password) {
      console.log("❌ Missing username or password");
      return res.status(400).json({ error: 'Username and password are required' });
    }

    const pool = await getPool();
    const result = await pool.request()
      .input('username', sql.NVarChar, username)
      .query('SELECT TOP 1 * FROM Users WHERE RTRIM(LTRIM(Username)) = RTRIM(LTRIM(@username))');

    console.log("📄 Query result:", result.recordset);

    if (result.recordset.length === 0) {
      console.log("❌ No user found for:", username);
      return res.status(401).json({ error: 'Invalid username or password' });
    }

    const user = result.recordset[0];
    console.log("🔑 Stored hash:", user.PasswordHash, "| Length:", user.PasswordHash.length);

    const validPass = await bcrypt.compare(password, user.PasswordHash);
    console.log("🧩 bcrypt.compare result:", validPass);

    if (!validPass) {
      console.log("❌ Password mismatch for user:", username);
      return res.status(401).json({ error: 'Invalid username or password' });
    }

    const token = jwt.sign(
      { id: user.UserID, role: user.Role },
      process.env.JWT_SECRET || 'secretkey',
      { expiresIn: '8h' }
    );

    console.log("✅ Login success for:", username);

    res.json({
      message: 'Login successful',
      token,
      role: user.Role,
    });

  } catch (err) {
    console.error('🔥 Auth error:', err);
    next(err);
  }
});

module.exports = router;
