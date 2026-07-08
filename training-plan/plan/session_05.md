# Sesi 5 - Full Integration + Simulasi Kompetisi

## Informasi Sesi
- **Durasi**: 2 jam (120 menit)
- **Fokus**: Bug fixing, polish, lalu simulasi business case LKS dengan time-pressure
- **Prerequisite**: Selesai Sesi 4 — CRUD WinForm via API berjalan, Retrofit Android minimal GET berjalan

## Tujuan Pembelajaran
- [ ] Siswa dapat mengidentifikasi dan memperbaiki bug integrasi end-to-end
- [ ] Siswa dapat menyelesaikan mini business case dalam kondisi time-pressure
- [ ] Siswa memahami strategi prioritisasi fitur saat kompetisi (bobot vs waktu)
- [ ] Siswa siap secara teknis dan mental untuk kompetisi

## Materi (120 menit)

### Review Homework + Bug Fixing (20 menit)
#### Review End-to-End (10 menit)
- Live test homework: API → WinForm → Android (semua berjalan bersamaan)
- Siswa demo hasil homework masing-masing client (WinForm & Android)
- Identifikasi bug atau kendala yang masih ada

#### Bug Fixing Session (10 menit)
- Perbaiki bug kritis yang teridentifikasi
- Prioritas: yang memblokir fungsionalitas utama
- Catat bug non-kritis sebagai "nice-to-fix" setelah kompetisi
- Tips: "Dalam kompetisi, jangan terpaku pada bug minor yang tidak menghalangi scoring"

---

### Polish & Penguatan Cepat (20 menit)

#### Checklist Sebelum Kompetisi (10 menit)
Review checklist teknis bersama:

**API (Clean Architecture):**
- [ ] Semua endpoint CRUD berjalan (GET all, GET by ID, POST, PUT, DELETE)
- [ ] `ApiResponse<T>` konsisten di semua endpoint
- [ ] Business logic sudah di service layer (tidak di controller)
- [ ] Global exception handler aktif
- [ ] Swagger dapat diakses

**WinForm:**
- [ ] DataGridView load dari API (bukan langsung DB)
- [ ] CRUD berjalan via API (Add, Edit, Delete)
- [ ] Tidak ada UI freeze (semua call pakai `async/await`)
- [ ] Pesan error user-friendly

**Android Kotlin:**
- [ ] List data tampil dari API via Retrofit
- [ ] Minimal 1 operasi POST berjalan
- [ ] Error state ditampilkan jika API tidak bisa diakses
- [ ] Tidak ada NetworkOnMainThreadException

#### Tips Kompetisi (10 menit)
- **Strategi bobot**: Modul B (Desktop) 30% — prioritas; Modul A/C (Mobile) 25% masing-masing
- **Time boxing**: Baca soal 10 menit, design DB 15 menit, API skeleton 20 menit, baru fitur per fitur
- **MVP first**: Buat yang pasti dinilai dulu, enhancement belakangan
- **Test setiap 20-30 menit**: Jangan baru test di akhir — bisa panik jika baru nemu bug
- **Jangan skip validasi**: Juri biasanya test edge case (input kosong, angka negatif, dll)

---

### 🏁 SIMULASI KOMPETISI — Business Case Mini (60 menit)

> **Aturan Simulasi**: Mentor membacakan soal, timer berjalan, siswa harus menyelesaikan sebanyak mungkin dalam waktu.

#### Soal Simulasi: "Mini Inventory System"

**Deskripsi Bisnis:**
Sebuah toko membutuhkan sistem manajemen sederhana. Buatlah:

**Modul API (Clean Architecture) — 25 menit:**
1. Entity: `Product` (Id, Name, Category, Price, Stock, CreatedAt)
2. Entity: `Transaction` (Id, ProductId, Quantity, Type[IN/OUT], Date, Notes)
3. Endpoint CRUD lengkap untuk Product
4. Endpoint POST untuk Transaction
5. Business Rule: jika Type = OUT dan Quantity > Product.Stock, return error 422
6. Endpoint GET: `api/products/low-stock` → kembalikan product dengan Stock < 10
7. `ApiResponse<T>` dan global exception handler harus aktif

**Modul WinForm — 20 menit:**
1. Form Daftar Produk: DataGridView load dari `api/products`, ada tombol Refresh
2. Tombol Tambah/Edit/Hapus produk via API
3. Form Transaksi: ComboBox product (load dari API), TextBox quantity, RadioButton IN/OUT
4. Tombol Submit Transaksi → POST ke `api/transactions`
5. Setelah transaksi berhasil, refresh DataGridView produk

