```bash
--
-- Seção 7 - Sintaxe e Diretrizes de um Bloco PL/SQL
--
-- Aula 1 - Sintaxe e Diretrizes de um Bloco PL/SQL
--

-- Comentando o Código

SET SERVEROUTPUT ON
DECLARE
  vNumero1  NUMBER(13,2);  -- Declaração de variável para o Primeiro número
  vNumero2  NUMBER(13,2);  -- Declaração de variável para o Segundo número
  vMedia    NUMBER(13,2);  -- Declaração de variável para receber a Media calculada
BEGIN
  /* Cálculo do valor da média entre dois números
     Autor: Emílio Scudero
     Data: 05/05/2020 */
	 
  vNumero1  :=  8000;
  vNumero2  :=  4000;
  vmedia    := (vNumero1 + vNumero2) / 2;           -- Cálculo da Media entre os dois números  
  DBMS_OUTPUT.PUT_LINE('vnumero1 = ' || vNumero1);  -- Impressão do Primeiro Número
  DBMS_OUTPUT.PUT_LINE('vnumero2 = ' || vNumero2);  -- Impressão do Segundo Número
  DBMS_OUTPUT.PUT_LINE('Media = ' || vMedia);     -- Impressão da Média calculada 
END;
```
***

Exercícios feitos em PL/SQL da Oracle com atividades como:  Configurando o LISTENER e o TNSNAMES - 

- Criando e testando um;  

- Bloco Anônimo; 

- Definindo Identificadores – Variáveis ;

- Definindo Identificadores ; Tipos de Dados no PL/SQL - Datatypes ;

- Variável Bind; 

- intaxe e Diretrizes de um Bloco PL/SQL 9m Reproduzir 18; 

- Utilizando Funções no bloco PL/SQL 6m Reproduzir ;

- Blocos Aninhados e Escopo de Identificadores (variáveis e constantes) ; 

- Padrões de codificação sugeridos ; intaxe e Diretrizes de um Bloco PL/SQL;

- Utilizando Funções no bloco PL/SQL;

- Blocos Aninhados e Escopo de Identificadores (variáveis e constantes);

- Padrões de codificação sugeridos 9m Reproduzir;

- Utilizando comandos SQL no PL/SQL 4m Reproduzir;

- Utilizando o comando SELECT no PL/SQL;

- Utilizando o comando INSERT no PL/SQL;

- Utilizando o comando UPDATE no PL/SQL ;

- Utilizando o comando DELETE no PL/SQL ; 

- Controlando Transações de banco de dados no PL/SQL ;

- Cursor Implícito ; 

- Operadores PL/SQL e Regra de precedência;  

- Utilizando o comando IF;  

- Utilizando o comando CASE;  

- LOOP básico ;

- FOR LOOP ;

- WHILE LOOP ;

- Controlando LOOPs aninhados;
