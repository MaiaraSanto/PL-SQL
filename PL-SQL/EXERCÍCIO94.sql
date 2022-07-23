--
-- Seção 20 - Database DML Triggers
--
-- Aula 3 - Database DML Triggers a Nível de Linha
--

-- Database DML Triggers a Nível de Linha

-- Criando a Tabela de  Log de Auditoria para a Tabela EMPLOYEES para a coluna SALARY

DROP TABLE employees_log;

CREATE TABLE employees_log
(employees_log_id NUMBER (11) NOT NULL,
 dt_log    DATE DEFAULT SYSDATE NOT NULL ,
 usuario   VARCHAR2(30),
 evento    CHAR(1) NOT NULL,
 employee_id  NUMBER(6) NOT NULL,
 salary_old  NUMBER(8,2),
 salary_new  NUMBER(8,2));
 
ALTER TABLE employees_log
ADD CONSTRAINT employees_log_pk PRIMARY KEY (employees_log_id);

CREATE SEQUENCE employees_log_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE
NOMAXVALUE;

-- Criando uma Trigger que gera Log de Auditoria para a Tabela EMPLOYEES para a coluna SALARY 

CREATE OR REPLACE TRIGGER A_IUD_EMPLOYESS_R_TRG
  AFTER INSERT OR UPDATE OF SALARY OR DELETE 
  ON EMPLOYEES
  FOR EACH ROW
DECLARE
	vevento       employees_log.evento%TYPE;
	vemployee_id  employees_log.employee_id%TYPE;
BEGIN
	CASE
		WHEN INSERTING 
        THEN
			vevento      := 'I';
			vemployee_id := :new.employee_id;
		WHEN UPDATING 
        THEN
			vevento      := 'U';
			vemployee_id := :new.employee_id;
		ELSE
			vevento      := 'D';
			vemployee_id := :old.employee_id;
	END CASE;
	INSERT INTO employees_log
		(employees_log_id, 
         dt_log, 
         usuario, 
         evento, 
         employee_id, 
         salary_old, 
         salary_new)
	VALUES
		(employees_log_seq.nextval,
		 SYSDATE,
		 USER,
		 vevento,
		 vemployee_id,
		 :old.salary,
		 :new.salary);
END A_IUD_EMPLOYESS_R_TRG;

-- Testando o disparo da Trigger

UPDATE employees 
SET    salary = salary * 1.5;

-- Desabilitando a Trigger B_IUD_VALIDA_HORARIO_EMPLOYEES_S_TRG para poder testar a Trigger fora do horário comercial

alter trigger B_IUD_VALIDA_HORARIO_EMPLOYEES_S_TRG disable;

-- Testando a TRIGGER

UPDATE employees 
SET    salary = salary * 1.5;

-- Consultando a Tabela employees_log

SELECT *
FROM   employees_log;

COMMIT;
 
-- Limpando a tabela de Log

DELETE FROM employees_log;

COMMIT;

SELECT *
FROM   employees_log;

-- Cláusula WHEN

CREATE OR REPLACE TRIGGER A_IUD_EMPLOYESS_R_TRG
  AFTER INSERT OR UPDATE OF SALARY OR DELETE 
  ON EMPLOYEES
  FOR EACH ROW
  WHEN (new.job_id <> 'AD_PRES')
DECLARE
	vevento       employees_log.evento%TYPE;
	vemployee_id  employees_log.employee_id%TYPE;
BEGIN
	CASE
		WHEN INSERTING THEN
			vevento      := 'I';
			vemployee_id := :new.employee_id;
		WHEN UPDATING THEN
			vevento      := 'U';
			vemployee_id := :new.employee_id;
		ELSE
			vevento      := 'D';
			vemployee_id := :old.employee_id;
	END CASE;
	INSERT INTO employees_log
		(employees_log_id, dt_log, usuario, evento, employee_id, salary_old, salary_new)
	VALUES
		(employees_log_seq.nextval,
		 SYSDATE,
		 USER,
		 vevento,
		 vemployee_id,
		 :old.salary,
		 :new.salary);
END A_IUD_EMPLOYESS_R_TRG;

-- Testando a TRIGGER

UPDATE employees 
SET    salary = salary * 1.5;

SELECT *
FROM   employees_log;

COMMIT;