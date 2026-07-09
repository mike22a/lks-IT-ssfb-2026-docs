# LKS IT Software Solution for Business - Persiapan Kompetisi

## Ikhtisar

Repository ini berisi dokumentasi komprehensif dan analisis untuk kompetisi **LKS DIKMEN Nasional 2026** dalam kategori **IT Software Solution for Business**. Dokumen-dokumen ini menyediakan spesifikasi teknis, persyaratan, dan panduan implementasi yang detail untuk peserta yang mempersiapkan diri untuk kompetisi.

## Informasi Kompetisi

- **Nama Kompetisi**: Teknologi Informasi Piranti Lunak untuk Bisnis (IT Software Solution for Business)
- **Tingkat**: LKS DIKMEN Nasional 2026
- **Durasi**: 12 jam (2 hari)
- **Modul**: 4 (Aplikasi Mobile x2, Aplikasi Desktop, Desain Perangkat Lunak)
- **Teknologi**: Android/Kotlin, .NET/C#, SQL Server, UML Design

## Struktur Proyek

```
lks-IT-ssfb-2026-docs/
├── pdf/                         # PDF kompetisi resmi
├── txt/                         # Salinan teks yang bisa dicari
├── Docs/                        # Dokumen analisis (Bahasa Inggris)
├── Docs-id/                     # Dokumen analisis (Bahasa Indonesia)
├── training-plan/               # ← KONTEN PELATIHAN UTAMA
│   ├── agent_plan/              # Strategi & dokumen mentor
│   │   ├── objective.md         # Tujuan pelatihan & KPI
│   │   ├── training_strategy.md # Metodologi (20% teori, 30% demo, 40% praktik)
│   │   ├── evaluation_criteria.md # Checkpoint & rubrik penilaian
│   │   ├── mentor_notes.md      # Tips & catatan mentor per sesi
│   │   └── mentor_cheatsheet.md # Referensi cepat: commands, template, checklist
│   ├── plan/                    # Rencana detail per sesi
│   │   ├── session_01.md        # Sesi 1: API Kickoff + Clean Architecture
│   │   ├── session_02.md        # Sesi 2: Application + Infrastructure Layer
│   │   ├── session_03.md        # Sesi 3: Controllers + Business Logic
│   │   ├── session_04.md        # Sesi 4: WinForm + Android Integration
│   │   └── session_05.md        # Sesi 5: Full Integration + Simulasi Kompetisi
│   ├── assignments/             # Homework per sesi
│   │   └── hw_01.md → hw_05.md  # Tugas setelah setiap sesi
│   ├── mock_exam/               # Ujian latihan (simulasi kompetisi)
│   │   ├── mock_exam_01.md      # Simulasi: API + Desktop Apps (3 jam)
│   │   └── mock_exam_02.md      # Simulasi: Mobile Android Full Integration (3 jam)
│   └── dotnet-api-example/      # Panduan implementasi API step-by-step
│       ├── 01-BookstoreApi-GUIDE.md  # Level 1: Clean Architecture Dasar
│       ├── 02-LibraryApi-GUIDE.md   # Level 2: Role-based auth + business rules
│       └── 03-HotelApi-GUIDE.md     # Level 3: State machine + laporan
├── README.md                    # File ini (Bahasa Inggris)
└── README-id.md                 # Versi Bahasa Indonesia
```

## Deskripsi Dokumen

### 1. deskripsi-teknis.txt
**Salinan Teks dari PDF Deskripsi Teknis Resmi**

File ini berisi teks yang disalin dari dokumen PDF asli (`pdf/lks-it software solution for bussiness-deskripsi-teknis.pdf`) dari penyelenggara kompetisi yang berisi:
- Ikhtisar dan deskripsi kompetisi
- Spesifikasi modul dan bobot penilaian
- Kriteria penilaian dan metode penilaian
- Persyaratan teknis (hardware/software)
- Jadwal dan timeline kompetisi
- Persyaratan kesehatan dan keselamatan (K3)
- Alur dokumen dan distribusi informasi

**Bagian**:
1. Pendahuluan
2. Standar Kompetensi Bidang Lomba
3. Sistem Penilaian
4. Format/Struktur Proyek Uji
5. Daftar Alat
6. Daftar Bahan
7. Layout dan Bahan Layout
8. Jadwal Bidang Lomba
9. Prosedur Kesehatan dan Keselamatan Kerja (K3)

### 2. kisi-kisi.txt
**Salinan Teks dari PDF Persyaratan Kompetisi Resmi**

