USE sakila;
/*WEEKOFYEAR: retorna a semana do ano de uma determinda data*/
-- WEEKOFYEAR (<data>);
SELECT last_update,
WEEKOFYEAR(last_update) AS 'semana do ano',
WEEKOFYEAR(ADDDATE(last_update, INTERVAL 3 WEEk)) AS 'semana do ano com mais 3 semanas' 
FROM actor;