# Mock Exam 02 - Mobile Android Full Integration

## Informasi
- **Fokus**: Mobile Android dengan API Integration
- **Durasi**: 3 jam (simulasi kompetisi)
- **Waktu**: Setelah Sesi 5 (Persiapan Mandiri / Latihan Tambahan Mandiri)
- **Tujuan**: Simulasi Modul A & C (Mobile Android) dengan API integration berbasis Clean Architecture

## Scenario

Anda diminta untuk membuat aplikasi mobile Android untuk **Order Management System** dengan spesifikasi berikut:

### Entities
1. **Customer**
   - CustomerID (int)
   - CustomerName (string)
   - Email (string)
   - Phone (string)
   - Address (string)

2. **Order**
   - OrderID (int)
   - CustomerID (int)
   - OrderDate (datetime)
   - TotalAmount (decimal)
   - Status (string: "Pending", "Completed", "Cancelled")

3. **OrderItem**
   - OrderItemID (int)
   - OrderID (int)
   - ProductName (string)
   - Quantity (int)
   - UnitPrice (decimal)
   - Subtotal (decimal)

## Requirements

### API Setup (30 menit)
- Gunakan API Clean Architecture yang sudah dibuat di sesi 1-3 (atau buat baru dari awal)
- Referensi: `training-plan/dotnet-api-example/01-BookstoreApi-GUIDE.md`
- Pastikan semua endpoints berfungsi:
  - GET /api/customers
  - POST /api/customers
  - GET /api/orders
  - POST /api/orders
  - PUT /api/orders/{id}
  - DELETE /api/orders/{id}

### Mobile Android (2.5 jam)

#### 1. Project Setup (15 menit)
- Create new Compose project
- Setup Retrofit dependencies
- Create data models (Customer, Order, OrderItem)
- Create API interface

#### 2. Customer List Screen (30 menit)
- LazyColumn untuk display customers
- Search bar untuk filter customers
- FAB (Floating Action Button) untuk add customer
- Implementasi state management
- Load data dari API

#### 3. Customer Form Screen (30 menit)
- Form input untuk customer:
  - CustomerName (TextField, wajib)
  - Email (TextField, wajib, valid format)
  - Phone (TextField, opsional)
  - Address (TextField, opsional)
- Implementasi validation:
  - CustomerName tidak boleh kosong
  - Email format valid
  - Display error messages
- Save button untuk POST ke API
- Navigate back setelah save

#### 4. Order List Screen (30 menit)
- LazyColumn untuk display orders
- Filter by status (All, Pending, Completed, Cancelled)
- Search bar untuk search orders
- FAB untuk add new order
- Implementasi state management
- Load data dari API

#### 5. Order Form Screen (30 menit)
- Form input untuk order:
  - Customer (Dropdown, dari API)
  - OrderDate (DatePicker, default today)
  - Status (Dropdown: Pending, Completed, Cancelled)
  - Order items list (add multiple items)
- Untuk setiap item:
  - ProductName (TextField)
  - Quantity (TextField, numeric)
  - UnitPrice (TextField, numeric)
- Implementasi validation:
  - Customer wajib dipilih
  - Minimal 1 item
  - Quantity > 0
  - UnitPrice > 0
- Calculate total amount automatically
- Save button untuk POST ke API
- Navigate back setelah save

#### 6. Search dan Filter (15 menit)
- Implementasi search untuk customers dan orders
- Implementasi filter untuk orders by status
- Debouncing untuk search input
- Update UI secara real-time

#### 7. Data Export (15 menit)
- Export customers ke CSV
- Export orders ke CSV
- Implementasi file permissions
- Add export button di respective screens
- Test export functionality

## Evaluation Criteria

### Project Setup (10%)
- [ ] Project structure proper
- [ ] Dependencies terinstal
- [ ] Data models correct
- [ ] API interface defined

### Customer Management (25%)
- [ ] Customer list berfungsi
- [ ] Customer form berfungsi
- [ ] Validation proper
- [ ] API integration successful
- [ ] Search berfungsi

### Order Management (35%)
- [ ] Order list berfungsi
- [ ] Order form berfungsi
- [ ] Order items management berfungsi
- [ ] Validation proper
- [ ] API integration successful
- [ ] Filter berfungsi

### Search & Filter (15%)
- [ ] Search berfungsi untuk customers
- [ ] Search berfungsi untuk orders
- [ ] Filter berfungsi untuk orders
- [ ] Debouncing implemented
- [ ] Real-time UI updates

### Data Export (15%)
- [ ] CSV export berfungsi untuk customers
- [ ] CSV export berfungsi untuk orders
- [ ] File permissions handled
- [ ] Export UI proper

## Time Management

### Suggested Timeline
- **0:00 - 0:30**: API setup dan verification
- **0:30 - 0:45**: Project setup
- **0:45 - 1:15**: Customer list screen
- **1:15 - 1:45**: Customer form screen
- **1:45 - 2:15**: Order list screen
- **2:15 - 2:45**: Order form screen
- **2:45 - 3:00**: Search, filter, dan export

## Notes

- Gunakan API Clean Architecture yang sudah dibuat di sesi 1-3
- Pastikan API sudah running sebelum mulai Android development
- Fokus pada Compose untuk UI
- Gunakan coroutines untuk async operations
- Implementasi proper error handling
- State management dengan ViewModel
- Format tanggal: YYYY-MM-DD
- Validation tidak boleh diabaikan

## Deliverables

- [ ] Android project dengan semua screens
- [ ] API integration berfungsi
- [ ] Search dan filter berfungsi
- [ ] Data export berfungsi
- [ ] Screenshot semua screens
- [ ] Test results

---

**Mock Exam**: 2 dari 2  
**Durasi**: 3 jam  
**Fokus**: Mobile Android Full Integration
