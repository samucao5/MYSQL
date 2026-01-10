CREATE DATABASE IF NOT EXISTS relacao;
USE relacao;

CREATE TABLE IF NOT EXISTS autores(
id_autor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_autor VARCHAR(100) NOT NULL,
cidade_nascimento TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS livros(
id_livro INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
titulo_livro VARCHAR(100) NOT NULL,
qts_paginas INT NOT NULL,
id_autor INT NOT NULL,
FOREIGN KEY (id_autor)
REFERENCES autores(id_autor)
);

INSERT INTO autores(nome_autor, cidade_nascimento) 
VALUES
('Samuel', 'Sao paulo'),
('Isabele', 'Rio de Janeiro');

INSERT INTO livros(titulo_livro, qts_paginas, id_autor)
VALUES
('livro bom', 200, 1),		
('informatica avancada', 543, 2);

SELECT l.titulo_livro AS 'titulo livro', 
l.qts_paginas AS 'quantidade de paginas', 
a.nome_autor AS 'nome do autor' 
FROM livros l
LEFT JOIN autores a ON l.id_autor = a.id_autor;