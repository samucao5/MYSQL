CREATE DATABASE IF NOT EXISTS mercado;
USE mercado;
CREATE TABLE IF NOT EXISTS funcionarios(
id_funcionario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_funcionario VARCHAR(100) NOT NULL,
idade_funcionario INT NOT NULL
);

INSERT INTO funcionarios(nome_funcionario, idade_funcionario)
VALUES
('Pedro', 29),
('rafael', 19);

SELECT id_funcionario, nome_funcionario FROM funcionarios WHERE idade_funcionario > 19;
