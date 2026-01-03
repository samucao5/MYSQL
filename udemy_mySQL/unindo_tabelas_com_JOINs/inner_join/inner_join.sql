USE employees;
/*INNER JOIN: vai resultar nas colunas que fazem relação entre as tabelas*/
/*ambas recebem a informação */
SELECT employees.emp_no ,employees.first_name AS 'primeiro nome' , employees.last_name AS 'sobrenome ', salaries.salary AS 'salario'
FROM employees
INNER JOIN salaries 
ON salaries.emp_no = employees.emp_no;
