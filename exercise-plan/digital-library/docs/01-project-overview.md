# Project Overview

## Digital Library Training Kit

---

## Purpose

Menjelaskan visi, tujuan, dan lingkup project Digital Library sebagai media pembelajaran Clean Architecture untuk persiapan LKS SSFB.

---

## Scope

Dokumen ini mencakup:

- Visi project
- Domain bisnis perpustakaan
- Tujuan project
- Lingkup fungsional
- Lingkup non-fungsional
- Overview arsitektur
- Technology stack
- Learning path

---

## Learning Objectives

Setelah membaca dokumen ini, siswa dapat:

- Memahami visi dan tujuan project Digital Library
- Mengidentifikasi domain bisnis perpustakaan
- Memahami lingkup fungsional dan non-fungsional
- Mengenali arsitektur yang digunakan
- Mengetahui technology stack yang digunakan
- Memahami learning path yang akan ditempuh

---

## Prerequisites

- Tidak ada prerequisite khusus untuk dokumen ini

---

## Business Rules

N/A

---

## Design / Main Content

### Visi Project

Project Digital Library bertujuan untuk:

- Memberikan contoh implementasi Clean Architecture yang nyata
- Melatih siswa dalam membangun aplikasi enterprise sederhana
- Mempersiapkan siswa untuk kompetisi LKS SSFB
- Mengajarkan best practice dalam software development

### Domain Bisnis

Digital Library adalah sistem manajemen perpustakaan yang mencakup:

- **Manajemen Buku**: Katalog, kategori, stok
- **Manajemen Anggota**: Data peminjam
- **Peminjaman**: Proses peminjaman buku
- **Pengembalian**: Proses pengembalian buku
- **Laporan**: Histori peminjaman dan statistik

### Tujuan Project

**Tujuan Utama:**
- Membangun aplikasi Digital Library end-to-end
- Menerapkan Clean Architecture dengan benar
- Mengintegrasikan API, Desktop, dan Mobile

**Tujuan Pembelajaran:**
- Memahami desain database relasional
- Menguasai REST API development
- Menerapkan Clean Architecture
- Menggunakan Entity Framework Core
- Membuat aplikasi desktop dan mobile

### Lingkup Fungsional

**Fitur yang akan dibangun:**

1. **Manajemen Kategori**
   - CRUD kategori buku
   - List kategori

2. **Manajemen Buku**
   - CRUD buku
   - Filter by kategori
   - Search buku
   - Manajemen stok

3. **Manajemen User**
   - CRUD user (anggota perpustakaan)
   - Validasi data anggota

4. **Peminjaman**
   - Create peminjaman dengan multiple buku
   - Validasi maksimal 3 buku per peminjaman
   - Cek ketersediaan stok
   - Update stok otomatis

5. **Pengembalian**
   - Process pengembalian
   - Update stok otomatis
   - Hitung denda (opsional)

6. **Reporting**
   - List peminjaman aktif
   - Histori peminjaman
   - Statistik per user

### Lingkup Non-Fungsional

**Kualitas yang dikejar:**

- **Performance**: API response < 500ms untuk operasi CRUD sederhana
- **Scalability**: Mendukung 100+ concurrent users
- **Maintainability**: Code yang mudah dibaca dan dimaintain
- **Testability**: Code yang mudah di-unit test
- **Security**: Basic validation dan error handling
- **Usability**: UI yang intuitif untuk desktop dan mobile

### Overview Arsitektur

Project menggunakan **Clean Architecture** dengan 4 layer:

```
┌─────────────────────────────────────┐
│   Presentation Layer                │
│   (API, WinForms, Android)          │
└─────────────────────────────────────┘
                ↓
┌─────────────────────────────────────┐
│   Application Layer                 │
│   (Services, DTOs, Interfaces)     │
└─────────────────────────────────────┘
                ↓
┌─────────────────────────────────────┐
│   Domain Layer                      │
│   (Entities)                        │
└─────────────────────────────────────┘
                ↑
┌─────────────────────────────────────┐
│   Infrastructure Layer               │
│   (EF Core, SQL Server)             │
└─────────────────────────────────────┘
```

**Dependency Rule:**
- Domain → tidak bergantung ke layer manapun
- Application → hanya bergantung ke Domain
- Infrastructure → bergantung ke Application dan Domain
- Presentation → hanya bergantung ke Application

### Technology Stack

**Backend:**
- .NET 8 SDK
- ASP.NET Core Web API
- Entity Framework Core 8
- SQL Server 2022
- AutoMapper

**Desktop:**
- Windows Forms (.NET 8)
- HttpClient
- DataGrid

**Mobile:**
- Android (Kotlin)
- Retrofit 2
- Gson
- RecyclerView

**Tools:**
- Visual Studio 2022 / VS Code
- SQL Server Management Studio
- Android Studio
- Git

### Learning Path

**Urutan pembelajaran yang disarankan:**

1. **Database Design** → Memahami struktur data
2. **ERD** → Memahami relasi antar data
3. **Clean Architecture** → Memahami arsitektur
4. **API Design** → Mendesain endpoint
5. **Database Implementation** → Implement SQL
6. **API Implementation** → Implement REST API
7. **WinForms Implementation** → Implement desktop
8. **Android Implementation** → Implement mobile

**Setiap langkah:**
- Baca dokumentasi
- Pahami konsep
- Selesaikan exercises
- Kerjakan homework
- Review dengan mentor

---

## Implementation Notes

- Fokus pada pemahaman konsep sebelum implementasi
- Jangan terburu-buru untuk coding
- Tanyakan jika ada yang tidak dipahami
- Documentation adalah sumber kebenaran tunggal

---

## Common Mistakes

- Skip dokumentasi dan langsung coding
- Tidak memahami arsitektur sebelum implementasi
- Over-engineering solusi sederhana
- Tidak mengikuti dependency rule
- Mengabaikan best practice

---

## Exercises

1. Jelaskan mengapa Clean Architecture penting untuk project enterprise
2. Identifikasi 3 fitur utama dari Digital Library
3. Gambar diagram arsitektur Clean Architecture
4. Jelaskan dependency rule dalam Clean Architecture
5. Sebutkan technology stack yang akan digunakan

---

## Homework

1. Install semua software yang dibutuhkan (Visual Studio, .NET 8, SQL Server, Android Studio)
2. Buat akun GitHub jika belum punya
3. Clone repository template (jika disediakan)
4. Baca dokumentasi resmi ASP.NET Core dan EF Core
5. Siapkan environment development

---

## References

- [Clean Architecture by Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Microsoft .NET Documentation](https://docs.microsoft.com/en-us/dotnet/)
- [Entity Framework Core Documentation](https://docs.microsoft.com/en-us/ef/core/)
- [ASP.NET Core Documentation](https://docs.microsoft.com/en-us/aspnet/core/)

---

## Related Documents

- [02-business-rules.md](./02-business-rules.md) - Aturan bisnis detail
- [03-database-design.md](./03-database-design.md) - Desain database
- [04-erd.md](./04-erd.md) - Diagram ERD
- [06-clean-architecture.md](./06-clean-architecture.md) - Clean Architecture detail
