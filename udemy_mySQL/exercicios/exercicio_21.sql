CREATE DATABASE IF NOT EXISTS banco;
USE banco;

CREATE TABLE IF NOT EXISTS contas(
id_conta INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome VARCHAR(100) NOT NULL,
sobrenome VARCHAR(100) NOT NULL,
saldo DECIMAL(10,2),
data_nascimento DATE NOT NULL
);

CREATE INDEX index_saldo
ON contas(saldo);

INSERT INTO contas(nome, sobrenome, saldo, data_nascimento) VALUES
('samuel', 'felipe', '1900.89', '2005-11-03'),
('fernando', 'silva', '2093.53', '1990-05-08'),
('maria', 'fernanda', '3000.23', '2000-03-01');

SELECT * FROM contas; 