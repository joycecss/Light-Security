create database Light_securiry;

use Light_securiry;

CREATE TABLE instituicao(
          idinstituicao int primary key NOT NULL auto_increment,
          razaoSocial VARCHAR(45) not null,
          cnpj varchar(14)not null,
          endereco VARCHAR(45)not null,
          bairro varchar(20),
          telefone int
)auto_increment = 100;

-- criando tabela logins --
CREATE TABLE  Logins (
        idlogins int primary key not null auto_increment,
        nome varchar (45),
        email varchar (45),
        senha varchar(45), 
        fk_instituicao int,
		foreign key (FK_instituicao) references instituicao (idinstituicao)
)auto_increment = 1000;

-- Criando a tabela sensor --
CREATE TABLE Sensor (
          idSensor INT NOT NULL primary key auto_increment,
          Placa VARCHAR(45) not NULL,
          FK_instituicao int,
          foreign key (FK_instituicao) references instituicao (idinstituicao)
)auto_increment = 1;

-- Pegando data e hora do sistema --
select addtime(sysdate(),'-4:00:00');

-- Criando tabela dados --
CREATE TABLE Dados (
         IdDados INT NOT NULL primary key auto_increment,
          UF VARCHAR(2),
          municipio varchar(45),
          bairro varchar(45),
          Nome_Local varchar(45),
          cep int,
          datahora datetime default current_timestamp,
          luminosidade float not null,
          statusSensor varchar(30),
		  check (statusSensor = 'Ativo' or statusSensor = 'Inativo' or statusSensor = 'Manutenção'),
          fk_sensor int,
          foreign key (FK_sensor) references sensor (idsensor)
)auto_increment = 10000;

-- inserindo os dados a tabela instituicao --
insert into instituicao values
(null,'UBER DO BRASIL TECNOLOGIA LTDA','17895646000187','Av Pres Juscelino Kubitschek, n°1909','VILA NOVA CONCEICAO',1122325874),
(null,'99 TECNOLOGIA LTDA','18033552000161','R SANSAO ALVES DOS SANTOS, n°400','CIDADE MONCOES',1133317866),
(null,'EXPRESSO TRANSPORTE TURISMO LTDA','05263312000101','Av Paulista, n°3000','Bela Vista',1129654414),
(null,'JetFrio Refrigeração','17895646000187','R. Antônio de Barros, n°924','Tatuapé',1120952000),
(null,'Comando Geral Guarda Civil Metropolitana','17895646000187','R. Gen. Couto de Magalhães, n°444','Santa Ifigênia',1133965830),
(null,'IFOOD.COM AGENCIA DE RESTAURANTES ONLINE S.A','14380200000202','Av Mofarrej n°825','Vila Leopoldina',1131685353),
(null,'RAPPI BRASIL INTERMEDIAÇÃO DE NEGÓCIOS LTDA',' 2690016100012','AVENIDA DOS AUTONOMISTAS, n°896,900,896','VILA YARA',1130535567),
(null,'MANOEL BEZERRA DA SILVA/INDRIVER','356283780001','Travessa Leopoldo Pires de Oliveira, n°54','Vila Gato',1197113071),
(null,'Waze Tecnologia LTDA','05782184000102','R Uruguai, n°1113','Jardim Girassol',1936049187),
(null,'DANFOSS DO BRASIL INDUSTRIA E COMERCIO LTDA','62158480000170','RUA AMERICO VESPUCIO, n°98','JARDIM PLATINA',1121355410);
select * from instituicao;

-- inserindo os dados a tabela logins --
insert into Logins values
(null,'Rosana do Nascimento','correspondencias@uber.com','14523256','100'),
(null,'Elio Moraes','emanuel__1997@hotmail.com','17856554','101'),
(null,'Leonardo Verri','fiscal@bablacar.com','98515133','102'),
(null,'Helena Batista','cotato@jetfrio.com.br','845115115','103'),
(null,'Joel Souza','contato@gcm.gov.br','522365874','104'),
(null,'Bruna Rodrigues','iffodgvf@gfa.com.br','3151220002','105'),
(null,'Wagner Cruz','legal.br@rappi.com','7499654112','106'),
(null,'Lana Del Rey','seu.motoristapro@gmail.com','225694153','107'),
(null,'Anderson Rodrigues','FISCAL@ADCONT.COM.BR','004846515','108'),
(null,'Gabriela Albuquerque','v.oliveira@danfoss.com','661744522','109');
select * from logins;

