CREATE DATABASE IF NOT EXISTS oficina;

USE oficina;

SHOW TABLES;

CREATE TABLE IF NOT EXISTS oficina(
	id_oficina int primary key auto_increment,
    cnpj varchar(14) not null,
    nome varchar(100) not null,
    responsavel varchar(100) not null,
    telefone varchar(15) not null,
    email varchar(100) not null unique
);

CREATE TABLE IF NOT EXISTS maquina (
	id_registro int primary key auto_increment,
    ano_fabricacao varchar(4) not null,
    horas_uso time not null,
    codigo_modelo bigint not null
);

CREATE TABLE IF NOT EXISTS modelo(
	codigo_modelo bigint primary key,
    tipo_modelo varchar(50) not null,
    peso decimal(10, 2) default(1),
    codigo_fabricante int not null,
    hora_teste time not null
);

CREATE TABLE IF NOT EXISTS fabricante(
	id_fabricante int primary key auto_increment,
    nome varchar(100) not null,
    telefone varchar(15) not null,
    email varchar(100) not null unique,
    responsavel varchar(100) not null
);

CREATE TABLE IF NOT EXISTS tecnico(
	codigo_funcional int primary key auto_increment,
    endereco varchar(100) not null,
    telefone varchar(15) not null,
    salario decimal(10, 2) not null,
    qualificacao varchar(50) not null
);
ALTER TABLE tecnico ADD COLUMN 
codigo_oficina int not null;

CREATE TABLE IF NOT EXISTS teste(
	id_teste int primary key auto_increment,
    pontuacao bigint not null,
    resultado bigint not null,
    recomendacoes varchar(100) not null
);
ALTER TABLE teste 
ADD COLUMN id_oficina int not null AFTER id_teste,
ADD COLUMN id_tecnico int not null AFTER id_oficina;

#Maquina possui Modelo
ALTER TABLE maquina ADD FOREIGN KEY
maquina(codigo_modelo) references
modelo(codigo_modelo);

#Modelo tem fabricante
ALTER TABLE modelo ADD FOREIGN KEY
modelo(codigo_fabricante) references
fabricante(id_fabricante);

#Oficina acolhe Modelo
CREATE TABLE IF NOT EXISTS modelo_oficina(
	codigo_modelo bigint not null,
    id_oficina int not null,
    PRIMARY KEY(codigo_modelo, id_oficina),
    CONSTRAINT fk_mod FOREIGN KEY (codigo_modelo) REFERENCES modelo(codigo_modelo),
    CONSTRAINT fk_ofi FOREIGN KEY (id_oficina) REFERENCES oficina(id_oficina)
);

#Oficina controla Teste e Tecnico faz Teste
ALTER TABLE teste 
ADD CONSTRAINT fk_teste_oficina
FOREIGN KEY (id_oficina) REFERENCES oficina(id_oficina),
ADD CONSTRAINT fk_teste_tecnico
FOREIGN KEY (id_tecnico) REFERENCES tecnico(codigo_funcional);

#Tecnico trabalha na Oficina
ALTER TABLE tecnico ADD FOREIGN KEY
tecnico(codigo_oficina) references
oficina(id_oficina);

#Tecnico perito em Modelo
CREATE TABLE IF NOT EXISTS tecnico_modelo(
	codigo_funcional int not null,
    codigo_modelo bigint not null,
    PRIMARY KEY(codigo_funcional, codigo_modelo),
    CONSTRAINT fk_codigo_funcional FOREIGN KEY (codigo_funcional) REFERENCES tecnico(codigo_funcional),
    CONSTRAINT fk_codigo_modelo FOREIGN KEY (codigo_modelo) REFERENCES modelo(codigo_modelo)
);

show tables;