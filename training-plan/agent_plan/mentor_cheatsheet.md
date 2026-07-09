# Mentor Cheat Sheet — LKS IT SSfB 2026

> Referensi cepat untuk demonstrasi sesi. Cetak atau buka di tab terpisah saat mengajar.

---

## 1. Buat Solution Clean Architecture dari Awal

```bash
# 1. Buat folder dan masuk
mkdir BusinessApp && cd BusinessApp

# 2. Buat projects
dotnet new classlib -n BusinessApp.Domain      -o src/BusinessApp.Domain
dotnet new classlib -n BusinessApp.Application -o src/BusinessApp.Application
dotnet new classlib -n BusinessApp.Infrastructure -o src/BusinessApp.Infrastructure
dotnet new webapi   -n BusinessApp.API         -o src/BusinessApp.API

# 3. Buat solution & daftarkan
dotnet new sln -n BusinessApp
dotnet sln add src/BusinessApp.Domain/BusinessApp.Domain.csproj
dotnet sln add src/BusinessApp.Application/BusinessApp.Application.csproj
dotnet sln add src/BusinessApp.Infrastructure/BusinessApp.Infrastructure.csproj
dotnet sln add src/BusinessApp.API/BusinessApp.API.csproj

# 4. Atur referensi antar project (aturan dependency)
dotnet add src/BusinessApp.Application/BusinessApp.Application.csproj reference src/BusinessApp.Domain/BusinessApp.Domain.csproj
dotnet add src/BusinessApp.Infrastructure/BusinessApp.Infrastructure.csproj reference src/BusinessApp.Domain/BusinessApp.Domain.csproj src/BusinessApp.Application/BusinessApp.Application.csproj
dotnet add src/BusinessApp.API/BusinessApp.API.csproj reference src/BusinessApp.Application/BusinessApp.Application.csproj src/BusinessApp.Infrastructure/BusinessApp.Infrastructure.csproj

# 5. Instal NuGet packages
dotnet add src/BusinessApp.Infrastructure/BusinessApp.Infrastructure.csproj package Microsoft.EntityFrameworkCore.Sqlite --version 8.0.14
dotnet add src/BusinessApp.Infrastructure/BusinessApp.Infrastructure.csproj package Microsoft.EntityFrameworkCore.Tools --version 8.0.14
dotnet add src/BusinessApp.Infrastructure/BusinessApp.Infrastructure.csproj package BCrypt.Net-Next --version 4.2.0
dotnet add src/BusinessApp.Infrastructure/BusinessApp.Infrastructure.csproj package Microsoft.IdentityModel.Tokens --version 8.9.0
dotnet add src/BusinessApp.Infrastructure/BusinessApp.Infrastructure.csproj package System.IdentityModel.Tokens.Jwt --version 8.9.0
dotnet add src/BusinessApp.API/BusinessApp.API.csproj package Microsoft.AspNetCore.Authentication.JwtBearer --version 8.0.14
dotnet add src/BusinessApp.API/BusinessApp.API.csproj package Microsoft.EntityFrameworkCore.Design --version 8.0.14
dotnet add src/BusinessApp.API/BusinessApp.API.csproj package Swashbuckle.AspNetCore --version 6.9.0

# 6. Verify build
dotnet build BusinessApp.sln
```

---

## 2. EF Core — Migration Commands

```bash
# Tambah migration pertama
dotnet ef migrations add InitialCreate \
  --project src/BusinessApp.Infrastructure/BusinessApp.Infrastructure.csproj \
  --startup-project src/BusinessApp.API/BusinessApp.API.csproj \
  --context AppDbContext

# Apply migration ke database
dotnet ef database update \
  --project src/BusinessApp.Infrastructure/BusinessApp.Infrastructure.csproj \
  --startup-project src/BusinessApp.API/BusinessApp.API.csproj

# Hapus migration terakhir (jika ada kesalahan)
dotnet ef migrations remove \
  --project src/BusinessApp.Infrastructure/BusinessApp.Infrastructure.csproj \
  --startup-project src/BusinessApp.API/BusinessApp.API.csproj

# Reset database (hati-hati: data hilang)
dotnet ef database drop \
  --project src/BusinessApp.Infrastructure/BusinessApp.Infrastructure.csproj \
  --startup-project src/BusinessApp.API/BusinessApp.API.csproj
```

