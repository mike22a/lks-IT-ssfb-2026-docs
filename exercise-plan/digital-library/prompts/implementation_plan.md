# Implementation Plan & Getting Started Guide

## Digital Library Training Kit

---

# Purpose

Dokumen ini menyediakan langkah-langkah implementasi terstruktur, panduan setup (Quick Start), pemetaan tanggung jawab folder, panduan scaffold project, serta skema pengujian API (Postman) agar siswa dapat belajar mandiri secara async.

---

# Scope

Dokumen ini mencakup:
1. **Quick Start Guide** (Langkah awal setup environment)
2. **Folder Mapping Clarification** (Pembagian peran folder)
3. **Scaffold CLI Commands** (Mempercepat pembuatan solution/projects)
4. **Step-by-Step Task Roadmap** (24 Task detail terintegrasi)
5. **Self-Validation Postman Schema** (Validasi mandiri hasil API)
6. **Common Gotchas & Troubleshooting** (Penanganan isu di WinForms & Android)

---

# Learning Objectives

Setelah mengikuti panduan ini, siswa dapat:
* Menyiapkan environment secara mandiri tanpa mentor
* Memanfaatkan CLI `dotnet` untuk setup project dengan cepat
* Membangun aplikasi step-by-step dengan kepastian hasil (self-validation)
* Menghindari kesalahan umum pada layer arsitektur

---

# Prerequisites

* Memiliki VS Code / Visual Studio 2022 terinstall
* .NET 8.0 SDK terinstall
* SQL Server 2022 (LocalDB atau Express) terinstall
* Android Studio terinstall

---

# 1. Quick Start Guide (Langkah Awal)

Siswa mandiri wajib mengikuti urutan langkah setup awal berikut:

1. **Clone & Verifikasi Folder**: Pastikan struktur folder `exercise-plan/digital-library/` sudah lengkap.
2. **Setup Database**:
   - Buka SQL Server Management Studio (SSMS) atau Azure Data Studio.
   - Eksekusi file `database/01_create_database.sql` untuk membuat schema database.
   - Eksekusi file `database/02_seed_data.sql` untuk mengisi data dummy awal.
   - Jalankan query di `database/03_sample_queries.sql` untuk memverifikasi database siap digunakan.
3. **Mulai Belajar**:
   - Baca konsep di `docs/01-project-overview.md` hingga `docs/06-clean-architecture.md` sebelum menulis baris kode pertama.
4. **Mulai Menulis Code**: Ikuti task list di bawah ini dengan tertib.

---

# 2. Folder Mapping Clarification

Untuk mempermudah belajar mandiri, berikut adalah pemetaan fungsi folder:

* `docs/`: **Sumber pembelajaran teori & desain**. Siswa wajib membaca folder ini secara berurutan (01 sampai 10) untuk memahami teori arsitektur dan UI.
* `prompts/` (atau plan utama): **Panduan teknis dan instruksi untuk AI Agent / Siswa**. Berisi petunjuk langkah demi langkah, standar coding, dan kriteria penerimaan.
* `database/`: **Asset database SQL Server**. Berisi file `.sql` untuk inisialisasi awal.
* `student/`: **Alat pelacak kemajuan siswa**. Siswa mengisi `learning_checklist.md` dan `self_review.md` untuk mengukur tingkat pemahamannya sendiri.
* `mentor/`: **Buku pegangan mentor**. Berisi catatan evaluasi dan FAQ. *Siswa mandiri dapat membuka ini untuk troubleshooting.*

---

# 3. Scaffold CLI Commands

Gunakan perintah CLI dotnet berikut untuk mempercepat Task 1 dan Task 2 di terminal Anda:

