-- Problem: DataLemur: Well-Paid Employees
-- Title: Well-Paid Employees
-- Difficulty: Easy
-- Description: Given the table `employee`, write a SQL query to find employees who are paid more than their managers.


SELECT e.employee_id,
       e.name 
FROM employee e
JOIN employee m 
  ON m.employee_id = e.manager_id 
WHERE e.salary > m.salary;
