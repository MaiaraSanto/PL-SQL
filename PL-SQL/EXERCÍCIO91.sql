--
-- Seção 20 - Database DML Triggers
--
-- Aula 6 - Consultando Database DML Triggers pelo Dicionário de Dados
--

-- Consultando Database DML Triggers pelo Dicionário de Dados

SELECT *
FROM   user_triggers
WHERE  table_name = 'EMPLOYEES'  AND
       table_owner = 'HR';