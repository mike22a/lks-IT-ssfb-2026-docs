# Implementation Plan

## Digital Library Training Kit

---

## Purpose

Menyediakan roadmap implementasi terstruktur untuk memandu pembangunan aplikasi Digital Library.

---

## Scope

Dokumen ini mencakup:

- Roadmap implementasi terurut
- Detail task dengan deliverables
- Acceptance criteria
- Pesan commit yang disarankan
- Estimasi waktu
- Dependencies

---

## Learning Objectives

Setelah membaca dokumen ini, siswa dapat:

- Memahami urutan implementasi
- Mengetahui deliverables setiap task
- Mengetahui acceptance criteria
- Mengikuti plan implementasi dengan benar

---

## Prerequisites

- Sudah membaca [project_constitution.md](./project_constitution.md)
- Sudah membaca [architecture_rules.md](./architecture_rules.md)

---

## Business Rules

- Task harus diikuti secara berurutan
- Setiap task harus selesai sebelum lanjut
- Acceptance criteria harus terpenuhi

---

## Design / Main Content

### Roadmap Implementasi

**Urutan Implementasi:**
1. Database
2. API
3. WinForms
4. Android

### Phase 1 - Setup Project

#### Task 1: Create Solution
- **Objective**: Membuat solution structure untuk Clean Architecture
- **Deliverables**: 
  - DigitalLibrary.sln
  - Folder structure untuk layers
- **Acceptance Criteria**:
  - Solution file terbuat
  - 4 project folders siap (Domain, Application, Infrastructure, Presentation)
- **Pesan Commit**: "feat: create solution structure for Clean Architecture"
- **Estimasi Waktu**: 15 menit
- **Dependencies**: Tidak ada

#### Task 2: Create Projects
- **Objective**: Membuat 4 project sesuai Clean Architecture
- **Deliverables**:
  - DigitalLibrary.Domain.csproj
  - DigitalLibrary.Application.csproj
  - DigitalLibrary.Infrastructure.csproj
  - DigitalLibrary.API.csproj
- **Acceptance Criteria**:
  - Semua project terbuat
  - Reference dependencies benar (Domain ← Application ← Infrastructure ← API)
- **Pesan Commit**: "feat: create 4 projects following Clean Architecture layers"
- **Estimasi Waktu**: 20 menit
- **Dependencies**: Task 1

### Phase 2 - Database

#### Task 3: Design Database Schema
- **Objective**: Mendesain tabel database untuk Digital Library
- **Deliverables**:
  - Dokumentasi desain tabel (Users, Categories, Books, Borrowings, BorrowingDetails)
  - ERD diagram
  - Relationship documentation
- **Acceptance Criteria**:
  - Semua tabel terdefinisi dengan kolom lengkap
  - Primary keys dan foreign keys jelas
  - Normalization 3NF terpenuhi
  - Audit fields (CreatedAt, UpdatedAt) ada di setiap tabel
- **Pesan Commit**: "docs: complete database schema design with ERD"
- **Estimasi Waktu**: 45 menit
- **Dependencies**: Task 2

#### Task 4: Create SQL Database Script
- **Objective**: Generate SQL script untuk membuat database
- **Deliverables**:
  - 01_create_database.sql
  - Database creation
  - Table creation dengan constraints
  - Index creation
- **Acceptance Criteria**:
  - Script bisa dijalankan tanpa error
  - Semua tabel terbuat
  - Constraints (PK, FK, Unique) berfungsi
  - Index terbuat untuk kolom yang sering di-query
- **Pesan Commit**: "feat: add SQL database creation script"
- **Estimasi Waktu**: 30 menit
- **Dependencies**: Task 3

#### Task 5: Generate Seed Data
- **Objective**: Generate data dummy untuk testing
- **Deliverables**:
  - 02_seed_data.sql
  - 10 Users
  - 10 Categories
  - 50 Books
  - 20 Borrowings
  - 60 BorrowingDetails
