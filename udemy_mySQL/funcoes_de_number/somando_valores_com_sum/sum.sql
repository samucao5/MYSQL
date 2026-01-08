USE sakila;
/*SUM: retorna a soma dos valores de uma coluna*/
-- SUM(<coluna>);
SELECT SUM(amount) AS 'soma pagamentos' FROM payment;