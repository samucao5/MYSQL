CREATE DATABASE IF NOT EXISTS relacao;
USE relacao;

DROP DATABASE IF EXISTS relacao;

CREATE TABLE IF NOT EXISTS estudantes(
id_estudante INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_estudante VARCHAR(100) NOT NULL,
idade INT NOT NULL
);

CREATE TABLE IF NOT EXISTS contatos(
id_contato INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_estudante INT NOT NULL,
telefone char(12) NOT NULL,
FOREIGN KEY (id_estudante) -- faz referencia a esta tabela
REFERENCES estudantes (id_estudante) -- faz referencia a outra tabela
);

INSERT INTO estudantes(nome_estudante, idade)
VALUES 
('pedro','16'),
('julia', '17');

INSERT INTO contatos(id_estudante, telefone)
VALUES 
(1,559994349333),
(2,559943432563);

SELECT c.id_contato, e.nome_estudante, e.idade, c.telefone FROM contatos c
LEFT JOIN estudantes e ON c.id_estudante = e.id_estudante;


