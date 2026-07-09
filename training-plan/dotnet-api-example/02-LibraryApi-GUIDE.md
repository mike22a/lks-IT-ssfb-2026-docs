# Panduan Pembuatan Proyek LibraryApi (Clean Architecture - .NET 8)

Panduan ini menjelaskan langkah-demi-langkah bagi siswa untuk membuat solusi ASP.NET Core Web API untuk **Library Loan System (Sistem Peminjaman Perpustakaan)** menggunakan **Clean Architecture** (4 Layer) secara mandiri dari awal menggunakan .NET CLI (Command Line Interface). 

Proyek ini berada pada tingkat **Medium** (Level 2) yang menambahkan kompleksitas berupa:
- **Role-Based Authorization** (Admin & Librarian)
- **Aturan Bisnis Transaksional** (Pengurangan jumlah copy buku saat dipinjam, pengembalian copy saat buku dikembalikan)
- **Kalkulasi Denda Otomatis** jika pengembalian melewati batas jatuh tempo (DueDate).

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

Buka Terminal (PowerShell / Command Prompt) pada direktori kerja Anda (misalnya `dotnet-api-example/02-LibraryApi`) dan jalankan perintah berikut secara berurutan:

```bash
# 1. Membuat folder src untuk menampung source code
mkdir src
cd src

# 2. Membuat proyek untuk masing-masing layer
dotnet new classlib -n LibraryApi.Domain -o LibraryApi.Domain
dotnet new classlib -n LibraryApi.Application -o LibraryApi.Application
dotnet new classlib -n LibraryApi.Infrastructure -o LibraryApi.Infrastructure
dotnet new webapi -n LibraryApi.API -o LibraryApi.API

# 3. Kembali ke folder root (02-LibraryApi)
cd ..

# 4. Membuat file Solution (.sln)
dotnet new sln -n LibraryApi

# 5. Mendaftarkan seluruh project ke dalam Solution (.sln)
dotnet sln LibraryApi.sln add src/LibraryApi.Domain/LibraryApi.Domain.csproj
dotnet sln LibraryApi.sln add src/LibraryApi.Application/LibraryApi.Application.csproj
dotnet sln LibraryApi.sln add src/LibraryApi.Infrastructure/LibraryApi.Infrastructure.csproj
dotnet sln LibraryApi.sln add src/LibraryApi.API/LibraryApi.API.csproj
```

---

## Langkah 2: Menambahkan Project References (Hubungan Antar Layer)

Pastikan dependensi antar layer terhubung sesuai aturan Clean Architecture:
- `API` bergantung pada `Application` & `Infrastructure`.
- `Infrastructure` bergantung pada `Application` & `Domain`.
- `Application` bergantung pada `Domain`.
- `Domain` tidak memiliki dependensi ke layer lain.

Jalankan perintah berikut:

```bash
# Application -> Domain
dotnet add src/LibraryApi.Application/LibraryApi.Application.csproj reference src/LibraryApi.Domain/LibraryApi.Domain.csproj

# Infrastructure -> Application & Domain
dotnet add src/LibraryApi.Infrastructure/LibraryApi.Infrastructure.csproj reference src/LibraryApi.Domain/LibraryApi.Domain.csproj
dotnet add src/LibraryApi.Infrastructure/LibraryApi.Infrastructure.csproj reference src/LibraryApi.Application/LibraryApi.Application.csproj

# API -> Application & Infrastructure
dotnet add src/LibraryApi.API/LibraryApi.API.csproj reference src/LibraryApi.Application/LibraryApi.Application.csproj
dotnet add src/LibraryApi.API/LibraryApi.API.csproj reference src/LibraryApi.Infrastructure/LibraryApi.Infrastructure.csproj
```

---

## Langkah 3: Menginstal NuGet Packages (.NET 8)

Gunakan versi paket NuGet yang kompatibel dengan **.NET 8.0**:

```bash
# 1. Install packages di Application Layer
dotnet add src/LibraryApi.Application/LibraryApi.Application.csproj package FluentValidation --version 11.11.0

# 2. Install packages di Infrastructure Layer (EF Core, JWT, BCrypt)
dotnet add src/LibraryApi.Infrastructure/LibraryApi.Infrastructure.csproj package Microsoft.EntityFrameworkCore.Sqlite --version 8.0.14
dotnet add src/LibraryApi.Infrastructure/LibraryApi.Infrastructure.csproj package Microsoft.EntityFrameworkCore.SqlServer --version 8.0.14
dotnet add src/LibraryApi.Infrastructure/LibraryApi.Infrastructure.csproj package Microsoft.EntityFrameworkCore.Tools --version 8.0.14
dotnet add src/LibraryApi.Infrastructure/LibraryApi.Infrastructure.csproj package BCrypt.Net-Next --version 4.2.0
dotnet add src/LibraryApi.Infrastructure/LibraryApi.Infrastructure.csproj package Microsoft.Extensions.Configuration.Abstractions --version 8.0.0
dotnet add src/LibraryApi.Infrastructure/LibraryApi.Infrastructure.csproj package Microsoft.IdentityModel.Tokens --version 8.9.0
dotnet add src/LibraryApi.Infrastructure/LibraryApi.Infrastructure.csproj package System.IdentityModel.Tokens.Jwt --version 8.9.0

# 3. Install packages di API Layer
dotnet add src/LibraryApi.API/LibraryApi.API.csproj package Microsoft.AspNetCore.Authentication.JwtBearer --version 8.0.14
dotnet add src/LibraryApi.API/LibraryApi.API.csproj package Microsoft.EntityFrameworkCore.Design --version 8.0.14
dotnet add src/LibraryApi.API/LibraryApi.API.csproj package Swashbuckle.AspNetCore --version 6.9.0
```

