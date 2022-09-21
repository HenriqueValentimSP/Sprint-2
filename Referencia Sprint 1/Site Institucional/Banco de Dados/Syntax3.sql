create database oncorg;
use oncorg;
CREATE TABLE remedios (
    idremedios INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    validade DATE,
    entrada DATETIME,
    saida DATETIME
);
CREATE TABLE sensores (
    idsensores INT AUTO_INCREMENT PRIMARY KEY,
    tiposensor VARCHAR(40),
    unidademedida DECIMAL(14.2)
);
CREATE TABLE setores (
    idsetor INT AUTO_INCREMENT PRIMARY KEY,
    andar INT,
    sala VARCHAR(45)
);
use oncorg;
CREATE TABLE lista (
    idlista INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(45),
    telefone1 VARCHAR(45),
    telefone2 VARCHAR(45)
);
CREATE TABLE clientes (
    idclientes INT AUTO_INCREMENT PRIMARY KEY,
    Empresa VARCHAR(45),
    email VARCHAR(45),
    login VARCHAR(45),
    senha VARCHAR(45)
);
insert into remedios (nome, validade, entrada, saida) values
('Dacarbazina','2024-09-05','2022-09-05 14:42:36','2022-10-07 17:24:12');

SELECT 
    *
FROM
    remedios;
    
insert into remedios (nome, validade, entrada, saida) values
('Asparaginase','2025-10-06','2022-07-10 13:25:41','2022-12-05 18:45:27'),
('Carboplatin', '2024-08-25', '2022-05-15 12:22:43', '2022-11-23 14:35:26');

SELECT 
    *
FROM
    remedios;

alter table sensores add unidademedida2 decimal;

SELECT 
    *
FROM
    sensores;
    
insert into setores (andar, sala) values
('3', 'A'),
('3', 'B'),
('4', 'A');

SELECT 
    *
FROM
    setores;
    
insert into lista (email, telefone1, telefone2) values
('rodolfoduarte@sptech.school', '11 912345678', '11 987654321'),
('mathiasvieira@sptech.school', '11 912335678', '11 987653321'),
('joaoantonio@sptech.school', '11 922345678', '11 987654322');
insert into clientes (empresa, email, login, senha) values
('Drogasil', 'drogasil@gmail.com', 'Drogasil', 'Drogasil123'),
('UltraFarma', 'Ultrafarma@gmail.com', 'UltraFarma', 'Ultr4F4rm4123'),
('Drogaria São Paulo', 'DrogariaSP@gmail.com', 'DrogariaSP', 'Drog4ri4SP123');

CREATE TABLE Registros (
    idRegistro INT PRIMARY KEY AUTO_INCREMENT,
    Valor1 DECIMAL,
    Valor2 DECIMAL,
    Setor VARCHAR(10)
)