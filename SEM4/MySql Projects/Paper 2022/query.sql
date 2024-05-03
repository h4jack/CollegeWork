/*DATABASE SCHEMA FOR epic_2022
epic(voter_id, first_name, sur_name, pin_code, aadhaar_no, pan_no)
pan(pan_no, year, gross_income, tax_paid)
aadhaar(aadhaar_no, account_no, account_type)
*/

-- Use the database to run these query
USE epic_2022;

-- i. PAN No for which highest tax has been paid for the financial year 2021-22(2022).
SELECT pan_no
FROM pan
WHERE tax_paid = (SELECT MAX(tax_paid) FROM pan WHERE year = 2022);

/* OUTPUT
+---------------+
| MAX(tax_paid) |
+---------------+
|        120000 |
+---------------+
1 row in set (0.001 sec)
*/

-- ii. All accounts hold by a person with a particular Voter ID.
SELECT a.account_no, a.account_type FROM aadhaar a JOIN epic e ON e.aadhaar_no = a.aadhaar_no WHERE voter_id = 'V13579';

-- OR
SELECT a.account_no, a.account_type FROM aadhaar a, epic e WHERE e.aadhaar_no = a.aadhaar_no and voter_id = 'V13579';

/* OUTPUT
+--------------+--------------+
| account_no   | account_type |
+--------------+--------------+
| 456789012345 | Current      |
+--------------+--------------+
1 row in set (0.013 sec)
*/

-- iii. All PAN numbers and linked Aadhaar numbers
SELECT e.pan_no, a.aadhaar_no
FROM epic e
JOIN aadhaar a ON e.aadhaar_no = a.aadhaar_no;
    
-- OR
SELECT pan_no, aadhaar_no FROM epic;

/* OUTPUT
+------------+--------------+
| pan_no     | aadhaar_no   |
+------------+--------------+
| ABCDE1234F | 987654321012 |
| FGHIJ5678K | 876543210987 |
| LMNOP9012Q | 765432109876 |
| RSTUV2345W | 654321098765 |
| XYZAB6789C | 543210987654 |
+------------+--------------+
5 rows in set (0.012 sec)
*/