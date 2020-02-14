/* 
  6. Criar uma procedure que deverá receber o código de um cliente e a partir deste dado imprimir o seu
nome, e seu e‐mail. Os dados deverão ser obtidos a partir de uma tabela chamada CLIENTE com as
seguintes colunas (COD_CLI,NOME_CLI,EMAIL_CLI)
*/

/* Criar a tabela cliente */
CREATE TABLE CLIENTE (
COD_CLI NUMBER(4) PRIMARY KEY,
NOME_CLI VARCHAR2(30),
EMAIL_CLI VARCHAR2(30)); 

/* inserir o dado*/
INSERT INTO CLIENTE VALUES (10,'BEATRIZ BERNARDES','bb@dominio.com.br'); 

/*solução*/
CREATE OR REPLACE PROCEDURE BUSCACLIENTE(CODCLIENTE NUMBER) IS
    VCLIENTE CLIENTE%ROWTYPE;
  BEGIN
    
    SELECT *
     INTO VCLIENTE
    FROM CLIENTE
     WHERE COD_CLI = CODCLIENTE;
    DBMS_OUTPUT.put_line('NOME: '||VCLIENTE.NOME_CLI || 'EMAIL: '||VCLIENTE.EMAIL_CLI); 
    
  END;