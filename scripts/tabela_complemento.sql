create table complemento (
	idcomplemento integer not null,
	nome varchar(30) not null,

	constraint pk_cpl_idcomplemento primary key (idcomplemento),
	constraint un_cpl_nome unique (nome)
);

-- Visualizando os complemento da tabela de cliente
select complemento from cliente;

-- Inserindo os complementos na tabela de complemento
insert into complemento (idcomplemento, nome) values (1, 'Casa');
insert into complemento (idcomplemento, nome) values (2, 'Apartamento');

-- Visualizando a tabela de complemento
select * from complemento;