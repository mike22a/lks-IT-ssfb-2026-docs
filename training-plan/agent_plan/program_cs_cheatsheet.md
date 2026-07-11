# Cheatsheet: Program.cs — Setup Step by Step

> Panduan lengkap untuk mentor menjelaskan `Program.cs` ke siswa secara terurut.
> Referensi: `01-BookstoreApi/src/BookstoreApi.API/Program.cs`

---

## Gambaran Besar: Dua Fase Program.cs

```
Program.cs terbagi menjadi DUA fase yang jelas:

┌─────────────────────────────────────────────────────────┐
│  FASE 1 — REGISTER (builder.Services.Addxxx)            │
│  "Daftar semua yang dibutuhkan aplikasi"                 │
│  Urutan: DB → Repositories → Services → Auth → dll      │
├─────────────────────────────────────────────────────────┤
│  var app = builder.Build()   ← GARIS PEMISAH            │
├─────────────────────────────────────────────────────────┤
│  FASE 2 — PIPELINE (app.Usexxx / app.Mapxxx)            │
│  "Tentukan urutan request diproses"                      │
│  Urutan SANGAT PENTING — salah urut = bug/error          │
└─────────────────────────────────────────────────────────┘
```

**Analogi untuk siswa:**
> Fase 1 = Daftar menu restoran (siapkan bahan)
> `builder.Build()` = Buka pintu restoran
> Fase 2 = Urutan pelayan menyambut tamu (siapa ketemu siapa dulu)

---

## FASE 1 — REGISTER SERVICES

### Step 0: Entry Point

```csharp
var builder = WebApplication.CreateBuilder(args);
```

**Penjelasan:**
- Ini adalah titik awal SEMUA aplikasi ASP.NET Core
- `builder` punya dua properti penting:
  - `builder.Services` → tempat kita daftarkan dependencies
  - `builder.Configuration` → tempat kita baca `appsettings.json`
- **Selalu baris pertama, tidak pernah berubah**

---

### Step 1: Database (DbContext)

```csharp
// Baca dari appsettings.json: { "DatabaseProvider": "Sqlite" }
var dbProvider = builder.Configuration["DatabaseProvider"] ?? "Sqlite";

// Baca connection string sesuai provider
var connStr = builder.Configuration.GetConnectionString(dbProvider)
    ?? throw new InvalidOperationException($"Connection string '{dbProvider}' not configured.");

// Daftarkan DbContext dengan provider yang dipilih
builder.Services.AddDbContext<AppDbContext>(options =>
{
    if (dbProvider == "SqlServer")
        options.UseSqlServer(connStr);
    else
        options.UseSqlite(connStr);
});
```

**Penjelasan:**
- `AddDbContext<T>` mendaftarkan `AppDbContext` ke DI container
- Defaultnya **Scoped** — satu instance per HTTP request (ini yang kita mau untuk DB)
- Dual provider: bisa ganti antara SQLite (development) dan SQL Server (production/kompetisi)
  hanya dengan ubah `"DatabaseProvider"` di `appsettings.json` — tanpa ubah kode

**appsettings.json yang dibutuhkan:**
```json
{
  "DatabaseProvider": "Sqlite",
  "ConnectionStrings": {
    "Sqlite": "Data Source=app.db",
    "SqlServer": "Server=.;Database=BookstoreDb;Trusted_Connection=True;TrustServerCertificate=True;"
  }
}
```

---

### Step 2: Repositories

```csharp
builder.Services.AddScoped<IUserRepository, UserRepository>();
builder.Services.AddScoped<ICategoryRepository, CategoryRepository>();
builder.Services.AddScoped<IBookRepository, BookRepository>();
```

**Penjelasan:**
- Format: `AddScoped<Interface, Implementasi>()`
- Artinya: "Kalau ada yang minta `IUserRepository`, berikan `UserRepository`"
- Ini adalah inti dari **Dependency Inversion Principle** (DI dari SOLID)
- Mengapa Interface? Agar bisa swap implementasi tanpa ubah kode yang memakainya

**Mengapa urutan Repositories SEBELUM Services?**
> Services inject Repository. Jika Repository belum didaftarkan saat Services di-build,
> DI container akan throw error saat runtime.
> *(Sebenarnya urutan register tidak mempengaruhi resolusi di .NET — tapi lebih mudah dibaca)*

---

