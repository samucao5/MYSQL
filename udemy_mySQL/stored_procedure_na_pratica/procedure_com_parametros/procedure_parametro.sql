USE employees;
/*
Precisamos colocar os parametros apos o nome da procedure, como se fossem parametros de função
definimos o seu tipo tambem (VARCHAR, INT e etc);
Na hora de chamar a procedure, precisamos passar o valor do parametro
isso deixa as procedures dinamicas
*/

SELECT * FROM departments;
DROP PROCEDURE IF EXISTS numero_departamento;

DELIMITER $
CREATE PROCEDURE IF NOT EXISTS numero_departamento(
IN numero_departamento char(4)
)
BEGIN
SELECT de.dept_no AS 'numero departamento',
d.dept_name AS 'nome departamento',
e.first_name AS 'primeiro nome',
e.last_name AS 'sobrenome',
e.gender AS 'genero',
t.title As 'cargo',
s.salary AS 'salario'
FROM dept_emp de
LEFT JOIN departments d ON de.dept_no = d.dept_no
LEFT JOIN employees e ON de.emp_no = e.emp_no
LEFT JOIN salaries s ON e.emp_no = s.emp_no
LEFT JOIN titles t ON e.emp_no = t.emp_no
WHERE de.dept_no = numero_departamento
ORDER BY d.dept_no ASC;
END $

CALL numero_departamento('d003');


