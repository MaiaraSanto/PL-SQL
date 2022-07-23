--
-- Curso - Oracle PL/SQL Especialista: do Básico ao Avançado
--
-- Autor - Emílio Scudero
--
-- Seção 22 - PL/SQL Avançado - Instalação e Configuração das conexões no Oracle SQL Developer
--
-- Aula 3 - Criando o Usuário HR

-- Criando o Usuário HR

/*
 No Oracle SQL Developer conecte-se como usuário SYS utilizando a sua conexão para o usuário SYS
 Abra este script no Oracle SQL Developer e execute (F5)
/*

/*
  Configura a sessão para o pluggable database XEPDB1
*/

ALTER SESSION SET CONTAINER = XEPDB1;

/*
  Remove a conta do usuário HR e remove todos os seus objetos em cascata
*/
DROP USER HR CASCADE;

/*
  Cria a conta do usuário HR com a senha hr e concede os privilégios
*/

CREATE USER HR 
IDENTIFIED BY hr
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE TEMP
QUOTA unlimited on users
QUOTA 0 on system;

GRANT CONNECT, RESOURCE TO HR;

GRANT CREATE SESSION, CREATE VIEW, CREATE TABLE, ALTER SESSION, CREATE SEQUENCE, CREATE PROCEDURE, CREATE TRIGGER TO HR;
GRANT CREATE SYNONYM, CREATE DATABASE LINK, UNLIMITED TABLESPACE TO HR;