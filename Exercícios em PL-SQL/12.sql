/*
  12. Criar uma function aonde valida o CPF e uma procedure para cadastrar um novo usuario validando o CPF

*/

CREATE OR REPLACE FUNCTION fct_valida_cfp (p_cpf IN varchar2) RETURN BOOLEAN
IS
    v_cpf varchar2(20);
    v_soma number := 0;
    v_soma_sd number := 0;
    v_dez number(2) := 10;
    v_onze number(2) := 11;
    
    v_digito_final number;
    v_numero number;   
    
    v_erro varchar2(50) := ('NUMERO INVALIDO');
BEGIN
    v_cpf := p_cpf;   
    --validação do primeiro digito
    for i in 1..9
    loop
        v_soma := (v_soma + to_number(SUBSTR(v_cpf,i,1))*v_dez);
        v_dez := v_dez - 1;
        v_numero := mod(v_soma*10,11);
    end loop;
    
    --validacao do segundo digito
    for s in 1..10
    loop
        v_soma_sd := (v_soma_sd + to_number(SUBSTR(v_cpf,s,1))*v_onze);
        v_onze := v_onze - 1;
        v_digito_final := mod(v_soma_sd*10,11);
    end loop; 

    --validacao simples
    case
        when v_cpf = '00000000000' then return false;
        when v_cpf = '11111111111' then return false;
        when v_cpf = '22222222222' then return false;
        when v_cpf = '33333333333' then return false;
        when v_cpf = '44444444444' then return false;
        when v_cpf = '55555555555' then return false;
        when v_cpf = '66666666666' then return false;
        when v_cpf = '77777777777' then return false;
        when v_cpf = '88888888888' then return false;
        when v_cpf = '99999999999' then return false;
        ELSE return true;
    end case;
    
    EXCEPTION
    WHEN OTHERS THEN
      raise_application_error(-20666,' CPF DEVE CONTER APENAS NUMEROS');
END;



create or replace PROCEDURE proc_add_usuario(
    p_id NUMBER, p_nome VARCHAR2, p_cpf VARCHAR2) IS
BEGIN
    if fct_valida_cfp(p_cpf)
    then
        INSERT INTO CADASTRO_USUARIO (ID,NOME, CPF)
        VALUES (p_id, p_nome, p_cpf);
        DBMS_OUTPUT.put_line('USUARIO CADASTRADO COM SUCESSO');
    else
        DBMS_OUTPUT.put_line('INVALIDO');
    end if;

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
    raise_application_error(-20669,' VALOR DUPLICADO ');
    WHEN OTHERS THEN
    raise_application_error(-20667,' FAVOR VEREFICAR OS DADOS USUARIO NAO CADASTRO');
end;


exec proc_add_usuario(3,'Alex','77777777777');



Alter table CADASTRO_USUARIO ADD CONSTRAINT uk_cpf UNIQUE (CPF);

Alter table CADASTRO_USUARIO ADD CONSTRAINT pk_id PRIMARY KEY (ID);

truncate table CADASTRO_USUARIO;
  DBMS_OUTPUT.PUT_LINE('Usuario Cadastro : '|| p_nome);
END;

select * from CADASTRO_USUARIO;


