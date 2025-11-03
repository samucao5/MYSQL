CREATE DATABASE IF NOT EXISTS aero_espacial_mundial;
USE aero_espacial_mundial;

CREATE TABLE IF NOT EXISTS bases_aero_espacias(
id_base_aero_espacial INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_base VARCHAR(100) NOT NULL,
endereco TEXT NOT NULL,
contato VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS status_licenca(
id_status_licenca INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
status_licenca VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS tipos_de_servicos(
id_tipo_de_servico INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
tipo_de_servico VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS prioridades(
id_prioridade INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
prioridade VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS fornecedores(
id_fornecedor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_fornecedor VARCHAR(100) NOT NULL,
endereco TEXT NOT NULL,
contato_fornecedor VARCHAR(15),
detalhes TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS equipamentos_de_seguranca(
id_equipamento_de_seguranca INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_equipamento VARCHAR(100),
caracteristica_tecnica VARCHAR(100),
id_fornecedor INT NOT NULL,
FOREIGN KEY (id_fornecedor)
REFERENCES fornecedores (id_fornecedor)
);

CREATE TABLE IF NOT EXISTS cargos(
id_cargo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
cargo VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS sistemas_de_navegacao(
id_sistema_de_navegacao INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
modelo_sistema_de_navegacao VARCHAR(100) NOT NULL,
fabricante_sistema_de_navegacao VARCHAR(100) NOT NULL
);


CREATE TABLE IF NOT EXISTS aeronaves(
id_aeronave INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
tipo_de_modelo VARCHAR(45) NOT NULL,
fabricante VARCHAR(100) NOT NULL,
id_sistema_de_navegacao INT NOT NULL,
FOREIGN KEY (id_sistema_de_navegacao)
REFERENCES sistemas_de_navegacao (id_sistema_de_navegacao)
);

CREATE TABLE IF NOT EXISTS individuos_envolvidos (
id_individuo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_individuo VARCHAR(100) NOT NULL,
cpf_individuo VARCHAR(11) NOT NULL UNIQUE,
id_cargo INT NOT NULL,
FOREIGN KEY (id_cargo)
REFERENCES cargos (id_cargo)
);

CREATE TABLE IF NOT EXISTS licenca_voo(
id_licenca INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_individuo INT NOT NULL,
data_validade DATE NOT NULL,
tipo_licenca VARCHAR(100),
id_status_licenca INT,
FOREIGN KEY (id_individuo)
REFERENCES individuos_envolvidos (id_individuo),
FOREIGN KEY (id_status_licenca)
REFERENCES status_licenca (id_status_licenca)
);

CREATE TABLE IF NOT EXISTS tipo_incidente(
id_incidente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
descricao TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS tecnico_aero_espacias(
id_tecnico_aero_espacial INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nome_tecnico VARCHAR(45) NOT NULL,
id_cargo INT NOT NULL,
id_base_aero_espacial INT,
FOREIGN KEY (id_cargo)
REFERENCES cargos (id_cargo),
FOREIGN KEY (id_base_aero_espacial)
REFERENCES bases_aero_espacias (id_base_aero_espacial)
);

CREATE TABLE IF NOT EXISTS inspecao_tecnica(
id_inspecao_tecnica INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_aeronave INT NOT NULL,
tipo_de_inspecao VARCHAR(100),
data_inspecao DATE NOT NULL,
resultado_inspecao VARCHAR(100),
id_tecnico INT NOT NULL,
FOREIGN KEY (id_aeronave)
REFERENCES aeronaves (id_aeronave),
FOREIGN KEY (id_tecnico)
REFERENCES tecnico_aero_espacias (id_tecnico_aero_espacial)
);

CREATE TABLE IF NOT EXISTS treinamentos_realizados(
id_treinamento INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_tecnico INT NOT NULL,
tipo_de_treinamento VARCHAR(100),
data_treinamento DATE NOT NULL,
tipo_certificacao VARCHAR(100) NOT NULL,
FOREIGN KEY (id_tecnico)
REFERENCES tecnico_aero_espacias (id_tecnico_aero_espacial)
);

CREATE TABLE IF NOT EXISTS relatorio_ocorrencia_aeroespacial(
id_roa INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
data_roa DATETIME NOT NULL,
local_roa TEXT NOT NULL,
id_base INT NOT NULL,
descricao_ocorrencia TEXT NOT NULL,
id_tecnico INT NOT NULL,
FOREIGN KEY (id_base)
REFERENCES bases_aero_espacias (id_base_aero_espacial),
FOREIGN KEY (id_tecnico)
REFERENCES tecnico_aero_espacias (id_tecnico_aero_espacial)
);

CREATE TABLE IF NOT EXISTS inquerito_aero_espacias(
id_inquerito INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
data_abertura DATE NOT NULL,
id_roa INT NOT NULL,
id_tecnico INT NOT NULL,
FOREIGN KEY (id_tecnico)
REFERENCES tecnico_aero_espacias (id_tecnico_aero_espacial),
FOREIGN KEY (id_roa)
REFERENCES relatorio_ocorrencia_aeroespacial (id_roa)
);

CREATE TABLE IF NOT EXISTS aeronave_roa(
id_aeronave_roa INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_aeronave INT NOT NULL,
id_roa INT NOT NULL,
FOREIGN KEY (id_aeronave)
REFERENCES aeronaves (id_aeronave),
FOREIGN KEY (id_roa)
REFERENCES relatorio_ocorrencia_aeroespacial (id_roa)
);

CREATE TABLE IF NOT EXISTS individuo_inquerito(
id_individuo_inquerito INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_individuo INT NOT NULL,
id_inquerito INT NOT NULL,
FOREIGN KEY (id_individuo)
REFERENCES individuos_envolvidos (id_individuo),
FOREIGN KEY (id_inquerito)
REFERENCES inquerito_aero_espacias (id_inquerito)
);

CREATE TABLE IF NOT EXISTS ordens_de_servicos(
id_ordem_de_serviço INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
data_do_servico DATE NOT NULL,
id_tipo_de_servico INT NOT NULL,
id_prioridade INT NOT NULL,
FOREIGN KEY (id_prioridade)
REFERENCES prioridades (id_prioridade),
FOREIGN KEY (id_tipo_de_servico)
REFERENCES tipos_de_servicos (id_tipo_de_servico)
);

CREATE TABLE IF NOT EXISTS servico_tecnico(
id_servico_tecnico INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_ordens_de_servicos INT NOT NULL,
id_tecnico INT,
FOREIGN KEY (id_tecnico)
REFERENCES tecnico_aero_espacias (id_tecnico_aero_espacial),
FOREIGN KEY (id_ordens_de_servicos)
REFERENCES ordens_de_servicos (id_ordem_de_serviço)
);

CREATE TABLE IF NOT EXISTS rotas_dos_voos(
id_rota_do_voo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
origem_voo VARCHAR(100) NOT NULL,
destino_voo VARCHAR(100) NOT NULL,
altitude_voo VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS operacoes_aero_espacias(
id_operacao INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_individuo INT NOT NULL,
id_tecnico INT NOT NULL,
id_aeronave INT NOT NULL,
id_rota_do_voo INT NOT NULL,
data_operacao DATE NOT NULL,
detalhes_da_operacao TEXT NOT NULL,
FOREIGN KEY (id_individuo)
REFERENCES individuos_envolvidos (id_individuo),
FOREIGN KEY (id_tecnico)
REFERENCES tecnico_aero_espacias (id_tecnico_aero_espacial),
FOREIGN KEY (id_aeronave)
REFERENCES aeronaves (id_aeronave),
FOREIGN KEY (id_rota_do_voo)
REFERENCES rotas_dos_voos (id_rota_do_voo)
);

CREATE TABLE IF NOT EXISTS eventos_meteorologicos (
id_evento_meteorologico INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_operacao INT NOT NULL,
data_do_evento TIMESTAMP NOT NULL,
impacto_do_evento VARCHAR(100) NOT NULL,
FOREIGN KEY (id_operacao)
REFERENCES operacoes_aero_espacias (id_operacao)
);

CREATE TABLE IF NOT EXISTS comunicacao(
id_comunicacao INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_tecnico INT NOT NULL,
id_individuo INT NOT NULL,
data_comunicacao TIMESTAMP NOT NULL,
conteudo VARCHAR(100) NOT NULL,
FOREIGN KEY (id_tecnico)
REFERENCES tecnico_aero_espacias (id_tecnico_aero_espacial),
FOREIGN KEY (id_individuo)
REFERENCES individuos_envolvidos (id_individuo)
);

-- INSERTS

-- 1. bases_aero_espacias
INSERT INTO bases_aero_espacias (nome_base, endereco, contato)
VALUES
('Base Espacial Alcântara', 'Alcântara - MA, Brasil', '+55 98 3333-0001'),
('Centro Espacial Kennedy', 'Flórida, EUA', '+1 321 867-5000'),
('Base Espacial de Kourou', 'Guiana Francesa', '+594 594 327-100');

-- 2. status_licenca
INSERT INTO status_licenca (status_licenca)
VALUES ('Ativa'), ('Expirada');

-- 3. tipos_de_servicos
INSERT INTO tipos_de_servicos (tipo_de_servico)
VALUES ('Manutenção Preventiva'), ('Inspeção Técnica'), ('Reparo Emergencial');

-- 4. prioridades
INSERT INTO prioridades (prioridade)
VALUES ('Alta'), ('Média'), ('Baixa');

-- 5. fornecedores
INSERT INTO fornecedores (nome_fornecedor, endereco, contato_fornecedor, detalhes)
VALUES
('SpaceParts Ltda', 'São Paulo - SP', '11988887777', 'Peças aeronáuticas certificadas.'),
('AeroTech Corp', 'Houston - TX, EUA', '18332223333', 'Componentes de navegação avançados.'),
('FlySecure SA', 'Paris - França', '33155667788', 'Equipamentos de segurança aérea.');

-- 6. equipamentos_de_seguranca
INSERT INTO equipamentos_de_seguranca (nome_equipamento, caracteristica_tecnica, id_fornecedor)
VALUES
('Capacete Espacial Orion', 'Pressurização autônoma', 1),
('Traje de Voo X-200', 'Resistência térmica 1200°C', 2),
('Máscara de Oxigênio Z3', 'Fluxo regulável de 3 níveis', 3);

-- 7. cargos
INSERT INTO cargos (cargo)
VALUES ('Piloto'), ('Engenheiro Aeroespacial'), ('Técnico de Manutenção');

-- 8. sistemas_de_navegacao
INSERT INTO sistemas_de_navegacao (modelo_sistema_de_navegacao, fabricante_sistema_de_navegacao)
VALUES
('NavStar GX', 'Lockheed Martin'),
('StarTrack V2', 'Boeing'),
('SkyGuide X', 'Embraer Tech');

-- 9. aeronaves
INSERT INTO aeronaves (tipo_de_modelo, fabricante, id_sistema_de_navegacao)
VALUES
('Falcon 9', 'SpaceX', 1),
('Dreamliner 787', 'Boeing', 2),
('KC-390', 'Embraer', 3);

-- 10. individuos_envolvidos
INSERT INTO individuos_envolvidos (nome_individuo, cpf_individuo, id_cargo)
VALUES
('João Silva', '12345678901', 1),
('Maria Oliveira', '23456789012', 2),
('Carlos Santos', '34567890123', 3);

-- 11. licenca_voo
INSERT INTO licenca_voo (id_individuo, data_validade, tipo_licenca, id_status_licenca)
VALUES
(1, '2026-05-10', 'Piloto Comercial', 1),
(2, '2025-09-01', 'Engenheiro Técnico', 1),
(3, '2024-12-15', 'Manutenção Avançada', 1);

-- 12. tipo_incidente
INSERT INTO tipo_incidente (descricao)
VALUES
('Falha no sistema de navegação'),
('Pane elétrica durante o voo'),
('Erro humano na decolagem');

-- 13. tecnico_aero_espacias
INSERT INTO tecnico_aero_espacias (nome_tecnico, id_cargo, id_base_aero_espacial)
VALUES
('Rafael Souza', 3, 1),
('Ana Costa', 2, 2),
('Pedro Lima', 3, 3);

-- 14. inspecao_tecnica
INSERT INTO inspecao_tecnica (id_aeronave, tipo_de_inspecao, data_inspecao, resultado_inspecao, id_tecnico)
VALUES
(1, 'Inspeção de rotina', '2025-01-10', 'Aprovada', 1),
(2, 'Verificação estrutural', '2025-03-15', 'Aprovada', 2),
(3, 'Revisão geral', '2025-05-20', 'Reprovada', 3);

-- 15. treinamentos_realizados
INSERT INTO treinamentos_realizados (id_tecnico, tipo_de_treinamento, data_treinamento, tipo_certificacao)
VALUES
(1, 'Treinamento em segurança espacial', '2024-06-12', 'Certificação Nível 1'),
(2, 'Treinamento de manutenção avançada', '2024-09-05', 'Certificação Nível 2'),
(3, 'Simulação de emergência', '2024-11-22', 'Certificação Nível 3');

-- 16. relatorio_ocorrencia_aeroespacial
INSERT INTO relatorio_ocorrencia_aeroespacial (data_roa, local_roa, id_base, descricao_ocorrencia, id_tecnico)
VALUES
('2025-07-01 14:30:00', 'Pista principal - Base Alcântara', 1, 'Falha no motor durante decolagem.', 1),
('2025-08-15 09:00:00', 'Hangar B - Kennedy', 2, 'Curto-circuito em painel elétrico.', 2),
('2025-09-03 18:45:00', 'Área de testes - Kourou', 3, 'Queda de comunicação temporária.', 3);

-- 17. inquerito_aero_espacias
INSERT INTO inquerito_aero_espacias (data_abertura, id_roa, id_tecnico)
VALUES
('2025-07-02', 1, 1),
('2025-08-16', 2, 2),
('2025-09-04', 3, 3);

-- 18. aeronave_roa
INSERT INTO aeronave_roa (id_aeronave, id_roa)
VALUES
(1, 1),
(2, 2),
(3, 3);

-- 19. individuo_inquerito
INSERT INTO individuo_inquerito (id_individuo, id_inquerito)
VALUES
(1, 1),
(2, 2),
(3, 3);

-- 20. ordens_de_servicos
INSERT INTO ordens_de_servicos (data_do_servico, id_tipo_de_servico, id_prioridade)
VALUES
('2025-06-01', 1, 1),
('2025-06-15', 2, 2),
('2025-06-30', 3, 3);

-- 21. servico_tecnico
INSERT INTO servico_tecnico (id_ordens_de_servicos, id_tecnico)
VALUES
(1, 1),
(2, 2),
(3, 3);

-- 22. rotas_dos_voos
INSERT INTO rotas_dos_voos (origem_voo, destino_voo, altitude_voo)
VALUES
('Alcântara', 'Brasília', '12.000m'),
('Houston', 'Nova York', '10.500m'),
('Kourou', 'Paris', '11.000m');

-- 23. operacoes_aero_espacias
INSERT INTO operacoes_aero_espacias (id_individuo, id_tecnico, id_aeronave, id_rota_do_voo, data_operacao, detalhes_da_operacao)
VALUES
(1, 1, 1, 1, '2025-07-01', 'Transporte de carga orbital.'),
(2, 2, 2, 2, '2025-08-15', 'Treinamento de voo internacional.'),
(3, 3, 3, 3, '2025-09-03', 'Teste de propulsão atmosférica.');

-- 24. eventos_meteorologicos
INSERT INTO eventos_meteorologicos (id_operacao, data_do_evento, impacto_do_evento)
VALUES
(1, '2025-07-01 15:00:00', 'Ventos fortes durante a decolagem'),
(2, '2025-08-15 10:00:00', 'Tempestade elétrica leve'),
(3, '2025-09-03 19:00:00', 'Chuva intensa sem impacto crítico');

-- 25. comunicacao
INSERT INTO comunicacao (id_tecnico, id_individuo, data_comunicacao, conteudo)
VALUES
(1, 1, '2025-07-01 13:30:00', 'Preparação para lançamento concluída.'),
(2, 2, '2025-08-15 08:30:00', 'Inspeção elétrica finalizada.'),
(3, 3, '2025-09-03 18:00:00', 'Comunicação restaurada com controle central.');

-- selects

SELECT * FROM bases_aero_espacias;

SELECT * FROM status_licenca;

SELECT * FROM tipos_de_servicos;

SELECT * FROM prioridades;

SELECT * FROM fornecedores;

SELECT * FROM equipamentos_de_seguranca;

SELECT * FROM cargos;

SELECT * FROM sistemas_de_navegacao;

SELECT * FROM aeronaves;

SELECT * FROM individuos_envolvidos;

SELECT * FROM licenca_voo;

SELECT * FROM tipo_incidente;

SELECT * FROM tecnico_aero_espacias;

SELECT * FROM inspecao_tecnica;

SELECT * FROM treinamentos_realizados;

SELECT * FROM relatorio_ocorrencia_aeroespacial;

SELECT * FROM inquerito_aero_espacias;

SELECT * FROM aeronave_roa;

SELECT * FROM individuo_inquerito;

SELECT * FROM ordens_de_servicos;

SELECT * FROM servico_tecnico;

SELECT * FROM rotas_dos_voos;

SELECT * FROM operacoes_aero_espacias;

SELECT * FROM eventos_meteorologicos;

SELECT * FROM comunicacao;



-- Criacao das views
CREATE OR REPLACE VIEW vw_equipamentos_de_seguranca AS 
SELECT es.id_equipamento_de_seguranca, es.nome_equipamento, es.caracteristica_tecnica, f.nome_fornecedor  FROM equipamentos_de_seguranca es
LEFT JOIN fornecedores f ON es.id_fornecedor = f.id_fornecedor;

CREATE OR REPLACE VIEW vw_aeronaves AS 
SELECT a.id_aeronave, a.tipo_de_modelo, a.fabricante, sn.modelo_sistema_de_navegacao FROM aeronaves a
LEFT JOIN sistemas_de_navegacao sn ON a.id_sistema_de_navegacao = sn.id_sistema_de_navegacao;

CREATE OR REPLACE VIEW vw_individuos_envolvidos AS
SELECT ie.id_individuo, ie.nome_individuo, ie.cpf_individuo, c.cargo FROM individuos_envolvidos ie
LEFT JOIN cargos c ON ie.id_cargo = c.id_cargo;

CREATE OR REPLACE VIEW vw_licenca_voo AS 
SELECT lv.id_licenca, ie.nome_individuo ,lv.data_validade, lv.tipo_licenca, sl.status_licenca FROM licenca_voo lv
LEFT JOIN individuos_envolvidos ie ON lv.id_individuo = ie.id_individuo
LEFT JOIN status_licenca sl ON lv.id_status_licenca = sl.id_status_licenca;

CREATE OR REPLACE VIEW vw_tecnico_aero_espacias AS
SELECT tae.id_tecnico_aero_espacial, tae.nome_tecnico, c.cargo, bae.nome_base FROM tecnico_aero_espacias tae
LEFT JOIN bases_aero_espacias bae ON tae.id_base_aero_espacial = bae.id_base_aero_espacial
LEFT JOIN cargos c ON tae.id_cargo = c.id_cargo;

CREATE OR REPLACE VIEW vw_inspecao_tecnica AS
SELECT it.id_inspecao_tecnica, a.tipo_de_modelo ,it.data_inspecao, it.resultado_inspecao, tae.nome_tecnico FROM inspecao_tecnica it
LEFT JOIN aeronaves a ON it.id_aeronave = a.id_aeronave
LEFT JOIN tecnico_aero_espacias tae ON it.id_tecnico = tae.id_tecnico_aero_espacial
;

CREATE OR REPLACE VIEW vw_treinamentos_realizados AS 
SELECT tr.id_treinamento, tae.nome_tecnico, tr.tipo_de_treinamento, tr.data_treinamento, tr.tipo_certificacao FROM treinamentos_realizados tr
LEFT JOIN tecnico_aero_espacias tae ON tr.id_tecnico = tae.id_tecnico_aero_espacial ;

CREATE OR REPLACE VIEW vw_relatorio_ocorrencia_aeroespacial AS 
SELECT roa.id_roa, roa.data_roa, roa.local_roa, bae.nome_base, roa.descricao_ocorrencia, tae.nome_tecnico FROM relatorio_ocorrencia_aeroespacial roa
LEFT JOIN bases_aero_espacias bae ON roa.id_base = bae.id_base_aero_espacial
LEFT JOIN tecnico_aero_espacias tae ON roa.id_tecnico = tae.id_tecnico_aero_espacial
;

CREATE OR REPLACE VIEW vw_inquerito_aero_espacias AS 
SELECT iae.id_inquerito, iae.data_abertura, roa.descricao_ocorrencia, tae.nome_tecnico FROM inquerito_aero_espacias iae
LEFT JOIN tecnico_aero_espacias tae ON iae.id_tecnico = tae.id_tecnico_aero_espacial
LEFT JOIN relatorio_ocorrencia_aeroespacial roa ON iae.id_roa = roa.id_roa;

CREATE OR REPLACE VIEW vw_aeronave_roa AS 
SELECT ar.id_aeronave_roa,a.tipo_de_modelo , roa.descricao_ocorrencia, roa.data_roa ,tae.nome_tecnico AS responsavel FROM aeronave_roa ar
LEFT JOIN aeronaves a ON ar.id_aeronave = a.id_aeronave
LEFT JOIN relatorio_ocorrencia_aeroespacial roa ON ar.id_roa = roa.id_roa
LEFT JOIN tecnico_aero_espacias tae ON roa.id_tecnico = tae.id_tecnico_aero_espacial 
;

CREATE OR REPLACE VIEW vw_individuo_inquerito AS 
SELECT ii.id_individuo_inquerito, ie.nome_individuo, ie.cpf_individuo, iae.data_abertura FROM individuo_inquerito ii
LEFT JOIN individuos_envolvidos ie ON ii.id_individuo = ie.id_individuo
LEFT JOIN inquerito_aero_espacias iae ON ii.id_inquerito = iae.id_inquerito
;

CREATE OR REPLACE VIEW vw_ordens_de_servicos AS 
SELECT os.id_ordem_de_serviço, os.data_do_servico, ts.tipo_de_servico, p.prioridade FROM ordens_de_servicos os
LEFT JOIN prioridades p ON os.id_prioridade = p.id_prioridade
LEFT JOIN tipos_de_servicos ts ON os.id_tipo_de_servico = ts.id_tipo_de_servico
;

CREATE OR REPLACE VIEW vw_servico_tecnico AS 
SELECT st.id_servico_tecnico, ts.tipo_de_servico, os.data_do_servico, tae.nome_tecnico  FROM servico_tecnico st
LEFT JOIN ordens_de_servicos os ON st.id_ordens_de_servicos = os.id_ordem_de_serviço
LEFT JOIN tecnico_aero_espacias tae ON st.id_tecnico = tae.id_tecnico_aero_espacial
LEFT JOIN tipos_de_servicos ts ON os.id_tipo_de_servico = ts.id_tipo_de_servico
;

CREATE OR REPLACE VIEW vw_operacoes_aero_espacias AS
SELECT oae.id_operacao, ie.nome_individuo, ci.cargo AS cargo_individuo ,tae.nome_tecnico, ct.cargo AS cargo_tecnico ,a.tipo_de_modelo, rv.origem_voo, rv.destino_voo, oae.data_operacao, oae.detalhes_da_operacao FROM operacoes_aero_espacias oae
LEFT JOIN individuos_envolvidos ie ON oae.id_individuo = ie.id_individuo
LEFT JOIN tecnico_aero_espacias tae ON oae.id_tecnico = tae.id_tecnico_aero_espacial
LEFT JOIN aeronaves a ON oae.id_aeronave = a.id_aeronave
LEFT JOIN rotas_dos_voos rv ON oae.id_rota_do_voo = rv.id_rota_do_voo
INNER JOIN cargos ci ON ci.id_cargo = ie.id_cargo
INNER JOIN cargos ct ON ct.id_cargo = tae.id_cargo
;

CREATE OR REPLACE VIEW vw_eventos_meteorologicos AS 
SELECT em.id_evento_meteorologico, oae.detalhes_da_operacao ,oae.data_operacao, em.impacto_do_evento ,em.data_do_evento FROM eventos_meteorologicos em
LEFT JOIN operacoes_aero_espacias oae ON em.id_operacao = oae.id_operacao;

CREATE OR REPLACE VIEW vw_comunicacao AS 
SELECT c.id_comunicacao, tae.nome_tecnico,ct.cargo AS cargo_tecnico ,ie.nome_individuo, ci.cargo AS cargo_individuo ,c.data_comunicacao, c.conteudo FROM comunicacao c
LEFT JOIN individuos_envolvidos ie ON c.id_individuo = ie.id_individuo
LEFT JOIN tecnico_aero_espacias tae ON c.id_tecnico = tae.id_tecnico_aero_espacial
INNER JOIN cargos ci ON ci.id_cargo = ie.id_cargo
INNER JOIN cargos ct ON ct.id_cargo = tae.id_cargo;

-- Select das Views

SELECT * FROM vw_equipamentos_de_seguranca;

SELECT * FROM vw_aeronaves;

SELECT * FROM vw_individuos_envolvidos;

SELECT * FROM vw_licenca_voo;

SELECT * FROM vw_tecnico_aero_espacias;

SELECT * FROM vw_inspecao_tecnica;

SELECT * FROM vw_treinamentos_realizados;

SELECT * FROM vw_relatorio_ocorrencia_aeroespacial;

SELECT * FROM vw_inquerito_aero_espacias;

SELECT * FROM vw_aeronave_roa;

SELECT * FROM vw_individuo_inquerito;

SELECT * FROM vw_ordens_de_servicos;

SELECT * FROM vw_servico_tecnico;

SELECT * FROM vw_operacoes_aero_espacias;

SELECT * FROM vw_eventos_meteorologicos;

SELECT * FROM vw_comunicacao;

-- sistema de busca

DELIMITER $$
CREATE PROCEDURE sp_busca_tecnico(
IN busca_tecnico VARCHAR(100)  
)
BEGIN 
SELECT tae.id_tecnico_aero_espacial, tae.nome_tecnico, c.cargo, bae.nome_base FROM tecnico_aero_espacias tae
LEFT JOIN bases_aero_espacias bae ON tae.id_base_aero_espacial = bae.id_base_aero_espacial
LEFT JOIN cargos c ON tae.id_cargo = c.id_cargo
WHERE nome_tecnico LIKE CONCAT('%', busca_tecnico, '%');
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_busca_base(
IN busca_base VARCHAR(100)  
)
BEGIN 
SELECT * FROM bases_aero_espacias
WHERE nome_base LIKE CONCAT('%', busca_base ,'%');
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_busca_individuo(
IN busca_individuo VARCHAR(100)  
)
BEGIN 
SELECT ie.id_individuo, ie.nome_individuo, ie.cpf_individuo, c.cargo FROM individuos_envolvidos ie
LEFT JOIN cargos c ON ie.id_cargo = c.id_cargo
WHERE nome_individuo LIKE CONCAT('%', busca_individuo ,'%');
END $$

DELIMITER ;

DELIMITER $$
CREATE PROCEDURE sp_busca_aeronave(
IN busca_aeronave VARCHAR(100)
)
BEGIN
SELECT a.id_aeronave, a.tipo_de_modelo, a.fabricante, sn.modelo_sistema_de_navegacao FROM aeronaves a
LEFT JOIN sistemas_de_navegacao sn ON a.id_sistema_de_navegacao = sn.id_sistema_de_navegacao
WHERE tipo_de_modelo LIKE CONCAT('%', busca_aeronave , '%');

END $$
DELIMITER ;

-- parametros de pesquisa

call sp_busca_tecnico ('');

call sp_busca_base ('');

call sp_busca_individuo ('');

call sp_busca_aeronave('');