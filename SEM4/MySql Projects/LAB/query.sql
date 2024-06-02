-- this is the query coomand for the sql database lab. this consist of all solutions of problems from the db lab.
-- make sure you have created and imported the values of the database lab.
-- if not, run these tow command before running this query.sql
    -- CMD C:\> mysql -u {username} < create.sql
    -- CMD C:\> mysql -u {username} < insert.sql

-- using the created database.
USE lab;

-- 1. Query to display Employee Name, Job, Hire Date, Employee Number; for each employee with the Employee Number appearing first. 
SELECT eno, ename, job_type, hire_date
FROM employee;

-- 2. Query to display unique Jobs from the Employee Table. 
SELECT DISTINCT job_type
FROM employee;

-- 3. Query to display the Employee Name concatenated by a Job separated by a comma. 
SELECT CONCAT(ename, ", ", job_type)
FROM employee; 

-- 4. Query to display all the data from the Employee Table. Separate each Column by a comma and name the said column as THE_OUTPUT. 
SELECT CONCAT(eno, ", ", ename, ", ", job_type, ", ", COALESCE(manager, 'NULL'), ", ", hire_date, ", ", dno,", ", COALESCE(commission, 'NULL'), ", ", salary) as "THE_OUTPUT"
FROM employee;

-- 5. Query to display the Employee Name and Salary of all the employees earning more than $2850. 
SELECT ename, salary 
FROM employee 
WHERE salary > 30000; -- modified the salary value as in our case the salary is more then 2850 or we can say it is in indian salary;

-- 6. Query to display Employee Name and Department Number for the Employee No= 7900. 
SELECT ename, dno
FROM employee
WHERE eno = 23; -- we are using 23 because we don't have eno 7900.

-- 7. Query to display Employee Name and Salary for all employees whose salary is not in the range of $1500 and $2850. 
SELECT ename, salary
FROM employee
WHERE salary BETWEEN 30000 AND 32000; -- again we are using different values cause our values are not in same as these.

-- 8. Query to display Employee Name and Department No. of all the employees in Dept 10 and Dept 30 in the alphabetical order by name. 
SELECT ename, dno
FROM employee
WHERE dno in (1,3) -- dont worry about the values just change.
ORDER BY ename;

-- 9. Query to display Name and Hire Date of every Employee who was hired in 1981.
SELECT ename, hire_date
FROM employee
WHERE hire_date like "2023%"; -- we are going to use 2023 couse our field doesn't have 1981.

-- 10. Query to display Name and Job of all employees who don't have a current Manager. 
SELECT ename, job_type
FROM employee
WHERE manager IS NULL;

-- 11. Query to display the Name, Salary and Commission for all the employees who earn commission. 
SELECT ename, salary, commission
FROM employee
WHERE commission IS NOT NULL;

-- 12. Sort the data in descending order of Salary and Commission. 
SELECT * FROM employee
ORDER BY salary DESC, commission DESC; 

-- 13. Query to display Name of all the employees where the third letter of their name is ‗A'.
SELECT ename
FROM Employee
WHERE SUBSTRING(ename, 3, 1) = 'A';

-- 14. Query to display Name of all employees either have two ‗R's or have two ‗A's in their name and are either in Dept No = 30 or their Manger's Employee No = 7788. 
SELECT ename
FROM Employee
WHERE 
    (ename LIKE '%R%R%' OR ename LIKE '%A%A%')
    AND (dno = 3 OR manager = '002'); -- we are using dno 3 and manager 002 cause this is what we have.

-- 15. Query to display Name, Salary and Commission for all employees whose Commission Amount is 14 greater than their Salary increased by 5%. 
SELECT ename, salary, commission
FROM Employee
WHERE commission = salary * 1.05 + 14;

-- 16. Query to display the Current Date. 
SELECT CURDATE() as TODAY;

-- 17. Query to display Name, Hire Date and Salary Review Date which is the 1st Monday after six months of employment. 
SELECT
    ename,
    hire_date,
    DATE_ADD(DATE_ADD(hire_date, INTERVAL 6 MONTH), INTERVAL (7 - WEEKDAY(DATE_ADD(hire_date, INTERVAL 6 MONTH))) DAY) AS salary_review_date
FROM
    Employee;

-- 18. Query to display Name and calculate the number of months between today and the date each employee was hired. 
SELECT
    ename,
    hire_date,
    TIMESTAMPDIFF(MONTH, hire_date, CURDATE()) AS months_since_hire
FROM
    Employee;


-- 19. Query to display the following for each employee <E-Name> earns < Salary> monthly but wants < 3 * Current Salary >. Label the Column as Dream Salary.
SELECT 
    ename AS "Employee Name",
    salary AS "Salary",
    salary * 3 AS "Dream Salary"
FROM 
    Employee;


-- 20. Query to display Name with the 1st letter capitalized and all other letter lower case and length of their name of all the employees whose name starts with ‗J', 'A' and ‗M'. 
SELECT
    CONCAT(UCASE(LEFT(ename, 1)), LCASE(RIGHT(ename, LENGTH(ename) - 1))) AS "Name",
    LENGTH(ename) AS "Name Length"
FROM 
    Employee
WHERE 
    ename LIKE 'J%' OR ename LIKE 'A%' OR ename LIKE 'M%';

