--
-- Curso - Oracle PL/SQL Especialista: do Básico ao Avançado
--
-- Autor - Emílio Scudero
--
-- Seção 03 - PL/SQL Fundamentos - Instalação e Configuração das conexões no Oracle SQL Developer
--
-- Aula 2 - Criando uma conexão para o usuário SYS (dba) no Oracle SQL Developer

-- Criando uma conexão para o usuário SYS (dba) no Oracle SQL Developer

1. Criando uma conexão para o usuário SYS (dba) no Oracle SQL Developer

   1.1 No SQL Developer
       Com o botão direito, selecione Oracle Conexões => Selecione Nova Conexão

       Name: sys_XEPDB1
	   Nome do usuário: sys 
	   Senha: oracle (senha que você definiu para os usuário sys e system na instalação)
	   Atribuição: SYSDBA

       Tipo de conexão: Básico
       Nome do host: localhost
       Porta: 1521
       Nome do Serviço: XEPDB1
	   
	   Clique em Testar
	   Clique em Salvar
	   Clique em Conectar, informe a senha do SYS 
	   Clique OK	   
	   
2. Executando um comando na área deTrabalho
   
   2.1 Execute o comando:
   
       SELECT SYSDATE
	   FROM dual;
    
   2.2 Desconecte
   
