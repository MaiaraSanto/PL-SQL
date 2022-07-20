--
-- Oracle PL/SQL Avançado 
--
-- Seção 33 - Table Functions
--
-- Aula 2 - Table Functions

-- Table Functions

CREATE OR REPLACE FUNCTION FNC_FETCH_EMPLOYEES_TABLE
  (pdepartment_id IN NUMBER)
   RETURN employees_table
IS 
  v_employees_table  employees_table := employees_table();
BEGIN
  FOR e IN 
    (SELECT employee_id, first_name, last_name, email, phone_number, hire_date, job_id, 
            salary, commission_pct, manager_id, department_id
     FROM   employees
     WHERE  department_id = pdepartment_id)
  LOOP
    v_employees_table.EXTEND;
    v_employees_table(v_employees_table.LAST) := employees_row(e.employee_id, e.first_name, e.last_name, e.email, e.phone_number,
                                                                e.hire_date, e.job_id, e.salary, e.commission_pct, e.manager_id, 
                                                                e.department_id);
  END LOOP;
  RETURN v_employees_table;
END;

-- Utilizando a Table Function

SELECT *
FROM   TABLE(FNC_FETCH_EMPLOYEES_TABLE(60));