/*DATABASE SCHEMA FOR epic_2022
epic(voter_id, first_name, sur_name, pin_code, aadhaar_no, pan_no)
pan(pan_no, year, gross_income, tax_paid)
aadhaar(aadhaar_no, account_no, account_type)
*/

-- Creating Database of Question of Paper 2022 as name of epic_2022.
CREATE DATABASE IF NOT EXISTS epic_2022;

-- Using the created Database epic_2022.
USE epic_2022;

-- Dropping tables if exists already.
DROP TABLE IF EXISTS epic;
DROP TABLE IF EXISTS pan;
DROP TABLE IF EXISTS aadhaar;

-- Creating Tables and it's Attributes.
CREATE TABLE epic(
    voter_id varchar(10),
    first_name varchar(20),
    sur_name varchar(20),
    pin_code INT(6),
    aadhaar_no BIGINT(12),
    pan_no varchar(10)
);

CREATE TABLE pan(
    pan_no varchar(10),
    year INT(4),
    gross_income INT(10),
    tax_paid INT(12)
);

CREATE TABLE aadhaar(
    aadhaar_no BIGINT(12),
    account_no BIGINT(12),
    account_type varchar(8)
);


-- Inserting values into the 'epic' table
INSERT INTO epic (voter_id, first_name, sur_name, pin_code, aadhaar_no, pan_no)
VALUES
    ('V12345', 'John', 'Doe', 123456, 987654321012, 'ABCDE1234F'),
    ('V67890', 'Jane', 'Smith', 789012, 876543210987, 'FGHIJ5678K'),
    ('V24680', 'Alice', 'Johnson', 345678, 765432109876, 'LMNOP9012Q'),
    ('V13579', 'Bob', 'Brown', 567890, 654321098765, 'RSTUV2345W'),
    ('V97531', 'David', 'Lee', 890123, 543210987654, 'XYZAB6789C');

-- Inserting values into the 'pan' table
INSERT INTO pan (pan_no, year, gross_income, tax_paid)
VALUES
    ('ABCDE1234F', 2022, 500000, 75000),
    ('FGHIJ5678K', 2022, 600000, 90000),
    ('LMNOP9012Q', 2022, 400000, 60000),
    ('RSTUV2345W', 2022, 700000, 105000),
    ('XYZAB6789C', 2022, 800000, 120000);

-- Inserting values into the 'aadhaar' table
INSERT INTO aadhaar (aadhaar_no, account_no, account_type)
VALUES
    (987654321012, 123456789012, 'Savings'),
    (876543210987, 234567890123, 'Current'),
    (765432109876, 345678901234, 'Savings'),
    (654321098765, 456789012345, 'Current'),
    (543210987654, 567890123456, 'Savings');
