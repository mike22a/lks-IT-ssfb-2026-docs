# Sesi 4 - Link API ke WinForm (HttpClient) + Link API ke Android (Retrofit)

## Informasi Sesi
- **Durasi**: 2 jam (120 menit)
- **Fokus**: Consume API yang sudah dibuat dari 2 sisi: Windows Forms (HttpClient) dan Android Kotlin (Retrofit)
- **Prerequisite**: Selesai Sesi 3 — API sudah running sempurna, semua endpoint tested, base URL diketahui

## Tujuan Pembelajaran
- [ ] Siswa dapat setup HttpClient di WinForm dan consume API (GET, POST, PUT, DELETE)
- [ ] Siswa dapat binding data dari API ke DataGridView
- [ ] Siswa dapat mengimplementasikan CRUD di WinForm melalui API (bukan langsung ke DB)
- [ ] Siswa dapat setup Retrofit di Android Kotlin dan consume API
- [ ] Siswa dapat menampilkan list data dari API di RecyclerView/LazyColumn
- [ ] Siswa dapat melakukan POST ke API dari Android (form input sederhana)

## Materi (120 menit)

### Review Homework (15 menit)
- Cek semua Controller sudah lengkap dan return `ApiResponse<T>`
- Cek business logic — test 1-2 skenario di Swagger
- Cek custom exceptions sudah terdaftar di middleware
- Verifikasi API bisa diakses di `http://localhost:5xxx/swagger`
- Q&A dan catat base URL API untuk dipakai sesi ini

---

### BLOK A — WinForm → API Integration (45 menit)

#### Setup HttpClient Service di WinForm (10 menit)
- Buat folder `Services/` di WinForm project
- Buat `ApiClient.cs` sebagai wrapper HttpClient:
```csharp
// ApiClient.cs
public class ApiClient
{
    private readonly HttpClient _httpClient;
    private const string BaseUrl = "http://localhost:5000"; // sesuaikan port

    public ApiClient()
    {
        _httpClient = new HttpClient { BaseAddress = new Uri(BaseUrl) };
        _httpClient.DefaultRequestHeaders.Accept.Add(
            new MediaTypeWithQualityHeaderValue("application/json"));
    }

    public async Task<ApiResponse<T>?> GetAsync<T>(string endpoint)
    {
        var response = await _httpClient.GetAsync(endpoint);
        var json = await response.Content.ReadAsStringAsync();
        return JsonSerializer.Deserialize<ApiResponse<T>>(json, JsonOptions);
    }

    public async Task<ApiResponse<T>?> PostAsync<T>(string endpoint, object body)
    {
        var content = new StringContent(JsonSerializer.Serialize(body), Encoding.UTF8, "application/json");
        var response = await _httpClient.PostAsync(endpoint, content);
        var json = await response.Content.ReadAsStringAsync();
        return JsonSerializer.Deserialize<ApiResponse<T>>(json, JsonOptions);
    }

    public async Task<ApiResponse<T>?> PutAsync<T>(string endpoint, object body)
    {
        var content = new StringContent(JsonSerializer.Serialize(body), Encoding.UTF8, "application/json");
        var response = await _httpClient.PutAsync(endpoint, content);
        var json = await response.Content.ReadAsStringAsync();
        return JsonSerializer.Deserialize<ApiResponse<T>>(json, JsonOptions);
    }

    public async Task<ApiResponse<T>?> DeleteAsync<T>(string endpoint)
    {
        var response = await _httpClient.DeleteAsync(endpoint);
        var json = await response.Content.ReadAsStringAsync();
        return JsonSerializer.Deserialize<ApiResponse<T>>(json, JsonOptions);
    }

    private static readonly JsonSerializerOptions JsonOptions = new()
    {
        PropertyNameCaseInsensitive = true
    };
}
```

#### Load Data ke DataGridView (15 menit)
- Buat Form utama dengan DataGridView
- Load data dari API saat form dibuka:
```csharp
private readonly ApiClient _apiClient = new();

private async void FrmCustomers_Load(object sender, EventArgs e)
{
    await LoadCustomersAsync();
}

private async Task LoadCustomersAsync()
{
    try
    {
        var result = await _apiClient.GetAsync<IEnumerable<CustomerDto>>("api/customers");
        if (result?.Success == true)
        {
            dataGridViewCustomers.DataSource = result.Data?.ToList();
        }
    }
    catch (Exception ex)
    {
        MessageBox.Show($"Gagal memuat data: {ex.Message}", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
    }
}
```
- **Penting**: Gunakan `async/await` — jangan pernah panggil `.Result` atau `.Wait()` (akan menyebabkan UI freeze)

