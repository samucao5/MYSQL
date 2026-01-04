USE employees;
/*HAVING: e semelhante ao WHERE porem vamos utilizar eles com aggregate functions(SUM, AVG, GROUP BY)*/

SELECT salary , COUNT(salary) FROM salaries
GROUP BY salary
HAVING COUNT(salary) >= 90
ORDER BY COUNT(salary) DESC;

SELECT salary , COUNT(salary) FROM salaries
GROUP BY salary
HAVING salary >= 100000
ORDER BY salary DESC;