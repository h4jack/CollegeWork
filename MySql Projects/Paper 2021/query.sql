/*DATABASE SCHEMA
voter(voter_id, voter_name, voter_vill, booth_id);
booth(booth_id, booth_name, booth_vill, po_id);
po(po_id, po_name, po_office, po_desgn);
*/

USE vote_2021;

-- 1. Names all polling-booths having the designation of PO as Engineer.
SELECT b.booth_name
FROM booth b
JOIN PO p ON b.po_id = p.po_id
WHERE p.po_desgn = 'Engineer';

-- OR 

SELECT b.booth_name
FROM booth b, PO p
WHERE b.po_id = p.po_id
AND p.po_desgn = 'Engineer';

/*OUTPUT
+------------+
| booth_name |
+------------+
| Booth 4    |
+------------+
1 row in set (0.000 sec)
*/

-- 2. For a particular voter-ID retrieve the name of the PO.
SELECT p.po_name
FROM voter v
JOIN booth b ON v.booth_id = b.booth_id
JOIN po p ON b.po_id = p.po_id
WHERE v.voter_id = 1;

-- OR

SELECT p.po_name
FROM po p, booth b, voter v
WHERE v.booth_id = b.booth_id
AND b.po_id = p.po_id
AND v.voter_id = 1;

/*OUTPUT
+--------------+
| po_name      |
+--------------+
| Sunita Gupta |
+--------------+
1 row in set (0.003 sec)
*/

-- 3. List names and address of all voters PO’s name wise.
SELECT v.voter_name, v.voter_vill, p.po_name
FROM voter v
JOIN booth b ON b.booth_id = v.booth_id
JOIN po p ON p.po_id = b.po_id
ORDER BY p.po_name;

-- OR

SELECT v.voter_name, v.voter_vill, p.po_name
FROM voter v, booth b, po p
WHERE b.booth_id = v.booth_id
AND p.po_id = b.po_id
ORDER BY p.po_name;

/*OUTPUT
+-------------+------------+--------------+
| voter_name  | voter_vill | po_name      |
+-------------+------------+--------------+
| Raj Sharma  | Howrah     | Alok Bansal  |
| Anita Roy   | Durgapur   | Meena Khatun |
| Amit Singh  | Kolkata    | Sunita Gupta |
| Animesh Kar | Bankura    | Swarup Menna |
+-------------+------------+--------------+
4 rows in set (0.000 sec)
*/