# Mentor Cheat Sheet — LKS IT SSfB 2026

> Ringkasan satu halaman untuk demo cepat saat sesi. Print atau buka di tablet saat mengajar.

---

## 1. Buat Solution Clean Architecture (dari nol, ~5 menit)

```bash
# Buat folder & masuk
mkdir BusinessApp && cd BusinessApp

# Buat 4 project
dotnet new classlib -n BusinessApp.Domain      -o src/BusinessApp.Domain
dotnet new classlib -n BusinessApp.Application -o src/BusinessApp.Application
dotnet new classlib -n BusinessApp.Infrastructure -o src/BusinessApp.Infrastructure
dotnet new webapi   -n BusinessApp.API         -o src/BusinessApp.API

# Buat solution & tambahkan semua project
dotnet new sln -n BusinessApp
dotnet sln BusinessApp.sln add src/BusinessApp.Domain/BusinessApp.Domain.csproj
dotnet sln BusinessApp.sln add src/BusinessApp.Application/BusinessApp.Application.csproj
dotnet sln BusinessApp.sln add src/BusinessApp.Infrastructure/BusinessApp.Infrastructure.csproj
dotnet sln BusinessApp.sln add src/BusinessApp.API/BusinessApp.API.csproj

# Referensi antar project
dotnet add src/BusinessApp.Application reference src/BusinessApp.Domain
dotnet add src/BusinessApp.Infrastructure reference src/BusinessApp.Domain src/BusinessApp.Application
dotnet add src/BusinessApp.API reference src/BusinessApp.Application src/BusinessApp.Infrastructure

# Install NuGet packages
# -- Application
dotnet add src/BusinessApp.Application package FluentValidation --version 11.11.0

# -- Infrastructure
dotnet add src/BusinessApp.Infrastructure package Microsoft.EntityFrameworkCore.Sqlite --version 8.0.14
dotnet add src/BusinessApp.Infrastructure package Microsoft.EntityFrameworkCore.SqlServer --version 8.0.14
dotnet add src/BusinessApp.Infrastructure package Microsoft.EntityFrameworkCore.Tools --version 8.0.14
dotnet add src/BusinessApp.Infrastructure package BCrypt.Net-Next --version 4.2.0
dotnet add src/BusinessApp.Infrastructure package System.IdentityModel.Tokens.Jwt --version 8.9.0
dotnet add src/BusinessApp.Infrastructure package Microsoft.IdentityModel.Tokens --version 8.9.0
dotnet add src/BusinessApp.Infrastructure package Microsoft.Extensions.Configuration.Abstractions --version 8.0.0

# -- API
dotnet add src/BusinessApp.API package Microsoft.AspNetCore.Authentication.JwtBearer --version 8.0.14
dotnet add src/BusinessApp.API package Microsoft.EntityFrameworkCore.Design --version 8.0.14
dotnet add src/BusinessApp.API package Swashbuckle.AspNetCore --version 6.9.0

# Verifikasi build
dotnet build BusinessApp.sln
```

---

## 2. EF Core Migration Commands

```bash
# Buat migration pertama
dotnet ef migrations add InitialCreate \
  --project src/BusinessApp.Infrastructure/BusinessApp.Infrastructure.csproj \
  --startup-project src/BusinessApp.API/BusinessApp.API.csproj \
  --context AppDbContext

# Apply ke database
dotnet ef database update \
  --project src/BusinessApp.Infrastructure/BusinessApp.Infrastructure.csproj \
  --startup-project src/BusinessApp.API/BusinessApp.API.csproj

# Hapus migration terakhir (jika ada error)
dotnet ef migrations remove \
  --project src/BusinessApp.Infrastructure/BusinessApp.Infrastructure.csproj \
  --startup-project src/BusinessApp.API/BusinessApp.API.csproj

# Reset database (drop & recreate)
dotnet ef database drop --force \
  --startup-project src/BusinessApp.API/BusinessApp.API.csproj
```

---

## 4. Template: ApiResponse\<T\>

