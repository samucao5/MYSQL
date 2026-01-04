USE employees;
/*EXISTS: serve para checar se existe algum registro em alguma subquery*/
SELECT emp_no, first_name, last_name, (
	SELECT SUM(salary)
    FROM salaries
    WHERE employees.emp_no = salaries.emp_no
) AS soma_salario
FROM employees
WHERE EXISTS (
/*SELECT 1: Retorne qualquer coisa, porque eu só quero saber se existe linha */
  SELECT 1
  FROM salaries
  WHERE employees.emp_no = salaries.emp_no
  GROUP BY emp_no
  HAVING SUM(salary) > 1000000
);

