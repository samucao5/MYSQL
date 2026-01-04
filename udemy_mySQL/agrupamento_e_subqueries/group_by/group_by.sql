USE employees;
/*GROUP BY: serve para agruparmos colunas e checarmos quantidades de determinados elementos*/
SELECT gender, COUNT(gender) AS 'Quantidade por genero'
FROM employees
GROUP BY gender;

SELECT dept_no, COUNT(dept_no) 
FROM dept_manager
GROUP BY dept_no
