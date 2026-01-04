CREATE DATABASE IF NOT EXISTS rede_social;
USE rede_social;
CREATE TABLE IF NOT EXISTS posts(
-- id do post
id_post INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
-- titulo da tabela post
titulo_post VARCHAR(100) NOT NULL,
-- corpo do post
corpo_do_post TEXT NOT NULL,
-- tags da tabela post
tags_post CHAR(20) NOT NULL
);

INSERT INTO posts (titulo_post, corpo_do_post, tags_post)
VALUE
-- inserindo dados na tabela
('foto na praia', 'foi muito divertido ir nesta praia', '#praia'),
('campeonato de xadrez', 'fiquei em 5 lugar', '#xadrez');

SELECT * FROM posts;