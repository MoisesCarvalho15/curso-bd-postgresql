-- ### Consultas na Tabela ###

-- Consultando a tabela inteira
select * from cliente;

-- Consultando a tabela inteira com um limite
select * from cliente limit 3;

-- Consultando campos específicos
select nome, data_nascimento from cliente;

-- Renomeando a exibição de uma coluna
select nome, data_nascimento as "Data de Nascimento" from cliente;

-- Concatenando colunas e renomeando
select 'CPF: ' || cpf || ' RG: ' || rg  as "CPF e RG" from cliente;

-- Filtrando por condições
select nome, data_nascimento from cliente where data_nascimento > '2000-01-01';

-- Filtrando por nomes que começam com uma letra específica
select nome from cliente where nome like 'C%';

-- Filtrando por nomes que contenham uma letra específica no nome
select nome from cliente where nome like '%c%';

-- Filtrando por dados onde esteja entre duas condições
select nome, data_nascimento from cliente where data_nascimento between '1990-01-01' and '1998-01-01';

-- Filtrando somente clientes que estejam com o compo de rg vazio
select nome, rg from cliente where rg is null;

-- Ordenando os nomes em ordem alfabética
select nome from cliente order by nome asc;

-- Ordenando os nomes em ordem descendente
select nome from cliente order by nome desc;
