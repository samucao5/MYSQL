USE sakila;
/*CONCAT_WS concatena duas ou mais strings, porem com um separador comum*/
/*SELECT CONCAT_WS(' ', 'nome');*/
/*o primeiro espaço e para colocar o que vai separar cada texto, no exemplo acima foi o espaço*/
/*mas tambem podemos usar ('-') (',') ou qualquer coisa*/
SELECT concat_ws(' ','o ator: ', a.first_name, a.last_name, 'participou este filme:', f.title) AS 'atores_e_suas_participações'
FROM film_actor fa
LEFT JOIN actor a ON fa.actor_id  = a.actor_id
LEFT JOIN film f ON fa.film_id = f.film_id;