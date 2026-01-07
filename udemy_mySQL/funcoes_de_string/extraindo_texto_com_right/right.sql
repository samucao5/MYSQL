USE sakila;
/*RIGHT: remove uma quantidade de caracteres de uma string*/
-- A remoção acontece da direita para a esquerda
-- RIGHT(<string>, 7);
SELECT title, RIGHT(title, 8) AS 'remoção de 8 caracteres' FROM film WHERE film_id = 1;

SELECT first_name, RIGHT(first_name, 3) AS 'remoção de 3 caracteres' FROM actor;