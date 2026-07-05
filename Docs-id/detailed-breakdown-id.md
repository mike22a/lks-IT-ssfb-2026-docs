# LKS IT Software Solution for Business - Pemecahan Detail

## 1. Ikhtisar Kompetisi

### 1.1 Nama Kompetisi
**Teknologi Informasi Piranti Lunak untuk Bisnis (IT Software Solution for Business)**

### 1.2 Deskripsi Kompetisi
Kompetisi ini berfokus pada pengembangan solusi perangkat lunak untuk meningkatkan produktivitas bisnis. Ini mencakup berbagai keterampilan dan disiplin, dengan penekanan pada:
- Kesadaran terhadap karakteristik industri yang berubah dengan cepat
- Kemampuan untuk mengikuti perubahan teknologi
- Bekerja closely dengan klien untuk memodifikasi sistem yang ada atau membuat sistem baru
- Pekerjaan pengembangan yang berorientasi backend

### 1.3 Kompetensi Target
Kompetisi mengukur pengetahuan dan pemahaman melalui pengujian berbasis kinerja. Tingkat kesulitan disesuaikan dengan:
- Kurikulum pendidikan DIKMEN
- Kemampuan peserta rata-rata (berdasarkan data LKS Nasional sebelumnya)
- Kenyamanan peserta dalam menyelesaikan proyek uji
- Kepatuhan WorldSkills Occupational Standards (WSOS)

---

## 2. Struktur & Jadwal Kompetisi

### 2.1 Pemecahan Modul

| Modul | Durasi | Hari | Bobot | Teknologi |
|--------|----------|-----|--------|------------|
| A: Aplikasi Mobile (Android) | 3 jam | Hari 1 | 25% | Android Studio, Kotlin, Jetpack Compose |
| B: Aplikasi Desktop (.NET) | 3 jam | Hari 1 | 30% | Visual Studio 2026, .NET 8, Windows Forms |
| C: Aplikasi Mobile (Android) | 3 jam | Hari 2 | 25% | Android Studio, Kotlin, Jetpack Compose |
| D: Desain Perangkat Lunak | 3 jam | Hari 2 | 20% | Draw.io, Diagram UML |
| **Total** | **12 jam** | **2 hari** | **100%** | |

### 2.2 Jadwal Detail

#### Pra-Kompetisi (30 hari sebelumnya)
- **Pertemuan Teknis 1** (1 jam): Diskusi kompetisi teknis (Juri, Mentor & Peserta)

#### H-1 Kompetisi
- **Pertemuan Teknis 2** (1 jam): Diskusi implementasi kompetisi (Juri, Mentor & Peserta)
- **Familiarisasi** (2 jam): Familiarisasi alat dan bahan

#### Hari 1 (H1)
- **07:00 - 07:30**: Briefing Modul A: Aplikasi Mobile (Android) - 30 menit
- **07:30 - 10:30**: Kompetisi Modul A: Aplikasi Mobile (Android) - 3 jam
- **10:30 - 11:30**: Istirahat, Sholat dan Makan - 1 jam
- **11:30 - 12:00**: Briefing Modul B: Aplikasi Desktop (.NET) - 30 menit
- **12:00 - 15:00**: Kompetisi Modul B: Aplikasi Desktop (.NET) - 3 jam

#### Hari 2 (H2)
- **07:00 - 07:30**: Briefing Modul C: Aplikasi Mobile (Android) - 30 menit
- **07:30 - 10:30**: Kompetisi Modul C: Aplikasi Mobile (Android) - 3 jam
- **10:30 - 11:30**: Istirahat, Sholat dan Makan - 1 jam
- **11:30 - 12:00**: Briefing Modul D: Desain Perangkat Lunak - 30 menit
- **12:00 - 15:00**: Kompetisi Modul D: Desain Perangkat Lunak - 3 jam

#### Hari 3 (H3)
- **08:00 - 09:00**: Penutupan dan Evaluasi Kompetisi - 1 jam

---

## 3. Detail & Persyaratan Modul

### 3.1 Modul A & C: Aplikasi Mobile (Android)

