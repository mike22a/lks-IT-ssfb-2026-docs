# Homework

## Digital Library Training Kit

---

## Purpose

Menyediakan tugas dan latihan untuk memperdalam pemahaman setelah setiap sesi.

---

## Scope

Dokumen ini mencakup:

- Homework 1-5 untuk setiap sesi
- Tingkat kesulitan
- Estimasi durasi
- Output yang diharapkan
- Kriteria evaluasi

---

## Learning Objectives

Setelah menyelesaikan homework, siswa dapat:

- Menguasai materi yang dipelajari di sesi
- Menerapkan konsep secara mandiri
- Mengidentifikasi area yang perlu diperbaiki
- Mempersiapkan diri untuk sesi berikutnya

---

## Prerequisites

- Selesai mengikuti sesi terkait
- Memahami materi sesi terkait

---

## Business Rules

- Homework harus selesai sebelum sesi berikutnya
- Siswa harus mengerjakan secara mandiri
- Hasil homework akan direview di sesi berikutnya
- Siswa boleh bertanya jika stuck

---

## Design / Main Content

### Homework 1: Database & Setup

**Sesi Terkait:** Sesi 1
**Tingkat Kesulitan:** Mudah
**Estimasi Durasi:** 2-3 jam

**Tugas:**

1. **Practice SQL Queries (60 menit)**
   - Tulis query untuk mendapatkan semua buku dengan stok > 10
   - Tulis query untuk mendapatkan user yang memiliki > 2 peminjaman aktif
   - Tulis query untuk mendapatkan buku yang paling sering dipinjam
   - Tulis query untuk mendapatkan kategori dengan buku terbanyak

2. **Review EF Core Documentation (30 menit)**
   - Baca EF Core Getting Started
   - Baca EF Core Modeling
   - Catat konsep yang penting

3. **Practice Database Design (30 menit)**
   - Review database schema
   - Identifikasi jika ada yang bisa diimprove
   - Tulis improvement yang disarankan

4. **Test Database Script (30 menit)**
   - Jalankan script di database baru
   - Pastikan tidak ada error
   - Verifikasi seed data

**Output yang Diharapkan:**
- File SQL dengan queries tambahan
- Catatan dari dokumentasi EF Core
- Dokumen improvement database schema
- Screenshot hasil test database

**Kriteria Evaluasi:**
- Queries benar dan mengembalikan hasil yang expected
- Catatan EF Core relevan
- Improvement database masuk akal
- Database script berjalan tanpa error

---

### Homework 2: API Foundation

**Sesi Terkait:** Sesi 2
**Tingkat Kesulitan:** Sedang
**Estimasi Durasi:** 3-4 jam

**Tugas:**

1. **Implement Book Entities (45 menit)**
   - Buat Book entity di Domain layer
   - Tambahkan validation attributes
   - Pastikan sesuai database schema

2. **Implement Book Repository (45 menit)**
   - Buat IBookRepository interface
   - Implement BookRepository
   - Tambahkan method GetByCategoryAsync
   - Tambahkan method SearchAsync

3. **Implement Book API (60 menit)**
   - Buat BooksController
   - Implement GET /api/books
   - Implement GET /api/books/{id}
   - Implement POST /api/books
   - Implement PUT /api/books/{id}
   - Implement DELETE /api/books/{id}
   - Implement GET /api/books/bycategory/{categoryId}

4. **Test API (30 menit)**
   - Test semua endpoint dengan Postman
   - Verifikasi status code
   - Verifikasi response body

**Output yang Diharapkan:**
- Book entity class
- IBookRepository dan BookRepository
- BooksController dengan semua endpoint
- Screenshot test Postman

**Kriteria Evaluasi:**
- Book entity sesuai schema
- Repository pattern benar
- Semua endpoint berfungsi
- Status code benar (200, 201, 204, 404)
- Response body valid

---

### Homework 3: API Lanjutan

**Sesi Terkait:** Sesi 3
**Tingkat Kesulitan:** Sedang
**Estimasi Durasi:** 4-5 jam

**Tugas:**

1. **Create DTOs (60 menit)**
   - Buat DTOs untuk User (Create, Update, Response)
   - Buat DTOs untuk Borrowing (Create, Response)
   - Buat DTOs untuk BorrowingDetail
   - Tambahkan validation attributes

2. **Implement Services (90 menit)**
   - Implement UserService dengan CRUD
   - Implement BorrowingService dengan business logic
   - Implement business rule: max 3 books per borrowing
   - Implement business rule: stock check
   - Implement business rule: category cannot be deleted if used

3. **Configure AutoMapper (30 menit)**
   - Install AutoMapper
   - Create mapping profiles
   - Configure DI

4. **Implement User API (45 menit)**
   - Buat UsersController
   - Implement semua CRUD endpoints

5. **Implement Borrowing API (60 menit)**
   - Buat BorrowingsController
   - Implement POST /api/borrowings (dengan details)
   - Implement PUT /api/borrowings/{id}/return
   - Implement GET /api/borrowings/byuser/{userId}

