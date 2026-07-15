# Database Design

## Digital Library Training Kit

---

## Purpose

Menjelaskan desain database untuk sistem Digital Library, termasuk struktur tabel, kolom, constraints, dan best practices.

---

## Scope

Dokumen ini mencakup:

- Overview database
- Convention penamaan
- Convention relasi
- Primary Keys
- Foreign Keys
- Indexes
- Normalization
- Audit Fields
- Penjelasan tabel
- Penjelasan kolom
- Constraints
- Validation
- Business Rules di database

---

## Learning Objectives

Setelah membaca dokumen ini, siswa dapat:

- Memahami struktur database Digital Library
- Mengidentifikasi tabel dan kolom yang diperlukan
- Memahami relasi antar tabel
- Menggunakan convention penamaan yang baik
- Mendesain primary key dan foreign key
- Menggunakan indexes untuk performa
- Memahami audit fields
- Menerapkan normalization

---

## Prerequisites

- Sudah membaca [01-project-overview.md](./01-project-overview.md)
- Sudah membaca [02-business-rules.md](./02-business-rules.md)
- Pengetahuan SQL dasar

---

## Business Rules

- Semua tabel harus memiliki audit fields (CreatedAt, UpdatedAt)
- Primary key menggunakan identity/auto-increment
- Foreign key menggunakan cascade delete untuk detail
- Nama tabel menggunakan singular (User, bukan Users)
- Nama kolom menggunakan PascalCase

---

## Design / Main Content

### Overview Database

Database Digital Library menggunakan SQL Server 2022 dengan 5 tabel utama:

1. **Users** - Data anggota perpustakaan
2. **Categories** - Kategori buku
3. **Books** - Data buku
4. **Borrowings** - Header peminjaman
5. **BorrowingDetails** - Detail peminjaman (buku yang dipinjam)

### Convention Penamaan

**Tabel:**
- Singular: `User`, `Category`, `Book`
- PascalCase: `Borrowing`, `BorrowingDetail`
- Tidak menggunakan prefix (tbl_, dll)

**Kolom:**
- PascalCase: `FirstName`, `LastName`
- Primary key: `Id` atau `TableNameId`
- Foreign key: `TableNameId` (contoh: `CategoryId`)

**Constraint:**
- Primary key: `PK_TableName`
- Foreign key: `FK_TableName_ReferenceTable`
- Unique: `UQ_TableName_Column`
- Default: `DF_TableName_Column`

### Convention Relasi

**One-to-Many:**
- Parent memiliki PK
- Child memiliki FK ke parent
- Contoh: Category (1) → Book (Many)

**Many-to-Many:**
- Gunakan junction table
- Contoh: Borrowing ↔ Book melalui BorrowingDetail

**Cascade Delete:**
- Parent delete → Child delete (untuk detail)
- Parent delete → Child set NULL (untuk reference opsional)

### Primary Keys

Semua tabel menggunakan `INT IDENTITY(1,1)` sebagai primary key:

```sql
Id INT IDENTITY(1,1) PRIMARY KEY
```

**Alasan:**
- Sederhana dan performa tinggi
- Tidak perlu generate UUID
- Mudah untuk debugging

### Foreign Keys

Foreign key menggunakan referensi ke primary key tabel lain:

```sql
CategoryId INT NOT NULL,
CONSTRAINT FK_Books_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(Id)
```

**Cascade Delete:**
```sql
CONSTRAINT FK_BorrowingDetails_Borrowings FOREIGN KEY (BorrowingId) 
    REFERENCES Borrowings(Id) ON DELETE CASCADE
```

### Indexes

**Clustered Index:**
- Primary key secara default adalah clustered index

**Non-Clustered Index:**
- Kolom yang sering di-search atau di-join:
  - `Books.CategoryId` (untuk filter by category)
  - `Borrowings.UserId` (untuk histori peminjaman user)
  - `Borrowings.BorrowDate` (untuk report tanggal)

```sql
CREATE INDEX IX_Books_CategoryId ON Books(CategoryId);
CREATE INDEX IX_Borrowings_UserId ON Borrowings(UserId);
CREATE INDEX IX_Borrowings_BorrowDate ON Borrowings(BorrowDate);
```

### Normalization

Database mengikuti **Third Normal Form (3NF)**:

**1NF:** Setiap kolom atomic (tidak ada repeating groups)
**2NF:** Tidak ada partial dependency pada composite key
**3NF:** Tidak ada transitive dependency pada non-key attributes

**Contoh 3NF:**
- ❌ Buruk: `Books` table memiliki `CategoryName` (transitive dependency)
- ✅ Baik: `Books` memiliki `CategoryId` yang refer ke `Categories`

### Audit Fields

Setiap tabel memiliki audit fields:

```sql
CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
CreatedBy INT NULL, -- Opsional: reference ke Users
UpdatedBy INT NULL  -- Opsional: reference ke Users
```

**Fungsi:**
- Tracking kapan record dibuat
- Tracking kapan record diupdate
- Audit trail untuk troubleshooting

### Penjelasan Tabel

#### 1. Users

Tabel untuk menyimpan data anggota perpustakaan.

| Kolom | Tipe | Deskripsi |
|-------|------|----------|
| Id | INT | Primary key |
| FirstName | NVARCHAR(50) | Nama depan |
| LastName | NVARCHAR(50) | Nama belakang |
| Email | NVARCHAR(100) | Email (opsional) |
| Phone | NVARCHAR(20) | No telepon |
| Address | NVARCHAR(200) | Alamat |
| CreatedAt | DATETIME | Tanggal dibuat |
| UpdatedAt | DATETIME | Tanggal diupdate |

#### 2. Categories

Tabel untuk menyimpan kategori buku.

| Kolom | Tipe | Deskripsi |
|-------|------|----------|
| Id | INT | Primary key |
| Name | NVARCHAR(50) | Nama kategori |
| Description | NVARCHAR(200) | Deskripsi |
| CreatedAt | DATETIME | Tanggal dibuat |
| UpdatedAt | DATETIME | Tanggal diupdate |

#### 3. Books

Tabel untuk menyimpan data buku.

| Kolom | Tipe | Deskripsi |
|-------|------|----------|
| Id | INT | Primary key |
| CategoryId | INT | Foreign key ke Categories |
| Title | NVARCHAR(200) | Judul buku |
| Author | NVARCHAR(100) | Penulis |
| Publisher | NVARCHAR(100) | Penerbit |
| Year | INT | Tahun terbit |
| ISBN | NVARCHAR(20) | ISBN (opsional) |
| Stock | INT | Jumlah stok |
| CreatedAt | DATETIME | Tanggal dibuat |
| UpdatedAt | DATETIME | Tanggal diupdate |

#### 4. Borrowings

Tabel header untuk peminjaman.

| Kolom | Tipe | Deskripsi |
|-------|------|----------|
| Id | INT | Primary key |
| UserId | INT | Foreign key ke Users |
| BorrowDate | DATETIME | Tanggal peminjaman |
| DueDate | DATETIME | Tanggal jatuh tempo |
| ReturnDate | DATETIME | Tanggal pengembalian (NULL jika belum) |
| Status | NVARCHAR(20) | Status (Dipinjam/Dikembalikan) |
| CreatedAt | DATETIME | Tanggal dibuat |
| UpdatedAt | DATETIME | Tanggal diupdate |

#### 5. BorrowingDetails

Tabel detail untuk buku yang dipinjam.

| Kolom | Tipe | Deskripsi |
|-------|------|----------|
| Id | INT | Primary key |
| BorrowingId | INT | Foreign key ke Borrowings |
| BookId | INT | Foreign key ke Books |
| Quantity | INT | Jumlah buku (biasanya 1) |
| CreatedAt | DATETIME | Tanggal dibuat |
| UpdatedAt | DATETIME | Tanggal diupdate |

### Penjelasan Kolom

**Users:**
- `FirstName`, `LastName`: Wajib, maksimal 50 karakter
- `Email`: Opsional, harus valid format jika diisi
- `Phone`: Opsional, format Indonesia
- `Address`: Opsional, maksimal 200 karakter

**Categories:**
- `Name`: Wajib, unik, maksimal 50 karakter
- `Description`: Opsional, maksimal 200 karakter

**Books:**
- `CategoryId`: Wajib, refer ke Categories
- `Title`: Wajib, maksimal 200 karakter
- `Author`: Wajib, maksimal 100 karakter
- `Publisher`: Wajib, maksimal 100 karakter
- `Year`: Wajib, 4 digit (1900-2099)
- `ISBN`: Opsional, format ISBN-10 atau ISBN-13
- `Stock`: Wajib, default 0, tidak boleh negatif

**Borrowings:**
- `UserId`: Wajib, refer ke Users
- `BorrowDate`: Wajib, default GETDATE()
- `DueDate`: Wajib, BorrowDate + 7 hari
- `ReturnDate`: NULL saat create, diisi saat return
- `Status`: Wajib, 'Dipinjam' atau 'Dikembalikan'

**BorrowingDetails:**
- `BorrowingId`: Wajib, refer ke Borrowings
- `BookId`: Wajib, refer ke Books
- `Quantity`: Wajib, default 1, minimal 1

### Constraints

**Primary Key Constraints:**
```sql
CONSTRAINT PK_Users PRIMARY KEY (Id)
CONSTRAINT PK_Categories PRIMARY KEY (Id)
CONSTRAINT PK_Books PRIMARY KEY (Id)
CONSTRAINT PK_Borrowings PRIMARY KEY (Id)
CONSTRAINT PK_BorrowingDetails PRIMARY KEY (Id)
```