#### Proses Alur
```
1. Analisis Persyaratan
   ↓
2. Desain Database
   ↓
3. Pengembangan API
   ↓
4. Implementasi UI Mobile
   ↓
5. Integrasi API
   ↓
6. Pengujian & Validasi
```

#### Persyaratan Detail

**Pengembangan Database & API:**
- Desain skema database berdasarkan persyaratan
- Bangun API sesuai kontrak endpoint
- Implementasikan logika bisnis yang benar untuk setiap endpoint
- Definisikan endpoint API dengan:
  - Metode HTTP (GET, POST, PUT, DELETE)
  - Headers (Content-Type, Authorization)
  - Parameter (query params, path params)
  - Request bodies (format JSON)
  - Response codes (200, 201, 400, 401, 404, 500)
  - Response headers dan bodies

**Standar Response API:**
- Format response yang konsisten di semua endpoint
- Tangani kasus negatif (input tidak valid, data hilang)
- Penanganan error yang tepat dengan pesan error yang bermakna
- Response API yang dapat dikonsumsi untuk integrasi mobile

**Pengembangan Aplikasi Mobile:**
- Analisis persyaratan dan implementasikan di aplikasi mobile
- Buat komponen UI berdasarkan persyaratan
- Implementasikan prinsip UI/UX yang tepat
- Ikuti panduan Material Design

**Operasi Data:**
- Integrasikan aplikasi mobile dengan API
- Implementasikan operasi CRUD (Create, Read, Update, Delete)
- Implementasikan fungsionalitas pencarian
- Implementasikan fungsionalitas filtering
- Ekspor data ke file eksternal (CSV, PDF, dll.)

**Persyaratan Umum:**
- Validasi yang tepat untuk semua input
- Pesan error yang jelas
- Scrollbar ketika konten melebihi layar
- Format tanggal ISO (YYYY-MM-DD)
- Konvensi penamaan yang tepat
- Formulir/laporan terpusat
- Dialog modal menonaktifkan formulir latar belakang

#### Stack Teknologi
- **IDE**: Android Studio (Panda Stable Version)
- **Bahasa**: Kotlin dengan Jetpack Compose
- **SDK**: Android SDK API Level 34
- **Emulator**: AVD Manager (Pixel/Pixel XL - API 34)
- **Build Tools**: Platform-Tools, Build-Tools

#### Kriteria Penilaian (25% masing-masing untuk Modul A & C)
- **Measurement (100%)**: Penilaian biner (1 jika memenuhi kriteria, 0 jika tidak)
  - Implementasi UI yang tepat
  - Implementasi validasi
  - Integrasi API
  - Operasi CRUD
  - Fungsionalitas pencarian dan filter
  - Kemampuan ekspor data

---

### 3.2 Modul B: Aplikasi Desktop (.NET)

#### Proses Alur
```
1. Impor/Setup Database
   ↓
2. Pembuatan Windows Forms
   ↓
3. Implementasi Koneksi Data
   ↓
4. Implementasi Operasi CRUD
   ↓
5. Implementasi Query (JOIN, Aggregate)
   ↓
6. Visualisasi Data (Charts)
   ↓
7. Kontrol Akses & Keamanan
   ↓
8. Pengujian & Validasi
```

#### Persyaratan Detail

**Integrasi Database:**
- Impor database dari sumber eksternal (file database atau API)
- Bangun dan kelola koneksi aplikasi desktop ke MS SQL Server
- Dukung koneksi langsung dan berbasis API
- Tangani connection pooling dan manajemen error

**Pengembangan Windows Forms:**
- Buat Windows Forms berdasarkan persyaratan
- Desain komponen UI (TextBox, ComboBox, DataGridView, Buttons, dll.)
- Implementasikan layout dan navigasi yang tepat
- Terapkan styling yang konsisten di semua formulir

**Operasi Data:**
- Tampilkan dan kelola rekaman database
- Implementasikan operasi CRUD (Create, Read, Update, Delete)
- Implementasikan fungsionalitas pencarian
- Implementasikan fungsionalitas filtering
- Gunakan DataGridView untuk manipulasi data

**Operasi Query Lanjutan:**
- Proses data menggunakan query relasional
- Implementasikan query JOIN (INNER, LEFT, RIGHT, FULL)
- Implementasikan query aggregate (COUNT, SUM, AVG, MIN, MAX)
- Tangani hubungan data yang kompleks