6. **Error Handling (30 menit)**
   - Implement global exception handler
   - Buat custom exception classes
   - Return error response yang konsisten

7. **Logging (30 menit)**
   - Setup logging (Serilog atau built-in)
   - Log important operations
   - Log errors

**Output yang Diharapkan:**
- Semua DTO classes
- Semua service implementations
- AutoMapper configuration
- UsersController dan BorrowingsController
- Global exception handler
- Logging configuration

**Kriteria Evaluasi:**
- DTOs valid dan terpisah dari entity
- Services mengandung business logic
- AutoMapper berfungsi
- User API berfungsi
- Borrowing API dengan business rules berfungsi
- Error handling konsisten
- Logging berfungsi

---

### Homework 4: WinForms Desktop

**Sesi Terkait:** Sesi 4
**Tingkat Kesulitan:** Sedang
**Estimasi Durasi:** 3-4 jam

**Tugas:**

1. **Implement Borrowing Form (60 menit)**
   - Buat BorrowingForm
   - Implement user selection (ComboBox)
   - Implement book selection (CheckedListBox)
   - Implement borrow button
   - Implement return button
   - Validasi max 3 books

2. **Implement Search/Filter (45 menit)**
   - Tambahkan search textbox di BookForm
   - Implement search by title
   - Implement filter by category
   - Update DataGridView hasil search/filter

3. **Implement Validation (45 menit)**
   - Validasi semua input di CategoryForm
   - Validasi semua input di BookForm
   - Validasi semua input di BorrowingForm
   - Tampilkan error message yang jelas

4. **Error Handling (30 menit)**
   - Handle network error
   - Handle API error
   - Tampilkan error message user-friendly
   - Log error untuk debugging

5. **UI Polish (30 menit)**
   - Improve layout
   - Add icons (opsional)
   - Add tooltips (opsional)
   - Improve UX

**Output yang Diharapkan:**
- BorrowingForm dengan semua fitur
- Search/filter berfungsi
- Validation berfungsi
- Error handling berfungsi
- UI yang lebih baik

**Kriteria Evaluasi:**
- Borrowing form berfungsi
- Search/filter berfungsi
- Validation mencegah invalid input
- Error handling user-friendly
- UI rapi dan intuitive

---

### Homework 5: Android Mobile

**Sesi Terkait:** Sesi 5
**Tingkat Kesulitan:** Sedang
**Estimasi Durasi:** 3-4 jam

**Tugas:**

1. **Implement Borrowing History Activity (60 menit)**
   - Buat BorrowingHistoryActivity
   - Buat BorrowingAdapter untuk RecyclerView
   - Load borrowing history dari API
   - Display status (Dipinjam/Dikembalikan)

2. **Implement Search Functionality (45 menit)**
   - Tambahkan search bar di BookListActivity
   - Implement search by title
   - Update RecyclerView hasil search
   - Handle empty result

3. **Error Handling (30 menit)**
   - Handle network error
   - Handle API error
   - Tampilkan error message (Toast/Snackbar)
   - Implement retry mechanism

4. **Loading Indicator (30 menit)**
   - Tampilkan ProgressBar saat loading
   - Sembunyikan ProgressBar setelah selesai
   - Handle loading state

5. **UI Polish (45 menit)**
   - Improve item layout dengan CardView
   - Add icons (opsional)
   - Add animations (opsional)
   - Improve UX

6. **Final Testing (30 menit)**
   - Test semua activity
   - Test dengan data real
   - Fix bugs jika ada
   - Performance check

**Output yang Diharapkan:**
- BorrowingHistoryActivity berfungsi
- Search berfungsi
- Error handling berfungsi
- Loading indicator berfungsi
- UI yang lebih baik
- Aplikasi bug-free

**Kriteria Evaluasi:**
- Borrowing history berfungsi
- Search berfungsi
- Error handling user-friendly
- Loading indicator smooth
- UI modern dan rapi
- Tidak ada critical bugs

---

## Implementation Notes

- Kerjakan homework secara mandiri
- Jangan copy-paste dari demo mentor
- Tanyakan jika stuck di suatu bagian
- Test setiap fitur yang diimplementasikan
- Document jika ada masalah yang ditemukan

---

## Common Mistakes

- Tidak mengerjakan homework
- Copy-paste dari demo tanpa memahami
- Tidak test hasil implementasi
- Tidak handle error
- Tidak validasi input

---

## Exercises

1. Buat checklist untuk setiap homework
2. Estimasi waktu untuk setiap task
3. Track progress homework
4. Catat kesulitan yang dihadapi
5. Catat solusi untuk kesulitan

---

## References

- [EF Core Documentation](https://docs.microsoft.com/en-us/ef/core/)
- [ASP.NET Core Documentation](https://docs.microsoft.com/en-us/aspnet/core/)
- [WinForms Documentation](https://docs.microsoft.com/en-us/dotnet/desktop/winforms/)
- [Android Documentation](https://developer.android.com/)

---

## Related Documents

- [09-training-roadmap.md](./09-training-roadmap.md) - Training roadmap
- [../student/learning_checklist.md](../student/learning_checklist.md) - Learning checklist
