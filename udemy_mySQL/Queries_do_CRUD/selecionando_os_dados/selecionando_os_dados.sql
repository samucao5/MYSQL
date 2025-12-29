/*Para selecionar todos os dados na tabela usamos o comando abaixo*/
/*SELECT * FROM nome_da_tabela;*/
CREATE DATABASE IF NOT EXISTS restaurante;
USE restaurante;

CREATE TABLE IF NOT EXISTS molhos(
id_molho INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_molho VARCHAR(100) NOT NULL,
quantidade INT NOT NULL
);

INSERT INTO molhos(nome_molho, quantidade)
VALUES
('ketchup', 5),
('maionese', 3);
/*aparece todos os dados de molhos*/
SELECT * FROM molhos;

/*caso queira somente ler alguns dados posso usar desta forma*/
/*SELECT coluna_que_vai_ser_lida FROM nome_da_tabela;*/
/*aqui aparece tanto o id_molho como o nome_molho*/
SELECT id_molho ,nome_molho FROM molhos;
