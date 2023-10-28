-- -- Considere a tabela de empregado (EMP) criada no tópico 1 para a solução
-- -- do exercício abaixo:
-- -- Crie uma procedure e uma função para calcular o reajuste de salário de
-- -- um funcionário passado como parâmetro, de acordo com um percentual de
-- -- reajuste também passado como parâmetro.
--
-- -- Crie uma função para calcular o reajuste de salário de um funcionário passado como parâmetro,
-- -- de acordo com um percentual de reajuste também passado como parâmetro.
-- CREATE OR REPLACE FUNCTION F_CALCULA_REAJ_SAL(
--     PRM_COD_FUNC IN NUMBER,
--     prm_perc_desc IN NUMBER,
--     PRM_SAL_REAJ OUT NUMBER
-- ) RETURN NUMBER IS
--     aux_val_sal      bd_emp.emp_val_sal%type; -- Variável para armazenar o valor atual do salário
--     aux_perc_desc    NUMBER(5, 2); -- Variável para armazenar o percentual de reajuste
--     aux_reajusta_sal bd_emp.emp_val_sal%type; -- Variável para armazenar o salário após o reajuste
-- BEGIN
--     BEGIN
--         -- Busca o valor atual do salário do funcionário com o código fornecido
--         SELECT e.emp_val_sal
--         INTO aux_val_sal
--         FROM bd_emp e
--         WHERE e.emp_num = PRM_COD_FUNC;
--     EXCEPTION
--         WHEN NO_DATA_FOUND THEN
--             raise_application_error(-20500, 'Funcionário inexistente');
--         WHEN OTHERS THEN
--             raise_application_error(-20500, 'Não foi possível buscar dados do funcionário!');
--     END;
--
--     aux_perc_desc := prm_perc_desc / 100; -- Calcula o percentual de reajuste
--     aux_reajusta_sal := aux_val_sal + (aux_val_sal * aux_perc_desc); -- Calcula o salário reajustado
--
--     BEGIN
--         -- Atualiza o salário do funcionário com o novo salário reajustado
--         UPDATE bd_emp e
--         SET e.emp_val_sal = aux_reajusta_sal
--         WHERE e.emp_num = PRM_COD_FUNC;
--         COMMIT;
--     END;
--
--     PRM_SAL_REAJ := aux_reajusta_sal; -- Define o salário reajustado como saída da função
--     RETURN aux_reajusta_sal; -- Retorna o novo salário reajustado
-- END F_CALCULA_REAJ_SAL;
--
-- -- Nesta função, o valor atual do salário é buscado na tabela bd_emp usando o código do funcionário passado
-- -- como parâmetro. Se o funcionário não for encontrado, uma exceção é lançada. O percentual de reajuste é
-- -- calculado com base no valor do parâmetro prm_perc_desc. O salário reajustado é calculado adicionando
-- -- o valor do reajuste ao valor original do salário. Em seguida, o salário é atualizado na tabela bd_emp e
-- -- o novo valor é retornado.
--
--
-- CREATE OR REPLACE FUNCTION F_CALC_REAJ(
--     P_COD_FUNC IN NUMBER,
--     P_PRC_REAJ IN NUMBER,
--     P_VAL_SAL_REAJ OUT NUMBER
-- ) RETURN NUMBER IS
--     AUX_VAL_SAL bd_emp.emp_val_sal%type; -- Variável para armazenar o valor atual do salário
-- BEGIN
--     -- Buscar o valor do salário atual do funcionário
--     SELECT E.EMP_VAL_SAL
--     INTO AUX_VAL_SAL
--     FROM BD_EMP E
--     WHERE E.EMP_NUM = P_COD_FUNC;
--
--     -- Tratar a exceção quando o funcionário não é encontrado
-- EXCEPTION
--     WHEN NO_DATA_FOUND THEN
--         raise_application_error(-20500, 'Funcionário ' || P_COD_FUNC || ' não existe no BD!');
--
--         -- Calcular o novo valor de salário reajustado
--         P_VAL_SAL_REAJ := ROUND(AUX_VAL_SAL + (AUX_VAL_SAL * (P_PRC_REAJ / 100)), 2);
--
--         -- Atualizar o salário na tabela BD_EMP
--         UPDATE BD_EMP
--         SET EMP_VAL_SAL = P_VAL_SAL_REAJ
--         WHERE EMP_NUM = P_COD_FUNC;
--
--         -- Confirmar a transação
--         COMMIT;
--
--         -- Retornar o valor reajustado
--         RETURN P_VAL_SAL_REAJ;
-- END F_CALC_REAJ;
--
-- -- Nesta função, o valor atual do salário do funcionário é buscado na tabela BD_EMP usando o código do funcionário
-- -- passado como parâmetro. Se o funcionário não for encontrado, uma exceção é lançada com uma mensagem personalizada.
-- -- O novo valor de salário reajustado é calculado adicionando o valor do reajuste ao valor original do salário e
-- -- arredondado para 2 casas decimais. O salário é então atualizado na tabela BD_EMP com o novo valor.
-- -- A transação é confirmada com COMMIT, e o novo valor de salário reajustado é retornado como saída da função.
--
-- select *
-- from BD_EMP;
--
-- SET SERVEROUTPUT ON
--
-- DECLARE
--     p_val_sal_reaj NUMBER;
-- BEGIN
--     -- Chama a função e passa os parâmetros necessários
--     p_val_sal_reaj := F_CALC_REAJ(1, 10, :p_val_sal_reaj);
--
--     -- Exibe o resultado
--     DBMS_OUTPUT.PUT_LINE('Novo salário reajustado: ' || p_val_sal_reaj);
-- END;


