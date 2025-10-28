-- =============================================
-- Script para Criação do Banco de Dados RPG_Mundo
-- PROJETO: A FORJA DO DESTINO (Versão Modificada)
-- =============================================

-- 1. CRIAR O BANCO DE DADOS (SE NÃO EXISTIR)
-- =============================================
CREATE DATABASE IF NOT EXISTS RPG_Mundo
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

-- 2. SELECIONAR O BANCO DE DADOS PARA USO
-- =============================================
USE RPG_Mundo;

-- 3. CRIAR AS TABELAS (Estrutura Original)
-- =============================================

-- Tabela de Raças
CREATE TABLE IF NOT EXISTS Racas (
    RacaID INT AUTO_INCREMENT PRIMARY KEY,
    NomeRaca VARCHAR(50) NOT NULL UNIQUE,
    DescricaoRaca TEXT,
    BonusForca INT DEFAULT 0,
    BonusDestreza INT DEFAULT 0,
    BonusInteligencia INT DEFAULT 0,
    BonusVitalidade INT DEFAULT 0
);

-- Tabela de Classes
CREATE TABLE IF NOT EXISTS Classes (
    ClasseID INT AUTO_INCREMENT PRIMARY KEY,
    NomeClasse VARCHAR(50) NOT NULL UNIQUE,
    DescricaoClasse TEXT,
    HabilidadePrincipal VARCHAR(100)
);

