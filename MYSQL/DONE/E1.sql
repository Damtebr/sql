-- CRIANDO UM BANCO
CREATE DATABASE LIBRARY;

-- CONECTANDO-SE AO BANCO
USE LIBRARY;

CREATE TABLE BOOKS (
      BOOK VARCHAR(100),
      AUTHOR VARCHAR(100),
      GENDER CHAR(1),
      PAGES INT (10),
      PUBLISHING_COMPANY VARCHAR(100),
      PRICE FLOAT(10,2),
      FU CHAR(2),
      YEAR INT(4)
);

INSERT INTO BOOKS VALUES('Cavaleiro Real','Ana Claudia','F',465,'Atlas',49.9,'RJ',2009);
INSERT INTO BOOKS VALUES('SQL para leigos','João Nunes','M',450,'Addison',98,'SP',2018);
INSERT INTO BOOKS VALUES('Receitas Caseiras','Celia Tavares','F',210,'Atlas',45,'RJ',2008);
INSERT INTO BOOKS VALUES('Pessoas Efetivas','Eduardo Santos','M',390,'Beta',78,'RJ',2018);
INSERT INTO BOOKS VALUES('Habitos Saudáveis','Eduardo Santos','M',630,'Beta',150,'RJ',2019);
INSERT INTO BOOKS VALUES('A Casa Marrom','Hermes Macedo','M',250,'Bubba',60,'MG',2016);
INSERT INTO BOOKS VALUES('Estacio Querido','Geraldo Francisco','M',310,'Insignia',100,'ES',2015);
INSERT INTO BOOKS VALUES('Pra sempre amigas','Leda Silva','F',510,'Insignia',78,'ES',2011);
INSERT INTO BOOKS VALUES('Copas Inesqueciveis','Marco Alcantara','M',200,'Larson',130,'RS',2018);
INSERT INTO BOOKS VALUES('O poder da mente','Clara Mafra','F',120,'Continental',56,'SP',2017);

-- 1
SELECT * FROM BOOKS;

-- 2
SELECT BOOK AS LIVROS, PUBLISHING_COMPANY AS EDITORA
FROM BOOKS;

-- 3
SELECT BOOK AS LIVRO, FU AS ESTADO, GENDER AS SEXO
FROM BOOKS
WHERE GENDER="M";

-- 4
SELECT BOOK AS LIVRO, PAGES AS "PÁGINAS", AUTHOR AS AUTORES, GENDER AS SEXO
FROM BOOKS
WHERE GENDER="F";

-- 5
SELECT PRICE AS VALORES, PUBLISHING_COMPANY AS EDITORAS, FU AS ESTADO
FROM BOOKS
WHERE FU="SP";

-- 6
SELECT
      BOOK AS LIVROS,
      AUTHOR AS AUTORES,
      GENDER AS SEXO,
      PAGES AS PÁGINAS,
      PUBLISHING_COMPANY AS EDITORAS,
      PRICE AS PREÇO,
      FU AS ESTADOS,
      YEAR AS "ANO DE PUBLICAÇÃO"
FROM BOOKS
WHERE GENDER="M" AND (FU="SP" OR FU="RJ");

SELECT
      BOOK AS LIVROS,
      AUTHOR AS AUTORES,
      GENDER AS SEXO,
      PAGES AS PÁGINAS,
      PUBLISHING_COMPANY AS EDITORAS,
      PRICE AS PREÇO,
      FU AS ESTADOS,
      YEAR AS "ANO DE PUBLICAÇÃO"
FROM BOOKS
WHERE GENDER="M"
AND FU="SP"
AND PAGES > 100;