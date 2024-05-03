/*DATABASE SCHEMA
voter(voter_id, voter_name, voter_vill, booth_id);
booth(booth_id, booth_name, booth_vill, po_id);
po(po_id, po_name, po_office, po_desgn);
*/

-- Creating database as name of exam of 2022 theory in short vote_2021.
CREATE DATABASE IF NOT EXISTS vote_2021;

-- Using the database vote_2021.
USE vote_2021;

-- Deleting/Dropping Existing tables of this database which we are going to make by our own.
DROP TABLE IF EXISTS voter;
DROP TABLE IF EXISTS booth;
DROP TABLE IF EXISTS po;

create table voter(
    voter_id INT(10),
    voter_name varchar(20),
    voter_vill varchar(20),
    booth_id INT(10)
);

create table booth(
    booth_id INT(10),
    booth_name varchar(20),
    booth_vill varchar(20),
    po_id INT(10)
);

create table po(
    po_id INT(10),
    po_name varchar(20),
    po_office varchar(20),
    po_desgn varchar(20)
);


-- Sample data for Voter-goes-Booth table
INSERT INTO voter (voter_id, voter_name, voter_vill, booth_id) VALUES
(1, 'Amit Singh', 'Kolkata', 1),
(2, 'Raj Sharma', 'Howrah', 2),
(3, 'Anita Roy', 'Durgapur', 3),
(4, 'Animesh Kar', 'Bankura', 4);

-- Sample data for Booth-involves-PO table
INSERT INTO booth (booth_id, booth_name, booth_vill, po_id) VALUES
(1, 'Booth 1', 'Kolkata', 1),
(2, 'Booth 2', 'Howrah', 2),
(3, 'Booth 3', 'Durgapur', 3),
(4, 'Booth 4', 'Bankura', 4);

-- Sample data for PO table
INSERT INTO po (po_id, po_name, po_office, po_desgn) VALUES
(1, 'Sunita Gupta', 'Kolkata Office', 'Supervisor'),
(2, 'Alok Bansal', 'Howrah Office', 'Clerk'),
(3, 'Meena Khatun', 'Durgapur Office', 'Officer'),
(4, 'Swarup Menna', 'Bankura Office', 'Engineer');