### Step 3: Application Services

```csharp
builder.Services.AddScoped<IJwtService, JwtService>();   // interface → implementasi
builder.Services.AddScoped<AuthService>();               // tanpa interface (langsung class)
builder.Services.AddScoped<CategoryService>();
builder.Services.AddScoped<BookService>();
```

**Penjelasan dua pola:**
```csharp
// Pola A: dengan interface (direkomendasikan untuk testability)
builder.Services.AddScoped<IProductService, ProductService>();

// Pola B: tanpa interface (lebih simpel, cukup untuk kompetisi)
builder.Services.AddScoped<ProductService>();
```

Untuk LKS: **Pola B sudah cukup** — tidak ada tuntutan unit testing. Lebih cepat ditulis.

---

### ⭐ Tabel: Scoped vs Singleton vs Transient

> **Ini wajib dipahami mentor untuk bisa menjelaskan ke siswa**

| Lifetime | Dibuat kapan? | Dihancurkan kapan? | Contoh penggunaan |
|----------|--------------|-------------------|-------------------|
| **`Scoped`** | Sekali per HTTP request | Saat request selesai | DbContext, Repository, Service |
| **`Singleton`** | Sekali saat app start | Saat app mati | Config, Cache, HttpClient factory |
| **`Transient`** | Setiap kali di-inject | Saat selesai dipakai | Objek ringan, stateless utility |

**Visualisasi:**
```
Request A masuk:
  DbContext-A ─── dipakai oleh ─── Repository-A ─── dipakai oleh ─── Service-A
  (semua Scoped = satu instance bersama dalam request A)

Request B masuk (bersamaan):
  DbContext-B ─── Repository-B ─── Service-B
  (instance terpisah dari Request A)

Singleton (misal: cache):
  CacheService ──── sama untuk Request A, B, C, ... sampai app restart
```

**Aturan praktis untuk LKS:**
```csharp
// DbContext     → SELALU Scoped (default AddDbContext sudah Scoped)
// Repository    → SELALU Scoped (pakai DbContext yang Scoped)
// Service       → SELALU Scoped (pakai Repository yang Scoped)
// HttpClient    → Singleton (via IHttpClientFactory) atau per-instance
// Config/Logger → sudah otomatis di-manage .NET
```

> ⚠️ **Pantang**: Jangan inject Scoped service ke dalam Singleton service
> → akan throw `InvalidOperationException: Cannot consume scoped service from singleton`

---

### Step 4: JWT Authentication

```csharp
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(options =>
    {
        options.TokenValidationParameters = new TokenValidationParameters
        {
            ValidateIssuerSigningKey = true,           // ✅ wajib — validasi signature token
            IssuerSigningKey = new SymmetricSecurityKey(
                Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]!)),
            ValidateIssuer = false,                    // ✅ false — kita tidak set issuer
            ValidateAudience = false                   // ✅ false — kita tidak set audience
        };
    });

builder.Services.AddAuthorization();
```

**Penjelasan per baris:**

| Baris | Arti |
|-------|------|
| `AddAuthentication(...)` | Daftarkan sistem autentikasi, set default scheme ke JWT Bearer |
| `AddJwtBearer(...)` | Konfigurasi bagaimana token JWT divalidasi |
| `ValidateIssuerSigningKey = true` | Cek apakah token ditandatangani dengan key yang benar |
| `IssuerSigningKey = ...` | Kunci rahasia yang dipakai untuk verifikasi signature token |
| `ValidateIssuer = false` | Kita tidak validasi siapa yang issue token (cukup untuk kompetisi) |
| `ValidateAudience = false` | Kita tidak validasi siapa tujuan token |
| `AddAuthorization()` | Aktifkan sistem `[Authorize]` di Controller |

**appsettings.json yang dibutuhkan:**
```json
{
  "Jwt": {
    "Key": "SuperSecretKeyAtLeast32CharactersLong!!"
  }
}
```

> ⚠️ **Key harus ≥ 32 karakter** untuk HMAC-SHA256. Lebih pendek → exception saat startup.

**Cara pakai di Controller:**
```csharp
[Authorize]              // semua endpoint butuh login
[AllowAnonymous]         // endpoint ini boleh tanpa login (override [Authorize])
```

---

### Step 5: Exception Handler

```csharp
builder.Services.AddExceptionHandler<GlobalExceptionHandler>();
builder.Services.AddProblemDetails();
```

