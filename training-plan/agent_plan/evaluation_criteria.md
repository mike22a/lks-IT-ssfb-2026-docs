# Evaluation Criteria - Program Pelatihan LKS IT Software Solution for Business

## Kriteria Penilaian Pelatihan

### Penilaian per Sesi

#### Completion Rate (40%)
- Apakah siswa menyelesaikan semua tugas dalam sesi?
- Apakah siswa mengikuti semua instruksi?
- Apakah siswa aktif berpartisipasi?

#### Code Quality (30%)
- Apakah kode mengikuti best practices?
- Apakah kode readable dan well-structured?
- Apakah naming conventions konsisten?
- Apakah ada comments yang tepat?

#### Understanding (20%)
- Apakah siswa memahami konsep yang diajarkan?
- Apakah siswa dapat menjelaskan implementasinya?
- Apakah siswa dapat menjawab pertanyaan dengan benar?

#### Time Management (10%)
- Apakah siswa menyelesaikan tugas dalam batas waktu?
- Apakah siswa mengelola waktu dengan efektif?

### Penilaian Homework

#### Timeliness (30%)
- Apakah homework selesai sebelum deadline?
- Apakah homework dikumpulkan tepat waktu?

#### Quality (40%)
- Apakah homework memenuhi semua requirements?
- Apakah implementasi benar?
- Apakah error handling proper?

#### Completeness (30%)
- Apakah semua tugas selesai?
- Apakah ada bagian yang terlewat?

## Checkpoint Evaluation

### Checkpoint 1 (Setelah Sesi 2) — API Readiness
**Kriteria:**
- [ ] Clean Architecture solution terbuat (`dotnet build` 0 error)
- [ ] AppDbContext + migration berhasil (tabel terbuat)
- [ ] CRUD endpoints berjalan di Swagger
- [ ] `ApiResponse<T>` konsisten
- [ ] Business logic di service layer (bukan controller)

**Pass/Fail:**
- **Pass**: Lanjut ke Sesi 3 dengan percaya diri
- **Fail**: Review bersama mentor, target selesai sebelum Sesi 3 dimulai

### Checkpoint 2 (Setelah Sesi 4) — Integration Readiness
**Kriteria:**
- [ ] WinForm CRUD via API berjalan (tidak ada UI freeze)
- [ ] Android GET dari API berjalan (LazyColumn tampil data)
- [ ] API, WinForm, Android bisa berjalan bersamaan
- [ ] End-to-end flow terbukti: tambah dari WinForm → tampil di Android

**Pass/Fail:**
- **Pass**: Lanjut ke Sesi 5 (simulasi kompetisi)
- **Fail**: Extra practice hari H+1, prioritaskan bug yang memblokir integrasi

### Checkpoint Final (Setelah Sesi 5) — Competition Readiness
**Kriteria:**
- [ ] Bisa membuat ulang Clean Architecture API dari awal dalam < 30 menit
- [ ] Bisa buat WinForm CRUD via API dalam < 45 menit
- [ ] Bisa buat Android list dari API dalam < 30 menit
- [ ] Semua common pitfall sudah pernah dihadapi dan diselesaikan
- [ ] Checklist kompetisi sudah diverifikasi di komputer yang akan dipakai

**Pass/Fail:**
- **Pass**: Siap untuk kompetisi (27 Juli 2026)
- **Fail**: Fokus latihan mandiri + hubungi mentor untuk sesi Q&A tambahan

## Kriteria Penilaian Kompetisi (Resmi)

### Modul A & C: Mobile Android (25% masing-masing)
**Measurement Scoring (Binary):**
| Aspect | Max Mark |
|--------|----------|
| Database Design | 0.15 |
| API Implementation | 0.25 |
| Business Logic | 0.20 |
| API Response Format | 0.10 |
| Error Handling | 0.10 |
| Mobile UI | 0.10 |
| API Integration | 0.15 |
| CRUD Operations | 0.20 |
| Search Functionality | 0.10 |
| Filter Functionality | 0.10 |
| Data Export | 0.05 |
| Validation | 0.05 |

### Modul B: Desktop .NET (30%)
**Measurement Scoring (Binary):**
| Aspect | Max Mark |
|--------|----------|
| Database Connection | 0.20 |
| Data Import | 0.15 |
| CRUD Operations | 0.25 |
| Search & Filter | 0.10 |
| Query JOIN | 0.10 |
| Query Aggregate | 0.05 |
| Data Visualization | 0.10 |
| Input Validation | 0.05 |
| Access Control | 0.05 |
| Error Handling | 0.05 |

### Modul D: Software Design (20%)
**Judgement Scoring (0-3 Scale):**
| Score | Description |
|-------|-------------|
| 0 | Below Industry Standard |
| 1 | Meets Industry Standard |
| 2 | Exceeds Industry Standard |
| 3 | Extraordinary |

## Self-Assessment Checklist

### Sebelum Kompetisi
- [ ] Semua software terinstal dan berfungsi
- [ ] API berjalan dan dapat diakses
- [ ] Database sudah siap dengan sample data
- [ ] Desktop apps lengkap dan tested
- [ ] Mobile apps lengkap dan tested
- [ ] Semua requirements terpenuhi
- [ ] Time management strategy dipersiapkan

### Selama Kompetisi
- [ ] Requirements dibaca dengan teliti
- [ ] Fitur diprioritaskan berdasarkan bobot
- [ ] Waktu dikelola secara efektif
- [ ] Semua functionality di-tested
- [ ] Validasi dan error handling tidak diabaikan
- [ ] Format tanggal sesuai ISO (YYYY-MM-DD)
- [ ] Formulir terpusat di layar
- [ ] Scrollbar ditampilkan jika perlu

## Feedback Mechanism

### Feedback Format
**Positif:**
- Apa yang dilakukan dengan baik
- Apa yang perlu dipertahankan

**Constructive:**
- Apa yang perlu diperbaiki
- Bagaimana cara memperbaikinya
- Resources untuk belajar lebih lanjut

### Frequency
- **Setiap sesi**: Feedback langsung
- **Setiap checkpoint**: Evaluasi komprehensif
- **Final**: Assessment keseluruhan

## Improvement Plan

### Jika Tidak Lulus Checkpoint
1. Identifikasi area yang lemah
2. Berikan extra practice
3. Berikan resources tambahan
4. Schedule review session
5. Re-evaluate sebelum lanjut

### Jika Progress Lambat
1. Kurangi complexity
2. Fokus pada fundamentals
3. Berikan lebih banyak guidance
4. Increase practice time
5. Adjust timeline jika perlu

---

**Versi Dokumen**: 1.1 (Direvisi 9 Juli 2026)
**Kompetisi**: LKS DIKMEN Nasional 2026 - IT Software Solution for Business
