USE sakila;
/*CHAR_LENGHT: nos retorna o numero de caracteres de uma string de uma determinada coluna*/
/*ex: CHAR_LENGHT(<nome_da_coluna>)*/
SELECT first_name, CHAR_LENGTH(first_name) AS quantidade_de_letras 
from actor
WHERE CHAR_LENGTH(first_name) > 5
ORDER BY quantidade_de_letras ASC;