**Penjelasan:**
- `AddExceptionHandler<T>` — daftarkan class handler untuk semua uncaught exception
- `AddProblemDetails()` — aktifkan format RFC 7807 (standar error HTTP response)
- Wajib dipasangkan dengan `app.UseExceptionHandler()` di Fase 2

---

### Step 6: Controllers + Swagger

```csharp
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    // Informasi API
    c.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "BookstoreApi",
        Version = "v1",
        Description = "Clean Architecture API Example"
    });

    // Tambahkan tombol "Authorize" di Swagger UI untuk JWT
    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Name = "Authorization",
        Type = SecuritySchemeType.Http,
        Scheme = "bearer",
        BearerFormat = "JWT",
        In = ParameterLocation.Header,
        Description = "Enter your JWT token. Example: eyJhbGci..."
    });

    // Terapkan security ke semua endpoint secara global
    c.AddSecurityRequirement(new OpenApiSecurityRequirement
    {{
        new OpenApiSecurityScheme
        {
            Reference = new OpenApiReference
            {
                Type = ReferenceType.SecurityScheme,
                Id = "Bearer"
            }
        },
        Array.Empty<string>()
    }});
});
```

**Penjelasan:**
- `AddControllers()` — aktifkan routing berbasis `[ApiController]` + `[Route]`
- `AddEndpointsApiExplorer()` — diperlukan agar Swagger bisa scan endpoint
- `AddSwaggerGen(...)` — generate dokumentasi OpenAPI dari controller annotations
- `AddSecurityDefinition` + `AddSecurityRequirement` — tambahkan tombol 🔒 di Swagger UI agar bisa test endpoint yang butuh JWT tanpa Postman

---

## GARIS PEMISAH

```csharp
var app = builder.Build();
```

**Setelah baris ini:**
- Tidak bisa lagi `builder.Services.AddXxx(...)` — DI container sudah "dikunci"
- Semua yang didaftarkan di Fase 1 sekarang siap dipakai
- Mulai konfigurasi **middleware pipeline** (Fase 2)

**Auto-migrate on startup** (opsional tapi sangat berguna di kompetisi):
```csharp
using (var scope = app.Services.CreateScope())
{
    var db = scope.ServiceProvider.GetRequiredService<AppDbContext>();
    db.Database.Migrate(); // jalankan migration yang pending secara otomatis
}
```
> Manfaat: setiap kali app distart, migration terbaru otomatis diterapkan.
> Tidak perlu jalankan `dotnet ef database update` manual.

---

## FASE 2 — MIDDLEWARE PIPELINE

```csharp
// Swagger (biasanya hanya development, tapi di kompetisi selalu aktif)
app.UseSwagger();
app.UseSwaggerUI(c =>
{
    c.SwaggerEndpoint("/swagger/v1/swagger.json", "BookstoreApi v1");
    c.RoutePrefix = "swagger"; // akses di /swagger
});

// Exception handler — HARUS paling awal di pipeline
app.UseExceptionHandler();

// Autentikasi — cek "siapa kamu?" (validasi token)
app.UseAuthentication();

// Autorisasi — cek "boleh kah kamu?" ([Authorize] attribute)
app.UseAuthorization();

// Map semua Controller routes
app.MapControllers();

app.Run();
```

### ⭐ Urutan Middleware — SANGAT PENTING

```
Request masuk
    │
    ▼
UseExceptionHandler()   ← Tangkap semua error dari middleware di bawahnya
    │
    ▼
UseSwagger/UI()         ← Sajikan docs (tidak perlu auth)
    │
    ▼
UseAuthentication()     ← Baca token JWT → isi HttpContext.User
    │
    ▼
UseAuthorization()      ← Cek apakah user boleh akses endpoint ini
    │
    ▼
MapControllers()        ← Route ke controller yang tepat → jalankan action
    │
    ▼
Response keluar
```

**Aturan mudah diingat:**
```
Exception → Swagger → Auth-N → Auth-Z → Controllers
```
> **Auth-N** = Authentication ("N" = kamu siap?)
> **Auth-Z** = Authorization ("Z" = kamu boleh?)

