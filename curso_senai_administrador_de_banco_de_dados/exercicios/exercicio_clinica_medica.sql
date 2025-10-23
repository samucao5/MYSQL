CREATE DATABASE IF NOT EXISTS clinica_medica;


CREATE TABLE IF NOT EXISTS medicos(
id_medico INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
cpf VARCHAR(11) NOT NULL UNIQUE,
nome_medico VARCHAR(100) NOT NULL,
especialidade VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS pacientes(
id_paciente INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
cpf VARCHAR(11) NOT NULL UNIQUE,
nome_paciente VARCHAR(100) NOT NULL,
data_nasc DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS consultas(
id_consulta INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
id_paciente INT NOT NULL,
id_medico INT NOT NULL,
data_consulta DATETIME NOT NULL,
id_status INT NOT NULL,
FOREIGN KEY (id_paciente)
REFERENCES pacientes (id_paciente),
FOREIGN KEY (id_medico)
REFERENCES medicos (id_medico),
FOREIGN KEY (id_status)
REFERENCES status_consultas (id_status)
);

CREATE TABLE IF NOT EXISTS status_consultas(
id_status INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
status_consultas VARCHAR(45) NOT NULL
);

INSERT INTO medicos
(cpf,nome_medico,especialidade)
VALUES 
('00000000000','samuel','cirurgiao'),
('00000000001','theylor','ortopedista'),
('00000000002','pedro','pediatra');

INSERT INTO pacientes
(cpf,nome_paciente,data_nasc)
VALUES 
('00000000000','jose','2006-11-02'),
('00000000001','maria','2005-02-11'),
('00000000002','marcio','1980-11-05');

INSERT INTO status_consultas
(status_consultas)
VALUES 
('Agendada'),
('Realizada'),
('Cancelada');

INSERT INTO consultas
(id_paciente,id_medico,data_consulta,id_status)
VALUES 
(1,2,'2025-10-08 12:30:00',1),
(3,3,'2025-10-08 14:30:00',3),
(1,3,'2025-11-03 12:20:00',1),
(1,3,'2025-10-09 12:20:00',2)
;

CREATE VIEW view_consulta AS
SELECT pacientes.nome_paciente, medicos.nome_medico ,consultas.data_consulta, status_consultas.status_consultas FROM consultas
LEFT JOIN pacientes ON consultas.id_paciente = pacientes.id_paciente
LEFT JOIN medicos ON consultas.id_medico = medicos.id_medico
LEFT JOIN status_consultas ON consultas.id_status = status_consultas.id_status;

SELECT * FROM medicos;
SELECT * FROM pacientes;
SELECT * FROM status_consultas;
SELECT * FROM view_consulta;
