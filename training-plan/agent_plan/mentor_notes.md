# Mentor Notes - Program Pelatihan LKS IT Software Solution for Business

## Catatan Umum

### Background Mentor
- .NET Developer dengan pengalaman DevExpress (lama)
- Fokus utama: API .NET dan integrasi dengan Desktop & Mobile
- Akan mengajarkan Clean Architecture API yang menjadi backbone semua modul

### Timeline
- **Tanggal Kompetisi**: 27 Juli 2026 (earliest)
- **Periode Pelatihan**: 10-14 Juli 2026
- **Total Sesi**: 5 sesi
- **Durasi per Sesi**: 2 jam
- **Total Waktu**: 10 jam

### Background Siswa
- **Android Kotlin**: Sudah mahir (Jetpack Compose, Coroutines)
- **Windows Forms**: Sudah pernah hands-on, bisa CRUD sederhana
- **API .NET**: Area baru — fokus utama pelatihan
- **Clean Architecture**: Belum pernah — harus diajarkan dari sesi 1

---

## Catatan per Sesi

### Sesi 1: API Kickoff + Clean Architecture Foundation (10 Juli)
**Fokus:** Quick assessment, setup environment, pengenalan Clean Architecture, skeleton project

**Preparation:**
- Siapkan contoh solution Clean Architecture yang sudah jadi sebagai referensi
  - 📖 Gunakan **`training-plan/dotnet-api-example/01-BookstoreApi-GUIDE.md`** sebagai referensi utama (Langkah 1-4)
- Siapkan perintah `dotnet CLI` untuk dibuat skeleton project
- Tentukan domain bisnis bersama siswa di awal sesi (misal: Inventory, Sales, Library)
- Minta siswa membuka `dotnet-api-example/01-BookstoreApi/` sebagai contoh nyata yang bisa dijalankan

**Tips:**
- Assessment hanya 20 menit — siswa sudah capable, jangan habiskan waktu di review
- Bangun mental model dulu: gambar diagram 4 layer sebelum coding
- Pastikan skeleton project bisa di-build (`dotnet build` 0 error) sebelum sesi selesai
- Gunakan analogi nyata: "Domain = aturan bisnis yang tidak berubah walau pakai DB apapun"

**Common Pitfalls:**
- Circular dependency antar project (verifikasi arah referensi)
- Entity dibuat di project yang salah (harus di Domain, bukan API)
- Siswa bingung "terlalu banyak project" — jelaskan manfaat separation

**Notes:**
- Catat domain bisnis yang dipilih — akan dipakai konsisten hingga sesi 4
- Verifikasi semua software terinstall di awal sesi (5 menit pertama)

---

### Sesi 2: Application Layer + Infrastructure Layer (11 Juli)
**Fokus:** DTOs, Service Interface & Implementation, EF DbContext, Generic Repository, Migration

**Preparation:**
- Review entity yang dibuat siswa dari homework
- Siapkan contoh DTO lengkap (Dto, CreateRequest, UpdateRequest)
  - 📖 Referensi: `training-plan/dotnet-api-example/01-BookstoreApi-GUIDE.md` Langkah 5 (Application Layer)
- Siapkan contoh Repository per entity yang sudah jadi (bukan Generic Repository)
- Siapkan contoh AppDbContext dengan relasi dan seed data
  - 📖 Referensi: `training-plan/dotnet-api-example/01-BookstoreApi-GUIDE.md` Langkah 6 (Infrastructure Layer)

**Tips:**
- Tekankan: "DTO ≠ Entity" — entity untuk DB, DTO untuk API response
- Demo mapping manual Entity → DTO (jangan pakai AutoMapper dulu)
- Pastikan migration berhasil dan tabel terbuat di SSMS sebelum sesi selesai
- Jika siswa lambat: fokus ke 1 entity dulu secara end-to-end, sisanya di homework

**Common Pitfalls:**
- Lupa tambahkan `Microsoft.EntityFrameworkCore.Design` ke API project (diperlukan migration)
- Connection string salah format
- Service inject DbContext langsung (harusnya lewat IRepository)
- Migration dijalankan di project yang salah (selalu gunakan `--startup-project`)

