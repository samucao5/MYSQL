USE sakila;
/*DAY: retorna o dia da data utilizada na função*/
-- DAY(<data>);
SELECT last_update ,
DAY(last_update) AS 'dia',
DAY(ADDDATE(last_update, '8 dias')) AS 'mais 8 dias' 
FROM actor;