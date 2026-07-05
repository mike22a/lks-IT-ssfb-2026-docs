# Sesi 6 - Mobile Android Foundation

## Informasi Sesi
- **Durasi**: 2 jam (120 menit)
- **Fokus**: Mobile Android
- **Prerequisite**: Selesai Sesi 5, Desktop apps sudah lengkap, Android Studio sudah diinstal

## Tujuan Pembelajaran
- [ ] Siswa dapat setup Android Studio environment
- [ ] Siswa memahami dasar Kotlin syntax
- [ ] Siswa memahami konsep Jetpack Compose
- [ ] Siswa dapat membuat composable functions
- [ ] Siswa memahami state management basics di Compose

## Materi (120 menit)

### Review Homework (15 menit)
- Review data visualization implementation
- Review advanced validation
- Review access control (jika ada)
- Feedback dan koreksi
- Q&A dari homework

### Teori (20 menit)
#### Android Studio Setup (5 menit)
- Verify Android Studio installation
- Setup AVD (Android Virtual Device)
- Create new project
- Understand project structure

#### Kotlin Basics (10 menit)
- Kotlin syntax overview
- Variables dan data types
- Functions
- Classes dan objects
- Null safety

#### Jetpack Compose Introduction (5 menit)
- Apa itu Jetpack Compose
- Composable functions
- Declarative UI
- State management basics

### Demo (35 menit)
#### Create Android Project (10 menit)
- Create new Compose project
- Understand project structure
- Run di emulator
- Explore default code

#### Basic Composables (15 menit)
- Text composable
- Button composable
- TextField composable
- Column dan Row layouts
- Preview composable

#### State Management (10 menit)
- remember dan mutableStateOf
- State hoisting
- Recomposition
- Simple counter example

### Practice (40 menit)
#### Latihan 1: Create Simple UI (20 menit)
- Buat form input sederhana (mirip customer form di desktop)
- Gunakan TextField untuk input
- Gunakan Button untuk submit
- Gunakan Column untuk layout
- Preview di emulator

#### Latihan 2: State Management (20 menit)
- Implementasi state untuk form inputs
- Implementasi button click handler
- Display input values
- Test state updates

### Review (10 menit)
- Review hasil latihan siswa
- Cek apakah UI berjalan di emulator
- Cek state management implementation
- Feedback dan koreksi
- Q&A

## Homework

### Tugas 1: Complete Customer Form di Android
- Buat customer form yang lengkap (Name, Email, Phone, Address)
- Implementasi state untuk semua fields
- Implementasi validation (field tidak boleh kosong)
- Implementasi submit button
- Test di emulator
- **Deadline**: Sesi 7

### Tugas 2: Study Resources
- Baca dokumentasi Jetpack Compose
- Pelajari Compose layouts
- Pelajari state management di Compose
- Pelajari navigation di Compose
- **Deadline**: Sesi 7

### Tugas 3: Create Customer List Screen
- Buat list screen untuk menampilkan customers
- Gunakan LazyColumn untuk list
- Buat item composable untuk customer
- Test di emulator
- **Deadline**: Sesi 7

## Resources

### Documentation
- [Jetpack Compose Documentation](https://developer.android.com/jetpack/compose)
- [Kotlin Documentation](https://kotlinlang.org/docs/)
- [Android Studio User Guide](https://developer.android.com/studio/intro)

### Code Examples
- Sample Compose project
- Sample composable functions
- Sample state management

### Reference Materials
- `Docs/competition-requirements-specification.md` - Section 3.2.6 (Mobile UI Development)
- `Docs-id/competition-requirements-specification-id.md` - Versi Bahasa Indonesia

## Notes untuk Mentor

### Tips
- Pastikan Android Studio dan emulator berjalan dengan baik
- Fokus pada Compose fundamentals dulu
- Show preview feature untuk quick iteration
- Emphasize state management importance

### Common Pitfalls
- Emulator tidak berjalan atau lambat
- State tidak update UI (recomposition issue)
- Layout tidak responsive
- Kotlin syntax errors

### Troubleshooting
- Check AVD configuration
- Verify HAXM installation (untuk emulator performance)
- Use @Preview composable untuk quick testing
- Check state hoisting

### Preparation untuk Sesi Berikutnya
- Pastikan siswa sudah membuat basic UI di Android
- Review customer form siswa
- Siapkan materi Retrofit dan API integration untuk sesi 7
- Pastikan API masih accessible

---

**Sesi**: 6 dari 8  
**Durasi**: 2 jam  
**Fokus**: Mobile Android Foundation
