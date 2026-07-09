# Sesi 3 - API Controllers + Business Logic + Error Handling

## Informasi Sesi
- **Durasi**: 2 jam (120 menit)
- **Fokus**: Implementasi Controllers, ApiResponse wrapper, Business Logic, dan Global Exception Handling
- **Prerequisite**: Selesai Sesi 2 — Application & Infrastructure layer sudah jalan, database sudah ada seed data

## Tujuan Pembelajaran
- [ ] Siswa dapat membuat Controller yang clean dengan memanggil Service (bukan langsung ke DB)
- [ ] Siswa dapat mengimplementasikan standard `ApiResponse<T>` wrapper
- [ ] Siswa dapat mengimplementasikan business logic yang proper (validation, calculation, conditional rules)
- [ ] Siswa dapat membuat Global Exception Handling Middleware
- [ ] Siswa dapat menguji semua endpoint via Swagger UI dan Postman
- [ ] Siswa dapat mendokumentasikan API dengan XML comments di Swagger

## Materi (120 menit)

### Review Homework (15 menit)
- Cek Service implementation — apakah sudah inject Repository (bukan DbContext)?
- Cek custom exception (`NotFoundException`) sudah ada di Domain
- Cek seed data — verifikasi di SSMS
- Feedback dan koreksi
- Q&A dari studi HTTP status codes

### ApiResponse Wrapper (15 menit)
#### Mengapa Response Wrapper? (5 menit)
- Tanpa wrapper: client harus handle berbagai format respons
- Dengan wrapper: semua respons punya struktur konsisten — mudah di-parse di WinForm dan Android
- Standard yang banyak dipakai di LKS business case:

```csharp
// BusinessApp.API/Models/ApiResponse.cs
public class ApiResponse<T>
{
    public bool Success { get; set; }
    public string Message { get; set; } = string.Empty;
    public T? Data { get; set; }
    public List<string> Errors { get; set; } = new();

    public static ApiResponse<T> Ok(T data, string message = "Success")
        => new() { Success = true, Message = message, Data = data };

    public static ApiResponse<T> Fail(string message, List<string>? errors = null)
        => new() { Success = false, Message = message, Errors = errors ?? new() };
}
```

#### Demo Pemakaian di Controller (10 menit)
- Return `ApiResponse<CustomerDto>` untuk GET by Id
- Return `ApiResponse<IEnumerable<CustomerDto>>` untuk GET all
- Return `ApiResponse<CustomerDto>` untuk POST (dengan status 201)

### Implementasi Controllers (25 menit)
#### Struktur Controller yang Clean (10 menit)
```csharp
// BusinessApp.API/Controllers/CustomersController.cs
[ApiController]
[Route("api/[controller]")]
public class CustomersController : ControllerBase
{
    private readonly ICustomerService _customerService;

    public CustomersController(ICustomerService customerService)
    {
        _customerService = customerService;
    }

    /// <summary>Get all customers</summary>
    [HttpGet]
    public async Task<ActionResult<ApiResponse<IEnumerable<CustomerDto>>>> GetAll()
    {
        var customers = await _customerService.GetAllAsync();
        return Ok(ApiResponse<IEnumerable<CustomerDto>>.Ok(customers));
    }

    /// <summary>Get customer by ID</summary>
    [HttpGet("{id}")]
    public async Task<ActionResult<ApiResponse<CustomerDto>>> GetById(int id)
    {
        var customer = await _customerService.GetByIdAsync(id);
        return Ok(ApiResponse<CustomerDto>.Ok(customer!));
    }

    /// <summary>Create a new customer</summary>
    [HttpPost]
    public async Task<ActionResult<ApiResponse<CustomerDto>>> Create([FromBody] CreateCustomerRequest request)
    {
        var customer = await _customerService.CreateAsync(request);
        return CreatedAtAction(nameof(GetById), new { id = customer.Id },
            ApiResponse<CustomerDto>.Ok(customer, "Customer created successfully"));
    }

    /// <summary>Update customer</summary>
    [HttpPut("{id}")]
    public async Task<ActionResult<ApiResponse<CustomerDto>>> Update(int id, [FromBody] UpdateCustomerRequest request)
    {
        var customer = await _customerService.UpdateAsync(id, request);
        return Ok(ApiResponse<CustomerDto>.Ok(customer, "Customer updated successfully"));
    }

    /// <summary>Delete customer</summary>
    [HttpDelete("{id}")]
    public async Task<ActionResult<ApiResponse<object>>> Delete(int id)
    {
        await _customerService.DeleteAsync(id);
        return Ok(ApiResponse<object>.Ok(null!, "Customer deleted successfully"));
    }
}
```

