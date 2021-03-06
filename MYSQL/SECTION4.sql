CREATE DATABASE BUSINESS2;

USE BUSINESS2;

CREATE TABLE CLIENT(
      IDCLIENT INT PRIMARY KEY AUTO_INCREMENT,
      NAME VARCHAR(100) NOT NULL,
      GENDER ENUM("M", "F") NOT NULL,
      EMAIL VARCHAR(100) UNIQUE,
      CPF VARCHAR(15) UNIQUE
);

-- ENDERECO - OBRIGATORIO CADASTRO DE SOMENTE UM.
CREATE TABLE ADDRESS(
      IDADRESS INT PRIMARY KEY AUTO_INCREMENT,
      ST VARCHAR(100) NOT NULL,
      DISTRICT VARCHAR(100) NOT NULL,
      CITY VARCHAR(100) NOT NULL,
      STATE CHAR(2) NOT NULL,
      F_IDCLIENT INT UNIQUE,

      FOREIGN KEY(F_IDCLIENT)
      REFERENCES CLIENT(IDCLIENT)
);

-- TELEFONE - NAO OBRIGATORIOCADASTRO DE MAIS DE UM (OPCIONAL)
CREATE TABLE PHONE (
      IDPHONE INT PRIMARY KEY AUTO_INCREMENT,
      TYPE ENUM("RES","COM","CEL") NOT NULL,
      NUMBER VARCHAR(10) NOT NULL,
      F_IDCLIENT INT,

      FOREIGN KEY (F_IDCLIENT)
      REFERENCES CLIENT(IDCLIENT)
);

/*CHAVE ESTRANGEIRA É A CHAVE PRIMARIA DE UMA TABELA
QUE VAI ATÉ A OUTRA TABELA PARA FAZER REFERENCIA ENTRE
REGISTROS*/

/*EM RELACIONAMENTO 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA*/

/*EM RELACIONAMENTO 1 X N A CHAVE ESTRANGEIRA FICARA SEMPRE NA
CARDINALIDADE N*/

-- CLIENT
INSERT INTO CLIENT VALUES(NULL,'JOAO','M','JOAOA@IG.COM','76567587887');
INSERT INTO CLIENT VALUES(NULL,'CARLOS','M','CARLOSA@IG.COM','5464553466');
INSERT INTO CLIENT VALUES(NULL,'ANA','F','ANA@IG.COM','456545678');
INSERT INTO CLIENT VALUES(NULL,'CLARA','F',NULL,'5687766856');
INSERT INTO CLIENT VALUES(NULL,'JORGE','M','JORGE@IG.COM','8756547688');
INSERT INTO CLIENT VALUES(NULL,'CELIA','M','JCELIA@IG.COM','5767876889');

