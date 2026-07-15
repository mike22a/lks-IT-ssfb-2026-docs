# Mentor Notes

## Digital Library Training Kit

---

## Purpose

Menyediakan panduan dan tips untuk mentor dalam mengajar training kit Digital Library.

---

## Scope

Dokumen ini mencakup:

- Tips mengajar
- Persiapan sebelum sesi
- Pertanyaan umum siswa
- Masalah yang diharapkan
- Panduan evaluasi

---

## Learning Objectives

Setelah membaca dokumen ini, mentor dapat:

- Memahami cara mengajar yang efektif
- Mempersiapkan materi sebelum sesi
- Menjawab pertanyaan umum siswa
- Mengantisipasi masalah yang mungkin terjadi
- Mengevaluasi hasil siswa dengan fair

---

## Prerequisites

- Mentor harus memahami .NET, Clean Architecture, dan Android
- Mentor harus membaca semua dokumentasi training kit

---

## Business Rules

- Mentor harus membaca dokumentasi sebelum sesi
- Mentor harus demo konsep sebelum siswa practice
- Mentor harus aktif membantu siswa saat practice
- Mentor harus review hasil practice di akhir sesi

---

## Design / Main Content

### Tips Mengajar

**1. Explain WHY before HOW**
- Jelaskan mengapa kita menggunakan Clean Architecture
- Jelaskan mengapa kita menggunakan Repository Pattern
- Jelaskan mengapa kita menggunakan DTO
- Siswa akan lebih mudah memahami jika tahu "mengapa"

**2. Demo dulu, Practice kemudian**
- Demo konsep dengan live coding
- Jelaskan langkah-langkah saat demo
- Beri kesempatan siswa bertanya
- Baru kemudian siswa practice

**3. Break Down into Small Steps**
- Jangan langsung ke fitur kompleks
- Mulai dari yang sederhana
- Tambah kompleksitas secara bertahap
- Pastikan setiap step dipahami sebelum lanjut

**4. Encourage Questions**
- Dorong siswa untuk bertanya
- Tidak ada pertanyaan yang bodoh
- Jawab dengan jelas dan sederhana
- Jika tidak tahu, katakan "kita cari bersama"

**5. Hands-on Learning**
- Lebih banyak practice daripada teori
- Siswa harus mengetik code sendiri
- Jangan biarkan siswa hanya copy-paste
- Monitor progress siswa saat practice

**6. Real-world Examples**
- Gunakan contoh yang relevan
- Hubungkan dengan industri nyata
- Jelaskan best practice industri
- Share pengalaman pribadi

### Persiapan Sebelum Sesi

**1 Hari Sebelum Sesi:**
- Baca dokumentasi sesi yang akan diajarkan
- Siapkan demo code
- Test demo code
- Siapkan environment (Visual Studio, SQL Server, dll)
- Siapkan slide (jika perlu)

**1 Jam Sebelum Sesi:**
- Pastikan semua software berjalan
- Pastikan database siap
- Pastikan API berjalan (untuk sesi 3-5)
- Pastikan internet connection stabil
- Siapkan coffee/snack (opsional)

**Checklist Persiapan:**
- [ ] Visual Studio terbuka dan siap
- [ ] SQL Server berjalan
- [ ] Database DigitalLibrary siap
- [ ] Demo code teruji
- [ ] Slide presentasi siap (jika ada)
- [ ] Internet connection stabil
- [ ] Catatan pertanyaan yang mungkin muncul

### Pertanyaan Umum Siswa

**Database:**
- Q: Mengapa kita perlu audit fields?
- A: Untuk tracking kapan record dibuat dan diupdate, penting untuk audit dan troubleshooting.

- Q: Mengapa menggunakan IDENTITY untuk primary key?
- A: Sederhana dan performa tinggi, tidak perlu generate UUID secara manual.

- Q: Mengapa perlu index?
- A: Untuk mempercepat query, terutama untuk kolom yang sering di-search atau di-join.

**Clean Architecture:**
- Q: Mengapa perlu Clean Architecture?
- A: Untuk memisahkan concern, membuat code maintainable, dan memudahkan testing.

- Q: Mengapa Domain layer tidak bergantung ke layer lain?
- A: Domain adalah core business logic, harus independent dari framework dan infrastructure.

- Q: Mengapa perlu Repository Pattern?
- A: Untuk abstraksi data access, memudahkan testing, dan memisahkan business logic dari data access.

**API:**
- Q: Mengapa perlu DTO?
- A: Untuk memisahkan entity dari API response, mengontrol data yang dikirim, dan validasi input.

- Q: Mengapa status code penting?
- A: Untuk memberi informasi yang jelas ke client tentang hasil request.

- Q: Mengapa perlu validation di API?
- A: Untuk mencegah invalid data masuk ke sistem, menjaga data integrity.

**WinForms:**
- Q: Mengapa perlu async untuk API call?
- A: Untuk tidak blocking UI thread, aplikasi tetap responsif saat loading.

- Q: Mengapa perlu disable button saat loading?
- A: Untuk mencegah double-click dan user confusion.

**Android:**
- Q: Mengapa perlu 10.0.2.2 untuk localhost?
- A: Karena emulator Android memiliki loopback sendiri, 10.0.2.2 adalah alias untuk host machine.

