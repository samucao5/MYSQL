/*AVG: retorna a media de uma coluna*/
SELECT AVG(salary) AS media_do_salario FROM salaries;

/*com WHERE*/

SELECT AVG(salary) AS media_salario_acima_de_120000 FROM salaries WHERE salary > 120000;