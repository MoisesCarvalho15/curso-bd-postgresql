-- ### Exercícios Update e delete ###

-- 1. Insira os novos usários na tabela cliente utilizando os dados disponíveis no pdf
insert into cliente (idcliente, nome, cpf, rg, data_nascimento, genero, profissao, municipio, uf)
values (16, 'Maicon', '12349596421', '1234', '1965-10-10', 'F', 'Empresário', 'Florianópolis', 'PR');

insert into cliente (idcliente, nome, rg, genero, profissao, nacionalidade, logradouro, numero, complemento, bairro, municipio, uf)
values (17, 'Getúlio', '4631', 'F', 'Estudante', 'Brasileira', 'Rua Central', '343', 'Apartamento', 'Centro', 'Curitiba', 'SC');

insert into cliente (idcliente, nome, genero, profissao, nacionalidade, numero, complemento)
values (18, 'Sandra', 'M', 'Professor', 'Italiana', '12', 'Bloco A');

-- 2. Altere os dados do Cliente Maicon: cpf para 45390569432, gênero para M, nacionalidade para Brasileira, uf para SC
update cliente set cpf = '45390569432', genero = 'M', nacionalidade = 'Brasileira', uf = 'SC' where nome = 'Maicon';
select * from cliente where nome = 'Maicon';

-- 3. Altere os dados do cliente Getúlio: data de nascimento para 01/04/1978 e gênero para M
update cliente set data_nascimento = '1978-04-01', genero = 'M' where nome = 'Getúlio';
select * from cliente where nome = 'Getúlio';

-- 4. Altere os dados da cliente Sandra: gênero para F, profissão para professora e número para 123
update cliente set genero = 'F', profissao = 'Professora', numero = '123' where nome = 'Sandra';
select * from cliente where nome = 'Sandra';

-- 5. Apague o cliente Maicon e a Sandra
delete from cliente where nome = 'Maicon';
delete from cliente where nome = 'Sandra';
select * from cliente;
