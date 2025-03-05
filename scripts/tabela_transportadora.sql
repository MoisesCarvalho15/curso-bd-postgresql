create table transportadora (
	idtransportadora integer not null,
	idmunicipio integer,
	nome varchar(50) not null,
	longradouro varchar(50),
	numero varchar(10),

	constraint pk_trn_idtransportadora primary key(idtransportadora),
	constraint fk_trn_idmunicipio foreign key (idmunicipio) references municipio (idmunicipio),
	constraint un_trn_nome unique (nome)
);

-- Inserindo os dados
insert into transportadora (idtransportadora, idmunicipio, nome, longradouro, numero)
values (1, 9, 'Bs. Transportes', 'Rua das limas', 01);

insert into transportadora (idtransportadora, idmunicipio, nome)
values (2, 5, 'União Transportes');

-- Visualizando os dados
select * from transportadora;