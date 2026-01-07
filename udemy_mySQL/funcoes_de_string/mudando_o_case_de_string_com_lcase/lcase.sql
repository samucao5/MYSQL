USE sakila;
/*LCASE: transforma todo o texto retornado para lower case, ou seja, letra minuscula*/
/*LCASE('ALGUM TEXTO');*/
SELECT a.first_name,a.last_name,
CONCAT_WS(' ', 'nome:', a.first_name, a.last_name) AS nome_completo,
LCASE(CONCAT_WS(' ', 'nome:', a.first_name, a.last_name)) AS nome_completo_minusculo 
FROM actor a;