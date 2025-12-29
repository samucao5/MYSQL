CREATE DATABASE IF NOT EXISTS cadastros;
USE cadastros;
CREATE TABLE IF NOT EXISTS pessoas(
id_pessoa INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_pessoa VARCHAR(100) NOT NULL,
rg_pessoa CHAR(11) NOT NULL,
cpf_pessoa CHAR(11) NOT NULL,
limite INT NOT NULL
);

INSERT INTO pessoas(nome_pessoa, rg_pessoa, cpf_pessoa, limite)
VALUES
('Samuel', '11111111111', '22222222222', 5),
('Pedro', '11211211211', '22122122122', 4),
('Geovane', '21121121121', '12212212212', 3),
('Joao', '31131131131', '42242242242', 2),
('Isa', '61161161161', '72272272221', 1);

SELECT * FROM pessoas;