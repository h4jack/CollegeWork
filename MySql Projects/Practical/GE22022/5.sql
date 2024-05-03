-- Creating Database for Practical Exam paper 2022 GE question 1 called p5g_2022.
CREATE DATABASE IF NOT EXISTS p5g_2022;

-- using the created database.
USE p5g_2022;

-- drop the table voter if already exists
DROP TABLE IF EXISTS suppliers;
DROP TABLE IF EXISTS parts;

-- Create the following table-
    -- a. Suppliers (SNo,  Sname, Status, SCity)  
    --    Parts (PNo, SNo,  Pname, Colour, Weight) 

CREATE TABLE supplier (
    sno INT(4),
    sname VARCHAR(30),
    status VARCHAR(10),
    scity VARCHAR(20)
);

CREATE TABLE parts(
    pno INT(4),
    sno INT(4),
    pname VARCHAR(20),
    colour VARCHAR(10),
    weight INT(8)
);

-- Insert 4 records in each table.

-- Insert data into supplier table
INSERT INTO supplier (sno, sname, status, scity)
VALUES 
(1001, 'Supplier A', 'Active', 'Kolkata'),
(1002, 'Supplier B', 'Inactive', 'Mumbai'),
(1003, 'Supplier C', 'Active', 'Delhi'),
(1004, 'Supplier D', 'Active', 'Kolkata'),
(1005, 'Supplier E', 'Inactive', 'Chennai');

-- Insert data into parts table
INSERT INTO parts (pno, sno, pname, colour, weight)
VALUES 
(2001, 1001, 'Part A', 'Red', 50),
(2002, 1002, 'Part B', 'Blue', 75),
(2003, 1003, 'Part C', 'Green', 100),
(2004, 1004, 'Part D', 'Red', 125),
(2005, 1005, 'Part E', 'Blue', 150);

-- Showing values of these tables.
SELECT * FROM supplier;
SELECT * FROM parts;

    -- b. Get supplier name who are lives in Kolkata.
SELECT sname FROM supplier
WHERE scity='kolkata';

/* OUTPUT
+------------+
| sname      |
+------------+
| Supplier A |
| Supplier D |
+------------+
2 rows in set (0.001 sec)
*/