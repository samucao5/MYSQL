USE employees;
/*MIN: esta função tem como objetivo retornar o menor valor da tabela*/
/*aparece o funcionario mais antigo da empresa*/
SELECT MIN(emp_no) FROM employees;
/*caso queira colocar o nome da pessoa e o min*/

SELECT emp_no, first_name, last_name
FROM employees
WHERE emp_no = (SELECT MIN(emp_no) FROM employees);

/*aparecer tudo*/

SELECT *
FROM employees
WHERE emp_no = (SELECT MIN(emp_no) FROM employees);


