CREATE DATABASE IF NOT EXISTS constraints;
USE constraints;
/*UNIQUE: garante qie todos os valores em uma coluna serão diferentes*/
/*pode ser usado em email e cpf*/
CREATE TABLE IF NOT EXISTS teste_unique(
nome_cliente VARCHAR(100) NOT NULL,
cpf_cliente char(11) UNIQUE NOT NULL,
email_cliente VARCHAR(100) UNIQUE NOT NULL
);

INSERT INTO teste_unique(nome_cliente, cpf_cliente, email_cliente)
VALUES
('samuel', '11111111111', 'samuel@email.generico.com'),
('maria', '11111111112', 'maria@email.generico.com');

SELECT * FROM teste_unique;

/*caso o usuario coloque o mesmo cpf, o programa não permite a entrada no banco de dados*/
INSERT INTO teste_unique(nome_cliente, cpf_cliente, email_cliente)
VALUES
('pedro', '11111111111', 'pedro@email.generico.com');

SELECT * FROM teste_unique;