-- ADDRESS
INSERT INTO ADDRESS VALUES(NULL,'RUA ANTONIO SA','CENTRO','B. HORIZONTE','MG',4);
INSERT INTO ADDRESS VALUES(NULL,'RUA CAPITAO HERMES','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ADDRESS VALUES(NULL,'RUA PRES VARGAS','JARDINS','SAO PAULO','SP',3);
INSERT INTO ADDRESS VALUES(NULL,'RUA ALFANDEGA','ESTACIO','RIO DE JANEIRO','RJ',2);
INSERT INTO ADDRESS VALUES(NULL,'RUA DO OUVIDOR','FLAMENGO','RIO DE JANEIRO','RJ',6);
INSERT INTO ADDRESS VALUES(NULL,'RUA URUGUAIANA','CENTRO','VITORIA','ES',5);

-- PHONE
INSERT INTO PHONE VALUES(NULL,'CEL','78458743',5);
INSERT INTO PHONE VALUES(NULL,'RES','56576876',5);
INSERT INTO PHONE VALUES(NULL,'CEL','87866896',1);
INSERT INTO PHONE VALUES(NULL,'COM','54768899',2);
INSERT INTO PHONE VALUES(NULL,'RES','99667587',1);
INSERT INTO PHONE VALUES(NULL,'CEL','78989765',3);
INSERT INTO PHONE VALUES(NULL,'CEL','99766676',3);
INSERT INTO PHONE VALUES(NULL,'COM','66687899',1);
INSERT INTO PHONE VALUES(NULL,'RES','89986668',5);
INSERT INTO PHONE VALUES(NULL,'CEL','88687909',2);


SELECT * FROM CLIENT;
SELECT * FROM ADDRESS;
SELECT * FROM PHONE;

-- SELECAO, PROJECAO E JUNCAO

-- PROJECAO - É TUDO QUE VOCE QUER VER NA TELA

SELECT NOW() AS DATA_ATUAL;

SELECT 2 + 2 AS SOMA;

SELECT 2 + 2 AS SOMA, NOME, NOW()
FROM CLIENTE;

-- SELECAO - É UM SUBCONJUNTO DO CONJUNTO TOTAL DE REGISTROS DE UMA TABELA
-- A CLAUSULA DE SELECAO É O WHERE

SELECT NOME, SEXO, EMAIL -- PROJEÇÃO
FROM CLIENTE -- ORIGEM
WHERE SEXO = 'F'; -- SELEÇÃO

SELECT NUMERO /* PROJECAO */
FROM PHONE /* ORIGEM */
WHERE TIPO = 'CEL'; /* SELECAO */

-- JUNÇÃO -> JOIN

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;

SELECT ID_CLIENTE, BAIRRO, CIDADE
FROM ADDRESS;

SELECT IDCLIENT AS "ID OF CLIENT",NAME, GENDER, DISTRICT, CITY
FROM CLIENT, ADDRESS
WHERE IDCLIENT=F_IDCLIENT;

-- WHERE = SELEÇÃO
SELECT NAME, GENDER, DISTRICT, CITY
FROM CLIENT, ADDRESS
WHERE IDCLIENT=F_IDCLIENT
AND GENDER="F";

--INNER JOIN
SELECT NAME, GENDER, DISTRICT, CITY
FROM CLIENT
INNER JOIN ADDRESS
ON IDCLIENT=F_IDCLIENT;

SELECT NAME, GENDER, DISTRICT, CITY
FROM CLIENT
INNER JOIN ADDRESS
ON IDCLIENT = F_IDCLIENT
WHERE GENDER="F";

SELECT CLIENT.NAME, CLIENT.GENDER,  
      ADDRESS.DISTRICT, ADDRESS.CITY, 
      PHONE.TYPE, PHONE.NUMBER
FROM CLIENT
INNER JOIN ADDRESS
ON CLIENT.IDCLIENT=ADDRESS.F_IDCLIENT
INNER JOIN PHONE
ON CLIENT.IDCLIENT=PHONE.F_IDCLIENT;


SELECT C.NAME, C.GENDER, 
            A.DISTRICT, A.CITY, 
                  P.TYPE, P.NUMBER
FROM CLIENT C
INNER JOIN PHONE P
ON C.IDCLIENT=P.F_IDCLIENT
INNER JOIN ADDRESS A
ON C.IDCLIENT=A.F_IDCLIENT;

/*
DML - DATA MANIPULATION LANGUAGE
DDL - DATA DEFINITION LANGUAGE
DCL - DATA CONTROL LANGUAGE
TCL - TRANSACTION CONTROL LANGUAGE
*/

INSERT INTO CLIENT VALUES(NULL,'PAULA','M',NULL,'77437493');
INSERT INTO ADDRESS VALUES(NULL,'RUA JOAQUIM SILVA','ALVORADA','NITEROI','RJ',7);

-- UPDATE
UPDATE CLIENT 
SET GENDER="F"
WHERE IDCLIENT=7;

-- DELETE
INSERT INTO CLIENT VALUES(NULL,'XXX','M',NULL,'XXX');
DELETE FROM CLIENT WHERE IDCLIENT=8;


-- DDL
CREATE TABLE PRODUCT(
      IDPRODUCT INT PRIMARY KEY AUTO_INCREMENT,
      PRODUCT_NAME VARCHAR(100) NOT NULL,
      PRICE INT,
      SHIPPING FLOAT(10,2) NOT NULL
);

-- ALTER TABLE - ALTERANDO NOME DE UMA COLUNA -> CHANGE
ALTER TABLE PRODUCT
CHANGE UNIT_VALUE UNIT_VALUE INT NOT NULL;

-- MODIFY
ALTER TABLE PRODUCT
MODIFY UNIT_VALUE FLOAT(10,2) NOT NULL;

-- ADD UMA COLUNA
ALTER TABLE PRODUCT
ADD WEIGHT FLOAT(10,2) NOT NULL;

-- APAGANDO UMA COLUNA
ALTER TABLE PRODUCT
DROP COLUMN WEIGHT;

-- ADD UMA COLUMA NA ORDEM ESPECIFICA
ALTER TABLE PRODUCT
ADD COLUMN WEIGHT FLOAT(10,2) NOT NULL
AFTER UNIT_VALUE;

ALTER TABLE PRODUCT
DROP COLUMN WEIGHT;

ALTER TABLE PRODUCT
ADD COLUMN WEIGHT FLOAT(10,2) NOT NULL
FIRST;