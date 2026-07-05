# Sesi 1 - API .NET Foundation

## Informasi Sesi
- **Durasi**: 2 jam (120 menit)
- **Fokus**: API .NET
- **Prerequisite**: Tidak ada (sesi pertama)
- **Software yang harus diinstal sebelum sesi**:
  - Visual Studio 2026 Community Edition
  - .NET 8 SDK
  - SQL Server 2022
  - SQL Server Management Studio (SSMS)

## Tujuan Pembelajaran
- [ ] Siswa dapat setup environment development yang benar
- [ ] Siswa memahami konsep RESTful API
- [ ] Siswa dapat membuat project ASP.NET Core Web API baru
- [ ] Siswa memahami dasar database design
- [ ] Siswa dapat menggunakan Entity Framework untuk koneksi database

## Materi (120 menit)

### Teori (25 menit)
#### Environment Setup (10 menit)
- Overview tools yang diperlukan
- Verifikasi instalasi software
- Konfigurasi connection string
- Testing koneksi database

#### RESTful API Concepts (15 menit)
- Apa itu RESTful API
- HTTP methods (GET, POST, PUT, DELETE)
- Status codes (200, 201, 400, 404, 500)
- Resource-based URLs
- JSON format

### Demo (35 menit)
#### Create Web API Project (15 menit)
- Buka Visual Studio
- Create new project ASP.NET Core Web API
- Understand project structure
- Run dan test default endpoint

#### Database Design Basics (10 menit)
- Identify entities dari requirement
- Design simple schema
- Create database di SQL Server
- Create tables dengan SSMS

#### Entity Framework Setup (10 menit)
- Install EF Core NuGet packages
- Create DbContext
- Create entity classes
- Configure connection string

### Practice (45 menit)
#### Latihan 1: Create Simple API (25 menit)
- Buat project Web API baru
- Buat 1 entity class (misal: Customer)
- Buat DbContext
- Configure database connection
- Test koneksi database

#### Latihan 2: Create First Endpoint (20 menit)
- Buat controller untuk entity
- Implementasi GET endpoint
- Test dengan browser atau Postman
- Return data dalam format JSON

### Review (15 menit)
- Review hasil latihan siswa
- Cek apakah API berjalan dengan benar
- Cek apakah database connection berhasil
- Feedback dan koreksi
- Q&A

## Homework

### Tugas 1: Complete Database Design
- Design database schema untuk 3-4 entities
- Buat ERD (Entity Relationship Diagram)
- Create semua tables di SQL Server
- Insert sample data (5-10 rekaman per table)
- **Deadline**: Sesi 2

### Tugas 2: Create Multiple Endpoints
- Buat controller untuk semua entities
- Implementasi GET endpoints untuk semua entities
- Test semua endpoints dengan Postman
- Document response format untuk setiap endpoint
- **Deadline**: Sesi 2

### Tugas 3: Study Resources
- Baca dokumentasi ASP.NET Core Web API
- Pelajari HTTP status codes
- Pelajari JSON format
- **Deadline**: Sesi 2

## Resources

### Documentation
- [ASP.NET Core Web API Documentation](https://docs.microsoft.com/en-us/aspnet/core/web-api/)
- [Entity Framework Core Documentation](https://docs.microsoft.com/en-us/ef/core/)
- [RESTful API Best Practices](https://restfulapi.net/)

### Code Examples
- Sample Web API project structure
- Sample DbContext configuration
- Sample entity class

### Reference Materials
- `Docs/competition-requirements-specification.md` - Section 3.2 (API Development)
- `Docs-id/competition-requirements-specification-id.md` - Versi Bahasa Indonesia

## Notes untuk Mentor

### Tips
- Pastikan semua software sudah terinstal sebelum sesi
- Gunakan contoh sederhana untuk memulai (misal: Customer entity)
- Fokus pada getting things running sebelum masuk ke detail
- Jelaskan konsep dengan analogi yang mudah dipahami

### Common Pitfalls
- Connection string salah
- NuGet packages tidak terinstal
- Database tidak dibuat atau tidak accessible
- Port sudah digunakan oleh aplikasi lain

### Troubleshooting
- Cek connection string di appsettings.json
- Pastikan SQL Server service berjalan
- Cek firewall settings
- Gunakan SQL Server Management Studio untuk verifikasi database

### Preparation untuk Sesi Berikutnya
- Pastikan siswa sudah menyelesaikan homework
- Review database design siswa sebelum sesi 2
- Siapkan contoh business logic untuk demo di sesi 2

---

**Sesi**: 1 dari 8  
**Durasi**: 2 jam  
**Fokus**: API .NET Foundation