#### Prinsip Controller yang Baik (5 menit)
- Controller hanya: **menerima request → panggil service → return response**
- Tidak ada business logic di controller
- Tidak ada akses langsung ke DbContext di controller
- Selalu return `ApiResponse<T>` yang konsisten

#### Demo: Buat Controller untuk Semua Entity (10 menit)
- Siswa ikuti pola yang sama untuk entity lainnya
- Verifikasi di Swagger semua endpoint muncul

### Business Logic (20 menit)
#### Apa Itu Business Logic? (5 menit)
- Aturan yang ditentukan oleh "domain bisnis", bukan framework
- Contoh: "Stok tidak boleh minus", "Email harus unik", "Diskon tidak boleh lebih dari 90%"
- Tempatnya: di **Service layer**, bukan di Controller dan bukan di Repository

#### Demo Implementasi Business Logic (15 menit)
Contoh business rules yang umum di LKS:

```csharp
// Di CustomerService.cs
public async Task<CustomerDto> CreateAsync(CreateCustomerRequest request)
{
    // Business Rule 1: Email harus unik
    var existing = await _repository.FindByEmailAsync(request.Email);
    if (existing != null)
        throw new ConflictException($"Email '{request.Email}' sudah terdaftar");

    // Business Rule 2: Name tidak boleh kosong setelah di-trim
    if (string.IsNullOrWhiteSpace(request.Name))
        throw new ValidationException("Nama tidak boleh kosong");

    var customer = new Customer
    {
        Name = request.Name.Trim(),
        Email = request.Email.ToLower().Trim(),
        Phone = request.Phone.Trim(),
        CreatedAt = DateTime.UtcNow
    };

    await _repository.AddAsync(customer);
    return MapToDto(customer);
}

// Di ProductService.cs (contoh lain)
public async Task<ProductDto> ReduceStockAsync(int productId, int quantity)
{
    var product = await _repository.GetByIdAsync(productId)
        ?? throw new NotFoundException($"Product {productId} tidak ditemukan");

    // Business Rule: Stok tidak boleh minus
    if (product.Stock < quantity)
        throw new BusinessException($"Stok tidak mencukupi. Tersedia: {product.Stock}, diminta: {quantity}");

    product.Stock -= quantity;
    await _repository.UpdateAsync(product);
    return MapToDto(product);
}
```

### Global Exception Handling Middleware (20 menit)
#### Mengapa Global Handler? (5 menit)
- Tanpa global handler: setiap controller harus try-catch sendiri (repetitif & rawan miss)
- Dengan global handler: satu tempat untuk handle semua exception → respons selalu konsisten

#### Implementasi Middleware (15 menit)
```csharp
// BusinessApp.API/Middleware/ExceptionHandlingMiddleware.cs
public class ExceptionHandlingMiddleware
{
    private readonly RequestDelegate _next;
    private readonly ILogger<ExceptionHandlingMiddleware> _logger;

    public ExceptionHandlingMiddleware(RequestDelegate next, ILogger<ExceptionHandlingMiddleware> logger)
    {
        _next = next;
        _logger = logger;
    }

    public async Task InvokeAsync(HttpContext context)
    {
        try
        {
            await _next(context);
        }
        catch (NotFoundException ex)
        {
            await WriteResponse(context, StatusCodes.Status404NotFound, ex.Message);
        }
        catch (ValidationException ex)
        {
            await WriteResponse(context, StatusCodes.Status400BadRequest, ex.Message);
        }
        catch (ConflictException ex)
        {
            await WriteResponse(context, StatusCodes.Status409Conflict, ex.Message);
        }
        catch (BusinessException ex)
        {
            await WriteResponse(context, StatusCodes.Status422UnprocessableEntity, ex.Message);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, "Unhandled exception");
            await WriteResponse(context, StatusCodes.Status500InternalServerError, "Terjadi kesalahan pada server");
        }
    }

    private static async Task WriteResponse(HttpContext context, int statusCode, string message)
    {
        context.Response.StatusCode = statusCode;
        context.Response.ContentType = "application/json";
        var response = ApiResponse<object>.Fail(message);
        await context.Response.WriteAsJsonAsync(response);
    }
}

// Daftarkan di Program.cs
app.UseMiddleware<ExceptionHandlingMiddleware>();
```

