CREATE DATABASE IF NOT EXISTS banco_de_dados;
USE banco_de_dados;

CREATE TABLE IF NOT EXISTS funcionarios(
id_funcionario INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_funcionario VARCHAR(100) NOT NULL,
idade INT NOT NULL,
cargo VARCHAR(100)
);

INSERT INTO funcionarios(nome_funcionario, idade, cargo) 
VALUES
('samuel',19,'programador'),
('allan',18,'programador');
