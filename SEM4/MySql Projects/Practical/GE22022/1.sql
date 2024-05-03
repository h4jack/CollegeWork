-- Creating Database for Practical Exam paper 2022 GE question 1 called p1g_2022.
CREATE DATABASE IF NOT EXISTS p1g_2022;

-- using the created database.
USE p1g_2022;

-- drop the table voter if already exists
DROP TABLE IF EXISTS table1;
DROP TABLE IF EXISTS table2;


-- Create the two tables given below-
    -- Table1 (code_no,name,position, salary) 
    -- Table2  (code_no,Dept, Branch)
CREATE TABLE table1(
    code_no INT(5),
    name VARCHAR(30),
    position VARCHAR(10),
    salary INT(8)
);

CREATE TABLE table2(
    code_no INT(5),
    dept VARCHAR(20),
    branch VARCHAR(20)
);


-- Inserting Values to Tables.
INSERT INTO table1 VALUES
(1, 'John Doe', 'Officer', 25000),
(2, 'Jane Doe', 'Manager', 40000),
(3, 'Alice Smith', 'Officer', 28000),
(4, 'Bob Johnson', 'Clerk', 20000),
(5, 'Mike Brown', 'Officer', 30000),
(6, 'Emily Davis', 'Manager', 45000),
(7, 'Sarah Lee', 'Officer', 29000),
(8, 'Kevin White', 'Clerk', 22000),
(9, 'Lisa Nguyen', 'Officer', 31000),
(10, 'David Kim', 'Manager', 48000);

INSERT INTO table2 VALUES
(1, 'Secratory', 'Indas'),
(2, 'Sales', 'New York'),
(3, 'Admin', 'Namour'),
(4, 'HR', 'Chicago'),
(5, 'Admin', 'Indas'),
(6, 'Marketing', 'Los Angeles'),
(7, 'Manager', 'Indas'),
(8, 'IT', 'Dallas'),
(9, 'Admin', 'Kalichi'),
(10, 'Finance', 'San Francisco');

-- Showing the values of records which inserted.
SELECT * FROM table1;
SELECT * FROM table2;

-- Write the SQL query required for  the following problems-
-- a. Show the name, position and department of those Emp. Working  at the indas branch and belonging to the position  of officer.
SELECT name, position, dept
FROM table1 t1
JOIN table2 t2 ON t1.code_no = t2.code_no
WHERE t2.branch = 'Indas'
AND t1.position = 'Officer';

-- OR
SELECT name, position, dept
FROM table1 t1, table2 t2
WHERE t1.code_no = t2.code_no
AND t2.branch = 'Indas'
AND t1.position = 'Officer';

/* OUTPUT
+-------------+----------+-------+
| name        | position | dept  |
+-------------+----------+-------+
| John Doe    | Officer  | Admin |
| Alice Smith | Officer  | Admin |
| Mike Brown  | Officer  | Admin |
| Sarah Lee   | Officer  | Admin |
| Lisa Nguyen | Officer  | Admin |
+-------------+----------+-------+
5 rows in set (0.001 sec)
*/

-- b. Put on display the Name and salary of those Emp. With salary is above  30000.
SELECT name, salary FROM table1
WHERE salary > 30000;

/* OUTPUT
+-------------+--------+
| name        | salary |
+-------------+--------+
| Jane Doe    |  40000 |
| Emily Davis |  45000 |
| Lisa Nguyen |  31000 |
| David Kim   |  48000 |
+-------------+--------+
4 rows in set (0.001 sec)
*/

-- c. Put on show the dept. And branch of  the ‘Admin’ dept.
SELECT dept, branch FROM table2 t2
JOIN table1 t1 ON t2.code_no = t1.code_no
WHERE t2.dept = 'Admin';

/* OUTPUT
+-------+---------+
| dept  | branch  |
+-------+---------+
| Admin | Namour  |
| Admin | Indas   |
| Admin | Kalichi |
+-------+---------+
3 rows in set (0.000 sec)
*/