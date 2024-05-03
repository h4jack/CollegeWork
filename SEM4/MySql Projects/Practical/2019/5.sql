-- Creating Database for Practical Exam paper 2019 question 1(e) called p5_2019.
CREATE DATABASE IF NOT EXISTS p5_2019;

-- using the created database.
USE p5_2019;

-- drop the table student if already exists
DROP TABLE IF EXISTS student2;
DROP TABLE IF EXISTS student1;
DROP TABLE IF EXISTS student3;

-- Create two tables as: 
    -- STUDENT1 (College-Roll, Name, VILL, Regd-No) 
    -- STUDENT2 (Regd-No, University-Roll)
    -- STUDENT3 (University-Roll, CGPA)
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

-- Create STUDENT3 table
CREATE TABLE student3 (
    univ_roll BIGINT PRIMARY KEY,
    cgpa DECIMAL(4, 2)
);

-- Populate the table with at least 5 records. 
-- Insert 10 records into STUDENT1 table
INSERT INTO student1 VALUES
(100, 'John Doe', 'Village1', '01202 of 2022-23'),
 (101, 'Jane Smith', 'Village2', '01203 of 2022-23'),
 (102, 'Mike Johnson', 'Village3', '01204 of 2022-23'),
 (103, 'Alice Davis', 'Village4', '01205 of 2022-23'),
 (104, 'Bob Brown', 'Village5', '01206 of 2022-23'),
 (105, 'Charlie Green', 'Village6', '01207 of 2022-23'),
 (106, 'David Black', 'Village7', '01208 of 2022-23'),
 (107, 'Eve White', 'Village8', '01209 of 2022-23'),
 (108, 'Frank Blue', 'Village9', '01210 of 2022-23'),
 (109, 'Grace Red', 'Village10', '01211 of 2022-23');

-- Insert 10 records into STUDENT2 table
INSERT INTO student2 VALUES
('01202 of 2022-23', 22023124382),
('01203 of 2022-23', 22023124383),
('01204 of 2022-23', 22023124384),
('01205 of 2022-23', 22023124385),
('01206 of 2022-23', 22023124386),
('01207 of 2022-23', 22023124387),
('01208 of 2022-23', 22023124388),
('01209 of 2022-23', 22023124389),
('01210 of 2022-23', 22023124390),
('01211 of 2022-23', 22023124391);

-- Insert 10 records into STUDENT3 table
INSERT INTO student3 VALUES
(22023124382, 4.8),
(22023124383, 3.9),
(22023124384, 6.9),
(22023124385, 7.7),
(22023124386, 8.5),
(22023124387, 4.7),
(22023124388, 3.6),
(22023124389, 5.3),
(22023124390, 4.2),
(22023124391, 3.1);

-- showing all content of table voter from database p5_2019.
SELECT * FROM student1;
SELECT * FROM student2;
SELECT * FROM student3;


-- write a query to display CGPA of students with respect to their College-Rolls. 

select name, s1.roll_no, s2.univ_roll, cgpa
from student1 s1
JOIN student2 s2 ON s1.regd_no = s2.regd_no
JOIN student3 s3 ON s2.univ_roll = s3.univ_roll;

-- OR
select name, s1.roll_no, s2.univ_roll, cgpa
from student1 s1, student2 s2, student3 s3
WHERE s2.univ_roll = s3.univ_roll
and s1.regd_no = s2.regd_no;

/* OUTPUT
+---------------+---------+-------------+------+
| name          | roll_no | univ_roll   | cgpa |
+---------------+---------+-------------+------+
| John Doe      |     100 | 22023124382 | 4.80 |
| Jane Smith    |     101 | 22023124383 | 3.90 |
| Mike Johnson  |     102 | 22023124384 | 6.90 |
| Alice Davis   |     103 | 22023124385 | 7.70 |
| Bob Brown     |     104 | 22023124386 | 8.50 |
| Charlie Green |     105 | 22023124387 | 4.70 |
| David Black   |     106 | 22023124388 | 3.60 |
| Eve White     |     107 | 22023124389 | 5.30 |
| Frank Blue    |     108 | 22023124390 | 4.20 |
| Grace Red     |     109 | 22023124391 | 3.10 |
+---------------+---------+-------------+------+
10 rows in set (0.001 sec)
*/