File ini berisi teks yang disalin dari dokumen PDF asli (`pdf/lks-it software solution for bussiness-kisi-kisi.pdf`) dan menguraikan persyaratan umum untuk setiap modul:
- Persyaratan umum (validasi, standar UI, konvensi penamaan)
- Persyaratan Aplikasi Desktop (.NET)
- Persyaratan Aplikasi Mobile (Android)
- Persyaratan Desain Perangkat Lunak

### 3. detailed-breakdown.md
**Analisis Detail Deskripsi Teknis**

Dokumen ini memberikan pemecahan komprehensif dari deskripsi teknis resmi dengan:
- Struktur dan jadwal kompetisi
- Persyaratan dan alur modul detail
- Persyaratan teknis (hardware/software)
- Aturan dan pembatasan kompetisi
- Pemecahan kriteria penilaian
- Daftar periksa persiapan
- Faktor keberhasilan utama

**Fitur Utama**:
- Diagram alur untuk setiap modul
- Spesifikasi stack teknologi detail
- Kriteria penilaian dengan metode penilaian
- Timeline dan daftar periksa persiapan

### 4. competition-requirements-specification.md
**Spesifikasi Teknis Detail**

Dokumen ini mengembangkan kisi-kisi dengan detail implementasi:
- Persyaratan detail untuk setiap modul
- Contoh kode dan pola implementasi
- Panduan desain dan pengembangan API
- Prinsip desain UI/UX
- Panduan desain database
- Kriteria penilaian dengan pemecahan skor

**Fitur Utama**:
- Contoh kode untuk .NET dan Android
- Spesifikasi endpoint API
- Contoh skema database
- Panduan diagram UML
- Pertimbangan lintas modul

## Modul Kompetisi

### Modul A: Aplikasi Mobile (Android)
- **Durasi**: 3 jam
- **Hari**: Hari 1
- **Bobot**: 25%
- **Fokus**: Desain database, pengembangan API, UI mobile, integrasi API

### Modul B: Aplikasi Desktop (.NET)
- **Durasi**: 3 jam
- **Hari**: Hari 1
- **Bobot**: 30%
- **Fokus**: Windows Forms, operasi CRUD, query SQL, visualisasi data

### Modul C: Aplikasi Mobile (Android)
- **Durasi**: 3 jam
- **Hari**: Hari 2
- **Bobot**: 25%
- **Fokus**: Mirip dengan Modul A dengan persyaratan berbeda

### Modul D: Desain Perangkat Lunak
- **Durasi**: 3 jam
- **Hari**: Hari 2
- **Bobot**: 20%
- **Fokus**: Analisis persyaratan, use case, diagram aktivitas, desain UI

## Stack Teknologi

### Aplikasi Mobile (Android)
- **IDE**: Android Studio (Panda Stable Version)
- **Bahasa**: Kotlin dengan Jetpack Compose
- **SDK**: Android SDK API Level 34
- **Emulator**: AVD Manager (Pixel/Pixel XL - API 34)

### Aplikasi Desktop (.NET)
- **IDE**: Microsoft Visual Studio Community Edition 2026
- **Framework**: .NET 8 SDK
- **Database**: Microsoft SQL Server 2022 (RTM)
- **Manajemen DB**: SQL Server Management Studio 21

### Desain Perangkat Lunak
- **Tool**: Draw.io Desktop Version
- **Dokumentasi**: Microsoft Office 365

## Sistem Penilaian

### Pengukuran (Measurement) (80%)
- Diterapkan pada Modul A, B, C
- Penilaian biner (0 atau 1)
- Berdasarkan penyelesaian kriteria spesifik
- Pengurangan untuk komponen yang hilang

### Penilaian (Judgement) (20%)
- Diterapkan pada Modul D (Desain Perangkat Lunak)
- Penilaian berskala (0-3)
- Berdasarkan kualitas dan standar industri
- Mengevaluasi efektivitas desain

## Aturan Kompetisi

### Pembatasan Internet & AI
- **Internet**: Penggunaan terbatas (hanya untuk kebutuhan teknis)
- **Tool AI**: Dilarang keras (ChatGPT, Copilot, Cursor, Gemini, Claude, dll.)
- **Sanksi**: Pengurangan skor hingga diskualifikasi

### Persyaratan Umum
- Format tanggal ISO (YYYY-MM-DD)
- Validasi dan penanganan error yang tepat
- Scrollbar untuk konten yang overflow
- Formulir/laporan terpusat
- Dialog modal menonaktifkan formulir latar belakang
- Konvensi penamaan yang tepat

## Timeline Persiapan

### 30 Hari Sebelum Kompetisi
- Pelajari deskripsi teknis dan kisi-kisi
- Instal dan konfigurasikan lingkungan pengembangan
- Latih semua jenis modul
- Siapkan kamus fisik (Bahasa Inggris)

