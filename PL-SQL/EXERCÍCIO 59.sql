--
-- Oracle PL/SQL Avançado 
--
-- Seção 32 - LOBs
--
-- Aula 4 - BFILE

-- Criando tabela com coluna BFILE

DROP TABLE job_Profiles;
CREATE TABLE job_Profiles
(resume_id   NUMBER,
 first_name  VARCHAR2(200),
 last_name   VARCHAR2(200),
 profile_picture  BFILE);
 
 DESC job_profiles
 
-- Armazenando imagens em uma coluna BFILE

DECLARE
  vNomeArquivo   VARCHAR2(100) := 'CursoOracleCompleto.jpeg';
  vDiretorio     VARCHAR2(100) := 'IMAGENS';
  vArquivoOrigem   BFILE;  
BEGIN

  vArquivoOrigem := BFILENAME(vDiretorio,vNomeArquivo);
  
  IF DBMS_LOB.FILEEXISTS(vArquivoOrigem) = 1 THEN
     INSERT INTO job_profiles
     VALUES (1, 'Oracle', 'Man', vArquivoOrigem);
     COMMIT;
  END IF;
   
EXCEPTION
  WHEN others THEN
    RAISE_APPLICATION_ERROR(-20001,'Erro Oracle ' || SQLCODE || SQLERRM);
END;

SELECT *
FROM job_Profiles;