---

## 3. Template: ApiResponse\<T\>

```csharp
// src/BusinessApp.Application/Common/ApiResponse.cs
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

## 4. Template: GlobalExceptionHandler (.NET 8)

```csharp
// src/BusinessApp.API/Middleware/GlobalExceptionHandler.cs
using BusinessApp.Application.Common;
using BusinessApp.Domain.Exceptions;
using Microsoft.AspNetCore.Diagnostics;
using System.Net;

public class GlobalExceptionHandler(ILogger<GlobalExceptionHandler> logger) : IExceptionHandler
{
    public async ValueTask<bool> TryHandleAsync(HttpContext ctx, Exception ex, CancellationToken ct)
    {
        logger.LogError(ex, "Unhandled exception: {Msg}", ex.Message);

        var (code, msg) = ex switch
        {
            NotFoundException     => (HttpStatusCode.NotFound,            ex.Message),
            ConflictException     => (HttpStatusCode.Conflict,            ex.Message),
            BusinessRuleException => (HttpStatusCode.UnprocessableEntity, ex.Message),
            _                     => (HttpStatusCode.InternalServerError, "An unexpected error occurred.")
        };

        ctx.Response.StatusCode  = (int)code;
        ctx.Response.ContentType = "application/json";
        await ctx.Response.WriteAsJsonAsync(ApiResponse<object>.FailResult(msg), ct);
        return true;
    }
}
```

Daftar di `Program.cs`:
```csharp
builder.Services.AddExceptionHandler<GlobalExceptionHandler>();
builder.Services.AddProblemDetails();
// ...
app.UseExceptionHandler();
```

---

## 5. Template: Controller Standar

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
            ApiResponse<ProductResponse>.SuccessResult(result, "Created successfully."));
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

## 6. Template: Program.cs Lengkap

```csharp
// src/BusinessApp.API/Program.cs
using BusinessApp.Infrastructure.Data;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

// 1. Database (SQLite)
builder.Services.AddDbContext<AppDbContext>(opts =>
    opts.UseSqlite(builder.Configuration.GetConnectionString("Sqlite")));

// 2. DI — Repository & Service
builder.Services.AddScoped<IProductRepository, ProductRepository>();
builder.Services.AddScoped<ProductService>();

// 3. JWT Auth
var jwtKey = builder.Configuration["Jwt:Key"]!;
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(o => o.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = false, ValidateAudience = false, ValidateLifetime = true,
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtKey))
    });

builder.Services.AddControllers();
builder.Services.AddExceptionHandler<GlobalExceptionHandler>();
builder.Services.AddProblemDetails();

// 4. Swagger + Bearer
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "BusinessApp API", Version = "v1" });
    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Name = "Authorization", In = ParameterLocation.Header,
        Type = SecuritySchemeType.ApiKey, Scheme = "Bearer",
        Description = "JWT Authorization. Example: \"Bearer {token}\""
    });
    c.AddSecurityRequirement(new OpenApiSecurityRequirement {{
        new OpenApiSecurityScheme { Reference = new OpenApiReference
            { Type = ReferenceType.SecurityScheme, Id = "Bearer" }},
        Array.Empty<string>()
    }});
});

var app = builder.Build();

// 5. Auto-migrate
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

## 7. Template: appsettings.json

```json
{
  "Logging": { "LogLevel": { "Default": "Information" } },
  "AllowedHosts": "*",
  "ConnectionStrings": {
    "Sqlite": "Data Source=app.db",
    "SqlServer": "Server=localhost;Database=BusinessDb;Trusted_Connection=True;TrustServerCertificate=True;"
  },
  "Jwt": {
    "Key": "SuperSecretKeyForCompetitionMinimum32CharactersLong"
  }
}
```

