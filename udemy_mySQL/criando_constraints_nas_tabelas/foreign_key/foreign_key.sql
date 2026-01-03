CREATE DATABASE IF NOT EXISTS constraints;
USE constraints;
/*FOREIGN LEY: é uma ligação de uma tabela a outra*/
CREATE TABLE IF NOT EXISTS pessoas(
id_pessoa INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_pessoa VARCHAR(100) NOT NULL,
idade INT NOT NULL
);

CREATE TABLE IF NOT EXISTS enderecos (
id_endereco INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
endereco TEXT NOT NULL,
id_pessoa INT NOT NULL,
FOREIGN KEY (id_pessoa)
REFERENCES pessoas(id_pessoa)
);

INSERT INTO pessoas(nome_pessoa, idade) 
VALUES 
('Samuel', 20),
('Maria', 20);

INSERT INTO enderecos(endereco, id_pessoa)
VALUES
('rua 7', 1),
('rua 90', 2);

SELECT * FROM pessoas;

SELECT * FROM enderecos;