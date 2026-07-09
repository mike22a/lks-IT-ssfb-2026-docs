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

### API .NET — Clean Architecture (1 jam)

> ⚠️ **Wajib menggunakan Clean Architecture 4-layer**: Domain, Application, Infrastructure, API.
> Referensi: `training-plan/dotnet-api-example/01-BookstoreApi-GUIDE.md`

#### 1. Database Setup (15 menit)
- Create solution Clean Architecture (`dotnet new sln`, 4 projects, referensi antar project)
- Buat entities di Domain layer, AppDbContext di Infrastructure layer
- Migration & database dengan sample data (minimal 5 rekaman per tabel)
- Seed data menggunakan `HasData()` dengan nilai **statis** (bukan `DateTime.UtcNow`)

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
- `ApiResponse<T>` wrapper konsisten di **semua endpoint**
- `GlobalExceptionHandler` aktif (NotFoundException → 404, BusinessRuleException → 422)
- Business logic di **Service layer** (bukan di Controller)
- Business rules:
  - StockQuantity tidak boleh negatif (throw `BusinessRuleException` jika `Type=OUT` dan stok tidak cukup)
  - TransactionType harus "IN" atau "OUT" (throw `BusinessRuleException` jika tidak valid)
  - Jika `Type="OUT"`: kurangi StockQuantity dari Product
  - Jika `Type="IN"`: tambahkan StockQuantity ke Product

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

### API .NET — Clean Architecture (33%)
- [ ] Solution 4-layer terbuat dan `dotnet build` 0 error
- [ ] Semua endpoint CRUD berjalan (test via Swagger)
- [ ] `ApiResponse<T>` konsisten di semua response
- [ ] `GlobalExceptionHandler` aktif (404/409/422/500)
- [ ] Business rules benar (stok update, validasi TransactionType)
- [ ] Seed data tersedia (minimal 5 rekaman per tabel)

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