**Notes:**
- Cek database di SSMS sebelum sesi selesai — ini jadi fondasi sesi 3 dan 4
- Seed data sangat penting untuk testing di sesi berikutnya

---

### Sesi 3: Controllers + Business Logic + Error Handling (12 Juli)
**Fokus:** Controller clean pattern, ApiResponse<T> wrapper, business logic di service layer, Global Exception Middleware

**Preparation:**
- Siapkan contoh Controller lengkap dengan ApiResponse
  - 📖 Referensi: `training-plan/dotnet-api-example/01-BookstoreApi-GUIDE.md` Langkah 7 (API Layer)
- Siapkan contoh GlobalExceptionHandler (menggunakan `IExceptionHandler` di .NET 8, bukan Middleware manual)
- Siapkan contoh business rule (validasi duplikat, stok tidak cukup, kalkulasi)
  - 📖 Contoh advanced: `training-plan/dotnet-api-example/03-HotelApi-GUIDE.md` Langkah 5 (ReservationService state machine)

**Tips:**
- Demo live: "throw exception di service → lihat middleware tangkap → lihat format response"
- Tekankan: "Controller itu thin — hanya orchestrate, tidak ada logic"
- Gunakan Swagger untuk demo — lebih visual dan mudah dipahami
- Jika waktu kurang: skip custom exception, pakai generic Exception saja untuk sementara

**Common Pitfalls:**
- Business logic bocor ke Controller (paling sering terjadi — harus diperbaiki)
- Middleware tidak didaftarkan dengan urutan yang benar di Program.cs
- Controller tidak async padahal service-nya async
- Status code tidak tepat (POST berhasil harusnya 201, bukan 200)

**Notes:**
- Di akhir sesi ini, API harus sudah 100% berjalan: CRUD, business logic, error handling, Swagger
- Catat base URL dan port API — akan dibutuhkan di sesi 4 untuk WinForm dan Android

---

### Sesi 4: Link API ke WinForm + Android Kotlin (13 Juli)
**Fokus:** HttpClient di WinForm (CRUD via API), Retrofit di Android Kotlin (GET + POST)

**Preparation:**
- Pastikan API dari sesi 3 masih running sebelum sesi dimulai
- Siapkan contoh ApiClient wrapper HttpClient untuk WinForm
- Siapkan contoh Retrofit setup untuk Android Kotlin
- Ingatkan: emulator Android akses localhost via `10.0.2.2`

**Tips:**
- Bagi waktu: ~45 menit WinForm, ~45 menit Android, ~15 menit review + self-practice
- Momen "wow": test live — tambah dari WinForm → refresh Android → data muncul
- Jika siswa sudah sangat kuat di salah satu platform, alokasikan lebih ke yang lemah
- WinForm: tekankan `async/await` — UI freeze adalah kesalahan paling umum

**Common Pitfalls:**
- WinForm: HttpClient di-instantiate per request (harusnya singleton)
- WinForm: API call tidak di-`await` → UI freeze atau NullReferenceException
- Android: `localhost` vs `10.0.2.2` — sering tertukar
- Android: lupa tambahkan INTERNET permission → silent failure

**Notes:**
- Verifikasi akhir sesi: API running, WinForm load data dari API, Android load data dari API
- Ini titik di mana "big picture" terbentuk — siswa harus melihat satu data source, dua client

---

### Sesi 5: Full Integration + Simulasi Kompetisi (14 Juli)
**Fokus:** Bug fixing, competition checklist, timed business case simulation, debrief

**Preparation:**
- Siapkan soal simulasi (atau gunakan soal di session_05.md)
- Siapkan timer yang terlihat oleh siswa
- Siapkan rubrik penilaian simulasi (ada di session_05.md)
- Review homework siswa sebelum sesi — identifikasi bug yang belum terpecahkan

**Tips:**
- Saat simulasi berlangsung: jangan bantu terlalu banyak — biarkan siswa problem-solve sendiri
- Boleh hint jika siswa stuck > 5 menit di hal teknis minor
- Debrief harus konstruktif: "Kamu berhasil X dari Y — ini sudah bagus, fokus perbaiki Z"
- Berikan kontak untuk pertanyaan antara 14-27 Juli

