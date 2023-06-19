-- -------- <  Exercício Extra 1 da Aula 10 > --------
--
--                    SCRIPT DE CRIACAO
--
-- Data Criacao ...........: 18/06/2023
-- Autor(es) ..............: Gabriela Silva Alves
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula10extra1
--
-- PROJETO => 01 Base de Dados
--         => 02 Tabelas
-- 
-- Ultimas Alteracoes
--   18/06/2023 => Criação
--
-- ---------------------------------------------------------
CREATE DATABASE IF NOT EXISTS aula10extra1;
USE aula10extra1;

CREATE TABLE ESTADO (
sigla VARCHAR(2) NOT NULL,
nome VARCHAR(20) NOT NULL,

CONSTRAINT PK_ESTADO PRIMARY KEY (sigla)

);

CREATE TABLE CIDADE(
codigo INT NOT NULL,
nome VARCHAR(50) NOT NULL,
sigla VARCHAR(2) NOT NULL,
habitantes BIGINT NOT NULL,

CONSTRAINT PK_CIDADE PRIMARY KEY (codigo),
CONSTRAINT UK_CIDADE UNIQUE (sigla, nome),
CONSTRAINT FK_CIDADE FOREIGN KEY (sigla) REFERENCES ESTADO (sigla)

);


