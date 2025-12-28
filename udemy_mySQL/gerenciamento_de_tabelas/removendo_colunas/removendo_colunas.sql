CREATE DATABASE IF NOT EXISTS lojas;
USE lojas;
CREATE TABLE IF NOT EXISTS produtos(
id_produto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_produto VARCHAR(100),
nome_funcionario VARCHAR(100)
);

ALTER TABLE produtos 
DROP COLUMN nome_funcionario;

SELECT * FROM produtos;