-- Criando um procedimento que exibe uma saudação personalizada
CREATE OR REPLACE PROCEDURE saudacao(nome IN VARCHAR2) IS
BEGIN
   -- Imprime uma mensagem de saudação com o nome fornecido
   DBMS_OUTPUT.PUT_LINE('Olá, ' || nome || '! Bem-vindo ao sistema.');
END;


DECLARE
   nome varchar2(20) := 'LEONARDO';
-- Chamando o procedimento para exibir a saudação
BEGIN
   saudacao(nome); -- Passa o nome 'Alice' para o procedimento
END;


-- Criando uma função que calcula a área de um círculo
CREATE OR REPLACE FUNCTION calcular_area(raio IN NUMBER) RETURN NUMBER IS
   pi CONSTANT NUMBER := 3.14159;
   area NUMBER;
BEGIN
   -- Calcula a área usando a fórmula do círculo
   area := pi * raio * raio;
   RETURN area; -- Retorna o valor calculado
END;


-- Chamando a função para calcular a área do círculo
DECLARE
   raio_circulo NUMBER := 5;
   area_result NUMBER;
BEGIN
   -- Chama a função e atribui o resultado à variável area_result
   area_result := calcular_area(raio_circulo);
   -- Exibe a área calculada usando a função DBMS_OUTPUT.PUT_LINE
   DBMS_OUTPUT.PUT_LINE('A área do círculo é: ' || area_result);
END;

-- Um parâmetro IN é usado para passar valores de entrada para o procedimento ou função.
-- Dentro do procedimento ou função, o valor do parâmetro IN não pode ser alterado; ele é tratado como somente leitura.
-- É útil quando você deseja passar dados para a subrotina para processamento, mas não precisa retornar valores diretamente.


CREATE OR REPLACE PROCEDURE exibir_mensagem(in_texto IN VARCHAR2) IS
BEGIN
   DBMS_OUTPUT.PUT_LINE('Mensagem recebida: ' || in_texto);
END;

BEGIN
   exibir_mensagem('Olá, mundo!'); -- Passa o valor 'Olá, mundo!' como argumento
END;


-- Um parâmetro OUT é usado para retornar valores da subrotina para o chamador.
-- O valor do parâmetro OUT é definido dentro da subrotina e estará disponível para o chamador quando a subrotina for executada.
-- É útil quando você deseja que a subrotina retorne um ou mais valores específicos ao chamador.
-- Exemplo de procedimento com parâmetro IN
-- Exemplo de função com parâmetro OUT
CREATE OR REPLACE FUNCTION calcular_soma(a NUMBER, b NUMBER, resultado OUT NUMBER) RETURN NUMBER IS
BEGIN
   resultado := a + b;
   RETURN resultado;
END;


DECLARE
   num1 NUMBER := 10;
   num2 NUMBER := 20;
   resultado_soma NUMBER;

BEGIN
   resultado_soma := calcular_soma(num1, num2, resultado_soma);
   DBMS_OUTPUT.PUT_LINE('A soma de ' || num1 || ' e ' || num2 || ' é: ' || resultado_soma);
END;
