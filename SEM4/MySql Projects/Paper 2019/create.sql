/* Schema of Database:
employee (person_name, street, city)
works (person_name, company_name, salary)
company (company_name, city)
manages (person_name, manager_name)
*/

-- Creating database as name of exam of 2019 theory in short works_2019.
CREATE DATABASE IF NOT EXISTS works_2019;

-- Using the database works_2019. 
USE works_2019;

-- Deleting/Dropping Existing tables of this database which we are going to make by our own.
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS works;
DROP TABLE IF EXISTS company;
DROP TABLE IF EXISTS manages;

-- creating table employee
CREATE TABLE employee(
    person_name VARCHAR(20),
    street VARCHAR(20),
    city VARCHAR(20)
    );

-- creating table works
CREATE TABLE works(
    person_name VARCHAR(20),
    company_name VARCHAR(20),
    salary INT(8)
    );

-- creating table company
CREATE TABLE company(
    company_name VARCHAR(20),
    city VARCHAR(20)
    );

-- creating table manages
CREATE TABLE manages(
    person_name VARCHAR(20),
    manager_name VARCHAR(20)
    );

-- inserting values into employee
INSERT INTO employee VALUES
('anmol', 'bikna', 'bankura'),
('anil', 'danga', 'bankura'),
('sukla', 'lokpur', 'bankura'),
('parul', 'bus stand', 'durgapur'),
('manish', 'city center', 'durgapur');

-- inserting values into works
INSERT INTO works VALUES
('anil', 'fbc', 15000),
('anmol', 'fbc', 20000),
('manish', 'fbc', 30000),
('parul', 'sbc', 20000),
('sukla', 'sbc', 35000);

-- inserting values into company
INSERT INTO company VALUES
('fbc', 'bankura'),
('sbc', 'durgapur');

-- inserting values into manages
INSERT INTO manages VALUES
('anil', 'manish'),
('anmol', 'manish'),
('manish', 'manish'),
('parul', 'sukla'),
('sukla', 'sukla');