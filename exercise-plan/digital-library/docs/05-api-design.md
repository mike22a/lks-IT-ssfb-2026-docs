# API Design

## Digital Library Training Kit

---

## Purpose

Menjelaskan desain REST API untuk sistem Digital Library, termasuk endpoint, request/response, validation, dan best practices.

---

## Scope

Dokumen ini mencakup:

- Prinsip REST
- Katalog endpoint
- CRUD operations
- Request dan response format
- Status code
- Validation
- Error response
- Business rules di API
- Sample payload

---

## Learning Objectives

Setelah membaca dokumen ini, siswa dapat:

- Memahami prinsip REST API
- Mendesain endpoint yang RESTful
- Menggunakan HTTP method yang benar
- Mendesain request/response yang baik
- Menggunakan status code yang sesuai
- Implement validation di API
- Handle error dengan benar

---

## Prerequisites

- Sudah membaca [02-business-rules.md](./02-business-rules.md)
- Sudah membaca [03-database-design.md](./03-database-design.md)
- Memahami HTTP basics

---

## Business Rules

- Gunakan HTTP method yang sesuai (GET, POST, PUT, DELETE)
- Gunakan status code yang benar (200, 201, 204, 400, 404, 500)
- Return JSON untuk semua response
- Gunakan DTO, jangan return entity langsung
- Validasi input di API layer
- Handle error dengan message yang jelas

---

## Design / Main Content

### Prinsip REST

**RESTful API Principles:**

1. **Resource-Based**: API berorientasi pada resource (Categories, Books, Borrowings)
2. **HTTP Methods**: Gunakan method yang sesuai untuk operasi
3. **Stateless**: Setiap request mengandung semua informasi yang diperlukan
4. **Uniform Interface**: Konsisten di semua endpoint
5. **Layered System**: Client tidak perlu tahu apakah terhubung langsung ke server atau melalui intermediary

**HTTP Methods:**
- `GET`: Retrieve resource (safe, idempotent)
- `POST`: Create resource (not idempotent)
- `PUT`: Update resource (idempotent)
- `DELETE`: Delete resource (idempotent)
- `PATCH`: Partial update (not idempotent)

### Katalog Endpoint

#### Categories

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| GET | /api/categories | Get all categories |
| GET | /api/categories/{id} | Get category by id |
| POST | /api/categories | Create new category |
| PUT | /api/categories/{id} | Update category |
| DELETE | /api/categories/{id} | Delete category |

#### Books

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| GET | /api/books | Get all books |
| GET | /api/books/{id} | Get book by id |
| GET | /api/books/bycategory/{categoryId} | Get books by category |
| POST | /api/books | Create new book |
| PUT | /api/books/{id} | Update book |
| DELETE | /api/books/{id} | Delete book |

#### Users

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| GET | /api/users | Get all users |
| GET | /api/users/{id} | Get user by id |
| POST | /api/users | Create new user |
| PUT | /api/users/{id} | Update user |
| DELETE | /api/users/{id} | Delete user |

#### Borrowings

| Method | Endpoint | Deskripsi |
|--------|----------|-----------|
| GET | /api/borrowings | Get all borrowings |
| GET | /api/borrowings/{id} | Get borrowing by id |
| GET | /api/borrowings/byuser/{userId} | Get borrowings by user |
| POST | /api/borrowings | Create new borrowing |
| PUT | /api/borrowings/{id}/return | Return borrowing |
| DELETE | /api/borrowings/{id} | Delete borrowing |

### CRUD Operations

#### Create (POST)

**Request:**
```http
POST /api/categories
Content-Type: application/json

{
  "name": "Fiction",
  "description": "Buku fiksi dan novel"
}
```

**Response (201 Created):**
```json
{
  "id": 1,
  "name": "Fiction",
  "description": "Buku fiksi dan novel",
  "createdAt": "2026-01-15T10:30:00",
  "updatedAt": "2026-01-15T10:30:00"
}
```

#### Read (GET)

**Request:**
```http
GET /api/categories/1
```

**Response (200 OK):**
```json
{
  "id": 1,
  "name": "Fiction",
  "description": "Buku fiksi dan novel",
  "createdAt": "2026-01-15T10:30:00",
  "updatedAt": "2026-01-15T10:30:00"
}
```

