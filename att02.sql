create database oficina;


use oficina;


show tables;

create table Maquina (
	num_registro int primary key,
	ano_fabricacao varchar(4) not null,
	horas_uso int not null,
	modelo varchar(50) not null
);



create table Modelo (
	codigo_modelo int primary key,
	tipo varchar(50) not null,
	peso decimal not null,
	fabricante varchar(50) not null,
	hora_teste time not null
);

create table Fabricante (
	codigo bigint primary key,
	nome varchar(100) not null,
	telefone varchar(30),
	email varchar(100) not null unique,
	responsavel varchar(100)
);


show tables;

alter table Modelo add foreign key
Modelo(codigo_modelo) references 
Fabricante(codigo);


