CREATE DATABASE IF NOT EXISTS instagram;
USE instagram;
CREATE TABLE IF NOT EXISTS story(
id_story INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nome_do_story VARCHAR(100) NOT NULL
);

INSERT INTO story(nome_do_story)
VALUE
('samucao'),
('felipe');

SELECT * FROM story;

DELETE FROM story WHERE id_story  = 2;

SELECT * FROM story;