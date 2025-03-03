 create table profissao (
	idprofissao integer not null,
	nome varchar(30) not null,

	constraint pk_prf_idprofissao primary key (idprofissao),
	constraint un_prf_nome unique (nome) -- Os nomes serão únicos
 );

-- Visualizando as profissões da tabela cliente
 select profissao from cliente;

 -- Inserindo as profissoes na tabela profissão
 insert into profissao (idprofissao, nome) values (1, 'Estudante');
 insert into profissao (idprofissao, nome) values (2, 'Engenheiro');
 insert into profissao (idprofissao, nome) values (3, 'Pedreiro');
 insert into profissao (idprofissao, nome) values (4, 'Jornalista');
 insert into profissao (idprofissao, nome) values (5, 'Professor');

-- Visualizando a tabela de profissao
select * from profissao;