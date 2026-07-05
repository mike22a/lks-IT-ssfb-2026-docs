# Sesi 7 - Mobile Android API Integration

## Informasi Sesi
- **Durasi**: 2 jam (120 menit)
- **Fokus**: Mobile Android
- **Prerequisite**: Selesai Sesi 6, basic Android UI sudah dibuat

## Tujuan Pembelajaran
- [ ] Siswa dapat setup Retrofit library
- [ ] Siswa dapat membuat API interface
- [ ] Siswa dapat menggunakan coroutines untuk async operations
- [ ] Siswa dapat mengimplementasikan repository pattern
- [ ] Siswa dapat mengintegrasikan ViewModel

## Materi (120 menit)

### Review Homework (15 menit)
- Review Customer Form di Android
- Review Customer List Screen
- Feedback dan koreksi
- Q&A dari homework

### Teori (20 menit)
#### Retrofit Library (10 menit)
- Apa itu Retrofit
- Setup Retrofit dependencies
- API interface definition
- Response parsing

#### Coroutines (10 menit)
- Apa itu coroutines
- suspend functions
- Coroutine scope
- Dispatchers (Main, IO)

### Demo (35 menit)
#### Retrofit Setup (10 menit)
- Add Retrofit dependencies
- Create API interface
- Create Retrofit instance
- Define API endpoints

#### Coroutines Implementation (10 menit)
- Use coroutines untuk API calls
- Handle loading states
- Handle error states
- Update UI dengan response

#### Repository Pattern (10 menit)
- Create repository class
- Move API calls ke repository
- Implement Result wrapper
- Handle errors di repository

#### ViewModel Integration (5 menit)
- Create ViewModel
- Integrate repository ke ViewModel
- Expose state dari ViewModel
- Consume ViewModel di composable

### Practice (40 menit)
#### Latihan 1: API Integration (25 menit)
- Setup Retrofit untuk API yang sudah dibuat
- Create API interface untuk customer endpoints
- Implementasi repository untuk customer
- Test API call di Android

#### Latihan 2: Display API Data (15 menit)
- Load customer data dari API
- Display di list screen
- Implementasi loading indicator
- Implementasi error handling

### Review (10 menit)
- Review hasil latihan siswa
- Cek apakah API integration berfungsi
- Cek data display di list
- Feedback dan koreksi
- Q&A

## Homework

### Tugas 1: Complete CRUD di Mobile
- Implementasi POST untuk create customer
- Implementasi PUT untuk update customer
- Implementasi DELETE untuk delete customer
- Test semua CRUD operations
- **Deadline**: Sesi 8

### Tugas 2: Form Validation di Mobile
- Implementasi validation untuk customer form
- Display error messages
- Disable submit button jika invalid
- Test validation scenarios
- **Deadline**: Sesi 8

### Tugas 3: Navigation
- Implementasi navigation antar screens
- Pass data antar screens
- Implementasi back navigation
- Test navigation flow
- **Deadline**: Sesi 8

## Resources

### Documentation
- [Retrofit Documentation](https://square.github.io/retrofit/)
- [Kotlin Coroutines](https://kotlinlang.org/docs/coroutines-overview.html)
- [ViewModel in Compose](https://developer.android.com/jetpack/compose/state#viewmodel-state)
- [Navigation in Compose](https://developer.android.com/jetpack/compose/navigation)

### Code Examples
- Sample Retrofit setup
- Sample repository implementation
- Sample ViewModel integration
- Sample navigation setup

### Reference Materials
- `Docs/competition-requirements-specification.md` - Section 3.2.7 (API Integration)
- `Docs-id/competition-requirements-specification-id.md` - Versi Bahasa Indonesia

## Notes untuk Mentor

### Tips
- Fokus pada integration dengan API yang sudah dibuat
- Show proper error handling di coroutines
- Emphasize repository pattern benefits
- Show ViewModel state management

### Common Pitfalls
- Network on main thread error
- Coroutine scope tidak tepat
- State tidak update UI
- Navigation tidak proper

### Troubleshooting
- Use viewModelScope untuk coroutines
- Use LaunchedEffect untuk one-time operations
- Check internet permission di manifest
- Use Log.d untuk debugging

### Preparation untuk Sesi Berikutnya
- Pastikan API integration di mobile sudah berfungsi
- Review CRUD implementation siswa
- Siapkan materi search/filter dan export untuk sesi 8
- Siapkan final practice scenario

---

**Sesi**: 7 dari 8  
**Durasi**: 2 jam  
**Fokus**: Mobile Android API Integration
