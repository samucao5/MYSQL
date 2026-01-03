USE employees;

SELECT employees.emp_no ,employees.first_name AS 'primeiro nome', employees.last_name AS 'sobrenome', titles.title AS 'cargo' ,salaries.salary AS 'salario'  FROM employees
INNER JOIN titles ON titles.emp_no = employees.emp_no
INNER JOIN salaries ON salaries.emp_no = employees.emp_no
ORDER BY salaries.salary DESC;