-- Digital Library Sample Queries
-- SQL Server 2022
-- Version: 1.0

USE DigitalLibrary;
GO

-- ============================================
-- BASIC QUERIES
-- ============================================

-- 1. Get all categories
SELECT * FROM Categories;
GO

-- 2. Get all books
SELECT b.Id, b.Title, b.Author, c.Name AS Category, b.Stock
FROM Books b
JOIN Categories c ON b.CategoryId = c.Id;
GO

-- 3. Get all users
SELECT * FROM Users;
GO

-- 4. Get all borrowings
SELECT b.Id, u.FirstName + ' ' + u.LastName AS UserName, b.BorrowDate, b.DueDate, b.Status
FROM Borrowings b
JOIN Users u ON b.UserId = u.Id;
GO

-- ============================================
-- INTERMEDIATE QUERIES
-- ============================================

-- 5. Get books by category
SELECT b.Id, b.Title, b.Author, b.Stock
FROM Books b
WHERE b.CategoryId = 1; -- Fiction
GO

-- 6. Get books with stock > 5
SELECT b.Id, b.Title, b.Author, b.Stock
FROM Books b
WHERE b.Stock > 5
ORDER BY b.Stock DESC;
GO

-- 7. Get active borrowings (not returned)
SELECT b.Id, u.FirstName + ' ' + u.LastName AS UserName, b.BorrowDate, b.DueDate
FROM Borrowings b
JOIN Users u ON b.UserId = u.Id
WHERE b.Status = 'Dipinjam';
GO

-- 8. Get overdue borrowings
SELECT b.Id, u.FirstName + ' ' + u.LastName AS UserName, b.BorrowDate, b.DueDate, DATEDIFF(DAY, b.DueDate, GETDATE()) AS DaysOverdue
FROM Borrowings b
JOIN Users u ON b.UserId = u.Id
WHERE b.Status = 'Dipinjam' AND b.DueDate < GETDATE();
GO

-- 9. Get books in a specific borrowing
SELECT b.Id, b.Title, b.Author, bd.Quantity
FROM BorrowingDetails bd
JOIN Books b ON bd.BookId = b.Id
WHERE bd.BorrowingId = 1;
GO

-- 10. Get user's borrowing history
SELECT b.Id, b.BorrowDate, b.DueDate, b.ReturnDate, b.Status,
    (SELECT COUNT(*) FROM BorrowingDetails WHERE BorrowingId = b.Id) AS BookCount
FROM Borrowings b
WHERE b.UserId = 1
ORDER BY b.BorrowDate DESC;
GO

-- ============================================
-- ADVANCED QUERIES
-- ============================================

-- 11. Get most borrowed books
SELECT TOP 10 b.Id, b.Title, b.Author, COUNT(bd.BookId) AS BorrowCount
FROM Books b
JOIN BorrowingDetails bd ON b.Id = bd.BookId
GROUP BY b.Id, b.Title, b.Author
ORDER BY BorrowCount DESC;
GO

-- 12. Get categories with book count
SELECT c.Id, c.Name, c.Description, COUNT(b.Id) AS BookCount
FROM Categories c
LEFT JOIN Books b ON c.Id = b.CategoryId
GROUP BY c.Id, c.Name, c.Description
ORDER BY BookCount DESC;
GO

-- 13. Get users with most active borrowings
SELECT TOP 10 u.Id, u.FirstName, u.LastName, 
    COUNT(CASE WHEN b.Status = 'Dipinjam' THEN 1 END) AS ActiveBorrowings,
    COUNT(b.Id) AS TotalBorrowings
FROM Users u
LEFT JOIN Borrowings b ON u.Id = b.UserId
GROUP BY u.Id, u.FirstName, u.LastName
ORDER BY ActiveBorrowings DESC;
GO

-- 14. Get books available (stock > 0 and not currently borrowed)
SELECT b.Id, b.Title, b.Author, b.Stock,
    (SELECT COUNT(*) FROM BorrowingDetails bd 
     JOIN Borrowings bor ON bd.BorrowingId = bor.Id 
     WHERE bd.BookId = b.Id AND bor.Status = 'Dipinjam') AS CurrentlyBorrowed
FROM Books b
WHERE b.Stock > 0
ORDER BY b.Title;
GO