#### CRUD via API di WinForm (20 menit)
- **Tambah (POST)**: Buka form input → collect data → `PostAsync` → refresh DataGridView
- **Edit (PUT)**: Pilih baris di DataGridView → isi form → `PutAsync` → refresh
- **Hapus (DELETE)**: Pilih baris → konfirmasi MessageBox → `DeleteAsync` → refresh

```csharp
// Contoh tombol Tambah
private async void btnAdd_Click(object sender, EventArgs e)
{
    var request = new { Name = txtName.Text, Email = txtEmail.Text, Phone = txtPhone.Text };
    var result = await _apiClient.PostAsync<CustomerDto>("api/customers", request);
    if (result?.Success == true)
    {
        MessageBox.Show("Customer berhasil ditambahkan!", "Sukses");
        await LoadCustomersAsync();
        ClearForm();
    }
    else
    {
        MessageBox.Show(result?.Message ?? "Terjadi kesalahan", "Error");
    }
}
```

---

### BLOK B — Android Kotlin → API Integration (45 menit)

#### Setup Retrofit di Android (15 menit)
- Tambahkan dependencies di `build.gradle`:
```kotlin
implementation("com.squareup.retrofit2:retrofit:2.11.0")
implementation("com.squareup.retrofit2:converter-gson:2.11.0")
implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.8.0")
```
- Tambahkan permission di `AndroidManifest.xml`:
```xml
<uses-permission android:name="android.permission.INTERNET" />
```
- Buat data class yang mirror DTO dari API:
```kotlin
// CustomerDto.kt
data class CustomerDto(
    val id: Int,
    val name: String,
    val email: String,
    val phone: String
)

// ApiResponse.kt — mirror dari API
data class ApiResponse<T>(
    val success: Boolean,
    val message: String,
    val data: T?,
    val errors: List<String>
)

// CreateCustomerRequest.kt
data class CreateCustomerRequest(
    val name: String,
    val email: String,
    val phone: String
)
```
- Buat Retrofit interface:
```kotlin
// CustomerApiService.kt
interface CustomerApiService {
    @GET("api/customers")
    suspend fun getAll(): ApiResponse<List<CustomerDto>>

    @GET("api/customers/{id}")
    suspend fun getById(@Path("id") id: Int): ApiResponse<CustomerDto>

    @POST("api/customers")
    suspend fun create(@Body request: CreateCustomerRequest): ApiResponse<CustomerDto>

    @PUT("api/customers/{id}")
    suspend fun update(@Path("id") id: Int, @Body request: CreateCustomerRequest): ApiResponse<CustomerDto>

    @DELETE("api/customers/{id}")
    suspend fun delete(@Path("id") id: Int): ApiResponse<Any>
}
```
- Setup Retrofit instance:
```kotlin
// RetrofitClient.kt
object RetrofitClient {
    private const val BASE_URL = "http://10.0.2.2:5000/" // 10.0.2.2 = localhost dari emulator

    val customerService: CustomerApiService by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
            .create(CustomerApiService::class.java)
    }
}
```

#### Tampilkan List + POST dari Android (30 menit)
- Buat ViewModel dengan coroutine:
```kotlin
// CustomerViewModel.kt
class CustomerViewModel : ViewModel() {
    private val _customers = MutableStateFlow<List<CustomerDto>>(emptyList())
    val customers: StateFlow<List<CustomerDto>> = _customers.asStateFlow()

    private val _message = MutableStateFlow("")
    val message: StateFlow<String> = _message.asStateFlow()

    fun loadCustomers() {
        viewModelScope.launch {
            try {
                val result = RetrofitClient.customerService.getAll()
                if (result.success) _customers.value = result.data ?: emptyList()
                else _message.value = result.message
            } catch (e: Exception) {
                _message.value = "Gagal memuat data: ${e.message}"
            }
        }
    }

    fun addCustomer(name: String, email: String, phone: String) {
        viewModelScope.launch {
            try {
                val request = CreateCustomerRequest(name, email, phone)
                val result = RetrofitClient.customerService.create(request)
                if (result.success) { loadCustomers(); _message.value = "Berhasil ditambahkan" }
                else _message.value = result.message
            } catch (e: Exception) {
                _message.value = "Error: ${e.message}"
            }
        }
    }
}
```
- Buat Compose UI sederhana: `LazyColumn` untuk list + Form untuk input
- Collect state dari ViewModel dan tampilkan

---

### Sesi Pilihan & Review (15 menit)

