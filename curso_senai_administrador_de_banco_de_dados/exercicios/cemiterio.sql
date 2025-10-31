CREATE DATABASE IF NOT EXISTS cemiterio;

CREATE TABLE IF NOT EXISTS cadastrar_cemiterios(
id_cemiterio INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_cemiterio VARCHAR(100) NOT NULL,
endereco TEXT NOT NULL,
data_fundacao DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS desconto(
id_desconto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
desconto VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS genero_bio(
id_genero_bio INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
genero_bio VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS tamanho_cova(
id_tamanho_cova INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
tamanho VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS causa_da_morte(
id_causa_da_morte INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
causa_da_morte VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS administradores(
id_adm INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_adm VARCHAR(100) NOT NULL,
id_genero_bio INT NOT NULL,
telefone VARCHAR(14) NOT NULL UNIQUE,
email VARCHAR(100) NOT NULL,
data_nasc DATE NOT NULL,
id_cemiterio INT NOT NULL,
FOREIGN KEY (id_genero_bio)
REFERENCES genero_bio (id_genero_bio),
FOREIGN KEY (id_cemiterio)
REFERENCES cadastrar_cemiterios (id_cemiterio)
);

CREATE TABLE IF NOT EXISTS clientes(
id_cliente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_cliente VARCHAR(100) NOT NULL,
id_genero_bio INT NOT NULL,
endereco TEXT NOT NULL,
telefone VARCHAR(14) NOT NULL UNIQUE,
email VARCHAR(100) NOT NULL,
FOREIGN KEY (id_genero_bio)
REFERENCES genero_bio (id_genero_bio)
);

CREATE TABLE IF NOT EXISTS cadastrar_covas(
id_cova INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_cliente INT NOT NULL,
localizacao_cova VARCHAR(100) NOT NULL,
id_tamanho_cova INT NOT NULL,
observacao_cova TEXT NOT NULL,
FOREIGN KEY (id_cliente)
REFERENCES clientes (id_cliente),
FOREIGN KEY (id_tamanho_cova)
REFERENCES tamanho_cova (id_tamanho_cova)
);

CREATE TABLE IF NOT EXISTS cemiterio_cova(
id_cemiterio_cova INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_cemiterio INT NOT NULL,
id_cova INT NOT NULL,
FOREIGN KEY (id_cemiterio)
REFERENCES cadastrar_cemiterios  (id_cemiterio),
FOREIGN KEY (id_cova)
REFERENCES cadastrar_covas (id_cova)
);

CREATE TABLE IF NOT EXISTS visitas(
id_visita INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_cova INT NOT NULL,
id_cliente INT NOT NULL,
data_e_hora_visita TIMESTAMP DEFAULT(current_time(6)),
observacao TEXT NOT NULL,
FOREIGN KEY (id_cova)
REFERENCES cadastrar_covas (id_cova),
FOREIGN KEY (id_cliente)
REFERENCES clientes (id_cliente)
);

CREATE TABLE IF NOT EXISTS sepultamentos(
id_sepultamento INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_cliente INT NOT NULL,
id_cova INT NOT NULL,
data_do_sepultamento DATE DEFAULT(NOW()),
id_causa_da_morte INT NOT NULL,
FOREIGN KEY (id_causa_da_morte)
REFERENCES causa_da_morte (id_causa_da_morte)
);

CREATE TABLE IF NOT EXISTS compradores(
id_compradores INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_cliente INT NOT NULL,
id_desconto INT NOT NULL,
FOREIGN KEY (id_cliente)
REFERENCES clientes (id_cliente),
FOREIGN KEY (id_desconto)
REFERENCES desconto (id_desconto)
);

INSERT INTO desconto 
(desconto)
VALUES
('ativo'),
('desativado');

INSERT INTO cadastrar_cemiterios 
(nome_cemiterio, endereco, data_fundacao)
VALUES
('splashyart', 'rua 1', '2005-11-03'),
('silencio', 'rua 7', '1998-05-03'),
('boa_noite', 'rua 102', '2010-02-11');

INSERT INTO genero_bio
(genero_bio)
VALUES
('masculino'),
('feminino');

INSERT INTO tamanho_cova
(tamanho)
VALUES
('pequena'),
('media'),
('grande');

INSERT INTO causa_da_morte
(causa_da_morte)
VALUES
('covid 19'),
('problema no figado'),
('tuberculose');

INSERT INTO cemiterio_cova
(id_cemiterio, id_cova)
VALUES
(1,1),
(2,2);

INSERT INTO administradores
(nome_adm, id_genero_bio, telefone, email, data_nasc, id_cemiterio)
VALUES
('samuel',1,'00000000000001','samuel@gmail.com','2005-11-03',1),
('allan',1,'00000000000002','allan@gmail.com','2006-05-03',2),
('maria',2,'00000000000003','maria@gmail.com','2005-09-09',1);

INSERT INTO clientes
(nome_cliente, id_genero_bio, endereco, telefone, email)
VALUES
('pedro',1,'rua 90','54000000000001','pedro@gmail.com'),
('uma',2,'rua 41','51000032000001','uma@gmail.com'),
('theylor',1,'rua 23','5400422010001','theylor@gmail.com'),
('miguel',1,'rua 53','5400422016661','miguel@gmail.com');

INSERT INTO cadastrar_covas
(id_cliente, localizacao_cova, id_tamanho_cova, observacao_cova)
VALUES
(1,'lado esquerdo', 2,'cova bem cuidada'),
(4,'lado direito', 3,'colocar flores')
;

INSERT INTO visitas
(id_cova, id_cliente, data_e_hora_visita, observacao)
VALUES
(2,3,'2025-11-08','a pessoa esta chorando muito'),
(1,2,'2021-01-20','ela esta com flores');

INSERT INTO sepultamentos
(id_cliente, id_cova, data_do_sepultamento, id_causa_da_morte)
VALUES
(4,1,'2025-11-03',3),
(1,2,'2020-01-20',1);

INSERT INTO compradores
(id_cliente, id_desconto)
VALUES
(3,1),
(2,2);

SELECT * FROM administradores;
SELECT * FROM cadastrar_cemiterios;
SELECT * FROM cadastrar_covas;
SELECT * FROM causa_da_morte;
SELECT * FROM cemiterio_cova;
SELECT * FROM clientes;
SELECT * FROM  compradores;
SELECT * FROM desconto;
SELECT * FROM genero_bio;
SELECT * FROM sepultamentos;
SELECT * FROM tamanho_cova;
SELECT * FROM visitas;

CREATE OR REPLACE VIEW vw_administradores AS
SELECT adm.id_adm, adm.nome_adm, gb.genero_bio, adm.telefone, adm.email, adm.data_nasc, cc.nome_cemiterio FROM administradores adm
INNER JOIN genero_bio gb ON adm.id_genero_bio = gb.id_genero_bio
INNER JOIN cadastrar_cemiterios cc ON adm.id_cemiterio = cc.id_cemiterio;

CREATE OR REPLACE VIEW vw_sepultamentos AS
SELECT s.id_sepultamento, cli.nome_cliente, s.id_cova, s.data_do_sepultamento, cm.causa_da_morte FROM sepultamentos s
INNER JOIN clientes cli ON s.id_cliente = cli.id_cliente
INNER JOIN causa_da_morte cm ON s.id_causa_da_morte = cm.id_causa_da_morte;

CREATE OR REPLACE VIEW vw_visitas AS 
SELECT v.id_visita, v.id_cova, cli.nome_cliente, v.data_e_hora_visita, v.observacao  FROM visitas v
INNER JOIN clientes cli ON v.id_cliente = cli.id_cliente;

CREATE OR REPLACE VIEW vw_compradores AS
SELECT co.id_compradores, cli.nome_cliente, d.desconto  FROM compradores co
INNER JOIN clientes cli ON co.id_cliente = cli.id_cliente
INNER JOIN desconto d ON co.id_desconto = d.id_desconto;

CREATE OR REPLACE VIEW vw_cemiterio_cova AS 
SELECT ca.id_cemiterio_cova, cc.nome_cemiterio , c.id_cova, cli.nome_cliente  FROM cemiterio_cova ca
INNER JOIN cadastrar_cemiterios cc ON ca.id_cemiterio = cc.id_cemiterio
INNER JOIN cadastrar_covas c ON ca.id_cova = c.id_cova
INNER JOIN clientes cli  ON c.id_cliente = cli.id_cliente;

CREATE OR REPLACE VIEW vw_clientes AS 
SELECT cli.id_cliente, cli.nome_cliente, gb.genero_bio, cli.endereco, cli.telefone, cli.email  FROM clientes cli
INNER JOIN genero_bio gb ON cli.id_genero_bio = gb.id_genero_bio;

CREATE OR REPLACE VIEW vw_cadastrar_covas AS
SELECT c.id_cova, cl.nome_cliente, c.localizacao_cova, tc.tamanho, c.observacao_cova FROM cadastrar_covas c
INNER JOIN clientes cl ON c.id_cliente = cl.id_cliente 
INNER JOIN  tamanho_cova tc ON c.id_tamanho_cova = tc.id_tamanho_cova;


SELECT * FROM vw_administradores;
SELECT * FROM vw_sepultamentos;
SELECT * FROM vw_visitas;
SELECT * FROM vw_compradores;
SELECT * FROM vw_cemiterio_cova;
SELECT * FROM vw_cadastrar_covas;