#### Update (PUT)

**Request:**
```http
PUT /api/categories/1
Content-Type: application/json

{
  "name": "Science Fiction",
  "description": "Buku science fiction"
}
```

**Response (200 OK):**
```json
{
  "id": 1,
  "name": "Science Fiction",
  "description": "Buku science fiction",
  "createdAt": "2026-01-15T10:30:00",
  "updatedAt": "2026-01-15T11:00:00"
}
```

#### Delete (DELETE)

**Request:**
```http
DELETE /api/categories/1
```

**Response (204 No Content):**
- No body
- Status code 204

### Request Format

**General Rules:**
- Content-Type: `application/json`
- Gunakan camelCase untuk JSON keys
- Date format: ISO 8601 (`YYYY-MM-DDTHH:mm:ss`)
- Boolean: `true` atau `false`
- Null: `null` (bukan string "null")

**Create Category DTO:**
```json
{
  "name": "string (required, max 50)",
  "description": "string (optional, max 200)"
}
```

**Create Book DTO:**
```json
{
  "categoryId": "int (required)",
  "title": "string (required, max 200)",
  "author": "string (required, max 100)",
  "publisher": "string (required, max 100)",
  "year": "int (required, 1900-2099)",
  "isbn": "string (optional, max 20)",
  "stock": "int (required, >= 0)"
}
```

**Create Borrowing DTO:**
```json
{
  "userId": "int (required)",
  "borrowDate": "datetime (optional, default now)",
  "dueDate": "datetime (optional, default +7 days)",
  "details": [
    {
      "bookId": "int (required)",
      "quantity": "int (required, default 1, >= 1)"
    }
  ]
}
```

### Response Format

**Success Response:**
```json
{
  "success": true,
  "data": { ... },
  "message": "Operation successful"
}
```

**Error Response:**
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Validation failed",
    "details": [
      {
        "field": "name",
        "message": "Name is required"
      }
    ]
  }
}
```

**List Response:**
```json
{
  "success": true,
  "data": [
    { ... },
    { ... }
  ],
  "pagination": {
    "page": 1,
    "pageSize": 10,
    "totalItems": 50,
    "totalPages": 5
  }
}
```

### Status Code

**Success Codes:**
- `200 OK`: Request berhasil
- `201 Created`: Resource berhasil dibuat
- `204 No Content`: Success tapi tidak ada body (DELETE)

**Client Error Codes:**
- `400 Bad Request`: Request invalid (validation error)
- `401 Unauthorized`: Authentication required (jika ada auth)
- `403 Forbidden`: Authorization failed (jika ada auth)
- `404 Not Found`: Resource tidak ditemukan
- `409 Conflict`: Conflict dengan resource yang ada (duplicate)

**Server Error Codes:**
- `500 Internal Server Error`: Error di server
- `503 Service Unavailable`: Server maintenance

### Validation

**Validation di API Layer:**

```csharp
public class CreateCategoryDto
{
    [Required(ErrorMessage = "Name is required")]
    [MaxLength(50, ErrorMessage = "Name cannot exceed 50 characters")]
    public string Name { get; set; }

    [MaxLength(200, ErrorMessage = "Description cannot exceed 200 characters")]
    public string Description { get; set; }
}
```

**Validation Rules:**
- Required: Field wajib diisi
- MaxLength: Maksimal karakter
- Range: Range value (untuk angka)
- RegularExpression: Pattern validation (email, phone)

**Validation Response (400):**
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Validation failed",
    "details": [
      {
        "field": "name",
        "message": "Name is required"
      },
      {
        "field": "year",
        "message": "Year must be between 1900 and 2099"
      }
    ]
  }
}
```

### Error Response

**Error Response Structure:**
```json
{
  "success": false,
  "error": {
    "code": "ERROR_CODE",
    "message": "Human readable error message",
    "details": "Additional details (optional)"
  }
}
```

**Common Error Codes:**
- `VALIDATION_ERROR`: Input validation failed
- `NOT_FOUND`: Resource tidak ditemukan
- `CONFLICT`: Resource conflict (duplicate)
- `BUSINESS_RULE_ERROR`: Business rule violation
- `INTERNAL_ERROR`: Internal server error

