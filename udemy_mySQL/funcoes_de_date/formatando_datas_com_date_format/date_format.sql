USE sakila;
/*DATE_FORMAT: formata uma data com um padrão indicado*/
-- DATE_FORMAT(<data>, <formato>);
-- %Y, retorna o ano completo
SELECT DATE_FORMAT(last_update, '%Y') AS ano FROM actor;
-- %y retorna os dois ultimo numeros do ano
SELECT DATE_FORMAT(last_update, '%y') AS 'ano incompleto' FROM actor;
-- %M retorna o mes escrito
SELECT DATE_FORMAT(last_update, '%M') AS mes FROM actor;
-- %m retorna o mes numerico
SELECT DATE_FORMAT(last_update, '%m') AS mes FROM actor;
-- %D retorna como <numero> th 
SELECT DATE_FORMAT(last_update, '%D') AS mes FROM actor;
-- %d retorna normal
SELECT DATE_FORMAT(last_update, '%d') AS mes FROM actor;
-- completo
SELECT DATE_FORMAT(last_update, '%d/%m/%Y') AS mes FROM actor;