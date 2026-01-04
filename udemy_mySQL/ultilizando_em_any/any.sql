USE employees;
/*ANY: vai retornar os resultados que recebem TRUE da Subquery*/
SELECT first_name 
FROM employees
WHERE emp_no = ANY (
	SELECT emp_no
    FROM salaries
    WHERE salary > 150000
);