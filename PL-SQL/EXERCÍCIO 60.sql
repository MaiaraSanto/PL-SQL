--
-- Oracle PL/SQL Avançado 
--
-- Seção 32 - LOBs
--
-- Aula 3 - BLOBs

-- Criando tabela com BLOBs

DROP TABLE job_profiles;
CREATE TABLE job_profiles
(resume_id   NUMBER,
 first_name  VARCHAR2(200),
 last_name   VARCHAR2(200),
 profile_picture  BLOB);
 
-- Conectar como SYS

CREATE DIRECTORY IMAGENS AS 'C:\imagens';
GRANT READ, WRITE ON DIRECTORY imagens TO hr;

-- Criar uma pasta C:\imagens no windows

-- Importando uma imagens de um arquivo binário para uma coluna BLOB

DECLARE
  vArquivoOrigem   BFILE;  
  vBlobDestino     BLOB;
  vNomeArquivo     VARCHAR2(100) := 'CursoOracleCompleto.jpeg';
  vDiretorio       VARCHAR2(100) := 'IMAGENS';
BEGIN
  vArquivoOrigem := BFILENAME(vDiretorio,vNomeArquivo);
  
  IF DBMS_LOB.FILEEXISTS(vArquivoOrigem) = 1 THEN
     INSERT INTO job_profiles
     VALUES (1, 'Oracle', 'Man', EMPTY_BLOB())
       RETURNING profile_picture INTO vBlobDestino;
    
    DBMS_LOB.OPEN(vArquivoOrigem, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.LOADFROMFILE(vBlobDestino, vArquivoOrigem, DBMS_LOB.GETLENGTH(vArquivoOrigem));
    DBMS_LOB.CLOSE(vArquivoOrigem);
  
    COMMIT;
  ELSE 
    DBMS_OUTPUT.PUT_LINE('Arquivo: ' || vNomeArquivo || ' não existe!');
  END IF;
EXCEPTION
  WHEN others THEN
    DBMS_LOB.CLOSE(vArquivoOrigem);
    RAISE_APPLICATION_ERROR(-20001,'Erro Oracle ' || SQLCODE || SQLERRM);
END;

SELECT *
FROM job_profiles;

-- Exportando uma imagens a partir de uma coluna BLOB para um arquivo do S.O.
--

DECLARE
  vArquivoDestino   UTL_FILE.FILE_TYPE;  
  vBuffer           RAW(32767);
  vQuantidade       BINARY_INTEGER := 32767;
  vPosicao          INTEGER := 1;
  vBlobOrigem       BLOB;
  vTamanhoBlob      INTEGER;
  vNomeArquivoDestino  VARCHAR2(100) := 'CursoOracleCompletoCopia.jpeg';
  vDiretorioDestino    VARCHAR2(100) := 'IMAGENS';
  vResumeId         NUMBER := 1;
BEGIN
  SELECT profile_picture
  INTO   vBlobOrigem
  FROM   job_profiles
  WHERE  resume_id = vResumeId
  FOR UPDATE;
  
  vTamanhoBlob := DBMS_LOB.GETLENGTH(vBlobOrigem);
  DBMS_OUTPUT.PUT_LINE('Tamanho do arquivo: '||vTamanhoBlob);      

-- Cria o arquivo binário de destino

  vArquivoDestino := UTL_FILE.FOPEN(vDiretorioDestino,vNomeArquivoDestino,'wb',32767);
  
  -- Leitura do BLOB e escrita no arquivo
  WHILE vPosicao < vTamanhoBlob LOOP
    DBMS_LOB.READ (vBlobOrigem, vQuantidade, vPosicao, vBuffer);
    UTL_FILE.PUT_RAW(vArquivoDestino,vBuffer , TRUE);
    vPosicao := vPosicao + vQuantidade;
  END LOOP;
  -- Fecha o arquivo.
  UTL_FILE.FCLOSE(vArquivoDestino);

EXCEPTION
  WHEN others THEN
    IF UTL_FILE.is_open(vArquivoDestino) THEN
       UTL_FILE.FCLOSE(vArquivoDestino);
       RAISE_APPLICATION_ERROR(-20001,'Erro Oracle ' || SQLCODE || SQLERRM);
    END IF;
END;


-- Exemplo de Atualização de uma coluna BLOB

DECLARE
  vArquivoOrigem   BFILE;  
  vBlobDestino     BLOB;
  vNomeArquivo     VARCHAR2(100) := 'PLEspecialista.jpg';
  vDiretorio       VARCHAR2(100) := 'IMAGENS';
BEGIN
  vArquivoOrigem := BFILENAME(vDiretorio,vNomeArquivo);
  
  IF DBMS_LOB.FILEEXISTS(vArquivoOrigem) = 1 THEN
     SELECT profile_picture
     INTO vBlobDestino
     FROM job_profiles
     WHERE resume_id = 1
     FOR UPDATE;
    
    DBMS_LOB.OPEN(vArquivoOrigem, DBMS_LOB.LOB_READONLY);
    DBMS_LOB.TRIM(vBlobDestino, 0);
    DBMS_LOB.LOADFROMFILE(vBlobDestino, vArquivoOrigem, DBMS_LOB.GETLENGTH(vArquivoOrigem));
    DBMS_LOB.CLOSE(vArquivoOrigem);
  
    COMMIT;
  ELSE 
    DBMS_OUTPUT.PUT_LINE('Arquivo: ' || vNomeArquivo || ' não existe!');
  END IF;
EXCEPTION
  WHEN others THEN
    DBMS_LOB.CLOSE(vArquivoOrigem);
    RAISE_APPLICATION_ERROR(-20001,'Erro Oracle ' || SQLCODE || SQLERRM);
END;