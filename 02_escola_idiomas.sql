-- crianção do db escola_idiomas
CREATE DATABASE escola_idiomas 

-- criando a tabela de professor
CREATE TABLE professor(
    cpf SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL
)

-- criando a tabela de disciplina
CREATE TABLE disciplina(
    id_disciplina SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL
)

-- criando a tabela de turma
CREATE TABLE turma(
    id_turma SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
	cpf INTEGER NOT NULL,
	id_disciplina INTEGER NOT NULL,
		CONSTRAINT fk_turma_professor
            FOREIGN KEY(cpf) REFERENCES professor(cpf),
		CONSTRAINT fk_turma_disciplina
            FOREIGN KEY(id_disciplina) REFERENCES disciplina(id_disciplina)
)

CREATE TABLE aluno(
    matricula SERIAL PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
	id_turma INTEGER NOT NULL,
		CONSTRAINT fk_aluno_turma
            FOREIGN KEY(id_turma) REFERENCES turma(id_turma)
)
