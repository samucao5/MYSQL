USE sakila;
/*FORMAT:vai formatar um numeor com um numero de casa s determinado por argumentos*/
/*FORMAT(numero,2);*/
SELECT customer_id, amount, FORMAT(amount,1) AS uma_casa_decimal FROM payment;