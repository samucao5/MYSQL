CREATE DATABASE IF NOT EXISTS banco_de_dados;
USE banco_de_dados;
CREATE TABLE IF NOT EXISTS usuario(
id_usuario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_usuario VARCHAR(100),
data_nascimento DATE
);

/*Para inserir dados vamos utilizar a instrução INSERT*/
/*INSERT INTO <tabela> (<colunas>) VALUES (<valores>);*/
INSERT INTO usuario(nome_usuario, data_nascimento)
VALUES
('Samuel', '2005-11-03'),
('junior', '2007-05-31');

SELECT * FROM usuario;