/*1. Criar um bloco PL/SQL anônimo para imprimir a tabuada abaixo:*/

DECLARE
  VN CONSTANT NUMBER(2):=5;
BEGIN
    FOR i IN 1..10 LOOP
       SYS.DBMS_OUTPUT.PUT_LINE(VN || ' X ' || i ||'='|| VN*i);
    END LOOP;
END;