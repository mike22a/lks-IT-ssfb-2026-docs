# WinForms Design

## Digital Library Training Kit

---

## Purpose

Menjelaskan desain aplikasi desktop WinForms untuk sistem Digital Library.

---

## Scope

Dokumen ini mencakup:

- Flow aplikasi
- Navigation
- Forms yang diperlukan
- Controls yang digunakan
- Validation di UI
- DataGrid usage
- Dialog usage
- Error handling

---

## Learning Objectives

Setelah membaca dokumen ini, siswa dapat:

- Mendesain flow aplikasi WinForms
- Menggunakan controls WinForms yang umum
- Implement navigation antar form
- Menggunakan DataGrid untuk display data
- Implement validation di UI
- Handle error dengan user-friendly
- Consume REST API dari WinForms

---

## Prerequisites

- Sudah membaca [05-api-design.md](./05-api-design.md)
- Sudah membaca [06-clean-architecture.md](./06-clean-architecture.md)
- Basic understanding of WinForms

---

## Business Rules

- UI harus validasi input sebelum kirim ke API
- Error message harus jelas dan user-friendly
- Loading indicator harus ditampilkan saat API call
- Data harus di-refresh setelah CRUD operation

---

## Design / Main Content

### Application Flow

```
Main Form
    ↓
├── Category Management
│   ├── List Categories
│   ├── Add Category
│   ├── Edit Category
│   └── Delete Category
│
├── Book Management
│   ├── List Books
│   ├── Add Book
│   ├── Edit Book
│   └── Delete Book
│
└── Borrowing Management
    ├── List Borrowings
    ├── Create Borrowing
    └── Return Borrowing
```

### Navigation

**Main Form sebagai Navigation Hub:**
- Menu strip untuk navigasi ke form lain
- Panel untuk menampilkan form aktif
- Back button untuk kembali ke main form

**Pattern:**
```csharp
// Open form di panel
private void OpenForm(Form form)
{
    panelMain.Controls.Clear();
    form.TopLevel = false;
    form.FormBorderStyle = FormBorderStyle.None;
    form.Dock = DockStyle.Fill;
    panelMain.Controls.Add(form);
    form.Show();
}
```

### Forms

#### 1. MainForm

**Tujuan:** Form utama sebagai navigation hub

**Controls:**
- MenuStrip
  - Menu: "Master Data"
    - Submenu: "Categories", "Books", "Users"
  - Menu: "Transactions"
    - Submenu: "Borrowings", "Returns"
  - Menu: "Reports"
    - Submenu: "Borrowing History"
- Panel (container untuk form lain)

**Layout:**
```
┌─────────────────────────────────────┐
│ MenuStrip                           │
├─────────────────────────────────────┤
│                                     │
│         Panel (Content)             │
│                                     │
└─────────────────────────────────────┘
```

#### 2. CategoryForm

**Tujuan:** CRUD Category

**Controls:**
- DataGridView: List categories
- TextBox: Name input
- TextBox: Description input
- Button: Add
- Button: Edit
- Button: Delete
- Button: Refresh
- Label: Status message

**Layout:**
```
┌─────────────────────────────────────┐
│ DataGridView (List Categories)      │
├─────────────────────────────────────┤
│ Name: [TextBox]                     │
│ Description: [TextBox]              │
│ [Add] [Edit] [Delete] [Refresh]     │
└─────────────────────────────────────┘
```

#### 3. BookForm

**Tujuan:** CRUD Book

**Controls:**
- DataGridView: List books dengan search/filter
- TextBox: Title input
- TextBox: Author input
- TextBox: Publisher input
- NumericUpDown: Year input
- ComboBox: Category selection
- NumericUpDown: Stock input
- TextBox: Search input
- Button: Add
- Button: Edit
- Button: Delete
- Button: Refresh
- Button: Search

