-- Seção 9 - Estruturas de Controle 
--
-- Aula 6 - WHILE LOOP
--

-- WHILE LOOP

SET SERVEROUTPUT ON
ACCEPT pLimite PROMPT 'Digite o valor do limite: '
DECLARE
  vNumero  NUMBER(38) :=  1;
  vLimite  NUMBER(38) := &pLimite;
BEGIN

-- Variaveis inicializadas na seção Declare

WHILE  vNumero <= vLimite LOOP
    DBMS_OUTPUT.PUT_LINE('Número =  ' || to_char(vNumero));
    vNumero := vNUmero + 1;
END LOOP;
END;