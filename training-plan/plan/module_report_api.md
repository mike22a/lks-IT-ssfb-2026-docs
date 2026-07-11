# Modul: Report API (Summary JSON + Export PDF & Excel)

## Informasi Modul
- **Tipe**: Modul tambahan — disisipkan ke Sesi 2 dan Sesi 3
- **Total Estimasi Waktu**: 60–75 menit (dibagi dua bagian)
- **Library yang Dipakai**:
  - **QuestPDF** — generate PDF (`dotnet add package QuestPDF`)
  - **ClosedXML** — generate Excel (`dotnet add package ClosedXML`)

## Cara Menyisipkan ke Sesi

| Bagian Modul | Disisipkan ke | Posisi |
|---|---|---|
| **Part A — Summary JSON** | **Sesi 2** | Setelah Infrastructure Layer (sebelum DI Setup) |
| **Part B — Export PDF & Excel** | **Sesi 3** | Setelah Controllers standar, sebelum Review |

---

## Konsep Utama (5 menit — sampaikan di awal Part A)

### Proses Report itu Sama, Hanya Output-nya Berbeda

```
Query Data → Transform ke DTO → Output
                                  ├─ JSON       → return Ok(ApiResponse<T>)
                                  ├─ PDF        → return File(bytes, "application/pdf")
                                  └─ Excel      → return File(bytes, "application/vnd.openxmlformats...")
```

**Takeaway utama untuk siswa:**
> "Logika query data TIDAK berubah. Yang berubah hanya cara kita 'mengemas' hasilnya."

---

## Part A — Summary / Aggregate Data (JSON)
> **Disisipkan di Sesi 2** — setelah Generic Repository selesai

**Estimasi waktu**: 30 menit (10 teori + 10 demo + 10 practice)

### Kapan Endpoint Summary Diperlukan? (5 menit)

Soal LKS sering meminta tampilan **dashboard** atau **laporan ringkasan** di WinForm/Android:
- "Tampilkan total penjualan per kategori"
- "Tampilkan 5 produk terlaris bulan ini"
- "Tampilkan total stok per supplier"

Endpoint ini mengembalikan **JSON** — dikonsumsi WinForm untuk chart/label, atau Android untuk dashboard screen.

### Struktur yang Diikuti

```
Domain/Interfaces/       → IReportRepository.cs (interface query khusus)
Application/DTOs/        → SalesSummaryDto.cs, TopProductDto.cs
Application/Interfaces/  → IReportService.cs
Application/Services/    → ReportService.cs
Infrastructure/Repos/    → ReportRepository.cs (implementasi query)
API/Controllers/         → ReportsController.cs
```

> **Catatan**: Report tidak selalu butuh Generic Repository — lebih baik buat
> `IReportRepository` tersendiri karena query-nya khusus (JOIN + GROUP BY).

### Demo — Buat Summary Endpoint (10 menit)

#### Langkah 1: Buat DTO di Application/DTOs/

```csharp
// Application/DTOs/SalesSummaryDto.cs
public class SalesSummaryDto
{
    public string CategoryName { get; set; } = string.Empty;
    public int TotalTransactions { get; set; }
    public decimal TotalRevenue { get; set; }
    public int TotalItemsSold { get; set; }
}

// Application/DTOs/TopProductDto.cs
public class TopProductDto
{
    public int ProductId { get; set; }
    public string ProductName { get; set; } = string.Empty;
    public int TotalSold { get; set; }
    public decimal Revenue { get; set; }
}
```

#### Langkah 2: Interface di Domain dan Application

```csharp
// Domain/Interfaces/IReportRepository.cs
public interface IReportRepository
{
    Task<IEnumerable<SalesSummaryDto>> GetSalesSummaryAsync();
    Task<IEnumerable<TopProductDto>> GetTopProductsAsync(int top = 5);
}

// Application/Interfaces/IReportService.cs
public interface IReportService
{
    Task<IEnumerable<SalesSummaryDto>> GetSalesSummaryAsync();
    Task<IEnumerable<TopProductDto>> GetTopProductsAsync(int top = 5);
}
```

#### Langkah 3: Implementasi di Infrastructure/Repositories/

