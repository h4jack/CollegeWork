-- Creating Database for Practical Exam paper 2022 GE question 1 called p3g_2022.
CREATE DATABASE IF NOT EXISTS p3g_2022;

-- using the created database.
USE p3g_2022;

-- drop the table voter if already exists
DROP TABLE IF EXISTS student;

-- Create the following table-
    -- student (roll, name, city, class, section, marks)
CREATE TABLE student(
    roll INT(4),
    name VARCHAR(30),
    city VARCHAR(20),
    class VARCHAR(6),
    section VARCHAR(1),
    marks INT(3)
);

-- Inserting Values to the table student. 
INSERT INTO student (roll, name, city, class, section, marks)
VALUES 
    (1, 'John Doe', 'Anytown', 'X', 'A', 85),
    (2, 'Jane Doe', 'Anytown', 'XII', 'B', 90),
    (3, 'Mike Scoot', 'Anytown', 'XI', 'C', 80),
    (4, 'Emma Watt', 'Anytown', 'IX', 'A', 95),
    (5, 'Lucas Brown', 'Anytown', 'XII', 'B', 75),
    (6, 'Olivia Davis', 'Anytown', 'X', 'C', 88),
    (7, 'Noah Whilskit', 'Anytown', 'XI', 'A', 92),
    (8, 'Ava Mark', 'Anytown', 'X', 'B', 85),
    (9, 'Ethan Brown', 'Anytown', 'IX', 'C', 78),
    (10, 'Sophia Davis', 'Anytown', 'IX', 'A', 95);

-- Showing values of these tables.
SELECT * FROM student;

-- Write the SQL query  for the following problems.

-- a. Write the Name ,class, and section of the having T as the last letter in their name. 
SELECT name, class, section
FROM student
WHERE name LIKE '%T';

/* OUTPUT
+---------------+-------+---------+
| name          | class | section |
+---------------+-------+---------+
| Mike Scoot    | XI    | C       |
| Emma Watt     | IX    | A       |
| Noah Whilskit | XI    | A       |
+---------------+-------+---------+
3 rows in set (0.001 sec)
*/

-- b. Write the code for updating the city as Mumbai of the student with roll no is 10 
UPDATE student
SET city='Mumbai'
WHERE roll=10;

/* TABLE AFTER THIS QUERY
+------+---------------+---------+-------+---------+-------+
| roll | name          | city    | class | section | marks |
+------+---------------+---------+-------+---------+-------+
|    1 | John Doe      | Anytown | X     | A       |    85 |
|    2 | Jane Doe      | Anytown | XII   | B       |    90 |
|    3 | Mike Scoot    | Anytown | XI    | C       |    80 |
|    4 | Emma Watt     | Anytown | IX    | A       |    95 |
|    5 | Lucas Brown   | Anytown | XII   | B       |    75 |
|    6 | Olivia Davis  | Anytown | X     | C       |    88 |
|    7 | Noah Whilskit | Anytown | XI    | A       |    92 |
|    8 | Ava Mark      | Anytown | X     | B       |    85 |
|    9 | Ethan Brown   | Anytown | IX    | C       |    78 |
|   10 | Sophia Davis  | Mumbai  | IX    | A       |    95 |
+------+---------------+---------+-------+---------+-------+
10 rows in set (0.001 sec)
*/

-- c. Change the name of the field named city  into address in the student table. 
ALTER TABLE student CHANGE city address VARCHAR(20);

/* TABLE VIEW AFTER THIS VIEW
+------+---------------+---------+-------+---------+-------+
| roll | name          | address | class | section | marks |
+------+---------------+---------+-------+---------+-------+
|    1 | John Doe      | Anytown | X     | A       |    85 |
|    2 | Jane Doe      | Anytown | XII   | B       |    90 |
|    3 | Mike Scoot    | Anytown | XI    | C       |    80 |
|    4 | Emma Watt     | Anytown | IX    | A       |    95 |
|    5 | Lucas Brown   | Anytown | XII   | B       |    75 |
|    6 | Olivia Davis  | Anytown | X     | C       |    88 |
|    7 | Noah Whilskit | Anytown | XI    | A       |    92 |
|    8 | Ava Mark      | Anytown | X     | B       |    85 |
|    9 | Ethan Brown   | Anytown | IX    | C       |    78 |
|   10 | Sophia Davis  | Mumbai  | IX    | A       |    95 |
+------+---------------+---------+-------+---------+-------+
10 rows in set (0.001 sec)
*/

-- d. Delete the field name section in the student table. 
ALTER TABLE student
DROP COLUMN section;

/* TABLE VIEW AFTER THIS QUERY
+------+---------------+---------+-------+-------+
| roll | name          | address | class | marks |
+------+---------------+---------+-------+-------+
|    1 | John Doe      | Anytown | X     |    85 |
|    2 | Jane Doe      | Anytown | XII   |    90 |
|    3 | Mike Scoot    | Anytown | XI    |    80 |
|    4 | Emma Watt     | Anytown | IX    |    95 |
|    5 | Lucas Brown   | Anytown | XII   |    75 |
|    6 | Olivia Davis  | Anytown | X     |    88 |
|    7 | Noah Whilskit | Anytown | XI    |    92 |
|    8 | Ava Mark      | Anytown | X     |    85 |
|    9 | Ethan Brown   | Anytown | IX    |    78 |
|   10 | Sophia Davis  | Mumbai  | IX    |    95 |
+------+---------------+---------+-------+-------+
10 rows in set (0.001 sec)
*/

-- e. Write the command to delete the student table.
DROP TABLE student;
    -- TABLE student Deleted.