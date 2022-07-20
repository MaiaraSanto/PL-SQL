--
-- Oracle PL/SQL Avançado 
--
-- Seção 29 - Package DBMS_SCHEDULLER
--
-- Aula 2 - Criando um Programa

-- Criando e Habilitando um Programa

-- Conectar como SYS

grant CREATE JOB to hr;

-- Conectar como sales

DROP TABLE AGENDA;

CREATE TABLE AGENDA
(agenda_id    NUMBER,
 agenda_data  DATE);
 
DROP SEQUENCE AGENDA_SEQ;
 
CREATE SEQUENCE AGENDA_SEQ
START WITH 1
INCREMENT BY 1
NOCACHE
NOMAXVALUE
NOCYCLE;

CREATE OR REPLACE PROCEDURE PRC_INSERE_DATA_AGENDA
IS
BEGIN
  INSERT INTO hr.agenda
  VALUES (agenda_seq.NEXTVAL, sysdate);
  COMMIT;
END;

-- Criando e Habilitado um Programa

BEGIN
    DBMS_SCHEDULER.create_program(
        program_name => 'HR.PRC_INSERE_AGENDA',
        program_action => 'HR.PRC_INSERE_DATA_AGENDA',
        program_type => 'STORED_PROCEDURE',
        number_of_arguments => 0,
        comments => 'Insere dados na agenda',
        enabled => TRUE);
/*
    DBMS_SCHEDULER.ENABLE(name=>'HR.PRC_INSERE_AGENDA');    
*/
END;

-- Removendo um Programa

BEGIN
    DBMS_SCHEDULER.drop_program(
        program_name => 'HR.PRC_INSERE_AGENDA',
        force => TRUE);
END;

-- Criando e Habilitado um Programa

BEGIN
    DBMS_SCHEDULER.create_program(
        program_name => 'HR.PRC_INSERE_AGENDA',
        program_action => 'HR.PRC_INSERE_DATA_AGENDA',
        program_type => 'STORED_PROCEDURE',
        number_of_arguments => 0,
        comments => 'Insere dados na agenda',
        enabled => TRUE);

    -- DBMS_SCHEDULER.ENABLE(name=>'HR.PRC_INSERE_AGENDA');    

END;
 
