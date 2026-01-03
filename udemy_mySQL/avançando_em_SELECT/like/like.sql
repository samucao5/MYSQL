USE employees;
/*LIKE: ele tem a premissa de filtra ainda mais nossos resultados*/
/* LIKE '% palavra': ele procura no final da palavra*/
SELECT * FROM employees WHERE first_name LIKE '%a';

/* LIKE 'palavra %': ele procura no começo da palavra*/
SELECT * FROM employees WHERE first_name LIKE 'sam%';

/* LIKE '% palavra %': tanto no começo como no final da palavra*/
SELECT * FROM employees WHERE first_name LIKE '%samu%';

/*podemos usar com o count*/

SELECT COUNT(*) AS nome_que_tem_pe FROM employees WHERE first_name LIKE '%pe%';