```csharp
// BusinessApp.Application/Common/ApiResponse.cs
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

---

## 5. Template: GlobalExceptionHandler (IExceptionHandler — .NET 8)

```csharp
// BusinessApp.API/Middleware/GlobalExceptionHandler.cs
public class GlobalExceptionHandler(ILogger<GlobalExceptionHandler> logger) : IExceptionHandler
{
    public async ValueTask<bool> TryHandleAsync(HttpContext ctx, Exception ex, CancellationToken ct)
    {
        logger.LogError(ex, "Unhandled: {Msg}", ex.Message);
        var (code, msg) = ex switch
        {
            NotFoundException     => (404, ex.Message),
            ConflictException     => (409, ex.Message),
            BusinessRuleException => (422, ex.Message),
            _                     => (500, "An unexpected error occurred.")
        };
        ctx.Response.StatusCode  = code;
        ctx.Response.ContentType = "application/json";
        await ctx.Response.WriteAsJsonAsync(ApiResponse<object>.FailResult(msg), ct);
        return true;
    }
}
// Di Program.cs: builder.Services.AddExceptionHandler<GlobalExceptionHandler>();
//               builder.Services.AddProblemDetails();
//               app.UseExceptionHandler();
```

---

## 6. Template: appsettings.json (SQLite default, switchable SQL Server)

```json
{
  "DatabaseProvider": "Sqlite",
  "ConnectionStrings": {
    "Sqlite": "Data Source=app.db",
    "SqlServer": "Server=localhost;Database=BusinessDb;Trusted_Connection=True;TrustServerCertificate=True;"
  },
  "Jwt": {
    "Key": "SuperSecretKeyForCompetitionAtLeast32Characters!!"
  }
}
```

---

## 7. Template: Program.cs Minimal (JWT + Swagger + GlobalException)

```csharp
var builder = WebApplication.CreateBuilder(args);

// DB
var provider = builder.Configuration["DatabaseProvider"] ?? "Sqlite";
builder.Services.AddDbContext<AppDbContext>(opts =>
    provider == "SqlServer"
        ? opts.UseSqlServer(builder.Configuration.GetConnectionString("SqlServer"))
        : opts.UseSqlite(builder.Configuration.GetConnectionString("Sqlite")));

// Repositories & Services (daftarkan semua di sini)
builder.Services.AddScoped<IProductRepository, ProductRepository>();
builder.Services.AddScoped<ProductService>();

// JWT
var key = builder.Configuration["Jwt:Key"]!;
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(opts => opts.TokenValidationParameters = new()
    {
        ValidateIssuer = false, ValidateAudience = false, ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(key))
    });

builder.Services.AddControllers();
builder.Services.AddExceptionHandler<GlobalExceptionHandler>();
builder.Services.AddProblemDetails();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c => {
    c.SwaggerDoc("v1", new() { Title = "Business App API", Version = "v1" });
    c.AddSecurityDefinition("Bearer", new() { Description = "JWT: Bearer {token}",
        Name = "Authorization", In = ParameterLocation.Header, Type = SecuritySchemeType.ApiKey });
    c.AddSecurityRequirement(new() {{ new() { Reference = new() {
        Type = ReferenceType.SecurityScheme, Id = "Bearer" } }, Array.Empty<string>() }});
});

var app = builder.Build();
using (var scope = app.Services.CreateScope())
    scope.ServiceProvider.GetRequiredService<AppDbContext>().Database.Migrate();

if (app.Environment.IsDevelopment()) { app.UseSwagger(); app.UseSwaggerUI(); }
app.UseExceptionHandler();
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();
app.Run();
```

---

## 8. Template: Controller Standar

```csharp
[Authorize]
[ApiController]
[Route("api/[controller]")]
public class ProductsController(ProductService svc) : ControllerBase
{
    [HttpGet]
    public async Task<ActionResult<ApiResponse<List<ProductResponse>>>> GetAll()
        => Ok(ApiResponse<List<ProductResponse>>.SuccessResult(await svc.GetAllAsync()));

