USE employees;
/*DELIMITER: cada final de query adicionamos, para que o mysql entenda o fim da query*/
-- DELIMITER ; ou qualquer outra coisa como: // ou $, são os mais usados
DELIMITER //
SELECT * FROM salaries
//

