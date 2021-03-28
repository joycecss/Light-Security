create database Histórico;
use Histórico;

create table Histórico(
id_Histórico int primary key auto_increment,
Data_Hora datetime default current_timestamp,
Descrição varchar(75),
Taxa_Criminalidade char(1)
check (Taxa_Criminalidade = 'A' or Taxa_Criminalidade = 'M' or Taxa_Criminalidade = 'B') -- A = Alta, M = Média e B = Baixa -->
)auto_increment = 100;

insert into Histórico values
(null,'2021-02-01 01:10:47','Local com luzes falhando','M'),
(null,'2021-02-10 14:46:30','Local bastate iluminado','B'),
(null,'2021-02-20 00:20:35','Luzes quebradas','A'),
(null,'2021-03-05 22:15:11','Local necessita de atenção','A'),
(null,'2021-03-15 18:52:05','Pouca iluminação','A'),
(null,'2021-03-20 23:22:01','Local com luzes falhando','M'),
(null,'2021-03-25 19:04:58','Cuidado,local com possibilidade de assaltos','A'),
(null,'2021-03-27 08:11:39','Rua bem iluminada','B'),
(null,'2021-03-28 10:50:00','Local com extrema vigilância','B'),
(null,'2021-03-30 03:25:47','Local possui algumas lampadas quebradas','M');

select * from Histórico;

alter table Histórico add column FK_Sensor int;
alter table Histórico add foreign key (FK_Sensor) references Sensor(idSensor);

alter table Histórico add column FK_Endereço int;
alter table Histórico add foreign key (FK_Endereço) references Endereço(idEndereço);
















