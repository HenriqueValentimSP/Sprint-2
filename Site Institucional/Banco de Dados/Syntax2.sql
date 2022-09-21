create database oncorg;
use oncorg;
create table remedios (idremedios int auto_increment primary key
, nome varchar(50), validade DATE, entrada Datetime, saida datetime
);
create table sensores (idsensores int auto_increment primary key
,tiposensor varchar(40),
unidademedida decimal(14.2));
create table setores (idsetor INT auto_increment primary key, 
andar INT, sala varchar(45));
use oncorg;
create table lista (idlista INT auto_increment primary key, 
email varchar(45), telefone1 varchar(45),telefone2 varchar(45));
create table clientes (idclientes INT auto_increment primary key, 
Empresa varchar(45), email varchar(45), login varchar(45),
 senha varchar(45));

