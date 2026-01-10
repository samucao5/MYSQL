CREATE DATABASE IF NOT EXISTS relacao;
USE relacao;

CREATE TABLE IF NOT EXISTS alunos(
id_aluno INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_aluno VARCHAR(100) NOT NULL,
idade_aluno INT NOT NULL
);

CREATE TABLE IF NOT EXISTS turmas(
id_turma INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
numero_da_turma INT NOT NULL
);

CREATE TABLE IF NOT EXISTS aluno_turma(
id_aluno_turma INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
id_aluno INT NOT NULL,
id_turma INT NOT NULL,
FOREIGN KEY (id_aluno)
REFERENCES alunos(id_aluno),
FOREIGN KEY (id_turma)
REFERENCES turmas(id_turma)
);

INSERT INTO alunos(nome_aluno, idade_aluno)
VALUES 
('Luiz', '14'),
('Julio', '17');

INSERT INTO turmas(numero_da_turma)
VALUES
(601),
(2003);

INSERT INTO aluno_turma(id_aluno, id_turma)
VALUES
(1,1),
(2,2);

SELECT * FROM alunos;

SELECT * FROM turmas;

SELECT att.id_aluno_turma AS 'id aluno turma',a.nome_aluno AS 'nome aluno', a.idade_aluno AS 'idade aluno', t.numero_da_turma AS 'numero da turma'
FROM aluno_turma att
LEFT JOIN alunos a ON att.id_aluno = a.id_aluno
LEFT JOIN turmas t ON att.id_turma = t.id_turma;