-- 15. Get borrowing statistics by month
SELECT YEAR(BorrowDate) AS Year, MONTH(BorrowDate) AS Month, 
    COUNT(*) AS TotalBorrowings,
    SUM(CASE WHEN Status = 'Dipinjam' THEN 1 ELSE 0 END) AS ActiveBorrowings
FROM Borrowings
GROUP BY YEAR(BorrowDate), MONTH(BorrowDate)
ORDER BY Year DESC, Month DESC;
GO

-- ============================================
-- JOIN QUERIES
-- ============================================

-- 16. Get borrowing details with all related information
SELECT b.Id AS BorrowingId, 
    u.FirstName + ' ' + u.LastName AS UserName,
    bo.Title AS BookTitle,
    bd.Quantity,
    b.BorrowDate,
    b.DueDate,
    b.Status
FROM Borrowings b
JOIN Users u ON b.UserId = u.Id
JOIN BorrowingDetails bd ON b.Id = bd.BorrowingId
JOIN Books bo ON bd.BookId = bo.Id
ORDER BY b.BorrowDate DESC;
GO

-- 17. Get books that have never been borrowed
SELECT b.Id, b.Title, b.Author, b.Stock
FROM Books b
LEFT JOIN BorrowingDetails bd ON b.Id = bd.BookId
WHERE bd.Id IS NULL;
GO

-- 18. Get users who have borrowed specific category
SELECT DISTINCT u.Id, u.FirstName, u.LastName
FROM Users u
JOIN Borrowings b ON u.Id = b.UserId
JOIN BorrowingDetails bd ON b.Id = bd.BorrowingId
JOIN Books bo ON bd.BookId = bo.Id
WHERE bo.CategoryId = 5; -- Technology
GO

-- ============================================
-- GROUP BY QUERIES
-- ============================================

-- 19. Get book count by category
SELECT c.Name AS Category, COUNT(b.Id) AS BookCount
FROM Categories c
LEFT JOIN Books b ON c.Id = b.CategoryId
GROUP BY c.Name
ORDER BY BookCount DESC;
GO

-- 20. Get borrowing count by user
SELECT u.FirstName + ' ' + u.LastName AS UserName, COUNT(b.Id) AS BorrowingCount
FROM Users u
LEFT JOIN Borrowings b ON u.Id = b.UserId
GROUP BY u.FirstName, u.LastName
ORDER BY BorrowingCount DESC;
GO

-- ============================================
-- AGGREGATE QUERIES
-- ============================================

-- 21. Get total books in library
SELECT COUNT(*) AS TotalBooks, SUM(Stock) AS TotalStock
FROM Books;
GO

-- 22. Get average books per borrowing
SELECT AVG(BookCount) AS AvgBooksPerBorrowing
FROM (
    SELECT COUNT(*) AS BookCount
    FROM BorrowingDetails
    GROUP BY BorrowingId
) AS BorrowingStats;
GO

-- 23. Get total active borrowings
SELECT COUNT(*) AS TotalActiveBorrowings
FROM Borrowings
WHERE Status = 'Dipinjam';
GO

-- 24. Get total books currently borrowed
SELECT SUM(bd.Quantity) AS TotalBooksBorrowed
FROM BorrowingDetails bd
JOIN Borrowings b ON bd.BorrowingId = b.Id
WHERE b.Status = 'Dipinjam';
GO

-- ============================================
-- REPORT QUERIES
-- ============================================

-- 25. Daily borrowing report
SELECT CAST(BorrowDate AS DATE) AS Date, COUNT(*) AS Borrowings
FROM Borrowings
GROUP BY CAST(BorrowDate AS DATE)
ORDER BY Date DESC;
GO

-- 26. Category popularity report
SELECT c.Name AS Category, 
    COUNT(bd.BookId) AS TimesBorrowed,
    COUNT(DISTINCT bd.BookId) AS UniqueBooksBorrowed
FROM Categories c
LEFT JOIN Books b ON c.Id = b.CategoryId
LEFT JOIN BorrowingDetails bd ON b.Id = bd.BookId
GROUP BY c.Name
ORDER BY TimesBorrowed DESC;
GO

-- 27. User activity report
SELECT u.FirstName + ' ' + u.LastName AS UserName,
    COUNT(b.Id) AS TotalBorrowings,
    COUNT(CASE WHEN b.Status = 'Dipinjam' THEN 1 END) AS ActiveBorrowings,
    MAX(b.BorrowDate) AS LastBorrowDate
