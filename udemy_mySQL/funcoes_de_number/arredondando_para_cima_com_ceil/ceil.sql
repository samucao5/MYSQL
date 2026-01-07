USE sakila;
/*CEIL: arredonda numeros com casas decimais para cima*/
-- CEIL(<numero>);
SELECT payment_id, amount, ceil(amount) AS 'arredondando para cima',
FORMAT(CEIL(amount), 2) AS 'CEIL + format' 
FROM payment;
