-- 1
SELECT
	pedidos.id,
	pedidos.status,
	pedidos.cliente_id,
	pedidos.id,
	produtos.nome,
	produtos.tipo,
	produtos.preço,
	produtos.pts_de_lealdade
FROM
	produtos
	INNER JOIN produtos_pedidos ON produtos.id = produtos_pedidos.produto_id
	INNER JOIN pedidos ON produtos_pedidos.pedido_id  = pedidos.id;

-- 2
SELECT 
	pedidos.id
FROM
	produtos
	INNER JOIN produtos_pedidos ON produtos.id = produtos_pedidos.produto_id
	INNER JOIN pedidos ON produtos_pedidos.pedido_id  = pedidos.id
WHERE
	produtos.nome LIKE 'Fritas'
GROUP BY pedidos.id


-- 3
SELECT 
	clientes.nome
FROM
	produtos
	INNER JOIN produtos_pedidos ON produtos.id = produtos_pedidos.produto_id
	INNER JOIN pedidos ON produtos_pedidos.pedido_id  = pedidos.id
	INNER JOIN clientes ON pedidos.cliente_id = clientes.id 
WHERE
	produtos.nome LIKE 'Fritas'
GROUP BY clientes.nome

-- 4
SELECT 
	sum(produtos.preço)
FROM
	produtos
	INNER JOIN produtos_pedidos ON produtos.id = produtos_pedidos.produto_id
	INNER JOIN pedidos ON produtos_pedidos.pedido_id  = pedidos.id
	INNER JOIN clientes ON pedidos.cliente_id = clientes.id 
WHERE
	clientes.nome LIKE 'Laura'
GROUP BY clientes.nome

-- 5
SELECT
	produtos.nome,
	COUNT(pedidos.id) 
FROM
	produtos
	INNER JOIN produtos_pedidos ON produtos.id = produtos_pedidos.produto_id
	INNER JOIN pedidos ON produtos_pedidos.pedido_id  = pedidos.id
	INNER JOIN clientes ON pedidos.cliente_id = clientes.id 
GROUP BY
	produtos.nome