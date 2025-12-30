CREATE DATABASE IF NOT EXISTS rede_hotel;
USE rede_hotel;

CREATE TABLE IF NOT EXISTS hotel(
id_hotel INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_hotel VARCHAR(100) NOT NULL,
uf_estado CHAR(2) NOT NULL,
limite INT NOT NULL
);

INSERT INTO hotel(nome_hotel, uf_estado, limite)
VALUES
('hotel angels', 'RJ', 50),
('hotel hope', 'SP', 50);

UPDATE hotel SET limite = 1000 WHERE id_hotel = 1;

