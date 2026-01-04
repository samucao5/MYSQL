USE employees;

SELECT hire_date AS 'data contratação', COUNT(hire_date) AS 'quantidade contratados' FROM employees
GROUP BY hire_date
HAVING COUNT(hire_date) < 50
ORDER BY COUNT(hire_date) DESC;