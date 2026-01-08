USE sakila;
/*DATEDIFF: calcula a diferença de duas datas*/
-- DATEDIFF (<data1>, <data2>);
SELECT last_update, DATEDIFF(ADDDATE( last_update, INTERVAL 5 MONTH ) ,last_update) AS 'diferença em dias' FROM actor;