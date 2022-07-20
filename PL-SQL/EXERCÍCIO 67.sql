--
-- Oracle PL/SQL Avançado 
--
-- Seção 29 - Package DBMS_SCHEDULLER
--
-- Aula 4 - Criando um Job

-- Criando um Job

-- Conectar como SYS

grant CREATE JOB to hr;

BEGIN
    DBMS_SCHEDULER.CREATE_JOB (
            job_name => '"HR"."JOB_INSERE_DATA_AGENDA"',
            program_name => '"HR"."PRC_INSERE_AGENDA"',
            schedule_name => '"HR"."SCH_A_CADA_10_SEGUNDOS"',
            enabled => TRUE,
            auto_drop => FALSE,
            comments => 'Job Insere Data na Agenda',             
            job_style => 'REGULAR');
/*
    DBMS_SCHEDULER.enable(
             name => '"HR"."JOB_INSERE_DATA_AGENDA"');
*/
END;

-- Consultando a tabela AGENDA

SELECT agenda_id, TO_CHAR(agenda_data,'dd/mm/yyyy hh24:mi:ss') AGENDA_DATA
FROM   agenda
ORDER BY agenda_id;

-- Conectar como SYS

-- Remover o job

BEGIN
	DBMS_SCHEDULER.DROP_JOB (
	     job_name => '"HR"."JOB_INSERE_DATA_AGENDA"',
	     force => TRUE);
END;

