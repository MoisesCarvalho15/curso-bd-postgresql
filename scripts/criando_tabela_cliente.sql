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
