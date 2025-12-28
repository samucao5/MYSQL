CREATE DATABASE IF NOT EXISTS banco_de_dados;
USE banco_de_dados;

CREATE TABLE IF NOT EXISTS tipos_numericos(
/*BIT: 1 a 64 caracteres*/
bit_1 BIT(64) NOT NULL,
/*TINYINT: 1 a 255 caracteres*/
tinyint_1 TINYINT(255),
/*BOOL: 0 e false e outros valores são verdadeiros*/
bool_1 BOOL,
/*INT: valores entre -2147483648 a 2147483647*/
int_1 INT(100),
/*DECIMAL: DECIMAL(numero maximo, numero maximo apos a virgula)*/
decimal_1 decimal(10, 2)
);