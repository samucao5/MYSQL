USE employees;
/*COUNT: vai contar o numero de vezes que aquele objeto aparece*/
SELECT COUNT(*) AS mulheres_com_sobrenome_simmel FROM employees WHERE last_name = 'simmel' AND gender = 'F';

SELECT COUNT(*) AS salarios_maiores_que_120000 FROM salaries WHERE salary > 120000;