-- Tabela de Personagens
CREATE TABLE IF NOT EXISTS Personagens (
    PersonagemID INT AUTO_INCREMENT PRIMARY KEY,
    NomePersonagem VARCHAR(100) NOT NULL,
    RacaID INT,
    ClasseID INT,
    Nivel INT DEFAULT 1,
    PontosVidaMax INT DEFAULT 10,
    PontosVidaAtuais INT DEFAULT 10,
    PontosManaMax INT DEFAULT 5,
    PontosManaAtuais INT DEFAULT 5,
    Forca INT DEFAULT 10,
    Destreza INT DEFAULT 10,
    Inteligencia INT DEFAULT 10,
    Vitalidade INT DEFAULT 10,
    Experiencia INT DEFAULT 0,
    DataCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (RacaID) REFERENCES Racas(RacaID) ON DELETE SET NULL ON UPDATE CASCADE,
    FOREIGN KEY (ClasseID) REFERENCES Classes(ClasseID) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Tabela de Tipos de Magias
CREATE TABLE IF NOT EXISTS TiposMagia (
    TipoMagiaID INT AUTO_INCREMENT PRIMARY KEY,
    NomeTipo VARCHAR(50) NOT NULL UNIQUE COMMENT 'Ex: Ataque, Cura, Buff, Debuff'
);

-- Tabela de Magias
CREATE TABLE IF NOT EXISTS Magias (
    MagiaID INT AUTO_INCREMENT PRIMARY KEY,
    NomeMagia VARCHAR(100) NOT NULL UNIQUE,
    DescricaoMagia TEXT,
    TipoMagiaID INT,
    CustoMana INT DEFAULT 0,
    DanoBase INT DEFAULT 0,
    CuraBase INT DEFAULT 0,
    DuracaoTurnos INT DEFAULT 0,
    NivelRequerido INT DEFAULT 1,
    FOREIGN KEY (TipoMagiaID) REFERENCES TiposMagia(TipoMagiaID) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Tabela Associativa: Magias Aprendidas por Personagens
CREATE TABLE IF NOT EXISTS PersonagemMagias (
    PersonagemID INT,
    MagiaID INT,
    NivelMaestria INT DEFAULT 1,
    PRIMARY KEY (PersonagemID, MagiaID),
    FOREIGN KEY (PersonagemID) REFERENCES Personagens(PersonagemID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MagiaID) REFERENCES Magias(MagiaID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela de Tipos de Monstros
CREATE TABLE IF NOT EXISTS TiposMonstro (
    TipoMonstroID INT AUTO_INCREMENT PRIMARY KEY,
    NomeTipoMonstro VARCHAR(50) NOT NULL UNIQUE COMMENT 'Ex: Humanoide, Besta, Morto-Vivo, Elemental'
);

-- Tabela de Monstros
CREATE TABLE IF NOT EXISTS Monstros (
    MonstroID INT AUTO_INCREMENT PRIMARY KEY,
    NomeMonstro VARCHAR(100) NOT NULL,
    TipoMonstroID INT,
    NivelMonstro INT DEFAULT 1,
    PontosVidaMax INT DEFAULT 10,
    PontosVidaAtuais INT DEFAULT 10,  -- Adicionado para controle de combate
    AtaqueBase INT DEFAULT 5,
    DefesaBase INT DEFAULT 3,
    ExperienciaConcedida INT DEFAULT 10,
    DescricaoMonstro TEXT,
    
    -- =============================================
    -- MODIFICAÇÃO PARA O PROJETO:
    -- Coluna para ser usada pelo Gatilho (Trigger)
    StatusMonstro VARCHAR(20) DEFAULT 'Ativo' COMMENT 'Ex: Ativo, Derrotado, Em Fuga',
    -- =============================================
    
    FOREIGN KEY (TipoMonstroID) REFERENCES TiposMonstro(TipoMonstroID) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Tabela Associativa: Magias Conhecidas por Monstros
CREATE TABLE IF NOT EXISTS MonstroMagias (
    MonstroID INT,
    MagiaID INT,
    PRIMARY KEY (MonstroID, MagiaID),
    FOREIGN KEY (MonstroID) REFERENCES Monstros(MonstroID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MagiaID) REFERENCES Magias(MagiaID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela de Cenários
CREATE TABLE IF NOT EXISTS Cenarios (
    CenarioID INT AUTO_INCREMENT PRIMARY KEY,
    NomeCenario VARCHAR(100) NOT NULL UNIQUE,
    DescricaoCenario TEXT,
    NivelPerigoMin INT DEFAULT 1,
    TipoAmbiente VARCHAR(50) COMMENT 'Ex: Floresta, Caverna, Cidade, Masmorra'
);

-- Tabela Associativa: Monstros por Cenário
CREATE TABLE IF NOT EXISTS CenarioMonstros (
    CenarioID INT,
    MonstroID INT,
    FrequenciaAparicao ENUM('Raro', 'Comum', 'Incomum') DEFAULT 'Comum',
    PRIMARY KEY (CenarioID, MonstroID),
    FOREIGN KEY (CenarioID) REFERENCES Cenarios(CenarioID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (MonstroID) REFERENCES Monstros(MonstroID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela de Tipos de Item
CREATE TABLE IF NOT EXISTS TiposItem (
    TipoItemID INT AUTO_INCREMENT PRIMARY KEY,
    NomeTipoItem VARCHAR(50) NOT NULL UNIQUE COMMENT 'Ex: Arma, Armadura, Poção, Acessório, Chave'
);

CREATE TABLE IF NOT EXISTS Itens (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    NomeItem VARCHAR(100) NOT NULL UNIQUE,
    DescricaoItem TEXT,
    TipoItemID INT,
    Valor INT DEFAULT 0 COMMENT 'Valor em moedas do jogo',
    Efeito TEXT COMMENT 'Ex: +5 Ataque, Cura 20 PV',
    Raridade ENUM('Comum', 'Incomum', 'Raro', 'Épico', 'Lendário') DEFAULT 'Comum',
    FOREIGN KEY (TipoItemID) REFERENCES TiposItem(TipoItemID) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Tabela de Inventário dos Personagens
CREATE TABLE IF NOT EXISTS Inventarios (
    InventarioID INT AUTO_INCREMENT PRIMARY KEY,
    PersonagemID INT UNIQUE, -- Cada personagem tem um inventário
    CapacidadeMaxima INT DEFAULT 20,
    FOREIGN KEY (PersonagemID) REFERENCES Personagens(PersonagemID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Tabela Associativa: Itens no Inventário
CREATE TABLE IF NOT EXISTS InventarioItens (
    InventarioID INT,
    ItemID INT,
    Quantidade INT DEFAULT 1,
    Equipado BOOLEAN DEFAULT FALSE,
    PRIMARY KEY (InventarioID, ItemID),
    FOREIGN KEY (InventarioID) REFERENCES Inventarios(InventarioID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ItemID) REFERENCES Itens(ItemID) ON DELETE CASCADE ON UPDATE CASCADE
);


-- =============================================
-- 4. POPULAR AS TABELAS (Dados Iniciais + Modificações)
-- =============================================

-- Populando Raças
INSERT INTO Racas (NomeRaca, DescricaoRaca, BonusForca, BonusDestreza, BonusInteligencia, BonusVitalidade) VALUES
('Humano', 'Adaptáveis e versáteis.', 1, 1, 1, 1),
('Elfo', 'Ágeis e com afinidade mágica.', 0, 2, 2, 0),
('Anão', 'Resistentes e fortes.', 2, 0, 0, 2),
('Orc', 'Brutais e poderosos em combate corpo-a-corpo.', 3, 0, -1, 2),
('Halfling', 'Pequenos, sortudos e furtivos.', -1, 3, 0, 1);

-- Populando Classes
INSERT INTO Classes (NomeClasse, DescricaoClasse, HabilidadePrincipal) VALUES
('Guerreiro', 'Mestre do combate corpo-a-corpo com armas.', 'Ataque Poderoso'),
('Mago', 'Conjurador de magias arcanas devastadoras.', 'Bola de Fogo'),
('Ladino', 'Especialista em furtividade e ataques precisos.', 'Ataque Furtivo'),
('Clérigo', 'Devoto que cura aliados e repele o mal.', 'Cura Leve'),
('Arqueiro', 'Atirador de elite com arco e flecha.', 'Flecha Precisa');

-- Populando Personagens
INSERT INTO Personagens (NomePersonagem, RacaID, ClasseID, Nivel, PontosVidaMax, PontosVidaAtuais, Forca, Destreza, Inteligencia, Vitalidade) VALUES
('Aragorn', 1, 1, 5, 50, 50, 18, 15, 12, 16), -- Humano Guerreiro
('Legolas', 2, 5, 5, 40, 40, 12, 20, 14, 10), -- Elfo Arqueiro
('Gandalf', 1, 2, 7, 35, 35, 10, 12, 22, 11), -- Humano Mago (adaptado)
('Gimli', 3, 1, 5, 60, 60, 20, 10, 10, 18), -- Anão Guerreiro
('Frodo', 5, 3, 3, 25, 25, 8, 18, 12, 10);   -- Halfling Ladino

-- Populando Tipos de Magia
INSERT INTO TiposMagia (NomeTipo) VALUES
('Ataque Elemental'), ('Cura'), ('Buff'), ('Debuff'), ('Utilidade');

-- Populando Magias
INSERT INTO Magias (NomeMagia, DescricaoMagia, TipoMagiaID, CustoMana, DanoBase, CuraBase, NivelRequerido) VALUES
('Bola de Fogo', 'Lança uma esfera flamejante no inimigo.', 1, 10, 25, 0, 1),
('Cura Leve', 'Restaura uma pequena quantidade de pontos de vida.', 2, 8, 15, 0, 1),
('Escudo Mágico', 'Aumenta a defesa do alvo temporariamente.', 3, 12, 0, 0, 2),
('Flecha de Gelo', 'Atira uma flecha que causa dano e lentidão.', 1, 7, 18, 0, 2),
('Força do Urso', 'Aumenta a força do alvo temporariamente.', 3, 15, 0, 0, 3),
('Enfraquecer', 'Reduz o ataque do inimigo.', 4, 10, 0, 0, 2);

-- Populando Magias Aprendidas por Personagens
INSERT INTO PersonagemMagias (PersonagemID, MagiaID) VALUES (3, 1), (3, 3), (1, 2);

-- Populando Tipos de Monstro
INSERT INTO TiposMonstro (NomeTipoMonstro) VALUES ('Humanoide'), ('Besta'), ('Morto-Vivo'), ('Elemental'), ('Dragão');

-- Populando Monstros
INSERT INTO Monstros (NomeMonstro, TipoMonstroID, NivelMonstro, PontosVidaMax, PontosVidaAtuais, AtaqueBase, DefesaBase, ExperienciaConcedida, DescricaoMonstro) VALUES
('Goblin Lanceiro', 1, 1, 15, 15, 8, 2, 10, 'Pequeno humanoide verde com uma lança enferrujada.'),
('Lobo Cinzento', 2, 2, 25, 25, 12, 4, 15, 'Predador comum das florestas.'),
('Esqueleto Guerreiro', 3, 3, 30, 30, 10, 5, 20, 'Restos reanimados de um antigo soldado.'),
('Elemental de Fogo Pequeno', 4, 4, 40, 40, 15, 3, 30, 'Uma manifestação viva do fogo.'),
('Aranha Gigante', 2, 2, 20, 20, 10, 3, 12, 'Uma aranha assustadoramente grande e venenosa.');

-- Monstros podem conhecer magias
INSERT INTO MonstroMagias (MonstroID, MagiaID) VALUES
((SELECT MonstroID FROM Monstros WHERE NomeMonstro = 'Elemental de Fogo Pequeno'), (SELECT MagiaID FROM Magias WHERE NomeMagia = 'Bola de Fogo'));

-- Populando Cenários
INSERT INTO Cenarios (NomeCenario, DescricaoCenario, NivelPerigoMin, TipoAmbiente) VALUES
('Floresta Sussurrante', 'Uma floresta antiga e densa, cheia de mistérios.', 1, 'Floresta'),
('Cavernas Escuras', 'Uma rede de túneis subterrâneos úmidos e perigosos.', 3, 'Caverna'),
('Cidade de Pedra Branca', 'Uma majestosa cidade capital, centro de comércio e cultura.', 1, 'Cidade'),
('Ruínas Amaldiçoadas', 'Restos de uma civilização antiga, agora assombrada.', 5, 'Masmorra');

-- Populando Monstros por Cenário
INSERT INTO CenarioMonstros (CenarioID, MonstroID, FrequenciaAparicao) VALUES
((SELECT CenarioID FROM Cenarios WHERE NomeCenario = 'Floresta Sussurrante'), (SELECT MonstroID FROM Monstros WHERE NomeMonstro = 'Goblin Lanceiro'), 'Comum'),
((SELECT CenarioID FROM Cenarios WHERE NomeCenario = 'Floresta Sussurrante'), (SELECT MonstroID FROM Monstros WHERE NomeMonstro = 'Lobo Cinzento'), 'Comum'),
((SELECT CenarioID FROM Cenarios WHERE NomeCenario = 'Floresta Sussurrante'), (SELECT MonstroID FROM Monstros WHERE NomeMonstro = 'Aranha Gigante'), 'Incomum'),
((SELECT CenarioID FROM Cenarios WHERE NomeCenario = 'Cavernas Escuras'), (SELECT MonstroID FROM Monstros WHERE NomeMonstro = 'Goblin Lanceiro'), 'Incomum'),
((SELECT CenarioID FROM Cenarios WHERE NomeCenario = 'Cavernas Escuras'), (SELECT MonstroID FROM Monstros WHERE NomeMonstro = 'Aranha Gigante'), 'Comum'),
((SELECT CenarioID FROM Cenarios WHERE NomeCenario = 'Ruínas Amaldiçoadas'), (SELECT MonstroID FROM Monstros WHERE NomeMonstro = 'Esqueleto Guerreiro'), 'Comum'),
((SELECT CenarioID FROM Cenarios WHERE NomeCenario = 'Ruínas Amaldiçoadas'), (SELECT MonstroID FROM Monstros WHERE NomeMonstro = 'Elemental de Fogo Pequeno'), 'Raro');

-- Populando Tipos de Item
INSERT INTO TiposItem (NomeTipoItem) VALUES
('Arma Curta'), ('Arma Longa'), ('Escudo'), ('Armadura Leve'), ('Armadura Pesada'), ('Poção'), ('Pergaminho'), ('Anel'), ('Amuleto'), ('Chave'),
-- =============================================
-- MODIFICAÇÃO PARA O PROJETO:
('Material de Crafting');
-- =============================================

-- Populando Itens
INSERT INTO Itens (NomeItem, DescricaoItem, TipoItemID, Valor, Efeito, Raridade) VALUES
('Adaga Enferrujada', 'Uma adaga simples e gasta.', (SELECT TipoItemID FROM TiposItem WHERE NomeTipoItem = 'Arma Curta'), 5, '+2 Ataque', 'Comum'),
('Espada Longa de Aço', 'Uma espada longa bem balanceada.', (SELECT TipoItemID FROM TiposItem WHERE NomeTipoItem = 'Arma Longa'), 50, '+8 Ataque', 'Comum'),
('Escudo de Madeira', 'Um escudo básico de madeira.', (SELECT TipoItemID FROM TiposItem WHERE NomeTipoItem = 'Escudo'), 20, '+3 Defesa', 'Comum'),
('Poção de Cura Leve', 'Restaura 25 Pontos de Vida.', (SELECT TipoItemID FROM TiposItem WHERE NomeTipoItem = 'Poção'), 25, 'Cura 25 PV', 'Comum'),
('Pergaminho de Bola de Fogo', 'Permite conjurar Bola de Fogo uma vez.', (SELECT TipoItemID FROM TiposItem WHERE NomeTipoItem = 'Pergaminho'), 100, 'Conjura Bola de Fogo', 'Incomum'),
('Anel da Destreza', 'Um anel que aumenta a agilidade.', (SELECT TipoItemID FROM TiposItem WHERE NomeTipoItem = 'Anel'), 150, '+2 Destreza', 'Raro'),
('Armadura de Couro Batido', 'Proteção leve e flexível.', (SELECT TipoItemID FROM TiposItem WHERE NomeTipoItem = 'Armadura Leve'), 70, '+5 Defesa', 'Comum');

-- =============================================
-- MODIFICAÇÃO PARA O PROJETO: Novos Materiais
-- =============================================
SET @mat_craft_id = (SELECT TipoItemID FROM TiposItem WHERE NomeTipoItem = 'Material de Crafting');

INSERT INTO Itens (NomeItem, DescricaoItem, TipoItemID, Valor, Efeito, Raridade) VALUES
('Fragmento de Sombra', 'Uma essência escura que pulsa fracamente.', @mat_craft_id, 10, 'Material de Forja', 'Incomum'),
('Essência Elemental', 'O núcleo de um espírito elemental.', @mat_craft_id, 20, 'Material de Forja', 'Raro'),
('Couro de Besta', 'Pele resistente de um animal selvagem.', @mat_craft_id, 5, 'Material de Forja', 'Comum'),
('Minério de Ferro', 'Um pedaço bruto de metal.', @mat_craft_id, 3, 'Material de Forja', 'Comum'),
('Pena de Grifo', 'Uma pena leve e magicamente infundida.', @mat_craft_id, 15, 'Material de Forja', 'Raro');
-- =============================================

-- Populando Inventários (Criando um inventário para cada personagem)
INSERT INTO Inventarios (PersonagemID) SELECT PersonagemID FROM Personagens;

-- Populando Itens nos Inventários (Alguns exemplos)
-- Aragorn (PersonagemID 1) tem uma Espada Longa e uma Poção
INSERT INTO InventarioItens (InventarioID, ItemID, Quantidade, Equipado) VALUES
((SELECT InventarioID FROM Inventarios WHERE PersonagemID = 1), (SELECT ItemID FROM Itens WHERE NomeItem = 'Espada Longa de Aço'), 1, TRUE),
((SELECT InventarioID FROM Inventarios WHERE PersonagemID = 1), (SELECT ItemID FROM Itens WHERE NomeItem = 'Poção de Cura Leve'), 3, FALSE);

-- Gandalf (PersonagemID 3) tem um Pergaminho e uma Adaga (para emergências)
INSERT INTO InventarioItens (InventarioID, ItemID, Quantidade, Equipado) VALUES
((SELECT InventarioID FROM Inventarios WHERE PersonagemID = 3), (SELECT ItemID FROM Itens WHERE NomeItem = 'Pergaminho de Bola de Fogo'), 2, FALSE),
((SELECT InventarioID FROM Inventarios WHERE PersonagemID = 3), (SELECT ItemID FROM Itens WHERE NomeItem = 'Adaga Enferrujada'), 1, FALSE);


-- =============================================
-- FIM DO SCRIPT
-- =============================================
SELECT 'Banco de dados RPG_Mundo (Versão PROJETO) criado e populado com sucesso!' AS Status;

-- =============================================
-- PONTO DE PARTIDA PARA OS ALUNOS:
-- =============================================
-- MISSÃO 1: Crie suas tabelas `MonstroLoot` e `ReceitasCrafting` aqui...
CREATE TABLE IF NOT EXISTS Monstroloot(
id_Monstro_loot INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_monstro INT NOT NULL,
id_item INT NOT NULL,
ChanceDrop DECIMAL(5,2) NOT NULL,
Quantidade_min INT NOT NULL,
Quantidade_max INT NOT NULL,
FOREIGN KEY (id_monstro)
REFERENCES Monstros (MonstroID),
FOREIGN KEY (id_item)
REFERENCES  Itens (ItemID)
);

CREATE TABLE IF NOT EXISTS ReceitaCrafting(
ReceitaCraftingID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
ItemID_Resultado INT NOT NULL,
FOREIGN KEY (ItemID_Resultado)
REFERENCES Itens (itemID)
);


CREATE TABLE IF NOT EXISTS ReceitaMateriais(
ReceitaMateriaisID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
ReceitaCraftingID INT NOT NULL,
ItemID_Material INT NOT NULL,
Quantidade INT NOT NULL,
FOREIGN KEY (ItemID_Material)
REFERENCES Itens (itemID),
FOREIGN KEY (ReceitaCraftingID)
REFERENCES ReceitaCrafting (ReceitaCraftingID)
);

INSERT INTO Monstroloot 
(id_monstro, id_item, ChanceDrop, Quantidade_min, Quantidade_max) 
VALUES
(1,12,0.75,1,10),
(3,11,3.6,1,5),
(4,9,6.54,0,5);


INSERT INTO ReceitaCrafting 
(ItemID_Resultado)
VALUES
(1),
(4),
(2);

INSERT INTO ReceitaMateriais
(ReceitaCraftingID, ItemID_Material, Quantidade)
VALUES
(1,11,5),
(2,12,3),
(3,2,11);

SELECT * FROM itens;
SELECT * FROM monstros;
SELECT * FROM monstroloot;
SELECT * FROM ReceitaCrafting;
SELECT * FROM ReceitaMateriais;
SELECT * FROM Inventarios;

-- MISSÃO 2: Crie seu gatilho `trg_MonstroDerrotado_Loot` aqui...

DELIMITER $$
CREATE TRIGGER trg_MonstroDerrotado_Loot 
AFTER UPDATE 
ON monstros
FOR EACH ROW 
BEGIN
IF old.StatusMonstro = 'ativo'  AND new.StatusMonstro = 'derrotado' THEN
call sp_ResolverLoot(NEW.MonstroID);
end IF;
END $$
DELIMITER ;

-- MISSÃO 3: Crie seus procedimentos `sp_IniciarCombate` e `sp_ResolverLoot` aqui...

DELIMITER $$
CREATE PROCEDURE sp_IniciarCombate(
in PersonagemID_em_luta INT,
in MonstroID_em_luta INT
)
begin
CREATE TEMPORARY TABLE IF NOT EXISTS SessaoCombateAtual(
PersonagemID_em_luta INT,
MonstroID_em_luta INT
);

INSERT INTO SessaoCombateAtual 
(PersonagemID_em_luta, MonstroID_em_luta)
VALUES
(PersonagemID_em_luta, MonstroID_em_luta);

END $$
DELIMITER ;

CALL sp_IniciarCombate(1,2);

DELIMITER $$
CREATE PROCEDURE sp_ResolverLoot(
IN monstro_id INT
)

BEGIN
DECLARE x,i,y INT;


SET x = (SELECT InventarioID FROM inventarios 
WHERE PersonagemID = (
SELECT PersonagemID_em_luta FROM sessaoCombateAtual 
WHERE MonstroID_em_luta = monstro_id));

SET i = (SELECT id_item FROM monstroloot 
WHERE id_monstro = monstro_id);

SET y = (SELECT Quantidade_min FROM monstroloot 
WHERE id_monstro = monstro_id);


INSERT INTO inventarioitens (InventarioID,ItemID,Quantidade) 
VALUES (x, i, y);

END $$
DELIMITER ;

DROP PROCEDURE sp_ResolverLoot;
-- MISSÃO 4: Crie seu procedimento `sp_ForjarItem` aqui...
	DELIMITER $$
	CREATE PROCEDURE sp_ForjarItem(
    in heroi_id INT, 
    in receita_id INT
    )
    begin_l: BEGIN
		DECLARE v_item_resultado INT;
		DECLARE v_faltando INT DEFAULT 0;
    
    START TRANSACTION;
    SELECT ItemID_Resultado
    INTO v_item_resultado
    FROM ReceitaCrafting
    WHERE ReceitaID = receita_id;
    
    SELECT COUNT(*)
    INTO v_faltando
    FROM ReceitaMaterias
    LEFT JOIN InventarioItens 
	ON InventarioItens.ItemID = ReceitaMaterias.ItemID
	AND InventarioItens.HeroiID = heroi_id
    WHERE ReceitaMaterias.ReceitaID = receita_id
	AND (InventarioItens.Quantidade IS NULL OR InventarioItens.Quantidade < ReceitaMaterias.QuantidadeNecessaria);
	
    IF v_faltando > 0 THEN ROLLBACK;
    SELECT 'ritual falhou por falta de materias';
    LEAVE begin_l;
    END IF;
    
    UPDATE InventarioItens
    JOIN ReceitaMateriais ON ReceitaMaterias.ItemID = InventarioItens.ItemID
    SET InventarioItens.Quantidade = InventarioItens.Quantidade - ReceitaMaterias.QuantidadeNecessaria
    WHERE InventarioItens.HeroiID = heroi_id
      AND ReceitaMaterias.ReceitaID = receita_id;
	
    
    INSERT INTO InventarioItens (HeroiID, ItemID, Quantidade)
    VALUES (heroi_id, v_item_resultado, 1)
    ON DUPLICATE KEY UPDATE Quantidade = Quantidade + 1;
	
    COMMIT;
    SELECT 'item forjado com sucesso' AS mensagem;
    END $$
    
    DELIMITER ;
    CALL sp_ForjarItem(1, 7);

--
-- MISSÃO 5: Crie suas views `vw_BestiarioDeLoot`, `vw_InventarioDetalhado` e `vw_ReceitasDaForja` aqui...



CREATE OR REPLACE VIEW vw_monstroloot AS
SELECT ml.id_Monstro_loot, Monstros.NomeMonstro , Itens.NomeItem , ml.ChanceDrop, ml.Quantidade_min, ml.Quantidade_max FROM Monstroloot ml
INNER JOIN Monstros ON ml.id_monstro = Monstros.MonstroID
INNER JOIN Itens ON ml.id_item = Itens.ItemID;

CREATE OR REPLACE VIEW vw_ReceitaCrafting AS
SELECT rc.ReceitaCraftingID, Itens.NomeItem FROM ReceitaCrafting rc
INNER JOIN Itens ON rc.ItemID_Resultado = Itens.ItemID;

CREATE OR REPLACE VIEW vw_ReceitaMateriais AS
SELECT rm.ReceitaMateriaisID, rm.ReceitaCraftingID, Itens.NomeItem, rm.Quantidade FROM ReceitaMateriais rm
INNER JOIN Itens ON rm.ItemID_Material = Itens.ItemID;

CREATE OR REPLACE VIEW vw_BestiarioDeLoot AS 
SELECT monstros.NomeMonstro, Itens.NomeItem, ml.ChanceDrop, ml.QuantidadeMax FROM monstroloot ml
INNER JOIN monstros ON ml.id_monstro = monstros.MonstroID
INNER JOIN itens ON ml.id_item = itens.ItemID
;

CREATE OR REPLACE VIEW vw_InventarioDetalhado AS
SELECT personagens.NomePersonagem, itens.NomeItem, InventarioItens.Quantidade, Itens.DescricaoItem FROM inventarios inv
INNER JOIN personagens ON inv.PersonagemID = personagens.PersonagemID
INNER JOIN inventarioitens ON inv.InventarioID = inventarioitens.InventarioID
INNER JOIN itens ON inventarioitens.ItemID = itens.ItemID;

CREATE OR REPLACE VIEW vw_ReceitasDaForja AS 
SELECT rc.ReceitaCraftingID, f.NomeItem AS item, m.Nomeitem AS material, rm.Quantidade FROM ReceitaCrafting rc
INNER JOIN Itens f ON rc.ItemID_Resultado = f.ItemID
INNER JOIN ReceitaMateriais rm ON rc.ReceitaCraftingID = rm.ReceitaCraftingID
INNER JOIN Itens m ON rm.ItemID_Material = m.ItemID
ORDER BY f.NomeItem, m.NomeItem;


SELECT * FROM vw_monstroloot;
SELECT * FROM vw_ReceitaCrafting;
SELECT * FROM vw_ReceitaMateriais;
SELECT * FROM vw_BestiarioDeLoot;
SELECT * FROM vw_InventarioDetalhado;
SELECT * FROM vw_ReceitasDaForja;
-- =============================================