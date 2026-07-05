# LKS IT Software Solution for Business - Spesifikasi Persyaratan Kompetisi

## Ikhtisar

Dokumen ini menyediakan pemecahan detail dari persyaratan kompetisi (Kisi-kisi) untuk LKS DIKMEN Nasional 2026 - IT Software Solution for Business. Dokumen ini mengembangkan persyaratan umum dengan detail implementasi spesifik, kriteria penilaian, dan spesifikasi teknis untuk setiap modul.

---

## 1. Persyaratan Umum (Semua Modul)

### 1.1 Validasi & Penanganan Error
- **Persyaratan**: Setiap modul harus menyertakan validasi yang tepat dan pesan error yang jelas
- **Implementasi**:
  - Validasi semua input pengguna sebelum diproses
  - Sediakan pesan error yang spesifik dan dapat ditindaklanjuti
  - Tangani kasus edge dan kondisi batas
  - Implementasikan pemulihan error yang baik
  - Catat error dengan tepat untuk debugging

### 1.2 Standar UI/UX
- **Persyaratan Scrollbar**: Scrollbar harus ditampilkan ketika list atau view tidak dapat dimuat sepenuhnya dalam satu layer
  - **Implementasi**: Aktifkan scrolling untuk list, grid, dan konten panjang
  - **Mobile**: Gunakan ScrollView, LazyColumn, atau RecyclerView
  - **Desktop**: Aktifkan AutoScroll di DataGridView, kontrol yang dapat di-scroll

- **Format Tanggal**: Gunakan format tanggal yang sesuai ISO YYYY-MM-DD untuk semua field tanggal
  - **Implementasi**: 
    - Tampilkan tanggal dalam format YYYY-MM-DD
    - Validasi input tanggal ke format ISO
    - Simpan tanggal dalam format ISO di database
    - Tangani konversi timezone jika diperlukan

- **Pemusatan Formulir**: Semua formulir atau laporan harus ditampilkan terpusat di layar
  - **Mobile**: Gunakan alignment Center atau padding yang tepat
  - **Desktop**: Gunakan FormStartPosition.CenterParent atau pemusatan manual

- **Perilaku Modal**: Ketika formulir atau dialog dalam fokus, formulir lain harus dinonaktifkan untuk mencegah pemrosesan paralel
  - **Implementasi**: 
    - Gunakan ShowDialog() untuk formulir modal di .NET
    - Nonaktifkan formulir induk ketika formulir anak aktif
    - Implementasikan hierarki kepemilikan formulir yang tepat

- **Konvensi Penamaan**: Terapkan konvensi penamaan yang tepat untuk semua materi yang diserahkan
  - **Kode**: Ikuti konvensi spesifik bahasa (PascalCase untuk kelas, camelCase untuk metode/variabel)
  - **File**: Gunakan nama yang deskriptif dengan ekstensi yang tepat
  - **Database**: Gunakan snake_case atau PascalCase secara konsisten
  - **Endpoint API**: Gunakan kebab-case atau camelCase untuk URL

### 1.3 Panduan Wireframe
- **Hanya Referensi**: Wireframe yang disediakan hanya untuk referensi
- **Modifikasi Diizinkan**: Modifikasi diizinkan jika tidak mempengaruhi fungsionalitas atau kinerja fitur yang ada
- **Panduan**:
  - Pertahankan fungsionalitas inti dari wireframe
  - Tingkatkan UX sambil mempertahankan set fitur
  - Pastikan semua komponen yang diperlukan hadir
  - Jangan hapus fitur yang ditampilkan di wireframe

### 1.4 Manajemen Waktu
- **Persyaratan**: Perhatikan dengan seksama waktu kerja yang dialokasikan dan kelola waktu yang tersedia secara efektif
- **Strategi**:
  - Baca persyaratan secara menyeluruh sebelum memulai
  - Prioritaskan fitur dengan bobot tinggi terlebih dahulu
  - Alokasikan waktu buffer untuk pengujian
  - Implementasikan MVP (Minimum Viable Product) terlebih dahulu, lalu tingkatkan
  - Lacak waktu yang dihabiskan untuk setiap tugas

---

## 2. Modul: Aplikasi Desktop (.NET)

### 2.1 Ikhtisar Modul
- **Durasi**: 3 jam
- **Hari**: Hari 1
- **Bobot**: 30%
- **Teknologi**: .NET 8, Windows Forms, SQL Server

### 2.2 Persyaratan Detail

#### 2.2.1 Impor & Integrasi Database
**Persyaratan**: Impor database dan isinya dari sumber eksternal (database atau API)

**Opsi Implementasi**:
1. **Impor Database Langsung**:
   - Gunakan SQL Server Management Studio (SSMS) untuk mengimpor file .bak
   - Gunakan SQL Server Import and Export Wizard
   - Gunakan BULK INSERT untuk file CSV/data
   - Implementasikan migrasi Entity Framework

2. **Impor Berbasis API**:
   - Konsumsi endpoint REST API
   - Parse respons JSON/XML
   - Map data API ke skema database
   - Tangani pagination untuk dataset besar

**Pertimbangan Teknis**:
- Validasi integritas data yang diimpor
- Tangani rekaman duplikat
- Implementasikan rollback transaksi pada kegagalan
- Catat progres impor dan error

#### 2.2.2 Pengembangan Windows Forms
**Persyaratan**: Buat Windows Forms dan komponen UI berdasarkan persyaratan yang diberikan

**Komponen UI untuk Diimplementasikan**:
- **Formulir**: Formulir utama, formulir anak, formulir dialog
- **Kontrol**:
  - TextBox (untuk input teks)
  - ComboBox (untuk seleksi dropdown)
  - DataGridView (untuk tampilan data)
  - Button (untuk aksi)
  - Label (untuk tampilan)
  - DateTimePicker (untuk seleksi tanggal)
  - CheckBox (untuk nilai boolean)
  - RadioButton (untuk opsi eksklusif)
  - ListBox (untuk seleksi berganda)
  - MenuStrip (untuk navigasi)
  - ToolStrip (untuk toolbar)

**Prinsip Desain Formulir**:
- Styling yang konsisten di semua formulir
- Perataan dan spasi kontrol yang tepat
- Urutan tab untuk navigasi keyboard
- Ukuran kontrol yang dapat diakses
- Layout responsif (anchoring/docking)

#### 2.2.3 Validasi Input Pengguna & Kontrol Akses
**Persyaratan**: Lakukan validasi input pengguna dan terapkan pembatasan akses menu berdasarkan peran pengguna

**Validasi Input**:
- **Field Wajib**: Periksa nilai kosong/null
- **Validasi Tipe Data**: Pastikan tipe data yang benar (numerik, tanggal, dll.)
- **Validasi Rentang**: Periksa nilai dalam rentang yang dapat diterima
- **Validasi Format**: Email, nomor telepon, dll.
- **Validasi Aturan Bisnis**: Validasi kustom berdasarkan persyaratan

**Contoh Implementasi**:
```csharp
private void ValidateInput()
{
    if (string.IsNullOrEmpty(txtName.Text))
    {
        errorProvider1.SetError(txtName, "Nama wajib diisi");
        return false;
    }
    
    if (!int.TryParse(txtAge.Text, out int age) || age < 0 || age > 120)
    {
        errorProvider1.SetError(txtAge, "Usia harus antara 0 dan 120");
        return false;
    }
    
    return true;
}
```

**Kontrol Akses Berbasis Peran**:
- Definisikan peran pengguna (Admin, User, Guest, dll.)
- Buat pemetaan peran-perizinan
- Sembunyikan/nonaktifkan item menu berdasarkan peran
- Implementasikan pemeriksaan autentikasi sebelum operasi sensitif
- Gunakan Windows Authentication atau sistem login kustom

