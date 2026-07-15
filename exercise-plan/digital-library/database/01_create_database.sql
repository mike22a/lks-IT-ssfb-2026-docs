-- Digital Library Database Creation Script
-- SQL Server 2022
-- Version: 1.0

-- Create Database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'DigitalLibrary')
BEGIN
    CREATE DATABASE DigitalLibrary;
END
GO

USE DigitalLibrary;
GO

-- Drop tables if exists (for clean recreation)
IF OBJECT_ID('dbo.BorrowingDetails', 'U') IS NOT NULL DROP TABLE dbo.BorrowingDetails;
IF OBJECT_ID('dbo.Borrowings', 'U') IS NOT NULL DROP TABLE dbo.Borrowings;
IF OBJECT_ID('dbo.Books', 'U') IS NOT NULL DROP TABLE dbo.Books;
IF OBJECT_ID('dbo.Categories', 'U') IS NOT NULL DROP TABLE dbo.Categories;
IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL DROP TABLE dbo.Users;
GO

-- Create Users Table
CREATE TABLE Users (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NULL,
    Phone NVARCHAR(20) NULL,
    Address NVARCHAR(200) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT CK_Users_Email CHECK (Email IS NULL OR Email LIKE '%@%.%')
);
GO

-- Create Categories Table
CREATE TABLE Categories (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Description NVARCHAR(200) NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT UQ_Categories_Name UNIQUE (Name)
);
GO

-- Create Books Table
CREATE TABLE Books (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    CategoryId INT NOT NULL,
    Title NVARCHAR(200) NOT NULL,
    Author NVARCHAR(100) NOT NULL,
    Publisher NVARCHAR(100) NOT NULL,
    Year INT NOT NULL,
    ISBN NVARCHAR(20) NULL,
    Stock INT NOT NULL DEFAULT 0,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Books_Categories FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
    CONSTRAINT CK_Books_Year CHECK (Year BETWEEN 1900 AND 2099),
    CONSTRAINT CK_Books_Stock CHECK (Stock >= 0),
    CONSTRAINT UQ_Books_ISBN UNIQUE (ISBN)
);
GO

-- Create Borrowings Table
CREATE TABLE Borrowings (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    UserId INT NOT NULL,
    BorrowDate DATETIME NOT NULL DEFAULT GETDATE(),
    DueDate DATETIME NOT NULL,
    ReturnDate DATETIME NULL,
    Status NVARCHAR(20) NOT NULL DEFAULT 'Dipinjam',
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_Borrowings_Users FOREIGN KEY (UserId) REFERENCES Users(Id),
    CONSTRAINT CK_Borrowings_Status CHECK (Status IN ('Dipinjam', 'Dikembalikan'))
);
GO

-- Create BorrowingDetails Table
CREATE TABLE BorrowingDetails (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    BorrowingId INT NOT NULL,
    BookId INT NOT NULL,
    Quantity INT NOT NULL DEFAULT 1,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    UpdatedAt DATETIME NOT NULL DEFAULT GETDATE(),
    CONSTRAINT FK_BorrowingDetails_Borrowings FOREIGN KEY (BorrowingId) REFERENCES Borrowings(Id) ON DELETE CASCADE,
    CONSTRAINT FK_BorrowingDetails_Books FOREIGN KEY (BookId) REFERENCES Books(Id),
    CONSTRAINT CK_BorrowingDetails_Quantity CHECK (Quantity >= 1)
);
GO

-- Create Indexes for Performance
CREATE INDEX IX_Books_CategoryId ON Books(CategoryId);
CREATE INDEX IX_Borrowings_UserId ON Borrowings(UserId);
CREATE INDEX IX_Borrowings_BorrowDate ON Borrowings(BorrowDate);
CREATE INDEX IX_Borrowings_Status ON Borrowings(Status);
CREATE INDEX IX_BorrowingDetails_BookId ON BorrowingDetails(BookId);
GO

-- Create Trigger for UpdatedAt (Users)
CREATE TRIGGER TR_Users_UpdateTimestamp
ON Users
AFTER UPDATE
AS
BEGIN
    UPDATE u
    SET u.UpdatedAt = GETDATE()
    FROM Users u
    INNER JOIN inserted i ON u.Id = i.Id;
END
GO

-- Create Trigger for UpdatedAt (Categories)
CREATE TRIGGER TR_Categories_UpdateTimestamp
ON Categories
AFTER UPDATE
AS
BEGIN
    UPDATE c
    SET c.UpdatedAt = GETDATE()
    FROM Categories c
    INNER JOIN inserted i ON c.Id = i.Id;
END
GO

-- Create Trigger for UpdatedAt (Books)
CREATE TRIGGER TR_Books_UpdateTimestamp
ON Books
AFTER UPDATE
AS
BEGIN
    UPDATE b
    SET b.UpdatedAt = GETDATE()
    FROM Books b
    INNER JOIN inserted i ON b.Id = i.Id;
END
GO

-- Create Trigger for UpdatedAt (Borrowings)
CREATE TRIGGER TR_Borrowings_UpdateTimestamp
ON Borrowings
AFTER UPDATE
AS
BEGIN
    UPDATE b
    SET b.UpdatedAt = GETDATE()
    FROM Borrowings b
    INNER JOIN inserted i ON b.Id = i.Id;
END
GO

-- Create Trigger for UpdatedAt (BorrowingDetails)
CREATE TRIGGER TR_BorrowingDetails_UpdateTimestamp
ON BorrowingDetails
AFTER UPDATE
AS
BEGIN
    UPDATE bd
    SET bd.UpdatedAt = GETDATE()
    FROM BorrowingDetails bd
    INNER JOIN inserted i ON bd.Id = i.Id;
END
GO

PRINT 'Database Digital Library created successfully!';
PRINT 'Tables: Users, Categories, Books, Borrowings, BorrowingDetails';
PRINT 'Indexes created for performance optimization';
PRINT 'Triggers created for automatic UpdatedAt';