```csharp
// Infrastructure/Repositories/ReportRepository.cs
public class ReportRepository : IReportRepository
{
    private readonly AppDbContext _context;

    public ReportRepository(AppDbContext context) => _context = context;

    public async Task<IEnumerable<SalesSummaryDto>> GetSalesSummaryAsync()
    {
        // JOIN Orders → OrderItems → Products → Categories
        // GROUP BY Category, SUM revenue
        return await _context.OrderItems
            .Include(oi => oi.Product)
                .ThenInclude(p => p.Category)
            .GroupBy(oi => oi.Product.Category.Name)
            .Select(g => new SalesSummaryDto
            {
                CategoryName = g.Key,
                TotalTransactions = g.Count(),
                TotalItemsSold = g.Sum(oi => oi.Quantity),
                TotalRevenue = g.Sum(oi => oi.Quantity * oi.UnitPrice)
            })
            .OrderByDescending(x => x.TotalRevenue)
            .ToListAsync();
    }

    public async Task<IEnumerable<TopProductDto>> GetTopProductsAsync(int top = 5)
    {
        return await _context.OrderItems
            .Include(oi => oi.Product)
            .GroupBy(oi => new { oi.ProductId, oi.Product.Name })
            .Select(g => new TopProductDto
            {
                ProductId = g.Key.ProductId,
                ProductName = g.Key.Name,
                TotalSold = g.Sum(oi => oi.Quantity),
                Revenue = g.Sum(oi => oi.Quantity * oi.UnitPrice)
            })
            .OrderByDescending(x => x.TotalSold)
            .Take(top)
            .ToListAsync();
    }
}
```

#### Langkah 4: Service di Application/Services/

```csharp
// Application/Services/ReportService.cs
public class ReportService : IReportService
{
    private readonly IReportRepository _reportRepository;

    public ReportService(IReportRepository reportRepository)
        => _reportRepository = reportRepository;

    public Task<IEnumerable<SalesSummaryDto>> GetSalesSummaryAsync()
        => _reportRepository.GetSalesSummaryAsync();

    public Task<IEnumerable<TopProductDto>> GetTopProductsAsync(int top = 5)
        => _reportRepository.GetTopProductsAsync(top);
}
```

#### Langkah 5: Daftar di Program.cs

```csharp
builder.Services.AddScoped<IReportRepository, ReportRepository>();
builder.Services.AddScoped<IReportService, ReportService>();
```

### Practice Part A (10 menit)

Siswa membuat sendiri:
- [ ] Minimal 1 DTO summary yang relevan dengan domain bisnis yang dipilih
- [ ] Interface + implementasi ReportRepository dengan 1 query GROUP BY
- [ ] Service wrapper
- [ ] Register di DI
- [ ] Verifikasi build berhasil

---

## Part B — Export PDF & Excel
> **Disisipkan di Sesi 3** — setelah Controllers standar, sebelum sesi Review

**Estimasi waktu**: 35–45 menit (10 setup + 15 PDF + 10 Excel + 10 practice)

### Install Library (10 menit)

```bash
# Di Infrastructure project
dotnet add src/BusinessApp.Infrastructure package QuestPDF --version 2024.12.0
dotnet add src/BusinessApp.Infrastructure package ClosedXML --version 0.102.3

# Di API project (untuk FileResult — sudah ada di ASP.NET, tidak perlu install)
```

> **QuestPDF License**: Gratis untuk Community (revenue < $1M/tahun). Di kompetisi tidak masalah.
> Tambahkan di `Program.cs`:
> ```csharp
> QuestPDF.Settings.License = LicenseType.Community;
> ```

### Konsep Return File dari Controller

```csharp
// Return PDF
return File(pdfBytes, "application/pdf", "report.pdf");

// Return Excel
return File(excelBytes, 
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", 
    "report.xlsx");
```

**Tidak perlu controller baru** — cukup tambahkan method baru di `ReportsController`.

### Demo — PDF Export dengan QuestPDF (15 menit)

#### Langkah 1: Buat IReportExportService di Application

