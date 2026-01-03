USE employees;
SELECT * FROM titles WHERE title LIKE '%Engineer%';

SELECT COUNT(*) AS titulos_encontrados FROM titles WHERE title LIKE '%Engineer%';