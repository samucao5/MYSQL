USE sakilla;
/*COUNT: conta o numero de ocorrencias de uma determinada coluna*/
-- COUNT(<coluna>);
SELECT COUNT(*) AS numeros_de_atores FROM actor;

SELECT COUNT(first_name) FROM actor WHERE first_name = 'PENELOPE';
