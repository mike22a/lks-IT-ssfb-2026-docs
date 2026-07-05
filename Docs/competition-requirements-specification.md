# LKS IT Software Solution for Business - Competition Requirements Specification

## Overview

This document provides a detailed breakdown of the competition requirements (Kisi-kisi) for LKS DIKMEN National 2026 - IT Software Solution for Business. It expands on the general requirements with specific implementation details, assessment criteria, and technical specifications for each module.

---

## 1. General Requirements (All Modules)

### 1.1 Validation & Error Handling
- **Requirement**: Each module must include proper validation and clear error messages
- **Implementation**:
  - Validate all user inputs before processing
  - Provide specific, actionable error messages
  - Handle edge cases and boundary conditions
  - Implement graceful error recovery
  - Log errors appropriately for debugging

### 1.2 UI/UX Standards
- **Scrollbar Requirement**: Scrollbars must be displayed when a list or view cannot be fully contained within a single layer
  - **Implementation**: Enable scrolling for lists, grids, and long content
  - **Mobile**: Use ScrollView, LazyColumn, or RecyclerView
  - **Desktop**: Enable AutoScroll in DataGridView, Scrollable controls

- **Date Format**: Use the ISO-compliant date format YYYY-MM-DD for all date fields
  - **Implementation**: 
    - Display dates in YYYY-MM-DD format
    - Validate date inputs to ISO format
    - Store dates in ISO format in database
    - Handle timezone conversions if needed

- **Form Centering**: All forms or reports must be displayed centered on the screen
  - **Mobile**: Use Center alignment or appropriate padding
  - **Desktop**: Use FormStartPosition.CenterParent or manual centering

- **Modal Behavior**: When a form or dialog is in focus, other forms must be disabled to prevent parallel processing
  - **Implementation**: 
    - Use ShowDialog() for modal forms in .NET
    - Disable parent forms when child forms are active
    - Implement proper form ownership hierarchy

- **Naming Conventions**: Apply proper naming conventions for all submitted materials
  - **Code**: Follow language-specific conventions (PascalCase for classes, camelCase for methods/variables)
  - **Files**: Use descriptive names with appropriate extensions
  - **Database**: Use snake_case or PascalCase consistently
  - **API Endpoints**: Use kebab-case or camelCase for URLs

### 1.3 Wireframe Guidelines
- **Reference Only**: The provided wireframes are for reference only
- **Modifications Permitted**: Modifications are permitted if they do not affect the functionality or performance of existing features
- **Guidelines**:
  - Maintain core functionality from wireframes
  - Improve UX while preserving feature set
  - Ensure all required components are present
  - Do not remove features shown in wireframes

### 1.4 Time Management
- **Requirement**: Pay close attention to the allocated working time and manage the available time effectively
- **Strategy**:
  - Read requirements thoroughly before starting
  - Prioritize high-weight features first
  - Allocate buffer time for testing
  - Implement MVP (Minimum Viable Product) first, then enhance
  - Track time spent on each task

---

## 2. Module: Desktop Applications (.NET)

### 2.1 Module Overview
- **Duration**: 3 hours
- **Day**: Day 1
- **Weight**: 30%
- **Technology**: .NET 8, Windows Forms, SQL Server

### 2.2 Detailed Requirements

#### 2.2.1 Database Import & Integration
**Requirement**: Import databases and their contents from external sources (database or API)

**Implementation Options**:
1. **Direct Database Import**:
   - Use SQL Server Management Studio (SSMS) to import .bak files
   - Use SQL Server Import and Export Wizard
   - Use BULK INSERT for CSV/data files
   - Implement Entity Framework migrations

2. **API-Based Import**:
   - Consume REST API endpoints
   - Parse JSON/XML responses
   - Map API data to database schema
   - Handle pagination for large datasets

**Technical Considerations**:
- Validate imported data integrity
- Handle duplicate records
- Implement transaction rollback on failure
- Log import progress and errors

#### 2.2.2 Windows Forms Development
**Requirement**: Create Windows Forms and UI components based on the given requirements

**UI Components to Implement**:
- **Forms**: Main form, child forms, dialog forms
- **Controls**:
  - TextBox (for text input)
  - ComboBox (for dropdown selection)
  - DataGridView (for data display)
  - Button (for actions)
  - Label (for display)
  - DateTimePicker (for date selection)
  - CheckBox (for boolean values)
  - RadioButton (for exclusive options)
  - ListBox (for multiple selection)
  - MenuStrip (for navigation)
  - ToolStrip (for toolbar)