*Catatan: hapus file stubs bawaan seperti `Class1.cs` di setiap folder project classlib.*

---

## Langkah 4: Membuat Domain Layer (Core)

Domain layer hanya berisi entities, enums, custom domain exceptions, dan interfaces repository.

### A. Entities & Enums (di folder `src/LibraryApi.Domain/Entities/`)

1. **User.cs**:
```csharp
namespace LibraryApi.Domain.Entities;

public enum UserRole
{
    Admin,
    Librarian
}

public class User
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public string Email { get; set; } = string.Empty;
    public string PasswordHash { get; set; } = string.Empty;
    public UserRole Role { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}
```

2. **Category.cs**:
```csharp
namespace LibraryApi.Domain.Entities;

public class Category
{
    public int Id { get; set; }
    public string Name { get; set; } = string.Empty;
    public ICollection<Book> Books { get; set; } = new List<Book>();
}
```

3. **Book.cs**:
```csharp
namespace LibraryApi.Domain.Entities;

public class Book
{
    public int Id { get; set; }
    public string Title { get; set; } = string.Empty;
    public string Author { get; set; } = string.Empty;
    public string ISBN { get; set; } = string.Empty;
    public int CategoryId { get; set; }
    public Category Category { get; set; } = null!;
    public int TotalCopies { get; set; }
    public int AvailableCopies { get; set; }
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}
```

4. **Borrowing.cs**:
```csharp
namespace LibraryApi.Domain.Entities;

public enum BorrowingStatus
{
    Borrowed,
    Returned,
    Overdue
}

public class Borrowing
{
    public int Id { get; set; }
    public int BookId { get; set; }
    public Book Book { get; set; } = null!;
    public string MemberName { get; set; } = string.Empty;
    public DateTime BorrowDate { get; set; }
    public DateTime DueDate { get; set; }
    public DateTime? ReturnDate { get; set; }
    public BorrowingStatus Status { get; set; } = BorrowingStatus.Borrowed;
    public decimal FineAmount { get; set; } = 0;
    public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
}
```

### B. Custom Exceptions (di folder `src/LibraryApi.Domain/Exceptions/`)
Exception murni untuk penanganan logika error bisnis yang nanti ditangkap oleh middleware global:
- `NotFoundException.cs` (mengembalikan 404)
- `ConflictException.cs` (mengembalikan 409)
- `BusinessRuleException.cs` (mengembalikan 422)

### C. Interfaces Repositories (di folder `src/LibraryApi.Domain/Interfaces/Repositories/`)
Abstraksi database tanpa EF Core:
- `IUserRepository.cs`
- `ICategoryRepository.cs`
- `IBookRepository.cs`
- `IBorrowingRepository.cs`

---

## Langkah 5: Membuat Application Layer

Application Layer berisi Business Logic, DTOs, interfaces, dan Core Services.

### A. ApiResponse Wrapper (di `src/LibraryApi.Application/Common/ApiResponse.cs`)
Standardisasi format response JSON agar konsisten.

### B. DTOs (Data Transfer Objects)
Dibuat di folder `src/LibraryApi.Application/DTOs/` untuk memisahkan model request/response dengan database:
- `Auth/UserDTOs.cs` (berisi request `RegisterRequest`, `LoginRequest`, `AuthResponse`, `UserResponse`)
- `Category/CategoryDTOs.cs`
- `Book/BookDTOs.cs`
- `Borrowing/BorrowingDTOs.cs`

### C. Services (di `src/LibraryApi.Application/Services/`)
Implementasikan business logic. Kelas ini menginjeksikan repository interfaces dan mengoordinasikan alur bisnis.
- **AuthService.cs**: Logika login, registrasi, pengelolaan librarian, dan hashing password.
- **CategoryService.cs**: CRUD kategori dengan proteksi relasi (kategori tidak bisa dihapus jika masih memiliki buku).
- **BookService.cs**: CRUD buku dengan logika perubahan stock/copies.
- **BorrowingService.cs**: Logika transaksi peminjaman (mengurangi `AvailableCopies`), pengembalian (menghitung denda secara otomatis sebesar 5000 IDR per hari keterlambatan, menambah `AvailableCopies`), dan pembaharuan status keterlambatan (Overdue).

