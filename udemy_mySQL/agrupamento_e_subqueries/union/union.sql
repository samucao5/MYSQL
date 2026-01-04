USE employees;
/*UNION: é ultilizado para combinar o resultado de dois ou mais SELECT*/
SELECT dept_no FROM departments
UNION SELECT dept_no FROM dept_emp ORDER BY dept_no ASC;

SELECT emp_no FROM employees;
UNION SELECT emp_no FROM salaries;