### H-1 Kompetisi
- Hadiri pertemuan teknis
- Hadiri sesi familiarisasi (2 jam)
- Verifikasi semua instalasi software
- Tes koneksi database
- Tes lingkungan pengembangan

### Hari Kompetisi
- **Hari 1**: Modul A & B (total 6 jam)
- **Hari 2**: Modul C & D (total 6 jam)
- **Hari 3**: Penutupan dan evaluasi (1 jam)

## 🎓 Pusat Pelatihan (Training Hub)

> Semua materi pelatihan ada di folder [`training-plan/`](./training-plan/).
> Mulai dari panduan API di bawah, lalu ikuti rencana sesi dan homework secara berurutan.

---

### 📚 Panduan API Step-by-Step (Mulai di Sini)

Tiga proyek dengan kompleksitas bertingkat — masing-masing adalah contoh Clean Architecture yang lengkap dan bisa dijalankan:

| Level | Panduan | Kompleksitas | Fitur Utama |
|-------|---------|--------------|-------------|
| Level 1 | [Panduan BookstoreApi](./training-plan/dotnet-api-example/01-BookstoreApi-GUIDE.md) | ⭐ Dasar | CRUD, JWT Auth, Repository Pattern |
| Level 2 | [Panduan LibraryApi](./training-plan/dotnet-api-example/02-LibraryApi-GUIDE.md) | ⭐⭐ Menengah | Role-based Auth, Kalkulasi Denda, Manajemen Stok |
| Level 3 | [Panduan HotelApi](./training-plan/dotnet-api-example/03-HotelApi-GUIDE.md) | ⭐⭐⭐ Lanjut | State Machine, Ketersediaan Tanggal, Laporan Revenue |

---

### 🗓️ Sesi Pelatihan (5 Sesi × 2 Jam)

| Sesi | Topik | Rencana Sesi | Homework |
|------|-------|--------------|----------|
| Sesi 1 (10 Jul) | API Kickoff + Fondasi Clean Architecture | [session_01.md](./training-plan/plan/session_01.md) | [hw_01.md](./training-plan/assignments/hw_01.md) |
| Sesi 2 (11 Jul) | Application + Infrastructure Layer | [session_02.md](./training-plan/plan/session_02.md) | [hw_02.md](./training-plan/assignments/hw_02.md) |
| Sesi 3 (12 Jul) | Controllers + Business Logic + Error Handling | [session_03.md](./training-plan/plan/session_03.md) | [hw_03.md](./training-plan/assignments/hw_03.md) |
| Sesi 4 (13 Jul) | Integrasi WinForm + Android Kotlin | [session_04.md](./training-plan/plan/session_04.md) | [hw_04.md](./training-plan/assignments/hw_04.md) |
| Sesi 5 (14 Jul) | Full Integration + Simulasi Kompetisi | [session_05.md](./training-plan/plan/session_05.md) | [hw_05.md](./training-plan/assignments/hw_05.md) |

---

### 🏁 Ujian Latihan (Simulasi Kompetisi)

| Ujian Latihan | Fokus | Durasi |
|---------------|-------|--------|
| [Mock Exam 01](./training-plan/mock_exam/mock_exam_01.md) | API (Clean Architecture) + Desktop WinForm | 3 jam |
| [Mock Exam 02](./training-plan/mock_exam/mock_exam_02.md) | Mobile Android Full Integration | 3 jam |

---

### 🧑‍🏫 Sumber Daya Mentor

| Dokumen | Kegunaan |
|---------|----------|
| [mentor_cheatsheet.md](./training-plan/agent_plan/mentor_cheatsheet.md) | 🔑 Referensi satu halaman: semua command CLI, template kode, checklist kompetisi |
| [mentor_notes.md](./training-plan/agent_plan/mentor_notes.md) | Tips persiapan per sesi, pitfall umum, troubleshooting |
| [training_strategy.md](./training-plan/agent_plan/training_strategy.md) | Metodologi pelatihan & strategi adaptasi |
| [evaluation_criteria.md](./training-plan/agent_plan/evaluation_criteria.md) | Checkpoint, rubrik penilaian, kriteria kelulusan |
| [objective.md](./training-plan/agent_plan/objective.md) | Tujuan pelatihan, KPI, kriteria keberhasilan |

---