-- inserindo os dados a tabela Sensor --
insert into Sensor values
(Null,'EZA8965',100),
(Null,'AKL0977',101),
(Null,'QPA1096',102),
(Null,'ROB2184',103),
(Null,'SNC3273',104),
(Null,'TMD4352',105),
(Null,'ULE5441',106),
(Null,'VKF6536',107),
(Null,'WJG7623',108),
(Null,'XIH8710',109);
select * from sensor;

-- inserindo os dados a tabela Dados --
insert into Dados(UF,municipio,bairro,Nome_Local,cep,luminosidade,statusSensor,fk_sensor) values
('SP','são paulo','Cambuci','Av do Estado','01523010','711.4','Ativo','1'),
('SP','são paulo','Vila nova Cachoeirinha','AV Largo do Japonês','01944000','855.4','Ativo','2'),
('SP','são paulo','Jardim Peri','Rua:Condessa Amalia Matarazzo','32444555','1000','Manutenção','3'),
('SP','são paulo','Cambuci','Av do Estado','01523020','100.8','inativo','4'),
('SP','são paulo','Diadema','Rua Adelino Tinti','09910500','655.1','Ativo','5'),
('SP','são paulo','Bela Vista','Avenida Paulista 119','01523010','1014.0','Manutenção','6'),
('RJ','Rio de Janeiro','Jardim Botanico','Av do Estado','13919370','599.3','Ativo','7'),
('SP','Salto','Parque Imperial','Rua Adoniram Barbosa','06462000','536.2','Ativo','8'),
('SP','Sorocaba','Vila Mineirão','Rua Abner Pedroso de Alcântara','18076482','138.7','Inativo','9'),
('SP','Jacarei','Centro','Rua Bartolomeu Fernandes Faria','12308200','798.2','Ativo','10');
select * from Dados;

-- Exibindo as tabelas separadas --
select * from instituicao;
select * from logins;
select * from sensor;
select * from dados;

-- Exibir os dados dos sensores e das instituições --
select * from sensor join instituicao on sensor.fk_instituicao = instituicao.idinstituicao;

-- Exibir os dados das instituições e logins --
select * from instituicao join logins on logins.fk_instituicao = instituicao.idinstituicao;

-- Exibir os dados dos sensores e da tabela dados --
select * from dados join sensor on dados.fk_sensor = sensor.idsensor;
select * from sensor join dados on dados.fk_sensor = sensor.idsensor;

-- Join com 3 tabelas --
select * from sensor join instituicao on sensor.fk_instituicao = instituicao.idinstituicao
join dados on dados.fk_sensor = sensor.idsensor;

-- Exibir os dados de todos os sensores que são de um determinado tipo --
select * from Dados where statusSensor = 'Ativo';
-- Com join --
select * from Dados join Sensor on Dados.fk_sensor = idSensor where statusSensor = 'Ativo';

-- Exibir os dados dos Sensores ordenados em ordem ascendente pelo nome do local --
select * from Sensor join Dados on Dados.fk_sensor = idsensor order by nome_local asc;
-- Muda a ordem que as tabelas vão ser exibidas na tela --
select * from Dados join Sensor on Dados.fk_sensor = idsensor order by nome_local asc;
-- Exibi os dados da tabela sensor relacionados com a tabela instituicao ordenados pela razaoSocial em ordem ascendente --
select * from Sensor join instituicao on sensor.fk_instituicao = idinstituicao order by razaoSocial asc;

