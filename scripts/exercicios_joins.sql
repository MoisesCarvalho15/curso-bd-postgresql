-- 1. O nome do cliente, a profissão, a nacionalidade, o logradouro, o número, o complemento, 
-- o bairro, o município e a unidade de federação.

select 
	cliente.nome as cliente, 
	profissao.nome as profissao,
	nacionalidade.nome as nacionalidade,
	cliente.logradouro, cliente.numero, 
	complemento.nome as complemento,
	bairro.nome as bairro,
	municipio.nome as municipio,
	uf.sigla
from cliente
left outer join
	profissao on cliente.idprofissao = profissao.idprofissao
left outer join 
	nacionalidade on cliente.idnacionalidade = nacionalidade.idnacionalidade
left outer join
	complemento on cliente.idcomplemento = complemento.idcomplemento
left outer join
	bairro on cliente.idbairro = bairro.idbairro
left outer join
	municipio on cliente.idmunicipio = municipio.idmunicipio
left outer join
	uf on municipio.iduf = uf.iduf;

-- 2. O nome do produto, o valor e o nome do fornecedor.
select 
	produto.nome as produto, 
	produto.valor, 
	fornecedor.nome as fornecedor
from produto
left outer join
	fornecedor on produto.idfornecedor = fornecedor.idfornecedor;

-- 3. O nome da transportadora e o município.
select 
	transportadora.nome as transportadora, 
	municipio.nome as municipio
from transportadora
left outer join
	municipio on transportadora.idmunicipio = municipio.idmunicipio;

-- 4. A data do pedido, o valor, o nome do cliente, o nome da transportadora e o nome do vendedor.
select 
	pedido.data_pedido,
	pedido.valor,
	cliente.nome as cliente,
	transportadora.nome as transportadora,
	vendedor.nome as vendedor
from pedido
left outer join
	cliente on pedido.idcliente = cliente.idcliente
left outer join
	transportadora on pedido.idtransportadora = transportadora.idtransportadora
left outer join
	vendedor on pedido.idvendedor = vendedor.idvendedor;

-- 5. O nome do produto, a quantidade e o valor unitário dos produtos do pedido.
select 
	produto.nome as produto,
	pedido_produto.quantidade,
	pedido_produto.valor_unitario
from pedido_produto
left outer join
	produto on pedido_produto.idproduto = produto.idproduto;

-- 6. O nome dos clientes e a data do pedido dos clientes que fizeram algum pedido (ordenado pelo nome do cliente)
select
	cliente.nome, 
	pedido.data_pedido
from pedido
left outer join
	cliente on pedido.idcliente = cliente.idcliente
order by cliente.nome asc;

-- 7. O nome dos clientes e a data do pedido de todos os clientes, independente se tenham feit pedido (ordenado pelo nome do cliente)
select
	cliente.nome,
	pedido.data_pedido
from cliente
left outer join
	pedido on pedido.idcliente = cliente.idcliente
order by cliente.nome;

-- 8. O nome da cidade e a quantidade de clientes que moram naquela cidade.
select 
	municipio.nome as municipio, 
	count(cliente.idcliente) as quantidade
from cliente
left outer join
	municipio on cliente.idmunicipio = municipio.idmunicipio
group by municipio.idmunicipio;

-- 9. O nome do fornecedor e a quantidade de produtos de cada fornecedor.
select 
	fornecedor.nome as fornecedor, 
	count(produto.idfornecedor)
from produto
left outer join
	fornecedor on produto.idfornecedor = fornecedor.idfornecedor
group by fornecedor.nome;

-- 10.O nome do cliente e o somatório do valor do pedido (agrupado por cliente).
select 
	cliente.nome as cliente, 
	sum(valor) as total
from pedido
left outer join
	cliente on pedido.idcliente = cliente.idcliente
group by cliente.nome;

-- 11.O nome do vendedor e o somatório do valor do pedido (agrupado por vendedor).
select 
	vendedor.nome as vendedor, 
	sum(valor) as total
from pedido
left outer join
	vendedor on pedido.idvendedor = vendedor.idvendedor
group by vendedor.nome;

-- 12.O nome da transportadora e o somatório do valor do pedido (agrupado por transportadora).
select
	transportadora.nome as transportadora, 
	sum(valor) as total
from pedido
inner join
	transportadora on pedido.idtransportadora = transportadora.idtransportadora
group by transportadora.nome;

-- 13.O nome do cliente e a quantidade de pedidos de cada um (agrupado por cliente).
select
	cliente.nome as cliente, 
	count(pedido.idpedido) as total
from pedido
left outer join
	cliente on pedido.idcliente = cliente.idcliente
group by cliente.nome;

-- 14.O nome do produto e a quantidade vendida (agrupado por produto).
select
	produto.nome as produto, 
	sum(quantidade) as total
from pedido_produto
left outer join
	produto on pedido_produto.idproduto = produto.idproduto
group by produto.nome;

-- 15.A data do pedido e o somatório do valor dos produtos do pedido (agrupado pela data do pedido).
select
	pedido.data_pedido,
	sum(pedido_produto.valor_unitario) as total
from
	pedido_produto
left outer join
	pedido on pedido_produto.idpedido = pedido.idpedido
group by pedido.data_pedido;

-- 16.A data do pedido e a quantidade de produtos do pedido (agrupado pela data do pedido).
select
	pedido.data_pedido,
	sum(pedido_produto.quantidade) as quantidade
from
	pedido_produto
left outer join
	pedido on pedido_produto.idpedido = pedido.idpedido
group by pedido.data_pedido;