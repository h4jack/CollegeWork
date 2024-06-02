-- in this we are going to insert some values/rows to the tables of lab. called Employee and Deaprtment.

-- Creating Database for lab called lab.
CREATE DATABASE IF NOT EXISTS lab;
-- using the created database.
USE lab;
-- Inserting sample data into Department table
INSERT INTO Department (dno, dname, dlocation) VALUES
(1, 'Sales', 'New York'),
(2, 'Marketing', 'Los Angeles'),
(3, 'Finance', 'Chicago'),
(4, 'Human Resources', 'Houston'),
(5, 'IT', 'San Francisco');

-- Inserting sample data into Employee table
INSERT INTO Employee (eno, ename, job_type, manager, hire_date, dno, commission, salary) VALUES
('001', 'John Doe', 'Manager', NULL, '2022-01-01', 1, NULL, 50000),
('002', 'Jane Smith', 'Sales Associate', '001', '2022-02-15', 2, 1000, 30000),
('003', 'Alice Johnson', 'Sales Associate', '001', '2022-03-20', 3, 800, 28000),
('004', 'Bob Brown', 'Sales Associate', '001', '2022-04-10', 4, 1200, 32000),
('005', 'Charlie Davis', 'Sales Associate', '001', '2022-05-05', 5, 900, 30000),
('006', 'David Wilson', 'Sales Associate', '001', '2022-06-08', 1, 1100, 31000),
('007', 'Eva Martinez', 'Sales Associate', '001', '2022-07-11', 2, 1000, 29000),
('008', 'Frank Taylor', 'Sales Associate', '001', '2022-08-14', 3, 950, 30000),
('009', 'Grace Rodriguez', 'Sales Associate', '001', '2022-09-17', 4, 1050, 31000),
('010', 'Henry Lee', 'Sales Associate', '001', '2022-10-20', 5, 1100, 32000),
('011', 'Isabel Garcia', 'Sales Associate', '001', '2022-11-23', 1, 900, 30000),
('012', 'Jack Nguyen', 'Sales Associate', '001', '2022-12-26', 2, 950, 31000),
('013', 'Karen Hernandez', 'Sales Associate', '001', '2023-01-29', 3, 1200, 33000),
('014', 'Liam Perez', 'Sales Associate', '001', '2023-02-01', 4, 1000, 30000),
('015', 'Mia Flores', 'Sales Associate', '001', '2023-03-06', 5, 800, 28000),
('016', 'Nora Martinez', 'Sales Associate', '001', '2023-04-09', 1, 1100, 32000),
('017', 'Oscar Lopez', 'Sales Associate', '001', '2023-05-12', 2, 950, 31000),
('018', 'Penelope Gonzales', 'Sales Associate', '001', '2023-06-15', 3, 1000, 30000),
('019', 'Quinn Rodriguez', 'Sales Associate', '001', '2023-07-18', 4, 1050, 31000),
('020', 'Ryan Kim', 'Sales Associate', '001', '2023-08-21', 5, 1150, 33000),
('021', 'Samantha Smith', 'Sales Associate', '001', '2023-09-24', 1, 900, 30000),
('022', 'Thomas Davis', 'Sales Associate', '001', '2023-10-27', 2, 1200, 33000),
('023', 'Uma Wilson', 'Sales Associate', '001', '2023-11-30', 3, 1000, 30000),
('024', 'Victor Taylor', 'Sales Associate', '001', '2023-12-03', 4, 950, 31000),
('025', 'Wendy Rodriguez', 'Sales Associate', '001', '2024-01-06', 5, 1100, 32000),
('026', 'Xavier Lee', 'Sales Associate', '001', '2024-02-09', 1, 1000, 30000),
('027', 'Yara Garcia', 'Sales Associate', '001', '2024-03-13', 2, 850, 29000),
('028', 'Zoe Nguyen', 'Sales Associate', '001', '2024-04-16', 3, 1150, 33000),
('029', 'Alice Brown', 'Sales Associate', '002', '2022-01-01', 4, NULL, 48000),
('030', 'Bob Davis', 'Sales Associate', '002', '2022-02-15', 5, 900, 29000),
('031', 'Charlie Wilson', 'Sales Associate', '002', '2022-03-20', 1, 700, 27000),
('032', 'David Martinez', 'Sales Associate', '002', '2022-04-10', 2, 1000, 31000),
('033', 'Eva Taylor', 'Sales Associate', '002', '2022-05-05', 3, 850, 30000),
('034', 'Frank Rodriguez', 'Sales Associate', '002', '2022-06-08', 4, 950, 32000),
('035', 'Grace Kim', 'Sales Associate', '002', '2022-07-11', 5, 1100, 33000),
('036', 'Henry Garcia', 'Sales Associate', '002', '2022-08-14', 1, 1050, 32000),
('037', 'Isabel Lee', 'Sales Associate', '002', '2022-09-17', 2, 850, 31000),
('038', 'Jack Smith', 'Sales Associate', '002', '2022-10-20', 3, 950, 32000),
('039', 'Karen Davis', 'Sales Associate', '002', '2022-11-23', 4, 900, 31000),
('040', 'Liam Wilson', 'Sales Associate', '002', '2022-12-26', 5, 950, 32000),
('041', 'Mia Martinez', 'Sales Associate', '002', '2023-01-29', 1, 1000, 33000),
('042', 'Nora Taylor', 'Sales Associate', '002', '2023-02-01', 2, 850, 31000),
('043', 'Oscar Rodriguez', 'Sales Associate', '002', '2023-03-06', 3, 900, 32000),
('044', 'Penelope Kim', 'Sales Associate', '002', '2023-04-09', 4, 950, 33000),
('045', 'Quinn Garcia', 'Sales Associate', '002', '2023-05-12', 5, 1100, 34000),
('046', 'Ryan Perez', 'Sales Associate', '002', '2023-06-15', 1, 1000, 33000),
('047', 'Samantha Lee', 'Sales Associate', '002', '2023-07-18', 2, 900, 31000),
('048', 'Thomas Smith', 'Sales Associate', '002', '2023-08-21', 3, 1200, 34000),
('049', 'Uma Davis', 'Sales Associate', '002', '2023-09-24', 4, 1000, 31000),
('050', 'Victor Wilson', 'Sales Associate', '002', '2023-10-27', 5, 950, 32000);
