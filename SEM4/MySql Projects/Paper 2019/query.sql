/* Schema of Database:
employee (person_name, street, city)
works (person_name, company_name, salary)
company (company_name, city)
manages (person_name, manager_name)
*/
USE works_2019;

-- 1. find the name of all employee who works for first bank corporation(fbc).
SELECT person_name FROM works WHERE company_name = 'fbc';

/* Expected output:
+-------------+
| person_name |
+-------------+
| anil        |
| anmol       |
| manish      |
+-------------+
3 rows in set (0.000 sec)
*/

-- 2. Find the name, street address and cities of residence of all employees who work for first bank Corporation and earn more than Rs. 10,000 per month.
SELECT employee.person_name, street, city
FROM works, employee
WHERE works.person_name=employee.person_name
AND company_name='fbc'
AND salary>10000;

/* Expected output:
+-------------+-------------+----------+
| person_name | street      | city     |
+-------------+-------------+----------+
| anmol       | bikna       | bankura  |
| anil        | danga       | bankura  |
| manish      | city center | durgapur |
+-------------+-------------+----------+
3 rows in set (0.012 sec)
*/

-- 3. Find the name of all the employees who live in the same city as the Company for which they work. 
SELECT employee.person_name, employee.city, company.company_name
FROM employee, works, company
WHERE employee.person_name=works.person_name
AND works.company_name=company.company_name
AND employee.city=company.city;

/* Expected output:
+-------------+----------+--------------+
| person_name | city     | company_name |
+-------------+----------+--------------+
| anil        | bankura  | fbc          |
| anmol       | bankura  | fbc          |
| parul       | durgapur | sbc          |
+-------------+----------+--------------+
3 rows in set (0.001 sec)
*/

-- 4. Give all managers a 10% salary raise, unless the salary would be greater than Rs. 100,000. In such a case give only a 3% raise. 

UPDATE works
SET salary = CASE
    WHEN salary * 1.10 <= 100000 THEN salary * 1.10
    ELSE salary * 1.03
END
WHERE person_name IN (SELECT manager_name FROM manages);

/* Expected output:
+-------------+--------------+--------+
| person_name | company_name | salary |
+-------------+--------------+--------+
| anil        | fbc          |  15000 |
| anmol       | fbc          |  20000 |
| manish      | fbc          |  33000 |
| parul       | sbc          |  20000 |
| sukla       | sbc          |  38500 |
+-------------+--------------+--------+
5 rows in set (0.001 sec)
*/

-- 5. Find the company with the most employees.
SELECT company_name
FROM works
GROUP BY company_name
ORDER BY COUNT(*) DESC
LIMIT 1;

/* Expected output:
+--------------+
| company_name |
+--------------+
| fbc          |
+--------------+
1 row in set (0.001 sec)
*/