#### 2.2.4 Operasi CRUD
**Persyaratan**: Tampilkan dan kelola rekaman database, termasuk create, read, update, delete (CRUD), pencarian, dan operasi filtering

**Operasi Create**:
- Formulir untuk entri data
- Validasi sebelum insert
- Generate primary key (auto-increment atau GUID)
- Kembalikan status sukses/gagal
- Refresh tampilan data setelah insert

**Operasi Read**:
- Muat data ke DataGridView
- Implementasikan pagination untuk dataset besar
- Dukung pengurutan berdasarkan kolom
- Tampilkan data yang diformat (tanggal, mata uang, dll.)

**Operasi Update**:
- Edit rekaman yang ada
- Muat data saat ini ke formulir edit
- Validasi perubahan sebelum update
- Tangani update konkuren (optimistic locking)
- Audit trail untuk perubahan

**Operasi Delete**:
- Konfirmasi sebelum delete (dialog)
- Soft delete (tandai sebagai dihapus) atau hard delete
- Tangani constraints foreign key
- Cascade delete jika diperlukan
- Refresh tampilan setelah delete

**Implementasi Pencarian**:
- Pencarian berdasarkan beberapa field
- Dukungan pencocokan parsial
- Pencarian case-insensitive
- Pencarian real-time (saat pengguna mengetik)
- Pencarian lanjutan dengan beberapa kriteria

**Implementasi Filtering**:
- Filter berdasarkan rentang tanggal
- Filter berdasarkan kategori/status
- Kombinasi filter berganda
- Opsi hapus filter
- Pertahankan status filter

#### 2.2.5 Operasi Query Lanjutan
**Persyaratan**: Proses data menggunakan query relasional, termasuk query JOIN dan aggregate

**Query JOIN**:
- **INNER JOIN**: Rekaman dengan nilai yang cocok di kedua tabel
- **LEFT JOIN**: Semua rekaman dari tabel kiri, yang cocok dari kanan
- **RIGHT JOIN**: Semua rekaman dari tabel kanan, yang cocok dari kiri
- **FULL OUTER JOIN**: Semua rekaman ketika ada kecocokan di salah satu tabel

**Contoh Implementasi**:
```sql
SELECT 
    o.OrderID,
    c.CustomerName,
    p.ProductName,
    od.Quantity,
    od.UnitPrice
FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID
WHERE o.OrderDate BETWEEN '2026-01-01' AND '2026-12-31'
```

**Query Aggregate**:
- **COUNT**: Jumlah rekaman
- **SUM**: Jumlah nilai numerik
- **AVG**: Rata-rata nilai numerik
- **MIN**: Nilai minimum
- **MAX**: Nilai maksimum
- **GROUP BY**: Kelompokkan rekaman untuk agregasi

**Contoh Implementasi**:
```sql
SELECT 
    c.CategoryName,
    COUNT(p.ProductID) as ProductCount,
    SUM(p.UnitPrice) as TotalPrice,
    AVG(p.UnitPrice) as AveragePrice
FROM Products p
INNER JOIN Categories c ON p.CategoryID = c.CategoryID
GROUP BY c.CategoryName
HAVING COUNT(p.ProductID) > 5
ORDER BY TotalPrice DESC
```

**Implementasi Entity Framework**:
```csharp
var result = (from o in context.Orders
              join c in context.Customers on o.CustomerID equals c.CustomerID
              join od in context.OrderDetails on o.OrderID equals od.OrderID
              where o.OrderDate >= startDate && o.OrderDate <= endDate
              group new { o, c, od } by c.CustomerName into g
              select new
              {
                  CustomerName = g.Key,
                  OrderCount = g.Count(),
                  TotalAmount = g.Sum(x => x.od.Quantity * x.od.UnitPrice)
              }).ToList();
```

#### 2.2.6 Visualisasi Data
**Persyaratan**: Sajikan data dalam format visual, seperti grafik

**Tipe Grafik untuk Diimplementasikan**:
- **Grafik Batang**: Bandingkan nilai di beberapa kategori
- **Grafik Garis**: Tampilkan tren dari waktu ke waktu
- **Grafik Pie**: Tampilkan proporsi/persentase
- **Grafik Kolom**: Grafik batang vertikal
- **Grafik Area**: Grafik garis yang terisi

**Komponen Grafik**:
- Judul grafik dan label sumbu
- Legend untuk beberapa seri
- Label data untuk nilai
- Tooltips saat hover
- Coding warna untuk kategori
- Garis grid untuk referensi

**Implementasi Menggunakan Kontrol Grafik**:
```csharp
// Buat grafik batang
chart1.Series.Clear();
chart1.Series.Add("Sales");

// Set tipe grafik
chart1.Series["Sales"].ChartType = SeriesChartType.Column;

// Tambahkan titik data
foreach (var item in salesData)
{
    chart1.Series["Sales"].Points.AddXY(item.Category, item.Amount);
}

// Konfigurasikan sumbu
chart1.ChartAreas[0].AxisX.Title = "Category";
chart1.ChartAreas[0].AxisY.Title = "Sales Amount";
chart1.ChartAreas[0].AxisY.LabelStyle.Format = "C2";

// Aktifkan legend
chart1.Legends.Add("Sales");
```

**Update Grafik Dinamis**:
- Refresh grafik ketika data berubah
- Tangani nilai null/nol
- Skala sumbu secara otomatis
- Dukung interaksi drill-down

#### 2.2.7 Manipulasi DataGridView
**Persyaratan**: Manipulasi dan kelola data menggunakan komponen DataGridView

**Fitur DataGridView**:
- **Data Binding**: Bind ke DataTable, List, atau BindingSource
- **Tipe Kolom**: TextBox, ComboBox, CheckBox, Button, Image, Link
- **Pengurutan**: Klik header kolom untuk mengurutkan
- **Seleksi**: Seleksi baris tunggal atau berganda
- **Editing**: Editing sel inline
- **Formatting**: Formatting sel (tanggal, mata uang, dll.)
- **Styling**: Warna sel, font, alignment

**Contoh Implementasi**:
```csharp
// Konfigurasikan DataGridView
dataGridView1.AutoGenerateColumns = false;
dataGridView1.AllowUserToAddRows = false;
dataGridView1.ReadOnly = true;
dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;

// Tambahkan kolom secara manual
DataGridViewTextBoxColumn colID = new DataGridViewTextBoxColumn();
colID.Name = "ID";
colID.HeaderText = "ID";
colID.DataPropertyName = "ID";
dataGridView1.Columns.Add(colID);

DataGridViewTextBoxColumn colName = new DataGridViewTextBoxColumn();
colName.Name = "Name";
colName.HeaderText = "Customer Name";
colName.DataPropertyName = "CustomerName";
dataGridView1.Columns.Add(colName);

// Bind data
dataGridView1.DataSource = customerData;
```

**Fitur Lanjutan**:
- Menu konteks untuk operasi baris
- Event validasi sel
- Event masuk/keluar baris
- Painting sel kustom
- Ekspor ke Excel/CSV

### 2.3 Kriteria Penilaian (30% - Measurement)

**Metode Penilaian**: Biner (1 jika memenuhi kriteria, 0 jika tidak)

