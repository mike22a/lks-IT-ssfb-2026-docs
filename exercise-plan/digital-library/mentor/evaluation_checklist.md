# Evaluation Checklist

## Digital Library Training Kit

---

## Purpose

Menyediakan checklist untuk mengevaluasi hasil implementasi siswa.

---

## Scope

Dokumen ini mencakup:

- Checklist database
- Checklist API
- Checklist desktop (WinForms)
- Checklist mobile (Android)
- Checklist dokumentasi
- Kriteria penilaian

---

## Learning Objectives

Setelah menggunakan checklist ini, mentor dapat:

- Mengevaluasi implementasi database dengan sistematis
- Mengevaluasi implementasi API dengan sistematis
- Mengevaluasi implementasi desktop dengan sistematis
- Mengevaluasi implementasi mobile dengan sistematis
- Memberikan penilaian yang fair dan konsisten

---

## Prerequisites

- Mentor harus memahami seluruh teknologi yang digunakan
- Mentor harus membaca semua dokumentasi training kit

---

## Business Rules

- Evaluasi harus fair dan konsisten
- Beri feedback yang konstruktif
- Fokus ke pemahaman, bukan hanya code berfungsi

---

## Design / Main Content

### Database Checklist

**Schema Design:**
- [ ] Semua tabel terbuat sesuai dokumentasi
- [ ] Primary keys menggunakan IDENTITY
- [ ] Foreign keys terdefinisi dengan benar
- [ ] Indexes terbuat untuk kolom yang sering di-query
- [ ] Audit fields ada di setiap tabel
- [ ] Data types sesuai (NVARCHAR untuk text, INT untuk angka)
- [ ] Constraints (PK, FK, Unique, Check) terdefinisi

**Data Integrity:**
- [ ] Seed data valid dan konsisten
- [ ] Foreign key constraints terpenuhi
- [ ] Data realistis (bukan random acak)
- [ ] Normalization 3NF terpenuhi
- [ ] Tidak ada data duplikat yang tidak diinginkan

**Script Quality:**
- [ ] Script bisa dijalankan tanpa error
- [ ] Script menggunakan transaction untuk DDL berbahaya
- [ ] Script well-commented
- [ ] Script follow naming convention

**Testing:**
- [ ] Script di-test di SQL Server
- [ ] Seed data terverifikasi
- [ ] Sample queries berjalan dengan benar
- [ ] Performance query acceptable

### API Checklist

**Architecture:**
- [ ] Clean Architecture diterapkan dengan benar
- [ ] Layer terpisah dengan jelas (Domain, Application, Infrastructure, API)
- [ ] Dependency rule diikuti
- [ ] Dependency Injection terkonfigurasi
- [ ] Repository Pattern diterapkan

**Code Quality:**
- [ ] Code clean dan readable
- [ ] Naming convention konsisten
- [ ] Async/await digunakan untuk database operations
- [ ] Exception handling ada
- [ ] Logging ada
- [ ] Code comment untuk bagian kompleks

**Functionality:**
- [ ] Semua endpoint berfungsi
- [ ] CRUD operations berfungsi
- [ ] Status code benar (200, 201, 204, 404, 400, 500)
- [ ] Validation berfungsi
- [ ] Error response konsisten
- [ ] Business rules diterapkan (max 3 books, stock check)

**DTOs:**
- [ ] DTOs terpisah dari entity
- [ ] Validation attributes ada di DTO
- [ ] AutoMapper terkonfigurasi
- [ ] Mapping entity ke DTO berfungsi

**Testing:**
- [ ] API di-test dengan Postman/Swagger
- [ ] Semua endpoint di-test
- [ ] Error cases di-test
- [ ] Performance acceptable

### Desktop Checklist

**UI/UX:**
- [ ] UI user-friendly dan intuitive
- [ ] Layout rapi dan konsisten
- [ ] Controls sesuai kebutuhan
- [ ] Navigation berfungsi
- [ ] Error message jelas dan user-friendly

**Functionality:**
- [ ] CRUD operations berfungsi
- [ ] API consumption berfungsi
- [ ] Data display benar
- [ ] Search/filter berfungsi
- [ ] Validation berfungsi
- [ ] Error handling ada

**Code Quality:**
- [ ] Code clean dan readable
- [ ] Async/await digunakan untuk API calls
- [ ] Exception handling ada
- [ ] Loading indicator ada
- [ ] Button disable saat loading
- [ ] Code comment untuk bagian kompleks

**Testing:**
- [ ] Semua form di-test
- [ ] CRUD operations di-test
- [ ] Error cases di-test
- [ ] Performance acceptable

