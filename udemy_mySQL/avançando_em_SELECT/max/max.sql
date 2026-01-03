USE employees;
/*MAX: esta função tem como objetivo retornar o maior valor da tabela*/
/*aparece o maior salario da empresa*/
SELECT MAX(salary) FROM salaries;
/*caso queira colocar a tag e o max*/

SELECT emp_no, salary
FROM salaries
WHERE salary = (SELECT MAX(salary) FROM salaries);

/*aparecer tudo*/

SELECT *
FROM salaries
WHERE salary = (SELECT MIN(salary) FROM salaries);