| Aspek | Deskripsi | Nilai Maks |
|--------|-------------|------------|
| Koneksi Database | Koneksi yang tepat ke SQL Server (langsung atau API) | 0.20 |
| Impor Data | Impor data database/API eksternal yang sukses | 0.15 |
| Operasi CRUD | Semua operasi CRUD fungsional (Create, Read, Update, Delete) | 0.25 |
| Pencarian & Filter | Fitur pencarian dan filtering berfungsi dengan benar | 0.10 |
| Query JOIN | Implementasi operasi JOIN yang benar | 0.10 |
| Query Aggregate | Implementasi fungsi aggregate yang benar | 0.05 |
| Visualisasi Data | Grafik menampilkan data dengan akurat | 0.10 |
| Validasi Input | Semua validasi input diimplementasikan | 0.05 |
| Kontrol Akses | Pembatasan menu berbasis peran berfungsi | 0.05 |
| Penanganan Error | Pesan error dan penanganan exception yang tepat | 0.05 |

**Total**: 1.00 (dikonversi ke 30% dari skor total)

---

## 3. Modul: Aplikasi Mobile (Android)

### 3.1 Ikhtisar Modul
- **Durasi**: 3 jam masing-masing (Modul A & C)
- **Hari**: Hari 1 (Modul A) dan Hari 2 (Modul C)
- **Bobot**: 25% masing-masing (total 50%)
- **Teknologi**: Android Studio, Kotlin, Jetpack Compose

### 3.2 Persyaratan Detail

#### 3.2.1 Desain Database
**Persyaratan**: Analisis persyaratan yang diberikan dan terjemahkan ke desain database yang tepat

**Proses Desain Database**:
1. **Analisis Persyaratan**:
   - Identifikasi entitas (objek/konsep)
   - Identifikasi atribut (properti entitas)
   - Identifikasi hubungan (asosiasi antara entitas)

2. **Desain Skema**:
   - Buat tabel untuk setiap entitas
   - Definisikan primary key (PK)
   - Definisikan foreign key (FK) untuk hubungan
   - Set tipe data untuk setiap kolom
   - Tambahkan constraints (NOT NULL, UNIQUE, CHECK)

3. **Normalisasi**:
   - Normal Form Pertama (1NF): Hapus grup berulang
   - Normal Form Kedua (2NF): Hapus dependensi parsial
   - Normal Form Ketiga (3NF): Hapus dependensi transitif

**Contoh Skema**:
```sql
-- Tabel Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    Phone NVARCHAR(20),
    Address NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Tabel Products
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500),
    UnitPrice DECIMAL(10,2) NOT NULL,
    StockQuantity INT DEFAULT 0,
    CategoryID INT,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Tabel Orders
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2),
    Status NVARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
```

**Pertimbangan**:
- Pilih tipe data yang tepat
- Indeks kolom yang sering diquery
- Rencanakan skalabilitas
- Dokumentasikan skema

#### 3.2.2 Pengembangan API
**Persyaratan**: Desain dan implementasikan API sesuai kontrak endpoint yang diberikan

**Prinsip Desain API**:
- **Desain RESTful**: Gunakan metode HTTP yang tepat (GET, POST, PUT, DELETE)
- **URL Berbasis Resource**: Gunakan kata benda, bukan kata kerja (misalnya, /api/customers, bukan /api/getCustomers)
- **Penamaan Konsisten**: Gunakan kebab-case atau camelCase untuk URL
- **Versioning**: Sertakan versi di URL (misalnya, /api/v1/customers)
- **Stateless**: Setiap request berisi semua informasi yang diperlukan

**Struktur Kontrak Endpoint**:
```yaml
# Contoh Kontrak Endpoint
GET /api/v1/customers
Deskripsi: Ambil semua pelanggan dengan filtering opsional
Parameter:
  - page: integer (opsional) - Nomor halaman untuk pagination
  - limit: integer (opsional) - Jumlah rekaman per halaman
  - search: string (opsional) - Istilah pencarian untuk nama pelanggan
Response:
  - 200 OK: Array objek pelanggan
  - 400 Bad Request: Parameter tidak valid
  - 500 Internal Server Error: Error server

POST /api/v1/customers
Deskripsi: Buat pelanggan baru
Request Body:
  {
    "customerName": "string (wajib)",
    "email": "string (wajib, unik)",
    "phone": "string (opsional)",
    "address": "string (opsional)"
  }
Response:
  - 201 Created: Objek pelanggan yang dibuat dengan ID
  - 400 Bad Request: Data tidak valid
  - 409 Conflict: Email sudah ada
  - 500 Internal Server Error: Error server
```

**Implementasi API (Contoh .NET Core)**:
```csharp
[ApiController]
[Route("api/v1/[controller]")]
public class CustomersController : ControllerBase
{
    private readonly AppDbContext _context;

    public CustomersController(AppDbContext context)
    {
        _context = context;
    }

    // GET: api/v1/customers
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Customer>>> GetCustomers(
        [FromQuery] int page = 1,
        [FromQuery] int limit = 10,
        [FromQuery] string search = null)
    {
        var query = _context.Customers.AsQueryable();

        if (!string.IsNullOrEmpty(search))
        {
            query = query.Where(c => c.CustomerName.Contains(search));
        }

        var customers = await query
            .Skip((page - 1) * limit)
            .Take(limit)
            .ToListAsync();

        return Ok(customers);
    }

    // POST: api/v1/customers
    [HttpPost]
    public async Task<ActionResult<Customer>> CreateCustomer(Customer customer)
    {
        if (!ModelState.IsValid)
        {
            return BadRequest(ModelState);
        }

        _context.Customers.Add(customer);
        await _context.SaveChangesAsync();

        return CreatedAtAction(nameof(GetCustomer), new { id = customer.CustomerID }, customer);
    }
}
```

#### 3.2.3 Implementasi Logika Bisnis
**Persyaratan**: Implementasikan logika bisnis yang benar untuk setiap endpoint API

**Contoh Logika Bisnis**:

**1. Logika Pemrosesan Pesanan**:
```csharp
public async Task<Order> ProcessOrder(Order order)
{
    // Validasi pesanan
    if (order.OrderDetails == null || !order.OrderDetails.Any())
    {
        throw new ArgumentException("Pesanan harus memiliki setidaknya satu item");
    }

    // Periksa ketersediaan stok
    foreach (var item in order.OrderDetails)
    {
        var product = await _context.Products.FindAsync(item.ProductID);
        if (product == null)
        {
            throw new ArgumentException($"Produk {item.ProductID} tidak ditemukan");
        }

        if (product.StockQuantity < item.Quantity)
        {
            throw new ArgumentException($"Stok tidak cukup untuk produk {product.ProductName}");
        }
    }

    // Hitung total
    decimal total = 0;
    foreach (var item in order.OrderDetails)
    {
        var product = await _context.Products.FindAsync(item.ProductID);
        total += product.UnitPrice * item.Quantity;
    }
    order.TotalAmount = total;

    // Update stok
    foreach (var item in order.OrderDetails)
    {
        var product = await _context.Products.FindAsync(item.ProductID);
        product.StockQuantity -= item.Quantity;
    }

    // Simpan pesanan
    _context.Orders.Add(order);
    await _context.SaveChangesAsync();

    return order;
}
```

**2. Logika Validasi**:
```csharp
public bool ValidateCustomer(Customer customer)
{
    // Field wajib
    if (string.IsNullOrWhiteSpace(customer.CustomerName))
        return false;

    // Format email
    if (!IsValidEmail(customer.Email))
        return false;

    // Format telepon (jika disediakan)
    if (!string.IsNullOrEmpty(customer.Phone) && !IsValidPhone(customer.Phone))
        return false;

    // Aturan bisnis
    if (customer.CustomerName.Length < 3 || customer.CustomerName.Length > 100)
        return false;

    return true;
}
```

