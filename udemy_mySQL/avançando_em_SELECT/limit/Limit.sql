USE employees;
/*LIMIT tem como principal objetivo limitar os resultados e tornar a consulta mais rapida*/
/*normalmente e a ultima coisa ao qual voce coloca no codigo*/
SELECT * FROM employees LIMIT 5;

SELECT emp_no, first_name, last_name, gender, birth_date FROM employees WHERE gender = 'F' AND last_name = 'simmel' LIMIT 5;