**Form Design Principles**:
- Consistent styling across all forms
- Proper control alignment and spacing
- Tab order for keyboard navigation
- Accessible control sizes
- Responsive layout (anchoring/docking)

#### 2.2.3 User Input Validation & Access Control
**Requirement**: Perform user input validation and enforce menu access restrictions based on user roles

**Input Validation**:
- **Required Fields**: Check for empty/null values
- **Data Type Validation**: Ensure correct data types (numeric, date, etc.)
- **Range Validation**: Check values within acceptable ranges
- **Format Validation**: Email, phone number, etc.
- **Business Rule Validation**: Custom validation based on requirements

**Implementation Example**:
```csharp
private void ValidateInput()
{
    if (string.IsNullOrEmpty(txtName.Text))
    {
        errorProvider1.SetError(txtName, "Name is required");
        return false;
    }
    
    if (!int.TryParse(txtAge.Text, out int age) || age < 0 || age > 120)
    {
        errorProvider1.SetError(txtAge, "Age must be between 0 and 120");
        return false;
    }
    
    return true;
}
```

**Role-Based Access Control**:
- Define user roles (Admin, User, Guest, etc.)
- Create role-permission mapping
- Hide/disable menu items based on role
- Implement authentication check before sensitive operations
- Use Windows Authentication or custom login system

#### 2.2.4 CRUD Operations
**Requirement**: Display and manage database records, including create, read, update, delete (CRUD), search, and filtering operations

**Create Operation**:
- Form for data entry
- Validation before insert
- Generate primary keys (auto-increment or GUID)
- Return success/failure status
- Refresh data display after insert

**Read Operation**:
- Load data into DataGridView
- Implement pagination for large datasets
- Support sorting by columns
- Display formatted data (dates, currency, etc.)

**Update Operation**:
- Edit existing records
- Load current data into edit form
- Validate changes before update
- Handle concurrent updates (optimistic locking)
- Audit trail for changes

**Delete Operation**:
- Confirm before delete (dialog)
- Soft delete (mark as deleted) or hard delete
- Handle foreign key constraints
- Cascade delete if required
- Refresh display after delete

**Search Implementation**:
- Search by multiple fields
- Partial match support
- Case-insensitive search
- Real-time search (as user types)
- Advanced search with multiple criteria

**Filtering Implementation**:
- Filter by date ranges
- Filter by categories/status
- Multiple filter combinations
- Clear filter option
- Persist filter state

#### 2.2.5 Advanced Query Operations
**Requirement**: Process data using relational queries, including JOIN and aggregate queries

**JOIN Queries**:
- **INNER JOIN**: Records with matching values in both tables
- **LEFT JOIN**: All records from left table, matching from right
- **RIGHT JOIN**: All records from right table, matching from left
- **FULL OUTER JOIN**: All records when there's a match in either table

**Implementation Example**:
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

**Aggregate Queries**:
- **COUNT**: Number of records
- **SUM**: Sum of numeric values
- **AVG**: Average of numeric values
- **MIN**: Minimum value
- **MAX**: Maximum value
- **GROUP BY**: Group records for aggregation

**Implementation Example**:
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

**Entity Framework Implementation**:
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

#### 2.2.6 Data Visualization
**Requirement**: Present data in visual formats, such as charts

**Chart Types to Implement**:
- **Bar Chart**: Compare values across categories
- **Line Chart**: Show trends over time
- **Pie Chart**: Show proportions/percentages
- **Column Chart**: Vertical bar chart
- **Area Chart**: Filled line chart

**Chart Components**:
- Chart title and axis labels
- Legend for multiple series
- Data labels for values
- Tooltips on hover
- Color coding for categories
- Grid lines for reference

**Implementation Using Chart Control**:
```csharp
// Create bar chart
chart1.Series.Clear();
chart1.Series.Add("Sales");

// Set chart type
chart1.Series["Sales"].ChartType = SeriesChartType.Column;

// Add data points
foreach (var item in salesData)
{
    chart1.Series["Sales"].Points.AddXY(item.Category, item.Amount);
}

// Configure axes
chart1.ChartAreas[0].AxisX.Title = "Category";
chart1.ChartAreas[0].AxisY.Title = "Sales Amount";
chart1.ChartAreas[0].AxisY.LabelStyle.Format = "C2";

// Enable legend
chart1.Legends.Add("Sales");
```

**Dynamic Chart Updates**:
- Refresh chart when data changes
- Handle null/zero values
- Scale axes automatically
- Support drill-down interactions

#### 2.2.7 DataGridView Manipulation
**Requirement**: Manipulate and manage data using DataGridView components

