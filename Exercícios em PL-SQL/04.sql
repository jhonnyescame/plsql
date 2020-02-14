/* 
  4.Criar um bloco PL/SQL para atualizar a tabela abaixo, conforme segue:
  Produtos categoria A deverão ser reajustados em 5%
  Produtos categoria B deverão ser reajustados em 10%
  Produtos categoria C deverão ser reajustados em 15%
*/

/*criar Tabela*/
CREATE TABLE PRODUTO (
CODIGO NUMBER(4),
CATEGORIA CHAR(1),
VALOR NUMBER(4,2));

/*inserir dados na tabela*/
INSERT INTO PRODUTO VALUES (1001,'A',7.55);
INSERT INTO PRODUTO VALUES (1002,'B',5.95);
INSERT INTO PRODUTO VALUES (1003,'C',3.45);

/*Solução*/

DECLARE

/* CURSOR */
CURSOR PRO IS
  SELECT * FROM PRODUTO_TESTE2;

/*VARIAVEL VPROD: com o mesmo valor da tabela*/
VPROD PRODUTO_TESTE2%ROWTYPE;

BEGIN
    FOR VPROD IN PRO LOOP 
      
      CASE VPROD.CATEGORIA
        WHEN 'A' THEN UPDATE PRODUTO_TESTE2 SET VALOR = VALOR + (VALOR*0.5) WHERE VPROD.CODIGO = CODIGO;
        WHEN 'B' THEN UPDATE PRODUTO_TESTE2 SET VALOR = VALOR + (VALOR*1.5) WHERE VPROD.CODIGO = CODIGO;
        WHEN 'C' THEN UPDATE PRODUTO_TESTE2 SET VALOR = VALOR + (VALOR*2.0) WHERE VPROD.CODIGO = CODIGO;
      END CASE;
    END LOOP;
END;