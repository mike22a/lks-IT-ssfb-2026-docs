# Training Roadmap

## Digital Library Training Kit

---

## Purpose

Menyediakan roadmap terstruktur untuk pelatihan Digital Library dari awal hingga selesai.

---

## Scope

Dokumen ini mencakup:

- Rencana sesi pelatihan
- Tujuan setiap sesi
- Output yang diharapkan
- Persiapan yang diperlukan
- Evaluasi
- Homework per sesi

---

## Learning Objectives

Setelah membaca dokumen ini, siswa dapat:

- Memahami urutan pelatihan yang akan diikuti
- Mengetahui tujuan setiap sesi
- Memahami output yang diharapkan
- Mempersiapkan diri untuk setiap sesi
- Mengetahui kriteria evaluasi

---

## Prerequisites

- Sudah membaca semua dokumentasi di folder docs/
- Software development environment sudah siap

---

## Business Rules

- Sesi harus diikuti secara berurutan
- Homework harus selesai sebelum sesi berikutnya
- Mentor akan mengevaluasi output setiap sesi
- Siswa harus aktif bertanya jika ada yang tidak dipahami

---

## Design / Main Content

### Overview Training

**Total Sesi:** 5 sesi
**Durasi per Sesi:** 2 jam
**Total Waktu:** 10 jam

**Distribusi Materi:**
- Sesi 1: Setup & Database (20%)
- Sesi 2: API Development (40%)
- Sesi 3: API Development Lanjutan (20%)
- Sesi 4: WinForms Desktop (10%)
- Sesi 5: Android Mobile (10%)

---

### Sesi 1: Setup & Database

**Durasi:** 2 jam
**Fokus:** Project setup dan database implementation

**Tujuan:**
- Setup project structure
- Implement database schema
- Generate seed data
- Test database queries

**Materi (120 menit):**

**Teori (20 menit):**
- Overview Clean Architecture
- Project structure
- Database design review

**Demo (30 menit):**
- Create solution dan projects
- Implement database schema
- Generate seed data

**Practice (60 menit):**
- Siswa setup project
- Siswa implement database
- Siswa generate seed data
- Siswa test queries

**Review (10 menit):**
- Review hasil practice
- Feedback dan Q&A

**Output yang Diharapkan:**
- Solution file terbuat
- 4 projects terbuat (Domain, Application, Infrastructure, API)
- Database script terbuat dan dijalankan
- Seed data terbuat
- Sample queries terbuat

**Persiapan:**
- Visual Studio terinstall
- SQL Server terinstall
- SSMS terinstall

**Evaluasi:**
- Project structure benar
- Database script berjalan tanpa error
- Seed data valid
- Queries mengembalikan hasil yang expected

**Homework:**
- Review project structure
- Practice SQL queries tambahan
- Baca dokumentasi EF Core

---

### Sesi 2: API Development - Part 1

**Durasi:** 2 jam
**Fokus:** API foundation dan CRUD Categories

**Tujuan:**
- Setup Entity Framework Core
- Create domain entities
- Implement repository pattern
- Implement Category CRUD API

**Materi (120 menit):**

**Teori (20 menit):**
- Entity Framework Core overview
- Repository pattern
- Dependency Injection

**Demo (30 menit):**
- Setup EF Core
- Create entities
- Implement repository
- Implement Category API

**Practice (60 menit):**
- Siswa setup EF Core
- Siswa create entities
- Siswa implement repository
- Siswa implement Category API

**Review (10 menit):**
- Review hasil practice
- Feedback dan Q&A

**Output yang Diharapkan:**
- DbContext terbuat
- Semua entities terbuat
- Generic repository terbuat
- Category API endpoints berfungsi
- API bisa di-test dengan Postman/Swagger

**Persiapan:**
- Selesai Sesi 1
- EF Core packages terinstall

**Evaluasi:**
- DbContext benar
- Entities sesuai database schema
- Repository pattern benar
- Category API CRUD berfungsi
- Status code benar

**Homework:**
- Implement Book entities
- Implement Book repository
- Implement Book API CRUD

---

### Sesi 3: API Development - Part 2

**Durasi:** 2 jam
**Fokus:** API lanjutan (Books dan Borrowings)

**Tujuan:**
- Implement Book CRUD API
- Implement Borrowing API dengan business logic
- Implement DTOs dan AutoMapper
- Implement services

**Materi (120 menit):**

**Teori (20 menit):**
- DTOs dan AutoMapper
- Service layer
- Business logic implementation

**Demo (30 menit):**
- Create DTOs
- Implement services
- Implement Book API
- Implement Borrowing API

**Practice (60 menit):**
- Siswa create DTOs
- Siswa implement services
- Siswa implement Book API
- Siswa implement Borrowing API

**Review (10 menit):**
- Review hasil practice
- Feedback dan Q&A

**Output yang Diharapkan:**
- Semua DTOs terbuat
- Services terbuat dengan business logic
- Book API berfungsi
- Borrowing API berfungsi dengan business rules
- AutoMapper terkonfigurasi

**Persiapan:**
- Selesai Sesi 2
- Homework Sesi 2 selesai

**Evaluasi:**
- DTOs benar dan valid
- Services mengandung business logic
- Book API berfungsi
- Borrowing API dengan business rules (max 3 books, stock check)
- AutoMapper berfungsi