#### Pilihan Mandiri (10 menit)
Siswa memilih area mana yang perlu diperdalam:
- **Opsi A**: Polish WinForm — tambahkan form pencarian/filter di DataGridView
- **Opsi B**: Polish Android — tambahkan swipe-to-delete atau pull-to-refresh

#### Review End-to-End (5 menit)
- Live test: tambah data dari WinForm → lihat muncul di Android
- Pastikan semua sumber data berasal dari **satu API** yang sama
- Q&A dan preview sesi 5

## Homework

### Tugas 1: Lengkapi CRUD WinForm via API
- Implementasikan semua operasi (Add, Edit, Delete) untuk minimal **2 entity** via API
- Implementasikan pencarian/filter sederhana di DataGridView
- Tampilkan pesan error yang user-friendly jika API tidak bisa diakses
- **Deadline**: Sesi 5

### Tugas 2: Lengkapi Android — GET + POST
- Tampilkan list data untuk minimal **2 entity** menggunakan `LazyColumn`
- Implementasikan form input untuk POST minimal 1 entity
- Handle loading state dan error state dengan baik
- **Deadline**: Sesi 5

### Tugas 3: Self-Test End-to-End
- Jalankan API → jalankan WinForm → jalankan Android emulator
- Tambah data dari WinForm → refresh Android → pastikan data tampil
- Catat kendala yang dihadapi untuk didiskusikan di sesi 5
- **Deadline**: Sesi 5

## Resources

### WinForm — Documentation
- [HttpClient Class](https://learn.microsoft.com/en-us/dotnet/api/system.net.http.httpclient)
- [System.Text.Json](https://learn.microsoft.com/en-us/dotnet/standard/serialization/system-text-json/how-to)
- [Async Programming in Windows Forms](https://learn.microsoft.com/en-us/dotnet/desktop/winforms/controls/how-to-make-thread-safe-calls)

### Android — Documentation
- [Retrofit Documentation](https://square.github.io/retrofit/)
- [Kotlin Coroutines Guide](https://kotlinlang.org/docs/coroutines-guide.html)
- [Jetpack Compose State](https://developer.android.com/jetpack/compose/state)

### Catatan Penting
- `10.0.2.2` adalah alamat localhost saat diakses dari Android Emulator
- Jika menggunakan device fisik, gunakan IP address komputer di jaringan yang sama

### Referensi Project Contoh & Cheat Sheet
- 🔧 **[mentor_cheatsheet.md](../agent_plan/mentor_cheatsheet.md)** — Bagian 10 (Retrofit setup) & Bagian 11 (HttpClient WinForm)
- 📖 **[01-BookstoreApi-GUIDE.md](../dotnet-api-example/01-BookstoreApi-GUIDE.md)** — Referensi struktur API yang digunakan

## Notes untuk Mentor

### Tips
- **Pastikan API sudah running** sebelum sesi dimulai — ini blocker untuk WinForm dan Android
- Bagi sesi secara paralel: 45 menit WinForm, 45 menit Android — jangan kelamaan di satu sisi
- Gunakan live demo: "Saya tambah dari WinForm, refresh Android → data muncul" — ini momen 'wow' yang penting
- Jika siswa sudah sangat mahir Kotlin, fokus WinForm lebih dalam; jika WinForm sudah oke, lebih dalam Kotlin

### Common Pitfalls
- **WinForm**: UI freeze karena tidak menggunakan `async/await` — harus selalu `await` pada setiap API call
- **WinForm**: HttpClient di-instantiate per request (harusnya singleton/shared)
- **Android**: Menggunakan `localhost` bukan `10.0.2.2` untuk emulator → connection refused
- **Android**: Tidak menambahkan INTERNET permission di manifest → silent failure
- **Android**: Network call di main thread → NetworkOnMainThreadException

### Troubleshooting
- WinForm tidak bisa connect: cek apakah API masih running, cek port number
- Android tidak bisa connect: pastikan pakai `10.0.2.2`, cek `usesCleartextTraffic` di manifest jika HTTP
- DataGridView tidak update: pastikan `.DataSource` di-set ulang, bukan append
- JSON deserialization error: pastikan nama property DTO Android match dengan API response

### Preparation untuk Sesi Berikutnya
- Review homework siswa — identifikasi bug dan kendala yang belum terpecahkan
- Siapkan skenario simulasi kompetisi (mini business case sederhana)
- Persiapkan checklist penilaian yang mirip dengan rubrik LKS

---

**Sesi**: 4 dari 5
**Durasi**: 2 jam
**Fokus**: Link API ke WinForm (HttpClient) + Link API ke Android Kotlin (Retrofit)
