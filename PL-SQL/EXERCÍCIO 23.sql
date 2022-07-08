--
-- Seção 9 - Estruturas de Controle 
--
-- Aula 7 - Controlando LOOPs aninhados
--

-- Controlando LOOPs aninhados

SET SERVEROUTPUT ON
DECLARE
  vTotal   NUMBER(38) :=  1;
BEGIN
<<LOOP1>>
FOR i IN 1..8 LOOP
    DBMS_OUTPUT.PUT_LINE('I =  ' || to_char(i));
    <<LOOP2>>
    FOR j IN 1..8 LOOP
      DBMS_OUTPUT.PUT_LINE('J =  ' || to_char(j));
      DBMS_OUTPUT.PUT_LINE('Total =  ' || to_char(vTotal,'99G999G999G999G999G999G999G999D99'));
      vTotal := vTotal * 2;
      -- EXIT LOOP1 WHEN vtotal > 1000000000000000;
    END LOOP;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Total Final =  ' || to_char(vTotal,'99G999G999G999G999G999G999G999D99'));
END;

-- Utilizando EXIT com Label

SET SERVEROUTPUT ON
DECLARE
  vTotal   NUMBER(38) :=  1;
BEGIN
<<LOOP1>>
FOR i IN 1..8 LOOP
    DBMS_OUTPUT.PUT_LINE('I =  ' || to_char(i));
    <<LOOP2>>
    FOR j IN 1..8 LOOP
      DBMS_OUTPUT.PUT_LINE('J =  ' || to_char(j));
      DBMS_OUTPUT.PUT_LINE('Total =  ' || to_char(vTotal,'99G999G999G999G999G999G999G999D99'));
      vTotal := vTotal * 2;
      EXIT LOOP1 WHEN vtotal > 1000000000000000;
    END LOOP;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Total Final =  ' || to_char(vTotal,'99G999G999G999G999G999G999G999D99'));
END;

-- Controlando LOOPs aninhados

-- Imagina um Quadrado com 10 linhas e 10 Colunas
-- Imprima todas as combinações possíveis de números de linhas e números de colunas
-- Exemplo:
--   Linha 1 - Coluna 1
--   Linha 1 - Coluna 2
--   Linha 1 - Coluna 3 
---  ...  

-- Vamos resolver em partes

-- Primeiro vamos fazer um Loop para imprimir todos os Número de Linhas

SET SERVEROUTPUT ON
DECLARE
  vContadorLinhas   NUMBER(38) :=  1;
BEGIN
<<LOOP1>>
  FOR l IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE('Linha ' || to_char(l));	
    vContadorLinhas := vContadorLinhas + 1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Total de Linhas = ' || vContadorLinhas);
END;

-- Segundo vamos fazer um Loop para imprimir todos os Número de Colunas

SET SERVEROUTPUT ON
DECLARE
  vContadorColunas   NUMBER(38) :=  0;
BEGIN
<<LOOP1>>
  FOR c IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE('Coluna ' || to_char(c));
    vContadorColunas := vContadorColunas + 1;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('Total de Colunas = ' || vContadorColunas);
END;

-- Terceiro vamos fazer um Loop para imprimir todos os Número das Linhas
--   e dentro deste Loop faremos outro Loop para imprimir os todos os Número de Colunas de cada Linha

SET SERVEROUTPUT ON
BEGIN
<<LOOP1>>
  FOR l IN 1..10 LOOP
    <<LOOP2>>
    FOR c IN 1..10 LOOP
       DBMS_OUTPUT.PUT_LINE('Linha ' || to_char(l) || ' - Coluna ' || to_char(c));    
    END LOOP;
  END LOOP;
END;