**Visualisasi Data:**
- Sajikan data dalam format visual
- Implementasikan grafik (Bar, Line, Pie, dll.)
- Konfigurasikan properti grafik (labels, legends, colors)
- Tangani update data dinamis di grafik

**Keamanan & Kontrol Akses:**
- Implementasikan pembatasan akses menu berdasarkan peran pengguna
- Terapkan validasi input
- Implementasikan langkah keamanan dasar
- Tangani error dengan baik

**Persyaratan Umum:**
- Validasi yang tepat untuk semua input
- Pesan error yang jelas
- Scrollbar ketika konten melebihi layar
- Format tanggal ISO (YYYY-MM-DD)
- Konvensi penamaan yang tepat
- Formulir/laporan terpusat
- Dialog modal menonaktifkan formulir latar belakang

#### Stack Teknologi
- **IDE**: Microsoft Visual Studio Community Edition 2026
- **Framework**: .NET 8 SDK
- **Workloads**: 
  - .NET Desktop Development
  - ASP.NET and Web Development
  - .NET Multi-platform App UI (.NET MAUI) - opsional
- **Database**: Microsoft SQL Server 2022 (RTM)
- **Manajemen DB**: SQL Server Management Studio 21
- **NuGet Packages**:
  - Microsoft.EntityFrameworkCore
  - Microsoft.EntityFrameworkCore.SqlServer
  - Microsoft.EntityFrameworkCore.Tools
  - Swashbuckle.AspNetCore
  - Microsoft.AspNetCore.Authentication.JwtBearer

#### Kriteria Penilaian (30%)
- **Measurement (100%)**: Penilaian biner (1 jika memenuhi kriteria, 0 jika tidak)
  - Implementasi koneksi database
  - Operasi CRUD
  - Implementasi query (JOIN, aggregate)
  - Visualisasi data (grafik)
  - Validasi input
  - Fungsionalitas pencarian dan filter
  - Implementasi kontrol akses
  - Penanganan error

---

### 3.3 Modul D: Desain Perangkat Lunak

#### Proses Alur
```
1. Analisis Persyaratan
   ↓
2. Dokumentasi Persyaratan
   ↓
3. Pengembangan Use Case
   ↓
4. Pembuatan Diagram Aktivitas
   ↓
5. Desain UI (Desktop & Mobile)
   ↓
6. Dokumentasi & Presentasi
```

#### Persyaratan Detail

**Analisis & Dokumentasi Persyaratan:**
- Analisis persyaratan berdasarkan kebutuhan pengguna
- Analisis persyaratan berdasarkan kebutuhan sistem
- Dokumentasikan persyaratan dengan jelas dan komprehensif
- Identifikasi persyaratan fungsional dan non-fungsional
- Definisikan batasan dan ruang lingkup sistem

**Pengembangan Use Case:**
- Kembangkan use case yang mewakili interaksi pengguna-sistem
- Identifikasi aktor (pengguna, sistem eksternal)
- Definisikan skenario use case (happy path, alternative paths)
- Dokumentasikan deskripsi use case
- Buat diagram use case

**Pemodelan Diagram Aktivitas:**
- Modelkan alur kerja sistem menggunakan diagram aktivitas
- Representasikan proses bisnis dan alur logika
- Tampilkan titik keputusan dan percabangan
- Sertakan titik awal dan akhir
- Ikuti standar UML

**Desain UI:**
- Desain antarmuka pengguna untuk aplikasi desktop
- Desain antarmuka pengguna untuk aplikasi mobile
- Pastikan desain memenuhi persyaratan fungsional
- Terapkan prinsip usability
- Buat wireframe/mockup
- Pertimbangkan desain responsif untuk mobile

**Persyaratan Umum:**
- Konvensi penamaan yang tepat
- Dokumentasi yang jelas
- Ikuti standar UML
- Wireframe hanya referensi (modifikasi diizinkan jika fungsionalitas tidak terpengaruh)
- Perhatikan manajemen waktu

#### Stack Teknologi
- **Tool Diagram**: Draw.io Desktop Version
- **Dokumentasi**: Microsoft Office 365 Home/Education

