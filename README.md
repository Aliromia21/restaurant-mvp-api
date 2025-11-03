# 🍽️ Restaurant MVP API

This project is a full-featured **Restaurant Management API** built with **Node.js**, **Express**, and **SQL Server**.  
It provides seamless communication between a **desktop system** (cashier) and an **Android app** (captain/waiter),  
allowing both sides to manage tables, categories, and orders efficiently.

---

## 🏗️ Project Architecture

📁 restaurant-mvp-api
├── src/
│ ├── db.js → SQL Server connection config
│ ├── server.js → Express app main entry
│ ├── utils/
│ │ └── authMiddleware.js → Role-based JWT authentication
│ ├── routes/
│ │ ├── auth.routes.js → Login & token generation
│ │ ├── health.routes.js → Basic health check
│ │ ├── menu.routes.js → Categories & items (menu)
│ │ ├── orders.routes.js → Orders management (create, edit, confirm, delete)
│ │ └── tables.routes.js → Tables management & statuses
├── .env → Environment variables (excluded from Git)
├── .gitignore
├── package.json
├── seedUsers.js → Script to seed default users (captain/cashier)
└── init.sql → SQL schema setup



---

## 🧩 Tech Stack

| Component | Technology |
|------------|-------------|
| Backend | Node.js (v18+) |
| Framework | Express.js |
| Database | Microsoft SQL Server |
| Auth | JWT (JSON Web Tokens) |
| Passwords | bcryptjs (hashed securely) |
| API Format | RESTful JSON |
| Environment | dotenv |

---

## 🗄️ Database Design (Core Tables)

### 1️⃣ `R_Table`
Stores all restaurant tables with current status.

| Column | Type | Description |
|--------|------|-------------|
| TableNo | NVARCHAR(50) | Table identifier (e.g., T1) |
| Status | NVARCHAR(50) | `'Active'`, `'Inactive'`, `'Occupied'` |

---

### 2️⃣ `Dish`
Menu items (linked to categories and kitchens)

| Column | Type | Description |
|--------|------|-------------|
| ItemID | INT | Primary key |
| DishName | NVARCHAR(100) | Item name |
| Category | NCHAR(150) | Main category (e.g., Drinks, Meals) |
| Kitchen | NCHAR(150) | Origin kitchen or bar |
| Rate | DECIMAL(18,2) | Price per unit |

---

### 3️⃣ `KOTGeneration`
Order header (ticket)

| Column | Type | Description |
|--------|------|-------------|
| TicketID | INT | Primary key |
| TableNo | NVARCHAR(50) | Linked table number |
| BillDate | DATETIME | Order creation or confirmation date |
| Status | NVARCHAR(50) | `'Pending'`, `'Confirmed'` |

---

### 4️⃣ `KOTGenerationItems`
Order item details (line items)

| Column | Type | Description |
|--------|------|-------------|
| Ticket_ID | INT | Foreign key to `KOTGeneration` |
| Item_ID | INT | Linked item from `Dish` |
| Qty | DECIMAL(10,2) | Quantity ordered |
| Rate | DECIMAL(10,2) | Unit price |
| Amount | DECIMAL(10,2) | Total line amount |

---

### 5️⃣ `Users`
System users with roles (used for login/auth)

| Column | Type | Description |
|--------|------|-------------|
| UserID | INT | Primary key |
| Username | NVARCHAR(50) | Login name |
| PasswordHash | NVARCHAR(255) | Hashed password |
| Role | NVARCHAR(20) | `'Captain'` or `'Cashier'` |

---

## 🔑 Authentication & Roles

| Role | Permissions |
|------|--------------|
| **Captain** | Create orders, edit before confirmation, view tables, delete own pending orders |
| **Cashier** | Confirm or delete orders, view all, update table statuses manually |
| **Admin (optional)** | Can manage tables & monitor everything |



## 🧠 API Endpoints Overview

🧾 Auth Routes
Method	Endpoint	Description
POST	/auth/login	Login and receive JWT
🍽️ Menu Routes
Method	Endpoint	Description
GET	/menu/categories	Get all main categories
GET	/menu/items/:category	Get items belonging to a category

🪑 Tables Routes
Method	Endpoint	Description
GET	/tables	Get all tables with statuses
GET	/tables/:tableNo	Get a single table info
POST	/tables	Add new table (Admin/Cashier)
PUT	/tables/:tableNo/status	Update table status (Admin/Cashier)
DELETE	/tables/:tableNo	Delete a table if no active orders exist

Table Status Logic:

Inactive → Not used

Active → Ready for use / Opened

Occupied → Has confirmed order(s)

📦 Orders Routes
Method	Endpoint	Description
GET	/orders	Get all orders (grouped with items)
GET	/orders/:ticketID	Get detailed info for a specific order
POST	/orders	Create new order (Captain)
PUT	/orders/:ticketID	Edit pending order (Captain)
PUT	/orders/:ticketID/confirm	Confirm order (Cashier)
DELETE	/orders/:ticketID	Delete order (Captain/Cashier)

Automatic Behaviors:

Creating an order on an inactive table → activates it.

Confirming an order → marks table as Occupied.

Deleting last order on a table → marks it Inactive.


## 🧰 Developer Utilities
Seed default users

Run once to create initial Captain & Cashier:

node seedUsers.js

Reset or re-hash passwords
node resetUsers.js
node hashPassword.js

## 🧪 Testing with Postman

Import your Postman Collection or create manually.

Set variable:

base_url = http://localhost:3000


Login → copy token → add to header:

Authorization: Bearer {{token}}


Test routes in order:

/auth/login

/tables

/menu/categories

/orders

🔒 Data Safety

.env is excluded via .gitignore

Passwords stored using bcrypt

Tokens expire in 8 hours

SQL queries use parameters to prevent injection

🧱 Future Enhancements

Adding WebSocket for live table updates

Adding caching layer (Redis)

Support for multiple kitchens per item

Multi-branch database support

👨‍💻 Developed By

Ali Romia — Backend Developer
API designed and implemented for integration with Restaurant Android App & Desktop POS System.

🟢 Status

✅ Fully functional (tested end-to-end)
✅ Integrated with Android app
✅ Ready for deployment to Domain or Docker environment

