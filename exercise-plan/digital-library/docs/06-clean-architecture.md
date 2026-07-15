# Clean Architecture

## Digital Library Training Kit

---

## Purpose

Menjelaskan konsep Clean Architecture dan implementasinya dalam project Digital Library.

---

## Scope

Dokumen ini mencakup:

- Penjelasan Clean Architecture
- Dependency Rule
- Project structure
- Layer responsibilities
- Repository Pattern
- DTO (Data Transfer Object)
- Services
- Dependency Injection
- Flow data
- Common mistakes

---

## Learning Objectives

Setelah membaca dokumen ini, siswa dapat:

- Memahami konsep Clean Architecture
- Mengerti dependency rule
- Mengetahui struktur project Clean Architecture
- Memahami tanggung jawab setiap layer
- Implement Repository Pattern
- Menggunakan DTO
- Menerapkan Dependency Injection
- Mengerti flow data antar layer

---

## Prerequisites

- Sudah membaca [01-project-overview.md](./01-project-overview.md)
- Memahami konsep OOP dasar
- Memahami konsep dependency

---

## Business Rules

- Domain layer tidak bergantung ke layer manapun
- Application layer hanya bergantung ke Domain
- Infrastructure layer bergantung ke Application dan Domain
- Presentation layer hanya bergantung ke Application
- Business logic harus di Application layer
- Controller tidak boleh berisi logic

---

## Design / Main Content

### Penjelasan Clean Architecture

Clean Architecture adalah arsitektur software yang memisahkan concern menjadi layer-layer independen dengan dependency rule yang ketat.

**Prinsip Utama:**
1. **Independence of Framework**: Tidak terikat ke framework tertentu
2. **Testability**: Business logic bisa di-test tanpa UI, database, web server
3. **Independence of UI**: UI bisa berubah tanpa mengubah business logic
4. **Independence of Database**: Database bisa diganti tanpa mengubah business logic
5. **Independence of External Agency**: Business logic tidak tahu tentang external world

### Dependency Rule

**Aturan Golden:**
- Dependency hanya mengarah ke dalam (inward)
- Inner layer tidak tahu tentang outer layer
- Outer layer bergantung ke inner layer

```
┌─────────────────────────────────────┐
│   Presentation Layer                │ ← Bergantung ke Application
│   (API, WinForms, Android)          │
└─────────────────────────────────────┘
                ↓
┌─────────────────────────────────────┐
│   Application Layer                 │ ← Bergantung ke Domain
│   (Services, DTOs, Interfaces)     │
└─────────────────────────────────────┘
                ↓
┌─────────────────────────────────────┐
│   Domain Layer                      │ ← Tidak bergantung ke apapun
│   (Entities)                        │
└─────────────────────────────────────┘
                ↑
┌─────────────────────────────────────┐
│   Infrastructure Layer               │ ← Bergantung ke Application & Domain
│   (EF Core, SQL Server)             │
└─────────────────────────────────────┘
```

### Project Structure

```
DigitalLibrary.sln
├── DigitalLibrary.Domain/
│   ├── Entities/
│   │   ├── User.cs
│   │   ├── Category.cs
│   │   ├── Book.cs
│   │   ├── Borrowing.cs
│   │   └── BorrowingDetail.cs
│   └── DigitalLibrary.Domain.csproj
│
├── DigitalLibrary.Application/
│   ├── Interfaces/
│   │   ├── IRepository.cs
│   │   ├── ICategoryService.cs
│   │   ├── IBookService.cs
│   │   └── IBorrowingService.cs
│   ├── DTOs/
│   │   ├── CategoryDto.cs
│   │   ├── BookDto.cs
│   │   └── BorrowingDto.cs
│   ├── Services/
│   │   ├── CategoryService.cs
│   │   ├── BookService.cs
│   │   └── BorrowingService.cs
│   └── DigitalLibrary.Application.csproj
│
├── DigitalLibrary.Infrastructure/
│   ├── Data/
│   │   ├── ApplicationDbContext.cs
│   │   └── Configurations/
│   ├── Repositories/
│   │   ├── Repository.cs
│   │   ├── CategoryRepository.cs
│   │   ├── BookRepository.cs
│   │   └── BorrowingRepository.cs
│   └── DigitalLibrary.Infrastructure.csproj
│
├── DigitalLibrary.API/
│   ├── Controllers/
│   │   ├── CategoriesController.cs
│   │   ├── BooksController.cs
│   │   └── BorrowingsController.cs
│   ├── Program.cs
│   └── DigitalLibrary.API.csproj
│
└── DigitalLibrary.WinForms/
    ├── Forms/
    │   ├── MainForm.cs
    │   ├── CategoryForm.cs
    │   └── BookForm.cs
    └── DigitalLibrary.WinForms.csproj
```

