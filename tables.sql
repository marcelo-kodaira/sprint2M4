-- Aqui você deve colocar os códigos SQL referentes à

CREATE TABLE IF NOT EXISTS produtos(
	id BIGSERIAL PRIMARY KEY,
	nome varchar(100) UNIQUE NOT NULL,
	preço float(8) NOT NULL,
	pts_de_lealdade integer NOT NULL
	tipo varchar(30) NOT NULL 
);

CREATE TABLE IF NOT EXISTS produtos_pedidos(
	id BIGSERIAL PRIMARY KEY,
	pedido_id integer NOT NULL,
	produto_id integer NOT NULL,
	FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE,
	FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS pedidos(
	id BIGSERIAL PRIMARY KEY,
	status varchar(50) NOT NULL,
	cliente_id INTEGER NOT NULL,
	FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS clientes( 
	id BIGSERIAL PRIMARY KEY,
	nome varchar(50) NOT NULL,
	lealdade integer NOT NULL
);
CREATE TABLE IF NOT EXISTS endereços(
	id BIGSERIAl PRIMARY KEY,
	cep varchar(9) NOT NULL,
	rua varchar(50) NOT NULL,
	numero integer NOT NULL,
	bairro varchar(50) NOT NULL,
	complemento varchar(100),
	cliente_id integer UNIQUE NOT NULL,
	FOREIGN KEY (cliente_id) REFERENCES clientes(id) ON DELETE CASCADE
);

