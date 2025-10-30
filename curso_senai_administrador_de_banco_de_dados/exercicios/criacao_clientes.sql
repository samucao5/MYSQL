CREATE DATABASE loja_exemplo;

CREATE TABLE produtos(
id_produto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_produto VARCHAR(45) NOT NULL,
preco_produto decimal(10,2) NOT NULL,
estoque_produto int NOT NULL
);

CREATE TABLE clientes(
id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_cliente VARCHAR(45) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE status_p (
id_status INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
condicao VARCHAR(50)
);

CREATE TABLE pedidos(
id_pedidos INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
data_pedido date,
id_cliente INT,
id_status INT,
foreign key (id_cliente)
REFERENCES clientes (id_cliente),
FOREIGN KEY (id_status)
REFERENCES status_p (id_status)
);

CREATE TABLE itens_pedido(
id_itens_pedido INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
quantidade INT NOT NULL,
preco_unitario decimal(10,2),
id_produto INT NOT NULL,
id_pedido INT NOT NULL,
FOREIGN KEY (id_produto)
REFERENCES produtos (id_produto),
FOREIGN KEY (id_pedido)
REFERENCES pedidos (id_pedido)
);

CREATE TABLE log_estoque(
id_log INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Alteracao VARCHAR(45) NOT NULL,
estoque_anterior INT NOT NULL,
estoque_novo INT NOT NULL,
data_log DATE NOT NULL,
motivo VARCHAR(45),
id_produto INT NOT NULL,
FOREIGN KEY (id_produto)
REFERENCES produtos (id_produto)
);