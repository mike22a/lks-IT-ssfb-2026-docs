# Sesi 5 - Desktop Apps Advanced Features

## Informasi Sesi
- **Durasi**: 2 jam (120 menit)
- **Fokus**: Desktop Apps (.NET)
- **Prerequisite**: Selesai Sesi 4, CRUD desktop sudah berfungsi

## Tujuan Pembelajaran
- [ ] Siswa dapat menulis advanced SQL queries (JOIN, aggregate)
- [ ] Siswa dapat menggunakan LINQ to Entities
- [ ] Siswa dapat mengimplementasikan data visualization dengan charts
- [ ] Siswa dapat mengimplementasikan search dan filter functionality
- [ ] Siswa dapat mengimplementasikan input validation yang komprehensif

## Materi (120 menit)

### Review Homework (15 menit)
- Review CRUD untuk semua entities
- Review DataGridView customization
- Review error handling di desktop
- Feedback dan koreksi
- Q&A dari homework

### Teori (20 menit)
#### Advanced SQL Queries (10 menit)
- JOIN operations (INNER, LEFT, RIGHT)
- Aggregate functions (COUNT, SUM, AVG, MIN, MAX)
- GROUP BY dan HAVING
- Subqueries

#### LINQ to Entities (10 menit)
- LINQ query syntax vs method syntax
- LINQ dengan Entity Framework
- Deferred execution
- Performance considerations

### Demo (35 menit)
#### Advanced SQL Implementation (15 menit)
- Write JOIN query di SQL Server
- Test query dengan SSMS
- Implementasi di API endpoint
- Test endpoint dengan Postman

#### LINQ Implementation (10 menit)
- Write LINQ query di code
- Compare dengan SQL
- Test LINQ query
- Show performance differences

#### Data Visualization (10 menit)
- Add Chart control ke form
- Create bar chart
- Create line chart
- Bind data ke chart
- Customize chart appearance

### Practice (40 menit)
#### Latihan 1: Advanced Queries (20 menit)
- Implementasi 2-3 JOIN queries di API
- Implementasi 2-3 aggregate queries di API
- Test queries dengan Postman
- Consume queries di desktop app

#### Latihan 2: Search dan Filter (20 menit)
- Add search TextBox di desktop form
- Implementasi search functionality
- Add filter dialog
- Implementasi multiple filter criteria
- Test search dan filter

### Review (10 menit)
- Review hasil latihan siswa
- Cek advanced queries implementation
- Cek search dan filter functionality
- Feedback dan koreksi
- Q&A

## Homework

### Tugas 1: Complete Data Visualization
- Implementasi chart untuk data visualization
- Gunakan minimal 2 tipe chart (bar, line, pie)
- Bind chart ke data dari API
- Customize chart (colors, labels, legends)
- **Deadline**: Sesi 6

### Tugas 2: Advanced Validation
- Implementasi comprehensive validation untuk semua forms
- Gunakan ErrorProvider component
- Validasi field-by-field
- Validasi business rules
- Display clear error messages
- **Deadline**: Sesi 6

### Tugas 3: Access Control (Optional)
- Implementasi login form
- Implementasi role-based access control
- Restrict menu items berdasarkan role
- **Deadline**: Sesi 6

## Resources

### Documentation
- [SQL JOIN Queries](https://docs.microsoft.com/en-us/sql/t-sql/queries/joins)
- [LINQ to Entities](https://docs.microsoft.com/en-us/ef/core/querying/)
- [Windows Forms Chart Control](https://docs.microsoft.com/en-us/dotnet/desktop/winforms/controls/chart-control-windows-forms)

### Code Examples
- Sample JOIN query
- Sample LINQ query
- Sample chart implementation
- Sample search/filter implementation

### Reference Materials
- `Docs/competition-requirements-specification.md` - Section 3.2.5 (Advanced Queries)
- `Docs-id/competition-requirements-specification-id.md` - Versi Bahasa Indonesia

## Notes untuk Mentor

### Tips
- Fokus pada queries yang relevan dengan competition requirements
- Show practical use cases untuk charts
- Emphasize validation importance
- Show search/filter best practices

### Common Pitfalls
- JOIN queries tidak optimal (performance)
- LINQ queries tidak deferred execution
- Chart tidak bound ke data properly
- Validation tidak comprehensive

### Troubleshooting
- Test SQL queries di SSMS dulu
- Check LINQ query syntax
- Verify chart data binding
- Test validation edge cases

### Preparation untuk Sesi Berikutnya
- Pastikan desktop apps sudah lengkap dengan advanced features
- Review chart implementation siswa
- Siapkan materi Android Studio untuk sesi 6
- Pastikan siswa sudah install Android Studio

---

**Sesi**: 5 dari 8  
**Durasi**: 2 jam  
**Fokus**: Desktop Apps Advanced Features
