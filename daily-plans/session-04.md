# Sesi 4 - Desktop Apps Database Integration

## Informasi Sesi
- **Durasi**: 2 jam (120 menit)
- **Fokus**: Desktop Apps (.NET)
- **Prerequisite**: Selesai Sesi 3, basic forms sudah dibuat

## Tujuan Pembelajaran
- [ ] Siswa dapat menggunakan Entity Framework di Windows Forms
- [ ] Siswa dapat mengelola koneksi database
- [ ] Siswa dapat mengimplementasikan CRUD operations di desktop
- [ ] Siswa dapat menggunakan DataGridView untuk display data
- [ ] Siswa dapat mengimplementasikan data binding

## Materi (120 menit)

### Review Homework (15 menit)
- Review Customer Form siswa
- Review Customer List Form siswa
- Feedback dan koreksi
- Q&A dari homework

### Teori (20 menit)
#### Entity Framework in Windows Forms (10 menit)
- DbContext di Windows Forms
- Dependency injection considerations
- Connection string management
- Lifecycle management

#### Data Binding (10 menit)
- Apa itu data binding
- DataGridView data binding
- BindingSource component
- Two-way binding

### Demo (35 menit)
#### EF Setup in Windows Forms (10 menit)
- Add EF Core packages ke Windows Forms project
- Create DbContext
- Configure connection string
- Test database connection

#### DataGridView Data Binding (15 menit)
- Add DataGridView ke form
- Bind data ke DataGridView
- Auto-generate columns vs manual columns
- Formatting columns

#### CRUD Implementation (10 menit)
- Load data ke DataGridView
- Add new record
- Edit existing record
- Delete record
- Refresh data

### Practice (40 menit)
#### Latihan 1: Integrate API ke Desktop (20 menit)
- Add reference ke API project atau consume API
- Load data dari API ke DataGridView
- Implementasi refresh button
- Test data loading

#### Latihan 2: Implement CRUD di Desktop (20 menit)
- Implementasi Add button (buka form input, save ke API)
- Implementasi Edit button (load data ke form, update ke API)
- Implementasi Delete button (confirm, delete ke API)
- Refresh DataGridView setelah operasi

### Review (10 menit)
- Review hasil latihan siswa
- Cek apakah CRUD berfungsi dengan API
- Cek data binding
- Feedback dan koreksi
- Q&A

## Homework

### Tugas 1: Complete CRUD untuk Semua Entities
- Implementasi CRUD untuk semua entities dari database
- Buat form input untuk setiap entity
- Implementasi validation di form
- Test semua CRUD operations
- **Deadline**: Sesi 5

### Tugas 2: DataGridView Customization
- Custom column types (ComboBox, Button, etc.)
- Column formatting (date, currency, etc.)
- Sorting dan filtering di DataGridView
- Context menu untuk operations
- **Deadline**: Sesi 5

### Tugas 3: Error Handling di Desktop
- Implementasi try-catch untuk semua API calls
- Display user-friendly error messages
- Handle network errors
- Handle validation errors dari API
- **Deadline**: Sesi 5

## Resources

### Documentation
- [Entity Framework Core in WinForms](https://docs.microsoft.com/en-us/ef/core/)
- [DataGridView Control](https://docs.microsoft.com/en-us/dotnet/desktop/winforms/controls/datagridview-control-overview-windows-forms)
- [Data Binding in Windows Forms](https://docs.microsoft.com/en-us/dotnet/desktop/winforms/data-binding/)

### Code Examples
- Sample EF integration di WinForms
- Sample DataGridView binding
- Sample CRUD implementation

### Reference Materials
- `Docs/competition-requirements-specification.md` - Section 3.2.4 (CRUD Operations)
- `Docs-id/competition-requirements-specification-id.md` - Versi Bahasa Indonesia

## Notes untuk Mentor

### Tips
- Fokus pada integration dengan API yang sudah dibuat
- Show how to handle async operations di WinForms
- Emphasize proper error handling
- Show DataGridView customization options

### Common Pitfalls
- UI freeze saat calling API (perlu async/await)
- Tidak refresh data setelah CRUD operations
- Error messages tidak user-friendly
- DataGridView columns tidak di-format

### Troubleshooting
- Use async/await untuk API calls
- Refresh DataGridView setelah operasi
- Handle network errors gracefully
- Use MessageBox untuk error display

### Preparation untuk Sesi Berikutnya
- Pastikan CRUD desktop sudah berfungsi dengan API
- Review DataGridView customization siswa
- Siapkan materi advanced SQL queries untuk sesi 5
- Siapkan contoh LINQ queries

---

**Sesi**: 4 dari 8  
**Durasi**: 2 jam  
**Fokus**: Desktop Apps Database Integration
