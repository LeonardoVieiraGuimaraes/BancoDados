CREATE TABLE depto
(
    cod_depto        number(7)    not null,
    dsc_departamento varchar2(30) not null,
    constraint depto_pk primary key (cod_depto)
);

CREATE TABLE produto
(
    cod_produto number(7)      not null,
    dsc_produto varchar2(30)   not null,
    dsc_unidade varchar2(10),
    vlr_unit    number(12, 02) not null,
    constraint produto_pk primary key (cod_produto)
);
CREATE TABLE fornecedor
(
    cod_fornec       number(7)    not null,
    dsc_razao_social varchar2(40) not null,
    num_cgc          number(15)   not null,
    num_cep          number(8)    not null,
    cod_cidade       number(4)    not null,
    dsc_endereco     varchar2(40) not null,
    cod_tipo_fornec  varchar2(1),
    tipo_fornec      number(5),
    num_ins_est      number(11),
    num_fone         number(13),
    num_fax          number(11),
    num_telex        number(11),
    nom_contato      varchar2(30),
    dat_nasc_contato date,
    constraint fornec_pk primary key (cod_fornec)
);

CREATE TABLE solic_compra
(
    num_solic    number(7) not null,
    cod_depto    number(7) not null,
    dat_emiss    date      not null,
    dat_previsao date      not null,
    constraint num_colic_pk primary key (num_solic),
    constraint solic_depto_fk foreign key (cod_depto)
        references depto (cod_depto)
);

drop table solic_compra;


CREATE TABLE pedido
(
    num_pedido number(7) not null,
    cod_fornec number(7) not null,
    dat_emiss  date      not null,
    dat_entreg date      not null,
    constraint pedido_pk primary key (num_pedido),
    constraint pedido_fornec_fk foreign key (cod_fornec)
        references fornecedor (cod_fornec)
);

CREATE TABLE item_solic
(
    num_solic   number(7) not null,
    cod_produto number(7) not null,
    qtd_solic   number(7) not null,
    constraint item_solic_pk primary key (num_solic, cod_produto),
    constraint item_solic_produto_fk foreign key (cod_produto)
        references produto (cod_produto),
    constraint item_solic_solic_fk foreign key (num_solic)
        references solic_compra (num_solic)
);

CREATE TABLE item_pedido
(
    num_pedido  number(7)    not null,
    cod_produto number(7)    not null,
    num_solic   number(7)    not null,
    qtd_pedido  number(7)    not null,
    vlr_unit    number(7, 2) not null,
    constraint item_ped_pk primary key (num_solic, cod_produto, num_pedido),
    constraint item_ped_item_solic_fk foreign key (num_solic, cod_produto)
        references item_solic (num_solic, cod_produto),
    constraint item_ped_pedido_fk foreign key (num_pedido)
        references pedido (num_pedido)
);

insert into depto
values (1, 'Administração');
insert into depto
values (2, 'Informática');
insert into depto
values (3, 'Recursos Humanos');
insert into depto
values (4, 'Produção');
insert into depto
values (5, 'Compras');
insert into depto
values (6, 'Vendas');
insert into depto
values (7, 'Marketing');

insert into produto
values (1, 'Parafuso', 'Unidade', .10);
insert into produto
values (2, 'Martelo', 'Unidade', 1.99);
insert into produto
values (3, 'Graxa', 'Lata', .30);
insert into produto
values (4, 'Furadeira Bosch', 'Unidade', 75.60);
insert into produto
values (10, 'Esquadro', null, 15);
insert into produto
values (11, 'Alicate', 'Unidade', 3);
insert into produto
values (12, 'Betoneira', 'Unidade', 150);
insert into produto
values (5, 'Chave de Fenda', 'Unidade', 1.4);
insert into produto
values (6, 'Cano de PVC', 'Metro', 0.90);
insert into produto
values (13, 'Massa de Vedação', 'Quilo', 4);

