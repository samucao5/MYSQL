SET SQL_SAFE_UPDATES = 0;
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
('hotel angels', 'RJ', 60),
('hotel hope', 'SP', 3000),
('hotel rei', 'BA', 2000);

UPDATE hotel SET limite = 1000 WHERE id_hotel = 1;

SELECT * FROM hotel;

DELETE FROM hotel WHERE limite > 2000;

SELECT * FROM hotel;
 