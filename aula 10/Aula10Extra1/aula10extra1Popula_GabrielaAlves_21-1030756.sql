-- -------- <  Exercício Extra 1 da Aula 10 > --------
--
--                    SCRIPT POPULA
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
USE aula10extra1;

-- Inserção de tuplas na tabela ESTADO
INSERT INTO ESTADO (sigla, nome) VALUES ('SP', 'São Paulo');
INSERT INTO ESTADO (sigla, nome) VALUES ('GO', 'Goias');
INSERT INTO ESTADO (sigla, nome) VALUES ('RJ', 'Rio de Janeiro');
INSERT INTO ESTADO (sigla, nome) VALUES ('DF', 'Distrito Federal');


-- Inserção de tuplas na tabela CIDADE
INSERT INTO CIDADE (codigo, nome, sigla, habitantes) VALUES (1, 'São Paulo', 'SP', 11253503);
INSERT INTO CIDADE (codigo, nome, sigla, habitantes) VALUES (2, 'Goiânia', 'GO', 1400000);
INSERT INTO CIDADE (codigo, nome, sigla, habitantes) VALUES (3, 'Brasília', 'DF', 220393);
INSERT INTO CIDADE (codigo, nome, sigla, habitantes) VALUES (4, 'Campinas', 'SP', 1223237);
INSERT INTO CIDADE (codigo, nome, sigla, habitantes) VALUES (5, 'Cocalzinho', 'GO', 20771);
INSERT INTO CIDADE (codigo, nome, sigla, habitantes) VALUES (6, 'Sobradinho', 'DF', 69363);
INSERT INTO CIDADE (codigo, nome, sigla, habitantes) VALUES (7, 'Santos', 'SP',  1765277);
INSERT INTO CIDADE (codigo, nome, sigla, habitantes) VALUES (8, 'Rio de Janeiro', 'RJ', 6775561);


