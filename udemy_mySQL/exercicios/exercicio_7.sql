CREATE DATABASE IF NOT EXISTS empresa;
USE empresa;
CREATE TABLE IF NOT EXISTS servidores(
id_servidor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
uf_do_servidor CHAR(2) NOT NULL,
ligado BOOL
);

INSERT INTO servidores(uf_do_servidor,ligado) VALUES
('BA', 1),
('MA',0);

SELECT * FROM servidores;