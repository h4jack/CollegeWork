-- Creating Database for Practical Exam paper 2019 question 1(b) called p2_2019.
CREATE DATABASE IF NOT EXISTS p2_2019;

-- using the created database.
USE p2_2019;

-- drop the table book if already exists
DROP TABLE IF EXISTS book;

-- Create a table Book (ISBN-No, Title, Author, Subject, Price).
CREATE TABLE book (
    isbn_no VARCHAR(20) PRIMARY KEY,
    title VARCHAR(100),
    author VARCHAR(50),
    subject VARCHAR(50),
    price DECIMAL(10, 2)
);

-- Populate the table with at least 5 records. 
INSERT INTO book VALUES
('9781234567890', 'Introduction to Quantum Mechanics', 'Richard Feynman', 'Science', 49.99),
('9789876543210', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Arts', 12.99),
('9785555555555', 'Financial Accounting Basics', 'John Smith', 'Commerce', 29.99),
('9781111111111', 'Physics for Beginners', 'Jane Doe', 'Science', 19.99),
('9782222222222', 'Art History: A Visual Journey', 'Emily Brown', 'Arts', 24.99);

-- showing all content of table voter from database p2_2019.
SELECT * FROM book;

-- Then write queries for: 

-- (i) Sorting the books on lexicographic order of their titles.
SELECT * FROM book ORDER BY title ASC;
/* OUTPUT
+---------------+-----------------------------------+---------------------+----------+-------+
| isbn_no       | title                             | author              | subject  | price |
+---------------+-----------------------------------+---------------------+----------+-------+
| 9782222222222 | Art History: A Visual Journey     | Emily Brown         | Arts     | 24.99 |
| 9785555555555 | Financial Accounting Basics       | John Smith          | Commerce | 29.99 |
| 9781234567890 | Introduction to Quantum Mechanics | Richard Feynman     | Science  | 49.99 |
| 9781111111111 | Physics for Beginners             | Jane Doe            | Science  | 19.99 |
| 9789876543210 | The Great Gatsby                  | F. Scott Fitzgerald | Arts     | 12.99 |
+---------------+-----------------------------------+---------------------+----------+-------+
5 rows in set (0.013 sec)
*/

-- (ii) Finding Author’s name for least price book.
SELECT author, price
FROM book
ORDER BY 2
LIMIT 1;
/* OUTPUT
+---------------------+-------+
| author              | price |
+---------------------+-------+
| F. Scott Fitzgerald | 12.99 |
+---------------------+-------+
1 row in set (0.000 sec)
*/