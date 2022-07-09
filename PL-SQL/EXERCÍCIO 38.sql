--
--
-- Seção 12 - Cursor Explícito
--
-- Aula 1 - Controlando um Cursor Explícito
--

-- Controlando um Cursor Explícito com LOOP Básico

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  CURSOR  employees_cursor  IS
  SELECT  *
  FROM    employees;  -- Declaração do Cursor
  
  employees_record  employees_cursor%rowtype; 
BEGIN
  /* Inicializa */
  
  OPEN  employees_cursor;  -- Abrindo o Cursor
  
  /* Loop */
  
  LOOP  -- Loop Básico
    FETCH  employees_cursor  
    INTO  employees_record; -- Fetch do Cursor
    
    EXIT WHEN employees_cursor%notfound;
    
    DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                         employees_record.first_name || ' ' || 
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
    
  END LOOP;
  
  CLOSE employees_cursor; -- Close do Cursor
END;


-- Controlando um Cursor Explícito com WHILE LOOP

SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  CURSOR  employees_cursor  IS
  SELECT  *
  FROM    employees; -- Declaração do Cursor
  employees_record  employees_cursor%rowtype; 
BEGIN
  /* Inicializa */
  
  OPEN  employees_cursor; -- Abrindo o Cursor
  
  FETCH  employees_cursor  
    INTO  employees_record; -- Fetch do Cursor
	
  /* Loop */
  
  WHILE  employees_cursor%found  LOOP
     DBMS_OUTPUT.PUT_LINE(employees_record.employee_id || ' - ' ||
                         employees_record.first_name || ' ' || 
                         employees_record.last_name || ' - ' ||
                         employees_record.department_id || ' - ' ||
                         employees_record.job_id || ' - ' ||
                         employees_record.phone_number || ' - ' ||
                         LTRIM(TO_CHAR(employees_record.salary, 'L99G999G999D99')));
    FETCH  employees_cursor  
      INTO  employees_record;
  END LOOP;
  
  CLOSE employees_cursor; -- Close do Cursor
END;