**Layout:**
```
┌─────────────────────────────────────┐
│ Search: [TextBox] [Search]           │
├─────────────────────────────────────┤
│ DataGridView (List Books)           │
├─────────────────────────────────────┤
│ Title: [TextBox]                    │
│ Author: [TextBox]                   │
│ Publisher: [TextBox]                │
│ Year: [NumericUpDown]               │
│ Category: [ComboBox]                 │
│ Stock: [NumericUpDown]              │
│ [Add] [Edit] [Delete] [Refresh]     │
└─────────────────────────────────────┘
```

#### 4. BorrowingForm

**Tujuan:** Create dan Return Borrowing

**Controls:**
- ComboBox: User selection
- CheckedListBox: Book selection (max 3)
- DateTimePicker: Borrow date (default today)
- DateTimePicker: Due date (default +7 days)
- Button: Borrow
- Button: Return
- DataGridView: Active borrowings list
- TextBox: Borrowing ID input (untuk return)

**Layout:**
```
┌─────────────────────────────────────┐
│ User: [ComboBox]                    │
│ Books: [CheckedListBox]            │
│ Borrow Date: [DateTimePicker]       │
│ Due Date: [DateTimePicker]          │
│ [Borrow]                            │
├─────────────────────────────────────┤
│ Return Borrowing                    │
│ Borrowing ID: [TextBox] [Return]    │
├─────────────────────────────────────┤
│ DataGridView (Active Borrowings)   │
└─────────────────────────────────────┘
```

### Controls

**Common Controls:**

1. **DataGridView**
   - Display list data
   - Auto-generate columns atau manual columns
   - Selection mode: FullRowSelect
   - Enable sorting

```csharp
dataGridViewCategories.AutoGenerateColumns = false;
dataGridViewCategories.DataSource = categories;
dataGridViewCategories.Columns["Id"].DataPropertyName = "Id";
dataGridViewCategories.Columns["Name"].DataPropertyName = "Name";
```

2. **TextBox**
   - Input text
   - Multi-line untuk description
   - Placeholder (jika .NET 8+)

```csharp
textBoxName.MaxLength = 50;
textBoxDescription.Multiline = true;
```

3. **ComboBox**
   - Selection dari list
   - DataSource binding
   - DisplayMember dan ValueMember

```csharp
comboBoxCategory.DataSource = categories;
comboBoxCategory.DisplayMember = "Name";
comboBoxCategory.ValueMember = "Id";
```

4. **NumericUpDown**
   - Input numeric
   - Min, Max, Increment

```csharp
numericUpDownYear.Minimum = 1900;
numericUpDownYear.Maximum = 2099;
numericUpDownStock.Minimum = 0;
```

5. **DateTimePicker**
   - Input date/time
   - Format: Short atau Custom

```csharp
dateTimePickerBorrowDate.Format = DateTimePickerFormat.Short;
dateTimePickerBorrowDate.Value = DateTime.Today;
```

6. **CheckedListBox**
   - Multiple selection dengan checkbox
   - Validasi jumlah checked items

```csharp
if (checkedListBoxBooks.CheckedItems.Count > 3)
{
    MessageBox.Show("Maksimal 3 buku");
}
```

7. **Button**
   - Trigger action
   - Enable/Disable berdasarkan state

```csharp
buttonAdd.Enabled = IsValidInput();
```

### Validation

**UI Level Validation:**

```csharp
private bool IsValidCategoryInput()
{
    if (string.IsNullOrWhiteSpace(textBoxName.Text))
    {
        MessageBox.Show("Name is required");
        textBoxName.Focus();
        return false;
    }

    if (textBoxName.Text.Length > 50)
    {
        MessageBox.Show("Name cannot exceed 50 characters");
        textBoxName.Focus();
        return false;
    }

    return true;
}
```

**Validation Rules:**
- Required field check
- Max length check
- Numeric range check
- Format validation (email, phone)

**Validation Flow:**
1. User input
2. UI validation (client-side)
3. API validation (server-side)
4. Display error jika ada

### DataGrid

**Column Configuration:**

