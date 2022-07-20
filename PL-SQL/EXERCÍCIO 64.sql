--
-- Oracle PL/SQL Avançado 
--
-- Seção 31 - FLASHBACK
--
-- Aula 2 - Flashback Query

-- Utilizando Flashback Query

-- Causando um problema 

SELECT employee_id, first_name, last_name, job_id, salary
FROM   employees
WHERE  job_id = 'FI_ACCOUNT';

UPDATE employees
SET    salary = salary * 2
WHERE  job_id = 'FI_ACCOUNT';

SELECT employee_id, first_name, last_name, job_id, salary
FROM   employees
WHERE  job_id = 'FI_ACCOUNT';

COMMIT;


DECLARE
  CURSOR c_employees IS
    SELECT *
    FROM   employees as of timestamp (systimestamp - interval '15' minute);
    
  r_employees  c_employees%ROWTYPE;
  
BEGIN  
  OPEN c_employees;

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
WHERE  job_id = 'FI_ACCOUNT';