#### Kriteria Penilaian (20%)
- **Judgement (100%)**: Penilaian subjektif (skala 0-3)
  - **0**: Kinerja di bawah standar industri
  - **1**: Kinerja memenuhi standar industri
  - **2**: Kinerja melebihi standar industri
  - **3**: Kinerja luar biasa yang sesuai atau melebihi ekspektasi industri saat ini

**Aspek yang Dinilai:**
- Efektivitas komunikasi visual
- Keklaran dokumentasi persyaratan
- Kelengkapan use case
- Akurasi diagram aktivitas
- Usability desain UI
- Kualitas desain keseluruhan

---

## 4. Persyaratan Umum (Semua Modul)

### 4.1 Validasi & Penanganan Error
- Setiap modul harus menyertakan validasi yang tepat
- Pesan error yang jelas dan bermakna
- Tangani kasus negatif dengan tepat
- Pemulihan error yang baik

### 4.2 Standar UI/UX
- Scrollbar harus ditampilkan ketika konten melebihi layar
- Semua formulir/laporan harus terpusat di layar
- Ketika formulir/dialog dalam fokus, formulir lain harus dinonaktifkan
- Wireframe hanya referensi (modifikasi diizinkan jika fungsionalitas tidak terpengaruh)

### 4.3 Standar Data
- Gunakan format tanggal yang sesuai ISO: YYYY-MM-DD untuk semua field tanggal
- Konvensi penamaan yang tepat untuk semua materi yang diserahkan
- Format data yang konsisten di semua modul

### 4.4 Manajemen Waktu
- Perhatikan dengan seksama waktu kerja yang dialokasikan
- Kelola waktu yang tersedia secara efektif
- Prioritaskan tugas berdasarkan bobot dan kompleksitas

---

## 5. Sistem Penilaian

### 5.1 Metode Penilaian
Dua metode penilaian digunakan:

#### Penilaian Judgement
- **Tujuan**: Menilai kualitas kinerja di mana perbedaan subjektif mungkin ada
- **Skala**: 0-3 poin
  - 0: Di bawah standar industri (termasuk tidak dicoba)
  - 1: Memenuhi standar industri
  - 2: Melebihi standar industri
  - 3: Luar biasa, sesuai atau melebihi ekspektasi industri saat ini
- **Penggunaan**: Modul Desain Perangkat Lunak (Modul D)

#### Penilaian Measurement
- **Tujuan**: Menilai akurasi, presisi, dan kinerja yang dapat diukur secara objektif
- **Skala**: Biner (1 jika memenuhi kriteria, 0 jika tidak)
- **Penggunaan**: Aplikasi Mobile (Modul A & C) dan Aplikasi Desktop (Modul B)

### 5.2 Konversi Skor
- Skor awal: skala 0-100
- Dikonversi ke skala WorldSkills: 0-700
- Penentuan peringkat:
  - Juara 1, 2, 3 berdasarkan skor yang dikonversi
  - Medallion of Excellence untuk skor di atas 700
  - Peringkat keseluruhan semua peserta

### 5.3 Komposisi Penilaian

| Modul | Judgement | Measurement | Total |
|--------|-----------|-------------|-------|
| A: Aplikasi Mobile | 0% | 25% | 25% |
| B: Aplikasi Desktop | 0% | 30% | 30% |
| C: Aplikasi Mobile | 0% | 25% | 25% |
| D: Desain Perangkat Lunak | 20% | 0% | 20% |
| **Total** | **20%** | **80%** | **100%** |

---

## 6. Persyaratan Teknis

### 6.1 Persyaratan Hardware (Disediakan Peserta)

#### Komputer/Laptop
- **Processor**: Intel Core i5 generasi ke-8 atau lebih tinggi
- **RAM**: Minimum 16 GB
- **Storage**: SSD minimum 256 GB
- **Network**: Wi-Fi dongle (opsional untuk desktop tanpa Wi-Fi internal)
- **Monitor**: 20-24 inci (diperlukan untuk pengguna desktop)
- **Jumlah**: 1 perangkat (backup disarankan)
- **Kondisi**: Instalasi baru disarankan (tanpa data pribadi)

