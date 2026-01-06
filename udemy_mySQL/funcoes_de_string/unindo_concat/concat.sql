USE employees;
/*CONCAT: tem como função juntar as strings*/
/*CONCAT("este", " e o ", "exemplo")*/
SELECT CONCAT(first_name,' esta na empresa desde de ', hire_date) AS entrada_de_funcionario
FROM employees;