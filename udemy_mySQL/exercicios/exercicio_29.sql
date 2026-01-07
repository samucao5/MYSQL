USE sakila;
SELECT LCASE(REPLACE(first_name, 'Mary', 'MARY' )) AS nome,
LCASE(replace(last_name,'smith', 'SMITH')) AS sobrenome
FROM customer
WHERE last_name = 'SMITH';