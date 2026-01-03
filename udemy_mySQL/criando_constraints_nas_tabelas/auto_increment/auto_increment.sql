CREATE DATABASE IF NOT EXISTS constraints;
USE constraints;
/*AUTO_INCREMENT: serve para adicionar a quantidade de um em todo registros adicionado*/
/*normalmente e usado junto com o PRIMARY KEY*/
CREATE TABLE IF NOT EXISTS teste_auto_increment(
id_carros INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
marca_carro VARCHAR(100) NOT NULL,
modelo_carro VARCHAR(100) NOT NULL,
placa_carro CHAR(7) NOT NULL
);

INSERT INTO teste_auto_increment(marca_carro, modelo_carro, placa_carro)
VALUES 
('Fiat', 'mobi', 'AAA5O90'),
('Hyundai', 'creta', 'BAB7R09');

SELECT * FROM teste_auto_increment;