**DataGridView Features**:
- **Data Binding**: Bind to DataTable, List, or BindingSource
- **Column Types**: TextBox, ComboBox, CheckBox, Button, Image, Link
- **Sorting**: Click column header to sort
- **Selection**: Single or multiple row selection
- **Editing**: Inline cell editing
- **Formatting**: Cell formatting (dates, currency, etc.)
- **Styling**: Cell colors, fonts, alignment

**Implementation Example**:
```csharp
// Configure DataGridView
dataGridView1.AutoGenerateColumns = false;
dataGridView1.AllowUserToAddRows = false;
dataGridView1.ReadOnly = true;
dataGridView1.SelectionMode = DataGridViewSelectionMode.FullRowSelect;

// Add columns manually
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

**Advanced Features**:
- Context menu for row operations
- Cell validation events
- Row enter/leave events
- Custom cell painting
- Export to Excel/CSV

### 2.3 Assessment Criteria (30% - Measurement)

**Scoring Method**: Binary (1 if meets criteria, 0 if not)

| Aspect | Description | Max Mark |
|--------|-------------|----------|
| Database Connection | Proper connection to SQL Server (direct or API) | 0.20 |
| Data Import | Successful import of external database/API data | 0.15 |
| CRUD Operations | All CRUD operations functional (Create, Read, Update, Delete) | 0.25 |
| Search & Filter | Search and filtering features working correctly | 0.10 |
| JOIN Queries | Correct implementation of JOIN operations | 0.10 |
| Aggregate Queries | Correct implementation of aggregate functions | 0.05 |
| Data Visualization | Charts displaying data accurately | 0.10 |
| Input Validation | All input validations implemented | 0.05 |
| Access Control | Role-based menu restrictions working | 0.05 |
| Error Handling | Proper error messages and exception handling | 0.05 |

**Total**: 1.00 (converted to 30% of total score)

---

## 3. Module: Mobile Applications (Android)

### 3.1 Module Overview
- **Duration**: 3 hours each (Modules A & C)
- **Day**: Day 1 (Module A) and Day 2 (Module C)
- **Weight**: 25% each (50% total)
- **Technology**: Android Studio, Kotlin, Jetpack Compose

### 3.2 Detailed Requirements

#### 3.2.1 Database Design
**Requirement**: Analyze given requirements and translate them into an appropriate database design

**Database Design Process**:
1. **Requirements Analysis**:
   - Identify entities (objects/concepts)
   - Identify attributes (properties of entities)
   - Identify relationships (associations between entities)

2. **Schema Design**:
   - Create tables for each entity
   - Define primary keys (PK)
   - Define foreign keys (FK) for relationships
   - Set data types for each column
   - Add constraints (NOT NULL, UNIQUE, CHECK)

3. **Normalization**:
   - First Normal Form (1NF): Eliminate repeating groups
   - Second Normal Form (2NF): Remove partial dependencies
   - Third Normal Form (3NF): Remove transitive dependencies

**Example Schema**:
```sql
-- Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    Phone NVARCHAR(20),
    Address NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Products table
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

-- Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2),
    Status NVARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
```

**Considerations**:
- Choose appropriate data types
- Index frequently queried columns
- Plan for scalability
- Document the schema

#### 3.2.2 API Development
**Requirement**: Design and implement APIs according to the given endpoint contract

**API Design Principles**:
- **RESTful Design**: Use proper HTTP methods (GET, POST, PUT, DELETE)
- **Resource-Based URLs**: Use nouns, not verbs (e.g., /api/customers, not /api/getCustomers)
- **Consistent Naming**: Use kebab-case or camelCase for URLs
- **Versioning**: Include version in URL (e.g., /api/v1/customers)
- **Stateless**: Each request contains all necessary information

**Endpoint Contract Structure**:
```yaml
# Example Endpoint Contract
GET /api/v1/customers
Description: Retrieve all customers with optional filtering
Parameters:
  - page: integer (optional) - Page number for pagination
  - limit: integer (optional) - Number of records per page
  - search: string (optional) - Search term for customer name
Response:
  - 200 OK: Array of customer objects
  - 400 Bad Request: Invalid parameters
  - 500 Internal Server Error: Server error

POST /api/v1/customers
Description: Create a new customer
Request Body:
  {
    "customerName": "string (required)",
    "email": "string (required, unique)",
    "phone": "string (optional)",
    "address": "string (optional)"
  }
Response:
  - 201 Created: Created customer object with ID
  - 400 Bad Request: Invalid data
  - 409 Conflict: Email already exists
  - 500 Internal Server Error: Server error