FROM Users u
LEFT JOIN Borrowings b ON u.Id = b.UserId
GROUP BY u.FirstName, u.LastName
ORDER BY TotalBorrowings DESC;
GO

-- 28. Overdue report
SELECT b.Id AS BorrowingId,
    u.FirstName + ' ' + u.LastName AS UserName,
    b.DueDate,
    DATEDIFF(DAY, b.DueDate, GETDATE()) AS DaysOverdue,
    (SELECT COUNT(*) FROM BorrowingDetails WHERE BorrowingId = b.Id) AS BookCount
FROM Borrowings b
JOIN Users u ON b.UserId = u.Id
WHERE b.Status = 'Dipinjam' AND b.DueDate < GETDATE()
ORDER BY DaysOverdue DESC;
GO

-- ============================================
-- DASHBOARD QUERIES
-- ============================================

-- 29. Dashboard: Key metrics
SELECT 
    (SELECT COUNT(*) FROM Books) AS TotalBooks,
    (SELECT COUNT(*) FROM Categories) AS TotalCategories,
    (SELECT COUNT(*) FROM Users) AS TotalUsers,
    (SELECT COUNT(*) FROM Borrowings WHERE Status = 'Dipinjam') AS ActiveBorrowings,
    (SELECT COUNT(*) FROM Borrowings WHERE Status = 'Dikembalikan') AS CompletedBorrowings,
    (SELECT SUM(Stock) FROM Books) AS TotalStock;
GO

-- 30. Dashboard: Recent activity
SELECT TOP 10 
    'Borrowing' AS ActivityType,
    u.FirstName + ' ' + u.LastName AS UserName,
    b.BorrowDate AS ActivityDate,
    (SELECT COUNT(*) FROM BorrowingDetails WHERE BorrowingId = b.Id) AS BookCount
FROM Borrowings b
JOIN Users u ON b.UserId = u.Id
ORDER BY b.BorrowDate DESC;
GO

-- 31. Dashboard: Low stock alert
SELECT b.Id, b.Title, b.Author, b.Stock
FROM Books b
WHERE b.Stock <= 3
ORDER BY b.Stock ASC;
GO

-- 32. Dashboard: Popular books (top 5)
SELECT TOP 5 b.Title, b.Author, COUNT(bd.BookId) AS BorrowCount
FROM Books b
JOIN BorrowingDetails bd ON b.Id = bd.BookId
GROUP BY b.Title, b.Author
ORDER BY BorrowCount DESC;
GO

-- 33. Dashboard: Active users (top 5)
SELECT TOP 5 u.FirstName + ' ' + u.LastName AS UserName, COUNT(b.Id) AS BorrowingCount
FROM Users u
JOIN Borrowings b ON u.Id = b.UserId
WHERE b.BorrowDate >= DATEADD(MONTH, -1, GETDATE())
GROUP BY u.FirstName, u.LastName
ORDER BY BorrowingCount DESC;
GO

-- 34. Dashboard: Category distribution
SELECT c.Name AS Category, COUNT(b.Id) AS BookCount,
    CAST(COUNT(b.Id) * 100.0 / (SELECT COUNT(*) FROM Books) AS DECIMAL(5,2)) AS Percentage
FROM Categories c
LEFT JOIN Books b ON c.Id = b.CategoryId
GROUP BY c.Name
ORDER BY BookCount DESC;
GO

-- 35. Dashboard: Monthly trend
SELECT YEAR(BorrowDate) AS Year, MONTH(BorrowDate) AS Month, COUNT(*) AS Borrowings
FROM Borrowings
WHERE BorrowDate >= DATEADD(YEAR, -1, GETDATE())
GROUP BY YEAR(BorrowDate), MONTH(BorrowDate)
ORDER BY Year DESC, Month DESC;
GO

PRINT 'Sample queries executed successfully!';
PRINT 'Basic: 5 queries';
PRINT 'Intermediate: 5 queries';
PRINT 'Advanced: 5 queries';
PRINT 'JOIN: 3 queries';
PRINT 'GROUP BY: 2 queries';
PRINT 'AGGREGATE: 4 queries';
PRINT 'REPORT: 4 queries';
PRINT 'DASHBOARD: 7 queries';
