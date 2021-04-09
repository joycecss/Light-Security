create database lightsecurity 

use lightsecurity

CREATE TABLE  instituicao (
          idinstituicao INT primary key NOT NULL auto_increment,
          nome_instituicao VARCHAR(45),
          cnpj int,
          email VARCHAR(45),
          senha varchar(45)
)

CREATE TABLE  civil (
          idcivil INT NOT NULL primary key auto_increment,
          nome_completo VARCHAR(45),
          email varchar(45),
          senha varchar(45)
)

CREATE TABLE Sensor (
          idSensor INT NOT NULL primary key auto_increment,
          Placa VARCHAR(45) NULL,
          FK_instituicao int,
          foreign key (FK_instituicao) references instituicao (idinstituicao),
          FK_civil int,
          foreign key (FK_civil) references civil (idcivil)
)



CREATE TABLE dados (
         Iddados INT NOT NULL primary key auto_increment,
          UF VARCHAR(2),
          municipio varchar(45),
          bairro varchar(45),
          rua varchar(45),
          cep int,
          datahora datetime,
          luminosidade int,
          FK_sensor int,
          foreign key (FK_sensor) references sensor (idsensor)
)
          
select * from instituicao;

select * from civil;

select * from dados;

select * from sensor;

insert into instituicao values 
(null, "policia civil", "4542054", "policia.civil@gmail.com","senhapadrao");

insert into civil values 
(null, "alex barreira", "policia.civil@gmail.com", "senhapadrao");

select * from sensor join civil on FK_civil = idcivil;

select * from sensor join instituicao on FK_instituicao = idinstuicao;
         
           