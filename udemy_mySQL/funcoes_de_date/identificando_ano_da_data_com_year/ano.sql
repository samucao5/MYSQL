USE sakila;
/*YEAR: extrai o ano de uma determinada data*/
/*YEAR(<data>); */
SELECT last_update, YEAR(last_update) AS ano FROM actor;