### Untuk Peserta
1. **Mulai dengan `pdf/lks-it software solution for bussiness-deskripsi-teknis.pdf`** untuk melihat struktur kompetisi resmi asli
2. **Tinjau `pdf/lks-it software solution for bussiness-kisi-kisi.pdf`** untuk melihat persyaratan kompetisi resmi asli
3. **Pelajari `Docs/detailed-breakdown.md`** untuk analisis komprehensif dan panduan persiapan
4. **Ikuti rencana sesi** secara berurutan: `session_01.md` → `session_05.md`
5. **Selesaikan setiap homework** sebelum sesi berikutnya dimulai
6. **Latihan dengan mock exam** setelah Sesi 5 untuk mensimulasikan kondisi kompetisi

### Untuk Mentor/Pelatih
1. 📋 Buka **[mentor_cheatsheet.md](./training-plan/agent_plan/mentor_cheatsheet.md)** — biarkan terbuka saat mengajar untuk copy-paste cepat
2. 📝 Baca **[mentor_notes.md](./training-plan/agent_plan/mentor_notes.md)** sebelum setiap sesi untuk tips persiapan
3. 📖 Tunjukkan **Panduan API** kepada siswa sebagai referensi hidup yang bisa dijalankan dan dimodifikasi
4. ⏱️ Gunakan **Mock Exam** di Sesi 5 dengan timer nyata untuk mensimulasikan tekanan kompetisi

## Faktor Keberhasilan Utama

### Keahlian Teknis
- Keahlian desain database yang kuat
- Keahlian pengembangan API
- Pengembangan aplikasi mobile (Android/Kotlin)
- Pengembangan aplikasi desktop (.NET/C#)
- Optimasi query SQL
- Prinsip desain UI/UX
- Keahlian dokumentasi perangkat lunak

### Manajemen Waktu
- Prioritas tugas yang efektif
- Analisis persyaratan yang cepat
- Praktik coding yang efisien
- Pengujian yang tepat dalam batas waktu

### Standar Kualitas
- Praktik clean code
- Penanganan error yang tepat
- Konvensi penamaan yang konsisten
- Validasi komprehensif
- Antarmuka yang user-friendly

### Kepatuhan
- Kepatuhan ketat pada aturan kompetisi
- Tidak menggunakan tool AI
- Penggunaan internet yang tepat
- Mengikuti spesifikasi teknis
- Memenuhi semua kriteria penilaian

## Catatan Penting

- Semua dokumen berdasarkan spesifikasi resmi LKS DIKMEN Nasional 2026
- Dokumen PDF resmi asli terletak di folder `pdf/`
- File teks di folder `txt/` adalah salinan teks yang dapat dicari yang diekstrak dari PDF asli
- Dokumen analisis markdown di folder `Docs/` adalah dokumen analisis untuk tujuan persiapan
- Selalu merujuk ke dokumen PDF asli di folder `pdf/` untuk persyaratan kompetisi final
- Pembaruan mungkin dipublikasikan di website Puspresnas resmi

## Sumber Daya Resmi

- **Website Resmi**: https://smk.pusatprestasinasional.kemdikbud.go.id/lks
- **Publikasi Dokumen**: Deskripsi Teknis dan Kisi-kisi dipublikasikan melalui Puspresnas
- **Distribusi Proyek Uji**: Unduh dari Puspresnas menggunakan akun peserta/mentor

## Versi Dokumen

- **pdf/lks-it software solution for bussiness-deskripsi-teknis.pdf**: Dokumen resmi dari LKS DIKMEN Nasional 2026
- **pdf/lks-it software solution for bussiness-kisi-kisi.pdf**: Dokumen resmi dari LKS DIKMEN Nasional 2026
- **txt/deskripsi-teknis.txt**: Salinan teks diekstrak dari PDF asli
- **txt/kisi-kisi.txt**: Salinan teks diekstrak dari PDF asli
- **Docs/detailed-breakdown.md**: Versi 1.0 (Dokumen analisis)
- **Docs/competition-requirements-specification.md**: Versi 1.0 (Dokumen spesifikasi)
- **README.md**: Versi 1.0
- **README-id.md**: Versi 1.0 (Terjemahan Bahasa Indonesia)

## Lisensi

Repository ini berisi dokumen analisis untuk tujuan persiapan kompetisi. Dokumen kompetisi resmi (file PDF di folder `pdf/`) adalah milik penyelenggara LKS DIKMEN Nasional 2026.

## Kontak

Untuk informasi kompetisi resmi, silakan hubungi penyelenggara LKS DIKMEN Nasional melalui website Puspresnas resmi.

---

**Terakhir Diperbarui**: 9 Juli 2026
**Kompetisi**: LKS DIKMEN Nasional 2026 - IT Software Solution for Business
**Periode Pelatihan**: 10 – 14 Juli 2026 | **Hari Kompetisi**: 27 Juli 2026 (paling awal)
