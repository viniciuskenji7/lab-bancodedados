create database if not exists biblioteca;

use biblioteca;


create table if not exists categoriaLeitor(
	codigoCategoriaLeitor bigint primary key,
	nome varchar(100) not null,
	dias int default(1) not null
);

create table if not exists funcionario(
	codigoFuncionario bigint primary key,
	nome varchar(100) not null,
	email varchar(200) unique not null,
	documento varchar(50),
	telefone varchar(30),
	cidade varchar(50),
	estado varchar(30),
	endereco varchar(200),
	nascimento date
);

create table if not exists categoriaObra(
	codigoCategoriaObra bigint primary key,
	nome varchar(100) not null
);

create table if not exists obra(
	codigoObra bigint primary key,
	isbn varchar(100) unique not null,
	titulo varchar(100) not null,
	autor varchar(100),
	keywords varchar(200),
	dataPublica date not null,
	paginas int default 1,
	editora varchar(100),
	fkCodigoCategoriaObra bigint,
	
	foreign key (fkCodigoCategoriaObra) 
	references categoriaObra(codigoCategoriaObra)
);

create table if not exists copia(
	codigoCopia bigint primary key,
	situacao varchar(100),
	descritiva varchar(300),
	fkCodigoObra bigint,
	
	foreign key (fkCodigoObra) 
	references obra(codigoObra)
);

create table if not exists leitor(
	codigoLeitor bigint primary key,
	nome varchar(100) not null,
	email varchar(200) unique not null,
	documento varchar(50),
	telefone varchar(20),
	cidade varchar(100),
	estado varchar(100),
	endereco varchar(200),
	nascimento date,
	fkCodigoCategoriaLeitor bigint,
	
	foreign key (fkCodigoCategoriaLeitor) 
	references categoriaLeitor(codigoCategoriaLeitor)
);

create table if not exists reserva(
	codigoReserva bigint primary key,
	dataReserva date not null,
	dataPrevista date not null,
	situacao varchar(200),
	fkCodigoObra bigint,
	fkCodigoLeitor bigint,
	
	foreign key (fkCodigoObra) 
	references obra(codigoObra),
	
	foreign key (fkCodigoLeitor) 
	references leitor(codigoLeitor)
);

create table if not exists emprestimo(
	codigoEmprestimo bigint primary key,
	dataEmprestimo date not null,
	dataPrevisto date not null,
	dataDevolvido date,
	situacao varchar(100),
	multa decimal(15,2) default 0,
	fkCodigoCopia bigint,
	fkCodigoFuncionario bigint,
	fkCodigoLeitor bigint,
	
	foreign key (fkCodigoCopia) 
	references copia(codigoCopia),
	
	foreign key (fkCodigoFuncionario) 
	references funcionario(codigoFuncionario),
	
	foreign key (fkCodigoLeitor) 
	references leitor(codigoLeitor)
);
