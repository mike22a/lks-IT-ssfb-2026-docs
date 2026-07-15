-- Digital Library Seed Data
-- SQL Server 2022
-- Version: 1.0

USE DigitalLibrary;
GO

-- Insert Categories
INSERT INTO Categories (Name, Description) VALUES
('Fiction', 'Buku fiksi dan novel'),
('Science', 'Buku sains dan teknologi'),
('History', 'Buku sejarah'),
('Biography', 'Buku biografi'),
('Technology', 'Buku teknologi dan programming'),
('Business', 'Buku bisnis dan manajemen'),
('Self-Help', 'Buku pengembangan diri'),
('Children', 'Buku anak-anak'),
('Education', 'Buku pendidikan'),
('Health', 'Buku kesehatan');
GO

-- Insert Users (10 users)
INSERT INTO Users (FirstName, LastName, Email, Phone, Address) VALUES
('John', 'Doe', 'john.doe@email.com', '081234567890', 'Jl. Sudirman No. 1, Jakarta'),
('Jane', 'Smith', 'jane.smith@email.com', '081234567891', 'Jl. Thamrin No. 2, Jakarta'),
('Bob', 'Johnson', 'bob.johnson@email.com', '081234567892', 'Jl. Gatot Subroto No. 3, Jakarta'),
('Alice', 'Williams', 'alice.williams@email.com', '081234567893', 'Jl. Rasuna Said No. 4, Jakarta'),
('Charlie', 'Brown', 'charlie.brown@email.com', '081234567894', 'Jl. MH Thamrin No. 5, Jakarta'),
('Diana', 'Prince', 'diana.prince@email.com', '081234567895', 'Jl. Sudirman No. 6, Jakarta'),
('Edward', 'Stark', 'edward.stark@email.com', '081234567896', 'Jl. Gatot Subroto No. 7, Jakarta'),
('Fiona', 'Garcia', 'fiona.garcia@email.com', '081234567897', 'Jl. Thamrin No. 8, Jakarta'),
('George', 'Miller', 'george.miller@email.com', '081234567898', 'Jl. Rasuna Said No. 9, Jakarta'),
('Hannah', 'Davis', 'hannah.davis@email.com', '081234567899', 'Jl. Sudirman No. 10, Jakarta');
GO

