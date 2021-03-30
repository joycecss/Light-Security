create database lightSecurity;
use lightSecurity;

/* Tabela Cadastro */
create table cadastro (
id_rg varchar(12) primary key,
Nome varchar(70),
Patente varchar(20),
Sexo varchar(9)-- Masculino Feminino 
check ( Sexo = 'Feminino' or Sexo = 'Maculino' or Sexo = 'Outro'),
CEP varchar(10),
Numero int
);
/* Tabela Usuario */
create table usuarios (
	id_usuario int primary key auto_increment,
    email varchar (40),
    senha varchar (10),
    fk_rg varchar(12), -- chave estrangeira referente a tabela Cadastro
	foreign key (fk_rg) references cadastro(id_rg)
) auto_increment = 1;
/* Tabela Cliente */
create table cliente(
	id_registro int primary key auto_increment,
    tipo varchar(40),
    check (tipo = 'GCM' or tipo = 'Demutram'),
	municipio varchar(40), /* Municipio que se encontra o carro */
    emprestimo varchar (40),
     check (emprestimo = 'Sim' or emprestimo = 'Não'),
	placa varchar(40),
    fk_usuario int,
    foreign key (fk_usuario) references usuarios(id_usuario)
);
/* Tabela Endereço */
create table endereco(
id_cep int primary key auto_increment,
uf varchar(2),
municipio varchar(50),
bairro varchar(40),
logradouro varchar (40),
numero int
) auto_increment = 100;
/* Tabela Sensor */
create table sensor (
	id_sensor int primary key auto_increment,
    status varchar(30),
    check (status = 'ativo' or 'inativo'),
    descricao varchar (50), -- quebrado, manutenção...
    tipo_sensor varchar (30),
    fk_registro int,
    foreign key (fk_registro) references cliente(id_registro)
); 
-- update tabela cliente após criação tabela sensor
alter table cliente add fk_sensor int;
alter table cliente add  foreign key (fk_sensor) references sensor(id_sensor);

/* Tabela Historico */
create table historico(
id_historico int primary key auto_increment,
Data_Hora datetime default current_timestamp,
Descrição varchar(75),
Taxa_Criminalidade char(1)
check (Taxa_Criminalidade = 'A' or Taxa_Criminalidade = 'M' or Taxa_Criminalidade = 'B'), -- A = Alta, M = Média e B = Baixa -->
fk_sensor int,
foreign key (fk_sensor) references Sensor(id_sensor),
fk_cep int,
foreign key (fk_cep) references endereco(id_cep)
)auto_increment = 100;

/* Insert */
insert into usuarios (email, senha) values ('aaaa@bbb.com.br', 'Mqwertyuiop'); -- ok

insert into cliente (tipo, municipio, emprestimo, placa) values ('GCM', 'Maua', 'Não', 'eas2354'); -- ok
insert into cliente (tipo, municipio, emprestimo, placa) values ('Demutram', 'Diadema', 'Sim', 'eej2308'); -- ok
update cliente set fk_usuario = (id_usuario);

insert into endereco values
(null, "sp", "são paulo", "mooca", "rua cuiaba", "340"); -- insert ok

insert into historico (id_historico, Data_Hora, Descrição, Taxa_Criminalidade) values
(null,'2021-02-01 01:10:47','Local com luzes falhando','M'),
(null,'2021-02-10 14:46:30','Local bastate iluminado','B'),
(null,'2021-02-20 00:20:35','Luzes quebradas','A'),
(null,'2021-03-05 22:15:11','Local necessita de atenção','A'),
(null,'2021-03-15 18:52:05','Pouca iluminação','A'),
(null,'2021-03-20 23:22:01','Local com luzes falhando','M'),
(null,'2021-03-25 19:04:58','Cuidado,local com possibilidade de assaltos','A'),
(null,'2021-03-27 08:11:39','Rua bem iluminada','B'),
(null,'2021-03-28 10:50:00','Local com extrema vigilância','B'),
(null,'2021-03-30 03:25:47','Local possui algumas lampadas quebradas','M'); -- ok


/* Select */
select * from historico; -- ok
select sensor.*, historico.* from historico join sensor on (historico.fk_sensor = sensor.id_sensor); 
select sensor.*, cliente.* from sensor join cliente on (fk_registro = id_registro); 
select * from endereco; -- ok
select * from cliente; -- ok
select * from usuarios; -- ok

/* drop */
drop database lightsecurity; -- ok