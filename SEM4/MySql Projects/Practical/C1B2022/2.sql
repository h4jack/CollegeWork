-- Creating Database for Practical Exam paper 2022 Programme question 1 called p2p_2022.
CREATE DATABASE IF NOT EXISTS p2p_2022;

-- using the created database.
USE p2p_2022;

-- drop the table voter if already exists
DROP TABLE IF EXISTS patient;
DROP TABLE IF EXISTS doctor;
DROP TABLE IF EXISTS department;


-- Create the following tables 
    -- Patient(PID, PName, Dateofbirth, Mobile,Address,DepNo,BedNo). 
    -- Doctor(DocID, DName,DepNo,Mobile) 
    -- Department(DepNo, DepName, HOD) 
    
-- Creating Patient Table.
CREATE TABLE patient(
    pid INT(4) PRIMARY KEY,
    pname VARCHAR(30),
    dob DATE,
    mobile BIGINT(10),
    address VARCHAR(20),
    depno INT(4),
    bedno INT(4)
);

-- Creating Doctor Table
CREATE TABLE doctor(
    docid INT(4) PRIMARY KEY,
    dname VARCHAR(30),
    depno INT(4),
    mobile BIGINT(10)
);

-- Creating Department Table.
CREATE TABLE department(
    depno INT(4) PRIMARY KEY,
    depname VARCHAR(20),
    hod VARCHAR(30)
);

-- Inserting Values to these tables
INSERT INTO patient (pid, pname, dob, mobile, address, depno, bedno)
VALUES
(1, 'John Doe', '1990-01-01', 1234567890, '123 Main St', 1, 101),
(2, 'Jane Smith', '1992-02-02', 9876543210, '456 Elm St', 2, 202),
(3, 'Bob Johnson', '1985-03-03', 5551234567, '789 Oak St', 3, 303),
(4, 'Alice Brown', '1995-04-04', 7778889990, '321 Pine St', 1, 104),
(5, 'Mike Davis', '1980-05-05', 6665554444, '901 Maple St', 2, 205),
(6, 'Emily Taylor', '1998-06-06', 3332221111, '234 Cedar St', 4, 306),
(7, 'Sarah Lee', '1982-07-07', 9998887770, '567 Spruce St', 1, 107),
(8, 'Kevin White', '1991-08-08', 4443332222, '890 Fir St', 2, 208),
(9, 'Lisa Nguyen', '1988-09-09', 2221110000, '678 Cypress St', 3, 309),
(10, 'David Kim', '1994-10-10', 8887776666, '345 Birch St', 1, 110),
(11, 'Olivia Martin', '1986-11-11', 6666666666, '901 Ash St', 2, 211),
(12, 'Benjamin Hall', '1996-12-12', 5555555555, '567 Beech St', 5, 312),
(13, 'Hannah Patel', '1984-01-13', 7777777777, '234 Cherry St', 1, 113),
(14, 'Ethan Walker', '1993-02-14', 3333333333, '890 Chestnut St', 2, 214),
(15, 'Isabella Garcia', '1989-03-15', 9999999999, '678 Dogwood St', 3, 315),
(16, 'Logan Brooks', '1997-04-16', 2222222222, '345 Elm St', 1, 116),
(17, 'Ava Morales', '1987-05-17', 8888888888, '901 Fir St', 2, 217),
(18, 'Julian Sanchez', '1992-06-18', 6666666666, '567 Spruce St', 4, 318),
(19, 'Lily Tran', '1985-07-19', 5555555555, '234 Cedar St', 1, 119),
(20, 'Gabriel Russell', '1999-08-20', 3333333333, '890 Maple St', 5, 220);

INSERT INTO doctor (docid, dname, depno, mobile)
VALUES
(1, 'Dr. Jon Smith', 1, 1234567890),
(2, 'Dr. Robert Johnson', 2, 9876543210),
(3, 'Dr. Rajesh Kumar', 3, 5551234567),
(4, 'Dr. Davis Rich', 4, 7778889990),
(5, 'Dr. Taylor Black', 5, 6665554444);

INSERT INTO department (depno, depname, hod)
VALUES
(1, 'Cardiology', 'Dr. Jon Smith'),
(2, 'Neurology', 'Dr. Robert Johnson'),
(3, 'Orthopedics', 'Dr. Rajesh Kumar'),
(4, 'ENT', 'Davis Rich'),
(5, 'Surgery', 'Dr. Taylor Black');

-- Showing Contents/Records of these tables.
SELECT * FROM patient;
SELECT * FROM doctor;
SELECT * FROM department;

-- Write down the following queries in SQL: 

-- i) Display details of all patients.
SELECT * FROM patient;

