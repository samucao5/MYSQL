USE employees;
/*BETWEEN: ele recebe uma faixa de valores*/
SELECT * FROM dept_emp WHERE dept_no BETWEEN 'd005' AND 'd008';

SELECT * FROM employees WHERE birth_date BETWEEN '1950-01-01' AND '1953-01-01' AND gender = 'F';