--
-- Curso - Oracle PL/SQL Especialista: do Básico ao Avançado
--
-- Autor - Emílio Scudero
--
-- Seção 21 - PL/SQL Avançado - Instalação do Oracle Database 21c XE
--
-- Aula 2 - Configurando o LISTENER e o TNSNAMES - Criando e Testando uma Conexão Local
--

-- Configurando o LISTENER e o TNSNAMES - Criando e Testando uma Conexão Local

1. Configurando o Listener

   1.1 No windows vá para a pasta network\admin na pasta da home de sua instalação do Oracle Database 21c
   
       Exemplo: C:\OracleDatabase21cXE\homes\OraDB21Home1\network\admin

   1.2 Faça uma cópia de backup do arquivo listener.ora
   
   1.3 Edite o arquivo listener.ora
   
       Revise e se necessário altere a configuração do listener para (host = localhost):
	   
	   LISTENER =
				  (DESCRIPTION_LIST =
					(DESCRIPTION =
					  (ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521))
					  (ADDRESS = (PROTOCOL = IPC)(KEY = EXTPROC1521))
					)
				  )
				  
	1.4 Salve a alteração no arquivo listener.ora
	
2. Configurando o arquivo tnsnames.ora 

   2.1 No windows vá para a pasta network\admin na pasta da home de sua instalação do Oracle Database 21c
   
       Exemplo: C:\OracleDatabase21cXE\homes\OraDB21Home1\network\admin

   2.2 Faça uma cópia de backup do arquivo tnsnames.ora
   
   2.3 Edite o arquivo tnsnames.ora
   
       Revise e se necessário altere todas as configurações do tnsnames.ora para (host = localhost):
	   
	   XE =
			  (DESCRIPTION =
				(ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521))
				(CONNECT_DATA =
				  (SERVER = DEDICATED)
				  (SERVICE_NAME = XE)
				)
			  )

	   LISTENER_XE =
		     (ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521))
						  
	1.4 Salve a alteração no arquivo tnsnames.ora

3. Reiniciando os serviços Oracle e Listener do Windows

   3.1 Pare o serviço: OracleServiceXE
   
      Obs.: Deixe este serviço configurado como Automático
   
   3.2 Pare o serviço: OracleOraDB21Home1TNSListener
   
       Obs.: Deixe este serviço configurado como Automático
   
   3.3 Inicie novamente o serviço: OracleOraDB21Home1TNSListener
   
   3.4 Inicie novamente o serviço: OracleServiceXE
   
4. Criando e Testando uma Conexão Local

   4.1 No menu Iniciar do Windows 
       Acesse: Oracle - Ora DB21Home1 => Assistente de Configuração de Rede
  
       . Selecione Configuração do Nome do Serviço de Rede Local
	     clique Próximo
		 
	   . Selecione Adicionar
	     clique Próximo
		 
	   . Nome do Serviço: XEPDB1
	     clique Próximo
		 
	   . Selecione o protocolo usado: TCP
	     clique Próximo
		 
	   . Nome do host: localhost
         Selecione Utilize a porta padrão 1521
	   	 clique Próximo
		 
	   . Sim, realize um teste
	   	 clique Próximo
		 
	   . Clique no botão Alterar Log-in 
	     Nome do usuario: system
		 Senha: oracle (informe a senha que você definiu para os usuários sys e system na instalação)
		 clique Ok
		 clique Próximo
	
       . Nome do Serviço de Rede: XEPDB1
	     clique Próximo	
		 
	   . Deseja configurar outro nome de serviço de rede? Não
	   	 clique Próximo	
		 
		 Configuração de nome de serviço de rede concluida!
		 clique proximo
		 
		 clique Finalizar

5. Conectando ao Oracle utilizando a Conexão Local via Oracle SQL*PLUS

   5.1 Acesse a linha de comando do Windows 
  
   5.2 Execute o comando:
   
       sqlplus system/oracle@xepdb1   
   
   5.3 No SQLPLus execute o seguinte comando:
   
       SQL> select sysdate from dual;
	   
	   SQL> exit
   


  