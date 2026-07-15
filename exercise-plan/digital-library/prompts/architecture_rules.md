# Architecture Rules

## Digital Library Training Kit

---

## Purpose

Menetapkan aturan arsitektur untuk memastikan konsistensi dan kualitas implementasi Clean Architecture.

---

## Scope

Dokumen ini mencakup:

- Aturan arsitektur
- Aturan dependency
- Aturan coding
- Convention penamaan
- Convention folder

---

## Learning Objectives

Setelah membaca dokumen ini, siswa dapat:

- Memahami aturan arsitektur Clean Architecture
- Mengikuti dependency rule dengan benar
- Mengikuti aturan coding yang ditetapkan
- Menggunakan convention penamaan yang benar
- Mengorganisir folder dengan benar

---

## Prerequisites

- Sudah membaca [project_constitution.md](./project_constitution.md)
- Memahami konsep Clean Architecture dasar

---

## Business Rules

- Semua aturan arsitektur harus diikuti
- Deviasi harus disetujui oleh mentor

---

## Design / Main Content

### Aturan Arsitektur

**Layer Separation**
- Domain, Application, Infrastructure, Presentation harus terpisah
- Tidak ada code yang melanggar boundary layer
- Setiap layer memiliki responsibility yang jelas

**Dependency Rule**
- Domain → tidak bergantung ke apapun
- Application → hanya ke Domain
- Infrastructure → ke Application & Domain
- Presentation → hanya ke Application

**Module Separation**
- Setiap module (Category, Book, Borrowing) terpisah
- Tidak ada tight coupling antar module
- Gunakan interface untuk communication antar module

### Aturan Dependency

**No Circular Dependency**
- Tidak ada circular dependency antar layer
- Tidak ada circular dependency antar module
- Gunakan dependency graph untuk check

**Dependency Injection**
- Gunakan DI container untuk semua dependencies
- Inject dependencies melalui constructor
- Gunakan lifetime scope yang benar (Scoped/Transient)

**Interface Segregation**
- Gunakan interface untuk abstraction
- Interface harus specific dan focused
- Jangan buat interface yang terlalu besar

### Aturan Coding

**SOLID Principles**
- **S**ingle Responsibility: Satu class satu responsibility
- **O**pen/Closed: Open for extension, closed for modification
- **L**iskov Substitution: Subtype harus bisa substitusi parent
- **I**nterface Segregation: Interface harus specific
- **D**ependency Inversion: Depend pada abstraction, bukan concretion

**Async/Await**
- Gunakan async/await untuk I/O operations
- Jangan block thread dengan .Result atau .Wait
- ConfigureAwait(false) untuk library code

**Exception Handling**
- Gunakan try-catch untuk operation yang mungkin fail
- Jangan swallow exception
- Log exception untuk debugging
- Return error response yang user-friendly

**Validation**
- Validasi input di API layer
- Validasi business rule di service layer
- Validasi database constraint di database layer

### Convention Penamaan

**C# Naming Convention**
- Class: PascalCase (e.g., `BookService`)
- Method: PascalCase (e.g., `GetAllBooks`)
- Property: PascalCase (e.g., `BookTitle`)
- Field: _camelCase (e.g., `_bookRepository`)
- Interface: IPascalCase (e.g., `IBookService`)
- Parameter: camelCase (e.g., `bookId`)

**SQL Naming Convention**
- Table: PascalCase singular (e.g., `Book`)
- Column: PascalCase (e.g., `BookTitle`)
- Primary Key: `Id`
- Foreign Key: `TableNameId` (e.g., `CategoryId`)
- Constraint: `PK_TableName`, `FK_TableName_Reference`

**JSON Naming Convention**
- Property: camelCase (e.g., `bookTitle`)
- Enum: PascalCase (e.g., `BookStatus`)

### Convention Folder

**Project Structure**
```
DigitalLibrary.Domain/
├── Entities/
│   ├── User.cs
│   ├── Category.cs
│   └── Book.cs

DigitalLibrary.Application/
├── Interfaces/
│   ├── IRepository.cs
│   └── IBookService.cs
├── DTOs/
│   ├── BookDto.cs
│   └── CreateBookDto.cs
└── Services/
    └── BookService.cs

DigitalLibrary.Infrastructure/
├── Data/
│   ├── ApplicationDbContext.cs
│   └── Configurations/
└── Repositories/
    └── BookRepository.cs

DigitalLibrary.API/
├── Controllers/
│   └── BooksController.cs
└── Program.cs
```

**File Organization**
- Satu file per class
- File name sama dengan class name
- Group related files dalam folder yang sama
- Gunakan region untuk organize code (opsional)

---

## Implementation Notes

- Gunakan tool untuk check naming convention (jika ada)
- Review code secara berkala untuk memastikan compliance
- Refactor jika melanggar aturan

---

## Common Mistakes

- Langgar dependency rule
- Tidak menggunakan interface
- Tidak menggunakan async/await
- Naming convention tidak konsisten
- Folder structure tidak terorganisir

---

## Exercises

1. Identifikasi jika ada circular dependency di design Anda
2. Review code Anda untuk SOLID compliance
3. Check naming convention di code Anda
4. Review folder structure Anda

---

## Homework

1. Review architecture rules sebelum coding
2. Gunakan checklist untuk review code
3. Refactor code jika melanggar aturan
4. Diskusikan dengan mentor jika ada pertanyaan

---

## References

- [SOLID Principles](https://en.wikipedia.org/wiki/SOLID)
- [Clean Architecture by Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [C# Coding Conventions](https://docs.microsoft.com/en-us/dotnet/csharp/fundamentals/coding-style/coding-conventions)

---

## Related Documents

- [project_constitution.md](./project_constitution.md) - Filosofi project
- [implementation_plan.md](./implementation_plan.md) - Rencana implementasi