---

## Langkah 6: Membuat Infrastructure Layer

Infrastructure layer menangani akses database (EF Core, DbContext), Repositories konkret, dan service eksternal (JWT generator).

### A. AppDbContext (di `src/LibraryApi.Infrastructure/Data/AppDbContext.cs`)
Mendaftarkan tabel, memetakan relasi restrict delete, dan menambahkan **Seed Data** bawaan untuk kategori, buku, serta default User (Admin: `admin@library.com`, Librarian: `john@library.com` dengan password default `password123` ter-hash BCrypt).

### B. Repositories (di `src/LibraryApi.Infrastructure/Repositories/`)
Implementasikan query database konkret menggunakan EF Core:
- `UserRepository.cs` (dengan verifikasi password BCrypt)
- `CategoryRepository.cs`
- `BookRepository.cs`
- `BorrowingRepository.cs`

### C. Services (di `src/LibraryApi.Infrastructure/Services/`)
- **JwtService.cs**: Membuat token JWT dengan menyertakan claim `Role` (Librarian/Admin) agar dibaca oleh middleware authorization di Web API.

---

## Langkah 7: Membuat API Layer (Web Entry Point)

Layer terluar yang mengekspos endpoint HTTP.

### A. Global Exception Handler Middleware (di `src/LibraryApi.API/Middleware/GlobalExceptionHandler.cs`)
Menangkap domain exception (`NotFoundException`, `ConflictException`, `BusinessRuleException`) dan merespons dengan HTTP Status Code yang sesuai (404, 409, 422) menggunakan format `ApiResponse.FailResult()`.

### B. Controllers (di `src/LibraryApi.API/Controllers/`)
Menghubungkan endpoint HTTP ke Application Services dengan dekorator `[Authorize]` dan `[Authorize(Roles = "Admin")]`:
- `AuthController.cs` (endpoint: `/api/auth/register`, `/api/auth/login`, `/api/auth/me`, dan admin-only `/api/auth/librarians`)
- `CategoriesController.cs` (read diizinkan untuk semua, write/delete diizinkan hanya untuk Admin)
- `BooksController.cs` (read/write diizinkan untuk Librarian/Admin, delete diizinkan hanya untuk Admin)
- `BorrowingsController.cs` (Librarian/Admin dapat melakukan pinjam, return, dan batch process overdue)

### C. Program.cs (di `src/LibraryApi.API/Program.cs`)
Mengonfigurasi Dependency Injection, switchable Database provider (SQLite/SQL Server), setup JWT authentication middleware dengan validasi Role, mendaftarkan middleware error handler global, dan mengaktifkan Swagger UI yang meminta Bearer Token authorization.

---

## Langkah 8: Menjalankan Migrasi Database & Menjalankan Aplikasi

Jalankan perintah berikut pada terminal di folder **`02-LibraryApi`**:

```bash
# 1. Menambahkan Migrasi Pertama
dotnet ef migrations add InitialCreate --project src/LibraryApi.Infrastructure/LibraryApi.Infrastructure.csproj --startup-project src/LibraryApi.API/LibraryApi.API.csproj --context AppDbContext

# 2. Menjalankan Aplikasi Web API (otomatis melakukan database update/migrate saat startup)
dotnet run --project src/LibraryApi.API/LibraryApi.API.csproj --urls "http://localhost:5002"
```

Buka browser Anda dan akses halaman Swagger di:
👉 **[http://localhost:5002/swagger](http://localhost:5002/swagger)**

### Cara Uji Coba Peminjaman
1. Login sebagai Librarian menggunakan akun bawaan:
   - Email: `john@library.com`
   - Password: `password123`
2. Salin token JWT dari respon login.
3. Klik tombol **Authorize** di pojok kanan atas Swagger, masukkan `Bearer <TOKEN_JWT_ANDA>` dan klik Authorize.
4. Lakukan GET `/api/books` untuk melihat buku yang tersedia (catat `Id` dan `availableCopies`).
5. Buat peminjaman melalui `POST /api/borrowings` dengan JSON body:
   ```json
   {
     "bookId": 1,
     "memberName": "Siswa Cerdas",
     "durationDays": 7
   }
   ```
6. Cek kembali `/api/books/{id}`. `availableCopies` harus berkurang 1.
7. Lakukan pengembalian melalui `PUT /api/borrowings/{id}/return` dengan memasukkan `returnDate` yang terlambat (misal 10 hari setelah hari ini) untuk menguji kalkulasi denda otomatis.
