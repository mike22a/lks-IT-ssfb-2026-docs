# Android Design

## Digital Library Training Kit

---

## Purpose

Menjelaskan desain aplikasi Android untuk sistem Digital Library.

---

## Scope

Dokumen ini mencakup:

- Arsitektur Android
- Navigation antar Activity
- Activity dan Fragment
- RecyclerView usage
- API Consumption dengan Retrofit
- MVVM overview

---

## Learning Objectives

Setelah membaca dokumen ini, siswa dapat:

- Memahami arsitektur Android modern
- Menggunakan RecyclerView untuk display list
- Consume REST API dengan Retrofit
- Implement navigation antar Activity
- Memahami konsep MVVM di Android
- Handle error di Android

---

## Prerequisites

- Sudah membaca [05-api-design.md](./05-api-design.md)
- Basic understanding of Android development
- Basic Kotlin knowledge

---

## Business Rules

- API call harus di background thread
- UI harus di main thread
- Error harus ditampilkan dengan user-friendly
- Loading indicator harus ditampilkan saat API call

---

## Design / Main Content

### Arsitektur Android

**Arsitektur yang digunakan:**
- MVVM (Model-View-ViewModel)
- Repository Pattern
- Retrofit untuk API calls
- LiveData/StateFlow untuk reactive UI
- Coroutines untuk async operations

**Layer:**
```
UI Layer (Activity/Fragment)
    ↓
ViewModel Layer
    ↓
Repository Layer
    ↓
API Layer (Retrofit)
```

### Navigation

**Navigation Pattern:**
- MainActivity sebagai entry point
- Intent untuk navigasi antar Activity
- Bundle untuk passing data

**Example:**
```kotlin
// Navigate to BookDetailActivity
val intent = Intent(this, BookDetailActivity::class.java)
intent.putExtra("bookId", book.id)
startActivity(intent)
```

**Navigation Graph (jika menggunakan Navigation Component):**
```xml
<navigation>
    <fragment
        android:id="@+id/bookListFragment"
        android:name="BookListFragment">
        <action
            android:id="@+id/action_to_bookDetail"
            app:destination="@id/bookDetailFragment" />
    </fragment>
</navigation>
```

### Activity

#### 1. MainActivity

**Tujuan:** Entry point dan navigation hub

**Layout:**
```xml
<LinearLayout>
    <Button
        android:id="@+id/btnBooks"
        android:text="Books" />
    
    <Button
        android:id="@+id/btnBorrowings"
        android:text="My Borrowings" />
</LinearLayout>
```

**Kotlin:**
```kotlin
class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        
        findViewById<Button>(R.id.btnBooks).setOnClickListener {
            startActivity(Intent(this, BookListActivity::class.java))
        }
        
        findViewById<Button>(R.id.btnBorrowings).setOnClickListener {
            startActivity(Intent(this, BorrowingHistoryActivity::class.java))
        }
    }
}
```

#### 2. BookListActivity

**Tujuan:** Display list buku

**Layout:**
```xml
<LinearLayout>
    <androidx.recyclerview.widget.RecyclerView
        android:id="@+id/recyclerViewBooks"
        android:layout_width="match_parent"
        android:layout_height="match_parent" />
    
    <ProgressBar
        android:id="@+id/progressBar"
        android:visibility="gone" />
</LinearLayout>
```

**Kotlin:**
```kotlin
class BookListActivity : AppCompatActivity() {
    private lateinit var recyclerView: RecyclerView
    private lateinit var adapter: BookAdapter
    private lateinit var viewModel: BookViewModel
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_book_list)
        
        recyclerView = findViewById(R.id.recyclerViewBooks)
        adapter = BookAdapter { book ->
            val intent = Intent(this, BookDetailActivity::class.java)
            intent.putExtra("bookId", book.id)
            startActivity(intent)
        }
        recyclerView.adapter = adapter
        recyclerView.layoutManager = LinearLayoutManager(this)
        
        viewModel = ViewModelProvider(this).get(BookViewModel::class.java)
        viewModel.books.observe(this) { books ->
            adapter.submitList(books)
        }
        
        viewModel.loadBooks()
    }
}
```

