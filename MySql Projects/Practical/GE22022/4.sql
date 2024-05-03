-- Creating Database for Practical Exam paper 2022 GE question 1 called p4g_2022.
CREATE DATABASE IF NOT EXISTS p4g_2022;

-- using the created database.
USE p4g_2022;

-- drop the table voter if already exists
DROP TABLE IF EXISTS emp;
DROP TABLE IF EXISTS dept;

-- Create the following table-
    -- a. EMP(e_ no, e_ name, city, salary, d_ no) 
    -- b. DEPT( d_ no, d_ name) 
CREATE TABLE EMP (
    e_no INT(4),
    e_name VARCHAR(30),
    city VARCHAR(20),
    salary INT(6),
    d_no INT(4)
);

CREATE TABLE DEPT (
    d_no INT(4),
    d_name VARCHAR(20)
);

-- c. Insert 4 records in each table.
INSERT INTO DEPT (d_no, d_name)
VALUES 
    (10, 'HR'),
    (20, 'IT'),
    (30, 'Finance'),
    (40, 'Marketing');

INSERT INTO EMP (e_no, e_name, city, salary, d_no)
VALUES 
    (1, 'John Doe', 'Anytown', 50000, 20),
    (2, 'Jane Smith', 'Mumbai', 60000, 30),
    (3, 'Mike Johnson', 'Delhi', 45000, 10),
    (4, 'Emma Watson', 'Bangalore', 70000, 20),
    (5, 'Lucas Brown', 'Chennai', 40000, 30),
    (6, 'Olivia Davis', 'Hyderabad', 48000, 10),
    (7, 'Noah Wilson', 'Pune', 55000, 20),
    (8, 'Ava Johnson', 'Kolkata', 52000, 30);

-- Showing values of these tables.
SELECT * FROM emp;
SELECT * FROM dept;

    -- d. Show the emp records  highest  to lowest salary of EMP table.
SELECT * FROM EMP
ORDER BY salary DESC;

/* OUTPUT
+------+--------------+-----------+--------+------+
| e_no | e_name       | city      | salary | d_no |
+------+--------------+-----------+--------+------+
|    4 | Emma Watson  | Bangalore |  70000 |   20 |
|    2 | Jane Smith   | Mumbai    |  60000 |   30 |
|    7 | Noah Wilson  | Pune      |  55000 |   20 |
|    8 | Ava Johnson  | Kolkata   |  52000 |   30 |
|    1 | John Doe     | Anytown   |  50000 |   20 |
|    6 | Olivia Davis | Hyderabad |  48000 |   10 |
|    3 | Mike Johnson | Delhi     |  45000 |   10 |
|    5 | Lucas Brown  | Chennai   |  40000 |   30 |
+------+--------------+-----------+--------+------+
8 rows in set (0.000 sec)
*/