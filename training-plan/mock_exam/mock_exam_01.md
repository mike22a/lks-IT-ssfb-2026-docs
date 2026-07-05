# Mock Exam 01 - API .NET & Desktop Apps

## Informasi
- **Fokus**: API .NET dan Desktop Apps Integration
- **Durasi**: 3 jam (simulasi kompetisi)
- **Waktu**: Setelah Sesi 5
- **Tujuan**: Simulasi Modul B (Desktop Apps) dengan API integration

## Scenario

Anda diminta untuk membuat aplikasi desktop untuk manajemen **Inventory System** dengan spesifikasi berikut:

### Entities
1. **Product**
   - ProductID (int, PK)
   - ProductName (string)
   - Category (string)
   - UnitPrice (decimal)
   - StockQuantity (int)
   - CreatedAt (datetime)

2. **Category**
   - CategoryID (int, PK)
   - CategoryName (string)
   - Description (string)

3. **Transaction**
   - TransactionID (int, PK)
   - TransactionDate (datetime)
   - TransactionType (string: "IN" atau "OUT")
   - TotalAmount (decimal)
   - Notes (string)

## Requirements

### API .NET (1 jam)

#### 1. Database Setup (15 menit)
- Create database dengan 3 entities di atas
- Insert sample data (minimal 5 rekaman per table)
- Setup Entity Framework

#### 2. API Endpoints (45 menit)
Buat RESTful API dengan endpoints berikut:

**Product Endpoints:**
- GET /api/products - Get all products
- GET /api/products/{id} - Get product by ID
- POST /api/products - Create new product
- PUT /api/products/{id} - Update product
- DELETE /api/products/{id} - Delete product

**Category Endpoints:**
- GET /api/categories - Get all categories
- POST /api/categories - Create new category

**Transaction Endpoints:**
- GET /api/transactions - Get all transactions
- POST /api/transactions - Create new transaction
- GET /api/transactions/report - Get transaction report (aggregate)

#### 3. Requirements Tambahan
- Implementasi proper error handling
- Return appropriate status codes
- Implementasi business logic:
  - StockQuantity tidak boleh negatif
  - TransactionType harus "IN" atau "OUT"
  - Jika TransactionType "OUT", kurangi StockQuantity
  - Jika TransactionType "IN", tambahkan StockQuantity

### Desktop Apps (2 jam)

#### 1. Main Form (30 menit)
- Form dengan menu untuk:
  - Product Management
  - Category Management
  - Transaction Management
  - Reports
- Center form di layar

#### 2. Product Management Form (45 menit)
- DataGridView untuk display products
- Button: Add, Edit, Delete, Refresh
- Form input untuk Add/Edit:
  - ProductName (TextBox, wajib)
  - Category (ComboBox, dari API)
  - UnitPrice (TextBox, numeric)
  - StockQuantity (TextBox, numeric)
- Implementasi validation:
  - ProductName tidak boleh kosong
  - UnitPrice harus > 0
  - StockQuantity harus >= 0
- Integrasikan dengan API

#### 3. Transaction Management Form (30 menit)
- DataGridView untuk display transactions
- Button: Add New Transaction
- Form input untuk transaction:
  - TransactionDate (DateTimePicker, default today)
  - TransactionType (ComboBox: IN/OUT)
  - Product (ComboBox, dari API)
  - Quantity (TextBox, numeric)
  - Notes (TextBox, opsional)
- Implementasi business logic:
  - Validasi stock sebelum OUT transaction
  - Update stock quantity setelah transaction
- Integrasikan dengan API

#### 4. Report Form (15 menit)
- Chart untuk display:
  - Total transactions per type (Bar chart)
  - Stock per category (Pie chart)
- Load data dari API report endpoint
- Customize chart appearance

## Evaluation Criteria

### API .NET (33%)
- [ ] Database setup dengan proper schema
- [ ] Semua endpoints berfungsi
- [ ] Error handling proper
- [ ] Business logic benar
- [ ] Response format consistent

### Desktop Apps (67%)
- [ ] Main form dengan menu berfungsi
- [ ] Product management CRUD berfungsi
- [ ] Transaction management berfungsi
- [ ] Validation proper
- [ ] API integration successful
- [ ] Chart berfungsi dan menampilkan data
- [ ] Form centering
- [ ] User-friendly error messages

## Time Management

### Suggested Timeline
- **0:00 - 0:15**: Database setup
- **0:15 - 1:00**: API endpoints
- **1:00 - 1:30**: Main form
- **1:30 - 2:15**: Product management
- **2:15 - 2:45**: Transaction management
- **2:45 - 3:00**: Report form dan testing

## Notes

- Gunakan API yang sudah dibuat di sesi 1-2 sebagai reference
- Fokus pada integration antara API dan Desktop
- Validasi tidak boleh diabaikan
- Error handling harus proper
- Format tanggal: YYYY-MM-DD
- Form harus terpusat di layar

## Deliverables

- [ ] Database dengan sample data
- [ ] API project dengan semua endpoints
- [ ] Desktop project dengan semua forms
- [ ] Screenshot semua forms
- [ ] Test results

---

**Mock Exam**: 1 dari 2  
**Durasi**: 3 jam  
**Fokus**: API .NET & Desktop Apps Integration
