# Sesi 2 - Application Layer + Infrastructure Layer

## Informasi Sesi
- **Durasi**: 2 jam (120 menit)
- **Fokus**: Implementasi Application Layer (DTOs, Services) dan Infrastructure Layer (EF, Repository)
- **Prerequisite**: Selesai Sesi 1 — skeleton project sudah ada, minimal 3 entity sudah didefinisikan

## Tujuan Pembelajaran
- [ ] Siswa dapat membuat DTO (Data Transfer Object) dan memahami perbedaannya dengan Entity
- [ ] Siswa dapat membuat Service Interface dan implementasinya di Application layer
- [ ] Siswa dapat setup EF Core di Infrastructure layer (DbContext, connection string)
- [ ] Siswa dapat mengimplementasikan Generic Repository pattern
- [ ] Siswa dapat menjalankan EF Migrations dan memverifikasi database terbuat
- [ ] Siswa dapat menyusun Dependency Injection di Program.cs

## Materi (120 menit)

### Review Homework (15 menit)
- Cek entity yang sudah dibuat (minimal 3 entity)
- Cek ERD — verifikasi relationship antar entity masuk akal
- Cek interface IRepository yang sudah dibuat
- Feedback dan koreksi naming/property
- Q&A dari studi Clean Architecture

### Application Layer (30 menit)
#### DTOs — Teori & Demo (15 menit)
- **Mengapa DTO?** Entity tidak boleh langsung diekspos ke API (ada field sensitif, ada field yang tidak perlu)
- Jenis DTO:
  - `XxxDto` — untuk response (data yang dikirim ke client)
  - `CreateXxxRequest` — untuk body request POST
  - `UpdateXxxRequest` — untuk body request PUT
- Demo membuat DTO untuk 1 entity:
```csharp
// BusinessApp.Application/DTOs/CustomerDto.cs
public class CustomerDto
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
    public string Phone { get; set; } = string.Empty;
}

// BusinessApp.Application/DTOs/CreateCustomerRequest.cs
public class CreateCustomerRequest
{
    public string Name { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
    public string Phone { get; set; } = string.Empty;
}
```

#### Service Interface & Implementation (15 menit)
- Buat interface `ICustomerService` di Application/Interfaces:
```csharp
public interface ICustomerService
{
    Task<IEnumerable<CustomerDto>> GetAllAsync();
    Task<CustomerDto?> GetByIdAsync(int id);
    Task<CustomerDto> CreateAsync(CreateCustomerRequest request);
    Task<CustomerDto> UpdateAsync(int id, UpdateCustomerRequest request);
    Task DeleteAsync(int id);
}
```
- Buat `CustomerService.cs` di Application/Services:
  - Constructor inject `ICustomerRepository` (bukan DbContext langsung)
  - Implementasi mapping manual Entity → DTO (tidak pakai AutoMapper)
  - Throw exception jika entity tidak ditemukan

### Infrastructure Layer (30 menit)
#### EF Core Setup (10 menit)
- Install NuGet packages di Infrastructure project:
  ```
  Microsoft.EntityFrameworkCore
  Microsoft.EntityFrameworkCore.SqlServer
  Microsoft.EntityFrameworkCore.Tools
  ```
- Buat `AppDbContext.cs`:
```csharp
// BusinessApp.Infrastructure/Data/AppDbContext.cs
public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<Customer> Customers => Set<Customer>();
    public DbSet<Product> Products => Set<Product>();
    // ... tambahkan entity lainnya

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // Konfigurasi relasi, constraints, seed data
        base.OnModelCreating(modelBuilder);
    }
}
```

#### Generic Repository Implementation (15 menit)
```csharp
// BusinessApp.Infrastructure/Repositories/Repository.cs
public class Repository<T> : IRepository<T> where T : class
{
    protected readonly AppDbContext _context;
    protected readonly DbSet<T> _dbSet;

    public Repository(AppDbContext context)
    {
        _context = context;
        _dbSet = context.Set<T>();
    }

    public async Task<IEnumerable<T>> GetAllAsync() 
        => await _dbSet.ToListAsync();

    public async Task<T?> GetByIdAsync(int id) 
        => await _dbSet.FindAsync(id);

    public async Task AddAsync(T entity)
    {
        await _dbSet.AddAsync(entity);
        await _context.SaveChangesAsync();
    }

    public async Task UpdateAsync(T entity)
    {
        _dbSet.Update(entity);
        await _context.SaveChangesAsync();
    }

    public async Task DeleteAsync(int id)
    {
        var entity = await GetByIdAsync(id);
        if (entity != null)
        {
            _dbSet.Remove(entity);
            await _context.SaveChangesAsync();
        }
    }
}
```

