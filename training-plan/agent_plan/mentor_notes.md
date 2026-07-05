# Mentor Notes - Program Pelatihan LKS IT Software Solution for Business

## Catatan Umum

### Background Mentor
- .NET Developer dengan pengalaman DevExpress (lama)
- Perlu relearning Windows Forms
- Fokus utama: Desktop Apps (.NET)
- Akan mengajarkan desktop apps dengan .NET

### Timeline
- **Tanggal Kompetisi**: 27 Juli 2026 (earliest)
- **Meeting Persiapan**: 6 Juli 2026
- **Periode Pelatihan**: Setelah 6 Juli - Sebelum 27 Juli (±20 hari)
- **Total Sesi**: 8 sesi
- **Durasi per Sesi**: 2 jam
- **Total Waktu**: 16 jam

## Catatan per Sesi

### Sesi 1: API .NET Foundation
**Fokus:** Environment setup, RESTful concepts, EF basics

**Preparation:**
- Pastikan semua software terinstal sebelum sesi
- Siapkan sample database schema
- Siapkan contoh simple API project

**Tips:**
- Gunakan contoh sederhana untuk memulai (misal: Customer entity)
- Fokus pada getting things running sebelum masuk ke detail
- Jelaskan konsep dengan analogi yang mudah dipahami

**Common Pitfalls:**
- Connection string salah
- NuGet packages tidak terinstal
- Database tidak dibuat atau tidak accessible
- Port sudah digunakan oleh aplikasi lain

**Notes:**
- Verifikasi instalasi software di awal sesi
- Gunakan SSMS untuk verifikasi database
- Test API dengan browser atau Postman

---

### Sesi 2: API .NET Advanced
**Fokus:** CRUD implementation, business logic, error handling

**Preparation:**
- Review database design siswa dari homework
- Siapkan contoh business logic
- Siapkan contoh error handling

**Tips:**
- Fokus pada consistency di semua endpoints
- Emphasize proper error handling
- Show how to test API systematically
- Encourage use of Swagger untuk documentation

**Common Pitfalls:**
- Tidak validasi input sebelum processing
- Tidak return appropriate status codes
- Business logic di controller (sebaiknya di service layer)
- Error messages tidak helpful

**Notes:**
- Review homework di awal sesi
- Show Swagger setup
- Emphasize validation importance

---

### Sesi 3: Desktop Apps Foundation
**Fokus:** Windows Forms basics, controls, event handling

**Preparation:**
- Pastikan API masih berjalan
- Siapkan contoh Windows Forms project
- Review DevExpress patterns jika relevan

**Tips:**
- Mulai dengan form sederhana sebelum kompleks
- Fokus pada properties yang penting dulu
- Show event handling dengan praktis examples
- Emphasize form centering dan positioning

**Common Pitfalls:**
- Form tidak di-center
- Event handler tidak terhubung
- Control naming tidak konsisten
- Tidak memahami Show vs ShowDialog

**Notes:**
- Leverage keahlian DevExpress jika membantu
- Show modern Windows Forms patterns
- Emphasize layout management

---

### Sesi 4: Desktop Apps Database Integration
**Fokus:** EF integration, CRUD, DataGridView

**Preparation:**
- Siapkan contoh EF integration di WinForms
- Siapkan contoh DataGridView binding
- Pastikan API masih accessible

**Tips:**
- Fokus pada integration dengan API yang sudah dibuat
- Show how to handle async operations di WinForms
- Emphasize proper error handling
- Show DataGridView customization options

**Common Pitfalls:**
- UI freeze saat calling API (perlu async/await)
- Tidak refresh data setelah CRUD operations
- Error messages tidak user-friendly
- DataGridView columns tidak di-format

**Notes:**
- Show async/await pattern
- Emphasize data binding
- Show DataGridView customization

---

### Sesi 5: Desktop Apps Advanced Features
**Fokus:** Advanced SQL, LINQ, charts, search/filter

**Preparation:**
- Siapkan contoh advanced SQL queries
- Siapkan contoh LINQ queries
- Siapkan contoh chart implementation
- Siapkan contoh search/filter

**Tips:**
- Fokus pada queries yang relevan dengan competition requirements
- Show practical use cases untuk charts
- Emphasize validation importance
- Show search/filter best practices

