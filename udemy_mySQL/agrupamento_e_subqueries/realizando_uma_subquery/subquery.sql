USE employees;
/*subquery: e uma query dentro de outra query*/

SELECT first_name, (
SELECT SUM(salary) FROM salaries WHERE employees.emp_no = salaries.emp_no
) AS 'soma salario' 
FROM employees
ORDER BY emp_no ASC;
