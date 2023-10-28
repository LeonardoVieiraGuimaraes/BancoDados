-- Criação da especificação do package
CREATE OR REPLACE PACKAGE meu_package AS
   -- Declaração de um procedimento na especificação
   PROCEDURE saudacao(nome IN VARCHAR2);

   -- Declaração de uma função na especificação
   FUNCTION calcular_area(raio IN NUMBER) RETURN NUMBER;

   -- Declaração de uma constante na especificação
   pi CONSTANT NUMBER := 3.14159;

   -- Declaração de um tipo de dado na especificação
   TYPE meu_tipo IS RECORD (
      campo1 NUMBER,
      campo2 VARCHAR2(50)
   );

END meu_package;


-- Criação do corpo do package
CREATE OR REPLACE PACKAGE BODY meu_package AS
   -- Implementação do procedimento
   PROCEDURE saudacao(nome IN VARCHAR2) IS
   BEGIN
      DBMS_OUTPUT.PUT_LINE('Olá, ' || nome || '! Bem-vindo ao pacote.');
   END saudacao;

   -- Implementação da função
   FUNCTION calcular_area(raio IN NUMBER) RETURN NUMBER IS
      area NUMBER;
   BEGIN
      area := pi * raio * raio;
      RETURN area;
   END calcular_area;

END meu_package;


-- -- Uso do package
-- SET SERVEROUTPUT ON;

-- Chamando o procedimento do package
BEGIN
   meu_package.saudacao('Alice');
END;
/

-- Chamando a função do package
DECLARE
   raio_circulo NUMBER := 5;
   area_result NUMBER;
BEGIN
   area_result := meu_package.calcular_area(raio_circulo);
   DBMS_OUTPUT.PUT_LINE('A área do círculo é: ' || area_result);
END;
