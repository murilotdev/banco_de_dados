-- crianção do db biblioteca
CREATE DATABASE biblioteca 

-- criando a tabela de editoras
CREATE TABLE editoras(
	id_editora SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL UNIQUE
)

--criando a tabela de autores
CREATE TABLE autores(
	id_autor SERIAL PRIMARY KEY,
	nome VARCHAR(60) NOT NULL 
)

--criando a tabela de livros
CREATE TABLE livros(
	id_livro SERIAL NOT NULL,
	nome_livro VARCHAR(100) NOT NULL,
	ano INTEGER,
	id_editora INTEGER NOT NULL,
	id_autor INTEGER NOT NULL,
		CONSTRAINT pk_livros
			PRIMARY KEY(id_livro),
		CONSTRAINT dominio_ano
			CHECK(ano BETWEEN 1950 AND 2026),
		CONSTRAINT fk_livros_editoras
			FOREIGN KEY(id_editora) REFERENCES editoras(id_editora),
		CONSTRAINT fk_livros_autores
			FOREIGN KEY(id_autor) REFERENCES autores(id_autor)	
)

-- renomeia coluna nome_livro
ALTER TABLE livros RENAME COLUMN nome_livro TO nome

-- add uma coluna isbn na tabela livros
ALTER TABLE livros ADD COLUMN isbn CHAR(20)

--exclui a coluna isbn na tabela de livros
ALTER TABLE livros DROP COLUMN isbn 