USE sakila;
/*LEFT: remove uma quantidade de caracteres de uma string*/
-- A remoção acontece da esquerda para a direita
-- LEFT(<string>, 5);
SELECT title, LEFT(title, 8) AS 'remoção de 8 caracteres' FROM film WHERE film_id = 1;

SELECT first_name, LEFT(first_name, 3) AS 'remoção de 3 caracteres' FROM actor;