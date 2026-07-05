# Sesi 3 - Desktop Apps Foundation

## Informasi Sesi
- **Durasi**: 2 jam (120 menit)
- **Fokus**: Desktop Apps (.NET)
- **Prerequisite**: Selesai Sesi 2, API sudah lengkap dan berfungsi

## Tujuan Pembelajaran
- [ ] Siswa dapat membuat project Windows Forms baru
- [ ] Siswa memahami form design dan layout
- [ ] Siswa dapat menggunakan common controls (Button, TextBox, ComboBox, etc.)
- [ ] Siswa dapat mengimplementasikan event handling
- [ ] Siswa dapat mengelola navigasi antar form

## Materi (120 menit)

### Review Homework (15 menit)
- Review error handling implementation
- Review Swagger documentation
- Review advanced business logic
- Feedback dan koreksi
- Q&A dari homework

### Teori (20 menit)
#### Windows Forms Overview (10 menit)
- Apa itu Windows Forms
- Windows Forms vs WPF vs UWP
- Form lifecycle
- Project structure

#### Form Design Principles (10 menit)
- Layout management (anchoring, docking)
- Control positioning
- Form centering
- Responsive design basics

### Demo (35 menit)
#### Create Windows Forms Project (10 menit)
- Buka Visual Studio
- Create new Windows Forms App project
- Understand project structure
- Run default form

#### Common Controls (15 menit)
- TextBox untuk input
- Button untuk aksi
- Label untuk display
- ComboBox untuk selection
- DateTimePicker untuk tanggal
- Properties dan events

#### Event Handling (10 menit)
- Button click event
- Text changed event
- Form load event
- Event handler syntax

### Practice (40 menit)
#### Latihan 1: Create Simple Form (20 menit)
- Buat form baru
- Tambahkan TextBox, Button, Label
- Implementasi button click event
- Tampilkan input dari TextBox di Label
- Center form di layar

#### Latihan 2: Multiple Forms Navigation (20 menit)
- Buat 2 forms (Form1 dan Form2)
- Tambahkan button di Form1 untuk buka Form2
- Implementasi Show vs ShowDialog
- Pass data antar forms
- Implementasi form centering

### Review (10 menit)
- Review hasil latihan siswa
- Cek apakah form berjalan dengan benar
- Cek event handling implementation
- Feedback dan koreksi
- Q&A

## Homework

### Tugas 1: Create Customer Form
- Buat form untuk input customer data
- Gunakan TextBox untuk Name, Email, Phone, Address
- Gunakan Button untuk Save dan Cancel
- Implementasi validation (field tidak boleh kosong)
- Center form di layar
- **Deadline**: Sesi 4

### Tugas 2: Create Customer List Form
- Buat form untuk menampilkan list customer
- Gunakan DataGridView untuk display
- Tambahkan button untuk Add, Edit, Delete
- Implementasi navigasi ke form input
- **Deadline**: Sesi 4

### Tugas 3: Study Resources
- Baca dokumentasi Windows Forms controls
- Pelajari DataGridView basics
- Pelajari form events dan lifecycle
- **Deadline**: Sesi 4

## Resources

### Documentation
- [Windows Forms Documentation](https://docs.microsoft.com/en-us/dotnet/desktop/winforms/)
- [Windows Forms Controls](https://docs.microsoft.com/en-us/dotnet/desktop/winforms/controls/)
- [Event Handling in Windows Forms](https://docs.microsoft.com/en-us/dotnet/desktop/winforms/events/)

### Code Examples
- Sample Windows Forms project
- Sample form dengan controls
- Sample event handlers

### Reference Materials
- `Docs/competition-requirements-specification.md` - Section 3.2.2 (Windows Forms Development)
- `Docs-id/competition-requirements-specification-id.md` - Versi Bahasa Indonesia

## Notes untuk Mentor

### Tips
- Mulai dengan form sederhana sebelum kompleks
- Fokus pada properties yang penting dulu
- Show event handling dengan praktis examples
- Emphasize form centering dan positioning

### Common Pitfalls
- Form tidak di-center
- Event handler tidak terhubung
- Control naming tidak konsisten
- Tidak memahami Show vs ShowDialog

### Troubleshooting
- Cek apakah event handler terhubung (double-click di designer)
- Verify control names di code
- Check form properties (StartPosition)
- Use debugger untuk trace event flow

### Preparation untuk Sesi Berikutnya
- Pastikan siswa sudah membuat basic forms
- Review form design siswa
- Siapkan materi Entity Framework di Windows Forms untuk sesi 4
- Pastikan API masih accessible untuk integration

---

**Sesi**: 3 dari 8  
**Durasi**: 2 jam  
**Fokus**: Desktop Apps Foundation
