-- --------     < DETRAN >     ------------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 07/05/2023
-- Autor(es) ..............: Gabriela Silva Alves
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: aula4exer6Evolucao2
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--
-- Ultimas Alteracoes
--   07/05/2023 => Criação.
--              
-- -----------------------------------------------------------------
CREATE DATABASE  aula4exer6Evolucao2;
USE aula4exer6Evolucao2;

CREATE TABLE PROPRIETARIO (
  cpf INT(11) NOT NULL PRIMARY KEY,
  sexo ENUM('M', 'F') NOT NULL,
  dataNascimento DATE NOT NULL,
  rua VARCHAR(40) NOT NULL,
  numero INT NOT NULL,
  bairro VARCHAR(20) NOT NULL,
  complemento VARCHAR(50),
  cidade VARCHAR(20) NOT NULL,
  estado CHAR(2) NOT NULL,
  cep INT(8) NOT NULL,
  nome VARCHAR(100) NOT NULL
);

CREATE TABLE telefone (
  numero INT(15) NOT NULL,
  cpf INT(11) NOT NULL,
  
  CONSTRAINT telefone_PROPRIETARIO_FK FOREIGN KEY (cpf)
    REFERENCES PROPRIETARIO(cpf)
);

CREATE TABLE CATEGORIA (
  codigoCategoria INT(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nomeCategoria VARCHAR(20) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE MODELO (
  codigoModelo INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nomeModelo VARCHAR(20) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE VEICULO (
  chassi CHAR(17) NOT NULL,
  anoFabricacao INT(4) NOT NULL,
  corPredominante VARCHAR(20) NOT NULL,
  placa CHAR(7) PRIMARY KEY NOT NULL,
  cpfProprietario INT(11) NOT NULL,
  codigoCategoria INT(5) NOT NULL,
  codigoModelo INT(5) NOT NULL,
  CONSTRAINT VEICULO_PROPRIETARIO_FK FOREIGN KEY (cpfProprietario)
    REFERENCES PROPRIETARIO(cpf),
  CONSTRAINT VEICULO_CATEGORIA_FK FOREIGN KEY (codigoCategoria)
    REFERENCES CATEGORIA(codigoCategoria),
  CONSTRAINT VEICULO_MODELO_FK FOREIGN KEY (codigoModelo)
    REFERENCES MODELO(codigoModelo)
);

CREATE TABLE AGENTETRANSITO (
  matriculaFuncional INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nomeAgente VARCHAR(100) NOT NULL,
  dataContratacao DATE NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE LOCAL (
  codigoLocal INT(10) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  latitude DECIMAL(8, 6) NOT NULL,
  longitude DECIMAL(9, 6) NOT NULL,
  velocidadePermitida INT(3) NOT NULL
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE TIPOINFRACAO (
  valorInfracao DECIMAL(5, 2) NOT NULL,
  descricao VARCHAR(100) NOT NULL,
  codigoTipoInfracao INT(5) NOT NULL AUTO_INCREMENT PRIMARY KEY
) ENGINE = InnoDB AUTO_INCREMENT = 1;

CREATE TABLE INFRACAO (
  idInfracao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  dataHora DATETIME NOT NULL,
  velocidadeAferida INT(3),
  placaVeiculo CHAR(7) NOT NULL,
  codigoLocal INT(10) NOT NULL,
  matriculaFuncional INT(10) NOT NULL,
  codigoTipoInfracao INT(5) NOT NULL,
  CONSTRAINT INFRACAO_VEICULO_FK FOREIGN KEY (placaVeiculo)
    REFERENCES VEICULO(placa),
  CONSTRAINT INFRACAO_AGENTE_FK FOREIGN KEY (matriculaFuncional)
    REFERENCES AGENTETRANSITO(matriculaFuncional),
  CONSTRAINT INFRACAO_LOCAL_FK FOREIGN KEY (codigoLocal)
    REFERENCES LOCAL(codigoLocal),
  CONSTRAINT INFRACAO_TIPO_INFRACAO_FK FOREIGN KEY (codigoTipoInfracao)
    REFERENCES TIPOINFRACAO(codigoTipoInfracao)
) ENGINE = InnoDB AUTO_INCREMENT = 1;



