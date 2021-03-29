create database usuarios;
use usuarios;

create table usuarios (
	id_user int primary key auto_increment,
    email varchar (40),
    senha varchar (10),
    
    fkID_RG int -- chave estrangeira referente a tabela Cadastro
-- (apagar o --) foreign key (fkID_RG) references Cadastro (id_rg)
) auto_increment = 1;
    
