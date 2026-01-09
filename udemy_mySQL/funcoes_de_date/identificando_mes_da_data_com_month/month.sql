USE sakila;
/*MONTH: extrai o mes de uma data*/
/*MONTH(<data>);*/
SELECT last_update , MONTH(last_update) AS mes FROM actor;
