USE employees;
/*operadores de comparação*/
/* > : maior*/
/*o birth_date tem que ser maior que '1960-01-01*/
SELECT emp_no, first_name, last_name, birth_date FROM employees WHERE birth_date > '1960-01-01';

/* < : menor*/
/*o birth_date tem que ser igual que '1960-01-01*/
SELECT emp_no, first_name, last_name, birth_date FROM employees WHERE birth_date < '1960-01-01';

/* >= : maior ou igual*/
/*o birth_date tem que ser maior ou igual que '1965-01-01*/
SELECT emp_no, first_name, last_name, birth_date FROM employees WHERE birth_date >= '1965-01-01';

/* <= : menor ou igual*/
/*o birth_date tem que ser menor ou igual que '1963-01-01*/
SELECT emp_no, first_name, last_name, birth_date FROM employees WHERE birth_date <= '1963-01-01';

/* = : igual*/
/*o birth_date tem que ser menor ou igual que '1960-01-01*/
SELECT emp_no, first_name, last_name, birth_date FROM employees WHERE birth_date = '1960-01-01';

/*caso queira procurar pelo sobrenome ou id*/
SELECT emp_no, first_name, last_name, birth_date FROM employees WHERE last_name = 'Rosch';

SELECT emp_no, first_name, last_name, birth_date FROM employees WHERE emp_no = 10001;