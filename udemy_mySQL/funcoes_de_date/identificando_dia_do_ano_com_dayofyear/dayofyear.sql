USE sakila;
/*DAYOFYEAR: retorna o dia do ano de uma determinada data*/
-- DAYOFYEAR (<data>);
SELECT last_update,
DAYOFYEAR(last_update) AS 'dia do ano',
DAYOFYEAR(ADDDATE(last_update ,INTERVAL 6 MONTH)) AS 'dia do ano com 6 meses'
FROM actor;
