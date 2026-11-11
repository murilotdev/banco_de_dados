-- crianção do db loja_online
CREATE DATABASE loja_online

-- criando a tabela de cliente
CREATE TABLE cliente(
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL
)

-- criando a tabela de produto
CREATE TABLE produto(
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
	preco FLOAT NOT NULL
)

-- criando a tabela de pedido
CREATE TABLE pedido(
    id_pedido SERIAL PRIMARY KEY,
    data_pedido DATE NOT NULL,
	id_cliente INTEGER NOT NULL
	   CONSTRAINT fk_pedido_cliente
            FOREIGN KEY(id_cliente) REFERENCES cliente(id_cliente),
)

-- criando a tabela de produto
CREATE TABLE produto(
    id_produto SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
	preco FLOAT NOT NULL
	   CONSTRAINT fk_livros_CAT
            FOREIGN KEY(id_editora) REFERENCES editoras(id_editora),
)

-- criando a tabela de categoria
CREATE TABLE produto(
    id_categoria SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
)
