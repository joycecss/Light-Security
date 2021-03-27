create database lightSecurity;
use lightSecurity;
create table cliente(
	id_registro int primary key auto_increment,
    tipo varchar(40),
    check (tipo = 'GCM' or tipo = 'Demutram'),
	municipio varchar(40), /* Municipio que se encontra o carro */
    emprestimo varchar (40),
     check (emprestimo = 'Sim' or emprestimo = 'Não'),
	placa varchar(40),
    fk_usuario int,
    foreign key (fk_usuario) references usuario(id_usuario),
	fk_sensor int,
    foreign key (fk_sensor) references sensor(id_sensor)
);
desc cliente;
insert into cliente values (1,'GCM', 'Maua', 'Não', 'eas2354',1,1);
insert into cliente values (null,'Demutram', 'Diadema', 'Sim', 'eej2308',2,2);
select * from cliente;