**3. Logika Transformasi Data**:
```csharp
public CustomerDTO MapToDTO(Customer customer)
{
    return new CustomerDTO
    {
        CustomerID = customer.CustomerID,
        CustomerName = customer.CustomerName,
        Email = customer.Email,
        Phone = customer.Phone,
        Address = customer.Address,
        TotalOrders = _context.Orders.Count(o => o.CustomerID == customer.CustomerID),
        TotalSpent = _context.Orders
            .Where(o => o.CustomerID == customer.CustomerID)
            .Sum(o => o.TotalAmount) ?? 0
    };
}
```

#### 3.2.4 Standar Response API
**Persyaratan**: Definisikan dan sediakan endpoint API dengan metode HTTP, headers, parameter, request bodies, dan response yang tepat

**Format Response Standar**:
```json
// Response Sukses
{
  "success": true,
  "data": {
    "customerID": 1,
    "customerName": "John Doe",
    "email": "john@example.com"
  },
  "message": "Pelanggan berhasil diambil"
}

// Response Error
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Data input tidak valid",
    "details": [
      {
        "field": "email",
        "message": "Email wajib diisi"
      }
    ]
  }
}
```

**Kode Status HTTP**:
- **200 OK**: GET, PUT, PATCH yang sukses
- **201 Created**: POST yang sukses
- **204 No Content**: DELETE yang sukses
- **400 Bad Request**: Input tidak valid
- **401 Unauthorized**: Autentikasi diperlukan
- **403 Forbidden**: Otorisasi gagal
- **404 Not Found**: Resource tidak ditemukan
- **409 Conflict**: Konflik resource (duplikat)
- **500 Internal Server Error**: Error server

**Response Headers**:
```
Content-Type: application/json
Cache-Control: no-cache
X-Request-ID: unique-request-id
```

**Contoh Implementasi**:
```csharp
[HttpGet("{id}")]
public async Task<IActionResult> GetCustomer(int id)
{
    var customer = await _context.Customers.FindAsync(id);

    if (customer == null)
    {
        return NotFound(new
        {
            success = false,
            error = new
            {
                code = "NOT_FOUND",
                message = $"Pelanggan dengan ID {id} tidak ditemukan"
            }
        });
    }

    return Ok(new
    {
        success = true,
        data = customer,
        message = "Pelanggan berhasil diambil"
    });
}
```

#### 3.2.5 Penanganan Error
**Persyaratan**: Tangani kasus negatif dan error dengan menyediakan response API yang konsisten dan dapat dikonsumsi

**Strategi Penanganan Error**:
1. **Error Validasi**: Kembalikan 400 dengan error tingkat field
2. **Error Not Found**: Kembalikan 404 dengan informasi resource
3. **Error Konflik**: Kembalikan 409 dengan detail konflik
4. **Error Server**: Kembalikan 500 dengan pesan error generik
5. **Error Autentikasi**: Kembalikan 401 dengan tantangan auth

**Handler Exception Global**:
```csharp
public class GlobalExceptionHandler : IExceptionHandler
{
    public async ValueTask<bool> TryHandleAsync(
        HttpContext httpContext,
        Exception exception,
        CancellationToken cancellationToken)
    {
        var response = new
        {
            success = false,
            error = new
            {
                code = "INTERNAL_ERROR",
                message = exception.Message
            }
        };

        httpContext.Response.StatusCode = exception switch
        {
            NotFoundException => StatusCodes.Status404NotFound,
            ValidationException => StatusCodes.Status400BadRequest,
            ConflictException => StatusCodes.Status409Conflict,
            _ => StatusCodes.Status500InternalServerError
        };

        await httpContext.Response.WriteAsJsonAsync(response, cancellationToken);
        return true;
    }
}
```

**Response Error Validasi**:
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Satu atau lebih error validasi terjadi",
    "details": [
      {
        "field": "customerName",
        "message": "Nama pelanggan wajib diisi"
      },
      {
        "field": "email",
        "message": "Format email tidak valid"
      }
    ]
  }
}
```

#### 3.2.6 Implementasi UI Mobile
**Persyaratan**: Buat formulir aplikasi mobile dan komponen UI berdasarkan persyaratan yang diberikan

**Komponen UI Jetpack Compose**:

**1. Field Input Teks**:
```kotlin
@Composable
fun CustomerInputField(
    label: String,
    value: String,
    onValueChange: (String) -> Unit,
    modifier: Modifier = Modifier
) {
    OutlinedTextField(
        value = value,
        onValueChange = onValueChange,
        label = { Text(label) },
        modifier = modifier.fillMaxWidth(),
        singleLine = true,
        colors = TextFieldDefaults.outlinedTextFieldColors(
            focusedBorderColor = MaterialTheme.colorScheme.primary,
            unfocusedBorderColor = MaterialTheme.colorScheme.outline
        )
    )
}
```

**2. Layout Formulir**:
```kotlin
@Composable
fun CustomerForm(
    customer: Customer,
    onCustomerChange: (Customer) -> Unit,
    onSave: () -> Unit
) {
    Column(
        modifier = Modifier
            .fillMaxSize()
            .padding(16.dp),
        verticalArrangement = Arrangement.spacedBy(16.dp)
    ) {
        Text(
            text = "Informasi Pelanggan",
            style = MaterialTheme.typography.headlineSmall
        )

        CustomerInputField(
            label = "Nama Pelanggan",
            value = customer.customerName,
            onValueChange = { customer.customerName = it }
        )

        CustomerInputField(
            label = "Email",
            value = customer.email,
            onValueChange = { customer.email = it }
        )

        CustomerInputField(
            label = "Telepon",
            value = customer.phone,
            onValueChange = { customer.phone = it }
        )

        Spacer(modifier = Modifier.weight(1f))

        Button(
            onClick = onSave,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Simpan Pelanggan")
        }
    }
}
```

**3. Tampilan List**:
```kotlin
@Composable
fun CustomerList(
    customers: List<Customer>,
    onCustomerClick: (Customer) -> Unit
) {
    LazyColumn(
        modifier = Modifier.fillMaxSize(),
        contentPadding = PaddingValues(16.dp),
        verticalArrangement = Arrangement.spacedBy(8.dp)
    ) {
        items(customers) { customer ->
            CustomerCard(
                customer = customer,
                onClick = { onCustomerClick(customer) }
            )
        }
    }
}

@Composable
fun CustomerCard(
    customer: Customer,
    onClick: () -> Unit
) {
    Card(
        modifier = Modifier.fillMaxWidth(),
        onClick = onClick
    ) {
        Column(
            modifier = Modifier.padding(16.dp)
        ) {
            Text(
                text = customer.customerName,
                style = MaterialTheme.typography.titleMedium
            )
            Text(
                text = customer.email,
                style = MaterialTheme.typography.bodyMedium,
                color = MaterialTheme.colorScheme.onSurfaceVariant
            )
        }
    }
}
```

**4. Navigasi**:
```kotlin
@Composable
fun AppNavigation() {
    val navController = rememberNavController()

    NavHost(
        navController = navController,
        startDestination = "customer_list"
    ) {
        composable("customer_list") {
            CustomerListScreen(
                onCustomerClick = { customer ->
                    navController.navigate("customer_detail/${customer.customerID}")
                }
            )
        }

        composable(
            route = "customer_detail/{customerId}",
            arguments = listOf(navArgument("customerId") { type = NavType.IntType })
        ) { backStackEntry ->
            val customerId = backStackEntry.arguments?.getInt("customerId") ?: 0
            CustomerDetailScreen(customerId = customerId)
        }
    }
}
```

#### 3.2.7 Integrasi API
**Persyaratan**: Integrasikan aplikasi mobile dengan API untuk menampilkan dan mengelola data, termasuk operasi create, read, update, dan delete (CRUD)

**Implementasi Layanan API**:
```kotlin
interface CustomerApiService {
    @GET("api/v1/customers")
    suspend fun getCustomers(
        @Query("page") page: Int = 1,
        @Query("limit") limit: Int = 10,
        @Query("search") search: String? = null
    ): Response<List<Customer>>

