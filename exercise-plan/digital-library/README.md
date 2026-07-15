# Training Kit Digital Library

## Persiapan LKS Software Solution for Business (SSFB)

Versi: 1.0

---

## Purpose

Training kit ini dirancang untuk mempersiapkan siswa SMK mengikuti kompetisi LKS Software Solution for Business dengan fokus pada pengembangan aplikasi Digital Library menggunakan Clean Architecture.

---

## Scope

Training kit mencakup:

- Desain database relasional dengan SQL Server
- REST API development dengan ASP.NET Core
- Clean Architecture implementation
- Desktop application dengan WinForms
- Mobile application dengan Android (Kotlin)
- Documentation-first development

---

## Learning Objectives

Setelah menyelesaikan training kit ini, siswa mampu:

- Mendesain database relasional yang baik
- Mengimplementasikan REST API dengan .NET
- Memahami dan menerapkan Clean Architecture
- Menggunakan Entity Framework Core
- Membuat aplikasi desktop dengan WinForms
- Consume API di aplikasi Android
- Memahami business rule dan validation
- Menulis dokumentasi teknis

---

## Prerequisites

Sebelum memulai, siswa harus memiliki:

- Pengetahuan dasar C#
- Pemahaman OOP dasar
- Pengetahuan SQL dasar
- Pengalaman CRUD sederhana
- **Belum pernah** membangun project Clean Architecture lengkap

Software yang dibutuhkan:

- Visual Studio 2022 atau VS Code
- .NET 8 SDK
- SQL Server 2022 Express atau Developer Edition
- Android Studio (untuk modul Android)
- Git

---

## Repository Structure

```
exercise-plan/digital-library/
├── README.md                    # File ini
├── docs/                        # Dokumentasi teknis
│   ├── 01-project-overview.md
│   ├── 02-business-rules.md
│   ├── 03-database-design.md
│   ├── 04-erd.md
│   ├── 05-api-design.md
│   ├── 06-clean-architecture.md
│   ├── 07-winforms-design.md
│   ├── 08-android-design.md
│   ├── 09-training-roadmap.md
│   └── 10-homework.md
├── database/                    # Script SQL
│   ├── 01_create_database.sql
│   ├── 02_seed_data.sql
│   └── 03_sample_queries.sql
├── mentor/                      # Dokumentasi untuk mentor
│   ├── mentor_notes.md
│   └── evaluation_checklist.md
├── student/                     # Dokumentasi untuk siswa
│   ├── learning_checklist.md
│   └── self_review.md
└── prompts/                     # Panduan untuk AI Agent
    ├── project_constitution.md
    ├── architecture_rules.md
    ├── implementation_plan.md
    └── review_checklist.md
```

---

## Technology Stack

### Backend
- **Framework**: ASP.NET Core 8
- **Language**: C# 12
- **ORM**: Entity Framework Core 8
- **Database**: SQL Server 2022
- **Architecture**: Clean Architecture

### Desktop
- **Framework**: Windows Forms (.NET 8)
- **Language**: C# 12
- **HTTP Client**: HttpClient

### Mobile
- **Framework**: Android (Kotlin)
- **Networking**: Retrofit 2
- **JSON**: Gson
- **UI**: RecyclerView

---

## Learning Roadmap

Training kit ini dirancang untuk dipelajari secara berurutan:

1. **Project Overview** - Memahami project secara keseluruhan
2. **Business Rules** - Memahami aturan bisnis dan workflow
3. **Database Design** - Mendesain struktur database
4. **ERD** - Memahami relasi antar entitas
5. **API Design** - Mendesain endpoint REST API
6. **Clean Architecture** - Memahami arsitektur dan layer
7. **WinForms Design** - Mendesain UI desktop
8. **Android Design** - Mendesain UI mobile
9. **Training Roadmap** - Rencana pelatihan terstruktur
10. **Homework** - Latihan dan tugas

---

## Estimasi Durasi

Total estimasi waktu untuk menyelesaikan seluruh training kit:

- **Reading & Understanding**: 8-10 jam
- **Database Implementation**: 2-3 jam
- **API Implementation**: 15-20 jam
- **WinForms Implementation**: 10-12 jam
- **Android Implementation**: 8-10 jam
- **Testing & Debugging**: 5-8 jam

**Total**: ~48-63 jam (6-8 hari kerja penuh)

---

## Cara Menggunakan Training Kit

### Untuk Mentor

1. Baca `mentor/mentor_notes.md` untuk persiapan mengajar
2. Gunakan `mentor/evaluation_checklist.md` untuk evaluasi
3. Ikuti roadmap di `docs/09-training-roadmap.md`

### Untuk Siswa

1. Baca `README.md` terlebih dahulu
2. Ikuti urutan dokumen di folder `docs/`
3. Selesaikan exercises di setiap dokumen
4. Kerjakan homework di `docs/10-homework.md`
5. Gunakan `student/learning_checklist.md` untuk tracking progress
6. Lakukan self-review dengan `student/self_review.md`

### Untuk AI Agent

1. Baca `prompts/project_constitution.md` untuk memahami aturan project
2. Ikuti `prompts/architecture_rules.md` untuk implementasi
3. Gunakan `prompts/implementation_plan.md` untuk langkah implementasi
4. Gunakan `prompts/review_checklist.md` untuk quality control

---

## Philosophy

Training kit ini dibuat dengan prinsip:

- **Documentation First**: Dokumentasi adalah sumber kebenaran tunggal
- **Incremental**: Bangun fitur satu per satu
- **Educational**: Fokus pada pembelajaran, bukan kecepatan
- **No Over-engineering**: Gunakan solusi sederhana yang cukup
- **Explain WHY before HOW**: Jelaskan konsep sebelum implementasi

---

## Catatan Penting

- Training kit ini **BUKAN** source code siap pakai
- Training kit adalah **dokumentasi** untuk memandu pembangunan aplikasi
- Implementasi harus dilakukan setelah dokumentasi dipahami
- Jangan skip dokumentasi untuk langsung coding
- Tanyakan kepada mentor jika ada yang tidak dipahami

---

## Support

Jika menemukan masalah atau pertanyaan:

- Diskusikan dengan mentor
- Review dokumentasi terkait
- Cek common mistakes di setiap dokumen

---

**Selamat Belajar!**

---

**Versi Dokumen**: 1.0  
**Tanggal Dibuat**: 2026  
**Tujuan**: Training Kit LKS SSFB Digital Library