- **Acceptance Criteria**:
  - Data valid dan konsisten
  - Foreign key constraints terpenuhi
  - Data realistis (bukan random acak)
- **Pesan Commit**: "feat: add seed data for testing"
- **Estimasi Waktu**: 30 menit
- **Dependencies**: Task 4

### Phase 3 - API Development

#### Task 6: Setup Entity Framework Core
- **Objective**: Konfigurasi EF Core di Infrastructure layer
- **Deliverables**:
  - DbContext class
  - Connection string configuration
  - EF Core packages di Infrastructure
- **Acceptance Criteria**:
  - DbContext terbuat dengan semua DbSet
  - Connection string terkonfigurasi
  - Migration bisa dibuat
- **Pesan Commit**: "feat: setup Entity Framework Core with DbContext"
- **Estimasi Waktu**: 25 menit
- **Dependencies**: Task 5

#### Task 7: Create Domain Entities
- **Objective**: Buat entity classes di Domain layer
- **Deliverables**:
  - User.cs
  - Category.cs
  - Book.cs
  - Borrowing.cs
  - BorrowingDetail.cs
- **Acceptance Criteria**:
  - Semua entity terbuat
  - Properties sesuai database schema
  - Navigation properties ada
  - Validation attributes (DataAnnotations) ada
- **Pesan Commit**: "feat: create domain entities"
- **Estimasi Waktu**: 30 menit
- **Dependencies**: Task 6

#### Task 8: Create DTOs
- **Objective**: Buat DTO classes untuk request/response
- **Deliverables**:
  - DTOs untuk Create/Update/Response per entity
  - Mapping profiles (AutoMapper)
- **Acceptance Criteria**:
  - DTO terpisah dari entity
  - Validation attributes di DTO
  - Mapping configuration terbuat
- **Pesan Commit**: "feat: create DTOs and mapping profiles"
- **Estimasi Waktu**: 35 menit
- **Dependencies**: Task 7

#### Task 9: Implement Repository Pattern
- **Objective**: Buat generic repository dan specific repositories
- **Deliverables**:
  - IRepository<T> interface
  - Repository<T> implementation
  - Specific repositories (IBookRepository, IBorrowingRepository, dll)
- **Acceptance Criteria**:
  - Generic CRUD methods ada
  - Custom query methods ada
  - Async/await digunakan
- **Pesan Commit**: "feat: implement repository pattern"
- **Estimasi Waktu**: 40 menit
- **Dependencies**: Task 8

#### Task 10: Create Application Services
- **Objective**: Buat service layer untuk business logic
- **Deliverables**:
  - ICategoryService, CategoryService
  - IBookService, BookService
  - IBorrowingService, BorrowingService
- **Acceptance Criteria**:
  - Business logic di service layer
  - Validation ada
  - Error handling ada
  - Unit testable
- **Pesan Commit**: "feat: create application services with business logic"
- **Estimasi Waktu**: 60 menit
- **Dependencies**: Task 9

#### Task 11: Configure Dependency Injection
- **Objective**: Setup DI container di API project
- **Deliverables**:
  - Program.cs dengan service registration
  - Repository registration
  - Service registration
  - DbContext registration
- **Acceptance Criteria**:
  - Semua dependency terdaftar
  - Lifetime scope benar (Scoped/Transient)
  - Application bisa start tanpa error
- **Pesan Commit**: "feat: configure dependency injection"
- **Estimasi Waktu**: 20 menit
- **Dependencies**: Task 10

#### Task 12: Implement Category API
- **Objective**: Buat CRUD endpoints untuk Category
- **Deliverables**:
  - CategoriesController
  - GET /api/categories
  - GET /api/categories/{id}
  - POST /api/categories
  - PUT /api/categories/{id}
  - DELETE /api/categories/{id}