-- Exibir os dados das instituicoes ordenados em ordem decrescente pelo bairro --
select * from instituicao order by bairro desc;
-- Com join usando o relacionamento entre sensor e instituicao --
select * from instituicao join sensor on sensor.fk_instituicao = idinstituicao order by bairro desc;

-- Exibir os dados das instituicoes cuja razaoSocial comece com uma determinada letra --
select * from instituicao where razaoSocial like'U%';
-- Com join procurando o relacionamento entre instituição e sensor a placa que comece com a letra E --
select * from instituicao join sensor on sensor.fk_instituicao = instituicao.idinstituicao where placa like 'E%';
-- Com join procurando o relacionamento entre instituição e sensor a placa que termine com o numero 0 --
select * from instituicao join sensor on sensor.fk_instituicao = instituicao.idinstituicao where placa like '%0';

-- Exibir os dados da instituicao que têm o mesmo nome--
select * from instituicao where razaoSocial like '%LTDA%';
-- Com join --
select * from instituicao join logins on logins.fk_instituicao where instituicao.razaoSocial like '%LTDA%';

-- Exibir os dados dos sensores e das instituicoes, mas somente de um determinada instituicao --
select * from sensor join instituicao on sensor.fk_instituicao = idinstituicao where idSensor = '5';
-- usando o cnpj para selecionar o sensor e a instituicao --
select * from sensor join instituicao on sensor.fk_instituicao = idinstituicao where cnpj = '62158480000170';
-- usando a FK para selecionar o sensor --
select * from dados join sensor on dados.fk_sensor = idsensor where fk_sensor = '9';

-- função COUNT para contar--
select count(*) from instituicao;
select count(*) from logins;
select count(*) from sensor;
select count(*) from dados;

select count(telefone) from Instituicao;
select count(nome) from Logins;
select count(placa) from Sensor;
select count(luminosidade) from Dados;

-- FUNÇÃO SUM para soma --
select sum(senha) from logins;
select sum(luminosidade) from dados;

-- TRUNCATE delimita a quantidade de casas após a vírgula sem arredondar com sum --
select truncate(sum(senha),1) from logins;
select truncate(sum(luminosidade),1) from dados;

-- round delimita a quantidade de casas após a vírgula arredondando com sum --
select round(sum(luminosidade),1) from dados;

-- função max = a maior senha --
select max(senha) from logins;
-- função max = a maior luminosidade --
select max(luminosidade) from dados;

-- função min - a menor senha --
select min(senha) from logins;
-- função min = a menor luminosidade --
select min(luminosidade) from dados;

-- função avg - média dos valores de senha--
select avg(senha) from logins;
select truncate(avg(senha),2) from logins;
select round(avg(senha),2) from logins;

-- função avg - média dos valores de luminosidade --
select avg(luminosidade) from dados;
select truncate(avg(luminosidade),2) from dados;
select round(avg(luminosidade),2) from dados;

-- função group by --
select truncate(avg(luminosidade),1) from Dados group by Nome_Local;
select nome_local,truncate(avg(luminosidade),1) from dados group by Nome_Local;

select truncate(sum(luminosidade),1) from Dados group by Nome_Local;
select Nome_Local, truncate(sum(luminosidade),1) from dados group by Nome_Local;

-- Exibir a Luminosidade e o local dos Dados máximo entre todos os locais --
select Nome_Local, max(Luminosidade) from Dados;
select Nome_Local,luminosidade from Dados where luminosidade = (select max(luminosidade) from Dados);

-- Exibir a Luminosidade e o local dos Dados minimo entre todos os locais --
select Nome_Local, min(luminosidade) from Dados;
select Nome_Local,luminosidade from Dados where luminosidade = (select min(luminosidade) from Dados);

select Nome_Local,luminosidade from Dados where luminosidade > (select avg(luminosidade) from Dados);
select Nome_Local,luminosidade from Dados where luminosidade < (select avg(luminosidade) from Dados);

-- Excluir as tabelas --
drop table Dados;
drop table sensor;
drop table Logins;
drop table Instituicao;

-- Excluir database(schema) Projeto --
drop database Light_Security;
