CREATE DATABASE IF NOT EXISTS biblioteca_samuel;

CREATE TABLE IF NOT EXISTS autor(
id_autor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_autor VARCHAR(100) NOT NULL,
data_nascimento DATE NOT NULL,
local_de_nascimento VARCHAR(100) NOT NULL,
livro_destaque VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS emprestimo(
id_emprestimo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
data_emprestimo TIMESTAMP(6) NOT NULL,
data_prevista DATE NOT NULL,
data_real_devolucao DATE NOT NULL,
status_emprestimo VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS cliente(
id_cliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_cliente VARCHAR(100) NOT NULL,
telefone VARCHAR(45) NOT NULL,
cpf VARCHAR(100) NOT NULL,
conta_criada TIMESTAMP(6) NOT NULL
);

CREATE TABLE IF NOT EXISTS genero(
id_genero INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
tema_genero VARCHAR(100) NOT NULL,
publico_alvo VARCHAR(45) NOT NULL,
livro_destaque_genero VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS livros(
id_livro INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
titulo VARCHAR(100) NOT NULL,
num_pag INT NOT NULL,
ano_publicacao DATE NOT NULL,
nota INT NOT NULL,
id_autor INT,
FOREIGN KEY(id_autor)
REFERENCES autor (id_autor)
);

CREATE TABLE IF NOT EXISTS livro_genero(
id_livro_genero INT AUTO_INCREMENT PRIMARY KEY,
id_livro INT NOT NULL, 
id_genero INT NOT NULL,
FOREIGN KEY(id_livro)
REFERENCES livros (id_livro),
FOREIGN KEY(id_genero)
REFERENCES genero (id_genero)
);

CREATE TABLE IF NOT EXISTS cliente_emprestimo(
id_cliente_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
id_cliente INT NOT NULL, 
id_emprestimo INT NOT NULL,
FOREIGN KEY(id_cliente)
REFERENCES cliente (id_cliente),
FOREIGN KEY(id_emprestimo)
REFERENCES emprestimo (id_emprestimo)
);

CREATE TABLE IF NOT EXISTS livro_emprestimo(
id_livro_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
id_livro INT NOT NULL, 
id_emprestimo INT NOT NULL,
FOREIGN KEY(id_livro)
REFERENCES livros (id_livro),
FOREIGN KEY(id_emprestimo)
REFERENCES emprestimo (id_emprestimo)
);



INSERT INTO autor (nome_autor, data_nascimento, local_De_nascimento, livro_destaque)
VALUES
('pedro','2005-05-12','Rio de janeiro','batata'),
('fernando','2001-03-13','Sao paulo','a cenoura'),
('samuel','2003-04-12','Sao paulo','eleanor'),
('rodrigo','2002-05-12','Rio de janeiro','omar'),
('vanessa','2007-04-11','Volta Redonda','legal');

INSERT INTO genero (tema_genero, publico_alvo, livro_destaque_genero)
VALUES
('terror','adulto','it'),
('romance','jovem','eleanor e park'),
('fantasia','infantil','dark mage'),
('educacional','jovem','calculo'),
('ficcao','jovem','star wars');

INSERT INTO livros (titulo, num_pag, ano_publicacao, nota, id_autor)
VALUES
('epa',201,'2005-06-12',7,5),
('opa',202,'2006-01-12',6,3),
('ema',203,'2003-02-11',4,2),
('omori',204,'2003-04-12',3,1),
('ima',200,'2002-03-12',2,4);

INSERT INTO emprestimo (data_emprestimo, data_prevista, data_real_devolucao, status_emprestimo)
VALUES
('2005-02-12','2005-06-12','2005-06-12','ok'),
('2005-05-12','2005-06-12','2005-06-12','bad'),
('2005-06-12','2005-06-12','2005-06-12','paia'),
('2005-06-12','2005-06-12','2005-06-12','errado'),
('2005-06-12','2005-06-12','2005-06-12','ok');

INSERT INTO cliente (nome_cliente , telefone, cpf, conta_criada)
VALUES
('fernando','24393303283','11284249732','2005-01-16'),
('pedro','24993703283','11284249732','2003-02-11'),
('gabriel','24933303283','11284249732','2002-06-13'),
('isa','24993305283','11284249732','2004-04-16'),
('maria','24993303223','11284249732','2001-02-14');

INSERT INTO cliente_emprestimo (id_cliente, id_emprestimo)
VALUES
(1,1),
(1,2),
(2,3),
(3,4),
(1,4);

INSERT INTO livro_genero (id_livro, id_genero)
VALUES
(1,2),
(4,2),
(2,3),
(3,4),
(1,5);

INSERT INTO livro_emprestimo(id_livro, id_emprestimo)
VALUES
(1,2),
(4,2),
(2,3),
(3,4),
(1,5);

SELECT * FROM autor;
SELECT * FROM cliente;
SELECT * FROM autor;
SELECT * FROM emprestimo;

CREATE OR REPLACE VIEW view_livros AS
SELECT livros.id_livro, livros.titulo, livros.num_pag, livros.ano_publicacao, livros.nota, autor.nome_autor FROM livros
INNER JOIN autor ON livros.id_autor = autor.id_autor;

CREATE OR REPLACE VIEW view_livro_emprestimo AS
SELECT livro_emprestimo.id_livro_emprestimo, livros.titulo, emprestimo.data_real_devolucao FROM livro_emprestimo
INNER JOIN livros ON livro_emprestimo.id_livro = livros.id_livro
INNER JOIN emprestimo ON livro_emprestimo.id_emprestimo = emprestimo.id_emprestimo;

CREATE OR REPLACE VIEW view_cliente_emprestimo AS
SELECT cliente_emprestimo.id_cliente_emprestimo, cliente.nome_cliente, emprestimo.data_real_devolucao FROM cliente_emprestimo
INNER JOIN cliente ON cliente_emprestimo.id_cliente = cliente.id_cliente
INNER JOIN emprestimo ON cliente_emprestimo.id_emprestimo = emprestimo.id_emprestimo;

CREATE OR REPLACE VIEW view_livro_genero AS
SELECT livro_genero.id_livro_genero, livros.titulo, genero.tema_genero FROM livro_genero
INNER JOIN livros ON livro_genero.id_livro = livros.id_livro
INNER JOIN genero ON livro_genero.id_genero = genero.id_genero;

SELECT * FROM view_livros;
SELECT * FROM view_livro_emprestimo;
SELECT * FROM view_cliente_emprestimo;
SELECT * FROM view_livro_genero;