-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)

INSERT INTO
	clientes(nome,lealdade)
VALUES
	('Georgia',0);

-- 2)

INSERT INTO
	pedidos(status, cliente_id)
VALUES
	('Recebido', 6);

-- 3)
INSERT INTO
	produtos_pedidos(pedido_id, produto_id)
VALUES
	('6', '1'),
	('6', '2'),
	('6', '6'),
	('6', '8'),
	('6', '8');

-- Leitura

-- 1)
SELECT 
	clientes.id,
	clientes.nome,
	clientes.lealdade,
	pedidos.id,
	pedidos.status,
	pedidos.cliente_id,
	pedidos.id,
	produtos.nome,
	produtos.tipo,
	produtos.preço,
	produtos.pts_de_lealdade,
FROM
	produtos
	INNER JOIN produtos_pedidos ON produtos.id = produtos_pedidos.produto_id
	INNER JOIN pedidos ON produtos_pedidos.pedido_id  = pedidos.id
	INNER JOIN clientes ON pedidos.cliente_id = clientes.id
WHERE
	clientes.nome ILIKE 'Georgia'

-- Atualização

-- 1)

UPDATE 
	clientes c
SET
	lealdade = ( 
				SELECT 
					sum(produtos.pts_de_lealdade)
				FROM
					produtos
					INNER JOIN produtos_pedidos ON produtos.id = produtos_pedidos.produto_id
					INNER JOIN pedidos ON produtos_pedidos.pedido_id  = pedidos.id
					INNER JOIN clientes ON pedidos.cliente_id = clientes.id
				WHERE
					pedidos.id = 6
				)
WHERE
	nome ILIKE 'Georgia'
RETURNING *

-- Deleção

-- 1)
DELETE FROM
	clientes
WHERE
	clientes.nome ILIKE 'Marcelo'