    @GET("api/v1/customers/{id}")
    suspend fun getCustomer(@Path("id") id: Int): Response<Customer>

    @POST("api/v1/customers")
    suspend fun createCustomer(@Body customer: Customer): Response<Customer>

    @PUT("api/v1/customers/{id}")
    suspend fun updateCustomer(
        @Path("id") id: Int,
        @Body customer: Customer
    ): Response<Customer>

    @DELETE("api/v1/customers/{id}")
    suspend fun deleteCustomer(@Path("id") id: Int): Response<Unit>
}
```

**Pola Repository**:
```kotlin
class CustomerRepository(private val apiService: CustomerApiService) {
    suspend fun getCustomers(page: Int = 1, limit: Int = 10, search: String? = null): Result<List<Customer>> {
        return try {
            val response = apiService.getCustomers(page, limit, search)
            if (response.isSuccessful) {
                Result.success(response.body() ?: emptyList())
            } else {
                Result.failure(Exception("Error: ${response.code()}"))
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }

    suspend fun createCustomer(customer: Customer): Result<Customer> {
        return try {
            val response = apiService.createCustomer(customer)
            if (response.isSuccessful) {
                Result.success(response.body()!!)
            } else {
                Result.failure(Exception("Error: ${response.code()}"))
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
}
```

**Integrasi ViewModel**:
```kotlin
class CustomerViewModel(private val repository: CustomerRepository) : ViewModel() {
    private val _customers = mutableStateOf<List<Customer>>(emptyList())
    val customers: State<List<Customer>> = _customers

    private val _isLoading = mutableStateOf(false)
    val isLoading: State<Boolean> = _isLoading

    private val _error = mutableStateOf<String?>(null)
    val error: State<String?> = _error

    fun loadCustomers() {
        viewModelScope.launch {
            _isLoading.value = true
            _error.value = null

            when (val result = repository.getCustomers()) {
                is Result.Success -> {
                    _customers.value = result.data
                }
                is Result.Failure -> {
                    _error.value = result.exception.message
                }
            }

            _isLoading.value = false
        }
    }

    fun saveCustomer(customer: Customer) {
        viewModelScope.launch {
            _isLoading.value = true

            when (val result = repository.createCustomer(customer)) {
                is Result.Success -> {
                    _customers.value = _customers.value + result.data
                }
                is Result.Failure -> {
                    _error.value = result.exception.message
                }
            }

            _isLoading.value = false
        }
    }
}
```

#### 3.2.8 Implementasi Pencarian & Filter
**Persyaratan**: Implementasikan fitur pencarian dan filtering data di aplikasi mobile

**Implementasi Pencarian**:
```kotlin
@Composable
fun SearchBar(
    query: String,
    onQueryChange: (String) -> Unit,
    modifier: Modifier = Modifier
) {
    OutlinedTextField(
        value = query,
        onValueChange = onQueryChange,
        modifier = modifier.fillMaxWidth(),
        placeholder = { Text("Cari pelanggan...") },
        leadingIcon = {
            Icon(Icons.Default.Search, contentDescription = "Search")
        },
        trailingIcon = {
            if (query.isNotEmpty()) {
                IconButton(onClick = { onQueryChange("") }) {
                    Icon(Icons.Default.Clear, contentDescription = "Clear")
                }
            }
        },
        singleLine = true
    )
}

// Penggunaan dengan debouncing
@Composable
fun CustomerListScreen() {
    var searchQuery by remember { mutableStateOf("") }
    val viewModel: CustomerViewModel = viewModel()

    // Pencarian dengan debouncing
    LaunchedEffect(searchQuery) {
        delay(500) // Tunggu 500ms setelah pengguna berhenti mengetik
        viewModel.searchCustomers(searchQuery)
    }

    Column {
        SearchBar(
            query = searchQuery,
            onQueryChange = { searchQuery = it }
        )

        CustomerList(
            customers = viewModel.customers.value,
            isLoading = viewModel.isLoading.value
        )
    }
}
```

**Implementasi Filter**:
```kotlin
data class CustomerFilter(
    val category: String? = null,
    val minTotalSpent: Double? = null,
    val dateFrom: LocalDate? = null,
    val dateTo: LocalDate? = null
)

@Composable
fun FilterDialog(
    filter: CustomerFilter,
    onFilterChange: (CustomerFilter) -> Unit,
    onDismiss: () -> Unit,
    onApply: () -> Unit
) {
    var localFilter by remember { mutableStateOf(filter) }

    AlertDialog(
        onDismissRequest = onDismiss,
        title = { Text("Filter Pelanggan") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(16.dp)) {
                // Filter kategori
                var selectedCategory by remember { mutableStateOf(filter.category) }
                FilterDropdown(
                    label = "Kategori",
                    options = listOf("All", "VIP", "Regular", "New"),
                    selectedOption = selectedCategory,
                    onOptionSelected = {
                        selectedCategory = if (it == "All") null else it
                        localFilter = localFilter.copy(category = selectedCategory)
                    }
                )

                // Filter rentang tanggal
                DatePickerRow(
                    label = "Rentang Tanggal",
                    dateFrom = localFilter.dateFrom,
                    dateTo = localFilter.dateTo,
                    onDateFromChange = { localFilter = localFilter.copy(dateFrom = it) },
                    onDateToChange = { localFilter = localFilter.copy(dateTo = it) }
                )
            }
        },
        confirmButton = {
            TextButton(onClick = {
                onFilterChange(localFilter)
                onApply()
            }) {
                Text("Terapkan")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Batal")
            }
        }
    )
}
```

#### 3.2.9 Ekspor Data
**Persyaratan**: Ekspor data aplikasi ke file eksternal

**Implementasi Ekspor CSV**:
```kotlin
fun exportCustomersToCSV(customers: List<Customer>, context: Context): Uri? {
    val csvContent = buildString {
        appendLine("CustomerID,CustomerName、Email、Phone、Address")
        customers.forEach { customer ->
            appendLine("${customer.customerID},${customer.customerName},${customer.email},${customer.phone},${customer.address}")
        }
    }

    val fileName = "customers_${SimpleDateFormat("yyyyMMdd_HHmmss", Locale.getDefault()).format(Date())}.csv"
    
    val contentValues = ContentValues().apply {
        put(MediaStore.Downloads.DISPLAY_NAME, fileName)
        put(MediaStore.Downloads.MIME_TYPE, "text/csv")
        put(MediaStore.Downloads.IS_PENDING, 1)
    }

    val resolver = context.contentResolver
    val uri = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, contentValues)

    uri?.let {
        resolver.openOutputStream(it)?.use { outputStream ->
            outputStream.write(csvContent.toByteArray())
        }

        contentValues.clear()
        contentValues.put(MediaStore.Downloads.IS_PENDING, 0)
        resolver.update(it, contentValues, null, null)
    }

    return uri
}
```

**Implementasi Ekspor PDF**:
```kotlin
fun exportCustomersToPDF(customers: List<Customer>, context: Context): Uri? {
    val pdfDocument = PdfDocument()
    val pageInfo = PdfDocument.PageInfo.Builder(595, 842, 1).create()
    val page = pdfDocument.startPage(pageInfo)
    val canvas = page.canvas

    // Gambar judul
    val paint = Paint().apply {
        color = Color.BLACK
        textSize = 24f
        typeface = Typeface.create(Typeface.DEFAULT, Typeface.BOLD)
    }
    canvas.drawText("Daftar Pelanggan", 200f, 50f, paint)

    // Gambar header tabel
    paint.textSize = 14f
    var yPosition = 100f
    canvas.drawText("ID", 50f, yPosition, paint)
    canvas.drawText("Nama", 100f, yPosition, paint)
    canvas.drawText("Email", 300f, yPosition, paint)

    // Gambar baris data
    yPosition += 30f
    paint.textSize = 12f
    customers.forEach { customer ->
        canvas.drawText(customer.customerID.toString(), 50f, yPosition, paint)
        canvas.drawText(customer.customerName, 100f, yPosition, paint)
        canvas.drawText(customer.email, 300f, yPosition, paint)
        yPosition += 25f
    }

    pdfDocument.finishPage(page)

    val fileName = "customers_${SimpleDateFormat("yyyyMMdd_HHmmss", Locale.getDefault()).format(Date())}.pdf"
    
    val contentValues = ContentValues().apply {
        put(MediaStore.Downloads.DISPLAY_NAME, fileName)
        put(MediaStore.Downloads.MIME_TYPE, "application/pdf")
        put(MediaStore.Downloads.IS_PENDING, 1)
    }

    val resolver = context.contentResolver
    val uri = resolver.insert(MediaStore.Downloads.EXTERNAL_CONTENT_URI, contentValues)

    uri?.let {
        resolver.openOutputStream(it)?.use { outputStream ->
            pdfDocument.writeTo(outputStream)
        }
        pdfDocument.close()

        contentValues.clear()
        contentValues.put(MediaStore.Downloads.IS_PENDING, 0)
        resolver.update(it, contentValues, null, null)
    }

    return uri
}
```

**UI Ekspor**:
```kotlin
@Composable
fun ExportButton(
    customers: List<Customer>,
    context: Context
) {
    var showExportDialog by remember { mutableStateOf(false) }

    Button(onClick = { showExportDialog = true }) {
        Icon(Icons.Default.FileDownload, contentDescription = null)
        Spacer(modifier = Modifier.width(8.dp))
        Text("Ekspor")
    }

    if (showExportDialog) {
        AlertDialog(
            onDismissRequest = { showExportDialog = false },
            title = { Text("Ekspor Data") },
            text = {
                Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                    Text("Pilih format ekspor:")
                    Button(
                        onClick = {
                            exportCustomersToCSV(customers, context)
                            showExportDialog = false
                        },
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Text("Ekspor sebagai CSV")
                    }
                    Button(
                        onClick = {
                            exportCustomersToPDF(customers, context)
                            showExportDialog = false
                        },
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Text("Ekspor sebagai PDF")
                    }
                }
            },
            confirmButton = {
                TextButton(onClick = { showExportDialog = false }) {
                    Text("Batal")
                }
            }
        )
    }
}
```

### 3.3 Kriteria Penilaian (25% masing-masing - Measurement)

**Metode Penilaian**: Biner (1 jika memenuhi kriteria, 0 jika tidak)

| Aspek | Deskripsi | Nilai Maks |
|--------|-------------|------------|
| Desain Database | Skema database yang tepat dengan hubungan | 0.15 |
| Implementasi API | Semua endpoint diimplementasikan dengan benar | 0.25 |
| Logika Bisnis | Logika bisnis yang benar untuk semua operasi | 0.20 |
| Format Response API | Response API yang konsisten dan tepat | 0.10 |
| Penanganan Error | Penanganan error dan pesan yang tepat | 0.10 |
| UI Mobile | Komponen UI berdasarkan persyaratan | 0.10 |
| Integrasi API | Integrasi yang sukses dengan API | 0.15 |
| Operasi CRUD | Semua operasi CRUD fungsional | 0.20 |
| Fungsionalitas Pencarian | Fitur pencarian berfungsi dengan benar | 0.10 |
| Fungsionalitas Filter | Fitur filter berfungsi dengan benar | 0.10 |
| Ekspor Data | Ekspor ke file eksternal fungsional | 0.05 |
| Validasi | Validasi input diimplementasikan | 0.05 |

**Total**: 1.00 (dikonversi ke 25% dari skor total per modul)

---

## 4. Modul: Desain Perangkat Lunak

### 4.1 Ikhtisar Modul
- **Durasi**: 3 jam
- **Hari**: Hari 2
- **Bobot**: 20%
- **Teknologi**: Draw.io, Diagram UML

### 4.2 Persyaratan Detail

#### 4.2.1 Analisis & Dokumentasi Persyaratan
**Persyaratan**: Mampu menganalisis dan mendokumentasikan persyaratan berdasarkan kebutuhan pengguna dan sistem

**Proses Analisis Persyaratan**:
1. **Identifikasi Stakeholder**:
   - Identifikasi semua stakeholder (pengguna, administrator, manajer sistem)
   - Pahami peran dan tanggung jawab mereka
   - Kumpulkan kebutuhan dan ekspektasi mereka

2. **Persyaratan Fungsional**:
   - Apa yang harus dilakukan sistem
   - Fitur dan kemampuan spesifik
   - Interaksi pengguna dan alur kerja
   - Persyaratan pemrosesan data

3. **Persyaratan Non-Fungsional**:
   - Persyaratan kinerja (waktu respons, throughput)
   - Persyaratan keamanan (autentikasi, otorisasi)
   - Persyaratan reliabilitas (ketersediaan, penanganan error)
   - Persyaratan usability (kemudahan penggunaan, aksesibilitas)
   - Persyaratan skalabilitas (menangani pertumbuhan)

**Template Dokumentasi Persyaratan**:
```markdown
# Dokumen Persyaratan Sistem

## 1. Pendahuluan
### 1.1 Tujuan
### 1.2 Ruang Lingkup
### 1.3 Definisi

## 2. Deskripsi Keseluruhan
### 2.1 Konteks Sistem
### 2.2 Karakteristik Pengguna
### 2.3 Kendala

## 3. Persyaratan Fungsional
### 3.1 Manajemen Pengguna
- FR-001: Sistem harus mengizinkan registrasi pengguna
- FR-002: Sistem harus mengizinkan login pengguna
- FR-003: Sistem harus mengizinkan reset password

### 3.2 Manajemen Data
- FR-004: Sistem harus mengizinkan operasi CRUD
- FR-005: Sistem harus mendukung ekspor data

## 4. Persyaratan Non-Fungsional
### 4.1 Kinerja
- NFR-001: Sistem harus merespons dalam 2 detik
- NFR-002: Sistem harus mendukung 100 pengguna konkuren

### 4.2 Keamanan
- NFR-003: Sistem harus menggunakan HTTPS
- NFR-004: Sistem harus hash password

## 5. Use Cases
(Deskripsi use case)

## 6. Persyaratan Data
(Skema database, kamus data)
```

**Contoh Persyaratan Fungsional**:
```
FR-010: Pencarian Pelanggan

Deskripsi: Sistem harus mengizinkan pengguna mencari pelanggan berdasarkan nama, email, atau nomor telepon.

Prioritas:  Tinggi
Status: Disetujui

Kriteria Penerimaan:
- Pengguna dapat memasukkan istilah pencarian di field pencarian
- Sistem mengembalikan pelanggan yang cocok
- Pencarian case-insensitive
- Pencarian mendukung pencocokan parsial
- Hasil ditampilkan dalam 2 detik
```

#### 4.2.2 Pengembangan Use Case
**Persyaratan**: Mampu mengembangkan use case yang secara jelas mewakili interaksi antara pengguna dan sistem

**Komponen Use Case**:
1. **Nama Use Case**: Nama deskriptif dari use case
2. **Aktor**: Pengguna atau sistem eksternal yang berinteraksi dengan sistem
3. **Deskripsi**: Deskripsi singkat tentang apa yang dilakukan use case
4. **Pra-kondisi**: Kondisi yang harus benar sebelum use case dimulai
5. **Alur Utama (Happy Path)**: Deskripsi langkah demi langkah dari eksekusi normal
6. **Alur Alternatif**: Jalur alternatif atau exception
7. **Pasca-kondisi**: Kondisi yang harus benar setelah use case selesai

**Contoh Use Case**:
```
Use Case: UC-001 - Registrasi Pelanggan

Aktor: Pelanggan

Deskripsi: Pelanggan baru mendaftarkan akun di sistem.

Pra-kondisi:
- Pelanggan memiliki alamat email yang valid
- Pelanggan memiliki akses ke formulir registrasi

Alur Utama:
1. Pelanggan menavigasi ke halaman registrasi
2. Pelanggan memasukkan nama, email, telepon, dan alamat
3. Pelanggan memasukkan password dan mengkonfirmasi password
4. Pelanggan mengklik tombol "Register"
5. Sistem memvalidasi data input
6. Sistem memeriksa apakah email sudah ada
7. Sistem membuat akun pelanggan
8. Sistem mengirim email konfirmasi
9. Sistem menampilkan pesan sukses
10. Pelanggan diarahkan ke halaman login

Alur Alternatif:
Alt Flow 1: Input Tidak Valid
- Pada langkah 5, jika validasi gagal:
  - Sistem menampilkan pesan error
  - Pelanggan memperbaiki input
  - Kembali ke langkah 4

Alt Flow 2: Email Sudah Ada
- Pada langkah 6, jika email ada:
  - Sistem menampilkan pesan error
  - Pelanggan memasukkan email berbeda
  - Kembali ke langkah 4

Pasca-kondisi:
- Akun pelanggan dibuat di database
- Pelanggan dapat login dengan kredensial
- Email konfirmasi dikirim
```

**Elemen Diagram Use Case**:
- **Aktor**: Tokoh stick yang mewakili pengguna/sistem eksternal
- **Use Case**: Oval yang mewakili fungsi
- **Batas Sistem**: Persegi panjang yang mengelilingi use case terkait
- **Asosiasi**: Garis yang menghubungkan aktor ke use case
- **Include**: Panik putus-putus dengan label <<include>>
- **Extend**: Panik putus-putus dengan label <<extend>>
- **Generalisasi**: Panik solid dengan segitiga hollow

**Contoh Diagram Use Case**:
```
┌─────────────────────────────────────┐
│           Sistem Pelanggan            │
├─────────────────────────────────────┤
│                                      │
│  ┌─────────┐    ┌──────────────┐   │
│  │ Register│───→│Login         │   │
│  └─────────┘    └──────────────┘   │
│                      │               │
│                      ↓               │
│              ┌──────────────┐       │
│              │View Profile │       │
│              └──────────────┘       │
│                      │               │
│                      ↓               │
│              ┌──────────────┐       │
│              │Update Profile│      │
│              └──────────────┘       │
│                                      │
└─────────────────────────────────────┘
     ↑           ↑           ↑
  Pelanggan    Admin    Admin Sistem
```

#### 4.2.3 Pemodelan Diagram Aktivitas
**Persyaratan**: Mampu memodelkan alur kerja sistem menggunakan diagram aktivitas sesuai dengan persyaratan yang didefinisikan

**Komponen Diagram Aktivitas**:
- **Node Awal**: Lingkaran solid yang mewakili awal
- **Aktivitas**: Persegi panjang yang dibulatkan yang mewakili aksi
- **Node Keputusan**: Berlian yang mewakili percabangan
- **Node Penggabungan**: Berlian yang mewakili konvergensi jalur
- **Node Fork**: Bat tebal yang mewakili eksekusi paralel
- **Node Join**: Bat tebal yang mewakili sinkronisasi
- **Node Akhir**: Lingkaran dengan border yang mewakili akhir
- **Alur**: Panah yang mewakili alur kontrol
- **Alur Objek**: Panik putus-putus yang mewakili alur data

**Contoh Diagram Aktivitas - Registrasi Pelanggan**:
```
        [Awal]
           │
           ↓
    ┌─────────────┐
    │Tampilkan Form│
    └─────────────┘
           │
           ↓
    ┌─────────────┐
    │Masukkan Data │
    └─────────────┘
           │
           ↓
      ┌─────────┐
      │Validasi │◄──────┐
      └─────────┘       │
           │            │
      ┌────┴────┐       │
      │ Valid?  │       │
      └────┬────┘       │
     Ya   │   Tidak     │
      ↓    │    ↓       │
┌─────────┐ │ ┌─────────┐
│Periksa  │ │ │Tampilkan│
│Email    │ │ │Error    │
└─────────┘ │ └─────────┘
     │      │    │
  ┌──┴──┐   │    └──┐
  │Exist?│   │       │
  └──┬──┘   │       │
  Tidak │  Ya│       │
   ↓   │   ↓ │       │
┌─────┐│┌─────┐│       │
│Buat │││Tampilkan│      │
│Akun │││Error  │      │
└─────┘│└─────┘│      │
   │   │   │   │      │
   └───┴───┘   └──────┘
       │
       ↓
┌─────────────┐
│Kirim Email  │
└─────────────┘
       │
       ↓
┌─────────────┐
│Tampilkan    │
│Sukses       │
└─────────────┘
       │
       ↓
     [Akhir]
```

**Praktik Terbaik Diagram Aktivitas**:
- Pertahankan diagram sederhana dan fokus
- Gunakan label yang jelas dan deskriptif
- Hindari garis bersilangan jika memungkinkan
- Kelompokkan aktivitas terkait
- Tampilkan jalur penanganan error
- Indikasikan proses paralel dengan fork/join

#### 4.2.4 Desain UI
**Persyaratan**: Mampu mendesain antarmuka pengguna untuk aplikasi desktop dan mobile yang memenuhi persyaratan fungsional dan prinsip usability

**Prinsip Desain UI**:
1. **Konsistensi**: Tampilan dan nuansa yang konsisten di semua layar
2. **Keklaran**: Antarmuka yang jelas dan intuitif
3. **Efisiensi**: Minimalkan usaha pengguna
4. **Feedback**: Sediakan feedback yang jelas untuk aksi
5. **Pencegahan Error**: Cegah error sebelum terjadi
6. **Aksesibilitas**: Dapat diakses oleh semua pengguna
7. **Responsivitas**: Antarmuka yang cepat dan responsif

**Contoh Desain UI Desktop**:
```
┌─────────────────────────────────────────────────────┐
│ Sistem Manajemen Pelanggan              [_][□][X] │
├─────────────────────────────────────────────────────┤
│ File  Edit  View  Tools  Help                         │
├─────────────────────────────────────────────────────┤
│                                                     │
│  ┌──────────────┐  ┌──────────────────────────┐   │
│  │ Daftar Pelanggan│  │ Detail Pelanggan         │   │
│  ├──────────────┤  ├──────────────────────────┤  │
│  │ [Cari:    ]│  │ ID:        [12345]      │   │
│  ├──────────────┤  │ Nama:      [John Doe]   │   │
│  │ John Doe     │  │ Email:     [john@...]   │   │
│  │ Jane Smith   │  │ Telepon:   [555-1234]   │   │
│  │ Bob Johnson  │  │ Alamat:   [123 Main St]│   │
│  │              │  ├──────────────────────────┤   │
│  │              │  │ [Simpan] [Batal] [Hapus] │   │
│  └──────────────┘  └──────────────────────────┘   │
│                                                     │
│  Status: Siap                                       │
└─────────────────────────────────────────────────────┘
```

**Contoh Desain UI Mobile**:
```
┌─────────────────────────┐
│  ←  Daftar Pelanggan    +  │
├─────────────────────────┤
│                         │
│  🔍 Cari pelanggan...  │
│                         │
├─────────────────────────┤
│ ┌─────────────────────┐ │
│ │ John Doe            │ │
│ │ john@example.com    │ │
│ └─────────────────────┘ │
│                         │
│ ┌─────────────────────┐ │
│ │ Jane Smith          │ │
│ │ jane@example.com    │ │
│ └─────────────────────┘ │
│                         │
│ ┌─────────────────────┐ │
│ │ Bob Johnson         │ │
│ │ bob@example.com     │ │
│ └─────────────────────┘ │
│                         │
│                         │
│         [Tambah Baru]       │
└─────────────────────────┘
```

**Panduan Wireframe**:
- Gunakan bentuk dan garis sederhana
- Fokus pada layout dan struktur
- Sertakan semua elemen yang diperlukan
- Tampilkan jalur navigasi
- Indikasikan elemen interaktif
- Catat perilaku khusus

**Daftar Periksa Desain UI**:
- [ ] Semua field wajib hadir
- [ ] Label yang jelas untuk semua input
- [ ] Tipe input yang tepat
- [ ] Tombol submit/batal
- [ ] Area tampilan pesan error
- [ ] Indikator loading
- [ ] Elemen navigasi
- [ ] Desain responsif
- [ ] Fitur aksesibilitas
- [ ] Styling yang konsisten

### 4.3 Kriteria Penilaian (20% - Judgement)

**Metode Penilaian**: Subjektif (skala 0-3)

| Aspek | Deskripsi | Skor |
|--------|-------------|------|
| **0 - Di Bawah Standar Industri** | Wireframe tidak jelas dan tidak secara efektif mengkomunikasikan desain | |
| **1 - Memenuhi Standar Industri** | Wireframe agak jelas tetapi bisa lebih efektif dalam mengkomunikasikan desain | |
| **2 - Melebihi Standar Industri** | Wireframe jelas dan secara efektif mengkomunikasikan sebagian besar aspek desain | |
| **3 - Luar Biasa** | Wireframe sangat jelas dan secara efektif mengkomunikasikan semua aspek desain | |

**Area Penilaian**:
1. **Dokumentasi Persyaratan** (25%)
   - Kelengkapan persyaratan
   - Keklaran dokumentasi
   - Organisasi dan struktur
   - Traceability ke desain

2. **Pengembangan Use Case** (25%)
   - Kelengkapan use case
   - Akurasi identifikasi aktor
   - Keklaran alur
   - Penanganan exception yang tepat

3. **Diagram Aktivitas** (25%)
   - Akurasi representasi alur kerja
   - Kelengkapan jalur
   - Keklaran notasi
   - Kepatuhan standar UML

4. **Desain UI** (25%)
   - Usability desain
   - Kelengkapan layar
   - Konsistensi di layar
   - Kepatuhan persyaratan

**Total**: 20% dari skor keseluruhan

---

## 5. Pertimbangan Lintas Modul

### 5.1 Konsistensi Data
- Pastikan model data yang konsisten di mobile dan desktop
- Gunakan skema database yang sama untuk semua modul
- Pertahankan integritas data di platform

### 5.2 Standar API
- Desain API yang konsisten di semua endpoint
- Format response yang distandarisasi
- Penanganan error yang seragam
- Autentikasi/otorisasi yang konsisten

### 5.3 Kualitas Kode
- Ikuti standar coding untuk setiap platform
- Implementasikan penanganan error yang tepat
- Tambahkan komentar yang tepat
- Gunakan nama variabel/fungsi yang bermakna

### 5.4 Keamanan
- Implementasikan autentikasi jika diperlukan
- Lindungi data sensitif
- Validasi semua input
- Gunakan komunikasi yang aman (HTTPS)

### 5.5 Kinerja
- Optimasi query database
- Implementasikan caching jika tepat
- Minimalkan panggilan API
- Tangani dataset besar secara efisien

---

## 6. Ringkasan Penilaian

### 6.1 Distribusi Bobot Modul
| Modul | Durasi | Bobot | Tipe Penilaian |
|--------|----------|--------|----------------|
| A: Aplikasi Mobile (Android) | 3 jam | 25% | Measurement |
| B: Aplikasi Desktop (.NET) | 3 jam | 30% | Measurement |
| C: Aplikasi Mobile (Android) | 3 jam | 25% | Measurement |
| D: Desain Perangkat Lunak | 3 jam | 20% | Judgement |
| **Total** | **12 jam** | **100%** | |

### 6.2 Metode Penilaian
- **Measurement (80%)**: Penilaian objektif, biner (0 atau 1)
  - Diterapkan pada Modul A, B, C
  - Berdasarkan penyelesaian kriteria spesifik
  - Pengurangan untuk komponen yang hilang

- **Judgement (20%)**: Penilaian subjektif, berskala (0-3)
  - Diterapkan pada Modul D (Desain Perangkat Lunak)
  - Berdasarkan kualitas dan standar industri
  - Mengevaluasi efektivitas desain

### 6.3 Konversi Skor
- Skor awal: skala 0-100
- Dikonversi ke skala WorldSkills: 0-700
- Peringkat:
  - Juara 1, 2, 3 berdasarkan skor yang dikonversi
  - Medallion of Excellence untuk skor di atas 700

---

## 7. Rekomendasi Persiapan

### 7.1 Keahlian Teknis untuk Dilatih
- **Desain Database**: Normalisasi, hubungan, indexing
- **Pengembangan API**: Desain RESTful, penanganan error, dokumentasi
- **Pengembangan Mobile**: Jetpack Compose, Kotlin coroutines, Retrofit
- **Pengembangan Desktop**: Windows Forms, Entity Framework, LINQ
- **Pemodelan UML**: Use case, diagram aktivitas, diagram kelas
- **SQL**: Query JOIN, fungsi aggregate, stored procedures

### 7.2 Strategi Manajemen Waktu
- **30 Menit Pertama**: Baca dan pahami persyaratan
- **60 Menit Berikutnya**: Desain struktur database dan API
- **90 Menit Berikutnya**: Implementasikan fungsionalitas inti
- **60 Menit Terakhir**: Pengujian, perbaikan, dan dokumentasi

### 7.3 Kesalahan Umum yang Dihindari
- Tidak membaca persyaratan secara menyeluruh
- Melewatkan validasi dan penanganan error
- Konvensi penamaan yang tidak konsisten
- Manajemen waktu yang buruk
- Mengabaikan kasus edge
- Tidak menguji semua fungsionalitas
- Pesan error yang tidak lengkap

### 7.4 Faktor Keberhasilan
- Pemahaman persyaratan yang jelas
- Kode yang terstruktur dengan baik
- Penanganan error yang komprehensif
- Desain UI/UX yang konsisten
- Dokumentasi yang tepat
- Manajemen waktu yang efektif
- Perhatian terhadap detail

---

**Versi Dokumen**: 1.0  
**Berdasarkan**: Kisi-kisi LKS DIKMEN Nasional 2026  
**Kompetisi**: IT Software Solution for Business  
**Terakhir Diperbarui**: 2026
