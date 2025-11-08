CREATE DATABASE IF NOT EXISTS biblioteca_samuel;
USE DATABASE biblioteca_samuel;

-- livros
CREATE TABLE IF NOT EXISTS livros(
id_livro INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
data_lancamento DATE NOT NULL,
sinopse TEXT NOT NULL,
capa TEXT NOT NULL,
id_autor INT NOT NULL,
editora INT NOT NULL,
best_seller BOOL NOT NULL,
id_genero INT NOT NULL,
FOREIGN KEY (id_autor)
REFERENCES autores (id_autor),
FOREIGN KEY (id_genero)
REFERENCES generos (id_genero),
FOREIGN KEY (id_editora),
REFERENCES editoras (id_editora)
);

-- autores 
CREATE TABLE IF NOT EXISTS autores(
id_autor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
autor_nome VARCHAR(100) NOT NULL,
quant_livros INT NOT NULL,
id_nacionalidade INT NOT NULL,
id_estado INT NOT NULL,
FOREIGN KEY (id_nascionalidade)
REFERENCES paises (id_paises),
FOREIGN KEY (id_estado)
REFERENCES estados (id_estado)
);

-- paises 
CREATE TABLE IF NOT EXISTS paises(
id_pais INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
pais_nome VARCHAR(100) NOT NULL
);

-- generos 
CREATE TABLE IF NOT EXISTS generos(
id_genero INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_genero VARCHAR(100) NOT NULL
);

-- estados 
CREATE TABLE IF NOT EXISTS estados(
id_estado INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_estado VARCHAR(100) NOT NULL,
id_paise INT NOT NULL,
FOREIGN KEY (id_pais)
REFERENCES paises (id_pais)
);

-- editoras 
CREATE TABLE IF NOT EXISTS editoras(
id_editoras INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_editora VARCHAR(100) NOT NULL,
id_pais INT NOT NULL,
id_estado INT NOT NULL,
FOREIGN KEY (id_pais),
REFERENCES paises(id_pais),
FOREIGN KEY (id_estado)
REFERENCES estados (id_estado)
);

-- bibliotecas 
CREATE TABLE IF NOT EXISTS bibliotecas(
id_biblioteca INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_biblioteca VARCHAR(100) NOT NULL,
id_pais INT NOT NULL,
id_estado INT NOT NULL,
FOREIGN KEY (id_pais)
REFERENCES paises (id_pais),
FOREIGN KEY (id_estado)
REFERENCES estados (id_estado)
);

-- personagens 
CREATE TABLE IF NOT EXISTS personagens(
id_personagem INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_personagem VARCHAR(100) NOT NULL,
id_livro INT NOT NULL,
FOREIGN KEY (id_livro)
REFERENCES livros (id_livro)
);

-- saga
CREATE TABLE IF NOT EXISTS saga(
id_saga INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_livro INT NOT NULL,
id_pais INT NOT NULL,
FOREIGN KEY (id_livro)
REFERENCES livros (id_livro),
FOREIGN KEY (id_pais)
REFERENCES paises (id_pais)
);
