-- Criação da tabela N3_FUNC para armazenar informações dos funcionários.
CREATE TABLE N3_FUNC (
    COD_FUNC NUMBER(5) NOT NULL,
    NOM_FUNC VARCHAR2(100) NOT NULL,
    QTD_ANOS_SERV NUMBER(10),
    VAL_SAL NUMBER(10, 2),
    PRIMARY KEY (COD_FUNC)
);

-- Criação da tabela N3_FUNC_INTERM para registrar operações na tabela N3_FUNC.
CREATE TABLE N3_FUNC_INTERM (
    COD_FUNC NUMBER(5) NOT NULL PRIMARY KEY,
    NOM_FUNC VARCHAR2(100) NOT NULL,
    QTD_ANOS_SERV NUMBER(10),
    VAL_SAL NUMBER(10, 2),
    DAT_ATUALZ DATE,
    TIPO_OPER VARCHAR2(1),
    NOM_USUAR VARCHAR2(100)
);

-- Inserção de registros na tabela N3_FUNC para testes.
INSERT INTO N3_FUNC (COD_FUNC, NOM_FUNC, QTD_ANOS_SERV, VAL_SAL)
VALUES (1, 'Funcionário 1', 1, 1500);
-- ... Outros registros inseridos ...

-- Criação do trigger n3_func_01 para registrar operações na tabela N3_FUNC.
CREATE OR REPLACE TRIGGER n3_func_01
BEFORE INSERT OR UPDATE OR DELETE ON N3_FUNC
FOR EACH ROW
DECLARE
BEGIN
    -- Se uma inserção ou atualização está ocorrendo:
    IF INSERTING OR UPDATING THEN
        INSERT INTO N3_FUNC_INTERM (COD_FUNC, NOM_FUNC, QTD_ANOS_SERV, VAL_SAL, DAT_ATUALZ, TIPO_OPER, NOM_USUAR)
        VALUES (:new.COD_FUNC, :new.NOM_FUNC, :new.QTD_ANOS_SERV, :new.VAL_SAL, SYSDATE, 'I', 'MEU_NOME');
    -- Se uma atualização está ocorrendo:
    ELSIF UPDATING THEN
        INSERT INTO N3_FUNC_INTERM (COD_FUNC, NOM_FUNC, QTD_ANOS_SERV, VAL_SAL, DAT_ATUALZ, TIPO_OPER, NOM_USUAR)
        VALUES (:new.COD_FUNC, :new.NOM_FUNC, :new.QTD_ANOS_SERV, :new.VAL_SAL, SYSDATE, 'A', 'MEU_NOME');
    -- Se uma exclusão está ocorrendo:
    ELSIF DELETING THEN
        INSERT INTO N3_FUNC_INTERM (COD_FUNC, NOM_FUNC, QTD_ANOS_SERV, VAL_SAL, DAT_ATUALZ, TIPO_OPER, NOM_USUAR)
        VALUES (:old.COD_FUNC, :old.NOM_FUNC, :old.QTD_ANOS_SERV, :old.VAL_SAL, SYSDATE, 'D', 'MEU_NOME');
    END IF;
END n3_func_01;

-- Esse código demonstra a criação das tabelas N3_FUNC e N3_FUNC_INTERM, a inserção de registros na tabela N3_FUNC para
-- testes e a criação da trigger n3_func_01. A trigger é acionada antes de inserções, atualizações ou exclusões na tabela
-- N3_FUNC e registra as operações correspondentes na tabela N3_FUNC_INTERM. Comentários foram adicionados para explicar
-- cada parte do código.


INSERT INTO N3_FUNC (COD_FUNC, NOM_FUNC, QTD_ANOS_SERV, VAL_SAL)
VALUES (3, 'Funcionário 2', 2, 1500);

SELECT * FROM N3_FUNC;
SELECT * FROM N3_FUNC_INTERM;

DELETE FROM N3_FUNC WHERE COD_FUNC = 3;
SELECT * FROM N3_FUNC;
SELECT * FROM N3_FUNC_INTERM;