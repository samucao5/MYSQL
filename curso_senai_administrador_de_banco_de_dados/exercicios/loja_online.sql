CREATE DATABASE IF NOT EXISTS loja_online;

CREATE TABLE IF NOT EXISTS enderecos (
id_endereco INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
rua VARCHAR(45) NOT NULL,
num VARCHAR(100) NOT NULL,
cid VARCHAR(100) NOT NULL,
CEP VARCHAR(8) NOT NULL,
UF CHAR(2)
);

CREATE TABLE IF NOT EXISTS clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_cliente VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
id_endereco INT NOT NULL,
FOREIGN KEY (id_endereco)
REFERENCES enderecos (id_endereco)
);

CREATE TABLE IF NOT EXISTS categorias(
id_categoria INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_categoria VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS produtos (
id_produtos INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_produto VARCHAR(100) NOT NULL,
descricao TEXT NOT NULL,
preco_unitario decimal(10,2) NOT NULL,
id_categoria INT NOT NULL,
FOREIGN KEY (id_categoria)
REFERENCES categorias (id_categoria)
);

CREATE TABLE IF NOT EXISTS status_pedidos(
id_status INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
status_pedido VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS pedidos(
id_pedido INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
data_pedido DATE DEFAULT (CURRENT_DATE()),
id_cliente INT NOT NULL,
id_status INT NOT NULL,
FOREIGN KEY (id_cliente)
REFERENCES clientes (id_cliente),
FOREIGN KEY (id_Status)
REFERENCES status_pedidos (id_status)
);

CREATE TABLE IF NOT EXISTS itens_pedidos(
id_itens_pedidos INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_pedido INT NOT NULL,
quantidade INT NOT NULL,
id_produto INT NOT NULL,
FOREIGN KEY (id_pedido)
REFERENCES pedidos (id_pedido),
FOREIGN KEY (id_produto)
REFERENCES produtos (id_produtos)
);


INSERT INTO enderecos
(rua, num, cid, CEP, UF)
VALUES
('rua m', '1', 'Volta Redonda' ,'00000001','RJ'),
('rua b', '2', 'Guaratigueta','00000002', 'SP'),
('rua c', '3', 'salvador' ,'00000003', 'BA');


INSERT INTO clientes
(nome_cliente,email,id_endereco)
VALUES
('samuel', 'samuel@email.com', 1),
('maria', 'maria@email.com', 2),
('allan', 'allan@email.com', 3);


INSERT INTO categorias
(nome_categoria)
VALUES
('eletronico'),
('movel'),
('cozinha');


INSERT INTO produtos
(nome_produto, descricao, preco_unitario, id_categoria)
VALUES
('celular', 'celular muito bom', 600.43, 1),
('colher', 'colher de sobremesa', 5.99,3),
('cama', 'cama confortavel', 699.32, 2);

INSERT INTO status_pedidos
(status_pedido)
VALUES
('enviado'),
('entregue'),
('esperando confirmacao');

INSERT INTO pedidos 
(data_pedido,id_cliente, id_status)
VALUES
('2023-01-20',1,3),
('2024-01-20',2,1),
('2025-10-28',3,2);

INSERT INTO itens_pedidos
(id_pedido, quantidade, id_produto)
VALUES
(2,5,1),
(1,8,3),
(3,2,2);

CREATE VIEW view_clientes AS
SELECT clientes.nome_cliente, clientes.email, enderecos.CEP FROM clientes
LEFT JOIN enderecos ON clientes.id_endereco = enderecos.id_endereco;


CREATE VIEW view_produtos AS
SELECT produtos.nome_produto, produtos.descricao, produtos.preco_unitario, categorias.nome_categoria FROM produtos
LEFT JOIN categorias ON produtos.id_categoria = categorias.id_categoria;


CREATE VIEW view_pedidos AS
SELECT pedidos.data_pedido, clientes.nome_cliente, status_pedidos.status_pedido FROM pedidos
LEFT JOIN clientes ON pedidos.id_cliente = clientes.id_cliente
LEFT JOIN status_pedidos ON pedidos.id_status = status_pedidos.id_status;


CREATE OR REPLACE VIEW view_itens_pedidos AS
SELECT itens_pedidos.id_pedido,SUM(itens_pedidos.quantidade) AS total_itens ,SUM(produtos.preco_unitario * itens_pedidos.quantidade ) AS valor_final FROM itens_pedidos
LEFT JOIN produtos ON itens_pedidos.id_produto = produtos.id_produtos
GROUP BY itens_pedidos.id_pedido;

SELECT * FROM enderecos;
SELECT * FROM view_clientes;
SELECT * FROM categorias;
SELECT * FROM view_produtos;
SELECT * FROM status_pedidos;
SELECT * FROM view_pedidos;
SELECT * FROM view_itens_pedidos;
