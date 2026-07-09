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
├── pdf/
│   ├── lks-it software solution for bussiness-deskripsi-teknis.pdf  # PDF deskripsi teknis resmi asli
│   └── lks-it software solution for bussiness-kisi-kisi.pdf          # PDF persyaratan kompetisi resmi asli
│   └── previous-year/                                                      # Soal-soal kompetisi tahun sebelumnya
├── txt/
│   ├── deskripsi-teknis.txt                    # Teks disalin dari PDF asli (deskripsi teknis)
│   ├── kisi-kisi.txt                            # Teks disalin dari PDF asli (persyaratan kompetisi)
│   ├── standar-software.txt                    # Persyaratan software standar
│   └── training-structure-folder.md             # Struktur folder rencana pelatihan
├── Docs/
│   ├── detailed-breakdown.md                    # Analisis detail deskripsi teknis
│   └── competition-requirements-specification.md  # Spesifikasi teknis detail
├── Docs-id/
│   ├── detailed-breakdown-id.md                # Terjemahan Bahasa Indonesia dari detailed-breakdown.md
│   └── competition-requirements-specification-id.md  # Terjemahan Bahasa Indonesia dari competition-requirements-specification.md
├── training-plan/
│   ├── agent_plan/
│   │   ├── objective.md                        # Tujuan pelatihan dan kriteria keberhasilan
│   │   ├── training_strategy.md                # Metodologi dan strategi pelatihan
│   │   ├── evaluation_criteria.md              # Kriteria penilaian dan checkpoint
│   │   └── mentor_notes.md                     # Catatan untuk mentor per sesi
│   ├── plan/
│   │   ├── session_01.md                       # Sesi 1: API .NET Foundation
│   │   ├── session_02.md                       # Sesi 2: API .NET Advanced
│   │   ├── session_03.md                       # Sesi 3: Desktop Apps Foundation
│   │   ├── session_04.md                       # Sesi 4: Desktop Apps Database Integration
│   │   ├── session_05.md                       # Sesi 5: Desktop Apps Advanced Features
│   │   ├── session_06.md                       # Sesi 6: Mobile Android Foundation
│   │   ├── session_07.md                       # Sesi 7: Mobile Android API Integration
│   │   └── session_08.md                       # Sesi 8: Review & Practice
│   ├── assignments/
│   │   ├── hw_01.md                            # Tugas untuk Sesi 1
│   │   ├── hw_02.md                            # Tugas untuk Sesi 2
│   │   ├── hw_03.md                            # Tugas untuk Sesi 3
│   │   ├── hw_04.md                            # Tugas untuk Sesi 4
│   │   ├── hw_05.md                            # Tugas untuk Sesi 5
│   │   ├── hw_06.md                            # Tugas untuk Sesi 6
│   │   ├── hw_07.md                            # Tugas untuk Sesi 7
│   │   └── hw_08.md                            # Tugas untuk Sesi 8
│   └── mock_exam/
│       ├── mock_exam_01.md                     # Ujian simulasi: API .NET & Desktop Apps
│       └── mock_exam_02.md                     # Ujian simulasi: Mobile Android Full Integration
├── daily-plans/
│   ├── session-01.md                           # File sesi lama (dipindahkan ke training-plan/plan/)
│   ├── session-02.md
│   ├── session-03.md
│   ├── session-04.md
│   ├── session-05.md
│   ├── session-06.md
│   ├── session-07.md
│   └── session-08.md
├── plan.md                                      # Ikhtisar rencana pelatihan
├── README.md                                    # File ini (versi Bahasa Inggris)
├── README-id.md                                 # File ini (versi Bahasa Indonesia)
└── .gitignore                                   # Aturan git ignore
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

## Cara Menggunakan Repository Ini

### Contoh Implementasi API Praktis
*   🚀 **[Panduan Langkah-Demi-Langkah Pembuatan API (BookstoreApi - Level 1)](./training-plan/dotnet-api-example/01-BookstoreApi-GUIDE.md)**: Panduan lengkap dan ramah pemula untuk membangun Clean Architecture ASP.NET Core API dengan SQLite/SQL Server, autentikasi JWT, dan pola repository dari nol.
*   🚀 **[Panduan Langkah-Demi-Langkah Pembuatan API (LibraryApi - Level 2)](./training-plan/dotnet-api-example/02-LibraryApi-GUIDE.md)**: Panduan tingkat menengah yang mendemonstrasikan autentikasi berbasis peran (Admin/Librarian), pembaruan inventori transaksional, kalkulasi denda otomatis, dan query repository tingkat lanjut.

### Untuk Peserta
1. **Mulai dengan `pdf/lks-it software solution for bussiness-deskripsi-teknis.pdf`** untuk melihat struktur kompetisi resmi asli
2. **Tinjau `pdf/lks-it software solution for bussiness-kisi-kisi.pdf`** untuk melihat persyaratan kompetisi resmi asli
3. **Referensi `txt/deskripsi-teknis.txt`** untuk salinan teks yang dapat dicari dari deskripsi teknis
4. **Referensi `txt/kisi-kisi.txt`** untuk salinan teks yang dapat dicari dari persyaratan kompetisi
5. **Pelajari `Docs/detailed-breakdown.md`** untuk analisis komprehensif dan panduan persiapan
6. **Referensi `Docs/competition-requirements-specification.md`** untuk contoh implementasi detail

### Untuk Mentor/Pelatih
1. Gunakan `Docs/detailed-breakdown.md` untuk membuat kurikulum pelatihan
2. Gunakan `Docs/competition-requirements-specification.md` untuk panduan teknis
3. Ikuti daftar periksa persiapan untuk memastikan pelatihan komprehensif
4. Fokus pada faktor keberhasilan utama dan kesalahan umum

### Referensi Cepat
- **Ikhtisar Kompetisi**: Lihat `Docs/detailed-breakdown.md` Bagian 1
- **Detail Modul**: Lihat `Docs/detailed-breakdown.md` Bagian 3
- **Persyaratan Teknis**: Lihat `Docs/detailed-breakdown.md` Bagian 6
- **Jadwal**: Lihat `Docs/detailed-breakdown.md` Bagian 8
- **Kriteria Penilaian**: Lihat `Docs/competition-requirements-specification.md` Bagian 6
- **Contoh Kode**: Lihat bagian Modul di `Docs/competition-requirements-specification.md`

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

**Terakhir Diperbarui**: 2026  
**Kompetisi**: LKS DIKMEN Nasional 2026 - IT Software Solution for Business
