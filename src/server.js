const express = require('express');
const dotenv = require('dotenv');
const cors = require('cors');

// تحميل متغيرات البيئة من .env
dotenv.config();

const app = express();




// Middleware
app.use(cors()); //  بالوصول من تطبيق الأندرويد
app.use(express.json()); 

// Routes
const menuRoutes = require('./routes/menu.routes');
const ordersRoutes = require('./routes/orders.routes');
const tablesRoutes = require('./routes/tables.routes');
const authRoutes = require('./routes/auth.routes');


app.use('/menu', menuRoutes);
app.use('/orders', ordersRoutes);
app.use('/tables', tablesRoutes);

app.use('/auth', authRoutes);

// المسار الافتراضي
app.get('/', (req, res) => {
  res.send('🚀 Restaurant API is running...');
});

// بدء الخادم
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`🚀 API running on http://localhost:${PORT}`);
});
