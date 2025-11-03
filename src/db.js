const sql = require('mssql');

const pool = new sql.ConnectionPool({
  server: process.env.DB_SERVER,
  database: process.env.DB_DATABASE,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  options: {
    encrypt: process.env.DB_ENCRYPT === 'true',
    trustServerCertificate: process.env.DB_TRUST_SERVER_CERTIFICATE === 'true'
  }
});

let poolPromise;
function getPool() {
  if (!poolPromise) poolPromise = pool.connect();
  return poolPromise;
}

module.exports = { sql, getPool };
