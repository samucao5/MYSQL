USE sakila;
/*DAYOFWEEK: retorna o dia da semana de uma determinada data*/
-- DAYOFWEEK(<data>);
-- o resultado e o dia da semana em numero
SELECT last_update,
DAYOFWEEK(last_update) AS 'dia da semana',
DAYOFWEEK(ADDDATE(last_update, '5') ) AS 'mais 5 dias'
FROM actor;