### Practice & Testing (15 menit)
#### Test di Swagger (10 menit)
- Test semua endpoint CRUD untuk minimal 1 entity
- Test skenario error: GET by ID yang tidak ada (harus return 404)
- Test skenario validation: POST dengan email duplikat (harus return 409)
- Verifikasi respons selalu dalam format `ApiResponse<T>`

#### Test di Postman (5 menit)
- Import atau buat manual request collection
- Test POST → GET → PUT → DELETE sebagai sequence
- Simpan collection untuk dipakai lagi di sesi 4 saat WinForm integration

### Review (10 menit)
- Cek: apakah semua controller sudah mengikuti pola yang sama?
- Cek: apakah global handler sudah aktif? (test dengan throw exception random)
- Cek: apakah Swagger menampilkan semua endpoint dengan benar?
- Preview sesi 4: "Kita akan consume API ini dari WinForm dan Android"
- Q&A

## Homework

### Tugas 1: Lengkapi Semua Controllers
- Buat controller untuk semua entity dengan pola yang sama
- Pastikan semua endpoint return `ApiResponse<T>`
- Test semua endpoint di Swagger — tidak ada yang error
- **Deadline**: Sesi 4

### Tugas 2: Tambah Business Logic
- Implementasi minimal **2 business rule** per entity
- Contoh: validasi duplikat, validasi stok, kalkulasi total
- Test business rule di Swagger — verifikasi error message muncul dengan benar
- **Deadline**: Sesi 4

### Tugas 3: Custom Exceptions
- Buat semua custom exception di Domain layer: `NotFoundException`, `ValidationException`, `ConflictException`, `BusinessException`
- Pastikan semua sudah di-handle di middleware
- **Deadline**: Sesi 4

## Resources

### Documentation
- [ASP.NET Core Middleware](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/middleware/)
- [Error Handling in ASP.NET Core](https://learn.microsoft.com/en-us/aspnet/core/web-api/handle-errors)
- [Swagger/OpenAPI](https://learn.microsoft.com/en-us/aspnet/core/tutorials/getting-started-with-swashbuckle)

### Code Examples
- Sample Controller dengan ApiResponse
- Sample Global Exception Middleware
- Sample Custom Exceptions di Domain layer

### Referensi Project Contoh Lengkap (Step-by-Step)
- 📖 **[01-BookstoreApi-GUIDE.md](../dotnet-api-example/01-BookstoreApi-GUIDE.md)** — Langkah 7 (API Layer + Controllers + Middleware)
- 📖 **[03-HotelApi-GUIDE.md](../dotnet-api-example/03-HotelApi-GUIDE.md)** — Langkah 7: Contoh PATCH endpoints untuk state machine
- 🔧 **[mentor_cheatsheet.md](../agent_plan/mentor_cheatsheet.md)** — Template GlobalExceptionHandler (.NET 8 `IExceptionHandler`) & Controller standar

## Notes untuk Mentor

### Tips
- Tekankan: "Controller itu thin — hanya orchestrate, tidak logic"
- Demo live: throw exception di service → lihat middleware tangkap → lihat format response
- Gunakan Swagger untuk demo — lebih visual dan mudah dipahami siswa
- Jika waktu kurang: skip Custom Exceptions, pakai generic Exception saja dulu

### Common Pitfalls
- Business logic bocor ke Controller (paling sering terjadi)
- Middleware tidak didaftarkan dengan urutan yang benar di Program.cs
- Controller tidak async padahal service-nya async
- Return status code yang tidak sesuai (misal: 200 untuk POST yang berhasil seharusnya 201)

### Troubleshooting
- Swagger tidak muncul: cek `builder.Services.AddSwaggerGen()` dan `app.UseSwagger()`
- Middleware tidak aktif: pastikan `app.UseMiddleware<ExceptionHandlingMiddleware>()` sebelum `app.MapControllers()`
- Exception tidak tertangkap: cek urutan catch blocks (specific dulu, Exception terakhir)

### Preparation untuk Sesi Berikutnya
- Pastikan API sudah running sempurna (semua CRUD, semua endpoint, error handling OK)
- Catat base URL API untuk digunakan di WinForm dan Android (biasanya `http://localhost:5xxx`)
- Siapkan contoh HttpClient setup di WinForm
- Siapkan contoh Retrofit setup di Android Kotlin

---

**Sesi**: 3 dari 5
**Durasi**: 2 jam
**Fokus**: Controllers + ApiResponse Wrapper + Business Logic + Global Exception Handler