insert into fornecedor
values (1, 'Informática Blumenau', 1.235E+09, 88301150,
        1, 'Rua Itaiópolis', 1, 1, 6534321, 3230101, null, null, 'Fernando', '12/09/1975');
insert into fornecedor
values (2, 'Armazém das Ferragens', 65464, 4654654,
        1, 'Rua São Benedito', 4, 2, 1234234, 2228989, null, null, 'Edenilsom
Capestrim', '12/01/1946');
insert into fornecedor
values (3, 'Casas da Água', 54654654, 65465465,
        1, 'Rua Capião Euclides de Castro', 1, 1, 12112, 1211212, null, null, 'Jandira
Aspertes', '12/10/1973');

insert into solic_compra
values (1, 1, '12/01/1996', '12/02/1996');
insert into solic_compra
values (2, 3, '12/12/1997', '13/12/1997');
insert into solic_compra
values (3, 7, '12/01/1996', '12/01/1997');
insert into solic_compra
values (4, 2, '01/04/1997', '02/04/1997');
insert into solic_compra
values (6, 3, '12/01/1996', '12/01/1996');

insert into pedido
values (2, 1, '12/01/1996', '12/03/1997');
insert into pedido
values (3, 2, '24/01/1997', '30/01/1997');
insert into pedido
values (4, 2, '12/01/1997', '12/01/1997');
insert into pedido
values (5, 3, '15/02/1997', '20/02/1997');
insert into pedido
values (6, 1, '12/09/1997', '20/09/1997');
insert into pedido
values (7, 2, '23/01/1997', '24/01/1997');
insert into pedido
values (8, 3, '15/01/1997', '15/01/1997');

insert into item_solic
values (1, 2, 3);
insert into item_solic
values (1, 3, 2);
insert into item_solic
values (1, 4, 4);
insert into item_solic
values (2, 2, 2);
insert into item_solic
values (2, 4, 1);
insert into item_solic
values (2, 6, 5);
insert into item_solic
values (3, 1, 2);
insert into item_solic
values (3, 5, 1);
insert into item_solic
values (4, 1, 100);
insert into item_solic
values (4, 2, 1);
insert into item_solic
values (4, 3, 1);
insert into item_solic
values (4, 4, 1);
insert into item_solic
values (4, 5, 1);
insert into item_solic
values (4, 6, 10);
insert into item_solic
values (6, 2, 200);

insert into item_pedido
values (2, 2, 1, 2, 50.78);
insert into item_pedido
values (3, 2, 1, 3, 250.56);
insert into item_pedido
values (3, 3, 1, 2, 536.32);
insert into item_pedido
values (4, 4, 1, 4, 1050.23);
insert into item_pedido
values (4, 3, 1, 3, 78.23);
insert into item_pedido
values (4, 2, 1, 4, 12.33);
insert into item_pedido
values (5, 2, 2, 2, 545.12);
insert into item_pedido
values (5, 4, 2, 2, 256.66);
insert into item_pedido
values (5, 6, 2, 6, 89.2);
insert into item_pedido
values (6, 1, 3, 2, 88.26);
insert into item_pedido
values (6, 5, 3, 2, 257.12);
insert into item_pedido
values (7, 1, 4, 150, 78.15);
insert into item_pedido
values (7, 2, 4, 2, 4056.56);
insert into item_pedido
values (7, 3, 4, 2, 455.26);
insert into item_pedido
values (7, 5, 4, 3, 789.65);
insert into item_pedido
values (7, 6, 4, 15, 798.54);
insert into item_pedido
values (7, 4, 4, 2, 10.12);
insert into item_pedido
values (8, 2, 6, 200, 4998.23);



-- a) Mostrar todos os itens de solicitação do produto 5.
-- Esta consulta exibe todos os itens de solicitação que estão relacionados ao produto com código 5.
select *
from item_solic
where cod_produto = 5;

-- b) Mostrar todos os itens de solicitação em que a quantidade solicitada é de até 3 unidades.
-- Essa consulta retorna os itens de solicitação em que a quantidade solicitada é no máximo 3 unidades.
select *
from item_solic
where qtd_solic <= 3;

