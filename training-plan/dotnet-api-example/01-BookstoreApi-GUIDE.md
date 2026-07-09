# Panduan Pembuatan Proyek BookstoreApi (Clean Architecture - .NET 8)

Panduan ini menjelaskan langkah-demi-langkah bagi siswa untuk membuat solusi ASP.NET Core Web API menggunakan **Clean Architecture** (4 Layer) secara mandiri dari awal menggunakan .NET CLI (Command Line Interface).

---

## Daftar Isi
1. [Langkah 1: Setup Solution & Project Structure](#langkah-1-setup-solution--project-structure)
2. [Langkah 2: Menambahkan Project References (Hubungan Antar Layer)](#langkah-2-menambahkan-project-references-hubungan-antar-layer)
3. [Langkah 3: Menginstal NuGet Packages (.NET 8)](#langkah-3-menginstal-nuget-packages-net-8)
4. [Langkah 4: Membuat Domain Layer (Core)](#langkah-4-membuat-domain-layer-core)
5. [Langkah 5: Membuat Application Layer](#langkah-5-membuat-application-layer)
6. [Langkah 6: Membuat Infrastructure Layer](#langkah-6-membuat-infrastructure-layer)
7. [Langkah 7: Membuat API Layer (Web Entry Point)](#langkah-7-membuat-api-layer-web-entry-point)
8. [Langkah 8: Menjalankan Migrasi Database & Menjalankan Aplikasi](#langkah-8-menjalankan-migrasi-database--menjalankan-aplikasi)

---

## Langkah 1: Setup Solution & Project Structure

Buka Terminal (PowerShell / Command Prompt) pada direktori kerja Anda (misalnya `dotnet-api-example/01-BookstoreApi`) dan jalankan perintah berikut secara berurutan:

```bash
# 1. Membuat folder src untuk menampung source code
mkdir src
cd src

# 2. Membuat proyek untuk masing-masing layer
dotnet new classlib -n BookstoreApi.Domain -o BookstoreApi.Domain
dotnet new classlib -n BookstoreApi.Application -o BookstoreApi.Application
dotnet new classlib -n BookstoreApi.Infrastructure -o BookstoreApi.Infrastructure
dotnet new webapi -n BookstoreApi.API -o BookstoreApi.API

# 3. Kembali ke folder root (01-BookstoreApi)
cd ..

# 4. Membuat file Solution (.sln)
dotnet new sln -n BookstoreApi

# 5. Mendaftarkan seluruh project ke dalam Solution (.sln)
dotnet sln BookstoreApi.sln add src/BookstoreApi.Domain/BookstoreApi.Domain.csproj
dotnet sln BookstoreApi.sln add src/BookstoreApi.Application/BookstoreApi.Application.csproj
dotnet sln BookstoreApi.sln add src/BookstoreApi.Infrastructure/BookstoreApi.Infrastructure.csproj
dotnet sln BookstoreApi.sln add src/BookstoreApi.API/BookstoreApi.API.csproj
```

---

## Langkah 2: Menambahkan Project References (Hubungan Antar Layer)

Pastikan dependensi antar layer terhubung sesuai aturan Clean Architecture:
- `API` bergantung pada `Application` & `Infrastructure`.
- `Infrastructure` bergantung pada `Application` & `Domain`.
- `Application` bergantung pada `Domain`.
- `Domain` independen (tidak bergantung pada layer lain).

Jalankan perintah berikut:

```bash
# Application -> Domain
dotnet add src/BookstoreApi.Application/BookstoreApi.Application.csproj reference src/BookstoreApi.Domain/BookstoreApi.Domain.csproj

# Infrastructure -> Application & Domain
dotnet add src/BookstoreApi.Infrastructure/BookstoreApi.Infrastructure.csproj reference src/BookstoreApi.Domain/BookstoreApi.Domain.csproj
dotnet add src/BookstoreApi.Infrastructure/BookstoreApi.Infrastructure.csproj reference src/BookstoreApi.Application/BookstoreApi.Application.csproj

# API -> Application & Infrastructure
dotnet add src/BookstoreApi.API/BookstoreApi.API.csproj reference src/BookstoreApi.Application/BookstoreApi.Application.csproj
dotnet add src/BookstoreApi.API/BookstoreApi.API.csproj reference src/BookstoreApi.Infrastructure/BookstoreApi.Infrastructure.csproj
```

---

## Langkah 3: Menginstal NuGet Packages (.NET 8)

Gunakan versi paket NuGet yang kompatibel dengan **.NET 8.0**:

```bash
# 1. Install packages di Application Layer
dotnet add src/BookstoreApi.Application/BookstoreApi.Application.csproj package FluentValidation --version 11.11.0

# 2. Install packages di Infrastructure Layer (EF Core & JWT)
dotnet add src/BookstoreApi.Infrastructure/BookstoreApi.Infrastructure.csproj package Microsoft.EntityFrameworkCore.Sqlite --version 8.0.14
dotnet add src/BookstoreApi.Infrastructure/BookstoreApi.Infrastructure.csproj package Microsoft.EntityFrameworkCore.SqlServer --version 8.0.14
dotnet add src/BookstoreApi.Infrastructure/BookstoreApi.Infrastructure.csproj package Microsoft.EntityFrameworkCore.Tools --version 8.0.14
dotnet add src/BookstoreApi.Infrastructure/BookstoreApi.Infrastructure.csproj package BCrypt.Net-Next --version 4.2.0
dotnet add src/BookstoreApi.Infrastructure/BookstoreApi.Infrastructure.csproj package Microsoft.Extensions.Configuration.Abstractions --version 8.0.0
dotnet add src/BookstoreApi.Infrastructure/BookstoreApi.Infrastructure.csproj package Microsoft.IdentityModel.Tokens --version 8.9.0
dotnet add src/BookstoreApi.Infrastructure/BookstoreApi.Infrastructure.csproj package System.IdentityModel.Tokens.Jwt --version 8.9.0

# 3. Install packages di API Layer
dotnet add src/BookstoreApi.API/BookstoreApi.API.csproj package Microsoft.AspNetCore.Authentication.JwtBearer --version 8.0.14
dotnet add src/BookstoreApi.API/BookstoreApi.API.csproj package Microsoft.EntityFrameworkCore.Design --version 8.0.14
dotnet add src/BookstoreApi.API/BookstoreApi.API.csproj package Swashbuckle.AspNetCore --version 6.9.0
```

*Catatan: hapus file stubs bawaan seperti `Class1.cs` di setiap folder project classlib.*

---

## Langkah 4: Membuat Domain Layer (Core)

Domain layer hanya berisi entities, custom domain exceptions, dan interfaces repository.

### A. Entities (di folder `src/BookstoreApi.Domain/Entities/`)

1. **User.cs**:
```csharp
namespace BookstoreApi.Domain.Entities;

public class User
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
    public string PasswordHash { get; set; } = string.Empty;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}
```

2. **Category.cs**:
```csharp
namespace BookstoreApi.Domain.Entities;

public class Category
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public ICollection<Book> Books { get; set; } = new List<Book>();
}
```

3. **Book.cs**:
```csharp
namespace BookstoreApi.Domain.Entities;

public class Book
{
    public int Id { get; set; }
    public string Title { get; set; } = string.Empty;
    public string Author { get; set; } = string.Empty;
    public string ISBN { get; set; } = string.Empty;
    public decimal Price { get; set; }
    public int Stock { get; set; }
    public int CategoryId { get; set; }
    public Category Category { get; set; } = null!;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}
```

### B. Custom Exceptions (di folder `src/BookstoreApi.Domain/Exceptions/`)
Buat class exception agar API dapat mengembalikan HTTP Status Code yang sesuai saat terjadi error logika bisnis:
- `NotFoundException.cs` (mengembalikan 404)
- `ConflictException.cs` (mengembalikan 409)
- `BusinessRuleException.cs` (mengembalikan 422)

### C. Interfaces Repositories (di folder `src/BookstoreApi.Domain/Interfaces/Repositories/`)
Definisikan operasi database dasar tanpa memikirkan implementasi database konkret:
- `IUserRepository.cs`
- `ICategoryRepository.cs`
- `IBookRepository.cs`

---

## Langkah 5: Membuat Application Layer

Application Layer berisi Business Logic, DTOs, interfaces application, dan Core Services.

### A. ApiResponse Wrapper (di `src/BookstoreApi.Application/Common/ApiResponse.cs`)
Standardisasi format response JSON agar konsisten:
```csharp
namespace BookstoreApi.Application.Common;

public class ApiResponse<T>
{
    public bool Success { get; set; }
    public string Message { get; set; } = string.Empty;
    public T? Data { get; set; }
    public List<string>? Errors { get; set; }

    public static ApiResponse<T> SuccessResult(T data, string message = "Success") =>
        new() { Success = true, Message = message, Data = data };

    public static ApiResponse<T> FailResult(string message, List<string>? errors = null) =>
        new() { Success = false, Message = message, Errors = errors };
}
```

### B. DTOs (Data Transfer Objects)
Buat kelas request & response untuk data transfer (misal: `LoginRequest`, `RegisterRequest`, `BookResponse`, dll.) di folder `src/BookstoreApi.Application/DTOs/`.

### C. Application Interfaces (di `src/BookstoreApi.Application/Interfaces/`)
- `IJwtService.cs` untuk token generation.

### D. Services (di `src/BookstoreApi.Application/Services/`)
Implementasikan business logic. Kelas ini menginjeksikan repository interfaces dan mengoordinasikan alur bisnis.
- `AuthService.cs`
- `CategoryService.cs`
- `BookService.cs`

---

## Langkah 6: Membuat Infrastructure Layer

Infrastructure layer menangani data access (EF Core, DbContext), Repositories konkret, dan service eksternal (JWT generator, dll).

### A. AppDbContext (di `src/BookstoreApi.Infrastructure/Data/AppDbContext.cs`)
```csharp
using BookstoreApi.Domain.Entities;
using Microsoft.EntityFrameworkCore;

namespace BookstoreApi.Infrastructure.Data;

public class AppDbContext : DbContext
{
    public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

    public DbSet<User> Users => Set<User>();
    public DbSet<Category> Categories => Set<Category>();
    public DbSet<Book> Books => Set<Book>();

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<User>().HasIndex(u => u.Email).IsUnique();
        modelBuilder.Entity<Book>().HasIndex(b => b.ISBN).IsUnique();
        modelBuilder.Entity<Book>().HasOne(b => b.Category).WithMany(c => c.Books).HasForeignKey(b => b.CategoryId).OnDelete(DeleteBehavior.Restrict);

        // Seed data
        modelBuilder.Entity<Category>().HasData(
            new Category { Id = 1, Name = "Fiction" },
            new Category { Id = 2, Name = "Non-Fiction" }
        );
    }
}
```

### B. Repositories (di `src/BookstoreApi.Infrastructure/Repositories/`)
Implementasikan query EF Core menggunakan DbContext.
- `UserRepository.cs` (mengimplementasikan `IUserRepository`)
- `CategoryRepository.cs` (mengimplementasikan `ICategoryRepository`)
- `BookRepository.cs` (mengimplementasikan `IBookRepository`)

---

## Langkah 7: Membuat API Layer (Web Entry Point)

Layer terluar yang mengekspos endpoint HTTP.

### A. Global Exception Handler Middleware
Buat penanganan error terpusat di `src/BookstoreApi.API/Middleware/GlobalExceptionHandler.cs` yang mengimplementasikan `IExceptionHandler` dari ASP.NET Core 8 untuk menangkap exception dari Application/Domain dan membungkusnya ke dalam format `ApiResponse.FailResult()`.

### B. Controllers (di `src/BookstoreApi.API/Controllers/`)
Hubungkan HTTP Request ke Application Services:
- `AuthController.cs` (endpoint: `/api/auth/register`, `/api/auth/login`, `/api/auth/me`)
- `CategoriesController.cs` (endpoint CRUD `/api/categories`)
- `BooksController.cs` (endpoint CRUD `/api/books` dengan pagination & search)

### C. Program.cs (di `src/BookstoreApi.API/Program.cs`)
Daftarkan Dependency Injection (DI), konfigurasi DB Provider switchable (SQLite/SQL Server), setup JWT authentication middleware, dan aktifkan Swagger dengan tombol input token Authorization (Bearer).

---

## Langkah 8: Menjalankan Migrasi Database & Menjalankan Aplikasi

Jalankan perintah berikut pada terminal di folder **`01-BookstoreApi`**:

```bash
# 1. Menambahkan Migrasi Pertama
dotnet ef migrations add InitialCreate --project src/BookstoreApi.Infrastructure/BookstoreApi.Infrastructure.csproj --startup-project src/BookstoreApi.API/BookstoreApi.API.csproj --context AppDbContext

# 2. Menjalankan Aplikasi Web API (otomatis melakukan database update/migrate saat startup)
dotnet run --project src/BookstoreApi.API/BookstoreApi.API.csproj --urls "http://localhost:5001"
```

Buka browser Anda dan akses halaman Swagger di:
👉 **[http://localhost:5001/swagger](http://localhost:5001/swagger)**
