USE employees;
/*UNION ALL: ultilzado para combinar o resultado de dois ou mais selects*/
/*repete tudo*/
SELECT dept_no FROM departments
UNION ALL SELECT dept_no FROM dept_emp ORDER BY dept_no ASC;