```csharp
// Application/Interfaces/IReportExportService.cs
public interface IReportExportService
{
    Task<byte[]> ExportSalesSummaryToPdfAsync();
    Task<byte[]> ExportSalesSummaryToExcelAsync();
}
```

#### Langkah 2: Implementasi di Infrastructure/Services/

```csharp
// Infrastructure/Services/ReportExportService.cs
public class ReportExportService : IReportExportService
{
    private readonly IReportRepository _reportRepository;

    public ReportExportService(IReportRepository reportRepository)
        => _reportRepository = reportRepository;

    // ─── PDF ────────────────────────────────────────────────────────────
    public async Task<byte[]> ExportSalesSummaryToPdfAsync()
    {
        var data = (await _reportRepository.GetSalesSummaryAsync()).ToList();

        var document = Document.Create(container =>
        {
            container.Page(page =>
            {
                page.Size(PageSizes.A4);
                page.Margin(2, Unit.Centimetre);
                page.DefaultTextStyle(x => x.FontSize(10));

                // Header
                page.Header().Text("Sales Summary Report")
                    .SemiBold().FontSize(18).FontColor(Colors.Blue.Medium);

                // Content — Tabel
                page.Content().PaddingVertical(10).Table(table =>
                {
                    // Definisi kolom
                    table.ColumnsDefinition(columns =>
                    {
                        columns.RelativeColumn(3); // Category
                        columns.RelativeColumn(2); // Transactions
                        columns.RelativeColumn(2); // Items Sold
                        columns.RelativeColumn(3); // Revenue
                    });

                    // Header baris tabel
                    static IContainer HeaderCell(IContainer c) => c
                        .DefaultTextStyle(x => x.SemiBold().FontColor(Colors.White))
                        .Background(Colors.Blue.Medium)
                        .PaddingVertical(5).PaddingHorizontal(8);

                    table.Header(header =>
                    {
                        header.Cell().Element(HeaderCell).Text("Category");
                        header.Cell().Element(HeaderCell).Text("Transactions");
                        header.Cell().Element(HeaderCell).Text("Items Sold");
                        header.Cell().Element(HeaderCell).Text("Revenue");
                    });

                    // Baris data
                    bool isAlternate = false;
                    foreach (var row in data)
                    {
                        var bg = isAlternate ? Colors.Grey.Lighten3 : Colors.White;
                        isAlternate = !isAlternate;

                        static IContainer DataCell(IContainer c, string bg) => c
                            .Background(bg).PaddingVertical(4).PaddingHorizontal(8);

                        table.Cell().Element(c => DataCell(c, bg)).Text(row.CategoryName);
                        table.Cell().Element(c => DataCell(c, bg)).Text(row.TotalTransactions.ToString());
                        table.Cell().Element(c => DataCell(c, bg)).Text(row.TotalItemsSold.ToString());
                        table.Cell().Element(c => DataCell(c, bg))
                            .Text(row.TotalRevenue.ToString("C0"));
                    }
                });

                // Footer
                page.Footer().AlignCenter()
                    .Text(x =>
                    {
                        x.Span("Generated: ");
                        x.Span(DateTime.Now.ToString("yyyy-MM-dd HH:mm"));
                        x.Span("   Page ");
                        x.CurrentPageNumber();
                        x.Span(" of ");
                        x.TotalPages();
                    });
            });
        });

        return document.GeneratePdf();
    }

    // ─── EXCEL ──────────────────────────────────────────────────────────
    public async Task<byte[]> ExportSalesSummaryToExcelAsync()
    {
        var data = (await _reportRepository.GetSalesSummaryAsync()).ToList();

        using var workbook = new XLWorkbook();
        var sheet = workbook.Worksheets.Add("Sales Summary");

        // Header styling
        var headerRow = sheet.Row(1);
        headerRow.Style.Font.Bold = true;
        headerRow.Style.Fill.BackgroundColor = XLColor.FromHtml("#2563EB");
        headerRow.Style.Font.FontColor = XLColor.White;

        // Header cells
        sheet.Cell(1, 1).Value = "Category";
        sheet.Cell(1, 2).Value = "Transactions";
        sheet.Cell(1, 3).Value = "Items Sold";
        sheet.Cell(1, 4).Value = "Revenue";

        // Data rows
        for (int i = 0; i < data.Count; i++)
        {
            int row = i + 2;
            var item = data[i];

            sheet.Cell(row, 1).Value = item.CategoryName;
            sheet.Cell(row, 2).Value = item.TotalTransactions;
            sheet.Cell(row, 3).Value = item.TotalItemsSold;
            sheet.Cell(row, 4).Value = item.TotalRevenue;

            // Format currency di kolom Revenue
            sheet.Cell(row, 4).Style.NumberFormat.Format = "#,##0";

            // Alternating row color
            if (i % 2 == 0)
                sheet.Row(row).Style.Fill.BackgroundColor = XLColor.FromHtml("#F1F5F9");
        }

        // Auto-fit kolom
        sheet.Columns().AdjustToContents();

        // Tambahkan metadata
        sheet.Cell(data.Count + 3, 1).Value = $"Generated: {DateTime.Now:yyyy-MM-dd HH:mm}";
        sheet.Cell(data.Count + 3, 1).Style.Font.Italic = true;

        using var stream = new MemoryStream();
        workbook.SaveAs(stream);
        return stream.ToArray();
    }
}
```