### Mobile Checklist

**UI/UX:**
- [ ] UI modern dan responsive
- [ ] Layout rapi dan konsisten
- [ ] RecyclerView berfungsi dengan smooth
- [ ] Navigation berfungsi
- [ ] Loading indicator ada
- [ ] Error message user-friendly

**Functionality:**
- [ ] API consumption berfungsi
- [ ] List display berfungsi
- [ ] Detail view berfungsi
- [ ] Search berfungsi
- [ ] Error handling ada
- [ ] Network error handling ada

**Code Quality:**
- [ ] MVVM diterapkan
- [ ] Repository Pattern diterapkan
- [ ] Coroutines digunakan untuk async operations
- [ ] LiveData/StateFlow digunakan
- [ ] Code clean dan readable
- [ ] Code comment untuk bagian kompleks

**Testing:**
- [ ] Semua activity di-test
- [ ] API consumption di-test
- [ ] Error cases di-test
- [ ] Performance acceptable
- [ ] Memory leak check

### Documentation Checklist

**Completeness:**
- [ ] Semua dokumen terbuat sesuai struktur
- [ ] Setiap dokumen mengikuti template
- [ ] Setiap dokumen memiliki semua section yang diperlukan
- [ ] Tidak ada dokumentasi yang duplikat

**Quality:**
- [ ] Dokumentasi jelas dan mudah dipahami
- [ ] Dokumentasi konsisten satu sama lain
- [ ] Dokumentasi up-to-date dengan implementasi
- [ ] Dokumentasi memiliki contoh yang relevan

**Cross-reference:**
- [ ] Related documents ter-referensi dengan benar
- [ ] Tidak ada kontradiksi antar dokumen
- [ ] Link antar dokumen berfungsi

### Kriteria Penilaian

**Skor Per Kategori:**

**Database (20%)**
- Excellent (18-20): Schema perfect, data valid, script clean
- Good (15-17): Minor issues, overall good
- Satisfactory (12-14): Some issues, functional
- Needs Improvement (10-11): Major issues, needs work
- Fail (0-9): Not functional

**API (40%)**
- Excellent (36-40): Clean architecture, all features work, code quality excellent
- Good (30-35): Minor issues, overall good
- Satisfactory (25-29): Some issues, functional
- Needs Improvement (20-24): Major issues, needs work
- Fail (0-19): Not functional

**Desktop (20%)**
- Excellent (18-20): UI excellent, all features work, code quality excellent
- Good (15-17): Minor issues, overall good
- Satisfactory (12-14): Some issues, functional
- Needs Improvement (10-11): Major issues, needs work
- Fail (0-9): Not functional

**Mobile (20%)**
- Excellent (18-20): UI modern, all features work, code quality excellent
- Good (15-17): Minor issues, overall good
- Satisfactory (12-14): Some issues, functional
- Needs Improvement (10-11): Major issues, needs work
- Fail (0-9): Not functional

**Total Score:**
- A: 90-100 (Excellent)
- B: 80-89 (Good)
- C: 70-79 (Satisfactory)
- D: 60-69 (Needs Improvement)
- E: <60 (Fail)

**Bonus Points:**
- +2: Exceptional code quality
- +2: Exceptional UI/UX
- +2: Extra features beyond requirements
- +2: Excellent documentation
- +2: Active participation in class

---

## Implementation Notes

- Gunakan checklist secara sistematis
- Beri feedback spesifik untuk setiap item
- Jangan terlalu strict, fokus ke pemahaman
- Beri kesempatan untuk perbaikan

---

## Common Mistakes

- Tidak menggunakan checklist secara konsisten
- Terlalu fokus ke minor detail
- Tidak memberikan feedback yang spesifik
- Tidak memberikan kesempatan untuk perbaikan

---

## Exercises

1. Gunakan checklist untuk evaluasi dummy project
2. Beri feedback untuk dummy project
3. Diskusikan kriteria penilaian dengan mentor lain
4. Adjust checklist sesuai kebutuhan

---

## Homework

1. Review checklist sebelum evaluasi
2. Siapkan feedback template
3. Practice evaluasi dengan dummy project
4. Document common issues yang ditemukan

---

## References

- [Code Review Checklist](https://github.com/lyft/coding-standards/blob/master/csharp/code-review-checklist.md)
- [API Review Checklist](https://github.com/microsoft/api-guidelines/blob/vNext/Guidelines.md)

---

## Related Documents

- [mentor_notes.md](./mentor_notes.md) - Notes untuk mentor
- [../../docs/09-training-roadmap.md](../docs/09-training-roadmap.md) - Training roadmap
