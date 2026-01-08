USE sakila;
/*ADDDATE: adiciona ou remove uma quantidade horas, dias, meses ou anos a uma data*/
/*ADDDATE (<coluna>, <data para adicionar>); */
SELECT last_update, ADDDATE(last_update, "10 dias") AS 'mais 10 dias',
ADDDATE(last_update, INTERVAL 3 MONTH) AS 'mais 3 meses',
ADDDATE(last_update, INTERVAL -5 YEAR) AS 'menos 5 anos'
FROM actor;