- **Acceptance Criteria**:
  - Semua endpoint berfungsi
  - Status code benar (200, 201, 204, 404)
  - Validation berfungsi
  - Error handling ada
- **Pesan Commit**: "feat: implement Category CRUD API endpoints"
- **Estimasi Waktu**: 45 menit
- **Dependencies**: Task 11

#### Task 13: Implement Book API
- **Objective**: Buat CRUD endpoints untuk Book
- **Deliverables**:
  - BooksController
  - GET /api/books
  - GET /api/books/{id}
  - POST /api/books
  - PUT /api/books/{id}
  - DELETE /api/books/{id}
  - GET /api/books/bycategory/{categoryId}
- **Acceptance Criteria**:
  - Semua endpoint berfungsi
  - Filter by category berfungsi
  - Validation berfungsi
  - Status code benar
- **Pesan Commit**: "feat: implement Book CRUD API endpoints"
- **Estimasi Waktu**: 50 menit
- **Dependencies**: Task 12

#### Task 14: Implement Borrowing API
- **Objective**: Buat endpoints untuk Borrowing (header + detail)
- **Deliverables**:
  - BorrowingsController
  - POST /api/borrowings (create borrowing with details)
  - GET /api/borrowings
  - GET /api/borrowings/{id}
  - PUT /api/borrowings/{id}/return
- **Acceptance Criteria**:
  - Borrowing dengan multiple details berfungsi
  - Business rule (max 3 books) diterapkan
  - Return process berfungsi
  - Stock update otomatis
- **Pesan Commit**: "feat: implement Borrowing API with business logic"
- **Estimasi Waktu**: 60 menit
- **Dependencies**: Task 13

### Phase 4 - WinForms Desktop

#### Task 15: Setup WinForms Project
- **Objective**: Buat WinForms project dan setup dependencies
- **Deliverables**:
  - DigitalLibrary.WinForms.csproj
  - Reference ke Application layer
  - HttpClient configuration
- **Acceptance Criteria**:
  - Project terbuat
  - Bisa reference Application layer
  - HttpClient terkonfigurasi
- **Pesan Commit**: "feat: setup WinForms project"
- **Estimasi Waktu**: 20 menit
- **Dependencies**: Task 14

#### Task 16: Create Main Form
- **Objective**: Buat form utama dengan navigation
- **Deliverables**:
  - MainForm.cs
  - Menu strip untuk navigation
  - Panel untuk content
- **Acceptance Criteria**:
  - Form tampil
  - Menu berfungsi
  - Navigation antar form jalan
- **Pesan Commit**: "feat: create main form with navigation"
- **Estimasi Waktu**: 30 menit
- **Dependencies**: Task 15

#### Task 17: Category Management Form
- **Objective**: Buat form CRUD Category
- **Deliverables**:
  - CategoryForm.cs
  - DataGridView untuk list
  - TextBox untuk input
  - Buttons (Add, Edit, Delete, Refresh)
- **Acceptance Criteria**:
  - Load data dari API
  - Add category berfungsi
  - Edit category berfungsi
  - Delete category berfungsi
  - Error handling ada
- **Pesan Commit**: "feat: implement Category management form"
- **Estimasi Waktu**: 45 menit
- **Dependencies**: Task 16

#### Task 18: Book Management Form
- **Objective**: Buat form CRUD Book
- **Deliverables**:
  - BookForm.cs
  - DataGridView dengan search/filter
  - ComboBox untuk Category
  - CRUD buttons
- **Acceptance Criteria**:
  - Load books dengan category
  - Search berfungsi
  - CRUD berfungsi
  - Validation ada
- **Pesan Commit**: "feat: implement Book management form"
- **Estimasi Waktu**: 50 menit
- **Dependencies**: Task 17

#### Task 19: Borrowing Form
- **Objective**: Buat form untuk Borrowing process
- **Deliverables**:
  - BorrowingForm.cs
  - User selection
  - Book selection dengan checkbox
  - Borrowing button
  - Return button