```

**API Implementation (.NET Core Example)**:
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

#### 3.2.3 Business Logic Implementation
**Requirement**: Implement correct business logic for each API endpoint

**Business Logic Examples**:

**1. Order Processing Logic**:
```csharp
public async Task<Order> ProcessOrder(Order order)
{
    // Validate order
    if (order.OrderDetails == null || !order.OrderDetails.Any())
    {
        throw new ArgumentException("Order must have at least one item");
    }

    // Check stock availability
    foreach (var item in order.OrderDetails)
    {
        var product = await _context.Products.FindAsync(item.ProductID);
        if (product == null)
        {
            throw new ArgumentException($"Product {item.ProductID} not found");
        }

        if (product.StockQuantity < item.Quantity)
        {
            throw new ArgumentException($"Insufficient stock for product {product.ProductName}");
        }
    }

    // Calculate total
    decimal total = 0;
    foreach (var item in order.OrderDetails)
    {
        var product = await _context.Products.FindAsync(item.ProductID);
        total += product.UnitPrice * item.Quantity;
    }
    order.TotalAmount = total;

    // Update stock
    foreach (var item in order.OrderDetails)
    {
        var product = await _context.Products.FindAsync(item.ProductID);
        product.StockQuantity -= item.Quantity;
    }

    // Save order
    _context.Orders.Add(order);
    await _context.SaveChangesAsync();

    return order;
}
```

**2. Validation Logic**:
```csharp
public bool ValidateCustomer(Customer customer)
{
    // Required fields
    if (string.IsNullOrWhiteSpace(customer.CustomerName))
        return false;

    // Email format
    if (!IsValidEmail(customer.Email))
        return false;

    // Phone format (if provided)
    if (!string.IsNullOrEmpty(customer.Phone) && !IsValidPhone(customer.Phone))
        return false;

    // Business rules
    if (customer.CustomerName.Length < 3 || customer.CustomerName.Length > 100)
        return false;

    return true;
}
```

**3. Data Transformation Logic**:
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

#### 3.2.4 API Response Standards
**Requirement**: Define and provide API endpoints with proper HTTP methods, headers, parameters, request bodies, and appropriate responses

**Standard Response Format**:
```json
// Success Response
{
  "success": true,
  "data": {
    "customerID": 1,
    "customerName": "John Doe",
    "email": "john@example.com"
  },
  "message": "Customer retrieved successfully"
}

// Error Response
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid input data",
    "details": [
      {
        "field": "email",
        "message": "Email is required"
      }
    ]
  }
}
```

**HTTP Status Codes**:
- **200 OK**: Successful GET, PUT, PATCH
- **201 Created**: Successful POST
- **204 No Content**: Successful DELETE
- **400 Bad Request**: Invalid input
- **401 Unauthorized**: Authentication required
- **403 Forbidden**: Authorization failed
- **404 Not Found**: Resource not found
- **409 Conflict**: Resource conflict (duplicate)
- **500 Internal Server Error**: Server error

**Response Headers**:
```
Content-Type: application/json
Cache-Control: no-cache
X-Request-ID: unique-request-id
```

**Implementation Example**:
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
                message = $"Customer with ID {id} not found"
            }
        });
    }

    return Ok(new
    {
        success = true,
        data = customer,
        message = "Customer retrieved successfully"
    });
}
```

#### 3.2.5 Error Handling
**Requirement**: Handle negative cases and errors by providing consistent and consumable API responses

**Error Handling Strategy**:
1. **Validation Errors**: Return 400 with field-level errors
2. **Not Found Errors**: Return 404 with resource information
3. **Conflict Errors**: Return 409 with conflict details
4. **Server Errors**: Return 500 with generic error message
5. **Authentication Errors**: Return 401 with auth challenge

**Global Exception Handler**:
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

**Validation Error Response**:
```json
{
  "success": false,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "One or more validation errors occurred",
    "details": [
      {
        "field": "customerName",
        "message": "Customer name is required"
      },
      {
        "field": "email",
        "message": "Email format is invalid"
      }
    ]
  }
}
```

#### 3.2.6 Mobile UI Implementation
**Requirement**: Create mobile application forms and UI components based on the given requirements

**Jetpack Compose UI Components**:

**1. Text Input Fields**:
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

