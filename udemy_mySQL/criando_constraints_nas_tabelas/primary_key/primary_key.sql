CREATE DATABASE IF NOT EXISTS constraints;
USE constraints;
/*PRIMARY KEY: só pode ser adicionada em uma unica coluna da tabela, geralmente e o id*/

CREATE TABLE IF NOT EXISTS teste_primary_key(
id_produto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_produto VARCHAR(100) NOT NULL,
preco_produto DECIMAL(10,2) NOT NULL
);

/*normalmente não colocamos o primary key pois ele possui o auto_increment e conta automatico*/
INSERT INTO teste_primary_key(nome_produto, preco_produto)
VALUES
('sapato', 99.56),
('banana', '5.99');

SELECT id_produto ,nome_produto, preco_produto AS 'preço_produto' FROM teste_primary_key;