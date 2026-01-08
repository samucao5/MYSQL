USE sakila;
/*MIN: retorna o menor valor de uma coluna*/
-- MIN(<coluna>);
SELECT MIN(amount) AS 'menor pagamento' FROM payment;
