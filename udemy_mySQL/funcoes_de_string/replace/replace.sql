USE sakila;
/*REPLACE: troca alguma parte de uma string por outra enviada po parametro*/
/*REPLACE(<text>, <antigo>, <novo>)*/
SELECT * FROM category;
SELECT REPLACE (name, "Horror", "Horror history") FROM category;