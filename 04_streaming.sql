--criação do db streaming
CREATE DATABASE streaming

-- criando a tabela de plano
CREATE TABLE plano(
    id_plano INTEGER PRIMARY KEY NOT NULL,
    preco FLOAT NOT NULL
)

-- criando a tabela de usuario
CREATE TABLE usuario(
    id_usuario INTEGER PRIMARY KEY NOT NULL,
    email VARCHAR(100) NOT NULL,
	id_plano INTEGER NOT NULL,
	  CONSTRAINT fk_usuario_plano
            FOREIGN KEY(id_plano) REFERENCES plano(id_plano)
)

-- criando a tabela de usuario_filme
CREATE TABLE usuario_filme(
    id_usuario INTEGER NOT NULL,
	id_filme INTEGER NOT NULL,
		CONSTRAINT fk_usuario_filme_usuario
			FOREIGN KEY(id_usuario) REFERENCES usuario(id_usuario),
		CONSTRAINT fk_usuario_filme_filme
			FOREIGN KEY(id_filme) REFERENCES filme(id_filme)			
)

-- criando a tabela de filme
CREATE TABLE filme(
    id_filme INTEGER PRIMARY KEY NOT NULL,
    titulo VARCHAR(80) NOT NULL,
	ano INTEGER NOT NULL,
	id_genero INTEGER NOT NULL,
	id_diretor INTEGER NOT NULL,
		CONSTRAINT fk_filme_genero
			FOREIGN KEY(id_genero) REFERENCES genero(id_genero),
		CONSTRAINT fk_filme_diretor
			FOREIGN KEY(id_diretor) REFERENCES diretor(id_diretor)			
)

-- criando a tabela de genero
CREATE TABLE genero(
    id_genero INTEGER PRIMARY KEY NOT NULL,
    nome VARCHAR(60) NOT NULL
)

-- criando a tabela de diretor
CREATE TABLE diretor(
    id_diretor INTEGER PRIMARY KEY NOT NULL,
    nome VARCHAR(60) NOT NULL
)