**Apa yang terjadi jika urutan salah?**
```csharp
// ❌ SALAH — Authorization sebelum Authentication
app.UseAuthorization();
app.UseAuthentication();
// Akibat: [Authorize] selalu gagal karena HttpContext.User belum diisi

// ❌ SALAH — Exception handler di akhir
app.UseAuthentication();
app.UseAuthorization();
app.UseExceptionHandler(); // tidak akan tangkap error dari UseAuthentication()!
app.MapControllers();
```

---

## Template Lengkap Program.cs (Copy-Paste Ready)

```csharp
using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
// tambahkan using namespace project kamu di sini

var builder = WebApplication.CreateBuilder(args);

// ── 1. DATABASE ──────────────────────────────────────────
var dbProvider = builder.Configuration["DatabaseProvider"] ?? "Sqlite";
var connStr = builder.Configuration.GetConnectionString(dbProvider)!;
builder.Services.AddDbContext<AppDbContext>(opt =>
    dbProvider == "SqlServer"
        ? opt.UseSqlServer(connStr)
        : opt.UseSqlite(connStr));

// ── 2. REPOSITORIES (Scoped) ─────────────────────────────
builder.Services.AddScoped<IProductRepository, ProductRepository>();
// tambahkan repository lain di sini...

// ── 3. SERVICES (Scoped) ─────────────────────────────────
builder.Services.AddScoped<ProductService>();
// tambahkan service lain di sini...

// ── 4. JWT AUTH ───────────────────────────────────────────
builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
    .AddJwtBearer(opt => opt.TokenValidationParameters = new()
    {
        ValidateIssuerSigningKey = true,
        IssuerSigningKey = new SymmetricSecurityKey(
            Encoding.UTF8.GetBytes(builder.Configuration["Jwt:Key"]!)),
        ValidateIssuer = false,
        ValidateAudience = false
    });
builder.Services.AddAuthorization();

// ── 5. EXCEPTION HANDLER ─────────────────────────────────
builder.Services.AddExceptionHandler<GlobalExceptionHandler>();
builder.Services.AddProblemDetails();

// ── 6. CONTROLLERS + SWAGGER ─────────────────────────────
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo { Title = "My API", Version = "v1" });
    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
    {
        Name = "Authorization", Type = SecuritySchemeType.Http,
        Scheme = "bearer", BearerFormat = "JWT", In = ParameterLocation.Header
    });
    c.AddSecurityRequirement(new OpenApiSecurityRequirement
    {{
        new OpenApiSecurityScheme { Reference = new OpenApiReference
            { Type = ReferenceType.SecurityScheme, Id = "Bearer" }},
        Array.Empty<string>()
    }});
});

// ── BUILD ─────────────────────────────────────────────────
var app = builder.Build();

// Auto-migrate
using (var scope = app.Services.CreateScope())
    scope.ServiceProvider.GetRequiredService<AppDbContext>().Database.Migrate();

// ── PIPELINE (urutan PENTING!) ────────────────────────────
app.UseSwagger();
app.UseSwaggerUI();
app.UseExceptionHandler();    // ← paling awal setelah Swagger
app.UseAuthentication();      // ← Auth-N dulu
app.UseAuthorization();       // ← baru Auth-Z
app.MapControllers();
app.Run();
```

---

## Checklist Saat Menulis Program.cs dari Awal

```
REGISTER (Fase 1):
[ ] AddDbContext — dengan connection string yang benar
[ ] AddScoped untuk semua Repository
[ ] AddScoped untuk semua Service
[ ] AddAuthentication + AddJwtBearer (jika pakai JWT)
[ ] AddAuthorization
[ ] AddExceptionHandler<GlobalExceptionHandler>
[ ] AddProblemDetails
[ ] AddControllers
[ ] AddEndpointsApiExplorer
[ ] AddSwaggerGen (dengan security definition jika JWT)

PIPELINE (Fase 2 — urutan harus tepat):
[ ] builder.Build() ← garis pemisah
[ ] Auto-migrate (opsional tapi dianjurkan)
[ ] UseSwagger + UseSwaggerUI
[ ] UseExceptionHandler ← paling awal
[ ] UseAuthentication ← sebelum Authorization
[ ] UseAuthorization  ← setelah Authentication
[ ] MapControllers
[ ] Run()
```

---

*File ini adalah cheatsheet pendamping untuk `01-BookstoreApi/src/BookstoreApi.API/Program.cs`*
*Buat cheatsheet ini selalu terbuka saat mengajar sesi 1–3*
