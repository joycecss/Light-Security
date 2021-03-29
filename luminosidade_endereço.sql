create database luminosidade; 

use luminosidade;


create table endereco(
Id_cep int primary key auto_increment,
uf varchar(2),
municipio varchar(50),
bairro varchar(40),
logradouro varchar (40),
numero int
) auto_increment = 100;

insert into endereco values
(null, "sp", "são paulo", "mooca", "rua cuiaba", "340")

select * from endereco 
