--
-- Oracle PL/SQL Avançado 
--
-- Seção 32 - LOBs
--
-- Aula 2 - CLOBs

-- Criando tabela com CLOBs

DROP TABLE job_resumes;
CREATE TABLE job_resumes
(resume_id   NUMBER,
 first_name  VARCHAR2(200),
 last_name   VARCHAR2(200),
 resume      CLOB);
 
INSERT INTO job_resumes
VALUES (1, 'Paul', 'Jones', EMPTY_CLOB());

COMMIT;
 
SELECT resume_id, first_name, last_name, SUBSTR(resume,1,30)
FROM   job_resumes;

SELECT LENGTH(resume), DBMS_LOB.GETLENGTH(resume)
FROM   job_resumes;

SELECT DBMS_LOB.SUBSTR(resume,DBMS_LOB.GETLENGTH(resume),1) 
FROM   job_resumes;

-- Inserindo dados na coluna CLOB

INSERT INTO job_resumes 
VALUES  (2, 'Robert','Johnson' , 'Project Manager - Scrum Master, Porto Alegre, RS, Brasil');

SELECT resume_id, first_name, last_name, SUBSTR(resume,1,30)
FROM   job_resumes;

SELECT LENGTH(resume), DBMS_LOB.GETLENGTH(resume)
FROM   job_resumes;

SELECT DBMS_LOB.SUBSTR(resume,DBMS_LOB.GETLENGTH(resume),1) 
FROM   job_resumes;

COMMIT;

CREATE OR REPLACE PROCEDURE PRC_INSERE_RESUME
(presume_id IN job_resumes.resume_id%TYPE, presume IN VARCHAR2) 
IS
   vresume_localizador    CLOB;
   vTamanho_Texto         NUMBER;
   vDeslocamento          NUMBER;
BEGIN
   SELECT resume
   INTO   vresume_localizador
   FROM   job_resumes
   WHERE  resume_id = presume_id
   FOR UPDATE;

   vDeslocamento := 1;
   vTamanho_Texto := LENGTH(presume);
   DBMS_LOB.WRITE(vresume_localizador,vTamanho_Texto,vDeslocamento,presume);
   COMMIT;
END;

exec PRC_INSERE_RESUME(1,'DBA - Database administrator , Porto Alegre, RS, Brasil')

SELECT resume_id, first_name, last_name, SUBSTR(resume,1,30)
FROM   job_resumes;

SELECT LENGTH(resume), DBMS_LOB.GETLENGTH(resume)
FROM   job_resumes;

SELECT DBMS_LOB.SUBSTR(resume,DBMS_LOB.GETLENGTH(resume),1) 
FROM   job_resumes;

CREATE OR REPLACE PROCEDURE PRC_EXIBE_RESUME
(presume_id IN job_resumes.resume_id%TYPE) 
IS
   vresume_localizador    CLOB;
   vTamanho_Texto         NUMBER;
   vDeslocamento          NUMBER;
   vTexto                 VARCHAR2(32767);
   vLoop                  NUMBER;
   vQuantidade            NUMBER := 1;
   vExibe                 VARCHAR2(240);
BEGIN
   SELECT resume
   INTO   vresume_localizador
   FROM   job_resumes
   WHERE  resume_id = presume_id
   FOR UPDATE;

   vDeslocamento := 1;
   vTamanho_Texto := DBMS_LOB.GETLENGTH(vresume_localizador);
   DBMS_LOB.READ(vresume_localizador,vTamanho_Texto,vDeslocamento,vTexto);
   vLoop := TRUNC((LENGTH(vTexto))/240)+1;
   FOR i IN 1 .. vLoop LOOP
     vExibe := SUBSTR(vTexto,vQuantidade,240);
     vQuantidade := vQuantidade + 240;
     DBMS_OUTPUT.PUT_LINE(vExibe);
   END LOOP;
   COMMIT;
END;

SET SERVEROUTPUT ON
exec PRC_EXIBE_RESUME(1)

exec PRC_EXIBE_RESUME(2)