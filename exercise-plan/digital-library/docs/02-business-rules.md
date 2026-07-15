# Business Rules

## Digital Library Training Kit

---

## Purpose

Menjelaskan aturan bisnis, workflow, dan validasi yang berlaku dalam sistem Digital Library.

---

## Scope

Dokumen ini mencakup:

- Workflow peminjaman buku
- Workflow pengembalian buku
- Aturan validasi
- Constraints dan batasan
- Use cases
- Edge cases

---

## Learning Objectives

Setelah membaca dokumen ini, siswa dapat:

- Memahami workflow peminjaman buku
- Memahami workflow pengembalian buku
- Mengidentifikasi aturan validasi yang diperlukan
- Memahami constraints dan batasan sistem
- Mengenali use cases utama
- Menangani edge cases yang mungkin terjadi

---

## Prerequisites

- Sudah membaca [01-project-overview.md](./01-project-overview.md)
- Memahami konsep dasar sistem perpustakaan

---

## Business Rules

### Workflow Peminjaman Buku

```
User → Pilih Buku → Validasi Stok → Validasi Max 3 Buku → Create Peminjaman → Update Stok → Success
```

**Langkah-langkah:**

1. **User Selection**
   - User memilih buku yang ingin dipinjam
   - System menampilkan daftar buku yang tersedia
   - User bisa memilih maksimal 3 buku

2. **Validasi Stok**
   - Setiap buku harus memiliki stok > 0
   - Jika stok = 0, buku tidak bisa dipinjam
   - System menampilkan pesan error jika stok habis

3. **Validasi Max 3 Buku**
   - Satu peminjaman maksimal 3 buku
   - System menolak jika user memilih > 3 buku
   - User harus mengurangi jumlah buku

4. **Create Peminjaman**
   - System membuat record peminjaman (header)
   - System membuat record detail untuk setiap buku
   - Set tanggal peminjaman = hari ini
   - Set tanggal jatuh tempo = 7 hari ke depan

5. **Update Stok**
   - System mengurangi stok setiap buku yang dipinjam
   - Stok berkurang sesuai jumlah buku yang dipinjam
   - Update dilakukan secara atomic

6. **Success**
   - System menampilkan konfirmasi peminjaman berhasil
   - System menampilkan detail peminjaman
   - User mendapatkan nomor peminjaman

### Workflow Pengembalian Buku

```
User → Input No Peminjaman → Validasi Status → Update Status → Update Stok → Hitung Denda → Success
```

**Langkah-langkah:**

1. **Input No Peminjaman**
   - User memasukkan nomor peminjaman
   - System mencari peminjaman berdasarkan nomor

2. **Validasi Status**
   - Peminjaman harus dalam status "Dipinjam"
   - System menolak jika sudah dikembalikan
   - System menolak jika nomor tidak ditemukan

3. **Update Status**
   - System update status peminjaman menjadi "Dikembalikan"
   - Set tanggal pengembalian = hari ini
   - Update semua detail peminjaman

4. **Update Stok**
   - System menambah stok setiap buku yang dikembalikan
   - Stok bertambah sesuai jumlah buku
   - Update dilakukan secara atomic

5. **Hitung Denda** (Opsional)
   - Jika terlambat > 7 hari, hitung denda
   - Denda = Rp 500 per hari keterlambatan
   - System menampilkan total denda

6. **Success**
   - System menampilkan konfirmasi pengembalian berhasil
   - System menampilkan detail pengembalian
   - System menampilkan denda (jika ada)

### Aturan Validasi

**Validasi Kategori:**
- Nama kategori tidak boleh kosong
- Nama kategori maksimal 50 karakter
- Nama kategori harus unik

**Validasi Buku:**
- Judul buku tidak boleh kosong
- Judul buku maksimal 200 karakter
- Penulis tidak boleh kosong
- Penulis maksimal 100 karakter
- Penerbit maksimal 100 karakter
- Tahun terbit harus valid (4 digit)
- Stok tidak boleh negatif
- Stok default = 0
- Kategori harus dipilih

**Validasi User:**
- Nama tidak boleh kosong
- Nama maksimal 100 karakter
- Email harus valid format (jika ada)
- No telepon harus valid (jika ada)
- Alamat maksimal 200 karakter

**Validasi Peminjaman:**
- User harus dipilih
- Minimal 1 buku harus dipilih
- Maksimal 3 buku bisa dipilih
- Semua buku harus memiliki stok > 0
- User tidak boleh memiliki peminjaman aktif > 3 (opsional)

### Constraints dan Batasan

**Constraints Database:**
- Primary Key: Auto-increment integer
- Foreign Key: Cascade delete untuk detail
- Unique: Nama kategori, email user (jika ada)
- Not Null: Field wajib diisi
- Default: Stok = 0, CreatedAt = GETDATE()