**Foreign Key Constraints:**
```sql
CONSTRAINT FK_Books_Categories FOREIGN KEY (CategoryId) 
    REFERENCES Categories(Id)

CONSTRAINT FK_Borrowings_Users FOREIGN KEY (UserId) 
    REFERENCES Users(Id)

CONSTRAINT FK_BorrowingDetails_Borrowings FOREIGN KEY (BorrowingId) 
    REFERENCES Borrowings(Id) ON DELETE CASCADE

CONSTRAINT FK_BorrowingDetails_Books FOREIGN KEY (BookId) 
    REFERENCES Books(Id)
```

**Unique Constraints:**
```sql
CONSTRAINT UQ_Categories_Name UNIQUE (Name)
CONSTRAINT UQ_Books_ISBN UNIQUE (ISBN) -- Jika ISBN diisi
```

**Check Constraints:**
```sql
CONSTRAINT CK_Books_Year CHECK (Year BETWEEN 1900 AND 2099)
CONSTRAINT CK_Books_Stock CHECK (Stock >= 0)
CONSTRAINT CK_BorrowingDetails_Quantity CHECK (Quantity >= 1)
CONSTRAINT CK_Borrowings_Status CHECK (Status IN ('Dipinjam', 'Dikembalikan'))
```

**Default Constraints:**
```sql
CONSTRAINT DF_Books_Stock DEFAULT 0 FOR Stock
CONSTRAINT DF_Users_CreatedAt DEFAULT GETDATE() FOR CreatedAt
CONSTRAINT DF_Users_UpdatedAt DEFAULT GETDATE() FOR UpdatedAt
```

### Validation

**Validation di Database Level:**
- NOT NULL constraints untuk field wajib
- CHECK constraints untuk range value
- UNIQUE constraints untuk field unik
- FOREIGN KEY constraints untuk referential integrity

**Validation di Application Level:**
- Business logic validation (max 3 buku, stok check)
- Custom validation yang tidak bisa di-express di SQL

### Business Rules di Database

**Rule 1: Stok Tidak Boleh Negatif**
```sql
CONSTRAINT CK_Books_Stock CHECK (Stock >= 0)
```

**Rule 2: Tahun Terbit Valid**
```sql
CONSTRAINT CK_Books_Year CHECK (Year BETWEEN 1900 AND 2099)
```

**Rule 3: Status Peminjaman Valid**
```sql
CONSTRAINT CK_Borrowings_Status CHECK (Status IN ('Dipinjam', 'Dikembalikan'))
```

**Rule 4: Quantity Minimal 1**
```sql
CONSTRAINT CK_BorrowingDetails_Quantity CHECK (Quantity >= 1)
```

**Rule 5: Nama Kategori Unik**
```sql
CONSTRAINT UQ_Categories_Name UNIQUE (Name)
```

---

## Implementation Notes

- Gunakan SQL Server Management Studio (SSMS) untuk execute script
- Test script dengan data dummy sebelum production
- Backup database sebelum schema change
- Gunakan transaction untuk DDL operations berbahaya
- Document setiap perubahan schema

---

## Common Mistakes

- Tidak menggunakan audit fields
- Tidak membuat index untuk kolom yang sering di-query
- Menggunakan composite key yang kompleks
- Tidak menggunakan cascade delete untuk detail
- Tidak menambahkan check constraints
- Menggunakan VARCHAR untuk text (gunakan NVARCHAR untuk Unicode)

---

## Exercises

1. Jelaskan mengapa audit fields penting
2. Identifikasi kolom mana yang perlu index tambahan
3. Buat diagram ERD sederhana berdasarkan tabel di atas
4. Jelaskan perbedaan clustered dan non-clustered index
5. Mengapa kita menggunakan IDENTITY untuk primary key?

---

## Homework

1. Tulis SQL script untuk membuat semua tabel
2. Tulis SQL script untuk membuat semua constraints
3. Tulis SQL script untuk membuat semua indexes
4. Test script di SQL Server dan screenshot hasilnya
5. Buat dokumentasi perubahan jika ada modifikasi

---

## References

- [SQL Server Documentation](https://docs.microsoft.com/en-us/sql/sql-server/)
- [Database Normalization](https://en.wikipedia.org/wiki/Database_normalization)
- [SQL Index Best Practices](https://www.sqlshack.com/sql-server-index-design-best-practices/)

---

## Related Documents

- [02-business-rules.md](./02-business-rules.md) - Business rules detail
- [04-erd.md](./04-erd.md) - Diagram ERD lengkap
- [database/01_create_database.sql](../database/01_create_database.sql) - SQL script lengkap
