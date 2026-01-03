/*SUM: retorna a soma de todos os valores*/
SELECT SUM(salary) FROM salaries;

/*com WHERE*/
SELECT SUM(salary) AS opa FROM salaries WHERE salary > 150000;

