USE sakila;
/*INSTR: retorna a posição do caractere ou string que estamos buscando em uma string*/
-- INSTR(<string>. 'a');
SELECT a.first_name, INSTR(a.first_name, 's') AS 'quantidade de s' FROM actor a;

SELECT c.email, INSTR(c.email, '@') AS 'quantos @' FROM customer c;