- **Acceptance Criteria**:
  - Bisa pilih user
  - Bisa pilih multiple books (max 3)
  - Borrowing berhasil
  - Return berhasil
  - Stock update terlihat
- **Pesan Commit**: "feat: implement Borrowing form"
- **Estimasi Waktu**: 60 menit
- **Dependencies**: Task 18

### Phase 5 - Android Application

#### Task 20: Setup Android Project
- **Objective**: Buat Android project dengan Kotlin
- **Deliverables**:
  - Android project structure
  - Gradle dependencies (Retrofit, Gson, RecyclerView)
  - Internet permission
- **Acceptance Criteria**:
  - Project terbuat
  - Dependencies terinstall
  - App bisa build
- **Pesan Commit**: "feat: setup Android project with dependencies"
- **Estimasi Waktu**: 25 menit
- **Dependencies**: Task 14

#### Task 21: Create API Service
- **Objective**: Buat Retrofit service untuk API calls
- **Deliverables**:
  - ApiService interface
  - Retrofit client
  - Data models (DTOs)
- **Acceptance Criteria**:
  - Retrofit terkonfigurasi
  - API service terbuat
  - Models sesuai API response
- **Pesan Commit**: "feat: create Retrofit API service"
- **Estimasi Waktu**: 30 menit
- **Dependencies**: Task 20

#### Task 22: Book List Activity
- **Objective**: Buat activity untuk menampilkan list books
- **Deliverables**:
  - BookListActivity
  - RecyclerView adapter
  - Book item layout
- **Acceptance Criteria**:
  - Load books dari API
  - Display di RecyclerView
  - Error handling ada
  - Loading indicator ada
- **Pesan Commit**: "feat: implement Book list activity"
- **Estimasi Waktu**: 45 menit
- **Dependencies**: Task 21

#### Task 23: Book Detail Activity
- **Objective**: Buat activity untuk detail book
- **Deliverables**:
  - BookDetailActivity
  - Detail layout
  - Navigation dari list
- **Acceptance Criteria**:
  - Tampilkan detail book
  - Back button berfungsi
  - Data tampil benar
- **Pesan Commit**: "feat: implement Book detail activity"
- **Estimasi Waktu**: 30 menit
- **Dependencies**: Task 22

#### Task 24: Borrowing History Activity
- **Objective**: Buat activity untuk melihat borrowing history
- **Deliverables**:
  - BorrowingHistoryActivity
  - RecyclerView adapter
  - History item layout
- **Acceptance Criteria**:
  - Load borrowing history
  - Display status (borrowed/returned)
  - Filter by user (jika login)
- **Pesan Commit**: "feat: implement Borrowing history activity"
- **Estimasi Waktu**: 40 menit
- **Dependencies**: Task 23

---

## Implementation Notes

- Follow task secara berurutan
- Jangan skip task
- Pastikan acceptance criteria terpenuhi
- Commit setiap task selesai

---

## Common Mistakes

- Skip task dan langsung ke task lanjutan
- Tidak test setelah implementasi
- Tidak commit setiap task
- Tidak follow acceptance criteria

---

## Exercises

1. Buat timeline pribadi untuk menyelesaikan semua task
2. Identifikasi task yang mungkin paling sulit
3. Siapkan resource untuk task yang sulit
4. Buat checklist untuk tracking progress

---

## Homework

1. Review implementation plan sebelum mulai
2. Buat personal timeline
3. Siapkan environment untuk setiap phase
4. Track progress setiap task

---

## References

- [../../docs/09-training-roadmap.md](../docs/09-training-roadmap.md) - Training roadmap
- [../../docs/10-homework.md](../docs/10-homework.md) - Homework detail

---

## Related Documents

- [project_constitution.md](./project_constitution.md) - Filosofi project
- [architecture_rules.md](./architecture_rules.md) - Aturan arsitektur