#### 3. BookDetailActivity

**Tujuan:** Display detail buku

**Layout:**
```xml
<ScrollView>
    <LinearLayout>
        <TextView android:id="@+id/tvTitle" />
        <TextView android:id="@+id/tvAuthor" />
        <TextView android:id="@+id/tvCategory" />
        <TextView android:id="@+id/tvStock" />
        <Button android:id="@+id/btnBorrow" />
    </LinearLayout>
</ScrollView>
```

**Kotlin:**
```kotlin
class BookDetailActivity : AppCompatActivity() {
    private lateinit var viewModel: BookDetailViewModel
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_book_detail)
        
        val bookId = intent.getIntExtra("bookId", -1)
        viewModel = ViewModelProvider(this).get(BookDetailViewModel::class.java)
        
        viewModel.book.observe(this) { book ->
            findViewById<TextView>(R.id.tvTitle).text = book.title
            findViewById<TextView>(R.id.tvAuthor).text = book.author
            findViewById<TextView>(R.id.tvCategory).text = book.categoryName
            findViewById<TextView>(R.id.tvStock).text = "Stock: ${book.stock}"
        }
        
        viewModel.loadBook(bookId)
    }
}
```

#### 4. BorrowingHistoryActivity

**Tujuan:** Display histori peminjaman

**Layout:**
```xml
<LinearLayout>
    <androidx.recyclerview.widget.RecyclerView
        android:id="@+id/recyclerViewBorrowings" />
</LinearLayout>
```

**Kotlin:**
```kotlin
class BorrowingHistoryActivity : AppCompatActivity() {
    private lateinit var viewModel: BorrowingViewModel
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_borrowing_history)
        
        viewModel = ViewModelProvider(this).get(BorrowingViewModel::class.java)
        viewModel.borrowings.observe(this) { borrowings ->
            // Update RecyclerView
        }
        
        viewModel.loadBorrowings()
    }
}
```

### Fragment

**Fragment vs Activity:**
- Activity: Layar penuh, entry point
- Fragment: Bagian dari Activity, reusable

**Example Fragment:**
```kotlin
class BookListFragment : Fragment() {
    private lateinit var adapter: BookAdapter
    
    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_book_list, container, false)
    }
    
    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        
        val recyclerView = view.findViewById<RecyclerView>(R.id.recyclerView)
        adapter = BookAdapter { book ->
            // Handle click
        }
        recyclerView.adapter = adapter
    }
}
```

### RecyclerView

**Adapter:**
```kotlin
class BookAdapter(
    private val onItemClick: (Book) -> Unit
) : RecyclerView.Adapter<BookAdapter.BookViewHolder>() {
    
    private var books = listOf<Book>()
    
    fun submitList(newBooks: List<Book>) {
        books = newBooks
        notifyDataSetChanged()
    }
    
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): BookViewHolder {
        val view = LayoutInflater.from(parent.context)
            .inflate(R.layout.item_book, parent, false)
        return BookViewHolder(view)
    }
    
    override fun onBindViewHolder(holder: BookViewHolder, position: Int) {
        holder.bind(books[position])
    }
    
    override fun getItemCount(): Int = books.size
    
    inner class BookViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        fun bind(book: Book) {
            itemView.findViewById<TextView>(R.id.tvTitle).text = book.title
            itemView.findViewById<TextView>(R.id.tvAuthor).text = book.author
            itemView.setOnClickListener { onItemClick(book) }
        }
    }
}
```

**Item Layout:**
```xml
<androidx.cardview.widget.CardView>
    <LinearLayout>
        <TextView android:id="@+id/tvTitle" />
        <TextView android:id="@+id/tvAuthor" />
        <TextView android:id="@+id/tvStock" />
    </LinearLayout>
</androidx.cardview.widget.CardView>
```

### API Consumption

