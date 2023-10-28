
-- Neste exemplo, estamos criando uma trigger chamada trg_atualizar_data_modificacao que é acionada antes de
-- uma atualização (BEFORE UPDATE) na tabela produtos. A cláusula FOR EACH ROW indica que a trigger é
-- executada para cada linha afetada pela atualização. Dentro do bloco BEGIN, estamos atualizando o valor
-- da coluna data_modificacao na linha sendo atualizada com a função SYSDATE, que retorna a data e hora atuais.

DROP TABLE PRODUTOS;


-- Criação de uma tabela de produtos
CREATE TABLE produtos (
   id NUMBER PRIMARY KEY,
   nome VARCHAR2(50),
   preco NUMBER,
   data_modificacao DATE
);

-- Criação da trigger
CREATE OR REPLACE TRIGGER trg_atualizar_data_modificacao
BEFORE UPDATE ON produtos
FOR EACH ROW
BEGIN
   data_modificacao := SYSDATE; -- Atualiza a data de modificação com a data e hora atuais
END;

-- Inserção de um produto na tabela
INSERT INTO produtos (id, nome, preco, data_modificacao) VALUES (1, 'Produto A', 10.99, SYSDATE);

INSERT INTO produtos (id, nome, preco, data_modificacao) VALUES (5, 'Produto B', 10.99, SYSDATE);
INSERT INTO produtos (id, nome, preco, data_modificacao) VALUES (2, 'Produto B', 10.99, SYSDATE);
INSERT INTO produtos (id, nome, preco, data_modificacao) VALUES (3, 'Produto C', 10.99, SYSDATE);
INSERT INTO produtos (id, nome, preco, data_modificacao) VALUES (4, 'Produto D', 10.99, SYSDATE);

SELECT * FROM produtos;

-- Atualização de um produto (a trigger será acionada)
UPDATE produtos SET preco = 13.00 WHERE id = 1;

DELETE FROM PRODUTOS WHERE id = 1;

-- Consulta para verificar os resultados
SELECT * FROM produtos;


-- Neste exemplo, quando o UPDATE é executado na tabela produtos, a trigger é acionada automaticamente e atualiza
-- a coluna data_modificacao para refletir a data e hora da atualização.
-- As triggers são poderosas ferramentas para automatizar ações no banco de dados em resposta a
-- eventos específicos, mas devem ser usadas com cuidado para evitar comportamentos inesperados ou impactos negativos no desempenho.


DROP TABLE PRODUTOS;

-- Criação da tabela produtos
CREATE TABLE produtos (
    id NUMBER PRIMARY KEY,
    nome VARCHAR2(100),
    produtor VARCHAR2(100)
);

-- Criação da tabela logs para registrar as inserções
CREATE TABLE logs (
    id NUMBER PRIMARY KEY,
    mensagem VARCHAR2(200),
    data_insercao DATE
);

-- Criação da trigger para registrar inserções de produtos com produtor "ExemploProdutor"
CREATE OR REPLACE TRIGGER trg_registrar_insercao
AFTER INSERT ON produtos
FOR EACH ROW
BEGIN
    IF :NEW.produtor = 'ExemploProdutor' THEN
        INSERT INTO logs (id, mensagem, data_insercao)
        VALUES (logs_seq.NEXTVAL, 'Novo produto inserido com produtor ExemploProdutor', SYSDATE);
    END IF;
END;
/


INSERT INTO produtos (id, nome, produtor) VALUES (1, 'Produto A', 'ExemploProdutor');