---

## 8. Template: WinForm — ApiClient HttpClient

```csharp
// ApiClient.cs (taruh di project WinForm)
public class ApiClient
{
    private static readonly HttpClient _http = new() { BaseAddress = new Uri("http://localhost:5001/") };
    private string? _token;

    public void SetToken(string token) =>
        _http.DefaultRequestHeaders.Authorization =
            new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);

    public async Task<T?> GetAsync<T>(string url) where T : class
    {
        var resp = await _http.GetAsync(url);
        if (!resp.IsSuccessStatusCode) return null;
        return await resp.Content.ReadFromJsonAsync<T>();
    }

    public async Task<T?> PostAsync<T>(string url, object body) where T : class
    {
        var resp = await _http.PostAsJsonAsync(url, body);
        if (!resp.IsSuccessStatusCode) return null;
        return await resp.Content.ReadFromJsonAsync<T>();
    }
}
```

DataGridView pattern (tanpa UI freeze):
```csharp
private async void Form1_Load(object sender, EventArgs e) => await LoadData();
private async Task LoadData()
{
    var result = await _api.GetAsync<ApiResponse<List<ProductDto>>>("api/products");
    if (result?.Data != null)
    {
        dataGridView1.DataSource = null;
        dataGridView1.DataSource = result.Data;
    }
}
```

---

## 9. Template: Android Retrofit Setup

```kotlin
// RetrofitClient.kt
object RetrofitClient {
    private const val BASE_URL = "http://10.0.2.2:5001/"  // emulator → localhost
    val api: ApiService by lazy {
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
    suspend fun getProducts(): Response<ApiResponse<List<ProductDto>>>

    @POST("api/products")
    suspend fun createProduct(@Body request: CreateProductRequest): Response<ApiResponse<ProductDto>>
}

// ViewModel.kt
class ProductViewModel : ViewModel() {
    private val _products = MutableStateFlow<List<ProductDto>>(emptyList())
    val products = _products.asStateFlow()
    var isLoading by mutableStateOf(false)
    var errorMessage by mutableStateOf<String?>(null)

    fun loadProducts() {
        viewModelScope.launch {
            isLoading = true
            try {
                val response = RetrofitClient.api.getProducts()
                if (response.isSuccessful) _products.value = response.body()?.data ?: emptyList()
                else errorMessage = "Error: ${response.code()}"
            } catch (e: Exception) {
                errorMessage = e.message
            } finally { isLoading = false }
        }
    }
}
```

AndroidManifest.xml (tambahkan di dalam `<application>`):
```xml
<uses-permission android:name="android.permission.INTERNET" />
<!-- Untuk HTTP (bukan HTTPS) di development: -->
android:usesCleartextTraffic="true"
```

---

## 10. Quick Checklist Kompetisi

```
API:
[ ] Solution 4-layer terbuat & dotnet build 0 error
[ ] AppDbContext + relasi terkonfigurasi
[ ] Migration berhasil (tabel terbuat di DB)
[ ] CRUD endpoint semua berjalan di Swagger
[ ] ApiResponse<T> konsisten
[ ] GlobalExceptionHandler aktif (404, 409, 422, 500)
[ ] Business rules diimplementasikan di Service (bukan Controller)
[ ] JWT + Role-based auth aktif (jika diperlukan soal)

WinForm:
[ ] HttpClient singleton (bukan new per request)
[ ] Semua API call pakai async/await
[ ] DataGridView refresh setelah CRUD
[ ] Error handling: MessageBox.Show() yang user-friendly
[ ] Form centered (StartPosition = CenterScreen)

Android:
[ ] BASE_URL pakai 10.0.2.2 (emulator) / IP komputer (device fisik)
[ ] INTERNET permission di manifest
[ ] usesCleartextTraffic="true" jika HTTP
[ ] Loading state & error state ditampilkan
[ ] StateFlow / LiveData untuk state management
```

---

**Versi**: 1.0 (9 Juli 2026) | **Kompetisi**: LKS DIKMEN Nasional 2026 - IT SSfB