-- Insert Books (50 books)
INSERT INTO Books (CategoryId, Title, Author, Publisher, Year, ISBN, Stock) VALUES
-- Fiction (10 books)
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Scribner', 1925, '9780743273565', 5),
(1, 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott & Co.', 1960, '9780061120084', 4),
(1, '1984', 'George Orwell', 'Secker & Warburg', 1949, '9780451524935', 6),
(1, 'Pride and Prejudice', 'Jane Austen', 'T. Egerton', 1813, '9780141439518', 3),
(1, 'The Catcher in the Rye', 'J.D. Salinger', 'Little, Brown and Company', 1951, '9780316769488', 4),
(1, 'The Hobbit', 'J.R.R. Tolkien', 'George Allen & Unwin', 1937, '9780547928227', 7),
(1, 'Fahrenheit 451', 'Ray Bradbury', 'Ballantine Books', 1953, '9781451673319', 5),
(1, 'The Lord of the Rings', 'J.R.R. Tolkien', 'George Allen & Unwin', 1954, '9780544003415', 3),
(1, 'Brave New World', 'Aldous Huxley', 'Chatto & Windus', 1932, '9780060850524', 4),
(1, 'The Alchemist', 'Paulo Coelho', 'HarperCollins', 1988, '9780062315007', 8),

-- Science (10 books)
(2, 'A Brief History of Time', 'Stephen Hawking', 'Bantam Books', 1988, '9780553380163', 5),
(2, 'The Selfish Gene', 'Richard Dawkins', 'Oxford University Press', 1976, '9780199291151', 4),
(2, 'Cosmos', 'Carl Sagan', 'Random House', 1980, '9780345331359', 6),
(2, 'The Origin of Species', 'Charles Darwin', 'John Murray', 1859, '9780140432051', 3),
(2, 'The Structure of Scientific Revolutions', 'Thomas Kuhn', 'University of Chicago Press', 1962, '9780226458083', 4),
(2, 'A Short History of Nearly Everything', 'Bill Bryson', 'Broadway Books', 2003, '9780767908224', 7),
(2, 'The Gene', 'Siddhartha Mukherjee', 'Scribner', 2016, '9781476733500', 5),
(2, 'Astrophysics for People in a Hurry', 'Neil deGrasse Tyson', 'W.W. Norton & Company', 2017, '9780393609394', 6),
(2, 'The Elegant Universe', 'Brian Greene', 'W.W. Norton & Company', 1999, '9780375708114', 4),
(2, 'Silent Spring', 'Rachel Carson', 'Houghton Mifflin', 1962, '9780618249060', 5),

-- History (10 books)
(3, 'Sapiens', 'Yuval Noah Harari', 'Harper', 2011, '9780062316097', 8),
(3, 'Guns, Germs, and Steel', 'Jared Diamond', 'W.W. Norton & Company', 1997, '9780393317558', 5),
(3, 'The History of the Ancient World', 'Susan Wise Bauer', 'W.W. Norton & Company', 2007, '9780393059748', 4),
(3, 'A People''s History of the United States', 'Howard Zinn', 'HarperCollins', 1980, '9780062397348', 6),
(3, 'The Silk Roads', 'Peter Frankopan', 'Bloomsbury', 2015, '9781408843961', 5),
(3, 'The Decline and Fall of the Roman Empire', 'Edward Gibbon', 'Strahan & Cadell', 1776, '9780140437644', 3),
(3, 'The History of the Medieval World', 'Susan Wise Bauer', 'W.W. Norton & Company', 2010, '9780393059755', 4),
(3, 'The Guns of August', 'Barbara Tuchman', 'Macmillan', 1962, '9780345386236', 5),
(3, 'A History of the World in 6 Glasses', 'Tom Standage', 'Walker & Company', 2005, '9780802715524', 7),
(3, 'The History of the World', 'Andrew Marr', 'Macmillan', 2012, '9780230755906', 4),

-- Technology (10 books)
(5, 'Clean Code', 'Robert C. Martin', 'Prentice Hall', 2008, '9780132350884', 10),
(5, 'The Pragmatic Programmer', 'Andrew Hunt', 'Addison-Wesley', 1999, '9780201616224', 8),
(5, 'Design Patterns', 'Erich Gamma', 'Addison-Wesley', 1994, '9780201633610', 6),
(5, 'Refactoring', 'Martin Fowler', 'Addison-Wesley', 1999, '9780201485677', 7),
(5, 'The Mythical Man-Month', 'Frederick Brooks', 'Addison-Wesley', 1975, '9780201835953', 5),
(5, 'Code Complete', 'Steve McConnell', 'Microsoft Press', 1993, '9780735619678', 6),
(5, 'Introduction to Algorithms', 'Thomas Cormen', 'MIT Press', 1990, '9780262033848', 4),
(5, 'Structure and Interpretation', 'Harold Abelson', 'MIT Press', 1985, '9780262510875', 3),
(5, 'The C Programming Language', 'Brian Kernighan', 'Prentice Hall', 1978, '9780131103627', 8),
(5, 'Effective Java', 'Joshua Bloch', 'Addison-Wesley', 2001, '9780134685991', 7),

-- Business (5 books)
(6, 'The Lean Startup', 'Eric Ries', 'Crown Business', 2011, '9780307887894', 6),
(6, 'Thinking, Fast and Slow', 'Daniel Kahneman', 'Farrar, Straus and Giroux', 2011, '9780374533557', 5),
(6, 'The 4-Hour Workweek', 'Tim Ferriss', 'Crown Publishing Group', 2007, '9780307465351', 7),
(6, 'Zero to One', 'Peter Thiel', 'Crown Business', 2014, '9780804139298', 4),
(6, 'Good to Great', 'Jim Collins', 'HarperCollins', 2001, '9780066620991', 5),

-- Self-Help (5 books)
(7, 'Atomic Habits', 'James Clear', 'Avery', 2018, '9780735211292', 9),
(7, 'Deep Work', 'Cal Newport', 'Grand Central Publishing', 2016, '9781455586691', 6),
(7, 'The Power of Now', 'Eckhart Tolle', 'New World Library', 1997, '9781577314806', 5),
(7, 'Mindset', 'Carol Dweck', 'Random House', 2006, '9781583334239', 7),
(7, 'The 7 Habits', 'Stephen Covey', 'Free Press', 1989, '9780743269513', 8);
GO

-- Insert Borrowings (20 borrowings)
INSERT INTO Borrowings (UserId, BorrowDate, DueDate, ReturnDate, Status) VALUES
(1, '2026-01-01', '2026-01-08', '2026-01-07', 'Dikembalikan'),
(1, '2026-01-10', '2026-01-17', NULL, 'Dipinjam'),
(2, '2026-01-02', '2026-01-09', '2026-01-08', 'Dikembalikan'),
(2, '2026-01-11', '2026-01-18', NULL, 'Dipinjam'),
(3, '2026-01-03', '2026-01-10', '2026-01-09', 'Dikembalikan'),
(3, '2026-01-12', '2026-01-19', NULL, 'Dipinjam'),
(4, '2026-01-04', '2026-01-11', '2026-01-10', 'Dikembalikan'),
(4, '2026-01-13', '2026-01-20', NULL, 'Dipinjam'),
(5, '2026-01-05', '2026-01-12', '2026-01-11', 'Dikembalikan'),
(5, '2026-01-14', '2026-01-21', NULL, 'Dipinjam'),
(6, '2026-01-06', '2026-01-13', '2026-01-12', 'Dikembalikan'),
(6, '2026-01-15', '2026-01-22', NULL, 'Dipinjam'),
(7, '2026-01-07', '2026-01-14', '2026-01-13', 'Dikembalikan'),
(7, '2026-01-16', '2026-01-23', NULL, 'Dipinjam'),
(8, '2026-01-08', '2026-01-15', '2026-01-14', 'Dikembalikan'),
(8, '2026-01-17', '2026-01-24', NULL, 'Dipinjam'),
(9, '2026-01-09', '2026-01-16', '2026-01-15', 'Dikembalikan'),
(9, '2026-01-18', '2026-01-25', NULL, 'Dipinjam'),
(10, '2026-01-10', '2026-01-17', '2026-01-16', 'Dikembalikan'),
(10, '2026-01-19', '2026-01-26', NULL, 'Dipinjam');
GO

-- Insert BorrowingDetails (60 borrowing details)
-- Each borrowing has 3 books (max allowed)
INSERT INTO BorrowingDetails (BorrowingId, BookId, Quantity) VALUES
-- Borrowing 1 (User 1, Returned)
(1, 1, 1), (1, 11, 1), (1, 21, 1),
-- Borrowing 2 (User 1, Active)
(2, 2, 1), (2, 12, 1), (2, 22, 1),
-- Borrowing 3 (User 2, Returned)
(3, 3, 1), (3, 13, 1), (3, 23, 1),
-- Borrowing 4 (User 2, Active)
(4, 4, 1), (4, 14, 1), (4, 24, 1),
-- Borrowing 5 (User 3, Returned)
(5, 5, 1), (5, 15, 1), (5, 25, 1),
-- Borrowing 6 (User 3, Active)
(6, 6, 1), (6, 16, 1), (6, 26, 1),
-- Borrowing 7 (User 4, Returned)
(7, 7, 1), (7, 17, 1), (7, 27, 1),
-- Borrowing 8 (User 4, Active)
(8, 8, 1), (8, 18, 1), (8, 28, 1),
-- Borrowing 9 (User 5, Returned)
(9, 9, 1), (9, 19, 1), (9, 29, 1),
-- Borrowing 10 (User 5, Active)
(10, 10, 1), (10, 20, 1), (10, 30, 1),
-- Borrowing 11 (User 6, Returned)
(11, 31, 1), (11, 32, 1), (11, 33, 1),
-- Borrowing 12 (User 6, Active)
(12, 34, 1), (12, 35, 1), (12, 36, 1),
-- Borrowing 13 (User 7, Returned)
(13, 37, 1), (13, 38, 1), (13, 39, 1),
-- Borrowing 14 (User 7, Active)
(14, 41, 1), (14, 42, 1), (14, 43, 1),
-- Borrowing 15 (User 8, Returned)
(15, 44, 1), (15, 45, 1), (15, 46, 1),
-- Borrowing 16 (User 8, Active)
(16, 47, 1), (16, 48, 1), (16, 49, 1),
-- Borrowing 17 (User 9, Returned)
(17, 51, 1), (17, 52, 1), (17, 53, 1),
-- Borrowing 18 (User 9, Active)
(18, 54, 1), (18, 55, 1), (18, 56, 1),
-- Borrowing 19 (User 10, Returned)
(19, 57, 1), (19, 58, 1), (19, 59, 1),
-- Borrowing 20 (User 10, Active)
(20, 61, 1), (20, 62, 1), (20, 63, 1);
GO

PRINT 'Seed data inserted successfully!';
PRINT 'Categories: 10';
PRINT 'Users: 10';
PRINT 'Books: 50';
PRINT 'Borrowings: 20';
PRINT 'BorrowingDetails: 60';
