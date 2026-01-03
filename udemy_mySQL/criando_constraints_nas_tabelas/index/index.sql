CREATE DATABASE IF NOT EXISTS constraints;
USE constraints;
/*INDEX: adicionar um indice a uma coluna faz a consulta que envolva a mesma se tornar mais rapida*/
CREATE INDEX index_nome 
ON pessoas(nome_pessoa);

/*para remover e so DROP INDEX <nome> ON <tabela>;*/
DROP INDEX index_nome ON pessoas;

