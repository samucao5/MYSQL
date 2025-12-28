CREATE DATABASE IF NOT EXISTS loja;
USE loja;

CREATE TABLE IF NOT EXISTS produtos(
id_produto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_produto VARCHAR(100) NOT NULL,
descricao TEXT
);

INSERT INTO produtos(nome_produto, descricao) VALUES
('computador', 'computador muito bom para atividades como estudo'),
('celular', 'o melhor celular da atualidade');

SELECT * FROM produtos;