    [HttpGet("{id:int}")]
    public async Task<ActionResult<ApiResponse<ProductResponse>>> GetById(int id)
        => Ok(ApiResponse<ProductResponse>.SuccessResult(await svc.GetByIdAsync(id)));

    [HttpPost]
    public async Task<ActionResult<ApiResponse<ProductResponse>>> Create([FromBody] CreateProductRequest req)
    {
        var result = await svc.CreateAsync(req);
        return CreatedAtAction(nameof(GetById), new { id = result.Id },
            ApiResponse<ProductResponse>.SuccessResult(result, "Product created."));
    }

    [HttpPut("{id:int}")]
    public async Task<ActionResult<ApiResponse<ProductResponse>>> Update(int id, [FromBody] UpdateProductRequest req)
        => Ok(ApiResponse<ProductResponse>.SuccessResult(await svc.UpdateAsync(id, req), "Updated."));

    [HttpDelete("{id:int}")]
    public async Task<ActionResult<ApiResponse<string>>> Delete(int id)
    {
        await svc.DeleteAsync(id);
        return Ok(ApiResponse<string>.SuccessResult("Deleted successfully."));
    }
}
```

---

## 9. Seed Data — HARUS Pakai Tanggal Statis

```csharp
// ✅ BENAR — nilai statis
new Product { Id = 1, Name = "Laptop", CreatedAt = new DateTime(2026, 1, 1, 0, 0, 0, DateTimeKind.Utc) }

// ❌ SALAH — menyebabkan migration error karena nilai berubah setiap saat
new Product { Id = 1, Name = "Laptop", CreatedAt = DateTime.UtcNow }
```

---

## 10. Android: Retrofit Setup Ringkas

```kotlin
// RetrofitClient.kt
object RetrofitClient {
    // Emulator: 10.0.2.2 | Device fisik: IP komputer (cek ipconfig)
    private const val BASE_URL = "http://10.0.2.2:5001/"
    val instance: ApiService by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(ApiService::class.java)
    }
}

// ApiService.kt
interface ApiService {
    @GET("api/products")
    suspend fun getProducts(): Response<ApiResponse<List<ProductResponse>>>

    @POST("api/products")
    suspend fun createProduct(@Body request: CreateProductRequest): Response<ApiResponse<ProductResponse>>
}
```

---

## 11. WinForm: HttpClient Pattern yang Benar

```csharp
// ApiClient.cs — Singleton, jangan buat baru setiap request
public class ApiClient
{
    private static readonly HttpClient _client = new();
    private const string BaseUrl = "http://localhost:5001/api";

    public async Task<List<ProductDto>> GetProductsAsync()
    {
        var response = await _client.GetStringAsync($"{BaseUrl}/products");
        var result = JsonSerializer.Deserialize<ApiResponse<List<ProductDto>>>(response, new JsonSerializerOptions
            { PropertyNameCaseInsensitive = true });
        return result?.Data ?? new List<ProductDto>();
    }
}

// Di Form event handler — HARUS async
private async void btnRefresh_Click(object sender, EventArgs e)
{
    var products = await _apiClient.GetProductsAsync();
    dataGridView1.DataSource = null;
    dataGridView1.DataSource = products;
}
```

---

## 12. Status Codes Referensi Cepat

| Kode | Arti | Kapan |
|------|------|-------|
| `200 OK` | Berhasil | GET, PUT |
| `201 Created` | Dibuat | POST (gunakan `CreatedAtAction`) |
| `404 Not Found` | Tidak ada | ID tidak ditemukan |
| `409 Conflict` | Konflik | Email/nama duplikat |
| `422 Unprocessable` | Business rule | Stok tidak cukup, status invalid |
| `500 Internal Error` | Error server | Bug tak terduga |

---

*Referensi project contoh: `dotnet-api-example/` — BookstoreApi (Level 1), LibraryApi (Level 2), HotelApi (Level 3)*