#### Langkah 3: Tambahkan Endpoint di ReportsController

```csharp
// API/Controllers/ReportsController.cs
[ApiController]
[Route("api/[controller]")]
public class ReportsController : ControllerBase
{
    private readonly IReportService _reportService;
    private readonly IReportExportService _exportService;

    public ReportsController(IReportService reportService, IReportExportService exportService)
    {
        _reportService = reportService;
        _exportService = exportService;
    }

    /// <summary>Get sales summary as JSON</summary>
    [HttpGet("sales-summary")]
    public async Task<ActionResult<ApiResponse<IEnumerable<SalesSummaryDto>>>> GetSalesSummary()
    {
        var data = await _reportService.GetSalesSummaryAsync();
        return Ok(ApiResponse<IEnumerable<SalesSummaryDto>>.SuccessResult(data));
    }

    /// <summary>Get top N products as JSON</summary>
    [HttpGet("top-products")]
    public async Task<ActionResult<ApiResponse<IEnumerable<TopProductDto>>>> GetTopProducts(
        [FromQuery] int top = 5)
    {
        var data = await _reportService.GetTopProductsAsync(top);
        return Ok(ApiResponse<IEnumerable<TopProductDto>>.SuccessResult(data));
    }

    /// <summary>Download sales summary as PDF</summary>
    [HttpGet("sales-summary/pdf")]
    public async Task<IActionResult> DownloadSalesSummaryPdf()
    {
        var bytes = await _exportService.ExportSalesSummaryToPdfAsync();
        return File(bytes, "application/pdf", $"sales-summary-{DateTime.Now:yyyyMMdd}.pdf");
    }

    /// <summary>Download sales summary as Excel</summary>
    [HttpGet("sales-summary/excel")]
    public async Task<IActionResult> DownloadSalesSummaryExcel()
    {
        var bytes = await _exportService.ExportSalesSummaryToExcelAsync();
        return File(bytes,
            "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
            $"sales-summary-{DateTime.Now:yyyyMMdd}.xlsx");
    }
}
```

#### Langkah 4: Register di Program.cs

```csharp
builder.Services.AddScoped<IReportExportService, ReportExportService>();

// Juga tambahkan di awal (setelah builder dibuat):
QuestPDF.Settings.License = LicenseType.Community;
```

### Demo — Excel vs PDF: Apa Bedanya?

Tekankan ke siswa dengan tabel ini:

| Aspek | PDF (QuestPDF) | Excel (ClosedXML) |
|-------|---------------|-------------------|
| **Cara kerja** | Describe layout (seperti HTML/CSS) | Isi cell per cell |
| **Hasil** | Fixed, tidak bisa diedit user | Bisa diedit di Excel |
| **Cocok untuk** | Laporan formal, invoice, cetak | Analisis lebih lanjut, filter |
| **Kompleksitas** | Sedikit lebih verbose | Lebih straightforward |
| **Proses core** | `document.GeneratePdf()` → `byte[]` | `workbook.SaveAs(stream)` → `byte[]` |
| **Return di controller** | Sama — `File(bytes, mimeType, fileName)` | Sama — `File(bytes, mimeType, fileName)` |