**2. Form Layout**:
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
            text = "Customer Information",
            style = MaterialTheme.typography.headlineSmall
        )

        CustomerInputField(
            label = "Customer Name",
            value = customer.customerName,
            onValueChange = { customer.customerName = it }
        )

        CustomerInputField(
            label = "Email",
            value = customer.email,
            onValueChange = { customer.email = it }
        )

        CustomerInputField(
            label = "Phone",
            value = customer.phone,
            onValueChange = { customer.phone = it }
        )

        Spacer(modifier = Modifier.weight(1f))

        Button(
            onClick = onSave,
            modifier = Modifier.fillMaxWidth()
        ) {
            Text("Save Customer")
        }
    }
}
```

**3. List Display**:
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

**4. Navigation**:
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

#### 3.2.7 API Integration
**Requirement**: Integrate the mobile application with APIs to display and manage data, including create, read, update, and delete (CRUD) operations

**API Service Implementation**:
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

**Repository Pattern**:
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

**ViewModel Integration**:
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

#### 3.2.8 Search & Filter Implementation
**Requirement**: Implement data searching and filtering features in the mobile application

**Search Implementation**:
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
        placeholder = { Text("Search customers...") },
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

// Usage with debouncing
@Composable
fun CustomerListScreen() {
    var searchQuery by remember { mutableStateOf("") }
    val viewModel: CustomerViewModel = viewModel()

    // Debounced search
    LaunchedEffect(searchQuery) {
        delay(500) // Wait 500ms after user stops typing
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

**Filter Implementation**:
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
        title = { Text("Filter Customers") },
        text = {
            Column(verticalArrangement = Arrangement.spacedBy(16.dp)) {
                // Category filter
                var selectedCategory by remember { mutableStateOf(filter.category) }
                FilterDropdown(
                    label = "Category",
                    options = listOf("All", "VIP", "Regular", "New"),
                    selectedOption = selectedCategory,
                    onOptionSelected = {
                        selectedCategory = if (it == "All") null else it
                        localFilter = localFilter.copy(category = selectedCategory)
                    }
                )

                // Date range filter
                DatePickerRow(
                    label = "Date Range",
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
                Text("Apply")
            }
        },
        dismissButton = {
            TextButton(onClick = onDismiss) {
                Text("Cancel")
            }
        }
    )
}
```

#### 3.2.9 Data Export
**Requirement**: Export application data to external files

**CSV Export Implementation**:
```kotlin
fun exportCustomersToCSV(customers: List<Customer>, context: Context): Uri? {
    val csvContent = buildString {
        appendLine("CustomerID,CustomerName,Email,Phone,Address")
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

**PDF Export Implementation**:
```kotlin
fun exportCustomersToPDF(customers: List<Customer>, context: Context): Uri? {
    val pdfDocument = PdfDocument()
    val pageInfo = PdfDocument.PageInfo.Builder(595, 842, 1).create()
    val page = pdfDocument.startPage(pageInfo)
    val canvas = page.canvas

    // Draw title
    val paint = Paint().apply {
        color = Color.BLACK
        textSize = 24f
        typeface = Typeface.create(Typeface.DEFAULT, Typeface.BOLD)
    }
    canvas.drawText("Customer List", 200f, 50f, paint)

    // Draw table header
    paint.textSize = 14f
    var yPosition = 100f
    canvas.drawText("ID", 50f, yPosition, paint)
    canvas.drawText("Name", 100f, yPosition, paint)
    canvas.drawText("Email", 300f, yPosition, paint)

    // Draw data rows
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

**Export UI**:
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
        Text("Export")
    }

    if (showExportDialog) {
        AlertDialog(
            onDismissRequest = { showExportDialog = false },
            title = { Text("Export Data") },
            text = {
                Column(verticalArrangement = Arrangement.spacedBy(8.dp)) {
                    Text("Choose export format:")
                    Button(
                        onClick = {
                            exportCustomersToCSV(customers, context)
                            showExportDialog = false
                        },
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Text("Export as CSV")
                    }
                    Button(
                        onClick = {
                            exportCustomersToPDF(customers, context)
                            showExportDialog = false
                        },
                        modifier = Modifier.fillMaxWidth()
                    ) {
                        Text("Export as PDF")
                    }
                }
            },
            confirmButton = {
                TextButton(onClick = { showExportDialog = false }) {
                    Text("Cancel")
                }
            }
        )
    }
}
```

### 3.3 Assessment Criteria (25% each - Measurement)

**Scoring Method**: Binary (1 if meets criteria, 0 if not)

| Aspect | Description | Max Mark |
|--------|-------------|----------|
| Database Design | Proper database schema with relationships | 0.15 |
| API Implementation | All endpoints implemented correctly | 0.25 |
| Business Logic | Correct business logic for all operations | 0.20 |
| API Response Format | Consistent and proper API responses | 0.10 |
| Error Handling | Proper error handling and messages | 0.10 |
| Mobile UI | UI components based on requirements | 0.10 |
| API Integration | Successful integration with API | 0.15 |
| CRUD Operations | All CRUD operations functional | 0.20 |
| Search Functionality | Search feature working correctly | 0.10 |
| Filter Functionality | Filter feature working correctly | 0.10 |
| Data Export | Export to external files functional | 0.05 |
| Validation | Input validation implemented | 0.05 |

**Total**: 1.00 (converted to 25% of total score per module)

---

## 4. Module: Software Design

### 4.1 Module Overview
- **Duration**: 3 hours
- **Day**: Day 2
- **Weight**: 20%
- **Technology**: Draw.io, UML Diagrams

### 4.2 Detailed Requirements

#### 4.2.1 Requirements Analysis & Documentation
**Requirement**: Able to analyze and document requirements based on user and system needs

**Requirements Analysis Process**:
1. **Stakeholder Identification**:
   - Identify all stakeholders (users, administrators, system managers)
   - Understand their roles and responsibilities
   - Gather their needs and expectations

2. **Functional Requirements**:
   - What the system must do
   - Specific features and capabilities
   - User interactions and workflows
   - Data processing requirements

3. **Non-Functional Requirements**:
   - Performance requirements (response time, throughput)
   - Security requirements (authentication, authorization)
   - Reliability requirements (availability, error handling)
   - Usability requirements (ease of use, accessibility)
   - Scalability requirements (handle growth)

**Requirements Documentation Template**:
```markdown
# System Requirements Document

