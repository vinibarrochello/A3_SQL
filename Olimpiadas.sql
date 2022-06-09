create table Usuario(
	UserID int not null IDENTITY,
	UserName varchar(20) NOT NULL,
	UserPwd varchar(64) NOT NULL,
	UserSalt varchar(64) NOT NULL,
	UserType varchar(15),
	PRIMARY KEY (UserID)
);

create table Atleta(
	AtlId int not null IDENTITY,
	AtlNome varchar(100),
	AtlNacionalidade varchar(30),
	AtlAltura int,
	AtlPeso decimal(5,2),
	AtlDtaNasc date,
	AtlUserID int,
	PRIMARY KEY (AtlId),
	CONSTRAINT FK_AtlID FOREIGN KEY (AtlUserID) REFERENCES Usuario(UserID)
);

create table Equipe(
	EquipeID int NOT NULL IDENTITY,
	EquipeNome varchar(50),
	EquipeTreinador varchar(50),
	EquipeUserID int,
	PRIMARY KEY (EquipeID),
	CONSTRAINT FK_EquipeID FOREIGN KEY (EquipeUserID) REFERENCES Usuario(UserID)
);

create table EquipeAtleta(
	EquipeID int NOT NULL,
	AtlId int NOT NULL,
	CONSTRAINT FK_EquipeAtlID FOREIGN KEY (EquipeID) REFERENCES Equipe(EquipeID),
	CONSTRAINT FK_AtlEquipeID FOREIGN KEY (AtlId) REFERENCES Atleta(AtlId),
	PRIMARY KEY (EquipeID, AtlId)
);

create table Modalidade(
	ModId INT NOT NULL IDENTITY,
	ModNome varchar(100) NOT NULL,
	ModDesc varchar(200),
	ModImagePath text,
	PRIMARY KEY (ModId)
);

create table Evento(
	EventoID int NOT NULL IDENTITY,
	EventoData date,
	ModId int,
	CONSTRAINT FK_EventoID FOREIGN KEY (ModId) REFERENCES Modalidade(ModId),
	PRIMARY KEY (EventoID)
);

create table Registro(
	RegistroID int NOT NULL IDENTITY,
	EventoID int NOT NULL,
	EquipeID int NOT NULL,
	Pontuacao varchar(50)
	CONSTRAINT FK_EquipeReg FOREIGN KEY (EquipeID) REFERENCES Equipe(EquipeID),
	CONSTRAINT FK_EventoReg FOREIGN KEY (EventoID) REFERENCES Evento(EventoID),
);
