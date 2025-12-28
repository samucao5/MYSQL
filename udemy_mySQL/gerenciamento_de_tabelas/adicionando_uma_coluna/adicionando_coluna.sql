CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;
CREATE TABLE IF NOT EXISTS funcionarios(
id_funcionarios INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_funcionario VARCHAR(100) NOT NULL,
cargo VARCHAR(100) NOT NULL
);

ALTER TABLE funcionarios 
ADD COLUMN salario DECIMAL (10, 2);

INSERT INTO funcionarios(nome_funcionario, cargo, salario)
VALUES
('Pedro', 'administrador', 2567.45),
('Julia', 'veterinaria', 1906.43);

SELECT * FROM funcionarios;