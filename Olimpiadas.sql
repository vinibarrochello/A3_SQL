CREATE DATABASE IF NOT EXISTS OlimpiadaSistema;

USE OlimpiadaSistema;

CREATE TABLE IF NOT EXISTS Competidor(
	CompetidorId int AUTO_INCREMENT NOT NULL,
    CompetidorNome varchar(255) NOT NULL,
    PRIMARY KEY(CompetidorId)
);

-- Para evitar problemas no BD, as imagens são guardadas em um sistema de gerenciamento de arquivos e apenas o caminho da imagem é salvo no BD
CREATE TABLE IF NOT EXISTS Modalidade(
	ModalidadeId int AUTO_INCREMENT NOT NULL,
    ModalidadeNome varchar(255) NOT NULL,
    ModalidadeImagem text,
    PRIMARY KEY(ModalidadeId)
);

-- Essa tabela é responsável pela relação entre competidores e a modalidade, permitindo assim que um competidor participe de mais de uma modalidade
CREATE TABLE IF NOT EXISTS ModalidadeResultado(
    CompetidorId int NOT NULL,
    ModalidadeId int NOT NULL,
    CompetidorNota float NOT NULL,
    CONSTRAINT PK_CompetidorModalidade PRIMARY KEY (CompetidorId,ModalidadeId),
	FOREIGN KEY (CompetidorId) REFERENCES Competidor(CompetidorId),
    FOREIGN KEY (ModalidadeId) REFERENCES Modalidade(ModalidadeId)
);