-- Creating Database for Practical Exam paper 2022 question 1(a) called p2_2022.
CREATE DATABASE IF NOT EXISTS p2_2022;

-- using the created database.
USE p2_2022;

-- drop the table voter if already exists
DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS participant;
DROP TABLE IF EXISTS selector;
DROP TABLE IF EXISTS result;

-- Create and populate each of the following tables with at least 5 records: 
    -- Event (Event, Name, Date) 
    -- Participant (P_Id, Name, Event) 
    -- Selector (S_Id, Name, Event) 
    -- Result (Event, Winner1, Winner2, Winner3)

-- Creating table event.
CREATE TABLE event(
    event VARCHAR(5) PRIMARY KEY,
    name VARCHAR(20),
    date DATE
);

-- Creating table participant.
CREATE TABLE participant(
    p_id INT(8) PRIMARY KEY,
    name VARCHAR(20),
    event VARCHAR(5)
);

-- Creating table selector.
CREATE TABLE selector(
    s_id INT(8) PRIMARY KEY,
    name VARCHAR(20),
    event VARCHAR(5)
);

-- Creating table result.
CREATE TABLE result(
    event VARCHAR(5) PRIMARY KEY,
    winner1 VARCHAR(20),
    winner2 VARCHAR(20),
    winner3 VARCHAR(20)
);
-- Populate the tables with at least 5 records.

-- Populating table event with 5 records.
INSERT INTO event VALUES
('E1', '100m Dash', '2023-08-01'),
('E2', '200m Dash', '2023-05-05'),
('E3', 'Long Jump', '2023-07-03'),
('E4', 'Shot Put', '2023-06-04'),
('E5', '100m Freestyle', '2023-05-06'),
('E6', 'Drawing', '2023-04-07'),
('E7', 'Dancing', '2023-05-02'),
('E8', 'Quiz', '2023-05-09');

-- Populating table participant with 5 records.
INSERT INTO participant VALUES
(1, 'John Doe', 'E1'),
(2, 'Jane Smith', 'E2'),
(3, 'Mike Johnson', 'E3'),
(4, 'Sara Brown', 'E4'),
(5, 'David Williams', 'E5'),
(6, 'David Cosly', 'E6'),
(7, 'Manila Black', 'E7'),
(8, 'James Haus', 'E8');

-- Populating table selector with 5 records.
INSERT INTO selector VALUES
(1, 'Jim Brown', 'E1'),
(2, 'Sally Johnson', 'E2'),
(3, 'Bob Smith', 'E3'),
(4, 'Alice Brown', 'E4'),
(5, 'Charlie Williams', 'E5'),
(6, 'David Cosly', 'E6'),
(7, 'Manila Black', 'E7'),
(8, 'James Haus', 'E8');

-- Populating table result with 5 records.
INSERT INTO result VALUES
('E1', 'John Doe', 'Jim Brown', 'Jane Smith'),
('E2', 'Jane Smith', 'Sally Johnson', 'Mike Johnson'),
('E3', 'Mike Johnson', 'Bob Smith', 'Sara Brown'),
('E4', 'Sara Brown', 'Alice Brown', 'David Williams'),
('E5', 'David Williams', 'Charlie Williams', 'John Doe'),
('E6', 'David Cosly', 'Marun Sik', 'Nicoi Wool'),
('E7', 'Manila Black', 'Umar Faruk', 'James Bond'),
('E8', 'James Haus', 'Naja Saru', 'Steav Smith');



-- showing all content of table voter from database p1_2022.
SELECT * FROM event;
SELECT * FROM participant;
SELECT * FROM selector;
SELECT * FROM result;

-- Then write queries for:

-- 1. List the names of all selectors for the drawing event.
SELECT s.name FROM selector s
JOIN event e ON s.event = e.event
WHERE e.name = 'Drawing';

-- OR
SELECT s.name FROM selector s, event e
WHERE e.name = 'Drawing'
AND s.event = e.event;

/* OUTPUT
+-------------+
| name        |
+-------------+
| David Cosly |
+-------------+
1 row in set (0.000 sec)
*/

-- 2.  List the names of all participants of quiz event.
SELECT p.name FROM participant p
JOIN event e ON p.event = e.event
WHERE e.name = 'Quiz';

-- OR
SELECT p.name FROM participant p, event e 
WHERE p.event = e.event AND e.name = 'Quiz';

/* OUTPUT
+------------+
| name       |
+------------+
| James Haus |
+------------+
1 row in set (0.000 sec)
*/

 
-- 3. List of Winner1 date-wise.
SELECT winner1 FROM result r
JOIN event e ON r.event = e.event
ORDER BY e.date;

-- OR
SELECT winner1 FROM result r, event e
WHERE r.event = e.event
ORDER BY e.date;

/* OUTPUT
+----------------+
| winner1        |
+----------------+
| David Cosly    |
| Manila Black   |
| Jane Smith     |
| David Williams |
| James Haus     |
| Sara Brown     |
| Mike Johnson   |
| John Doe       |
+----------------+
8 rows in set (0.000 sec)
*/