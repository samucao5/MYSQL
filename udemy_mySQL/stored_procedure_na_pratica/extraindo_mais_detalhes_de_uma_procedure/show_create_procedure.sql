USE employees;
/*SHOW CREATE PROCEDURE: podemos analisar como uma procedure foi criada,ou seja, a query base dela*/
 -- SHOW CREATE PROCEDURE <nome>
 
 DELIMITER $
 CREATE PROCEDURE IF NOT EXISTS salarios_dos_funcionarios()
 BEGIN 
 SELECT e.emp_no , e.first_name AS 'primeiro nome', e.last_name AS 'sobrenome', e.gender AS 'genero', s.salary AS 'salario' FROM employees e
 LEFT JOIN salaries s ON e.emp_no = s.emp_no
 ORDER BY e.emp_no ASC;
 END $
 
CALL salarios_dos_funcionarios();

SHOW CREATE PROCEDURE salarios_dos_funcionarios;
 