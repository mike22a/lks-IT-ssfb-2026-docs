# Sesi 1 - API Kickoff + Pengenalan Clean Architecture

## Informasi Sesi
- **Durasi**: 2 jam (120 menit)
- **Fokus**: Setup environment, pengenalan Clean Architecture, membuat skeleton project API
- **Prerequisite**: Tidak ada (sesi pertama)
- **Software yang harus diinstal sebelum sesi**:
  - Visual Studio 2022/2026 Community Edition
  - .NET 8 SDK
  - SQL Server 2022
  - SQL Server Management Studio (SSMS)
  - Postman

## Tujuan Pembelajaran
- [ ] Siswa memahami konteks kompetisi dan apa yang akan dibangun
- [ ] Siswa dapat setup environment API .NET dengan benar
- [ ] Siswa memahami konsep Clean Architecture dan kenapa dipakai di business case
- [ ] Siswa dapat membuat skeleton project dengan struktur Clean Architecture
- [ ] Siswa dapat mendefinisikan Domain Entity dan Interface IRepository

## Materi (120 menit)

### Quick Assessment (20 menit)
#### Cek Background Siswa (10 menit)
- Siswa demo singkat skill Win Form (CRUD sederhana)
- Siswa ceritakan pengalaman Android Kotlin
- Identifikasi area yang sudah kuat vs perlu pendalaman
- Set expectations untuk 5 sesi ke depan

#### Review Competition Requirements (10 menit)
- Overview singkat apa yang dinilai di LKS SSfB
- Bobot penilaian: Modul A (25%), Modul B (30%), Modul C (25%), Modul D (20%)
- Diskusi: "Kita fokus agar API menjadi backbone yang kokoh untuk semua modul"
- Tentukan domain bisnis yang akan digunakan sepanjang latihan (misal: **Inventory System** atau **Sales Management**)

### Setup Environment (20 menit)
#### Instalasi & Verifikasi (10 menit)
- Install/verifikasi .NET 8 SDK (`dotnet --version`)
- Install/verifikasi Visual Studio dengan workload ASP.NET
- Install/verifikasi SQL Server + SSMS
- Install Postman
- Buat database kosong untuk latihan di SSMS

#### Konfigurasi Project (10 menit)
- Buat folder workspace untuk latihan
- Pastikan `dotnet new webapi` bisa berjalan
- Overview singkat tools yang akan dipakai: VS, SSMS, Postman, Swagger

### Clean Architecture — Teori & Konsep (30 menit)
#### Mengapa Clean Architecture? (10 menit)
- Problem dengan "Spaghetti Code": logic tersebar di mana-mana
- Analogi: Dapur restoran → ada area prep, area masak, area saji — tidak campur aduk
- Clean Architecture = separation of concerns yang jelas
- Benefit untuk kompetisi: kode mudah dibaca juri, mudah di-maintain saat revisi

#### Struktur 4 Layer (15 menit)
```
Solution: BusinessApp
│
├── BusinessApp.Domain/          ← "Aturan Bisnis Murni"
│   ├── Entities/                → Customer, Product, Order (POCO)
│   └── Interfaces/              → IRepository<T>, ICustomerRepository
│
├── BusinessApp.Application/     ← "Use Cases & Orchestration"
│   ├── DTOs/                    → CustomerDto, CreateCustomerRequest
│   ├── Interfaces/              → ICustomerService
│   └── Services/                → CustomerService.cs
│
├── BusinessApp.Infrastructure/  ← "Detail Teknis (DB, File, dll)"
│   ├── Data/                    → AppDbContext.cs
│   ├── Repositories/            → Repository.cs, CustomerRepository.cs
│   └── Migrations/
│
└── BusinessApp.API/             ← "Entry Point"
    ├── Controllers/             → CustomersController.cs
    ├── Middleware/              → ExceptionHandlingMiddleware.cs
    ├── Models/                  → ApiResponse<T>.cs
    └── Program.cs
```

#### Aturan Dependency (5 menit)
- Dependency hanya boleh mengarah **ke dalam** (API → Application → Domain)
- Infrastructure implement interface dari Domain/Application
- Domain tidak boleh tahu tentang EF, HttpClient, atau apapun teknis