- Q: Mengapa perlu ViewModel?
- A: Untuk survive configuration changes (rotation) dan separate UI logic dari business logic.

### Masalah yang Diharapkan

**Technical Issues:**
1. **SQL Server tidak connect**
   - Solution: Check SQL Server service, check connection string, check firewall

2. **EF Core migration error**
   - Solution: Delete migration folder, recreate migration, check DbContext

3. **API tidak bisa diakses dari WinForms**
   - Solution: Check URL, check CORS, check firewall

4. **Android emulator tidak connect ke API**
   - Solution: Gunakan 10.0.2.2, check internet permission, check network

**Learning Issues:**
1. **Siswa tidak paham konsep**
   - Solution: Jelaskan dengan analogi, beri contoh sederhana, ulangi penjelasan

2. **Siswa stuck di bug**
   - Solution: Bantu debug, jangan langsung kasih solution, guide step by step

3. **Siswa copy-paste tanpa memahami**
   - Solution: Tanya penjelasan code, minta jelaskan line by line

4. **Siswa malas mengerjakan homework**
   - Solution: Jelaskan pentingnya homework, beri motivasi, beri deadline

**Pacing Issues:**
1. **Terlalu cepat**
   - Solution: Slow down, tanya apakah semua paham, beri waktu lebih banyak untuk practice

2. **Terlalu lambat**
   - Solution: Skip detail yang tidak penting, fokus ke core concept, beri homework untuk detail

### Panduan Evaluasi

**Kriteria Penilaian:**

1. **Understanding (40%)**
   - Apakah siswa memahami konsep?
   - Apakah siswa bisa menjelaskan "mengapa"?
   - Apakah siswa bisa mengaplikasikan konsep?

2. **Implementation (40%)**
   - Apakah code berfungsi?
   - Apakah code mengikuti best practice?
   - Apakah code clean dan readable?

3. **Problem Solving (20%)**
   - Apakah siswa bisa debug sendiri?
   - Apakah siswa bisa mencari solution?
   - Apakah siswa bisa adaptasi dengan masalah baru?

**Cara Evaluasi:**

1. **Review Code**
   - Check code quality
   - Check adherence to best practice
   - Check error handling

2. **Q&A Session**
   - Tanya konsep yang dipelajari
   - Tanya "mengapa" untuk setiap keputusan
   - Tanya cara menyelesaikan masalah

3. **Practical Test**
   - Beri task baru yang mirip
   - Lihat apakah siswa bisa apply konsep
   - Time limit untuk simulasi real condition

**Feedback yang Konstruktif:**

- Beri praise untuk hal yang baik
- Beri specific feedback untuk improvement
- Beri saran concrete untuk memperbaiki
- Beri resource untuk belajar lebih lanjut

### Tips untuk Siswa yang Lambat

1. **Identifikasi Masalah**
   - Apakah masalah teknis atau konsep?
   - Apakah kurang practice atau kurang penjelasan?

2. **Personalized Attention**
   - Beri waktu lebih banyak untuk practice
   - Beri penjelasan tambahan setelah sesi
   - Beri resource tambahan untuk belajar

3. **Pair Programming**
   - Pair dengan siswa yang lebih cepat
   - Mentor guide langsung
   - Siswa observe dan ikuti

4. **Simplified Tasks**
   - Beri task yang lebih sederhana dulu
   - Tambah kompleksitas secara bertahap
   - Fokus ke core concept dulu

### Tips untuk Siswa yang Cepat

1. **Challenge Tasks**
   - Beri task tambahan yang lebih menantang
   - Beri task untuk explore fitur advanced
   - Beri task untuk refactor code

2. **Teaching Others**
   - Minta bantu siswa yang lambat
   - Minta jelaskan konsep ke teman
   - Minta review code teman

3. **Advanced Topics**
   - Jelaskan topik advanced (unit testing, CI/CD, dll)
   - Jelaskan design pattern tambahan
   - Jelaskan best practice industri

---

## Implementation Notes

- Mentor harus fleksibel sesuai kondisi siswa
- Jangan terlalu strict dengan timeline
- Fokus ke pemahaman, bukan kecepatan
- Selalu beri feedback yang konstruktif

---

## Common Mistakes

- Mentor terlalu cepat, siswa tidak bisa follow
- Mentor tidak demo, langsung minta siswa practice
- Mentor tidak aktif membantu saat practice
- Mentor tidak review hasil practice
- Mentor tidak menjawab pertanyaan dengan jelas

---

## Exercises

1. Siapkan demo code untuk setiap sesi
2. Buat checklist pertanyaan yang mungkin muncul
3. Siapkan slide presentasi (opsional)
4. Test semua demo code sebelum sesi
5. Siapkan resource tambahan untuk siswa

---

## Homework

1. Review dokumentasi sebelum setiap sesi
2. Siapkan environment development
3. Test demo code
4. Siapkan jawaban untuk pertanyaan umum
5. Siapkan criteria evaluasi

---

## References

- [Teaching Programming Best Practices](https://www.acm.org/education/curricula-recommendations)
- [How to Teach Coding](https://www.codecademy.com/resources/blog/how-to-teach-coding)

---

## Related Documents

- [evaluation_checklist.md](./evaluation_checklist.md) - Checklist evaluasi
- [../../docs/09-training-roadmap.md](../docs/09-training-roadmap.md) - Training roadmap
