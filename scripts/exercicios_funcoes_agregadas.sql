-- 1. A média dos valores de vendas dos vendedores que venderam mais que R$ 200,00.
select idvendedor, avg(valor) from pedido group by idvendedor having avg(valor) > 200;

-- 2. Os vendedores que venderam mais que R$ 1500,00.
select idvendedor, sum(valor) from pedido group by idvendedor having sum(valor) > 1500;

-- 3. O somatório das vendas de cada vendedor.
select idvendedor, sum(valor) from pedido group by idvendedor;

-- 4. A quantidade de municípios.
select count(idmunicipio) from municipio;

-- 5. A quantidade de municípios que são do Paraná ou de Santa Catarina.
select * from uf; --id_uf PR = 2 | iduf SC = 1
select count(idmunicipio) from municipio where iduf = 1 or iduf = 2;

-- 6. A quantidade de municípios por estado.
select iduf, count(idmunicipio) from municipio group by iduf;

-- 7. A quantidade de clientes que informaram o logradouro.
select * from cliente;
select count(idcliente) from cliente where logradouro is not null;

-- 8. A quantidade de clientes por município.
select idmunicipio,  count(idcliente) from cliente group by idmunicipio;

-- 9. A quantidade de fornecedores.
select count(idfornecedor) from fornecedor;

-- 10. A quantidade de produtos por fornecedor.
select idfornecedor, count(idproduto) from produto group by idfornecedor;

-- 11. A média de preços dos produtos do fornecedor Cap. Computadores.
select * from fornecedor; -- id Cap. Computadores = 1
select avg(valor) from produto where idfornecedor = 1;

-- 12. O somatório dos preços de todos os produtos.
select sum(valor) from produto;

-- 13. O nome do produto e o preço somente do produto mais caro.
select nome, valor from produto order by valor desc limit 1;

-- 14. O nome do produto e o preço somente do produto mais barato.
select nome, valor from produto order by valor asc limit 1;

-- 15. A média de preço de todos os produtos.
select avg(valor) from produto;

-- 16. A quantidade de transportadoras.
select count(idtransportadora) from transportadora;

-- 17. A média do valor de todos os pedidos.
select avg(valor) from pedido;

-- 18. O somatório do valor do pedido agrupado por cliente.
select idcliente, sum(valor) from pedido group by idcliente;

-- 19. O somatório do valor do pedido agrupado por vendedor.
select idvendedor, sum(valor) from pedido group by idvendedor;

-- 20. O somatório do valor do pedido agrupado por transportadora.
select idtransportadora, sum(valor) from pedido group by idtransportadora;
