-- Creating Database for Practical Exam paper 2022 GE question 1 called p2g_2022.
CREATE DATABASE IF NOT EXISTS p2g_2022;

-- using the created database.
USE p2g_2022;

-- drop the table voter if already exists
DROP TABLE IF EXISTS student;

-- Create the following table-    
    -- a. student (name, roll, reg_no, dept)
CREATE TABLE student(
    name VARCHAR(30),
    roll INT(4),
    reg_no VARCHAR(12),
    dept VARCHAR(25)
);

    -- b. enter three records in student table 
INSERT INTO student VALUES
('John Doe', 1, '123456789012', 'Computer Science'),
('Jane Smith', 2, '234567890123', 'Electrical Engineering'),
('Mike Johnson', 3, '345678901234', 'Mechanical Engineering');

    -- Showing tables values of all columns.
SELECT * FROM student;

    -- c. delete  the record for the student whose roll=2 
DELETE FROM student WHERE roll=2;

/* OUTPUT
Query OK, 1 row affected (0.013 sec)

-- TABLE VIEW
+--------------+------+--------------+------------------------+
| name         | roll | reg_no       | dept                   |
+--------------+------+--------------+------------------------+
| John Doe     |    1 | 123456789012 | Computer Science       |
| Mike Johnson |    3 | 345678901234 | Mechanical Engineering |
+--------------+------+--------------+------------------------+
2 rows in set (0.000 sec)
*/

    -- d. insert a new column ‘address’ in the student table.
ALTER TABLE student
ADD address VARCHAR(20);

/* OUTPUT
Query OK, 0 rows affected (0.017 sec)
Records: 0  Duplicates: 0  Warnings: 0

-- TABLE VIEW
+--------------+------+--------------+------------------------+---------+
| name         | roll | reg_no       | dept                   | address |
+--------------+------+--------------+------------------------+---------+
| John Doe     |    1 | 123456789012 | Computer Science       | NULL    |
| Mike Johnson |    3 | 345678901234 | Mechanical Engineering | NULL    |
+--------------+------+--------------+------------------------+---------+
2 rows in set (0.001 sec)
*/