## 1. Introduction
### 1.1 Purpose
### 1.2 Scope
### 1.3 Definitions

## 2. Overall Description
### 2.1 System Context
### 2.2 User Characteristics
### 2.3 Constraints

## 3. Functional Requirements
### 3.1 User Management
- FR-001: System shall allow user registration
- FR-002: System shall allow user login
- FR-003: System shall allow password reset

### 3.2 Data Management
- FR-004: System shall allow CRUD operations
- FR-005: System shall support data export

## 4. Non-Functional Requirements
### 4.1 Performance
- NFR-001: System shall respond within 2 seconds
- NFR-002: System shall support 100 concurrent users

### 4.2 Security
- NFR-003: System shall use HTTPS
- NFR-004: System shall hash passwords

## 5. Use Cases
(Use case descriptions)

## 6. Data Requirements
(Database schema, data dictionary)
```

**Example Functional Requirement**:
```
FR-010: Customer Search

Description: The system shall allow users to search for customers by name, email, or phone number.

Priority: High
Status: Approved

Acceptance Criteria:
- User can enter search term in search field
- System returns matching customers
- Search is case-insensitive
- Search supports partial matching
- Results display within 2 seconds
```

#### 4.2.2 Use Case Development
**Requirement**: Able to develop use cases that clearly represent interactions between users and the system

**Use Case Components**:
1. **Use Case Name**: Descriptive name of the use case
2. **Actor**: User or external system interacting with the system
3. **Description**: Brief description of what the use case does
4. **Preconditions**: Conditions that must be true before use case starts
5. **Main Flow (Happy Path)**: Step-by-step description of normal execution
6. **Alternative Flows**: Alternative paths or exceptions
7. **Postconditions**: Conditions that must be true after use case completes

**Use Case Example**:
```
Use Case: UC-001 - Customer Registration

Actor: Customer

Description: A new customer registers an account in the system.

Preconditions:
- Customer has valid email address
- Customer has access to the registration form

Main Flow:
1. Customer navigates to registration page
2. Customer enters name, email, phone, and address
3. Customer enters password and confirms password
4. Customer clicks "Register" button
5. System validates input data
6. System checks if email already exists
7. System creates customer account
8. System sends confirmation email
9. System displays success message
10. Customer is redirected to login page

Alternative Flows:
Alt Flow 1: Invalid Input
- At step 5, if validation fails:
  - System displays error message
  - Customer corrects input
  - Return to step 4

Alt Flow 2: Email Already Exists
- At step 6, if email exists:
  - System displays error message
  - Customer enters different email
  - Return to step 4

Postconditions:
- Customer account is created in database
- Customer can login with credentials
- Confirmation email is sent
```

**Use Case Diagram Elements**:
- **Actor**: Stick figure representing user/external system
- **Use Case**: Oval representing a function
- **System Boundary**: Rectangle enclosing related use cases
- **Association**: Line connecting actor to use case
- **Include**: Dashed arrow with <<include>> label
- **Extend**: Dashed arrow with <<extend>> label
- **Generalization**: Solid arrow with hollow triangle

**Use Case Diagram Example**:
```
┌─────────────────────────────────────┐
│           Customer System            │
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
  Customer    Admin    System Admin
