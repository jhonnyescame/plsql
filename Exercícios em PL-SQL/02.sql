/*2. Criar um bloco PL/SQL anônimo para imprimir a tabuada abaixo:*/

DECLARE
  
BEGIN
    FOR i IN 1..10 LOOP
      FOR j IN 1..10 LOOP
          DBMS_OUTPUT.PUT_LINE(i || ' X ' || j ||'='|| i*j);
      END LOOP;
      DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
END;