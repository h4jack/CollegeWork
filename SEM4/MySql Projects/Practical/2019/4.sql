-- Creating Database for Practical Exam paper 2019 question 1(d) called p4_2019.
CREATE DATABASE IF NOT EXISTS p4_2019;

-- using the created database.
USE p4_2019;

-- drop the table student if already exists
DROP TABLE IF EXISTS student2;
DROP TABLE IF EXISTS student1;

-- Create two tables as: 
    -- STUDENT1 (College-Roll, Name, VILL, Regd-No) 
    -- STUDENT2 (Regd-No, University-Roll)
-- Create STUDENT1 table
CREATE TABLE student1 (
    roll_no INT(5) PRIMARY KEY,
    name VARCHAR(30),
    vill VARCHAR(20),
    regd_no VARCHAR(16) UNIQUE
);

-- Create STUDENT2 table
CREATE TABLE student2 (
    regd_no VARCHAR(16) PRIMARY KEY,
    univ_roll BIGINT(12),
    FOREIGN KEY (regd_no) REFERENCES student1 (regd_no)
);

-- Populate the table with at least 5 records. 
-- Insert sample data into STUDENT1
INSERT INTO student1
VALUES
    (101, 'Alice', 'saturi', '01202 of 2022-23'),
    (102, 'Bob', 'mejin', '01203 of 2022-23'),
    (103, 'Charlie', 'barustor', '01204 of 2022-23');
-- Insert sample data into STUDENT2
INSERT INTO student2
VALUES
    ('01202 of 2022-23', 22023647881),
    ('01203 of 2022-23', 22023647882),
    ('01204 of 2022-23', 22023647883);

-- showing all content of table voter from database p4_2019.
SELECT * FROM student1;
SELECT * FROM student2;
 
-- Then write a query to display studentwise college-Roll and University-Roll.
select name, s1.roll_no, univ_roll
from student1 s1, student2 s2
where s1.regd_no = s2.regd_no;

-- OR
select name, s1.roll_no, univ_roll
from student1 s1
JOIN student2 s2 ON s1.regd_no = s2.regd_no;

/* OUTPUT
+---------+---------+-------------+
| name    | roll_no | univ_roll   |
+---------+---------+-------------+
| Alice   |     101 | 22023647881 |
| Bob     |     102 | 22023647882 |
| Charlie |     103 | 22023647883 |
+---------+---------+-------------+
3 rows in set (0.001 sec)
*/