-- c) Mostrar todos os itens de solicitação em que a quantidade solicitada é acima de 50 unidades.
-- Essa consulta mostra os itens de solicitação em que a quantidade solicitada é maior que 50 unidades.
select *
from item_solic
where qtd_solic > 50;

-- d) Mostrar todas as descrições de produto que não são medidas por 'Unidade'.
-- Essa consulta lista as descrições dos produtos que não têm a unidade de medida igual a 'Unidade'.
select dsc_produto
from produto
where dsc_unidade <> 'Unidade';

-- e) Mostrar código e descrição dos produtos em que a unidade de medida é nula.
-- Aqui, são exibidos os códigos e descrições dos produtos em que a unidade de medida está vazia (nula).
select cod_produto, dsc_produto
from produto
where dsc_unidade is null;

-- f) Mostrar a descrição dos departamentos 3, 4 e 7.
-- Nesta consulta, é mostrada a descrição dos departamentos com códigos 3, 4 e 7.
select dsc_departamento
from depto
where cod_depto in (3, 4, 7);

-- g) Mostrar o número dos pedidos emitidos em janeiro de 1997.
-- Aqui, são exibidos os números dos pedidos emitidos no mês de janeiro de 1997.
select num_pedido
from pedido
where dat_emiss between '01-jan-97' and '31-jan-97';

-- h) Mostrar todas as informações dos fornecedores em que a razão social contém a string 'err'.
-- Esta consulta retorna todas as informações dos fornecedores cuja razão social contém a string 'err'.
select *
from fornecedor
where dsc_razao_social like '%err%';

-- i) Mostrar código e descrição dos produtos que foram pedidos pelo menos uma vez.
-- Nesta consulta, são mostrados o código e a descrição dos produtos que foram pedidos pelo menos uma vez,
-- verificando se existe algum registro na tabela de item_pedido relacionado ao produto.
select cod_produto, dsc_produto
from produto p
where exists (
    select cod_produto
    from item_pedido it
    where it.cod_produto = p.cod_produto
);

-- j) Mostrar código e descrição dos departamentos que fizeram pelo menos uma solicitação de compra.
-- Esta consulta exibe os códigos e descrições dos departamentos que realizaram pelo menos uma solicitação de compra.
-- Ela utiliza uma subconsulta na cláusula EXISTS para verificar se há algum registro na tabela solic_compra relacionado ao departamento.
select cod_depto, dsc_departamento
from depto d
where exists (select cod_depto
              from solic_compra s
              where s.cod_depto = d.cod_depto);

-- k) Mostrar todas as informações dos produtos que são medidos por 'Lata' ou que custam até R$ 1,00.
-- Nesta consulta, são exibidas todas as informações dos produtos que têm a unidade de medida 'Lata' OU custam até R$ 1,00.
-- A cláusula OR é utilizada para combinar essas duas condições.
select *
from produto
where dsc_unidade = 'Lata'
   or vlr_unit < 1;


-- l) Mostrar todas as informações dos produtos que são medidos por 'Unidade' e custam mais de R$ 50,00.
select *
from produto
where dsc_unidade = 'Unidade'
  and vlr_unit > 50;

-- m) Mostrar todas as informações dos produtos que são medidos por 'Unidade' e custam mais de R$ 50,00 ou que são medidas por 'Metro'.
select *
from produto
where (dsc_unidade = 'Unidade' and vlr_unit > 50)
   or dsc_unidade = 'Metro';

-- n) Mostrar o código dos produtos solicitados, além da quantidade média e total solicitada.
select it.cod_produto
     , sum(it.qtd_solic)
     , avg(it.qtd_solic)
from solic_compra sc
   , item_solic it
where it.num_solic = sc.num_solic
group by it.cod_produto;

