create table BD_EMP
(
    EMP_NUM       NUMBER(5),
    EMP_NOME      VARCHAR2(60),
    DEPT_NUM      NUMBER(5),
    CARGO_NUM     NUMBER(5),
    EMP_DAT_ADMIS DATE,
    EMP_VAL_SAL   NUMBER(10, 2),
    EMP_VAL_COMIS NUMBER(10, 2)
);

create table CARGO
(
    CARGO_NUM   NUMBER(5),
    CARGO_NOME  VARCHAR2(60),
    CARGO_SUPER NUMBER(5)
);

create table DEPT
(
    DEPT_NUM  NUMBER(5),
    DEPT_NOME VARCHAR2(60)
);

create table FAIXA_SAL
(
    FAIXA_DESC    VARCHAR2(60),
    FAIXA_VAL_MIN NUMBER(10, 2),
    FAIXA_VAL_MAX NUMBER(10, 2)
);

create table VENDA
(
    emp_num   NUMBER(5),
    venda_qtd NUMBER(5, 2),
    prod_num  NUMBER(5),
    venda_dat DATE
);
--
-- DROP TABLE VENDA;
-- DROP TABLE PROD;

create table PROD
(
    prod_num  NUMBER(5),
    prod_val  NUMBER(5, 2),
    prod_nome VARCHAR2(60)
);


insert into BD_EMP (EMP_NUM, EMP_NOME, DEPT_NUM, CARGO_NUM, EMP_DAT_ADMIS, EMP_VAL_SAL, EMP_VAL_COMIS)
values (1, 'SIMONE', 1, 1, to_date('01-09-2010', 'dd-mm-yyyy'), 865, null);
insert into BD_EMP (EMP_NUM, EMP_NOME, DEPT_NUM, CARGO_NUM, EMP_DAT_ADMIS, EMP_VAL_SAL, EMP_VAL_COMIS)
values (2, 'DEMIS', 2, 3, to_date('01-06-2010', 'dd-mm-yyyy'),
        136500, null);
insert into BD_EMP (EMP_NUM, EMP_NOME, DEPT_NUM, CARGO_NUM, EMP_DAT_ADMIS, EMP_VAL_SAL, EMP_VAL_COMIS)
values (4, 'WERNER', 3, 4, to_date('13-09-2010', 'dd-mm-yyyy'),
        212700, null);
insert into BD_EMP (EMP_NUM, EMP_NOME, DEPT_NUM, CARGO_NUM, EMP_DAT_ADMIS, EMP_VAL_SAL, EMP_VAL_COMIS)
values (5, 'FABIO', 4, 5, to_date('15-09-2010', 'dd-mm-yyyy'),
        365400, null);