**Common Pitfalls:**
- Siswa lupa Clean Architecture structure saat pressure → ingatkan dengan diagram
- Siswa terlalu perfeksionis → ingatkan "MVP first"
- Waktu habis sebelum semua modul selesai → ini normal, diskusikan prioritas

**Notes:**
- Ini sesi terakhir — pastikan siswa meninggalkan dengan confidence, bukan kebingungan
- Berikan summary: "Kamu sudah bisa X, Y, Z — ini sudah cukup untuk bersaing"

---

## Catatan Umum Pelatihan

### Software yang Diperlukan
- **Visual Studio 2022** Community Edition (workload: **ASP.NET and web development** + **.NET desktop development**)
- **.NET 8 SDK** (`dotnet --version` harus menampilkan `8.x.x`)
- **SQL Server 2022** (LocalDB sudah cukup untuk latihan) — atau **SQLite** sebagai alternatif yang lebih ringan
  - Project contoh di folder `dotnet-api-example/` menggunakan SQLite secara default (switchable ke SQL Server)
- **SQL Server Management Studio (SSMS)** — opsional jika memakai SQLite
- **Postman** atau gunakan Swagger UI yang sudah built-in
- **Android Studio** (Meerkat / terbaru) dengan emulator AVD yang sudah terkonfigurasi
- **Android SDK API Level 34** (sesuai requirement kompetisi)

### Clean Architecture Reference
```
Solution: BusinessApp
├── BusinessApp.Domain/          → Entities, Interfaces, Exceptions
├── BusinessApp.Application/     → DTOs, Service Interfaces, Services
├── BusinessApp.Infrastructure/  → AppDbContext, Repositories, Migrations
└── BusinessApp.API/             → Controllers, Middleware, Models, Program.cs
```

**Dependency Rules:**
- API → Application, Infrastructure
- Application → Domain
- Infrastructure → Application, Domain
- Domain → (tidak ada dependency ke project lain)

### Common Issues dan Solutions

#### Database Connection Issues
- Check connection string di `appsettings.json`
- Pastikan SQL Server service berjalan (Windows Services)
- Cek firewall settings
- Use SSMS untuk verifikasi

#### Migration Issues
- Selalu gunakan `--project` dan `--startup-project` flag
- Pastikan `Microsoft.EntityFrameworkCore.Design` ada di API project
- Jika migration error: `dotnet ef database drop` lalu buat ulang

#### API Issues
- Check apakah API running (buka browser ke Swagger)
- Verify port number (cek `launchSettings.json`)
- Check CORS jika ada error cross-origin dari WinForm

#### WinForm Async Issues
- Semua API call harus `await` — gunakan `async void` untuk event handler
- Jangan gunakan `.Result` atau `.Wait()` — menyebabkan deadlock
- Refresh DataGridView dengan `.DataSource = null` dulu, baru set ulang

#### Android Issues
- Emulator: gunakan `10.0.2.2` bukan `localhost`
- Device fisik: gunakan IP komputer di jaringan yang sama
- Tambahkan `android:usesCleartextTraffic="true"` di manifest jika menggunakan HTTP
- Check INTERNET permission di AndroidManifest.xml

---

**Versi Dokumen**: 2.1 (Direvisi 9 Juli 2026)
**Kompetisi**: LKS DIKMEN Nasional 2026 - IT Software Solution for Business

---

## Dokumen Terkait
| Dokumen | Lokasi | Kegunaan |
|---------|--------|----------|
| Quick Reference / Cheat Sheet | `agent_plan/mentor_cheatsheet.md` | Referensi cepat commands & template |
| Session Plans | `plan/session_01.md` hingga `session_05.md` | Rencana detail per sesi |
| Homework | `assignments/hw_01.md` hingga `hw_05.md` | Tugas siswa |
| API Guides | `dotnet-api-example/0X-*-GUIDE.md` | Step-by-step contoh proyek |