**Retrofit Setup:**
```kotlin
object ApiClient {
    private const val BASE_URL = "http://10.0.2.2:5000/api/" // Emulator localhost
    
    private val retrofit: Retrofit by lazy {
        Retrofit.Builder()
            .baseUrl(BASE_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .build()
    }
    
    val apiService: ApiService by lazy {
        retrofit.create(ApiService::class.java)
    }
}
```

**ApiService Interface:**
```kotlin
interface ApiService {
    @GET("books")
    suspend fun getBooks(): Response<List<BookDto>>
    
    @GET("books/{id}")
    suspend fun getBook(@Path("id") id: Int): Response<BookDto>
    
    @GET("borrowings/byuser/{userId}")
    suspend fun getBorrowingsByUser(@Path("userId") userId: Int): Response<List<BorrowingDto>>
}
```

**Data Models:**
```kotlin
data class BookDto(
    val id: Int,
    val title: String,
    val author: String,
    val categoryName: String,
    val stock: Int
)

data class BorrowingDto(
    val id: Int,
    val borrowDate: String,
    val dueDate: String,
    val returnDate: String?,
    val status: String,
    val details: List<BorrowingDetailDto>
)
```

**Repository:**
```kotlin
class BookRepository {
    private val apiService = ApiClient.apiService
    
    suspend fun getBooks(): Result<List<BookDto>> {
        return try {
            val response = apiService.getBooks()
            if (response.isSuccessful) {
                Result.success(response.body() ?: emp tyList())
            } else {
                Result.failure(Exception("Error: ${response.code()}"))
            }
        } catch (e: Exception) {
            Result.failure(e)
        }
    }
}
```

### MVVM Overview

**ViewModel:**
```kotlin
class BookViewModel : ViewModel() {
    private val repository = BookRepository()
    private val _books = MutableLiveData<List<BookDto>>()
    val books: LiveData<List<BookDto>> = _books
    
    private val _isLoading = MutableLiveData<Boolean>()
    val isLoading: LiveData<Boolean> = _isLoading
    
    private val _error = MutableLiveData<String>()
    val error: LiveData<String> = _error
    
    fun loadBooks() {
        viewModelScope.launch {
            _isLoading.value = true
            val result = repository.getBooks()
            result.onSuccess { _books.value = it }
                .onFailure { _error.value = it.message }
            _isLoading.value = false
        }
    }
}
```

**Activity observes ViewModel:**
```kotlin
viewModel.books.observe(this) { books ->
    adapter.submitList(books)
}

viewModel.isLoading.observe(this) { isLoading ->
    progressBar.visibility = if (isLoading) View.VISIBLE else View.GONE
}

viewModel.error.observe(this) { error ->
    if (error != null) {
        Toast.makeText(this, error, Toast.LENGTH_LONG).show()
    }
}
```

---

## Implementation Notes

- Gunakan `10.0.2.2` untuk localhost di emulator
- Gunakan coroutines untuk async operations
- Handle network error gracefully
- Gunakan ViewModel untuk survive configuration changes
- Gunakan LiveData/StateFlow untuk reactive UI

---

## Common Mistakes

- API call di main thread (network on main thread exception)
- Tidak handle network error
- Tidak menampilkan loading indicator
- Tidak menggunakan ViewModel (data lost on rotation)
- Hardcoded URL API

---

## Exercises

1. Design layout untuk item book
2. Implement error handling di Repository
3. Buat ViewModel untuk BorrowingHistoryActivity
4. Implement pagination di RecyclerView
5. Design search functionality di BookListActivity

---

## Homework

1. Implement MainActivity dengan navigation
2. Implement BookListActivity dengan RecyclerView
3. Implement BookDetailActivity
4. Implement BorrowingHistoryActivity
5. Test semua activity dengan API mock

---

## References

- [Android Architecture Guide](https://developer.android.com/topic/architecture)
- [Retrofit Documentation](https://square.github.io/retrofit/)
- [RecyclerView Guide](https://developer.android.com/guide/topics/ui/layout/recyclerview)

---

## Related Documents

- [05-api-design.md](./05-api-design.md) - API endpoint untuk consume