-- o) Mostrar a quantidade pedida, aberta por fornecedor e produto.
-- Nesta consulta, a quantidade total pedida por cada fornecedor e produto é mostrada.
-- Ela faz uma junção entre as tabelas pedido e item_pedido, agrupa os resultados pelo código do fornecedor e do produto,
-- e então calcula a soma da quantidade pedida usando a função SUM().
select p.cod_fornec, ip.cod_produto, sum(ip.qtd_pedido)
from pedido p,
     item_pedido ip
where ip.num_pedido = p.num_pedido
group by p.cod_fornec, ip.cod_produto;

-- p) Mostrar para cada produto pedido as seguintes informações:
-- 1) Descrição.
-- 2) Quantidade de pedidos.
-- 3) Quantidade pedida do produto.
-- 4) Valor total pedido.
-- 5) Menor preço unitário.
-- 6) Maior preço unitário.
-- 7) Preço médio unitário praticado.
-- Nesta consulta, você está exibindo várias informações relevantes para cada produto pedido.
-- Ela junta as tabelas produto e item_pedido, agrupa os resultados pelo código do produto e, em seguida, calcula várias informações,
-- como a contagem de pedidos, soma da quantidade pedida, valor total, menor, maior e média de preços unitários.
select p.cod_produto
     , p.dsc_produto
     , count(*)                         qtd_pedidos
     , sum(ip.qtd_pedido)               qtd_pedida
     , sum(ip.vlr_unit * ip.qtd_pedido) valor_total
     , min(ip.vlr_unit)                 menor_preco
     , max(ip.vlr_unit)                 maior_preco
     , avg(ip.vlr_unit)                 preco_medio
from produto p
   , item_pedido ip
where p.cod_produto = ip.cod_produto
group by p.cod_produto
       , p.dsc_produto;


-- q) Mostrar a quantidade de produtos solicitada e a média de produtos por solicitação,
-- aberto por descrição do departamento, mês (e ano) de emissão da solicitação e código do produto.
-- Nesta consulta, você está extraindo informações relevantes relacionadas à quantidade de produtos solicitados
-- e à média de produtos por solicitação. As informações são agrupadas por descrição do departamento,
-- mês e ano de emissão da solicitação e código do produto.
select d.dsc_departamento
     , substr(to_char(sc.dat_emiss, 'mm/yyyy'), 1, 7) mes_emiss
     , it.cod_produto
     , sum(it.qtd_solic)
     , avg(it.qtd_solic)
from depto d
   , solic_compra sc
   , item_solic it
where sc.cod_depto = d.cod_depto
  and it.num_solic = sc.num_solic
group by d.dsc_departamento
       , it.cod_produto
       , to_char(sc.dat_emiss
    , 'mm/yyyy');


-- r) Montar o seguinte texto (utilizar concatenação) sobre os produtos pedidos:
-- 1) A quantidade do pedido.
-- 2) A unidade de medida, sendo que:
-- 2.1) Unidade deve ser representada por peça.
-- 2.2) Metro deve ser representado por m.
-- 2.3) Não deve ser levado em conta maiúsculo/minúsculo (Metro = metro = METRO).
-- 3) Descrição do produto.
-- 4) Custo unitário.
-- 5) Seguindo o exemplo.

-- Nesta consulta, você está utilizando a função CONCATENAÇÃO para criar um texto personalizado
-- com várias informações dos produtos pedidos. As informações são extraídas da tabela de produtos
-- e da tabela de itens de pedido (item_pedido). A função DECODE é usada para representar a unidade
-- de medida corretamente, conforme as condições definidas (Unidade = peça, Metro = m).
-- O texto é montado seguindo o exemplo fornecido.

select to_char(ip.qtd_pedido) || ' ' ||
       decode(upper(p.dsc_unidade), 'UNIDADE', 'peça', 'METRO', 'm',
              p.dsc_unidade) ||
       ' de ' || p.dsc_produto || ' ao custo unitario de R$ ' || to_char(ip.vlr_unit) texto