### Skeleton Project — Hands-on (40 menit)
#### Buat Solution & Projects (15 menit)
```bash
dotnet new sln -n BusinessApp
dotnet new classlib -n BusinessApp.Domain
dotnet new classlib -n BusinessApp.Application
dotnet new classlib -n BusinessApp.Infrastructure
dotnet new webapi -n BusinessApp.API

# Tambahkan ke solution
dotnet sln add BusinessApp.Domain
dotnet sln add BusinessApp.Application
dotnet sln add BusinessApp.Infrastructure
dotnet sln add BusinessApp.API

# Referensi antar project (sesuai aturan dependency)
dotnet add BusinessApp.Application reference BusinessApp.Domain
dotnet add BusinessApp.Infrastructure reference BusinessApp.Application
dotnet add BusinessApp.API reference BusinessApp.Application
dotnet add BusinessApp.API reference BusinessApp.Infrastructure
```

#### Buat Domain Entity & Interface (15 menit)
- Buat entity pertama sesuai domain yang dipilih (misal: `Customer.cs`)
```csharp
// BusinessApp.Domain/Entities/Customer.cs
public class Customer
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
    public string Phone { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}
```
- Buat `IRepository<T>` di Domain/Interfaces
```csharp
// BusinessApp.Domain/Interfaces/IRepository.cs
public interface IRepository<T> where T : class
{
    Task<IEnumerable<T>> GetAllAsync();
    Task<T?> GetByIdAsync(int id);
    Task AddAsync(T entity);
    Task UpdateAsync(T entity);
    Task DeleteAsync(int id);
}
```

#### Verify & Run (10 menit)
- Pastikan solution bisa di-build (`dotnet build`)
- Pastikan tidak ada circular dependency
- Diskusi: "Ini adalah fondasi yang akan kita isi di sesi 2"

### Review Sesi (10 menit)
- Recap: kenapa Clean Architecture, struktur 4 layer, dependency rules
- Preview sesi 2: akan implementasi Application + Infrastructure layer
- Q&A
- Assign homework

## Homework

### Tugas 1: Selesaikan Domain Layer
- Buat minimal **3 entity** sesuai domain bisnis yang dipilih (misal: Customer, Product, Order)
- Buat interface `IRepository<T>` dan specific interface per entity (misal: `ICustomerRepository`)
- Tambahkan property yang relevan untuk setiap entity
- **Deadline**: Sesi 2

### Tugas 2: Baca Referensi Clean Architecture
- Baca artikel: [Clean Architecture dengan ASP.NET Core](https://learn.microsoft.com/en-us/dotnet/architecture/modern-web-apps-azure/common-web-application-architectures)
- Pelajari konsep: Dependency Inversion Principle
- Catat pertanyaan untuk sesi 2
- **Deadline**: Sesi 2

### Tugas 3: Rancang Database Schema
- Buat ERD untuk 3 entity yang sudah dibuat
- Tentukan foreign key relationship antar entity
- Siapkan di atas kertas/draw.io
- **Deadline**: Sesi 2

## Resources

### Documentation
- [Clean Architecture - Microsoft](https://learn.microsoft.com/en-us/dotnet/architecture/modern-web-apps-azure/)
- [ASP.NET Core Web API Documentation](https://learn.microsoft.com/en-us/aspnet/core/web-api/)
- [.NET CLI Reference](https://learn.microsoft.com/en-us/dotnet/core/tools/)

### Reference Materials
- `Docs/competition-requirements-specification.md` — Spesifikasi teknis kompetisi
- `Docs-id/competition-requirements-specification-id.md` — Versi Bahasa Indonesia

## Notes untuk Mentor

### Tips
- Jangan habiskan lebih dari 20 menit untuk review/assessment awal — siswa sudah capable
- Fokus membangun **mental model** Clean Architecture dulu sebelum coding
- Gunakan analogi nyata: "Domain = aturan bisnis yang tidak berubah walau pakai DB apapun"
- Pastikan skeleton project bisa di-build sebelum sesi selesai

### Common Pitfalls
- Siswa bingung kenapa "terlalu banyak project" — jelaskan manfaat separation
- Circular dependency saat setup reference — verifikasi arah dependency
- Entity dibuat di layer yang salah (misal: di API project)

### Troubleshooting
- Jika `dotnet build` error: cek referensi antar project di `.csproj`
- Jika SQL Server tidak terdeteksi: cek service SQL Server di Windows Services
- Jika VS lambat: pastikan workload yang diinstall minimal (ASP.NET + .NET Desktop)

### Preparation untuk Sesi Berikutnya
- Pastikan skeleton project sudah bisa di-build
- Review entity yang dibuat siswa di homework sebelum sesi 2
- Siapkan contoh DTO, Service, dan DbContext yang sudah jadi untuk referensi demo

---

**Sesi**: 1 dari 5
**Durasi**: 2 jam
**Fokus**: API Kickoff + Clean Architecture Foundation