**Modul Android — 15 menit:**
1. Halaman Daftar Produk: LazyColumn load dari `api/products`
2. Tampilkan Id, Name, Price, Stock
3. Jika Stock < 10, tampilkan teks "Stok Rendah" dengan warna merah
4. Pull-to-refresh atau tombol Refresh

#### Penilaian Simulasi
| Modul | Fitur | Nilai |
|-------|-------|-------|
| API | CRUD Product berjalan | 20 |
| API | Business rule stok + endpoint low-stock | 15 |
| API | ApiResponse konsisten + error handler | 10 |
| WinForm | CRUD via API + DataGridView | 25 |
| WinForm | Form transaksi berjalan | 15 |
| Android | List produk dari API | 10 |
| Android | Indikator stok rendah | 5 |
| **Total** | | **100** |

---

### Debrief & Final Tips (20 menit)

#### Review Hasil Simulasi (10 menit)
- Berapa poin yang berhasil diselesaikan?
- Modul mana yang paling memakan waktu?
- Apa yang bisa dilakukan lebih efisien?
- Diskusi: "Jika waktu kompetisi 6 jam, urutan pengerjaan yang ideal?"

#### Final Preparation Tips (10 menit)
- **Hari sebelum kompetisi**: Verifikasi semua software, setup environment bersih, tidur cukup
- **Awal kompetisi**: Baca soal penuh dulu, tentukan entities, buat ERD kasar di kertas
- **Urutan yang disarankan**: API skeleton → DB migration → CRUD + business logic → WinForm → Android
- **Jangan lupa**: Format tanggal ISO (YYYY-MM-DD), scrollbar jika konten panjang, form centered
- **Backup plan**: Jika satu modul macet, lompat ke modul lain dan kembali setelah

## Competition Day Checklist

### Sebelum Kompetisi
- [ ] Visual Studio terinstal dan membuka project tanpa error
- [ ] SQL Server service berjalan
- [ ] Postman/Swagger dapat diakses
- [ ] Android Studio + emulator berjalan normal
- [ ] `dotnet new webapi` bisa jalan (test di terminal)
- [ ] Tahu cara membuat solution Clean Architecture dari awal (hafal/contekan boleh)

### Urutan Pengerjaan yang Disarankan
1. **Baca soal** (10 menit) — identifikasi semua entity dan relasi
2. **Buat ERD** di kertas (10 menit) — jangan langsung coding
3. **API Skeleton** dengan Clean Architecture (20 menit) — create solution, domain, migration
4. **CRUD + Business Logic** (40 menit) — satu per satu entity
5. **WinForm Integration** (40 menit) — HttpClient, DataGridView, CRUD via API
6. **Android Integration** (30 menit) — Retrofit, list, minimal 1 form input
7. **Polish & Test** (30 menit) — test semua fitur, perbaiki bug, validasi

### Selama Kompetisi
- [ ] Test setiap fitur setelah selesai (jangan nunggu akhir)
- [ ] Jangan skip validasi dan error handling
- [ ] Prioritaskan fitur berbobot tinggi
- [ ] Jika stuck > 10 menit, skip dan lanjut yang lain

## Resources

### Referensi Akhir
- [ASP.NET Core Web API Documentation](https://learn.microsoft.com/en-us/aspnet/core/web-api/)
- [EF Core Documentation](https://learn.microsoft.com/en-us/ef/core/)
- [Retrofit Documentation](https://square.github.io/retrofit/)
- [Windows Forms Documentation](https://learn.microsoft.com/en-us/dotnet/desktop/winforms/)
- `Docs/competition-requirements-specification.md` — Baca ulang sebelum kompetisi
- `Docs-id/detailed-breakdown-id.md` — Versi Bahasa Indonesia

## Notes untuk Mentor

### Tips Menjalankan Simulasi
- Gunakan timer yang terlihat siswa (misal: timer di layar atau stopwatch)
- Jangan bantu terlalu banyak saat simulasi — biarkan siswa problem-solve sendiri
- Boleh hint jika siswa stuck > 5 menit di hal teknis minor
- Di akhir simulasi, berikan feedback yang konstruktif dan spesifik

### Common Issues Saat Simulasi
- Siswa lupa clean architecture → ingatkan kembali struktur folder
- Migration error → cek connection string
- WinForm UI freeze → ingatkan `async/await`
- Android tidak connect → ingatkan `10.0.2.2`

### Final Encouragement
- Siswa sudah belajar banyak dalam 5 sesi — acknowledge progress
- Focus pada apa yang sudah dikuasai, bukan apa yang belum
- Ingatkan: kompetisi bukan tentang perfect score, tapi tentang persiapan terbaik
- Beri contact mentor jika ada pertanyaan sebelum hari H

---

**Sesi**: 5 dari 5
**Durasi**: 2 jam
**Fokus**: Full Integration + Simulasi Kompetisi Business Case
