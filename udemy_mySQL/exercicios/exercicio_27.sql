USE sakila;
SELECT actor_id,CONCAT(first_name,' ',last_name) AS nome_e_sobrenome
FROM actor;