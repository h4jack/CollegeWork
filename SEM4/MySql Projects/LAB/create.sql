-- Create these two Database Schema.

                         -- Employee Schema
-- |-------------------|-------------------|-----------|-------|-----------|
-- |   Field           |   Type            |   Null    |   Key |   Default |
-- |-------------------|-------------------|-----------|-------|-----------|
-- |   eno             |   CHAR(3)         |   NO      |   PRI |   NIL     |
-- |   ename           |   VARCHAR(50)     |   NO      |       |   NIL     |
-- |   job_type        |   VARCHAR(50)     |   NO      |       |   NIL     |
-- |   manager         |   CHAR(3)         |   YES     |   FK  |   NIL     |
-- |   hire_date       |   DATE            |   NO      |       |   NIL     |
-- |   dno             |   INT             |   YES     |   FK  |   NIL     |
-- |   commission      |   DECIMAL(10.2)   |   YES     |       |   NIL     |
-- |   salary          |   DECIMAL(7.2)    |   NO      |       |   NIL     |
-- |-------------------|-------------------|-----------|-------|-----------|

                         -- Department Schema
-- |-------------------|-------------------|-----------|---------------|
-- |   Field           |   Type            |   Null    |   Default     |
-- |-------------------|-------------------|-----------|---------------|
-- |   dno             |   INT(3)          |   NO PRI  |   NIL         |
-- |   dname           |   DECIMAL(10.2)   |   YES     |   NIL         |
-- |   dlocation       |   DECIMAL(7.2)    |   YES     |   New Delhi   |
-- |-------------------|-------------------|-----------|---------------|

-- Creating Database for lab called lab.
CREATE DATABASE IF NOT EXISTS lab;
-- using the created database.
USE lab;

-- drop the table voter if already exists
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;

-- Department Schema
CREATE TABLE Department (
    dno INT(4) NOT NULL PRIMARY KEY,
    dname VARCHAR(50),
    dlocation VARCHAR(50) DEFAULT 'New Delhi'
);

-- Employee Schema
CREATE TABLE Employee (
    eno CHAR(3) NOT NULL PRIMARY KEY,
    ename VARCHAR(50) NOT NULL,
    job_type VARCHAR(50) NOT NULL,
    manager CHAR(3),
    hire_date DATE NOT NULL,
    dno INT(4),
    commission DECIMAL(10,2),
    salary DECIMAL(7,2) NOT NULL,
    FOREIGN KEY (manager) REFERENCES Employee(eno) ON DELETE SET NULL,
    FOREIGN KEY (dno) REFERENCES Department(dno)
);


-- Adding indexes to the referenced columns
ALTER TABLE Employee ADD INDEX (manager);
ALTER TABLE Employee ADD INDEX (dno);

