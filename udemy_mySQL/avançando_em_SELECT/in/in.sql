USE employees;
/*IN: vai fazer uma busca por um conjunto de valores*/
SELECT emp_no ,first_name, last_name FROM employees WHERE emp_no IN ( 10001, 10005, 10002) ORDER BY emp_no ASC;

SELECT * FROM departments WHERE dept_name IN ('Development' , 'Marketing');