#### Perangkat Input
- **Mouse**: Kabel, non-programmable, tanpa memori (1 + 1 backup)
- **Keyboard**: Kabel, non-programmable, tanpa memori (1 + 1 backup)

#### Kamera
- **Tipe**: Web Camera Eksternal
- **Resolusi**: Minimum 1024 x 768
- **Frame Rate**: 30 FPS
- **Mount**: Tripod stand
- **Jumlah**: 2 unit (webcam laptop dapat menggantikan salah satu)

### 6.2 Persyaratan Software (Disediakan Peserta)

| Software | Spesifikasi |
|----------|---------------|
| **Sistem Operasi** | Windows 10 atau 11, 64-bit |
| **Microsoft Office” | Microsoft Office 365 Home/Education |
| **Visual Studio 2026** | Community Edition dengan workloads: <br>• .NET Desktop Development <br>• ASP.NET and Web Development <br>• .NET MAUI (opsional) <br>• .NET 8 SDK <br>NuGet Packages: <br>• Microsoft.EntityFrameworkCore <br>• Microsoft.EntityFrameworkCore.SqlServer <br>• Microsoft.EntityFrameworkCore.Tools <br>• Swashbuckle.AspNetCore <br>• Microsoft.AspNetCore.Authentication.JwtBearer |
| **SQL Server** | Microsoft SQL Server 2022 (RTM) |
| **SSMS** | SQL Server Management Studio 21 |
| **Android Studio** | Panda Stable Version dengan: <br>• Android SDK (Platform-Tools, Build-Tools) <br>• Android SDK API Level 34 <br>• AVD Manager (Pixel/Pixel XL - API 34) <br>• Kotlin dengan Jetpack Compose |
| **Draw.io** | Desktop Version |
| **Browser** | Google Chrome versi terbaru |
| **Zoom** | Zoom Workplace |

### 6.3 Persyaratan Instalasi Software
- Semua software harus diinstal sebelum sesi familiarisasi
- Dependensi harus diverifikasi selama familiarisasi
- Perubahan apa pun selama kompetisi memerlukan persetujuan juri

---

## 7. Layout dan Bahan Layout

**Catatan**: Bagian ini berisi spesifikasi layout teknis dan venue untuk komite/penyelenggara kompetisi. Tidak langsung relevan untuk persiapan peserta tetapi disertakan untuk kelengkapan dokumen.

### 7.1 Persyaratan Layout
- Layout venue kompetisi harus mempertimbangkan rute evakuasi ke area aman
- Akses keluar dan penempatan barang harus mengikuti standar keamanan
- Desain layout harus mengakomodasi semua persyaratan kompetisi

### 7.2 Material Layout
- Instalasi listrik harus memenuhi standar keamanan tinggi
- Layout kabel harus mengikuti spesifikasi yang tepat
- Kualitas komponen, jalur kabel, koneksi, instalasi MCB dan terminal harus sesuai spesifikasi
- Item dengan kelembaban tinggi atau mengandung air harus ditempatkan jauh dari komponen listrik

**Catatan**: Spesifikasi layout detail dan persyaratan material dikelola oleh komite kompetisi dan bukan bagian dari kriteria penilaian peserta.

---

## 8. Jadwal dan Timeline

### 8.1 Pra-Kompetisi (30 hari sebelumnya)
- **Pertemuan Teknis 1** (1 jam): Diskusi kompetisi teknis (Juri, Mentor & Peserta)

### 8.2 H-1 Kompetisi
- **Pertemuan Teknis 2** (1 jam): Diskusi implementasi kompetisi (Juri, Mentor & Peserta)
- **Familiarisasi** (2 jam): Familiarisasi alat dan bahan

### 8.3 Hari 1 (H1)
- **07:00 - 07:30**: Briefing Modul A: Aplikasi Mobile (Android) - 30 menit
- **07:30 - 10:30**: Kompetisi Modul A: Aplikasi Mobile (Android) - 3 jam
- **10:30 - 11:30**: Istirahat, Sholat dan Makan - 1 jam
- **11:30 - 12:00**: Briefing Modul B: Aplikasi Desktop (.NET) - 30 menit
- **12:00 - 15:00**: Kompetisi Modul B: Aplikasi Desktop (.NET) - 3 jam

