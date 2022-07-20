--
-- Oracle PL/SQL Avançado 
--
-- Seção 31 - FLASHBACK
--
-- Aula 1 - Package DBMS_FLASHBACK

-- Package DBMS_FLASHBACK

-- Conectar como SYS

grant execute on DBMS_FLASHBACK to hr;

-- Conectar como hr

-- Causando um problema 

SELECT employee_id, first_name, last_name, job_id, salary
FROM   employees
WHERE  job_id = 'IT_PROG';

UPDATE employees
SET    salary = salary * 2
WHERE  job_id = 'IT_PROG';

SELECT employee_id, first_name, last_name, job_id, salary
FROM   employees
WHERE  job_id = 'IT_PROG';

COMMIT;

-- Utilizando a Package DBMS_FLASHBACK

DECLARE
  CURSOR c_employees IS
    SELECT *
    FROM   employees
    WHERE  job_id = 'IT_PROG';
    
   r_employees  c_employees%ROWTYPE;
BEGIN
  DBMS_FLASHBACK.enable_at_time(sysdate - 30 / 1440);  -- Posicionando 10 minutos no passado
  
  OPEN c_employees;
  
  DBMS_FLASHBACK.disable;  -- Posicionando de volta ao presente

  LOOP 
    FETCH c_employees INTO r_employees; 
    
    EXIT WHEN c_employees%NOTFOUND; 
    
    UPDATE employees 
    SET    salary = r_employees.salary
    WHERE  employee_id = r_employees.employee_id;
    
  END LOOP; 
  
  CLOSE c_employees;
  COMMIT;
END;

-- Consultando após a correção do problema

SELECT employee_id, first_name, last_name, job_id, salary
FROM   employees
WHERE  job_id = 'IT_PROG';