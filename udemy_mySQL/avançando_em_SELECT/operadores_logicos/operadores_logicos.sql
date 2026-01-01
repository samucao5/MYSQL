USE employees;
SELECT * FROM employees;
/*AND: recebe duas condições e so se retorna verdadeira caso as duas sejam verdadeiras*/
/*mostra funcionarios que tenham nascido depois de 1960-01-01 e seja do genero masculino*/
SELECT emp_no, first_name, last_name FROM employees WHERE birth_date > '1960-01-01' AND gender = 'M';

/*OR: Recebe duas condições caso uma delas seja verdadeira ela retorna verdadeira*/
/*mostra funcionarios que sejam do sexo feminino ou funcionarios nascido depois de 1960-01-01*/
SELECT emp_no, first_name, last_name, birth_date, gender FROM employees WHERE birth_date > '1960-01-01' OR gender = 'F' LIMIT 10;

/*NOT: inverte uma clausura*/
/*no exemplo abaixo ele aparece todos os genero que não sao masculino e que não que não tenham nascido depois de 1960-01-01 */
SELECT emp_no, first_name, last_name, birth_date ,gender FROM employees WHERE NOT gender = 'M' AND NOT birth_date > '1960-01-01';