### Layer Responsibilities

#### 1. Domain Layer

**Tanggung Jawab:**
- Mendefinisikan entity dan business object
- Tidak bergantung ke layer manapun
- Murni business object tanpa infrastructure concern

**Isi:**
- Entity classes (User, Category, Book, dll)
- Value objects (jika ada)
- Domain events (jika ada)

**Contoh Entity:**
```csharp
namespace DigitalLibrary.Domain.Entities
{
    public class Book
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public int CategoryId { get; set; }
        public int Stock { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
    }
}
```

#### 2. Application Layer

**Tanggung Jawab:**
- Mendefinisikan use cases dan business logic
- Meng orchestrate flow data
- Mendefinisikan interfaces untuk repository dan service

**Isi:**
- Interfaces (IRepository, IService)
- DTOs (Data Transfer Objects)
- Services (business logic implementation)
- Mapping profiles

**Contoh Interface:**
```csharp
namespace DigitalLibrary.Application.Interfaces
{
    public interface IBookService
    {
        Task<IEnumerable<BookDto>> GetAllBooksAsync();
        Task<BookDto> GetBookByIdAsync(int id);
        Task<BookDto> CreateBookAsync(CreateBookDto dto);
        Task<BookDto> UpdateBookAsync(int id, UpdateBookDto dto);
        Task DeleteBookAsync(int id);
    }
}
```

#### 3. Infrastructure Layer

**Tanggung Jawab:**
- Implement interfaces dari Application layer
- Handle external concerns (database, file system, web service)
- Implement repository pattern

**Isi:**
- DbContext (EF Core)
- Repository implementations
- External service clients
- Configuration

**Contoh Repository:**
```csharp
namespace DigitalLibrary.Infrastructure.Repositories
{
    public class BookRepository : Repository<Book>, IBookRepository
    {
        public BookRepository(ApplicationDbContext context) 
            : base(context)
        {
        }

        public async Task<IEnumerable<Book>> GetByCategoryAsync(int categoryId)
        {
            return await _context.Books
                .Where(b => b.CategoryId == categoryId)
                .ToListAsync();
        }
    }
}
```

#### 4. Presentation Layer

**Tanggung Jawab:**
- Handle user interaction
- Present data ke user
- Receive input dari user
- Tidak berisi business logic

**Isi:**
- Controllers (API)
- Forms (WinForms)
- Activities/Fragment (Android)

**Contoh Controller:**
```csharp
namespace DigitalLibrary.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BooksController : ControllerBase
    {
        private readonly IBookService _bookService;

        public BooksController(IBookService bookService)
        {
            _bookService = bookService;
        }

        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var books = await _bookService.GetAllBooksAsync();
            return Ok(books);
        }
    }
}
```

### Repository Pattern

**Tujuan:**
- Abstraksi akses data
- Memisahkan business logic dari data access logic
- Memudahkan testing (bisa mock repository)

