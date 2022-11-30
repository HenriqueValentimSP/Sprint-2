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
cnpj char(14),
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
quantidade int,
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
dthora dateTime,
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

insert into unidade(nomeUnidade, rua, numero, bairro, cep, complemento, cnpj, fkMatriz) values
	('Albert Einstein','evaldo calabrez','280', 'guaianases', '08411330', 'A','21234654000187', null),
    ('Salvaluz','alameda santos',426,'mooca',04516781,null,'12345123000180', null);
    
insert into unidade(nomeUnidade, rua, numero, bairro, cep, complemento, cnpj, fkMatriz) values
	('São Carlos', 'geraldo mitico', '65', 'Ferraz', '08330411', null,'64758234000198', 1),
    ('São Jose', 'Airton', '1200', 'Jose dos campos', '08450340','bloco B','16253476000198', 1),
	('Lumens','carmen',120,'suzano',0892179,'posto B','75647596000198',4),
	('Lumens2','forbi',10,'osasco',0893234,null,'98756423000118',4);


-- insert usuarios
-- idusuario, fkunidade, nome, sobrenome, cargo, senha, fkresponsavel
insert into usuario values
	(1,'Fernando', 'souza','gerente','fernando.souza@gmail.com','senha123', null, 1),
    (2,'Matheus', 'Prado','gerente','matheus.prado@gmail.com','senha321', null, 2);
    
insert into usuario values
	(3,'Pedro', 'Gonçalves','funcionario','pedro.goncalve@gmail.com','senha654', 1, 3),
    (4,'Lethicia', 'Ferraz','funcionario','lethicia.ferraz@gmail.com','senha456', 1, 4),
    (5,'Livia', 'silva','funcionario','livia.silva@gmail.com','senha789', 2, 5),
    (6,'Leonardo', 'Da Nave','funcionario','leonardo.danave@gmail.com','senha987', 2, 6);
    
insert into setor(nomeSetor, localSetor, fkUnidade) values
	('Grenciamento de remédio', 'setor 3',1),
    ('Controle de temperatura de remédio', 'ala 3',2),
    ('Gerenciamento de temperatura de remédio', 'setor 2',3),
    ('Gerenciamento de remédio', 'ala 5',4),
    ('controle de temperatura e umidade', 'setor 4',5),
    ('Grenciamento de remédio', 'ala 7',6);
    desc remedio;
insert into remedio(nomeRemedio, quantidade, valor,tempIdeal, umidIdeal, lote, validade, fkSetor) values
	('anastrozol', 10, 139.90, 20, 70, 33, '2024-08-09',1),
    ('ácido zoledrônico', 10, 139.90, 20, 70, 33, '2023-12-25',2),
    ('bicalutamida', 10, 139.90, 20, 70, 33, '2023-11-23',3),
    ('Douceno', 10, 139.90, 20, 70, 33, '2024-05-08',4),
    ('Corretal', 10, 139.90, 20, 70, 33, '2024-11-29',5),
    ('Dacarba', 10, 139.90, 20, 70, 33, '2025-03-05',6);
    

insert into sensor values
	(1, 'dht11', 20, 75,'2022-10-18 13:05:05', 1, 1),
    (2, 'dht11', 19, 72,'2022-10-18 13:05:10' , 2, 2),
    (3, 'dht11', 18, 70, '2022-10-18 13:05:15', 3, 3),
    (4, 'dht11', 23, 73, '2022-10-18 13:05:15',4, 4),
    (5, 'dht11', 24, 69, '2022-10-18 13:05:20',5, 5),
    (6, 'dht11', 20, 70, '2022-10-18 13:05:25',6, 6);
    
    
desc unidade;
desc usuario;
desc setor;
desc remedio;
desc sensor;

select * from unidade as u join unidade as m
	on u.fkMatriz = m.idUnidade join setor
		on setor.fkUnidade = u.idUnidade join remedio
			on remedio.fkSetor = idSetor join sensor
				on sensor.fkSetor = idSetor;
                
select * from usuario as f join usuario as r
	on f.fkResponsavel = r.idUsuario left join unidade 
		on f.fkUnidade = idUnidade;