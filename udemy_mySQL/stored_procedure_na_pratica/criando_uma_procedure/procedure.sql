USE employees;
/*
DELIMITER $
para criar a procedure usamos: 

DELIMITER $
CREATE PROCEDURE nome()
BEGIN

END $

alem de alterar o delimiter temos que ultilizar outros recursos
BEGIN: inicia a procedure;
END: finaliza a procedure;
CALL: tem como função chamar a procedure
*/

DELIMITER $
CREATE PROCEDURE IF NOT EXISTS nome_completo()
BEGIN
	SELECT CONCAT_WS(" ",first_name, last_name) 
    AS 'nome completo' 
    FROM employees;
    
END $

CALL nome_completo;