**Generic Repository:**
```csharp
public interface IRepository<T> where T : class
{
    Task<T> GetByIdAsync(int id);
    Task<IEnumerable<T>> GetAllAsync();
    Task<T> AddAsync(T entity);
    Task UpdateAsync(T entity);
    Task DeleteAsync(T entity);
}

public class Repository<T> : IRepository<T> where T : class
{
    protected readonly ApplicationDbContext _context;
    protected readonly DbSet<T> _dbSet;

    public Repository(ApplicationDbContext context)
    {
        _context = context;
        _dbSet = context.Set<T>();
    }

    public async Task<T> GetByIdAsync(int id)
    {
        return await _dbSet.FindAsync(id);
    }

    public async Task<IEnumerable<T>> GetAllAsync()
    {
        return await _dbSet.ToListAsync();
    }

    public async Task<T> AddAsync(T entity)
    {
        await _dbSet.AddAsync(entity);
        await _context.SaveChangesAsync();
        return entity;
    }

    public async Task UpdateAsync(T entity)
    {
        _dbSet.Update(entity);
        await _context.SaveChangesAsync();
    }

    public async Task DeleteAsync(T entity)
    {
        _dbSet.Remove(entity);
        await _context.SaveChangesAsync();
    }
}
```

**Specific Repository:**
```csharp
public interface IBookRepository : IRepository<Book>
{
    Task<IEnumerable<Book>> GetByCategoryAsync(int categoryId);
    Task<IEnumerable<Book>> SearchAsync(string keyword);
}

public class BookRepository : Repository<Book>, IBookRepository
{
    public BookRepository(ApplicationDbContext context) 
        : base(context)
    {
    }

    public async Task<IEnumerable<Book>> GetByCategoryAsync(int categoryId)
    {
        return await _context.Books
            .Where(b => b.CategoryId == categoryId)
            .ToListAsync();
    }

    public async Task<IEnumerable<Book>> SearchAsync(string keyword)
    {
        return await _context.Books
            .Where(b => b.Title.Contains(keyword) || 
                       b.Author.Contains(keyword))
            .ToListAsync();
    }
}
```

### DTO (Data Transfer Object)

**Tujuan:**
- Memisahkan entity dari API response
- Mengontrol data yang dikirim ke client
- Validasi input

**Contoh DTO:**
```csharp
// Create DTO
public class CreateBookDto
{
    [Required]
    [MaxLength(200)]
    public string Title { get; set; }

    [Required]
    [MaxLength(100)]
    public string Author { get; set; }

    [Required]
    public int CategoryId { get; set; }

    [Required]
    [Range(0, int.MaxValue)]
    public int Stock { get; set; }
}

// Response DTO
public class BookDto
{
    public int Id { get; set; }
    public string Title { get; set; }
    public string Author { get; set; }
    public string CategoryName { get; set; }
    public int Stock { get; set; }
}

// Update DTO
public class UpdateBookDto
{
    [Required]
    [MaxLength(200)]
    public string Title { get; set; }

    [Required]
    [MaxLength(100)]
    public string Author { get; set; }

    [Required]
    public int CategoryId { get; set; }

    [Required]
    [Range(0, int.MaxValue)]
    public int Stock { get; set; }
}
```

### Services

**Tujuan:**
- Mengimplementasikan business logic
- Meng orchestrate repository calls
- Validasi business rules

**Contoh Service:**
```csharp
public class BookService : IBookService
{
    private readonly IBookRepository _bookRepository;
    private readonly IMapper _mapper;

    public BookService(IBookRepository bookRepository, IMapper mapper)
    {
        _bookRepository = bookRepository;
        _mapper = mapper;
    }

    public async Task<IEnumerable<BookDto>> GetAllBooksAsync()
    {
        var books = await _bookRepository.GetAllAsync();
        return _mapper.Map<IEnumerable<BookDto>>(books);
    }

    public async Task<BookDto> GetBookByIdAsync(int id)
    {
        var book = await _bookRepository.GetByIdAsync(id);
        if (book == null)
            throw new NotFoundException($"Book with id {id} not found");
        
        return _mapper.Map<BookDto>(book);
    }

    public async Task<BookDto> CreateBookAsync(CreateBookDto dto)
    {
        var book = _mapper.Map<Book>(dto);
        var createdBook = await _bookRepository.AddAsync(book);
        return _mapper.Map<BookDto>(createdBook);
    }

    public async Task<BookDto> UpdateBookAsync(int id, UpdateBookDto dto)
    {
        var book = await _bookRepository.GetByIdAsync(id);
        if (book == null)
            throw new NotFoundException($"Book with id {id} not found");

        _mapper.Map(dto, book);
        var updatedBook = await _bookRepository.UpdateAsync(book);
        return _mapper.Map<BookDto>(updatedBook);
    }

    public async Task DeleteBookAsync(int id)
    {
        var book = await _bookRepository.GetByIdAsync(id);
        if (book == null)
            throw new NotFoundException($"Book with id {id} not found");

        await _bookRepository.DeleteAsync(book);
    }
}
```