**Example: Not Found (404)**
```json
{
  "success": false,
  "error": {
    "code": "NOT_FOUND",
    "message": "Category with id 999 not found"
  }
}
```

**Example: Business Rule Error (400)**
```json
{
  "success": false,
  "error": {
    "code": "BUSINESS_RULE_ERROR",
    "message": "Cannot borrow more than 3 books",
    "details": "Current borrowing has 3 books"
  }
}
```

### Business Rules di API

**Rule 1: Max 3 Books per Borrowing**
```csharp
if (borrowingDto.Details.Count > 3)
{
    return BadRequest(new ErrorResponse
    {
        Code = "BUSINESS_RULE_ERROR",
        Message = "Cannot borrow more than 3 books"
    });
}
```

**Rule 2: Stock Check**
```csharp
foreach (var detail in borrowingDto.Details)
{
    var book = await _bookRepository.GetById(detail.BookId);
    if (book.Stock < detail.Quantity)
    {
        return BadRequest(new ErrorResponse
        {
            Code = "BUSINESS_RULE_ERROR",
            Message = $"Book {book.Title} has insufficient stock"
        });
    }
}
```

**Rule 3: Category Cannot Be Deleted if Used**
```csharp
var booksInCategory = await _bookRepository.GetByCategory(id);
if (booksInCategory.Any())
{
    return BadRequest(new ErrorResponse
    {
        Code = "BUSINESS_RULE_ERROR",
        Message = "Cannot delete category with existing books"
    });
}
```

### Sample Payload

**Complete Borrowing Creation:**

**Request:**
```http
POST /api/borrowings
Content-Type: application/json

{
  "userId": 1,
  "borrowDate": "2026-01-15T10:00:00",
  "dueDate": "2026-01-22T10:00:00",
  "details": [
    {
      "bookId": 1,
      "quantity": 1
    },
    {
      "bookId": 2,
      "quantity": 1
    }
  ]
}
```

**Response (201 Created):**
```json
{
  "success": true,
  "data": {
    "id": 1,
    "userId": 1,
    "userName": "John Doe",
    "borrowDate": "2026-01-15T10:00:00",
    "dueDate": "2026-01-22T10:00:00",
    "returnDate": null,
    "status": "Dipinjam",
    "details": [
      {
        "id": 1,
        "bookId": 1,
        "bookTitle": "The Great Gatsby",
        "quantity": 1
      },
      {
        "id": 2,
        "bookId": 2,
        "bookTitle": "To Kill a Mockingbird",
        "quantity": 1
      }
    ],
    "createdAt": "2026-01-15T10:00:00",
    "updatedAt": "2026-01-15T10:00:00"
  },
  "message": "Borrowing created successfully"
}
```

---

## Implementation Notes

- Gunakan DataAnnotations untuk validation
- Implement global exception handler untuk error handling
- Gunakan AutoMapper untuk mapping Entity ke DTO
- Implement logging untuk debugging
- Gunakan async/await untuk semua database operations

---

## Common Mistakes

- Return entity langsung tanpa DTO
- Tidak menggunakan status code yang benar
- Error message tidak jelas
- Tidak validasi input di API layer
- Tidak handle business rules di API
- Menggunakan synchronous database operations

---

## Exercises

1. Design endpoint untuk search books by title
2. Jelaskan status code yang sesuai untuk setiap scenario
3. Buat DTO untuk update book
4. Implement validation rule untuk year field
5. Design error response untuk insufficient stock

---

## Homework

1. Implement semua endpoint di pseudo-code
2. Buat test case untuk setiap endpoint
3. Design pagination untuk list endpoint
4. Implement global exception handler di pseudo-code
5. Document API menggunakan Swagger/OpenAPI

---

## References

- [REST API Design Best Practices](https://restfulapi.net/)
- [Microsoft REST Guidelines](https://github.com/Microsoft/api-guidelines/blob/vNext/Guidelines.md)
- [HTTP Status Codes](https://developer.mozilla.org/en-US/docs/Web/HTTP/Status)

---

## Related Documents

- [02-business-rules.md](./02-business-rules.md) - Business rules detail
- [06-clean-architecture.md](./06-clean-architecture.md) - Clean Architecture implementation
