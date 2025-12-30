CREATE DATABASE IF NOT EXISTS escola;
USE escola;
CREATE TABLE IF NOT EXISTS professores(
id_professor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_professor VARCHAR(100) NOT NULL,
idade INT NOT NULL,
materia VARCHAR(100) NOT NULL
);

INSERT INTO professores(nome_professor,idade,materia)
VALUES
('Samuel', 20, 'informatica'),
('Pedro',21,'ed.fisica');

/*UPDATE tabela SET <coluna=valor> WHERE <condição>;*/
UPDATE professores SET materia = 'fisica' WHERE id_professor = 2;

SELECT * FROM professores;