from produto p
   , item_pedido ip
where p.cod_produto = ip.cod_produto;

-- s) Mostrar a razão social dos fornecedores que entregaram um pedido mais de 7 dias após a emissão do pedido.
-- Mostrar também quantas vezes isso ocorreu.
-- Nesta consulta, você está selecionando informações sobre os fornecedores que tiveram pedidos entregues com atraso de mais de 7 dias.
-- A condição p.dat_entreg - p.dat_emiss > 7 verifica se a diferença entre as datas de entrega e emissão do pedido é maior que 7 dias.
-- Se essa condição for verdadeira, significa que o pedido foi entregue com atraso.
-- As informações são obtidas a partir das tabelas de fornecedores (fornecedor) e pedidos (pedido).
-- A função COUNT(*) é usada para contar quantas vezes isso ocorreu para cada fornecedor.
select dsc_razao_social, count(*)
from fornecedor f,
     pedido p
where p.cod_fornec = f.cod_fornec
  and p.dat_entreg - p.dat_emiss > 7
group by dsc_razao_social;

-- t) Mostrar a razão social dos fornecedores e a quantidade de pedidos feita ao fornecedor.
-- Mostrar também quantos pedidos foram entregues mais de 7 dias após a emissão.
-- Nesta consulta, você está selecionando informações sobre os fornecedores e os pedidos feitos a eles.
-- A função COUNT(*) é usada para contar a quantidade total de pedidos para cada fornecedor.
-- A função SUM(DECODE(...)) é usada para contar quantos pedidos foram entregues com mais de 7 dias de atraso.
-- A expressão DECODE(sign(p.dat_entreg - p.dat_emiss - 6), 1, 1, 0) verifica se o atraso na entrega é maior
-- do que 7 dias (ou seja, o valor da diferença é positivo e maior que 6). Se for verdadeiro, conta 1, caso contrário, 0.
-- O resultado dessa expressão é somado para contar o número de pedidos atrasados.
-- As informações são obtidas a partir das tabelas de fornecedores (fornecedor) e pedidos (pedido).

select dsc_razao_social
     , count(*)                                                   pedidos
     , sum(decode(sign(p.dat_entreg - p.dat_emiss - 6), 1, 1, 0)) pedido_atrasados
from fornecedor f,
     pedido p
where p.cod_fornec = f.cod_fornec
group by dsc_razao_social;

-- l) Mostrar todas as informações dos produtos que são medidos por 'Unidade' e custam mais de R$ 50,00.
-- Esta consulta exibe todas as informações dos produtos que têm a unidade de medida 'Unidade' e custam mais de R$ 50,00.
-- A cláusula AND é usada para combinar essas duas condições.
select *
from produto
where dsc_unidade = 'Unidade'
  and vlr_unit > 50;

-- m) Mostrar todas as informações dos produtos que são medidos por 'Unidade' e custam mais de R$ 50,00
--     ou que são medidos por 'Metro'.
-- Nesta consulta, as informações de produtos que atendem a duas condições diferentes são exibidas:
-- produtos que têm a unidade de medida 'Unidade' e custam mais de R$ 50,00
-- OU produtos que têm a unidade de medida 'Metro'.
select *
from produto
where (dsc_unidade = 'Unidade' and vlr_unit > 50)
   or dsc_unidade = 'Metro';

-- n) Mostrar o código dos produtos solicitados, além da quantidade média e total solicitada.
-- Nesta consulta, são exibidos o código dos produtos solicitados, a quantidade total solicitada e a quantidade média solicitada.
-- A consulta faz uma junção entre as tabelas solic_compra e item_solic utilizando a cláusula WHERE e, em seguida, agrupa os resultados pelo código do produto.
select it.cod_produto
     , sum(it.qtd_solic) as total_solicitado
     , avg(it.qtd_solic) as media_solicitada
from solic_compra sc
   , item_solic it
where it.num_solic = sc.num_solic
group by it.cod_produto;
