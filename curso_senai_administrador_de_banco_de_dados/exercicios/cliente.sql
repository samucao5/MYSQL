CREATE DATABASE opa;

CREATE TEMPORARY TABLE tmp_clientes_recentes AS
SELECT
c.id_cliente, 
c.nome_cliente, 
c.email_cliente,
c.cidade,
c.data_cadastro
FROM clientes c WHERE c.data_cadastro > '2023-01-01';


CREATE TABLE clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_cliente VARCHAR(100) NOT NULL, 
email_cliente VARCHAR(100) NOT NULL,
cidade VARCHAR(45) NOT NULL,
data_cadastro date
);

INSERT INTO clientes 
(nome_cliente,email_cliente,cidade, data_cadastro)
VALUES
('samuel','samuel.email','VR','2024-01-10'),
('samuel1','samuel1.email','VR','2022-01-02');

SELECT * FROM clientes;
SELECT * FROM tmp_clientes_recentes;
DROP table tmp_clientes_recentes;