**Constraints Bisnis:**
- Maksimal 3 buku per peminjaman
- Maksimal peminjaman aktif per user = 3 (opsional)
- Durasi peminjaman = 7 hari
- Denda = Rp 500/hari keterlambatan (opsional)

**Constraints UI:**
- Desktop: Single user session
- Mobile: Read-only untuk user biasa
- API: Rate limiting (opsional)

### Use Cases

**UC-01: Manage Categories**
- Actor: Admin
- Description: Admin dapat menambah, mengedit, menghapus kategori
- Precondition: Admin login
- Postcondition: Kategori tersimpan di database

**UC-02: Manage Books**
- Actor: Admin
- Description: Admin dapat menambah, mengedit, menghapus buku
- Precondition: Admin login, kategori tersedia
- Postcondition: Buku tersimpan di database

**UC-03: Manage Users**
- Actor: Admin
- Description: Admin dapat menambah, mengedit, menghapus user
- Precondition: Admin login
- Postcondition: User tersimpan di database

**UC-04: Borrow Books**
- Actor: Admin/User
- Description: User dapat meminjam buku
- Precondition: User terdaftar, buku tersedia
- Postcondition: Peminjaman tercatat, stok berkurang

**UC-05: Return Books**
- Actor: Admin/User
- Description: User dapat mengembalikan buku
- Precondition: Peminjaman aktif ada
- Postcondition: Peminjaman selesai, stok bertambah

**UC-06: View Borrowing History**
- Actor: Admin/User
- Description: User dapat melihat histori peminjaman
- Precondition: User terdaftar
- Postcondition: Histori ditampilkan

### Edge Cases

**Edge Case 1: Stok Habis**
- Scenario: User ingin meminjam buku dengan stok = 0
- Handling: Tampilkan pesan "Buku tidak tersedia"
- Implementation: Cek stok sebelum create peminjaman

**Edge Case 2: User Memilih > 3 Buku**
- Scenario: User memilih 4 buku dalam satu peminjaman
- Handling: Tampilkan pesan "Maksimal 3 buku per peminjaman"
- Implementation: Validasi jumlah buku di UI dan API

**Edge Case 3: Pengembalian Ganda**
- Scenario: User mencoba mengembalikan buku yang sudah dikembalikan
- Handling: Tampilkan pesan "Peminjaman sudah selesai"
- Implementation: Cek status peminjaman sebelum update

**Edge Case 4: Peminjaman Tidak Ditemukan**
- Scenario: User memasukkan nomor peminjaman yang salah
- Handling: Tampilkan pesan "Peminjaman tidak ditemukan"
- Implementation: Cek existence di database

**Edge Case 5: Kategori Dipakai oleh Buku**
- Scenario: Admin mencoba menghapus kategori yang masih dipakai buku
- Handling: Tampilkan pesan "Kategori tidak bisa dihapus karena masih dipakai"
- Implementation: Cek referensi sebelum delete

**Edge Case 6: User Memiliki Banyak Peminjaman Aktif**
- Scenario: User sudah memiliki 3 peminjaman aktif
- Handling: Tampilkan pesan "User sudah mencapai batas peminjaman"
- Implementation: Cek jumlah peminjaman aktif sebelum create baru

---

## Implementation Notes

- Validasi harus dilakukan di dua tempat: UI dan API
- Gunakan transaction untuk update stok (atomic operation)
- Error message harus jelas dan user-friendly
- Log semua operasi penting (create, update, delete)
- Gunakan status code HTTP yang benar (200, 201, 400, 404, 500)

---

## Common Mistakes

- Tidak validasi stok sebelum peminjaman
- Tidak menggunakan transaction untuk update stok
- Error message tidak jelas
- Tidak handle edge cases
- Validasi hanya di UI, tidak di API

---

## Exercises

1. Gambar flowchart untuk workflow peminjaman
2. Gambar flowchart untuk workflow pengembalian
3. Identifikasi 3 edge cases lain yang mungkin terjadi
4. Buat tabel validasi untuk setiap entity
5. Jelaskan mengapa transaction penting untuk update stok

---

## Homework

1. Implement validasi stok di pseudo-code
2. Implement validasi max 3 buku di pseudo-code
3. Buat test case untuk edge case stok habis
4. Buat test case untuk edge case pengembalian ganda
5. Design error message untuk semua edge cases

---

## References

- [Business Rules Documentation Best Practices](https://www.oreilly.com/library/view/business-rules/9780596000272/)
- [Use Case Documentation](https://www.ibm.com/docs/en/rational-rose/7.0?topic=diagrams-use-case-diagrams)

---

## Related Documents

- [01-project-overview.md](./01-project-overview.md) - Overview project
- [03-database-design.md](./03-database-design.md) - Desain database
- [05-api-design.md](./05-api-design.md) - API endpoint design
