CREATE DATABASE IF NOT EXISTS banco_de_dados;
USE banco_de_dados;
/*tipos de texto*/
CREATE TABLE if not exists pessoas(
id_nomes INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
/*VARCHAR: aceita textos com 0 ate 65535 caracteres*/
nome_pessoa VARCHAR(100),
/*CHAR: aceita textos com 0 ate 255 caracteres*/
cpf_pessoa char(11),
/*TINYTEXT: apenas texto com ate 255 caracteres*/
cidade TINYTEXT,
/*MEDIUMTEXT: apenas texto com ate 16777215 caracteres*/
observacoes MEDIUMTEXT
);
/*OBS: VARCHAR E CHAR tambem aceitam numeros e caracteres especiais*/