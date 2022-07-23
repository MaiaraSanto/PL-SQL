--
-- Seção 20 - Database DML Triggers
--
-- Aula 2 - Database DML Triggers a Nível de Comando
--

-- Database DML Triggers a Nível de Comando

CREATE OR REPLACE TRIGGER B_I_EMPLOYEES_S_TRG
BEFORE INSERT
ON employees
BEGIN
  IF  (TO_CHAR(SYSDATE, 'DAY') IN ('SABADO', 'DOMINGO') OR
       TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) NOT BETWEEN 8 AND 18) 
  THEN
       RAISE_APPLICATION_ERROR( -20001,'O cadastramento de Empregados só é permitido em dias de semana dentro do horário comercial');
  END IF;
END;

-- Testando a validação da Trigger

BEGIN
  PCK_EMPREGADOS.PRC_INSERE_EMPREGADO('George', 'Harrison','GHARRISON','515.258.5690',SYSDATE,'IT_PROG',25000,NULL,103,60);
  COMMIT;
END;

-- Criando uma Trigger Combinando Vários Eventos

CREATE OR REPLACE TRIGGER B_IUD_VALIDA_HORARIO_EMPLOYEES_S_TRG
BEFORE INSERT OR UPDATE OR DELETE
ON employees
BEGIN
  IF  (TO_CHAR(SYSDATE, 'DAY') IN ('SABADO', 'DOMINGO') OR
       TO_NUMBER(TO_CHAR(SYSDATE,'HH24')) NOT BETWEEN 8 AND 18) 
  THEN
      CASE
        WHEN INSERTING 
        THEN 
             RAISE_APPLICATION_ERROR( -20001,'O cadastramento de Empregados só é permitido em dias de semana, dentro do horário comercial');
        WHEN DELETING
        THEN 
             RAISE_APPLICATION_ERROR( -20002,'A deleção de Empregados só é permitido em dias de semana, dentro do horário comercial');
        ELSE
             RAISE_APPLICATION_ERROR( -20003,'A atualização de Empregados só é permitido em dias de semana, dentro do horário comercial');
        END CASE;
  END IF;
END;

-- Testando a validação da Trigger

BEGIN
  PCK_EMPREGADOS.PRC_INSERE_EMPREGADO('George', 'Harrison','GHARRISON','515.258.5690',SYSDATE,'IT_PROG',25000,NULL,103,60);
  COMMIT;
END;