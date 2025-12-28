CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;
CREATE TABLE IF NOT EXISTS funcionarios(
id_funcionarios INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_funcionario VARCHAR(100) NOT NULL,
cargo VARCHAR(100) NOT NULL
);

ALTER TABLE funcionarios 
ADD COLUMN salario DECIMAL (10, 2);

ALTER TABLE funcionarios
ADD COLUMN cpf CHAR(11);

INSERT INTO funcionarios(nome_funcionario, cargo, salario, cpf)
VALUES
('Pedro', 'administrador', 2567.45,'11111111111'),
('Julia', 'veterinaria', 1906.43,'11111111112');

SELECT * FROM funcionarios;