-- ### Trabalhando com Update e Delete ###

-- Mudando o nome de um cliente
update cliente set nome = 'Moisés' where idcliente = 1;
select * from cliente;

-- Alterando mais informações de um cliente
update cliente set nome = 'Adriano', genero = 'M', numero = '241' where idcliente = 4;
select * from cliente;

-- Inserindo um novo cliente
insert into cliente (idcliente, nome) values (16, 'João');
select * from cliente;

-- Deletando um cliente
delete from cliente where idcliente = 16;
select * from cliente;