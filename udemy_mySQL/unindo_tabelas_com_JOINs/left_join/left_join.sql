USE employees;
/*LEFT JOIN: vai retornar todos os dados da tabela da esquerda e os necessarios da direita*/
SELECT * FROM departments;
SELECT * FROM dept_manager;

SELECT dept_manager.emp_no ,employees.first_name AS 'primeiro nome', employees.last_name AS 'sobrenome', departments.dept_name AS 'nome do departamento', dept_manager.from_date , dept_manager.to_date FROM dept_manager
LEFT JOIN employees ON employees.emp_no = dept_manager.emp_no
LEFT JOIN departments ON departments.dept_no = dept_manager.dept_no
ORDER BY dept_manager.from_date ASC;