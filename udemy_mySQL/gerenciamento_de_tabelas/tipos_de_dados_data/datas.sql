CREATE DATABASE IF NOT EXISTS banco_de_dados;
USE banco_de_dados;
CREATE TABLE IF NOT EXISTS datas(
/*DATE: aceita um data no formato YYYY-MM-DD*/
date_1 DATE NOT NULL,
/*DATETIME: Aceita uma data com horario no formato YYYY-MM-DD hh:mm:ss*/
datet_1 DATETIME NOT NULL,
/*TIMESTAMP: Aceita uma data no formato de DATETIME, porem apenas entre os anos 1970 a 2038*/
times_1 TIMESTAMP NOT NULL
);