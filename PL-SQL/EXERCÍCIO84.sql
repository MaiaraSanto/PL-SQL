--
-- Curso - Oracle PL/SQL Especialista: do Básico ao Avançado
--
-- Autor - Emílio Scudero
--
-- Seção 22 - PL/SQL Avançado - Instalação e Configuração das conexões no Oracle SQL Developer
--
-- Aula 4 - Criando uma conexão para o usuário HR no SQL Developer

-- Criando uma conexão para o usuário HR no SQL Developer

1. Criando uma conexão para o usuário HR no SQL Developer

   1.1 No SQL Developer
       Com o botão direito, selecione Oracle Conexões => Selecione Nova Conexão

       Name: hr_XEPDB1
	   Nome do usuário: hr 
	   Senha: hr
	   Atribuição: padrão

       Tipo de conexão: Básico
       Nome do host: localhost
       Porta: 1521
       Nome do Serviço: XEPDB1
	   
	   Clique em Testar
	   Clique em Salvar
	   Clique em Conectar, informe a senha do hr (hr)
	   Clique OK	   
	   
2. Executando um comando na área de Trabalho
   
   2.1 Execute o comando:
   
       SELECT SYSDATE
	   FROM dual;
    
   2.2 Desconecte
   
