USE employees;

SELECT hire_date AS 'data contratação', COUNT(hire_date) AS 'quantidade contratados'
FROM employees
GROUP BY hire_date
ORDER BY hire_date ASC;