```csharp
// Manual columns
dataGridViewCategories.Columns.Add("Id", "ID");
dataGridViewCategories.Columns.Add("Name", "Name");
dataGridViewCategories.Columns.Add("Description", "Description");

// Bind data
dataGridViewCategories.DataSource = categories;

// Set column properties
dataGridViewCategories.Columns["Id"].Width = 50;
dataGridViewCategories.Columns["Name"].Width = 150;
dataGridViewCategories.Columns["Description"].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
```

**Selection Handling:**

```csharp
private void dataGridViewCategories_SelectionChanged(object sender, EventArgs e)
{
    if (dataGridViewCategories.SelectedRows.Count > 0)
    {
        var selectedCategory = (Category)dataGridViewCategories.SelectedRows[0].DataBoundItem;
        textBoxName.Text = selectedCategory.Name;
        textBoxDescription.Text = selectedCategory.Description;
    }
}
```

**Sorting:**
```csharp
dataGridViewCategories.Sort(dataGridViewCategories.Columns["Name"], ListSortDirection.Ascending);
```

### Dialog

**MessageBox untuk konfirmasi:**

```csharp
var result = MessageBox.Show(
    "Are you sure you want to delete this category?",
    "Confirm Delete",
    MessageBoxButtons.YesNo,
    MessageBoxIcon.Question);

if (result == DialogResult.Yes)
{
    // Delete logic
}
```

**Custom Dialog untuk input kompleks:**
- Buat form dialog baru
- Set DialogResult
- Return value dari dialog

```csharp
using (var dialog = new BookDetailDialog())
{
    if (dialog.ShowDialog() == DialogResult.OK)
    {
        var book = dialog.GetBook();
        // Process book
    }
}
```

### Error Handling

**Try-Catch untuk API calls:**

```csharp
private async void buttonAdd_Click(object sender, EventArgs e)
{
    try
    {
        if (!IsValidCategoryInput())
            return;

        buttonAdd.Enabled = false;
        Cursor = Cursors.WaitCursor;

        var dto = new CreateCategoryDto
        {
            Name = textBoxName.Text,
            Description = textBoxDescription.Text
        };

        await _categoryService.CreateCategoryAsync(dto);
        
        MessageBox.Show("Category created successfully");
        LoadCategories();
        ClearInputs();
    }
    catch (HttpRequestException ex)
    {
        MessageBox.Show($"Network error: {ex.Message}");
    }
    catch (Exception ex)
    {
        MessageBox.Show($"Error: {ex.Message}");
    }
    finally
    {
        buttonAdd.Enabled = true;
        Cursor = Cursors.Default;
    }
}
```

**Error Display:**
- MessageBox untuk error sederhana
- StatusLabel untuk error non-blocking
- Error dialog untuk error kompleks

---

## Implementation Notes

- Gunakan async/await untuk API calls
- Disable button saat loading untuk prevent double-click
- Gunakan Cursor.WaitCursor saat loading
- Refresh data setelah CRUD operation
- Handle network error gracefully

---

## Common Mistakes

- Tidak validasi input di UI
- Tidak handle exception dari API calls
- Tidak refresh data setelah CRUD
- Tidak disable button saat loading
- Error message tidak user-friendly
- Tidak menggunakan async untuk API calls

---

## Exercises

1. Design layout untuk UserForm
2. Implement validation untuk BookForm
3. Buat flowchart untuk navigation antar form
4. Implement error handling untuk API call
5. Design custom dialog untuk book selection

---

## Homework

1. Implement MainForm dengan navigation
2. Implement CategoryForm dengan CRUD
3. Implement BookForm dengan search/filter
4. Implement BorrowingForm dengan validation
5. Test semua form dengan API mock

---

## References

- [WinForms Documentation](https://docs.microsoft.com/en-us/dotnet/desktop/winforms/)
- [HttpClient in WinForms](https://docs.microsoft.com/en-us/dotnet/desktop/winforms/data/how-to-consume-rest-api)

---

## Related Documents

- [05-api-design.md](./05-api-design.md) - API endpoint untuk consume
- [06-clean-architecture.md](./06-clean-architecture.md) - Clean Architecture di desktop