**Common Pitfalls:**
- JOIN queries tidak optimal (performance)
- LINQ queries tidak deferred execution
- Chart tidak bound ke data properly
- Validation tidak comprehensive

**Notes:**
- Test SQL queries di SSMS dulu
- Show LINQ vs SQL comparison
- Emphasize validation

---

### Sesi 6: Mobile Android Foundation
**Fokus:** Android Studio setup, Kotlin, Compose basics

**Preparation:**
- Pastikan Android Studio dan emulator berjalan
- Siapkan contoh Compose project
- Review Kotlin basics

**Tips:**
- Pastikan Android Studio dan emulator berjalan dengan baik
- Fokus pada Compose fundamentals dulu
- Show preview feature untuk quick iteration
- Emphasize state management importance

**Common Pitfalls:**
- Emulator tidak berjalan atau lambat
- State tidak update UI (recomposition issue)
- Layout tidak responsive
- Kotlin syntax errors

**Notes:**
- Check AVD configuration
- Verify HAXM installation
- Use @Preview composable
- Check state hoisting

---

### Sesi 7: Mobile Android API Integration
**Fokus:** Retrofit, coroutines, repository, ViewModel

**Preparation:**
- Pastikan API masih accessible
- Siapkan contoh Retrofit setup
- Siapkan contoh coroutines
- Siapkan contoh repository pattern

**Tips:**
- Fokus pada integration dengan API yang sudah dibuat
- Show proper error handling di coroutines
- Emphasize repository pattern benefits
- Show ViewModel state management

**Common Pitfalls:**
- Network on main thread error
- Coroutine scope tidak tepat
- State tidak update UI
- Navigation tidak proper

**Notes:**
- Use viewModelScope untuk coroutines
- Use LaunchedEffect untuk one-time operations
- Check internet permission
- Use Log.d untuk debugging

---

### Sesi 8: Mobile Android CRUD & Practice
**Fokus:** Search/filter, export, full integration practice

**Preparation:**
- Siapkan contoh search implementation
- Siapkan contoh export implementation
- Siapkan final practice scenario

**Tips:**
- Fokus pada integration semua features
- Simulasikan pressure kompetisi
- Emphasize time management
- Provide final feedback dan encouragement

**Common Pitfalls:**
- Tidak selesai dalam waktu
- Validasi tidak comprehensive
- Error handling tidak proper
- UI tidak user-friendly

**Notes:**
- Practice time management
- Prioritize features based on weight
- Test all scenarios
- Have backup plan

---

## Catatan Umum Pelatihan

### Software yang Diperlukan
- Visual Studio 2026 Community Edition
- .NET 8 SDK
- SQL Server 2022
- SQL Server Management Studio 21
- Android Studio (Panda Stable Version)
- Android SDK API Level 34

### Resources Penting
- `Docs/detailed-breakdown.md` - Analisis detail kompetisi
- `Docs/competition-requirements-specification.md` - Spesifikasi teknis
- `Docs-id/detailed-breakdown-id.md` - Versi Bahasa Indonesia
- `Docs-id/competition-requirements-specification-id.md` - Versi Bahasa Indonesia
- `txt/standar-software.txt` - Standar software resmi

### Common Issues dan Solutions

#### Database Connection Issues
- Check connection string di appsettings.json
- Pastikan SQL Server service berjalan
- Cek firewall settings
- Use SSMS untuk verifikasi

#### API Issues
- Check jika API berjalan (browser atau Postman)
- Verify endpoint URLs
- Check CORS settings
- Review error messages

#### Windows Forms Issues
- Check event handler connections
- Verify control names
- Check form properties (StartPosition)
- Use debugger untuk trace

#### Android Issues
- Check AVD configuration
- Verify HAXM installation
- Check internet permission
- Use Log.d untuk debugging

### Tips untuk Kompetisi Day

#### Sebelum Kompetisi
- Verify semua installations
- Test semua applications
- Have backup plans
- Prepare checklist

#### Selama Kompetisi
- Read requirements carefully
- Prioritize features
- Manage time effectively
- Test frequently
- Don't skip validation

#### Setelah Kompetisi
- Review results
- Document lessons learned
- Identify improvements

---

**Versi Dokumen**: 1.0  
**Tanggal**: 2026  
**Kompetisi**: LKS DIKMEN Nasional 2026 - IT Software Solution for Business
