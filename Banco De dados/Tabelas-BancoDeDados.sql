create database oncotech;
use oncotech;

create table unidade(
idUnidade int primary key auto_increment,
nomeUnidade varchar(45),
rua varchar(45),
numero varchar(45),
bairro varchar(45),
cep char(8),
complemento varchar(45),
fkMatriz int,
foreign key (fkMatriz) references unidade(idUnidade)
);

create table setor(
idSetor int auto_increment,
nomeSetor varchar(45),
localSetor varchar(45),
fkUnidade int,
foreign key (fkUnidade) references unidade(idUnidade),
primary key (idSetor,fkUnidade)
);

create table remedio(
idRemedio int primary key auto_increment,
nomeRemedio varchar (45),
quantidade varchar (45),
valor decimal(7,2),
tempIdeal decimal(5,2),
umidIdeal decimal(5,2),
lote varchar(45),
validade date,
fkSetor int,
foreign key (fkSetor) references setor(idSetor)
);

create table sensor(
idSensor int,
nomeSensor varchar(45),
temperatura decimal(5,2),
umidade decimal(5,2),
fkSetor int,
fkUnidade int,
foreign key (fkSetor) references setor(idSetor),
foreign key (fkUnidade) references unidade(idUnidade),
primary key (idSensor,fkSetor,fkUnidade) 
);