insert into BD_EMP (EMP_NUM, EMP_NOME, DEPT_NUM, CARGO_NUM, EMP_DAT_ADMIS, EMP_VAL_SAL, EMP_VAL_COMIS)
values (6, 'ALEXANDRE', 5, 5, to_date('21-09-2010', 'dd-mm-
yyyy'), 458645, null);
insert into BD_EMP (EMP_NUM, EMP_NOME, DEPT_NUM, CARGO_NUM, EMP_DAT_ADMIS, EMP_VAL_SAL, EMP_VAL_COMIS)
values (7, 'JULIA', 4, 3, to_date('13-09-2010', 'dd-mm-yyyy'),
        369800, null);
insert into BD_EMP (EMP_NUM, EMP_NOME, DEPT_NUM, CARGO_NUM, EMP_DAT_ADMIS, EMP_VAL_SAL, EMP_VAL_COMIS)
values (8, 'ANGELA', 3, 8, to_date('22-09-2010', 'dd-mm-yyyy'),
        85600, null);
insert into BD_EMP (EMP_NUM, EMP_NOME, DEPT_NUM, CARGO_NUM, EMP_DAT_ADMIS, EMP_VAL_SAL, EMP_VAL_COMIS)
values (9, 'FERNANDA', 2, 10, to_date('01-05-2010', 'dd-mm-
yyyy'), 52735, null);
insert into BD_EMP (EMP_NUM, EMP_NOME, DEPT_NUM, CARGO_NUM, EMP_DAT_ADMIS, EMP_VAL_SAL, EMP_VAL_COMIS)
values (10, 'ODIRLEI', 6, 6, to_date('17-09-2010', 'dd-mm-
yyyy'), 362100, null);
insert into BD_EMP (EMP_NUM, EMP_NOME, DEPT_NUM, CARGO_NUM, EMP_DAT_ADMIS, EMP_VAL_SAL, EMP_VAL_COMIS)
values (11, 'RAMON', 7, 7, to_date('23-07-2010', 'dd-mm-yyyy'),
        256400, null);
insert into BD_EMP (EMP_NUM, EMP_NOME, DEPT_NUM, CARGO_NUM, EMP_DAT_ADMIS, EMP_VAL_SAL, EMP_VAL_COMIS)
values (12, 'RENATA', 8, 8, to_date('14-09-2010', 'dd-mm-yyyy'),
        110000, null);
insert into BD_EMP (EMP_NUM, EMP_NOME, DEPT_NUM, CARGO_NUM, EMP_DAT_ADMIS, EMP_VAL_SAL, EMP_VAL_COMIS)
values (13, 'FRANCIELLE', 9, 11, to_date('13-09-2010',
                                         'dd-mm-yyyy'), 163500, null);
commit;

insert into CARGO (CARGO_NUM, CARGO_NOME, CARGO_SUPER)
values (1, 'GERENTE GERAL', 2);
insert into CARGO (CARGO_NUM, CARGO_NOME, CARGO_SUPER)
values (2, 'DIRETOR', 3);
insert into CARGO (CARGO_NUM, CARGO_NOME, CARGO_SUPER)
values (3, 'PRESIDENTE', null);
insert into CARGO (CARGO_NUM, CARGO_NOME, CARGO_SUPER)
values (4, 'GERENTE FINANCEIRO', 2);
insert into CARGO (CARGO_NUM, CARGO_NOME, CARGO_SUPER)
values (5, 'GERENTE TI', 3);
insert into CARGO (CARGO_NUM, CARGO_NOME, CARGO_SUPER)
values (6, 'PROGRAMADOR', 5);
insert into CARGO (CARGO_NUM, CARGO_NOME, CARGO_SUPER)
values (7, 'ANALISTA SISTEMAS', 5);
insert into CARGO (CARGO_NUM, CARGO_NOME, CARGO_SUPER)
values (8, 'SECRETÁRIA', 7);
insert into CARGO (CARGO_NUM, CARGO_NOME, CARGO_SUPER)
values (10, 'SERVIÇOS GERAIS', 1);
insert into CARGO (CARGO_NUM, CARGO_NOME, CARGO_SUPER)
values (11, 'AUX ADMN', 1);

commit;

insert into DEPT (DEPT_NUM, DEPT_NOME)
values (1, 'RH');
insert into DEPT (DEPT_NUM, DEPT_NOME)
values (2, 'FINANCEIRO');
insert into DEPT (DEPT_NUM, DEPT_NOME)
values (3, 'TI');
insert into DEPT (DEPT_NUM, DEPT_NOME)
values (4, 'EXPORTAÇÃO');
insert into DEPT (DEPT_NUM, DEPT_NOME)
values (5, 'MARKETING');
insert into DEPT (DEPT_NUM, DEPT_NOME)
values (6, 'INFRA ESTRUT');
insert into DEPT (DEPT_NUM, DEPT_NOME)
values (7, 'NOVOS NEGÓCIOS');
insert into DEPT (DEPT_NUM, DEPT_NOME)
values (8, 'NOVOS PRODUTOS');
insert into DEPT (DEPT_NUM, DEPT_NOME)
values (9, 'QUALIDADE');
commit;

insert into FAIXA_SAL (FAIXA_DESC, FAIXA_VAL_MIN, FAIXA_VAL_MAX)
values ('2', 1000, 160100);
insert into FAIXA_SAL (FAIXA_DESC, FAIXA_VAL_MIN, FAIXA_VAL_MAX)
values ('3', 1602, 250000);
insert into FAIXA_SAL (FAIXA_DESC, FAIXA_VAL_MIN, FAIXA_VAL_MAX)
values ('4', 250100, 310000);
insert into FAIXA_SAL (FAIXA_DESC, FAIXA_VAL_MIN, FAIXA_VAL_MAX)
values ('5', 310100, 408000);
insert into FAIXA_SAL (FAIXA_DESC, FAIXA_VAL_MIN, FAIXA_VAL_MAX)
values ('6', 408100, 501000);
insert into FAIXA_SAL (FAIXA_DESC, FAIXA_VAL_MIN, FAIXA_VAL_MAX)
values ('7', 501100, 600000);
commit;

-- Inserção de 10 dados na tabela VENDA
INSERT INTO VENDA (EMP_NUM, VENDA_QTD, PROD_NUM, VENDA_DAT)
VALUES (1, 2, 101, TO_DATE('2023-08-31', 'YYYY-MM-DD'));
INSERT INTO VENDA (EMP_NUM, VENDA_QTD, PROD_NUM, VENDA_DAT)
VALUES (2, 3, 102, TO_DATE('2023-08-30', 'YYYY-MM-DD'));
INSERT INTO VENDA (EMP_NUM, VENDA_QTD, PROD_NUM, VENDA_DAT)
VALUES (3, 1.5, 103, TO_DATE('2023-08-29', 'YYYY-MM-DD'));
INSERT INTO VENDA (EMP_NUM, VENDA_QTD, PROD_NUM, VENDA_DAT)
VALUES (4, 5, 104, TO_DATE('2023-08-28', 'YYYY-MM-DD'));
INSERT INTO VENDA (EMP_NUM, VENDA_QTD, PROD_NUM, VENDA_DAT)
VALUES (5, 2, 105, TO_DATE('2023-08-27', 'YYYY-MM-DD'));
INSERT INTO VENDA (EMP_NUM, VENDA_QTD, PROD_NUM, VENDA_DAT)
VALUES (6, 4.5, 106, TO_DATE('2023-08-26', 'YYYY-MM-DD'));
INSERT INTO VENDA (EMP_NUM, VENDA_QTD, PROD_NUM, VENDA_DAT)
VALUES (7, 3, 107, TO_DATE('2023-08-25', 'YYYY-MM-DD'));
INSERT INTO VENDA (EMP_NUM, VENDA_QTD, PROD_NUM, VENDA_DAT)
VALUES (8, 2.5, 108, TO_DATE('2023-08-24', 'YYYY-MM-DD'));
INSERT INTO VENDA (EMP_NUM, VENDA_QTD, PROD_NUM, VENDA_DAT)
VALUES (9, 1, 109, TO_DATE('2023-08-23', 'YYYY-MM-DD'));
INSERT INTO VENDA (EMP_NUM, VENDA_QTD, PROD_NUM, VENDA_DAT)
VALUES (10, 3.5, 110, TO_DATE('2023-08-22', 'YYYY-MM-DD'));
commit;

-- Inserção de 10 dados na tabela PROD
INSERT INTO PROD (PROD_NUM, PROD_VAL, PROD_NOME)
VALUES (101, 50.00, 'Produto A');
INSERT INTO PROD (PROD_NUM, PROD_VAL, PROD_NOME)
VALUES (102, 75.00, 'Produto B');
INSERT INTO PROD (PROD_NUM, PROD_VAL, PROD_NOME)
VALUES (103, 30.00, 'Produto C');
INSERT INTO PROD (PROD_NUM, PROD_VAL, PROD_NOME)
VALUES (104, 20.00, 'Produto D');
INSERT INTO PROD (PROD_NUM, PROD_VAL, PROD_NOME)
VALUES (105, 45.00, 'Produto E');
INSERT INTO PROD (PROD_NUM, PROD_VAL, PROD_NOME)
VALUES (106, 65.00, 'Produto F');
INSERT INTO PROD (PROD_NUM, PROD_VAL, PROD_NOME)
VALUES (107, 15.00, 'Produto G');
INSERT INTO PROD (PROD_NUM, PROD_VAL, PROD_NOME)
VALUES (108, 25.00, 'Produto H');
INSERT INTO PROD (PROD_NUM, PROD_VAL, PROD_NOME)
VALUES (109, 40.00, 'Produto I');
INSERT INTO PROD (PROD_NUM, PROD_VAL, PROD_NOME)
VALUES (110, 55.00, 'Produto J');
commit;

-- a. Fazer um PLSQL com um cursor para listar todos os departamentos.
-- (Exibir o código e nome do departamento).

-- SET SERVEROUTPUT ON;
-- Declaração do bloco PL/SQL.
declare
    -- Declaração do cursor nomeado "c_emp" que irá selecionar os códigos e nomes dos departamentos.
    cursor c_emp is
        select d.dept_num,
               d.dept_nome
        from dept d;
begin
    -- Início do loop que percorrerá o resultado do cursor "c_emp".
    for c1 in c_emp
        loop
        -- Verifica se o número do departamento não é nulo.
        -- A impressão é realizada somente se o número do departamento for não nulo.
            if c1.dept_num is not null then
                -- Imprime o código do departamento seguido do nome do departamento.
                dbms_output.put_line(c1.dept_num || ' - ' || c1.dept_nome);
            end if;
        end loop; -- Fim do loop.
end;
-- Fim do bloco PL/SQL.

-- O código PL/SQL acima utiliza um cursor para selecionar os códigos e nomes dos departamentos da tabela dept.
-- Em seguida, ele percorre os resultados do cursor usando um loop e imprime os códigos e nomes dos departamentos usando
-- a função dbms_output.put_line. Note que ele verifica se o número do departamento não é nulo antes de imprimir,
-- para evitar possíveis erros de exibição. O bloco PL/SQL começa com declare e termina com end;, e dentro dele, você tem
-- a declaração do cursor, o loop for, e as instruções de impressão e controle do loop.


-- b. Fazer um PLSQL com um cursor para listar todos os funcionários do departamento de venda.
declare
    cursor c_emp is
        select e.emp_nome,
               e.emp_num,
               e.dept_num
        from bd_emp e;
begin
    for c1 in c_emp
        loop
            if c1.dept_num = 2 then
                dbms_output.put_line(c1.emp_num || ' - ' || c1.emp_nome);
            end if;
        end loop;
end;

-- b. Fazer um PLSQL com um cursor para listar todos os funcionários do departamento de venda.

-- Declaração do bloco PL/SQL.
declare
    -- Declaração do cursor nomeado "c_emp" que irá selecionar os nomes, números de funcionários e números de departamento.
    cursor c_emp is
        select e.emp_nome,
               e.emp_num,
               e.dept_num
        from bd_emp e;
begin
    -- Início do loop que percorrerá o resultado do cursor "c_emp".
    for c1 in c_emp
        loop
            -- Verifica se o número do departamento é igual a 2 (departamento de venda).
            if c1.dept_num = 2 then
                -- Imprime o número e nome do funcionário.
                dbms_output.put_line(c1.emp_num || ' - ' || c1.emp_nome);
            end if;
        end loop; -- Fim do loop.
end;
-- Fim do bloco PL/SQL.

-- Neste código, o cursor c_emp é declarado para selecionar os nomes, números de funcionários e números de departamento
-- da tabela bd_emp. O loop for percorre os resultados do cursor, e dentro dele, o código verifica se o número do
-- departamento é igual a 2 (departamento de venda). Se a condição for atendida, o código imprime o número e nome do
-- funcionário usando a função dbms_output.put_line. O bloco PL/SQL é delimitado por declare e end;, e contém a
-- declaração do cursor, o loop for, bem como as instruções de impressão e controle do loop.


-- d. Fazer um PLSQL com um cursor para listar todos os funcionários que possuem vendas e o valor total das vendas de cada um (Exibir o código e o nome do funcionário, e o valor total das vendas).
-- Se o total de vendas ultrapassar 150,00, exibir: ‘Vendeu bem”. Senão, exibir: ‘Vendeu Pouco”.
-- Exemplo: 01 – Joãozinho – Vendeu bem.

-- Declaração do bloco PL/SQL.
declare
    -- Declaração do cursor nomeado "c_emp" que irá selecionar o nome, número de funcionário e valor total de vendas.
    cursor c_emp is
        select rpad(e.emp_nome, 15, ' ')                                           as nome_formatado, -- Formatação do nome para exibição.
               emp_nome,                                                                              -- Nome do funcionário.
               e.emp_num,                                                                             -- Número do funcionário.
               sum(lpad(to_char(p.prod_val * v.venda_qtd, '999g990d00'), 11, ' ')) as valor_total     -- Cálculo e formatação do valor total de vendas.
        from BD_EMP e,
             venda v,
             prod p
        where e.emp_num = v.emp_num
          and v.prod_num = p.prod_num
        group by e.emp_nome,
                 e.emp_num;
begin
    -- Início do loop que percorrerá o resultado do cursor "c_emp".
    for c1 in c_emp
        loop
            -- Verifica se o valor total de vendas é maior que 150.
            if c1.valor_total > 150 then
                -- Imprime o número do funcionário, nome, valor total de vendas e a mensagem 'Vendeu bem'.
                dbms_output.put_line(c1.emp_num || ' - ' || c1.nome_formatado || ' - Total de venda: ' ||
                                     c1.valor_total ||
                                     ' - Vendeu bem.');
            else
                -- Imprime o número do funcionário, nome, valor total de vendas e a mensagem 'Vendeu pouco'.
                dbms_output.put_line(c1.emp_num || ' - ' || c1.nome_formatado || ' - Total de venda: ' ||
                                     c1.valor_total ||
                                     ' - Vendeu pouco.');
            end if;
        end loop; -- Fim do loop.
end;
-- Fim do bloco PL/SQL.

-- Neste código, o cursor c_emp é declarado para selecionar o nome, número de funcionário e valor total de vendas dos
-- funcionários que possuem vendas registradas. O cálculo do valor total de vendas é realizado multiplicando o valor
-- unitário do produto pela quantidade vendida, e o resultado é formatado para exibição. O loop for percorre os resultados
-- do cursor, e dentro dele, o código verifica se o valor total de vendas é maior que 150. Com base nessa verificação,
-- ele imprime o número do funcionário, nome, valor total de vendas e uma mensagem indicando se o funcionário "Vendeu
-- bem" ou "Vendeu pouco". O bloco PL/SQL é delimitado por declare e end;, e contém a declaração do cursor, o loop for,
-- bem como as instruções de impressão e controle do loop.

-- e. Fazer um PLSQL utilizando cursor com parâmetros para listar todos as vendas de cada funcionário
-- (Exibir o código e nome do funcionário, a data da venda e a quantidade total de venda nessa data).
-- OBS.: agrupar por data de venda...

-- Declaração do bloco PL/SQL.
declare
    -- Declaração do cursor nomeado "c_emp" que seleciona os códigos e nomes dos funcionários.
    cursor c_emp is
        select P.EMP_NUM, P.EMP_NOME
        from BD_EMP P;

    -- Declaração do cursor nomeado "c_venda" com parâmetro para selecionar as vendas de um funcionário específico.
    cursor c_venda(PRM_EMP_NUM number) is
        select V.VENDA_DAT,
               sum(V.VENDA_QTD) as qtd_total_venda, -- Soma da quantidade total de venda nessa data.
               VENDA_QTD
        from VENDA V
        where V.EMP_NUM = PRM_EMP_NUM
        group by V.VENDA_DAT, VENDA_QTD;
    aux_flg_achou varchar2(1); -- Variável auxiliar para controle de exibição.
begin
    -- Início do loop que percorrerá os funcionários.
    for c1 in c_emp
        loop
            aux_flg_achou := 'N';
            -- Inicializa a variável auxiliar.

            -- Loop interno que percorrerá as vendas do funcionário atual.
            for c2 in c_venda(c1.EMP_NUM)
                loop
                    -- Verifica se é a primeira venda do funcionário (aux_flg_achou = 'N').
                    if aux_flg_achou = 'N' then
                        -- Imprime as informações do funcionário e da venda.
                        dbms_output.put_line('+ Cursor c1 --- >Código ' || c1.EMP_NUM || ' nome: ' || c1.EMP_NOME);
                        dbms_output.put_line(' -- Cursor c2 --- >Data venda: ' || c2.VENDA_DAT || ' qtd:' ||
                                             c2.VENDA_QTD);
                        aux_flg_achou := 'S'; -- Marca como encontrada a primeira venda.
                    else
                        -- Imprime as informações adicionais das vendas subsequentes.
                        dbms_output.put_line(' -- Cursor c2 --- >Data venda: ' || c2.VENDA_DAT || ' qtd: ' ||
                                             c2.VENDA_QTD);
                    end if;
                end loop; -- Fim do loop interno.
        end loop; -- Fim do loop externo.
end;
-- Fim do bloco PL/SQL.

-- Neste código, há dois cursores declarados: c_emp que seleciona os códigos e nomes dos funcionários, e c_venda que
-- tem um parâmetro para selecionar as vendas de um funcionário específico. O loop externo for percorre os funcionários e,
-- para cada funcionário, o loop interno for percorre as vendas desse funcionário usando o cursor c_venda. Durante o loop
-- interno, as informações do funcionário e das vendas são impressas. A variável aux_flg_achou é usada para controlar
-- se é a primeira venda do funcionário e formatar a exibição corretamente. O bloco PL/SQL é delimitado por declare e end;
-- e inclui a declaração dos cursores, os loops for, bem como as instruções de impressão e controle dos loops.

-- f. Implementar um bloco PLSQL utilizando cursor com parâmetros para listar: nome do cargo, nome do funcionário, nome do produto, quantidade vendida, valor do produto, valor total da venda etc.
-- OBS.: um cursor para o cargo, Um cursor para os funcionários, um cursor para venda/produto.
-- Ex.: + Presidente – RAMBO - CAMISA SÃO PAULO - 1 - 450,00 = 450,00.

-- Declaração do bloco PL/SQL.
declare
    -- Declaração do cursor c_cargo que seleciona os nomes e códigos dos cargos.
    cursor c_cargo is
        select c.cargo_nome, c.cargo_num
        from cargo c;

    -- Declaração do cursor c_emp com parâmetro prm_cargo_num para selecionar os nomes e códigos dos funcionários de um cargo específico.
    cursor c_emp (prm_cargo_num number) is
        select e.emp_nome, e.emp_num
        from BD_EMP e
        where e.cargo_num = prm_cargo_num;

    -- Declaração do cursor c_prod com parâmetro prm_emp_num para selecionar os nomes dos produtos, quantidade vendida, valor do produto e valor total da venda de um funcionário específico.
    cursor c_prod (prm_emp_num number) is
        select rpad(p.prod_nome, 15, ' '),
               prod_nome,
               v.venda_qtd,
               lpad(p.prod_val, 5, ' '),
               prod_val,
               sum(lpad(to_char(p.prod_val * v.venda_qtd, '999g990d00'), 11, ' ')) valor_total
        from prod p,
             venda v
        where p.prod_num = v.prod_num
          and v.emp_num = prm_emp_num
        group by p.prod_nome, v.venda_qtd,
                 p.prod_val;
begin
    -- Loop externo que percorre os cargos.
    for c1 in c_cargo
        loop
            -- Imprime o nome do cargo.
            dbms_output.put_line('+' || c1.cargo_nome);

            -- Loop interno que percorre os funcionários de um cargo específico.
            for c2 in c_emp(c1.cargo_num)
                loop
                    -- Imprime o nome do funcionário.
                    dbms_output.put_line('|_' || c2.emp_nome);

                    -- Loop interno que percorre os produtos vendidos pelo funcionário.
                    for c3 in c_prod(c2.emp_num)
                        loop
                            -- Imprime as informações do produto vendido.
                            dbms_output.put_line(' -->' || c3.prod_nome || ' - ' || c3.prod_val || ' - ' || c3.valor_total);
                        end loop;  -- Fim do loop interno dos produtos.
                end loop;  -- Fim do loop interno dos funcionários.
        end loop;  -- Fim do loop externo dos cargos.
end;  -- Fim do bloco PL/SQL.

-- Neste código, você tem três cursores declarados: c_cargo, que seleciona os nomes e códigos dos cargos;
-- as informações dos produtos vendidos por um funcionário específico. O código contém três loops for aninhados,
-- onde o loop externo percorre os cargos, o loop intermediário percorre os funcionários do cargo atual e o
-- loop interno mais interno percorre os produtos vendidos por um funcionário. Durante cada loop, as informações
-- são impressas usando a função dbms_output.put_line. O bloco PL/SQL é delimitado por declare e end; e inclui
-- a declaração dos cursores e os loops for, bem como as instruções de impressão e controle dos loops.