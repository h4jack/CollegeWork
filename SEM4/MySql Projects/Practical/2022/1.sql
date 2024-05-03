-- Creating Database for Practical Exam paper 2022 question 1(a) called p1_2022.
CREATE DATABASE IF NOT EXISTS p1_2022;

-- using the created database.
USE p1_2022;

-- drop the table voter if already exists
DROP TABLE IF EXISTS office;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS consumer;
DROP TABLE IF EXISTS service;
DROP TABLE IF EXISTS consumer_served;

-- Create and each of the following tables:
    -- Office (Branch_Code, Branch_Name, Branch_Address, In_Charge) 
    -- Employee (E_ID, E_Name, E_Address, E_Qualification, E_Designation, Branch_Code, Salary) 
    -- Consumer (C_ID, C_Name, C_Address)
    -- Service (S_ID, S_Type) 
    -- Consumer_Served (Regd_No, C_ID, E_ID, S_ID, Status)

-- Creating table office.
CREATE TABLE office(
    b_code INT(8) PRIMARY KEY,
    b_name VARCHAR(20),
    b_addr VARCHAR(20),
    b_incharge VARCHAR(20)
);

-- Creating table employee.
CREATE TABLE employee(
    e_id INT(8) PRIMARY KEY,
    e_name VARCHAR(20),
    e_addr VARCHAR(20),
    e_qualifi VARCHAR(20),
    e_desig VARCHAR(20),
    b_code INT(8),
    salary INT(8)
);

-- Creating table consumer
CREATE TABLE consumer (
    c_id INT(8) PRIMARY KEY,
    c_name VARCHAR(20),
    c_addr VARCHAR(20)
);

-- Creating table service
CREATE TABLE service(
    s_id INT(8) PRIMARY KEY,
    s_type VARCHAR(20)
);

-- Creating table of consumer_served or record
CREATE TABLE consumer_served(
    regd_no INT(8) PRIMARY KEY,
    c_id INT(8),
    e_id INT(8),
    s_id INT(8),
    status VARCHAR(10)
);

-- Populate the tables with at least 5 records. 

-- Populate office table
INSERT INTO office (b_code, b_name, b_addr, b_incharge)
VALUES
(1, 'Head Office', 'New Delhi', 'Rajesh'),
(2, 'Branch Office 1', 'Mumbai', 'Rahul'),
(3, 'Branch Office 2', 'Chennai', 'Priya'),
(4, 'Branch Office 3', 'Kolkata', 'Suresh'),
(5, 'Branch Office 4', 'Bangalore', 'Neha');

-- Populate employee table
INSERT INTO employee (e_id, e_name, e_addr, e_qualifi, e_desig, b_code, salary)
VALUES
(1, 'Rajesh Kumar', 'New Delhi', 'B.Tech', 'Manager', 1, 50000),
(2, 'Rahul Sharma', 'Mumbai', 'MBA', 'Assistant Manager', 2, 40000),
(3, 'Priya Singh', 'Chennai', 'B.Sc', 'Executive', 3, 30000),
(4, 'Suresh Kumar', 'Kolkata', 'B.Com', 'Executive', 4, 35000),
(5, 'Neha Gupta', 'Bangalore', 'B.Tech', 'Manager', 5, 55000);

-- Populate consumer table
INSERT INTO consumer (c_id, c_name, c_addr)
VALUES
(1, 'Amit Kumar', 'New Delhi'),
(2, 'Rohan Singh', 'Mumbai'),
(3, 'Sonia Gupta', 'Chennai'),
(4, 'Rahul Jain', 'Kolkata'),
(5, 'Priya Sharma', 'Bangalore');

-- Populate service table
INSERT INTO service (s_id, s_type)
VALUES
(1, 'Internet'),
(2, 'TV'),
(3, 'Phone'),
(4, 'Broadband'),
(5, 'Mobile');

-- Populate consumer_served table
INSERT INTO consumer_served (regd_no, c_id, e_id, s_id, status)
VALUES
(1, 1, 1, 1, 'Active'),
(2, 2, 2, 2, 'Inactive'),
(3, 3, 3, 3, 'Active'),
(4, 4, 4, 4, 'Inactive'),
(5, 5, 5, 5, 'Active');

-- showing all content of table voter from database p1_2022.
SELECT * FROM office;
SELECT * FROM employee;
SELECT * FROM consumer;
SELECT * FROM service;
SELECT * FROM consumer_served;

-- Then write queries for:

-- Then answer the following queries:

-- a. List consumer names and related service status 
SELECT c.c_name, s.s_type, status
FROM consumer_served cs
JOIN consumer c ON c.c_id = cs.c_id
JOIN service s ON s.s_id = cs.s_id;

-- OR
SELECT c.c_name, s.s_type, status
FROM consumer_served cs, consumer c, service s
WHERE  s.s_id = cs.s_id
AND c.c_id = cs.c_id;

/*OUTPUT
+--------------+-----------+----------+
| c_name       | s_type    | status   |
+--------------+-----------+----------+
| Amit Kumar   | Internet  | Active   |
| Rohan Singh  | TV        | Inactive |
| Sonia Gupta  | Phone     | Active   |
| Rahul Jain   | Broadband | Inactive |
| Priya Sharma | Mobile    | Active   |
+--------------+-----------+----------+
5 rows in set (0.001 sec)
*/

-- b. For each and every branch list the employee drawing the maximum salary
SELECT o.b_name, e.e_name, e.salary
FROM office o
JOIN employee e ON o.b_code = e.b_code
JOIN (
    SELECT b_code, MAX(salary) AS max_salary
    FROM employee
    GROUP BY b_code
) em ON o.b_code = em.b_code AND e.salary = em.max_salary;

-- OR
SELECT b_name, e_name, salary
FROM office o, employee e
WHERE salary = (SELECT MAX(salary) FROM employee e WHERE e.b_code = o.b_code)
GROUP BY b_name;

/* OUTPUT
+-----------------+--------------+--------+
| b_name          | e_name       | salary |
+-----------------+--------------+--------+
| Head Office     | Rajesh Kumar |  50000 |
| Branch Office 1 | Rahul Sharma |  40000 |
| Branch Office 2 | Priya Singh  |  30000 |
| Branch Office 3 | Suresh Kumar |  35000 |
| Branch Office 4 | Neha Gupta   |  55000 |
+-----------------+--------------+--------+
5 rows in set (0.001 sec)
*/

-- c. List Regd_No and related branch in-charges 
SELECT regd_no, b_incharge FROM consumer_served cs
JOIN employee e ON e.e_id= cs.e_id
JOIN office o ON o.b_code = e.b_code;

-- OR
SELECT regd_no, b_incharge FROM consumer_served cs, office o, employee e
WHERE cs.e_id = e.e_id
AND o.b_code = e.b_code;

/* OUTPUT
+---------+------------+
| regd_no | b_incharge |
+---------+------------+
|       1 | Rajesh     |
|       2 | Rahul      |
|       3 | Priya      |
|       4 | Suresh     |
|       5 | Neha       |
+---------+------------+
5 rows in set (0.000 sec)
*/