#### EF Migration (5 menit)
- Setup connection string di `appsettings.json` (API project)
- Register DbContext di `Program.cs`
- Jalankan migration:
  ```bash
  dotnet ef migrations add InitialCreate --project BusinessApp.Infrastructure --startup-project BusinessApp.API
  dotnet ef database update --project BusinessApp.Infrastructure --startup-project BusinessApp.API
  ```
- Verifikasi di SSMS bahwa tabel terbuat

### Dependency Injection Setup (15 menit)
#### Register di Program.cs (10 menit)
```csharp
// BusinessApp.API/Program.cs
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// Register Repository
builder.Services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
builder.Services.AddScoped<ICustomerRepository, CustomerRepository>();

// Register Service
builder.Services.AddScoped<ICustomerService, CustomerService>();
```

#### Verify DI Chain (5 menit)
- Build project dan pastikan tidak ada error
- Diskusi: "Kenapa pakai Scoped bukan Singleton untuk DB context?"

### Practice (20 menit)
#### Latihan: Lengkapi untuk 2 Entity Lainnya (20 menit)
- Buat DTO lengkap (Dto, CreateRequest, UpdateRequest) untuk 2 entity lainnya
- Buat Service Interface + Implementation untuk 2 entity lainnya
- Register semua di Program.cs
- Pastikan build berhasil dan migration update berjalan

### Review (10 menit)
- Cek semua entity sudah ada DTO-nya
- Cek semua service sudah terdaftar di DI
- Cek database sudah terbuat di SSMS
- Recap dependency rule: "Service tidak tahu DbContext, Repository tidak tahu Service"
- Q&A dan preview sesi 3

## Homework

### Tugas 1: Lengkapi Semua Service
- Pastikan semua entity memiliki Service lengkap (GetAll, GetById, Create, Update, Delete)
- Implementasi validasi dasar di service: null check, empty string check
- Throw `NotFoundException` jika entity tidak ditemukan (buat custom exception di Domain)
- **Deadline**: Sesi 3

### Tugas 2: Seed Data
- Tambahkan seed data di `OnModelCreating` menggunakan `modelBuilder.Entity<T>().HasData()`
- Minimal 5 rekaman per entity
- Jalankan migration baru: `dotnet ef migrations add SeedData`
- Verifikasi data ada di SSMS
- **Deadline**: Sesi 3

### Tugas 3: Pelajari HTTP Status Codes
- Pelajari: 200, 201, 400, 404, 409, 500 dan kapan digunakan
- Catat pertanyaan untuk sesi 3
- **Deadline**: Sesi 3

## Resources

### Documentation
- [EF Core — Getting Started](https://learn.microsoft.com/en-us/ef/core/get-started/overview/first-app)
- [EF Core — Migrations](https://learn.microsoft.com/en-us/ef/core/managing-schemas/migrations/)
- [Repository Pattern](https://learn.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/infrastructure-persistence-layer-design)

### Code Examples
- Sample AppDbContext configuration
- Sample Generic Repository
- Sample Service implementation dengan mapping manual

## Notes untuk Mentor

### Tips
- Tekankan: "DTO bukan Entity — entity untuk DB, DTO untuk API"
- Jika siswa bertanya tentang AutoMapper: boleh, tapi ajarkan mapping manual dulu agar siswa paham alurnya
- Cek apakah migration berhasil SEBELUM sesi selesai — ini sering jadi blocker
- Gunakan SSMS untuk live demo "lihat tabel terbuat"

### Common Pitfalls
- Lupa tambahkan `Microsoft.EntityFrameworkCore.Design` ke API project (diperlukan untuk migration command)
- Connection string salah format (terutama Windows Auth vs SQL Auth)
- Service inject DbContext langsung, bukan melalui Repository interface
- Migration dijalankan di project yang salah

### Troubleshooting
- Error `No DbContext found`: pastikan `--startup-project` menunjuk ke API project
- Error koneksi: cek SQL Server service berjalan, cek nama server di connection string
- Build error: verifikasi semua project reference sudah benar

### Preparation untuk Sesi Berikutnya
- Review service implementation siswa dari homework
- Pastikan database dan seed data sudah ada
- Siapkan contoh Controller lengkap dengan ApiResponse wrapper untuk demo sesi 3
- Siapkan contoh Global Exception Handler Middleware

---

**Sesi**: 2 dari 5
**Durasi**: 2 jam
**Fokus**: Application Layer (DTO, Service) + Infrastructure Layer (EF, Repository)
