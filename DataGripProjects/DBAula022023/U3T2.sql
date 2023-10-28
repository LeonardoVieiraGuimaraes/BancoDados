
-- Criação da tabela esporte
CREATE TABLE esporte (
    codigoesp NUMBER PRIMARY KEY,
    nome VARCHAR2(100)
);

-- Criação do Package manipula_esporte
CREATE OR REPLACE PACKAGE manipula_esporte IS
    -- Procedure para inserir um novo esporte e exibir a lista atualizada
    PROCEDURE inserir_esporte (novo_nome IN esporte.nome%TYPE, novo_codigo IN esporte.codigoesp%TYPE);
    -- Procedure para listar todos os esportes
    PROCEDURE listar_esporte;
END manipula_esporte;
/

-- Criação do corpo do Package manipula_esporte
CREATE OR REPLACE PACKAGE BODY manipula_esporte AS
    -- Procedure para inserir um novo esporte e exibir a lista atualizada
    PROCEDURE inserir_esporte (novo_nome IN esporte.nome%TYPE, novo_codigo IN esporte.codigoesp%TYPE) IS
    BEGIN
        -- Inserção do novo esporte na tabela esporte
        INSERT INTO esporte (nome, codigoesp) VALUES (novo_nome, novo_codigo);
        COMMIT; -- Confirmar a transação
        listar_esporte; -- Chamar a procedure para listar esportes
    EXCEPTION
        WHEN DUP_VAL_ON_INDEX THEN
            RAISE_APPLICATION_ERROR(-20011, 'Esporte já cadastrado');
    END inserir_esporte;

    -- Procedure para listar todos os esportes
    PROCEDURE listar_esporte IS
        quantidade NUMBER(3);
        CURSOR selecao_esportes IS SELECT * FROM esporte;
        registro selecao_esportes%ROWTYPE;
    BEGIN
        OPEN selecao_esportes; -- Abrir o cursor
        SELECT COUNT(*) INTO quantidade FROM esporte;
        WHILE quantidade > 0 LOOP
            FETCH selecao_esportes INTO registro;
            dbms_output.put_line(registro.nome || ' ' || TO_CHAR(registro.codigoesp));
            quantidade := quantidade - 1;
        END LOOP;
        CLOSE selecao_esportes; -- Fechar o cursor
    END listar_esporte;
END manipula_esporte;

-- Esse código define um Package chamado manipula_esporte que contém duas procedures: inserir_esporte para inserir
-- um novo esporte na tabela e listar_esporte para listar todos os esportes na tabela.
-- Dentro do corpo da procedure listar_esporte, um cursor é aberto para selecionar todos os
-- registros da tabela esporte, e um loop é usado para exibir os esportes na saída padrão.
-- O cursor é fechado no final da procedure para liberar recursos.


BEGIN
    manipula_esporte.inserir_esporte('FOTEBOL', 4);
END;

BEGIN
    manipula_esporte.listar_esporte;
END;
