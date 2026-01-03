CREATE DATABASE IF NOT EXISTS constraints;
USE constraints;
/*NOT NULL: força um valor de um coluna especifica não ser nulo*/
CREATE TABLE IF NOT EXISTS teste(
nome VARCHAR(100) NOT NULL,
idade INT NOT NULL
);

INSERT INTO teste(nome, idade) 
VALUES
('samuel', 20),
('pedro', 29);

SELECT * FROM teste;