```powershell
# Buat Solution
dotnet new sln -n DigitalLibrary

# Buat Project Layers
dotnet new classlib -n DigitalLibrary.Domain -f net8.0
dotnet new classlib -n DigitalLibrary.Application -f net8.0
dotnet new classlib -n DigitalLibrary.Infrastructure -f net8.0
dotnet new webapi -n DigitalLibrary.API -f net8.0
dotnet new winforms -n DigitalLibrary.WinForms -f net8.0

# Hubungkan Project ke Solution
dotnet sln DigitalLibrary.sln add DigitalLibrary.Domain
dotnet sln DigitalLibrary.sln add DigitalLibrary.Application
dotnet sln DigitalLibrary.sln add DigitalLibrary.Infrastructure
dotnet sln DigitalLibrary.sln add DigitalLibrary.API
dotnet sln DigitalLibrary.sln add DigitalLibrary.WinForms

# Setup Project References (Dependencies)
dotnet add DigitalLibrary.Application/DigitalLibrary.Application.csproj reference DigitalLibrary.Domain/DigitalLibrary.Domain.csproj
dotnet add DigitalLibrary.Infrastructure/DigitalLibrary.Infrastructure.csproj reference DigitalLibrary.Application/DigitalLibrary.Application.csproj
dotnet add DigitalLibrary.API/DigitalLibrary.API.csproj reference DigitalLibrary.Infrastructure/DigitalLibrary.Infrastructure.csproj
dotnet add DigitalLibrary.WinForms/DigitalLibrary.WinForms.csproj reference DigitalLibrary.Application/DigitalLibrary.Application.csproj
```

---

# 4. Step-by-Step Task Roadmap

Ikuti 24 task terurut yang tertulis di `prompts/implementation_plan.md` atau `agent.md`. Jangan melompati task sebelum kriteria penerimaan (Acceptance Criteria) terpenuhi dan dicentang pada `student/learning_checklist.md`.

---

# 5. Self-Validation Postman Schema

Siswa dapat menguji REST API mereka secara mandiri menggunakan skema validasi endpoint berikut sebelum melangkah ke pembuatan UI WinForms:

### 1. Endpoint Category (GET /api/categories)
- **Method**: `GET`
- **Expected Status**: `200 OK`
- **Expected Payload Schema**:
  ```json
  [
    {
      "id": 1,
      "name": "Programming"
    }
  ]
  ```

### 2. Endpoint Create Book (POST /api/books)
- **Method**: `POST`
- **Body**:
  ```json
  {
    "title": "Clean Code",
    "author": "Robert C. Martin",
    "categoryId": 1,
    "stock": 5
  }
  ```
- **Expected Status**: `201 Created`
- **Expected Response**: Mengembalikan objek buku yang dilengkapi dengan `id` auto-increment.

### 3. Endpoint Borrow Book (POST /api/borrowings)
- **Method**: `POST`
- **Body**:
  ```json
  {
    "userId": 1,
    "bookIds": [1, 2]
  }
  ```
- **Expected Status**: `201 Created`
- **Validation Rules**: 
  - Jika `bookIds` berisi > 3 buku, API harus mengembalikan `400 Bad Request` dengan pesan error: `"Maksimal 3 buku per peminjaman"`.
  - Jika stok salah satu buku = 0, API harus mengembalikan `400 Bad Request` dengan pesan: `"Stok buku [Nama Buku] habis"`.

---

# 6. Common Gotchas & Troubleshooting

### WinForms UI Blocking
* **Isu**: Form menjadi hang / freeze saat menekan tombol fetch data dari API.
* **Penyebab**: API dipanggil secara sinkron di UI thread.
* **Solusi**: Pastikan memanggil HttpClient menggunakan `async` dan `await`. Gunakan modifier `async void` untuk event handlers WinForms.
  ```csharp
  private async void btnLoad_Click(object sender, EventArgs e)
  {
      btnLoad.Enabled = false; // Mencegah double click
      try
      {
          var books = await _apiService.GetBooksAsync();
          dataGridView.DataSource = books;
      }
      finally
      {
          btnLoad.Enabled = true;
      }
  }
  ```

### Android Emulator localhost (10.0.2.2)
* **Isu**: Android app crash atau menampilkan `ConnectException` saat memanggil API local.
* **Penyebab**: Android emulator berjalan di VM terpisah, sehingga `localhost` merujuk ke emulator itu sendiri, bukan PC host.
* **Solusi**: Ganti baseUrl Retrofit menjadi `http://10.0.2.2:PORT/api/` (sesuaikan port IIS Express atau Kestrel API Anda).
* **Konfigurasi Network Security**: Tambahkan atribut `android:usesCleartextTraffic="true"` pada tag `<application>` di `AndroidManifest.xml` jika API local tidak menggunakan HTTPS.

---

# References
* ASP.NET Core & EF Core Official Guides
* Retrofit 2 Documentation
* Microsoft WinForms Desktop Guidelines