```

#### 4.2.3 Activity Diagram Modeling
**Requirement**: Able to model system workflows using activity diagrams in accordance with the defined requirements

**Activity Diagram Components**:
- **Initial Node**: Solid circle representing start
- **Activity**: Rounded rectangle representing action
- **Decision Node**: Diamond representing branching
- **Merge Node**: Diamond representing converging paths
- **Fork Node**: Thick bar representing parallel execution
- **Join Node**: Thick bar representing synchronization
- **Final Node**: Circle with border representing end
- **Flow**: Arrow representing control flow
- **Object Flow**: Dashed arrow representing data flow

**Activity Diagram Example - Customer Registration**:
```
        [Start]
           │
           ↓
    ┌─────────────┐
    │Display Form │
    └─────────────┘
           │
           ↓
    ┌─────────────┐
    │Enter Data   │
    └─────────────┘
           │
           ↓
      ┌─────────┐
      │Validate │◄──────┐
      └─────────┘       │
           │            │
      ┌────┴────┐       │
      │ Valid?  │       │
      └────┬────┘       │
     Yes   │   No       │
      ↓    │    ↓       │
┌─────────┐ │ ┌─────────┐
│Check    │ │ │Display  │
│Email    │ │ │Error    │
└─────────┘ │ └─────────┘
     │      │    │
  ┌──┴──┐   │    └──┐
  │Exist?│   │       │
  └──┬──┘   │       │
  No   │  Yes│       │
   ↓   │   ↓ │       │
┌─────┐│┌─────┐│       │
│Create│││Display│      │
│Account│││Error  │      │
└─────┘│└─────┘│      │
   │   │   │   │      │
   └───┴───┘   └──────┘
       │
       ↓
┌─────────────┐
│Send Email   │
└─────────────┘
       │
       ↓
┌─────────────┐
│Display      │
│Success      │
└─────────────┘
       │
       ↓
     [End]
