-- Criando uma tabela
create table cliente (
	idcliente integer not null, -- É obrigatório preencher esse dado
	nome varchar(50) not null,  -- É obrigatório preencher esse dado
	cpf char(11),
	rg varchar(15),
	data_nascimento date,
	genero char(1),
	profissao varchar(30),
	nacionalidade varchar(30),
	logradouro varchar(30),
	numero varchar(10),
	complemento varchar(30),
	bairro varchar(30),
	municipio varchar(30),
	uf varchar(30),
	observacoes text,

	-- Criando uma restrição para o id do cliente
	-- pk -> Primary Key
	constraint pk_cln_idcliente primary key (idcliente)
);

-- Alterando o nome de uma coluna da tabela
alter table cliente rename column profissao to idprofissao;

-- Dados da coluna profissao
-- Estudante id  -> 1, 9, 10, 12, 15, 17
-- Engenheiro id -> 2
-- Pedreiro id   -> 3
-- Jornalista id -> 4, 5
-- Professor id  -> 6, 7, 8, 13
-- Null id 	     -> 11, 14

-- Apagando o campo da coluna profissao
alter table cliente drop idprofissao;

-- Criando um novo campo com o tipo correto de dado
alter table cliente add idprofissao integer;

-- Relacionando a chave estrangeira com a chave primária da tabela de profissao
alter table cliente add constraint fk_cln_idprofissao foreign key (idprofissao) references profissao (idprofissao);

-- Atualizando os dados do campo idprofissao
update cliente set idprofissao = 1 where idcliente in (1, 9, 10, 12, 15, 17); -- idprofissao 1 -> Estudante
update cliente set idprofissao = 2 where idcliente = 2; -- idprofissao 2 -> Engenheiro
update cliente set idprofissao = 3 where idcliente = 3; -- idprofissao 3 -> Pedreiro
update cliente set idprofissao = 4 where idcliente in (4, 5); -- idprofissao 4 -> Jornalista
update cliente set idprofissao = 5 where idcliente in (6, 7, 8, 13); -- idprofissaoo 5 -> Professor

-- Apagando os dados do campo de nacionalidade
alter table cliente drop nacionalidade;

-- Adicionando um novo campo na tabela
alter table cliente add idnacionalidade integer;

-- Criando a chave estrangeira do campo idnacionalidade da tabela cliente
alter table cliente add constraint fk_cln_idnacionalidade foreign key (idnacionalidade) references nacionalidade (idnacionalidade);

-- Atualizando os dados do campo idnacionalidade
update cliente set idnacionalidade = 1 where idcliente in (1, 2, 3, 4, 6, 10, 11, 14); --  idnacionalidade 1 -> Brasileira
update cliente set idnacionalidade = 2 where idcliente in (5, 7); -- idnacionalidade 2 -> Italiana
update cliente set idnacionalidade = 3 where idcliente = 8; -- idnacionalidade 3 -> Norte-americana
update cliente set idnacionalidade = 4 where idcliente in (9, 13); -- idnacionalidade 4 -> Alemã

-- Apagando os dados do campo complemento
alter table cliente drop complemento;

-- Adicionando um novo campo na tabela
alter table cliente add idcomplemento integer;

-- Criando uma chave estrangeira do campo complemento da tabela cliente
alter table cliente add constraint fk_cln_idcomplemento foreign key (idcomplemento) references complemento (idcomplemento);

-- Atualizando os dados do compo idcomplemento
update cliente set idcomplemento = 1 where idcliente in (1, 4, 9, 13); -- idcomplemento 1 -> Casa
update cliente set idcomplemento = 2 where idcliente in (2, 3,7); -- idcomplemento 2 -> Apartamento

-- Apagando os dados do campo bairro
alter table cliente drop bairro;

-- Adicionando um novo campo na tabela
alter table cliente add idbairro integer;

-- Criando uma nova chave estrangeira do campo bairro da tabela cliente
alter table cliente add constraint fk_cln_idbairro foreign key (idbairro) references bairro (idbairro);

-- Atualizando os dados do compo idbairro
update cliente set idbairro = 1 where idcliente in (1, 12, 13); -- idbairro 1 -> Cidade nova
update cliente set idbairro = 2 where idcliente in (2, 3, 6, 8, 9); -- idbairro 2 -> Centro
update cliente set idbairro = 3 where idcliente in (4, 5); -- idbairro 3 -> São Pedro
update cliente set idbairro = 4 where idcliente = 7; -- idbairro 4 -> Santa Rosa

-- Apagando os dados da colunas uf e municipio
alter table cliente drop municipio;
alter table cliente drop uf;

-- Adicionando um novo campo na tabela municipio
alter table cliente add idmunicipio integer;

-- Criando uma chave estrangeira para o idmunicipio
alter table cliente add constraint fk_cliente_municipio foreign key (idmunicipio) references municipio (idmunicipio);

-- Atualizando os dados do compo idmunicipio
update cliente set idmunicipio = 1 where idcliente in (1, 2, 10, 11); -- idmunicipio 1 -> Porto União
update cliente set idmunicipio = 2 where idcliente in (3, 12); -- idmunicipio 2 -> Canoinhas
update cliente set idmunicipio = 3 where idcliente = 4; -- idmunicipio 3 -> Porto Vitória
update cliente set idmunicipio = 4 where idcliente = 5; -- idmunicipio 4 -> General Carneiro
update cliente set idmunicipio = 5 where idcliente in (6, 13); -- idmunicipio -> São Paulo
update cliente set idmunicipio = 6 where idcliente = 7; -- idmunicipio -> Rio de Janeiro
update cliente set idmunicipio = 7 where idcliente = 8; -- idmunicipio -> Uberlândia
update cliente set idmunicipio = 8 where idcliente = 9; -- idmunicioio -> Porto Alegre
update cliente set idmunicipio = 9 where idcliente in (14, 15); -- idmunicipio -> União da Vitória 


-- ## Trabalhando com Joins ##
select 
	cln.nome as cliente, 
	prf.nome as profissao
from
	cliente as cln
left outer join -- Relacionando com a tabela que está na esquerda
	profissao as prf on cln.idprofissao = prf.idprofissao

-- Inner Join
select 
	cln.nome as cliente, 
	prf.nome as profissao
from
	cliente as cln
inner join -- Obriga que tenha um relacionamento entre as tabelas (dados null não aparecem)
	profissao as prf on cln.idprofissao = prf.idprofissao