**Homework:**
- Test semua API endpoints
- Implement error handling
- Implement logging

---

### Sesi 4: WinForms Desktop

**Durasi:** 2 jam
**Fokus:** Desktop application dengan WinForms

**Tujuan:**
- Setup WinForms project
- Create main form dengan navigation
- Implement Category management form
- Implement Book management form

**Materi (120 menit):**

**Teori (20 menit):**
- WinForms overview
- Controls common
- HttpClient untuk consume API

**Demo (30 menit):**
- Setup WinForms project
- Create main form
- Implement Category form
- Consume API dari WinForms

**Practice (60 menit):**
- Siswa setup WinForms project
- Siswa create main form
- Siswa implement Category form
- Siswa implement Book form

**Review (10 menit):**
- Review hasil practice
- Feedback dan Q&A

**Output yang Diharapkan:**
- WinForms project terbuat
- Main form dengan navigation berfungsi
- Category form CRUD berfungsi
- Book form CRUD berfungsi
- API consumption berfungsi

**Persiapan:**
- Selesai Sesi 3
- API sudah berjalan

**Evaluasi:**
- WinForms project setup benar
- Main form navigation berfungsi
- Category form CRUD berfungsi
- Book form CRUD berfungsi
- Error handling ada

**Homework:**
- Implement Borrowing form
- Implement search/filter
- Implement validation

---

### Sesi 5: Android Mobile

**Durasi:** 2 jam
**Fokus:** Mobile application dengan Android

**Tujuan:**
- Setup Android project
- Implement API service dengan Retrofit
- Implement Book list activity
- Implement Book detail activity

**Materi (120 menit):**

**Teori (20 menit):**
- Android architecture overview
- Retrofit overview
- RecyclerView overview

**Demo (30 menit):**
- Setup Android project
- Implement Retrofit service
- Implement Book list dengan RecyclerView
- Implement Book detail activity

**Practice (60 menit):**
- Siswa setup Android project
- Siswa implement Retrofit
- Siswa implement Book list
- Siswa implement Book detail

**Review (10 menit):**
- Review hasil practice
- Feedback dan Q&A
- Final project review

**Output yang Diharapkan:**
- Android project terbuat
- Retrofit service terbuat
- Book list activity berfungsi
- Book detail activity berfungsi
- API consumption berfungsi

**Persiapan:**
- Selesai Sesi 4
- Android Studio terinstall
- API berjalan (accessible dari emulator)

**Evaluasi:**
- Android project setup benar
- Retrofit terkonfigurasi
- Book list berfungsi
- Book detail berfungsi
- Error handling ada

**Homework:**
- Implement Borrowing history activity
- Implement search functionality
- Final testing dan bug fixing

---

### Evaluasi Akhir

**Kriteria Penilaian:**

1. **Database (20%)**
   - Schema design benar
   - Script berjalan tanpa error
   - Seed data valid

2. **API (40%)**
   - Clean Architecture diterapkan
   - Semua endpoint berfungsi
   - Business rules diterapkan
   - Error handling ada

3. **Desktop (20%)**
   - UI user-friendly
   - CRUD berfungsi
   - API consumption benar
   - Validation ada

4. **Mobile (20%)**
   - UI modern
   - API consumption benar
   - RecyclerView berfungsi
   - Error handling ada

**Penilaian:**
- A: 90-100 (Excellent)
- B: 80-89 (Good)
- C: 70-79 (Satisfactory)
- D: 60-69 (Needs Improvement)
- E: <60 (Fail)

---

## Implementation Notes

- Setiap sesi dimulai dengan review homework sesi sebelumnya
- Mentor akan demo konsep sebelum siswa practice
- Siswa harus aktif bertanya
- Mentor akan review hasil practice di akhir sesi
- Homework harus selesai sebelum sesi berikutnya

---

## Common Mistakes

- Skip homework dan langsung ke sesi berikutnya
- Tidak bertanya saat tidak paham
- Tidak review hasil practice
- Tidak test API setelah implement
- Tidak handle error

---

## Exercises

1. Buat timeline pribadi untuk menyelesaikan training
2. Identifikasi area yang perlu diperhatikan khusus
3. Siapkan environment development sebelum sesi 1
4. Review dokumentasi EF Core sebelum sesi 2
5. Review dokumentasi Retrofit sebelum sesi 5

---

## Homework

**Homework Sesi 1:**
- Practice SQL queries tambahan
- Baca dokumentasi EF Core

**Homework Sesi 2:**
- Implement Book entities
- Implement Book repository
- Implement Book API CRUD

**Homework Sesi 3:**
- Test semua API endpoints
- Implement error handling
- Implement logging

**Homework Sesi 4:**
- Implement Borrowing form
- Implement search/filter
- Implement validation

**Homework Sesi 5:**
- Implement Borrowing history activity
- Implement search functionality
- Final testing dan bug fixing

---

## References

- [.NET Documentation](https://docs.microsoft.com/en-us/dotnet/)
- [EF Core Documentation](https://docs.microsoft.com/en-us/ef/core/)
- [Android Documentation](https://developer.android.com/)

---

## Related Documents

- [10-homework.md](./10-homework.md) - Homework detail
- [../mentor/mentor_notes.md](../mentor/mentor_notes.md) - Notes untuk mentor
