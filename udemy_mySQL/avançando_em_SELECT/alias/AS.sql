USE employees;
/*ALIAS: tem como função renomear um coluna com nome não objetivo ou coluna originadas de função*/
SELECT SUM(salary) AS soma_de_salarios_acima_de_140000 FROM salaries WHERE salary > 140000;

SELECT COUNT(*) AS sobrenome_Bamford FROM employees WHERE last_name = 'Bamford';

SELECT AVG(salary) AS media_salario FROM salaries;

SELECT MIN(salary) AS menor_salario FROM salaries;

/*caso queira colocar algum acento ou caractere especial*/
SELECT MAX(salary) AS 'maior_Salário' FROM salaries;

SELECT first_name AS primeiro_nome, last_name AS sobrenome FROM employees;