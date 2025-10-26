CREATE  DATABASE mercado;

CREATE TABLE produto(
id_produto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_produto VARCHAR(100) NOT NULL,
preco decimal(10,2)
);

CREATE TABLE vendas(
id_venda INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_produto INT NOT NULL,
quantidade INT NOT NULL,
FOREIGN KEY (id_produto)
REFERENCES produto (id_produto)
);

CREATE TABLE estoque(
id_estoque INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_produto INT NOT NULL,
quantidade INT NOT NULL,
FOREIGN KEY (id_produto)
REFERENCES produto (id_produto)
);

DELIMITER $$

CREATE TRIGGER trg_mercado
AFTER INSERT on vendas
FOR EACH ROW
begin
UPDATE estoque
SET estoque.quantidade = estoque.quantidade - new.quantidade
WHERE estoque.id_produto = new.id_produto;
end $$

DELIMITER ;

DELIMITER $$

CREATE TRIGGER trg_produto
AFTER INSERT on produto
FOR EACH ROW
BEGIN
INSERT INTO estoque
(id_produto, quantidade)
VALUES (new.id_produto,0);

END $$
DELIMITER ;

INSERT INTO produto
(nome_produto, preco)
VALUES
('banana', 7.32),
('maca',10.00);

INSERT INTO vendas
(id_produto,quantidade)
VALUES
(1,20),
(2,19);


SELECT * FROM produto;
SELECT * FROM estoque;

UPDATE estoque 
SET quantidade = 30
WHERE id_estoque = 1;

UPDATE estoque 
SET quantidade = 39
WHERE id_estoque = 2;