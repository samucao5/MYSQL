USE sakila;
/*SUBSTR: extrai uma string a partir de dois indices, inicio e fim*/
-- SUBSTR(<texto>, <inicio>, <fim>);

SELECT last_update, SUBSTR(last_update, 1, 4) AS ano,
 SUBSTR(last_update,6,2) AS mes,
 SUBSTR(last_update,9,2) AS dia,
 SUBSTR(last_update,12,8) AS horas
 FROM actor;