USE sakila;
/*ADDTIME: adiciona ou remove um tempo a um data*/
/*podemos utilizar o formato: yyyy-mm-dd hh:mm:ss*/
-- ADDTIME(<coluna>, <tempo>);
SELECT last_update, 
ADDTIME(last_update, '03 20:40:15') AS 'adicionando_com_addtime'
FROM actor WHERE actor_id = 5;