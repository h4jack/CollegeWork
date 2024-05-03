-- Creating Database for Practical Exam paper 2019 question 1(a) called p1_2019.
CREATE DATABASE IF NOT EXISTS p1_2019;
-- using the created database.
USE p1_2019;

-- drop the table voter if already exists
DROP TABLE IF EXISTS voter;

-- Create a table VOTER (EPIC-Card-No, Name, Date-of-Birth, VILL, PO, DISTRICT)
CREATE TABLE voter(
    epic_no VARCHAR(10),
    name VARCHAR(20),
    dob DATE,
    vill VARCHAR(20),
    po VARCHAR(20),
    dist VARCHAR(20)
);

-- Populate the table with at least 5 records. 
INSERT INTO voter
VALUES
    ('V12345', 'John','2001-4-20', 'mengana', 'godra', 'saranji'),
    ('V67890', 'Jane','1999-7-15', 'narachi', 'piara', 'saranji'),
    ('V24680', 'Alice','2003-9-30', 'nangla', 'godra', 'saranji'),
    ('V13579', 'Bob','2001-11-24', 'singra', 'agarta', 'juala'),
    ('V97531', 'David','1998-1-2', 'mayuri', 'shivpur', 'juala'),
    ('V57133', 'Morlis','2003-8-29', 'onda', 'shivpur', 'juala');

-- showing all content of table voter from database p1_2019.
SELECT * FROM voter;

-- -- Then write queries for: 
-- (i) Finding the name of oldest voter.
SELECT name AS NAME, dob AS 'DATE OF BIRTH'
FROM voter
ORDER BY 2
LIMIT 1;

/* OUTPUT
+-------+---------------+
| NAME  | DATE OF BIRTH |
+-------+---------------+
| David | 1998-01-02    |
+-------+---------------+
1 row in set (0.001 sec)
*/

-- (ii) Finding EPIC-Card-No of youngest voter.
SELECT epic_no as 'EPIC CARD NO', name AS NAME, dob AS 'DATE OF BIRTH'
FROM voter
ORDER BY 3 DESC
LIMIT 1;

/* OUTPUT
+--------------+-------+---------------+
| EPIC CARD NO | NAME  | DATE OF BIRTH |
+--------------+-------+---------------+
| V24680       | Alice | 2003-09-30    |
+--------------+-------+---------------+
1 row in set (0.000 sec)
*/

-- (iii) Finding average age of voters.
SELECT AVG(TIMESTAMPDIFF(YEAR, dob, CURDATE())) AS 'AVERAGE AGE' FROM voter;

/* OUTPUT
+-------------+
| AVERAGE AGE |
+-------------+
|     22.5000 |
+-------------+
1 row in set (0.012 sec)
*/