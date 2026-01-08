USE sakila;
/*FLOOR:arredonda numeros com casas decimais para baixo*/
-- FLOOR(<numero>);
SELECT amount,
FLOOR(amount) AS 'arredondando para baixo',
FORMAT(FLOOR(amount),2) AS 'FORMAT + FLOOR' 
FROM payment;

