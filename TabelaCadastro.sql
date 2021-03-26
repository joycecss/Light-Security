create database ligthsecurity;

use ligthsecurity;

create table cadastro (
RG varchar(12) primary key,
Nome varchar(70),
Patente varchar(20),
Sexo varchar(9)-- Masculino Feminino 
check ( Sexo = 'Feminino' or Sexo = 'Maculino' or Sexo = 'Outro'),
CEP varchar(10),
Numero int
);

select * from cadastro join usuario on usuario.FK_cadastro = cadastro.RG;