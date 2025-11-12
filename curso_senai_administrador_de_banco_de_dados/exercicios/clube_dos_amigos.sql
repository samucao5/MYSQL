CREATE DATABASE IF NOT EXISTS clube_dos_amigos;
USE clube_dos_amigos;

-- DROP DATABASE IF EXISTS clube_dos_amigos;

CREATE TABLE IF NOT EXISTS cargos(
id_cargo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_cargo VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS pessoas(
id_pessoa INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_pessoa VARCHAR(100) NOT NULL,
cpf_pessoa VARCHAR(11) UNIQUE NOT NULL,
id_cargo INT NOT NULL,
FOREIGN KEY (id_cargo)
REFERENCES cargos (id_cargo)
);

CREATE TABLE IF NOT EXISTS modelos(
id_modelo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_modelo VARCHAR(100) NOT NULL,
ano_modelo INT NOT NULL
);

CREATE TABLE IF NOT EXISTS cores(
id_cor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_cor VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS marcas(
id_marca INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
marca_nome VARCHAR(100) NOT NULL
);

CREATE TABLE  IF NOT EXISTS carros(
id_carro INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_modelo INT NOT NULL,
id_cor INT NOT NULL,
id_marca INT NOT NULL,
FOREIGN KEY (id_modelo)
REFERENCES modelos (id_modelo),
FOREIGN KEY (id_cor)
REFERENCES cores (id_cor),
FOREIGN KEY (id_marca)
REFERENCES marcas (id_marca)
);

CREATE TABLE IF NOT EXISTS pessoa_carro (
id_pessoa_carro INT PRIMARY KEY NOT NULL,
id_pessoa INT,
id_carro INT NOT NULL,
FOREIGN KEY (id_pessoa)
REFERENCES pessoas (id_Pessoa),
FOREIGN KEY (id_carro)
REFERENCES carros (id_carro)
);


CREATE TABLE IF NOT EXISTS matriculas(
id_matricula INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_pessoa INT NOT NULL,
tipo_de_matricula VARCHAR(100) NOT NULL,
FOREIGN KEY (id_pessoa)
REFERENCES pessoas (id_pessoa)
);

CREATE TABLE IF NOT EXISTS local_clube (
id_local INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
endereco TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS pedido (
id_pedido INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_matricula INT NOT NULL,
id_local INT NOT NULL
);

CREATE TABLE IF NOT EXISTS professor(
id_professor INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
professor_nome VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS modalidades(
id_modalidade INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_modalidade VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS aula(
id_aula INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
aula_nome VARCHAR(100) NOT NULL,
id_modalidade INT NOT NULL,
FOREIGN KEY (id_modalidade)
REFERENCES modalidades (id_modalidade)
);

CREATE TABLE IF NOT EXISTS recorrencia(
id_recorrencia INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_matricula INT NOT NULL,
id_aula INT NOT NULL
);

CREATE TABLE IF NOT EXISTS item_pedido(
id_item_pedido INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_pedido INT NOT NULL
);

CREATE TABLE IF NOT EXISTS produtos(
id_produto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_produto VARCHAR(100) NOT NULL,
preco_produto DECIMAL (7,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS pedido_produto(
id_pedido_produto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_pedido INT NOT NULL,
id_produto INT NOT NULL,
FOREIGN KEY (id_pedido)
REFERENCES  pedido (id_pedido),
FOREIGN KEY (id_produto)
REFERENCES produtos (id_produto)
);

CREATE TABLE IF NOT EXISTS receita(
id_receita INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
receita TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS produto_receita(
id_produto_receita INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_produto INT NOT NULL,
id_receita INT NOT NULL
);


CREATE TABLE IF NOT EXISTS acessos(
id_acesso INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_carro INT,
id_local INT NOT NULL,
id_matricula INT NOT NULL,
FOREIGN KEY (id_carro)
REFERENCES carros (id_carro),
FOREIGN KEY (id_local)
REFERENCES local_clube (id_local),
FOREIGN KEY (id_matricula)
REFERENCES matriculas (id_matricula)
);

INSERT INTO cargos (nome_cargo) VALUES
('Presidente'),
('Vice-Presidente'),
('Secretário'),
('Tesoureiro'),
('Instrutor');

INSERT INTO pessoas (nome_pessoa, cpf_pessoa, id_cargo) VALUES
('Carlos Silva', '12345678901', 1),
('Mariana Souza', '23456789012', 2),
('João Pereira', '34567890123', 3),
('Fernanda Costa', '45678901234', 4),
('Ricardo Lima', '56789012345', 5);

INSERT INTO modelos (nome_modelo, ano_modelo) VALUES
('Civic', 2022),
('Corolla', 2021),
('Onix', 2020),
('Compass', 2023),
('HB20', 2022);

INSERT INTO cores (nome_cor) VALUES
('Preto'),
('Branco'),
('Prata'),
('Vermelho'),
('Azul');

INSERT INTO marcas (marca_nome) VALUES
('Honda'),
('Toyota'),
('Chevrolet'),
('Jeep'),
('Hyundai');

INSERT INTO carros (id_modelo, id_cor, id_marca) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

INSERT INTO pessoa_carro (id_pessoa_carro, id_pessoa, id_carro) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

INSERT INTO matriculas (id_pessoa, tipo_de_matricula) VALUES
(1, 'Mensal'),
(2, 'Anual'),
(3, 'Semestral'),
(4, 'Premium'),
(5, 'Trial');

INSERT INTO local_clube (endereco) VALUES
('Rua das Palmeiras, 100 - Centro'),
('Avenida Atlântica, 200 - Zona Sul'),
('Rua dos Esportes, 50 - Norte'),
('Av. do Clube, 300 - Leste'),
('Rua dos Amigos, 150 - Oeste');

INSERT INTO pedido (id_matricula, id_local) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO professor (professor_nome) VALUES
('Professor Paulo'),
('Professora Ana'),
('Professor Luiz'),
('Professora Carla'),
('Professor Pedro');

INSERT INTO modalidades (nome_modalidade) VALUES
('Natação'),
('Musculação'),
('Tênis'),
('Yoga'),
('Crossfit');

INSERT INTO aula (aula_nome, id_modalidade) VALUES
('Aula de Natação Infantil', 1),
('Treino de Musculação Avançado', 2),
('Aula de Tênis Intermediário', 3),
('Sessão de Yoga Relaxante', 4),
('Crossfit Intenso', 5);

INSERT INTO recorrencia (id_matricula, id_aula) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

CREATE TABLE IF NOT EXISTS recorrencia_aula(
id_recorrencia_aula INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
id_recorrencia INT NOT NULL,
id_aula INT NOT NULL,
FOREIGN KEY (id_recorrencia)
REFERENCES recorrencia (id_recorrencia),
FOREIGN KEY (id_aula)
REFERENCES aula (id_aula)
);

INSERT INTO produtos (nome_produto, preco_produto) VALUES
('Camiseta Clube', 49.90),
('Garrafa Personalizada', 39.90),
('Toalha Esportiva', 29.90),
('Boné Clube', 59.90),
('Protetor Solar', 24.90);

INSERT INTO pedido_produto (id_pedido, id_produto) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);

INSERT INTO receita (receita) VALUES
('Suco energético natural'),
('Smoothie proteico'),
('Vitamina pós-treino'),
('Refrigerante artesanal'),
('Café fit');

INSERT INTO produto_receita (id_produto, id_receita) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO acessos (id_carro, id_local, id_matricula) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

INSERT INTO recorrencia_aula (id_recorrencia, id_aula) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 5);


DELIMITER $$
CREATE PROCEDURE sp_buscar_pessoas(
IN busca_pessoa VARCHAR(100)
)

BEGIN 
SELECT * FROM pessoas
WHERE nome_pessoa LIKE CONCAT('%', busca_pessoa, '%');
END $$
DELIMITER ;

CALL sp_buscar_pessoas ('');

SELECT * FROM pessoas;