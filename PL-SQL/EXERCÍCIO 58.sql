--
-- Oracle PL/SQL Avançado 
--
-- Seção 33 - Table Functions
--
-- Aula 1 - Criação de Objetos

-- Criação de Objetos no Banco de Dados

DROP TYPE employees_row;
CREATE TYPE employees_row AS OBJECT
( e_employee_id   NUMBER(6),
  e_first_name    VARCHAR2(20),
  e_last_name     VARCHAR2(25),
  e_email         VARCHAR2(25),
  e_phone_number  VARCHAR2(20),
  e_hire_date     DATE,
  e_job_id        VARCHAR2(10),
  e_salary        NUMBER(8,2),
  e_commission_pct NUMBER(2,2),
  e_manager_id     NUMBER(6,0),
  e_department_id  NUMBER(4,0));
  
-- Criação de Table utilizando Tipos no Banco de Dados
DROP TYPE employees_table;
CREATE TYPE employees_table IS TABLE OF employees_row;