### 8.4 Hari 2 (H2)
- **07:00 - 07:30**: Briefing Modul C: Aplikasi Mobile (Android) - 30 menit
- **07:30 - 10:30**: Kompetisi Modul C: Aplikasi Mobile (Android) - 3 jam
- **10:30 - 11:30**: Istirahat, Sholat dan Makan - 1 jam
- **11:30 - 12:00**: Briefing Modul D: Desain Perangkat Lunak - 30 menit
- **12:00 - 15:00**: Kompetisi Modul D: Desain Perangkat Lunak - 3 jam

### 8.5 Hari 3 (H3)
- **08:00 - 09:00**: Penutupan dan Evaluasi Kompetisi - 1 jam

---

## 9. Aturan & Pembatasan Kompetisi

### 9.1 Format & Penyampaian
- Kompetisi dilakukan secara online (daring)
- Setiap peserta menggunakan komputer/laptop sendiri di lokasi kompetisi
- Material Test Project (MTP) mengukur semua spesifikasi kompetensi
- Proyek uji ditutup dan hanya dibuka selama kompetisi
- MTP disajikan dalam Bahasa Inggris (kamus fisik diizinkan untuk terjemahan)

### 9.2 Pembatasan Internet & AI
- **Penggunaan Internet**: Terbatas
  - Tidak diizinkan untuk browsing referensi
  - Tidak diizinkan untuk mencari solusi
  - Tidak diizinkan untuk penggunaan tool AI
  - Diizinkan hanya untuk: akses platform kompetisi, pengiriman hasil, Gradle sync (modul Android)

- **Tool AI**: Dilarang keras
  - ChatGPT
  - GitHub Copilot
  - Cursor AI
  - Gemini
  - Claude
  - Fitur autocomplete AI apa pun
  - **Sanksi**: Pengurangan skor hingga diskualifikasi

### 9.3 Penggunaan Tool
- Harus menggunakan perangkat, software, dan lingkungan yang ditentukan
- Tidak dapat mengganti atau menggunakan alat di luar persyaratan kompetisi
- Perubahan khusus memerlukan persetujuan juri
- Juri dapat menolak perubahan yang tidak perlu atau tidak sesuai

### 9.4 Sesi Familiarisasi
- Durasi: Maksimum 2 jam pada H-1
- Tujuan: Verifikasi perangkat, software, dependensi, dan kebutuhan teknis
- Pastikan semuanya berfungsi dengan baik sebelum kompetisi dimulai

---

## 10. Persyaratan Kesehatan & Keselamatan (K3)

### 10.1 Prinsip Umum
- Kesehatan dan keselamatan adalah prinsip prioritas untuk semua pihak
- Mengacu pada Panduan Teknis LKS DIKMEN Nasional 2026

### 10.2 Persyaratan Khusus
- Selalu prioritaskan kesehatan dan keselamatan selama kompetisi
- Layout harus mempertimbangkan rute evakuasi ke area aman
- Instalasi listrik harus memenuhi standar keamanan tinggi
- Perhatikan kualitas komponen, layout kabel, koneksi
- Semua pihak harus memantau aktivitas dan pergerakan untuk mencegah kerusakan
- Item dengan kelembaban tinggi atau mengandung air harus dijauhkan dari komponen listrik
- Air mineral tidak dapat disimpan terbuka atau dekat komponen listrik selama kompetisi

---

## 11. Alur Dokumen & Distribusi Informasi

### 11.1 Publikasi Dokumen
- Deskripsi Teknis dan Kisi-kisi Soal dipublikasikan melalui Puspresnas: https://smk.pusatprestasinasional.kemdikbud.go.id/lks
- Pembaruan atau perbaikan apa pun dipublikasikan ulang di halaman yang sama

### 11.2 Distribusi Proyek Uji
- Proyek uji diunggah ke website Puspresnas
- Peserta dan mentor mengunduh menggunakan akun peserta/mentor
- Waktu pengunduhan ditentukan dalam Panduan Umum

### 11.3 Dokumen Terkait
- Panduan Teknis Umum untuk kompetisi
- Informasi di akun peserta, mentor, dan kontinjensi:
  - Deskripsi Teknis Bidang Lomba
  - Kisi-kisi Soal
  - Formulir Persyaratan Material
  - Lembar Persyaratan Material

