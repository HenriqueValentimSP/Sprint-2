create database sprint2;
use sprint2;

create table remedio(
idRemedio int primary key auto_increment,
nome varchar(45),
tempIdeal decimal(3,2),
umiIdeal decimal(3,2),
fkSetor int,
foreign key (fkSetor) references setor(idSetor)
);

create table setor (
idSetor int auto_increment,
nome varchar(45),
andar varchar(5),
ala varchar(45),
temp decimal (5,2),
umid decimal (5,2),
fkEmpresa int,
foreign key (fkEmpresa) references empresa (idEmpresa),
primary key (idSetor,fkEmpresa)
);

create table empresa (
idEmpresa int primary key auto_increment,
nome varchar(45),
email varchar(45),
cnpj char(14),
responsavel varchar(45)
);

create table usuario(
idUsuario int auto_increment,
nome varchar(45),
email varchar(45),
senha varchar(45),
cargo varchar(45),
fkEmpresa int,
foreign key (fkEmpresa) references empresa (idEmpresa),
primary key (idUsuario, fkEmpresa)
);

create table registro(
idRegistro int auto_increment,
dtData date,
hora time,
fk
