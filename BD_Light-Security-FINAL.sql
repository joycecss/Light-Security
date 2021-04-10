create database lightsecurity;
use lightsecurity;
CREATE TABLE  instituicao (
          idinstituicao INT primary key NOT NULL auto_increment,
          nome_instituicao VARCHAR(45),
          cnpj int,
          email VARCHAR(45),
          senha varchar(45)
);
select * from instituicao;
insert into instituicao values 
(null, "policia civil", "4542054", "policia.civil@gmail.com","senhapadrao");

CREATE TABLE  civil (
          idcivil INT NOT NULL primary key auto_increment,
          nome_completo VARCHAR(45),
          email varchar(45),
          senha varchar(45)
);
select * from civil;
insert into civil values 
(null, "alex barreira", "policia.civil@gmail.com", "senhapadrao");
CREATE TABLE Sensor (
          idSensor INT NOT NULL primary key auto_increment,
          Placa VARCHAR(45) NULL,
          FK_instituicao int,
          foreign key (FK_instituicao) references instituicao (idinstituicao),
          FK_civil int,
          foreign key (FK_civil) references civil (idcivil)
);
insert into sensor values 
(null, 'ehd-7458',1,1);
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
);
insert into dados values 
(null, 'SP','São Paulo','jd. Campo','Rua Cavalo Branco',098752-050,2021-02-15,500,1);       

-- selects   
select * from instituicao;

select * from civil;

select * from dados;

select * from sensor;

select sensor.*, civil.* from sensor join civil on (FK_civil = idcivil);

select sensor.*, instituicao.* from sensor join instituicao on (FK_instituicao = idinstituicao);

select count(*) from sensor;

drop database lightsecurity;