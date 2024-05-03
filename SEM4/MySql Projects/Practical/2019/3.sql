-- Creating Database for Practical Exam paper 2019 question 1(c) called p3_2019.
CREATE DATABASE IF NOT EXISTS p3_2019;

-- using the created database.
USE p3_2019;

-- drop the table student if already exists
DROP TABLE IF EXISTS student;

-- Create a table STUDENT (Roll-No, Name, Subject1, Subject2, Subject3, Date-of-Birth).
CREATE TABLE student (
    roll_no INT(5) PRIMARY KEY,
    name VARCHAR(30),
    sub1 VARCHAR(20),
    sub2 VARCHAR(20),
    sub3 VARCHAR(20),
    dob DATE
);

-- Populate the table with at least 5 records. 
INSERT INTO student
VALUES
    (101, 'Alice', 'Math', 'Zoology', 'English', '2000-03-15'), -- Age > 20
    (102, 'Bob', 'History', 'History', 'Geography', '2002-05-10'), -- Age <= 20
    (103, 'Charlie', 'Math', 'Physics', 'Chemistry', '2003-08-20'), -- Age <= 20
    (104, 'David', 'English', 'Botany', 'Biology', '1999-11-05'), -- Age > 20
    (105, 'Eve', 'Math', 'Computer Science', 'Art', '2006-02-25'), -- Age <= 18
    (106, 'Frank', 'Math', 'Economics', 'Psychology', '2004-01-12'); -- Age <= 20

-- showing all content of table voter from database p3_2019.
SELECT * FROM student;

-- Then write queries for: 

-- Name of all students having age ≥ 20 years.
SELECT name FROM student WHERE TIMESTAMPDIFF(YEAR, dob, CURDATE()) >= 20; 

/* OUTPUT
+---------+
| name    |
+---------+
| Alice   |
| Bob     |
| Charlie |
| David   |
| Frank   |
+---------+
5 rows in set (0.000 sec)
*/

-- Roll-No. of all students having Mathematics subject.
SELECT roll_no, name FROM student WHERE 'math' IN (sub1, sub2, sub3);

/* OUTPUT
+---------+---------+
| roll_no | name    |
+---------+---------+
|     101 | Alice   |
|     103 | Charlie |
|     105 | Eve     |
|     106 | Frank   |
+---------+---------+
4 rows in set (0.000 sec)
*/