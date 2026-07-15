# Review Checklist

## Digital Library Training Kit

---

## Purpose

Menyediakan checklist untuk review kualitas implementasi sebelum dianggap selesai.

---

## Scope

Dokumen ini mencakup:

- Definition of Done
- Review checklist
- Quality checklist
- Testing checklist
- Documentation checklist

---

## Learning Objectives

Setelah menggunakan checklist ini, siswa dapat:

- Memahami kriteria "done"
- Review code dengan sistematis
- Memastikan kualitas code
- Memastikan testing adequate
- Memastikan dokumentasi lengkap

---

## Prerequisites

- Implementasi sudah selesai
- Sudah membaca semua dokumentasi

---

## Business Rules

- Semua item dalam checklist harus terpenuhi sebelum dianggap selesai
- Review harus dilakukan secara sistematis

---

## Design / Main Content

### Definition of Done

**Sebuah fitur dianggap "done" jika:**
- Code berfungsi sesuai requirement
- Code mengikuti architecture rules
- Code mengikuti coding convention
- Code sudah di-test
- Error handling ada
- Dokumentasi sudah di-update
- Code sudah di-commit dengan message yang jelas

### Review Checklist

**Code Review:**
- [ ] Code clean dan readable
- [ ] Code mengikuti naming convention
- [ ] Code mengikuti architecture rules
- [ ] Code tidak ada duplication
- [ ] Code tidak ada dead code
- [ ] Code comment untuk bagian kompleks

**Architecture Review:**
- [ ] Layer separation benar
- [ ] Dependency rule diikuti
- [ ] SOLID principles diterapkan
- [ ] Repository pattern diterapkan
- [ ] Service layer ada business logic

**Functionality Review:**
- [ ] Semua requirement terpenuhi
- [ ] Business rules diterapkan
- [ ] Edge cases ditangani
- [ ] Error handling ada
- [ ] Validation ada

### Quality Checklist

**Code Quality:**
- [ ] Code consistent
- [ ] Code maintainable
- [ ] Code testable
- [ ] Code performa acceptable
- [ ] Code secure (basic security)

**Error Handling:**
- [ ] Exception handling ada
- [ ] Error message jelas
- [ ] Error logging ada
- [ ] User-friendly error display
- [ ] Graceful degradation

**Performance:**
- [ ] Query optimized
- [ ] Tidak ada N+1 query problem
- [ ] Async/await digunakan untuk I/O
- [ ] Caching jika perlu (opsional)
- [ ] Response time acceptable

### Testing Checklist

**Unit Testing:**
- [ ] Service layer di-unit test
- [ ] Repository layer di-unit test (opsional)
- [ ] Business logic di-unit test
- [ ] Edge cases di-test
- [ ] Test coverage adequate

**Integration Testing:**
- [ ] API endpoint di-test
- [ ] Database integration di-test
- [ ] Error scenarios di-test
- [ ] Happy path di-test
- [ ] Performance test (opsional)

**Manual Testing:**
- [ ] Semua fitur di-test manual
- [ ] UI di-test
- [ ] Error scenarios di-test manual
- [ ] Cross-browser testing (jika web)
- [ ] Cross-device testing (jika mobile)

### Documentation Checklist

**Code Documentation:**
- [ ] Complex code ada comment
- [ ] Public API ada XML documentation
- [ ] README ada (jika perlu)
- [ ] Changelog ada (jika perlu)

**Project Documentation:**
- [ ] Architecture diagram ada
- [ ] Database schema ada
- [ ] API documentation ada (Swagger)
- [ ] Deployment guide ada (opsional)

**User Documentation:**
- [ ] User guide ada (opsional)
- [ ] Installation guide ada
- [ ] Troubleshooting guide ada (opsional)

---

## Implementation Notes

- Gunakan checklist secara sistematis
- Review sebelum commit
- Review sebelum deploy
- Update checklist jika ada requirement baru

---

## Common Mistakes

- Tidak review code sebelum commit
- Skip testing karena "terburu-buru"
- Tidak update dokumentasi
- Tidak handle edge cases

---

## Exercises

1. Gunakan checklist untuk review code Anda
2. Identifikasi area yang perlu improvement
3. Buat personal review checklist
4. Practice code review dengan teman

---

## Homework

1. Review semua implementasi dengan checklist
2. Fix issue yang ditemukan
3. Update dokumentasi
4. Commit dengan message yang jelas

---

## References

- [Code Review Best Practices](https://github.com/lyft/coding-standards/blob/master/csharp/code-review-checklist.md)
- [Definition of Done](https://www.mountaingoatsoftware.com/blog/definition-of-done)

---

## Related Documents

- [project_constitution.md](./project_constitution.md) - Filosofi project
- [architecture_rules.md](./architecture_rules.md) - Aturan arsitektur