---

## 12. Daftar Periksa Persiapan

### 12.1 Pra-Kompetisi (30 hari sebelumnya)
- [ ] Hadiri Pertemuan Teknis 1
- [ ] Pelajari dokumen Deskripsi Teknis
- [ ] Pelajari Kisi-kisi Soal
- [ ] Siapkan semua software yang diperlukan
- [ ] Instal dan konfigurasikan lingkungan pengembangan
- [ ] Latih semua jenis modul
- [ ] Siapkan kamus fisik (Bahasa Inggris)

### 12.2 H-1 Kompetisi
- [ ] Hadiri Pertemuan Teknis 2
- [ ] Hadiri sesi Familiarisasi (2 jam)
- [ ] Verifikasi semua instalasi software
- [ ] Tes koneksi database
- [ ] Tes Android Studio dan AVD
- [ ] Tes Visual Studio dan lingkungan .NET
- [ ] Verifikasi setup kamera
- [ ] Pastikan kondisi komputer baru (tanpa data pribadi)

### 12.3 Hari 1 Kompetisi
- [ ] Hadiri briefing Modul A
- [ ] Selesaikan Modul A: Aplikasi Mobile (3 jam)
- [ ] Hadiri briefing Modul B
- [ ] Selesaikan Modul B: Aplikasi Desktop (3 jam)

### 12.4 Hari 2 Kompetisi
- [ ] Hadiri briefing Modul C
- [ ] Selesaikan Modul C: Aplikasi Mobile (3 jam)
- [ ] Hadiri briefing Modul D
- [ ] Selesaikan Modul D: Desain Perangkat Lunak (3 jam)

### 12.5 Hari 3 Kompetisi
- [ ] Hadiri sesi penutupan dan evaluasi

---

## 13. Faktor Keberhasilan Utama

### 13.1 Keahlian Teknis
- Keahlian desain database yang kuat
- Keahlian pengembangan API
- Pengembangan aplikasi mobile (Android/Kotlin)
- Pengembangan aplikasi desktop (.NET/C#)
- Optimasi query SQL
- Prinsip desain UI/UX
- Keahlian dokumentasi perangkat lunak

### 13.2 Manajemen Waktu
- Prioritas tugas yang efektif
- Analisis persyaratan yang cepat
- Praktik coding yang efisien
- Pengujian yang tepat dalam batas waktu

### 13.3 Standar Kualitas
- Praktik clean code
- Penanganan error yang tepat
- Konvensi penamaan yang konsisten
- Validasi komprehensif
- Antarmuka yang user-friendly

### 13.4 Kepatuhan
- Kepatuhan ketat pada aturan kompetisi
- Tidak menggunakan tool AI
- Penggunaan internet yang tepat
- Mengikuti spesifikasi teknis
- Memenuhi semua kriteria penilaian

---

## 14. Ringkasan Kompetensi Inti

### Modul A & C: Aplikasi Mobile (Android) - Total 50%
- Desain database dan pengembangan API
- Implementasi endpoint API dengan kontrak yang tepat
- Response API yang konsisten dengan penanganan error
- Implementasi UI mobile berdasarkan persyaratan
- Integrasi API untuk operasi data (CRUD, pencarian, filter, ekspor)

### Modul B: Aplikasi Desktop (.NET) - 30%
- Manajemen koneksi database (langsung atau via API)
- Tampilan dan manipulasi data (CRUD, DataGridView)
- Query lanjutan (JOIN, aggregate)
- Validasi input dan kontrol akses
- Visualisasi data (grafik)
- Keamanan dasar dan penanganan error

### Modul D: Desain Perangkat Lunak - 20%
- Analisis dan dokumentasi persyaratan
- Pengembangan use case
- Pemodelan diagram aktivitas
- Desain UI untuk desktop dan mobile
- Kepatuhan pada prinsip usability

---

**Versi Dokumen**: 1.0  
**Berdasarkan**: Deskripsi Teknis LKS DIKMEN Nasional 2026  
**Kompetisi**: IT Software Solution for Business  
**Terakhir Diperbarui**: 2026
