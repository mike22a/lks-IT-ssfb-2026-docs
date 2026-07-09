# Panduan Pembuatan Proyek HotelApi (Clean Architecture - .NET 8)

Panduan ini menjelaskan langkah-demi-langkah pembuatan **Hotel Reservation System API** menggunakan **Clean Architecture** (4 Layer). Proyek ini adalah tingkat **Hard** (Level 3) yang menambahkan kompleksitas tertinggi berupa:

- **State Machine Reservasi**: Alur status yang ketat: `Pending → Confirmed → CheckedIn → CheckedOut / Cancelled`
- **Date-Range Availability Query**: Kamar hanya dapat dipesan jika tidak ada reservasi aktif yang tumpang tindih pada tanggal yang diminta
- **6 Entity**: User, RoomType, Room, Guest, Reservation, Payment
- **Role-Based Authorization**: Admin & Receptionist
- **PATCH untuk State Transitions**: Best practice REST API
- **Laporan**: Occupancy (ketersediaan kamar) & Revenue (pendapatan) khusus Admin

---

## Daftar Isi
1. [Langkah 1: Setup Solution & Project Structure](#langkah-1-setup-solution--project-structure)
2. [Langkah 2: Menambahkan Project References](#langkah-2-menambahkan-project-references)
3. [Langkah 3: Menginstal NuGet Packages (.NET 8)](#langkah-3-menginstal-nuget-packages-net-8)
4. [Langkah 4: Membuat Domain Layer (Core)](#langkah-4-membuat-domain-layer-core)
5. [Langkah 5: Membuat Application Layer](#langkah-5-membuat-application-layer)
6. [Langkah 6: Membuat Infrastructure Layer](#langkah-6-membuat-infrastructure-layer)
7. [Langkah 7: Membuat API Layer (Web Entry Point)](#langkah-7-membuat-api-layer-web-entry-point)
8. [Langkah 8: Menjalankan Migrasi & Menjalankan Aplikasi](#langkah-8-menjalankan-migrasi--menjalankan-aplikasi)

---

## Langkah 1: Setup Solution & Project Structure

```bash
mkdir src && cd src
dotnet new classlib -n HotelApi.Domain -o HotelApi.Domain
dotnet new classlib -n HotelApi.Application -o HotelApi.Application
dotnet new classlib -n HotelApi.Infrastructure -o HotelApi.Infrastructure
dotnet new webapi -n HotelApi.API -o HotelApi.API
cd ..
dotnet new sln -n HotelApi
dotnet sln HotelApi.sln add src/HotelApi.Domain/HotelApi.Domain.csproj
dotnet sln HotelApi.sln add src/HotelApi.Application/HotelApi.Application.csproj
dotnet sln HotelApi.sln add src/HotelApi.Infrastructure/HotelApi.Infrastructure.csproj
dotnet sln HotelApi.sln add src/HotelApi.API/HotelApi.API.csproj
```

---

## Langkah 2: Menambahkan Project References

```bash
dotnet add src/HotelApi.Application/HotelApi.Application.csproj reference src/HotelApi.Domain/HotelApi.Domain.csproj
dotnet add src/HotelApi.Infrastructure/HotelApi.Infrastructure.csproj reference src/HotelApi.Domain/HotelApi.Domain.csproj src/HotelApi.Application/HotelApi.Application.csproj
dotnet add src/HotelApi.API/HotelApi.API.csproj reference src/HotelApi.Application/HotelApi.Application.csproj src/HotelApi.Infrastructure/HotelApi.Infrastructure.csproj
```

---

## Langkah 3: Menginstal NuGet Packages (.NET 8)

```bash
# Application
dotnet add src/HotelApi.Application/HotelApi.Application.csproj package FluentValidation --version 11.11.0

# Infrastructure
dotnet add src/HotelApi.Infrastructure/HotelApi.Infrastructure.csproj package Microsoft.EntityFrameworkCore.Sqlite --version 8.0.14
dotnet add src/HotelApi.Infrastructure/HotelApi.Infrastructure.csproj package Microsoft.EntityFrameworkCore.SqlServer --version 8.0.14
dotnet add src/HotelApi.Infrastructure/HotelApi.Infrastructure.csproj package Microsoft.EntityFrameworkCore.Tools --version 8.0.14
dotnet add src/HotelApi.Infrastructure/HotelApi.Infrastructure.csproj package BCrypt.Net-Next --version 4.2.0
dotnet add src/HotelApi.Infrastructure/HotelApi.Infrastructure.csproj package Microsoft.Extensions.Configuration.Abstractions --version 8.0.0
dotnet add src/HotelApi.Infrastructure/HotelApi.Infrastructure.csproj package Microsoft.IdentityModel.Tokens --version 8.9.0
dotnet add src/HotelApi.Infrastructure/HotelApi.Infrastructure.csproj package System.IdentityModel.Tokens.Jwt --version 8.9.0

# API
dotnet add src/HotelApi.API/HotelApi.API.csproj package Microsoft.AspNetCore.Authentication.JwtBearer --version 8.0.14
dotnet add src/HotelApi.API/HotelApi.API.csproj package Microsoft.EntityFrameworkCore.Design --version 8.0.14
dotnet add src/HotelApi.API/HotelApi.API.csproj package Swashbuckle.AspNetCore --version 6.9.0
```

---

## Langkah 4: Membuat Domain Layer (Core)

### A. 6 Entities (di `src/HotelApi.Domain/Entities/`)

1. **User.cs** — Staff (Admin, Receptionist) dengan `UserRole` enum
2. **RoomType.cs** — Tipe kamar (Standard, Deluxe, Suite) dengan `PricePerNight` dan `MaxOccupancy`
3. **Room.cs** — Kamar fisik dengan `RoomNumber`, `Floor`, dan `RoomStatus` enum (`Available`, `Occupied`, `Maintenance`)
4. **Guest.cs** — Data tamu hotel (nama, email, nomor identitas, kewarganegaraan)
5. **Reservation.cs** — Pemesanan kamar dengan **State Machine** menggunakan `ReservationStatus` enum:
   ```
   Pending → Confirmed → CheckedIn → CheckedOut
                    ↘                    ↗
                     Cancelled (dari Pending atau Confirmed)
   ```
6. **Payment.cs** — Rekaman pembayaran dengan `PaymentMethod` dan `PaymentStatus` enum

### B. Custom Exceptions (di `src/HotelApi.Domain/Exceptions/`)
- `NotFoundException.cs`, `ConflictException.cs`, `BusinessRuleException.cs`

### C. Repository Interfaces (di `src/HotelApi.Domain/Interfaces/Repositories/`)
- `IUserRepository.cs`
- `IRoomTypeRepository.cs`
- `IRoomRepository.cs` — Termasuk method `GetAvailableRoomsAsync(roomTypeId, checkIn, checkOut)` untuk date-range query
- `IGuestRepository.cs`
- `IReservationRepository.cs` — Termasuk `HasConflictAsync()` untuk cek tumpang tindih reservasi, dan `GetCheckedOutInRangeAsync()` untuk laporan revenue
- `IPaymentRepository.cs`

---

## Langkah 5: Membuat Application Layer

### A. `ApiResponse<T>` Wrapper (di `Common/`)
### B. `IJwtService` Interface (di `Interfaces/`)

### C. DTOs (di `DTOs/`)
- `Auth/AuthDTOs.cs` — `RegisterRequest`, `LoginRequest`, `AuthResponse`, `UserResponse`
- `RoomType/RoomTypeDTOs.cs`
- `Room/RoomDTOs.cs` — Termasuk `AvailableRoomRequest`
- `Guest/GuestDTOs.cs`
- `Reservation/ReservationDTOs.cs` — `CreateReservationRequest`, `ReservationResponse`, `PaymentInfo`
- `Payment/PaymentDTOs.cs`
- `Report/ReportDTOs.cs` — `OccupancyReportResponse`, `RevenueReportResponse`, `RevenueByRoomType`

### D. Services (di `Services/`)
- **AuthService.cs** — Login, register, profile
- **RoomTypeService.cs** — CRUD tipe kamar
- **RoomService.cs** — CRUD kamar + availability check
- **GuestService.cs** — CRUD tamu
- **ReservationService.cs** — Implementasi State Machine:
  - `CreateAsync`: validasi tanggal, cek konflik ketersediaan, hitung `TotalAmount = nights × PricePerNight`
  - `ConfirmAsync`: `Pending → Confirmed`
  - `CheckInAsync`: `Confirmed → CheckedIn` (kamar menjadi `Occupied`)
  - `CheckOutAsync`: `CheckedIn → CheckedOut` (kamar kembali menjadi `Available`)
  - `CancelAsync`: Batalkan dan otomatis ubah payment menjadi `Refunded`
- **PaymentService.cs** — Rekam dan query pembayaran
- **ReportService.cs** — Laporan occupancy dan revenue

---

## Langkah 6: Membuat Infrastructure Layer

### A. AppDbContext (di `Data/`)
- Mendaftarkan 6 DbSet, konfigurasi relasi, constraint unique, dan seed data (RoomTypes, Rooms, Users)

### B. Repositories (di `Repositories/`)
- `UserRepository.cs`, `RoomTypeRepository.cs`, `GuestRepository.cs`, `PaymentRepository.cs`
- **`RoomRepository.cs`** — Method `GetAvailableRoomsAsync` mengquery kamar yang tidak memiliki reservasi aktif yang tumpang tindih
- **`ReservationRepository.cs`** — Method `HasConflictAsync` untuk validasi konflik, `GetCheckedOutInRangeAsync` untuk laporan

### C. Services (di `Services/`)
- **JwtService.cs** — Generate JWT dengan `Role` claim untuk otorisasi berbasis role

---

## Langkah 7: Membuat API Layer (Web Entry Point)

### A. GlobalExceptionHandler (`Middleware/`)

### B. Controllers (`Controllers/`)
- `AuthController.cs` — register, login, me
- `RoomTypesController.cs` — Read (semua), Write (Admin only)
- `RoomsController.cs` — Termasuk `GET /available` untuk date-range availability check
- `GuestsController.cs`
- `ReservationsController.cs` — Menggunakan **`PATCH`** untuk state transitions:
  - `PATCH {id}/confirm`, `PATCH {id}/check-in`, `PATCH {id}/check-out`, `PATCH {id}/cancel`
- `PaymentsController.cs`
- **`ReportsController.cs`** — `[Authorize(Roles = "Admin")]`, endpoint occupancy & revenue

### C. Program.cs
Konfigurasi DI, switchable DB, JWT auth, GlobalExceptionHandler, Swagger dengan Bearer, dan auto-migration.

---

## Langkah 8: Menjalankan Migrasi & Menjalankan Aplikasi

```bash
# 1. Tambahkan Migrasi
dotnet ef migrations add InitialCreate \
  --project src/HotelApi.Infrastructure/HotelApi.Infrastructure.csproj \
  --startup-project src/HotelApi.API/HotelApi.API.csproj \
  --context AppDbContext

# 2. Jalankan Aplikasi
dotnet run --project src/HotelApi.API/HotelApi.API.csproj --urls "http://localhost:5003"
```

👉 **[http://localhost:5003/swagger](http://localhost:5003/swagger)**

### Alur Uji Coba Reservasi
1. Login sebagai Receptionist: `receptionist@hotel.com` / `password123`
2. Buat Tamu: `POST /api/guests`
3. Cek kamar tersedia: `GET /api/rooms/available?roomTypeId=1&checkInDate=2026-08-01&checkOutDate=2026-08-05`
4. Buat Reservasi: `POST /api/reservations` → status menjadi `Pending`
5. Konfirmasi: `PATCH /api/reservations/{id}/confirm` → status menjadi `Confirmed`
6. Rekam Pembayaran: `POST /api/payments`
7. Check-in: `PATCH /api/reservations/{id}/check-in` → status menjadi `CheckedIn`, kamar menjadi `Occupied`
8. Check-out: `PATCH /api/reservations/{id}/check-out` → status menjadi `CheckedOut`, kamar kembali `Available`
9. Lihat laporan revenue (login sebagai Admin): `GET /api/reports/revenue?from=2026-08-01&to=2026-08-31`
