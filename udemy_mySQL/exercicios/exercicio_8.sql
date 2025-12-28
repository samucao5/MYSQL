CREATE DATABASE IF NOT EXISTS pessoas;
USE pessoas;

CREATE TABLE IF NOT EXISTS aniversarios(
id_aniversario INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_do_aniversariante VARCHAR(100) NOT NULL,
data_aniversario DATE
);

INSERT INTO aniversarios(nome_do_aniversariante, data_aniversario) VALUES
('samuel', '2005-11-03');