### Dependency Injection

**Tujuan:**
- Menginject dependencies ke constructor
- Memudahkan testing (bisa mock)
- Loose coupling

**Konfigurasi DI:**
```csharp
// Program.cs
var builder = WebApplication.CreateBuilder(args);

// Register DbContext
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

// Register Repositories
builder.Services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
builder.Services.AddScoped<IBookRepository, BookRepository>();
builder.Services.AddScoped<ICategoryRepository, CategoryRepository>();
builder.Services.AddScoped<IBorrowingRepository, BorrowingRepository>();

// Register Services
builder.Services.AddScoped<IBookService, BookService>();
builder.Services.AddScoped<ICategoryService, CategoryService>();
builder.Services.AddScoped<IBorrowingService, BorrowingService>();

// Register AutoMapper
builder.Services.AddAutoMapper(typeof(Program));

var app = builder.Build();
```

**Lifetime Scope:**
- **Transient**: Dibuat baru setiap kali di-request
- **Scoped**: Dibuat baru per HTTP request
- **Singleton**: Dibuat sekali untuk seluruh application lifetime

**Rekomendasi:**
- Repository dan Service: Scoped
- DbContext: Scoped
- Configuration: Singleton

### Flow Data

**Flow Request:**
```
Client (API/WinForms/Android)
    ↓
Controller/Form/Activity
    ↓
Service (Business Logic)
    ↓
Repository (Data Access)
    ↓
Database
```

**Flow Response:**
```
Database
    ↓
Repository (Entity)
    ↓
Service (Entity → DTO)
    ↓
Controller/Form/Activity (DTO)
    ↓
Client (JSON/UI)
```

**Contoh Flow:**
1. Client request GET /api/books/1
2. BooksController.GetById() dipanggil
3. BookService.GetBookByIdAsync() dipanggil
4. BookRepository.GetByIdAsync() dipanggil
5. Database query dieksekusi
6. Entity dikembalikan ke Service
7. Service map Entity ke DTO
8. DTO dikembalikan ke Controller
9. Controller return DTO sebagai JSON
10. Client menerima JSON

---

## Implementation Notes

- Gunakan interface untuk semua repository dan service
- Jangan return entity langsung ke controller
- Gunakan AutoMapper untuk mapping Entity ke DTO
- Implement async/await untuk semua database operations
- Gunakan exception handling di service layer

---

## Common Mistakes

- Logic di Controller
- Direct EF di Controller
- Return Entity langsung tanpa DTO
- Tidak menggunakan Repository Pattern
- Tidak menggunakan Dependency Injection
- Business logic di Repository
- Tidak memisahkan layer dengan benar

---

## Exercises

1. Jelaskan mengapa Domain layer tidak bergantung ke layer lain
2. Identifikasi mana yang salah: logic di controller atau di service?
3. Buat interface untuk BorrowingService
4. Jelaskan perbedaan Transient, Scoped, dan Singleton
5. Gambar flow data untuk create borrowing

---

## Homework

1. Implement generic repository di pseudo-code
2. Implement BookService di pseudo-code
3. Buat DTO untuk Borrowing
4. Konfigurasi Dependency Injection di pseudo-code
5. Jelaskan bagaimana testing dengan Clean Architecture

---

## References

- [Clean Architecture by Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [Microsoft Dependency Injection](https://docs.microsoft.com/en-us/aspnet/core/fundamentals/dependency-injection)
- [Repository Pattern](https://docs.microsoft.com/en-us/azure/architecture/patterns/repository-wrapper)

---

## Related Documents

- [01-project-overview.md](./01-project-overview.md) - Overview arsitektur
- [05-api-design.md](./05-api-design.md) - API endpoint design