-- 21. Query to display Name, Hire Date and Day of the week on which the employee started. 
SELECT 
    ename AS "Employee Name",
    hire_date AS "Hire Date",
    DAYNAME(hire_date) AS "Day of the Week"
FROM 
    Employee;


-- 22. Query to display Name, Department Name and Department No for all the employees. 
SELECT 
    e.ename AS "Employee Name",
    d.dname AS "Department Name",
    e.dno AS "Department No"
FROM 
    Employee e
JOIN 
    Department d ON e.dno = d.dno;

-- 23. Query to display Unique Listing of all Jobs that are in Department # 30. 
SELECT DISTINCT 
    job_type
FROM 
    Employee
WHERE 
    dno = 3;

-- 24. Query to display Name, Dept Name of all employees who have an ‗A' in their name.
SELECT
    ename,
    dname
FROM
    employee e
JOIN department d on d.dno = e.dno
WHERE SUBSTRING(ename, 3,1) = 'A';

-- 25. Query to display Name, Job, Department No. And Department Name for all the employees working at the Dallas location. 
SELECT 
    e.ename AS "Employee Name",
    e.job_type AS "Job",
    e.dno AS "Department No",
    d.dname AS "Department Name"
FROM 
    Employee e
JOIN 
    Department d ON e.dno = d.dno
WHERE 
    d.dlocation = 'Houston'; -- our db doesn't have Dallas so we are using Hauston.


-- 26. Query to display Name and Employee no. Along with their Manger's Name and the Manager's employee no; along with the Employees' Name who do not have a Manager. 
SELECT 
    e1.ename AS "Employee Name",
    e1.eno AS "Employee Number",
    e2.ename AS "Manager Name",
    e2.eno AS "Manager Number"
FROM 
    Employee e1
LEFT JOIN 
    Employee e2 ON e1.manager = e2.eno;

-- 27. Query to display Name, Dept No. And Salary of any employee whose department No. and salary matches both the department no. And the salary of any employee who earns a commission. 
SELECT 
    e.ename AS "Employee Name",
    e.dno AS "Department Number",
    e.salary AS "Salary"
FROM 
    Employee e
WHERE 
    EXISTS (SELECT * FROM Employee WHERE dno = e.dno AND commission IS NOT NULL)
    AND EXISTS (SELECT * FROM Employee WHERE salary = e.salary AND commission IS NOT NULL)
ORDER BY 2;

-- 28. Query to display Name and Salaries represented by asterisks, where each asterisk (*) signifies $100. 
SELECT 
    ename AS "Employee Name",
    CONCAT(REPEAT('*', salary/100)) AS "Salary (in $100)"
FROM 
    Employee;


-- 29. Query to display the Highest, Lowest, Sum and Average Salaries of all the employees 
SELECT 
    MAX(salary) AS "Highest Salary",
    MIN(salary) AS "Lowest Salary",
    SUM(salary) AS "Total Salary",
    AVG(salary) AS "Average Salary"
FROM 
    Employee;

-- 30. Query to display the number of employees performing the same Job type functions.
SELECT 
    job_type,
    COUNT(*) AS "Number of Employees"
FROM 
    Employee
GROUP BY 
    job_type;

-- 31. Query to display the no. of managers without listing their names.
SELECT 
    COUNT(DISTINCT manager) AS "Number of Managers"
FROM 
    Employee;


-- 32 Query to display the Department Name, Location Name, No. of Employees, and the average salary for all employees in that department.
SELECT 
    d.dname AS "Department Name",
    d.dlocation AS "Location Name",
    COUNT(*) AS "Number of Employees",
    AVG(e.salary) AS "Average Salary"
FROM 
    Employee e
JOIN 
    Department d ON e.dno = d.dno
GROUP BY 
    d.dname;

-- 33 Query to display Name and Hire Date for all employees in the same dept. as Blake.
SELECT 
    ename AS "Employee Name",
    hire_date AS "Hire Date"
FROM 
    Employee
WHERE 
    dno = (SELECT dno FROM Employee WHERE ename = 'Blake');

-- 34 Query to display the Employee No. And Name for all employees who earn more than the average salary.
SELECT 
    eno AS "Employee Number",
    ename AS "Employee Name"
FROM 
    Employee
WHERE 
    salary > (SELECT AVG(salary) FROM Employee);

-- 35 Query to display Employee Number and Name for all employees who work in a department with any employee whose name contains a 'T'.
SELECT 
    e.eno AS "Employee Number",
    e.ename AS "Employee Name"
FROM 
    Employee e
JOIN 
    Department d ON e.dno = d.dno
WHERE 
    EXISTS (SELECT * FROM Employee WHERE dno = d.dno AND ename LIKE '%T%');

-- 36 Query to display the names and salaries of all employees who report to King.
SELECT 
    e.ename AS "Employee Name",
    e.salary AS "Salary"
FROM 
    Employee e
JOIN 
    Employee m ON e.manager = m.eno
WHERE 
    m.ename = 'King';

-- 37 Query to display the department no, name, and job for all employees in the Sales department.
SELECT 
    e.dno AS "Department No",
    d.dname AS "Department Name",
    e.job_type AS "Job"
FROM 
    Employee e
JOIN 
    Department d ON e.dno = d.dno
WHERE 
    d.dname = 'Sales';