CREATE TABLE EMP
(
    EMP_NUM     NUMBER,
    EMP_NOME    VARCHAR2(100),
    EMP_VAL_SAL NUMBER
);

-- Inserindo dados na tabela EMP
INSERT INTO EMP (EMP_NUM, EMP_NOME, EMP_VAL_SAL)
VALUES (1, 'Funcionário 1', 1000);

INSERT INTO EMP (EMP_NUM, EMP_NOME, EMP_VAL_SAL)
VALUES (2, 'Funcionário 2', 1500);

INSERT INTO EMP (EMP_NUM, EMP_NOME, EMP_VAL_SAL)
VALUES (3, 'Funcionário 3', 2000);


CREATE OR REPLACE PROCEDURE REAJUSTAR_SALARIO_PROC(
    PRM_COD_FUNC IN NUMBER,
    PRM_PERC_REAJ IN NUMBER
) IS
    v_novo_salario NUMBER;
BEGIN
    SELECT EMP_VAL_SAL * (1 + PRM_PERC_REAJ / 100)
    INTO v_novo_salario
    FROM EMP
    WHERE EMP_NUM = PRM_COD_FUNC;

    UPDATE EMP
    SET EMP_VAL_SAL = v_novo_salario
    WHERE EMP_NUM = PRM_COD_FUNC;

    COMMIT;

    dbms_output.put_line('Salário do funcionário ' || PRM_COD_FUNC || ' reajustado para: ' || v_novo_salario);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Funcionário ' || PRM_COD_FUNC || ' não encontrado.');
END REAJUSTAR_SALARIO_PROC;

-- Executando a procedure
BEGIN
    REAJUSTAR_SALARIO_PROC(PRM_COD_FUNC => 1, PRM_PERC_REAJ => 10);
END;

CREATE OR REPLACE FUNCTION REAJUSTAR_SALARIO_FUNC(
    PRM_COD_FUNC IN NUMBER,
    PRM_PERC_REAJ IN NUMBER
) RETURN NUMBER IS
    v_novo_salario NUMBER;
BEGIN
    SELECT EMP_VAL_SAL * (1 + PRM_PERC_REAJ / 100)
    INTO v_novo_salario
    FROM EMP
    WHERE EMP_NUM = PRM_COD_FUNC;

    UPDATE EMP
    SET EMP_VAL_SAL = v_novo_salario
    WHERE EMP_NUM = PRM_COD_FUNC;

    COMMIT;

    RETURN v_novo_salario;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Funcionário ' || PRM_COD_FUNC || ' não encontrado.');
END REAJUSTAR_SALARIO_FUNC;


-- Executando a função
DECLARE
    v_novo_salario NUMBER;
BEGIN
    v_novo_salario := REAJUSTAR_SALARIO_FUNC(PRM_COD_FUNC => 2, PRM_PERC_REAJ => 5);
    dbms_output.put_line('Novo salário: ' || v_novo_salario);
END;