/* OUTPUT
+-----+-----------------+------------+------------+-----------------+-------+-------+
| pid | pname           | dob        | mobile     | address         | depno | bedno |
+-----+-----------------+------------+------------+-----------------+-------+-------+
|   1 | John Doe        | 1990-01-01 | 1234567890 | 123 Main St     |     1 |   101 |
|   2 | Jane Smith      | 1992-02-02 | 9876543210 | 456 Elm St      |     2 |   202 |
|   3 | Bob Johnson     | 1985-03-03 | 5551234567 | 789 Oak St      |     3 |   303 |
|   4 | Alice Brown     | 1995-04-04 | 7778889990 | 321 Pine St     |     1 |   104 |
|   5 | Mike Davis      | 1980-05-05 | 6665554444 | 901 Maple St    |     2 |   205 |
|   6 | Emily Taylor    | 1998-06-06 | 3332221111 | 234 Cedar St    |     4 |   306 |
|   7 | Sarah Lee       | 1982-07-07 | 9998887770 | 567 Spruce St   |     1 |   107 |
|   8 | Kevin White     | 1991-08-08 | 4443332222 | 890 Fir St      |     2 |   208 |
|   9 | Lisa Nguyen     | 1988-09-09 | 2221110000 | 678 Cypress St  |     3 |   309 |
|  10 | David Kim       | 1994-10-10 | 8887776666 | 345 Birch St    |     1 |   110 |
|  11 | Olivia Martin   | 1986-11-11 | 6666666666 | 901 Ash St      |     2 |   211 |
|  12 | Benjamin Hall   | 1996-12-12 | 5555555555 | 567 Beech St    |     5 |   312 |
|  13 | Hannah Patel    | 1984-01-13 | 7777777777 | 234 Cherry St   |     1 |   113 |
|  14 | Ethan Walker    | 1993-02-14 | 3333333333 | 890 Chestnut St |     2 |   214 |
|  15 | Isabella Garcia | 1989-03-15 | 9999999999 | 678 Dogwood St  |     3 |   315 |
|  16 | Logan Brooks    | 1997-04-16 | 2222222222 | 345 Elm St      |     1 |   116 |
|  17 | Ava Morales     | 1987-05-17 | 8888888888 | 901 Fir St      |     2 |   217 |
|  18 | Julian Sanchez  | 1992-06-18 | 6666666666 | 567 Spruce St   |     4 |   318 |
|  19 | Lily Tran       | 1985-07-19 | 5555555555 | 234 Cedar St    |     1 |   119 |
|  20 | Gabriel Russell | 1999-08-20 | 3333333333 | 890 Maple St    |     5 |   220 |
+-----+-----------------+------------+------------+-----------------+-------+-------+
20 rows in set (0.001 sec)
*/

-- ii) Display Names of patients of ENT department. 
SELECT pname FROM patient p
JOIN department d ON d.depno = p.depno
WHERE depname = 'ENT';

/* OUTPUT
+----------------+
| pname          |
+----------------+
| Emily Taylor   |
| Julian Sanchez |
+----------------+
2 rows in set (0.001 sec)
*/

-- iii) Display details of all doctors of Pediatric department . 
SELECT dname, depname FROM doctor d
JOIN department dp ON d.depno = dp.depno;

/* OUTPUT
+-------------+-------------+
| dname       | depname     |
+-------------+-------------+
| Dr. Smith   | Cardiology  |
| Dr. Johnson | Neurology   |
| Dr. Brown   | Orthopedics |
| Dr. Davis   | ENT         |
| Dr. Taylor  | Surgery     |
+-------------+-------------+
5 rows in set (0.000 sec)
*/

-- iv) Display patient details of Dr. Rajesh Kumar.

SELECT
    pid AS 'Patient Id',
    pname AS 'Patient Name',
    dob AS 'Date Of Birth',
    p.mobile AS 'Mobile No',
    address AS 'Address',
    bedno AS 'Bed No'
FROM patient p
JOIN doctor d ON d.depno = p.depno
WHERE dname = 'Dr. Rajesh Kumar';

/* OUTPUT
+------------+-----------------+---------------+------------+----------------+--------+
| Patient Id | Patient Name    | Date Of Birth | Mobile No  | Address        | Bed No |
+------------+-----------------+---------------+------------+----------------+--------+
|          3 | Bob Johnson     | 1985-03-03    | 5551234567 | 789 Oak St     |    303 |
|          9 | Lisa Nguyen     | 1988-09-09    | 2221110000 | 678 Cypress St |    309 |
|         15 | Isabella Garcia | 1989-03-15    | 9999999999 | 678 Dogwood St |    315 |
+------------+-----------------+---------------+------------+----------------+--------+
3 rows in set (0.001 sec)
*/