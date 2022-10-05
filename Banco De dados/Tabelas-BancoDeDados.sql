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

create table usuario(
idUsuario int,
nome varchar(45),
sobrenome varchar(45),
cargo varchar(45),
email varchar(45),
senha varchar(45),
fkResponsavel int,
foreign key (fkResponsavel) references usuario(idUsuario),
fkUnidade int,
foreign key (fkUnidade) references unidade(idUnidade),
primary key (idUsuario, fkUnidade)
);

-- INSERT UNIDADE

insert into unidade(nomeUnidade, rua, numero, bairro, cep, complemento, fkMatriz) values
	('Albert Einstein','evaldo calabrez','280', 'guaianases', '08411330', 'A', null); 
    
insert into unidade(nomeUnidade, rua, numero, bairro, cep, complemento, fkMatriz) values
	('São Carlos', 'geraldo mitico', '65', 'Ferraz', '08330411', null, 1),
    ('São Jose', 'Airton', '1200', 'Jose dos campos', '08450340','bloco B', 1);
    
insert into unidade(nomeUnidade, rua, numero, bairro, cep, complemento, fkMatriz) values
	('Salvaluz','alameda santos',426,'mooca',04516781,null,null);
    
    insert into unidade(nomeUnidade, rua, numero, bairro, cep, complemento, fkMatriz) values
	('Lumens','carmen',120,'suzano',0892179,'posto B',4),
	('Lumens2','forbi',10,'osasco',0893234,null,4);


-- insert usuarios
-- idusuario, fkunidade, nome, sobrenome, cargo, senha, fkresponsavel
insert into usuario values
(1,2,'Fernando', 'souza','usuario','45678',null);

    
    
    
    
    
    
    
    select * from unidade;
    
    
    -- matrizes e suas filiais
    
    select * from unidade as filial join unidade as matriz on filial.fkMatriz = Matriz.idUnidade;
    
    
    
    

