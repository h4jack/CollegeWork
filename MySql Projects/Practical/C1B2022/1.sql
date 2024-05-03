-- Creating Database for Practical Exam paper 2022 Programme question 1 called p1p_2022.
CREATE DATABASE IF NOT EXISTS p1p_2022;

-- using the created database.
USE p1p_2022;

-- drop the table voter if already exists
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS marks;


-- Create the following tables 
    -- Student(Roll , Name, Dateofbirth, Mobile, DepartmentName). 
    -- Department(DepID, DepartmentName, HOD) 
    -- Marks(Roll,DepID,Sub1,Sub2,Sub3) 
    
-- Creating Student Table.
CREATE TABLE student(
    roll INT(4) PRIMARY KEY,
    name VARCHAR(30),
    dob DATE,
    mobile BIGINT(10),
    dept VARCHAR(20)
);

-- Creating Department Table.
CREATE TABLE department(
    depid INT(4) PRIMARY KEY,
    dname VARCHAR(20),
    hod VARCHAR(30)
);

-- Creating Marks Table.
CREATE TABLE marks(
    roll INT(4) PRIMARY KEY,
    depid INT(4),
    sub1 INT(3),
    sub2 INT(3),
    sub3 INT(3)
);

-- Inserting Values to these tables
INSERT INTO student VALUES
(11, 'Souvik', '2003-03-18', 7086573798, 'Computer Science'),
(12, 'Nayantara', '2004-07-9', 7026573792, 'Math'),
(13, 'Tapal', '2005-04-16', 7086583793, 'Computer Science'),
(14, 'Basui', '2002-03-1', 7086373748, 'Zoology'),
(15, 'Suhana', '2003-11-21', 7026773753, 'Math'),
(16, 'Sujoy', '2004-06-18', 7886573698, 'Computer Science'),
(17, 'Debika', '2005-01-8', 7086273791, 'Zoology');

INSERT INTO department VALUES
(21, 'Computer Science', 'HOD H1 CS'),
(22, 'Math', 'HOD H2 MATH'),
(23, 'Zoology', 'HOD H3 Zoology');

INSERT INTO marks VALUES
(11, 21, 58, 98, 88),
(12, 22, 96, 92, 42),
(13, 21, 73, 93, 53),
(14, 23, 58, 48, 98),
(15, 22, 78, 75, 85),
(16, 21, 99, 98, 68),
(17, 23, 51, 91, 61);

-- Showing Contents/Records of these tables.
SELECT * FROM student;
SELECT * FROM department;
SELECT * FROM marks;

-- Write down the following queries in SQL: 
-- i) Display Roll, Name and Department of all students.
SELECT roll AS 'Roll No', name AS 'Name', dept AS 'Department' FROM student;

/* OUTPUT
+------+-----------+------------------+
| roll | name      | dept             |
+------+-----------+------------------+
|   11 | Souvik    | Computer Science |
|   12 | Nayantara | Math             |
|   13 | Tapal     | Computer Science |
|   14 | Basui     | Zoology          |
|   15 | Suhana    | Math             |
|   16 | Sujoy     | Computer Science |
|   17 | Debika    | Zoology          |
+------+-----------+------------------+
7 rows in set (0.000 sec)
*/

-- ii) Display Name, HOD of all students. 
SELECT name AS 'Name', hod AS 'Head of Department'
FROM student s
JOIN marks m ON m.roll = s.roll
JOIN department d ON d.depid = m.depid;

-- OR
SELECT name AS 'Name', hod AS 'Head of Department'
FROM student s, marks m, department d
WHERE m.roll = s.roll
AND d.depid = m.depid;

/* OUTPUT
+-----------+--------------------+
| Name      | Head of Department |
+-----------+--------------------+
| Souvik    | HOD H1 CS          |
| Tapal     | HOD H1 CS          |
| Sujoy     | HOD H1 CS          |
| Nayantara | HOD H2 MATH        |
| Suhana    | HOD H2 MATH        |
| Basui     | HOD H3 Zoology     |
| Debika    | HOD H3 Zoology     |
+-----------+--------------------+
7 rows in set (0.001 sec)
*/

-- iii) Display Roll, Name and aggregate marks of all students.
SELECT
    m.roll AS 'Roll No',
    name AS 'Name',
    sub1 AS 'Subject1',
    sub2 AS 'Subject2',
    sub3 AS 'Subject3',
    (sub1 + sub2 + sub3) AS 'Total'
FROM marks m
JOIN student s ON m.roll = s.roll;

-- OR
SELECT
    m.roll AS 'Roll No',
    name AS 'Name',
    sub1 AS 'Subject1',
    sub2 AS 'Subject2',
    sub3 AS 'Subject3',
    (sub1 + sub2 + sub3) AS 'Total'
FROM marks m, student s 
WHERE m.roll = s.roll;

/* OUTPUT
+---------+-----------+----------+----------+----------+-------+
| Roll No | Name      | Subject1 | Subject2 | Subject3 | Total |
+---------+-----------+----------+----------+----------+-------+
|      11 | Souvik    |       58 |       98 |       88 |   244 |
|      12 | Nayantara |       96 |       92 |       42 |   230 |
|      13 | Tapal     |       73 |       93 |       53 |   219 |
|      14 | Basui     |       58 |       48 |       98 |   204 |
|      15 | Suhana    |       78 |       75 |       85 |   238 |
|      16 | Sujoy     |       99 |       98 |       68 |   265 |
|      17 | Debika    |       51 |       91 |       61 |   203 |
+---------+-----------+----------+----------+----------+-------+
7 rows in set (0.000 sec)
*/

-- iv) Display Roll, Name of all students who born after 12-02-1995.
SELECT roll, Name FROM student
WHERE dob > '2004-02-12';

/* OUTPUT
+------+-----------+
| roll | Name      |
+------+-----------+
|   12 | Nayantara |
|   13 | Tapal     |
|   16 | Sujoy     |
|   17 | Debika    |
+------+-----------+
4 rows in set (0.000 sec)
*/