### Practice Part B (10 menit)

Siswa membuat sendiri:
- [ ] Install QuestPDF dan ClosedXML di project
- [ ] Tambahkan 1 endpoint PDF export ke `ReportsController`
- [ ] Tambahkan 1 endpoint Excel export ke `ReportsController`
- [ ] Test di Swagger — klik endpoint → klik "Download file"
- [ ] Buka file hasil download — verifikasi data muncul

---

## Cara Test di Swagger

1. Buka `http://localhost:5xxx/swagger`
2. Buka endpoint `GET /api/reports/sales-summary/pdf`
3. Klik **Try it out** → **Execute**
4. Scroll ke bawah response → klik **Download file**
5. Buka file PDF/Excel yang terdownload

---

## Cara Consume dari WinForm (Referensi untuk Sesi 4)

```csharp
// Download dan buka PDF langsung dari WinForm
private async void btnDownloadPdf_Click(object sender, EventArgs e)
{
    var bytes = await _httpClient.GetByteArrayAsync("api/reports/sales-summary/pdf");

    // Simpan ke temp file lalu buka
    var tempPath = Path.Combine(Path.GetTempPath(), $"report-{DateTime.Now:yyyyMMdd}.pdf");
    await File.WriteAllBytesAsync(tempPath, bytes);
    System.Diagnostics.Process.Start(new System.Diagnostics.ProcessStartInfo
    {
        FileName = tempPath,
        UseShellExecute = true   // buka dengan PDF viewer default
    });
}

// Download dan simpan Excel dengan SaveFileDialog
private async void btnDownloadExcel_Click(object sender, EventArgs e)
{
    using var dialog = new SaveFileDialog
    {
        Filter = "Excel Files (*.xlsx)|*.xlsx",
        FileName = $"report-{DateTime.Now:yyyyMMdd}.xlsx"
    };

    if (dialog.ShowDialog() == DialogResult.OK)
    {
        var bytes = await _httpClient.GetByteArrayAsync("api/reports/sales-summary/excel");
        await File.WriteAllBytesAsync(dialog.FileName, bytes);
        MessageBox.Show("File berhasil disimpan!", "Sukses");
    }
}
```

---

## Notes untuk Mentor

### Tips Mengajar Modul Ini
- **Mulai dari JSON dulu** (Part A) — siswa harus paham data query aggregate sebelum bicara export
- Tekankan analogi: "QuestPDF itu seperti kamu design slide PowerPoint pakai kode"
- Demo live di Swagger sangat efektif — siswa langsung bisa download dan lihat hasilnya
- Jika waktu mepet di sesi: ajarkan **salah satu saja** (PDF atau Excel), karena strukturnya memang hampir identik

### Common Pitfalls
- **QuestPDF**: Lupa set `QuestPDF.Settings.License = LicenseType.Community` → exception saat runtime
- **ClosedXML**: Lupa `using var stream = new MemoryStream()` → stream ter-dispose sebelum di-read
- **Controller**: Return `Ok(bytes)` bukan `File(bytes, mimeType, filename)` → browser tidak download, malah tampil raw bytes
- **LINQ GroupBy**: Query tidak materialize (`ToListAsync()`) → lazy evaluation menyebabkan error

### Urutan Optimal Mengajar
1. Tunjukkan endpoint JSON summary → test di Swagger (5 menit)
2. Tunjukkan endpoint PDF → download di Swagger → buka file (10 menit)
3. Tunjukkan endpoint Excel → bandingkan code PDF vs Excel (10 menit)
4. Siswa practice (10 menit)
5. Tunjukkan cara consume dari WinForm (5 menit, jika waktu ada)

### Poin Kunci yang Harus Siswa Hafal
> **"Data query sekali, output berbeda-beda — JSON, PDF, Excel — hanya beda packaging-nya."**

---

**Modul**: Report API (terpisah)
**Disisipkan ke**: Sesi 2 (Part A) + Sesi 3 (Part B)
**Estimasi Total**: 60–75 menit
