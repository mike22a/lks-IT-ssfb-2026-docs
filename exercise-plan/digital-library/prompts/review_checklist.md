# Quality Control & Review Checklist

## Digital Library Project

---

# Purpose

Menyediakan panduan audit mandiri (self-review) yang konkret bagi siswa untuk memastikan bahwa kode mereka bebas dari bug umum dan memenuhi spesifikasi kompetensi LKS SSFB sebelum beralih ke task berikutnya.

---

# Scope

Checklist ini berlaku untuk:
* Schema & Constraints Database SQL Server
* REST API dan Layer Abstraksi Clean Architecture
* Validasi Input dan Pola Async pada WinForms UI
* Penggunaan Retrofit dan RecyclerView di Android Client

---

# Learning Objectives

* Mengembangkan insting quality control (QC) mandiri
* Memahami pentingnya edge-case testing
* Mengurangi ketergantungan pada pengecekan manual oleh mentor

---

# Prerequisites

* Memiliki file REST Client (seperti Postman) terinstall
* Memahami cara membaca error log / debug console

---

# 1. Database & SQL Server Checklist

* [ ] **Foreign Keys**: Semua foreign keys (`CategoryId` di Books, `UserId` di Borrowings, dll) didefinisikan secara eksplisit.
* [ ] **Cascading**: Relasi antara `Borrowing` dan `BorrowingDetail` menggunakan `ON DELETE CASCADE` sehingga jika borrowing dihapus, detailnya ikut terhapus secara otomatis.
* [ ] **Indexes**: Kolom pencarian seperti `Title` pada Books memiliki non-clustered index untuk optimalisasi performa query.
* [ ] **Audit Fields**: Kolom `CreatedAt` dan `UpdatedAt` ada di setiap tabel dengan default value `GETDATE()`.
* [ ] **Constraint Check**: Kolom `Stock` memiliki constraint agar tidak bisa bernilai negatif (`Stock >= 0`).

---

# 2. REST API & Architecture Checklist

* [ ] **Strict Layering**: Proyek `Domain` sama sekali tidak mereferensikan library Entity Framework.
* [ ] **No Entity Leakage**: Proyek `API` tidak mengembalikan class entity Domain (misal `Book`) ke client. Semua return object wajib berupa `BookDto` atau objek response wrapper.
* [ ] **Error Handling**: Exception yang tidak terduga ditangkap oleh Global Exception Middleware dan mengembalikan status code `500 Internal Server Error` dengan format payload JSON yang seragam (tidak membocorkan stack trace ke user).
* [ ] **HTTP Status Codes**:
  - `200 OK` untuk GET/PUT yang berhasil.
  - `201 Created` untuk POST yang berhasil.
  - `400 Bad Request` untuk input validation error.
  - `404 Not Found` ketika data ID tidak ada di database.

---

# 3. Desktop (WinForms) Client Checklist

* [ ] **Non-Blocking UI**: Tombol "Fetch" atau "Save" tidak membuat window program bertuliskan "(Not Responding)" saat diproses.
* [ ] **State Control**: Tombol dikunci (disabled) ketika proses asynchronous API sedang berjalan untuk menghindari multi-submit data.
* [ ] **Validation UI**: Input bertipe angka (seperti Stock) divalidasi agar tidak menerima karakter huruf sebelum dikirimkan ke API.
* [ ] **Error Popups**: Setiap kegagalan koneksi API ditangani dengan try-catch dan memunculkan `MessageBox.Show` yang ramah pengguna (bukan membiarkan aplikasi crash).

---

# 4. Mobile (Android) Client Checklist

* [ ] **Network Configuration**: Atribut `cleartextTraffic` dikonfigurasi dengan benar untuk koneksi HTTP local (`10.0.2.2`).
* [ ] **Loading Feedback**: Indikator progress (seperti `ProgressBar`) tampil secara visual saat data sedang dimuat dari Retrofit.
* [ ] **Zero Crash on Disconnect**: Aplikasi tidak langsung crash (force close) ketika koneksi internet PC host diputus secara mendadak. Aplikasi harus menampilkan visual `Snackbar` atau `Toast` informasi error jaringan.
* [ ] **Recycler View Performance**: Tidak ada duplikasi item list saat list buku di-scroll ke bawah dan ke atas.

---

# Exercises & Testing Scenario

Lakukan pengujian manual skenario berikut:
1. Matikan service database SQL Server Anda, lalu jalankan aplikasi WinForms. Apakah program menampilkan pesan error koneksi yang jelas atau langsung hang?
2. Kirim request POST ke endpoint `/api/borrowings` dengan body user yang tidak terdaftar. Pastikan response code yang Anda terima adalah `400` atau `404`, bukan `500`.
