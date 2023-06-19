-- -------- <  Exercício Extra 1 da Aula 10 > --------
--
--                    SCRIPT CONSULTA
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

-- A) Projeção de sigla e nome do estado 
-- de sigla SP e DF (resolvida como exemplo no 
-- material da e que deverá estar entregue também);

SELECT sigla, nome
FROM ESTADO
WHERE sigla = 'SP'
OR sigla = 'DF';

-- B) Selecione somente o nome e a sigla das cidades 
-- que são dos estados RJ, DF e GO;

SELECT nome, sigla
FROM CIDADE
WHERE sigla = 'RJ'
OR sigla = 'DF'
OR sigla = 'GO';

-- C) Selecione todas as cidades do primeiro estado que você 
-- cadastrou mostrando somente o nome da cidade, o nome do 
-- estado e sua sigla;

SELECT CIDADE.nome, ESTADO.nome, ESTADO.sigla
FROM ESTADO, CIDADE
WHERE ESTADO.sigla = CIDADE.sigla 
AND ESTADO.sigla = (
	SELECT sigla
    FROM ESTADO
    ORDER BY sigla DESC
    LIMIT 1
);

-- D) Selecione somente o nome e a sigla do estado que você 
-- cadastrou por último e todas as cidades cadastradas nele, 
-- mostrando o seu nome e a quantidade de habitantes em ordem 
-- crescente de nome de estado e nome de cidade.

SELECT ESTADO.nome, CIDADE.nome, CIDADE.habitantes
FROM ESTADO, CIDADE
WHERE ESTADO.sigla = CIDADE.sigla 
AND ESTADO.sigla = (
	SELECT sigla
    FROM ESTADO
    ORDER BY sigla ASC
    LIMIT 1
)
ORDER BY ESTADO.nome ASC, CIDADE.nome ASC;



