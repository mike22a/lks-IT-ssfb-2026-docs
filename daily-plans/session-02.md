# Sesi 2 - API .NET Advanced

## Informasi Sesi
- **Durasi**: 2 jam (120 menit)
- **Fokus**: API .NET
- **Prerequisite**: Selesai Sesi 1, API basic sudah berjalan

## Tujuan Pembelajaran
- [ ] Siswa dapat mengimplementasikan semua CRUD endpoints
- [ ] Siswa dapat menulis business logic yang benar
- [ ] Siswa dapat menangani error di API dengan baik
- [ ] Siswa dapat menguji API dengan Postman/Swagger
- [ ] Siswa dapat mendokumentasikan API dengan Swagger

## Materi (120 menit)

### Review Homework (15 menit)
- Review database design siswa
- Review GET endpoints yang sudah dibuat
- Feedback dan koreksi
- Q&A dari homework

### Teori (20 menit)
#### CRUD Operations (10 menit)
- Create (POST) - Create new resource
- Read (GET) - Retrieve resource(s)
- Update (PUT/PATCH) - Update existing resource
- Delete (DELETE) - Remove resource
- Best practices untuk setiap operation

#### Error Handling (10 menit)
- HTTP status codes untuk error (400, 404, 500)
- Error response format
- Exception handling di C#
- Validation errors vs system errors

### Demo (30 menit)
#### CRUD Implementation (15 menit)
- Implementasi POST endpoint
- Implementasi PUT endpoint
- Implementasi DELETE endpoint
- Test semua endpoints

#### Business Logic (10 menit)
- Contoh business logic (misal: validation, calculation)
- Implementasi di controller atau service layer
- Test business logic

#### Error Handling (5 menit)
- Try-catch blocks
- Return appropriate status codes
- Error response format

### Practice (40 menit)
#### Latihan 1: Complete CRUD Endpoints (25 menit)
- Implementasi POST untuk semua entities
- Implementasi PUT untuk semua entities
- Implementasi DELETE untuk semua entities
- Test semua endpoints dengan Postman

#### Latihan 2: Add Business Logic (15 menit)
- Tambahkan minimal 1 business logic per entity
- Misal: validation, calculation, conditional logic
- Test business logic dengan Postman

### Review (15 menit)
- Review hasil latihan siswa
- Cek apakah semua CRUD endpoints berfungsi
- Cek business logic implementation
- Cek error handling
- Feedback dan koreksi
- Q&A

## Homework

### Tugas 1: Complete Error Handling
- Implementasi proper error handling untuk semua endpoints
- Return appropriate status codes
- Create consistent error response format
- Test error scenarios (invalid input, not found, etc.)
- **Deadline**: Sesi 3

### Tugas 2: API Documentation dengan Swagger
- Setup Swagger di project
- Add XML comments untuk semua endpoints
- Document request/response models
- Test Swagger UI
- **Deadline**: Sesi 3

### Tugas 3: Advanced Business Logic
- Implementasi 2-3 business logic yang lebih kompleks
- Misal: data aggregation, conditional updates, complex validation
- Test dengan Postman
- **Deadline**: Sesi 3

## Resources

### Documentation
- [ASP.NET Core Web API CRUD](https://docs.microsoft.com/en-us/aspnet/core/web-api/)
- [Swagger/OpenAPI Documentation](https://docs.microsoft.com/en-us/aspnet/core/tutorials/getting-started-with-swaggerswashbuckle)
- [Error Handling in Web API](https://docs.microsoft.com/en-us/aspnet/core/web-api/handle-errors)

### Code Examples
- Sample CRUD controller
- Sample business logic implementation
- Sample error handling middleware

### Reference Materials
- `Docs/competition-requirements-specification.md` - Section 3.2.3 (Business Logic)
- `Docs-id/competition-requirements-specification-id.md` - Versi Bahasa Indonesia

## Notes untuk Mentor

### Tips
- Fokus pada consistency di semua endpoints
- Emphasize proper error handling
- Show how to test API systematically
- Encourage use of Swagger for documentation

### Common Pitfalls
- Tidak validasi input sebelum processing
- Tidak return appropriate status codes
- Business logic di controller (sebaiknya di service layer)
- Error messages tidak helpful

### Troubleshooting
- Cek apakah database connection masih berjalan
- Verify request body format di Postman
- Check browser console untuk error
- Use debugger di Visual Studio

### Preparation untuk Sesi Berikutnya
- Pastikan API siswa sudah lengkap dan berfungsi
- Review API documentation siswa
- Siapkan materi Windows Forms untuk sesi 3
- Pastikan siswa sudah siap untuk transition ke desktop apps

---

**Sesi**: 2 dari 8  
**Durasi**: 2 jam  
**Fokus**: API .NET Advanced