```

**Activity Diagram Best Practices**:
- Keep diagrams simple and focused
- Use clear, descriptive labels
- Avoid crossing lines when possible
- Group related activities
- Show error handling paths
- Indicate parallel processes with fork/join

#### 4.2.4 UI Design
**Requirement**: Able to design user interfaces for desktop and mobile applications that meet functional requirements and usability principles

**UI Design Principles**:
1. **Consistency**: Consistent look and feel across screens
2. **Clarity**: Clear and intuitive interface
3. **Efficiency**: Minimize user effort
4. **Feedback**: Provide clear feedback for actions
5. **Error Prevention**: Prevent errors before they occur
6. **Accessibility**: Accessible to all users
7. **Responsiveness**: Fast and responsive interface

**Desktop UI Design Example**:
```
┌─────────────────────────────────────────────────────┐
│ Customer Management System              [_][□][X] │
├─────────────────────────────────────────────────────┤
│ File  Edit  View  Tools  Help                         │
├─────────────────────────────────────────────────────┤
│                                                     │
│  ┌──────────────┐  ┌──────────────────────────┐   │
│  │ Customer List│  │ Customer Details         │   │
│  ├──────────────┤  ├──────────────────────────┤   │
│  │ [Search:    ]│  │ ID:        [12345]      │   │
│  ├──────────────┤  │ Name:      [John Doe]   │   │
│  │ John Doe     │  │ Email:     [john@...]   │   │
│  │ Jane Smith   │  │ Phone:     [555-1234]   │   │
│  │ Bob Johnson  │  │ Address:   [123 Main St]│   │
│  │              │  ├──────────────────────────┤   │
│  │              │  │ [Save] [Cancel] [Delete] │   │
│  └──────────────┘  └──────────────────────────┘   │
│                                                     │
│  Status: Ready                                       │
└─────────────────────────────────────────────────────┘
```

**Mobile UI Design Example**:
```
┌─────────────────────────┐
│  ←  Customer List    +  │
├─────────────────────────┤
│                         │
│  🔍 Search customers...  │
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
│         [Add New]       │
└─────────────────────────┘
```

**Wireframe Guidelines**:
- Use simple shapes and lines
- Focus on layout and structure
- Include all required elements
- Show navigation paths
- Indicate interactive elements
- Note any special behaviors

**UI Design Checklist**:
- [ ] All required fields present
- [ ] Clear labels for all inputs
- [ ] Appropriate input types
- [ ] Submit/cancel buttons
- [ ] Error message display area
- [ ] Loading indicators
- [ ] Navigation elements
- [ ] Responsive design
- [ ] Accessibility features
- [ ] Consistent styling

### 4.3 Assessment Criteria (20% - Judgement)

**Scoring Method**: Subjective (0-3 scale)

| Aspect | Description | Score |
|--------|-------------|-------|
| **0 - Below Industry Standard** | Wireframes are unclear and do not effectively communicate the design | |
| **1 - Meets Industry Standard** | Wireframes are somewhat clear but could be more effective in communicating the design | |
| **2 - Exceeds Industry Standard** | Wireframes are clear and effectively communicate most aspects of the design | |
| **3 - Extraordinary** | Wireframes are exceptionally clear and effectively communicate all aspects of the design | |

**Assessment Areas**:
1. **Requirements Documentation** (25%)
   - Completeness of requirements
   - Clarity of documentation
   - Organization and structure
   - Traceability to design

2. **Use Case Development** (25%)
   - Completeness of use cases
   - Accuracy of actor identification
   - Clarity of flows
   - Proper exception handling

3. **Activity Diagrams** (25%)
   - Accuracy of workflow representation
   - Completeness of paths
   - Clarity of notation
   - Adherence to UML standards

4. **UI Design** (25%)
   - Usability of design
   - Completeness of screens
   - Consistency across screens
   - Adherence to requirements

**Total**: 20% of overall score

---

## 5. Cross-Module Considerations

### 5.1 Data Consistency
- Ensure consistent data models across mobile and desktop
- Use same database schema for all modules
- Maintain data integrity across platforms

### 5.2 API Standards
- Consistent API design across all endpoints
- Standardized response formats
- Uniform error handling
- Consistent authentication/authorization

### 5.3 Code Quality
- Follow coding standards for each platform
- Implement proper error handling
- Add appropriate comments
- Use meaningful variable/function names

### 5.4 Security
- Implement authentication where required
- Protect sensitive data
- Validate all inputs
- Use secure communication (HTTPS)

### 5.5 Performance
- Optimize database queries
- Implement caching where appropriate
- Minimize API calls
- Handle large datasets efficiently

---

## 6. Assessment Summary

### 6.1 Module Weight Distribution
| Module | Duration | Weight | Assessment Type |
|--------|----------|--------|-----------------|
| A: Mobile Applications (Android) | 3 hours | 25% | Measurement |
| B: Desktop Applications (.NET) | 3 hours | 30% | Measurement |
| C: Mobile Applications (Android) | 3 hours | 25% | Measurement |
| D: Software Design | 3 hours | 20% | Judgement |
| **Total** | **12 hours** | **100%** | |

### 6.2 Assessment Methods
- **Measurement (80%)**: Objective, binary scoring (0 or 1)
  - Applied to Modules A, B, C
  - Based on specific criteria completion
  - Deductions for missing components

- **Judgement (20%)**: Subjective, scaled scoring (0-3)
  - Applied to Module D (Software Design)
  - Based on quality and industry standards
  - Evaluates design effectiveness

### 6.3 Score Conversion
- Initial score: 0-100 scale
- Converted to WorldSkills scale: 0-700
- Rankings:
  - Juara 1, 2, 3 based on converted scores
  - Medallion of Excellence for scores above 700

---

## 7. Preparation Recommendations

### 7.1 Technical Skills to Practice
- **Database Design**: Normalization, relationships, indexing
- **API Development**: RESTful design, error handling, documentation
- **Mobile Development**: Jetpack Compose, Kotlin coroutines, Retrofit
- **Desktop Development**: Windows Forms, Entity Framework, LINQ
- **UML Modeling**: Use cases, activity diagrams, class diagrams
- **SQL**: JOIN queries, aggregate functions, stored procedures

### 7.2 Time Management Strategy
- **First 30 minutes**: Read and understand requirements
- **Next 60 minutes**: Design database and API structure
- **Next 90 minutes**: Implement core functionality
- **Last 60 minutes**: Testing, refinement, and documentation

### 7.3 Common Pitfalls to Avoid
- Not reading requirements thoroughly
- Skipping validation and error handling
- Inconsistent naming conventions
- Poor time management
- Ignoring edge cases
- Not testing all functionality
- Incomplete error messages

### 7.4 Success Factors
- Clear understanding of requirements
- Well-structured code
- Comprehensive error handling
- Consistent UI/UX design
- Proper documentation
- Effective time management
- Attention to detail

---

**Document Version**: 1.0  
**Based on**: LKS DIKMEN National 2026 Kisi-kisi  
**Competition**: IT Software Solution for Business  
**Last Updated**: 2026
