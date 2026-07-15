# Digital Library Training Project

## AI Project Constitution

Version: 1.1

---

# Purpose

Dokumen ini mendefinisikan aturan dan panduan utama bagi AI Agent dalam membangun serta memelihara proyek Digital Library sebagai media pembelajaran mandiri bagi siswa SMK untuk persiapan LKS Software Solution for Business (SSFB).

---

# Scope

Proyek ini mencakup:
* ASP.NET Core 8 Web API
* SQL Server 2022
* WinForms Desktop Application (.NET 8)
* Android Application (Kotlin + Retrofit 2)
* Clean Architecture Standard
* Panduan belajar mandiri (Onboarding, Quick Start, dan Validasi Mandiri)

---

# Learning Objectives

Melalui proyek ini, siswa mandiri diharapkan mampu:
* Memahami alur kerja database relasional secara utuh
* Menerapkan Clean Architecture secara incremental (lapisan demi lapisan)
* Mengimplementasikan REST API yang terstandarisasi dengan penanganan error terpadu
* Membuat aplikasi GUI desktop asynchronous (WinForms)
* Mengonsumsi REST API pada aplikasi Android dengan arsitektur MVVM
* Melakukan debugging dan pengujian API menggunakan Postman secara mandiri

---

# Prerequisites

* Pengetahuan dasar pemrograman C# dan OOP (Object-Oriented Programming)
* Dasar SQL Query (SELECT, INSERT, UPDATE, DELETE, JOIN)
* Pengetahuan dasar penggunaan Git untuk version control

---

# Mandatory Documentation Structure

Setiap dokumen panduan baru yang dibuat wajib memiliki parameter penanda kesulitan dan estimasi waktu di bagian atas:

```markdown
> **Tingkat Kesulitan**: [Mudah / Sedang / Sulit]  
> **Estimasi Waktu Pengerjaan**: [X Jam]
```

Serta harus memuat struktur konten berikut:
1. Purpose
2. Scope
3. Learning Objectives
4. Prerequisites
5. Business Rules (atau N/A)
6. Implementation Notes (termasuk Troubleshooting Gotchas)
7. Exercises
8. References

---

# Project Philosophy

* **Documentation First**: Dokumentasi adalah spesifikasi kebenaran tunggal sebelum baris kode ditulis.
* **Self-Validating Development**: Menyediakan skema uji mandiri (Postman schema atau skenario test) pada setiap modul agar siswa mandiri tahu jika implementasi mereka benar tanpa menunggu feedback mentor.
* **No Over-Engineering**: Hindari penggunaan library pihak ketiga atau pola kode yang terlalu rumit jika solusi bawaan .NET/Kotlin sudah memadai.
* **Fail-Safe & User-Friendly**: Desain sistem harus ramah terhadap kesalahan jaringan dan input pengguna yang tidak valid.

---

# Important Rules for AI Agents

AI Agent yang bertugas melakukan update proyek WAJIB:
* Menjelaskan MENGAPA (konsep/tujuan) sebelum BAGAIMANA (potongan kode).
* Memecah masalah kompleks menjadi langkah-langkah kecil (task incremental).
* Menyediakan snippet kode yang fungsional, bersih, dan mudah dipahami siswa SMK.
* Menyertakan skenario pengujian mandiri dan tips troubleshooting untuk setiap fitur yang diinstruksikan.

AI Agent dilarang keras:
* Melompati tahapan arsitektur (misal: langsung menghubungkan DB ke Controller demi kecepatan).
* Menyembunyikan stack trace error mentah atau membiarkan aplikasi crash tanpa penjelasan visual di client.

---

# End of Document
