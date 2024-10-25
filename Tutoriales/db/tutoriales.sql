DROP DATABASE IF EXISTS tutorial;
create database tutorial;
use tutorial;

create table categorias(
	idCategoria int primary key auto_increment,
    categoria varchar(50)
);

insert into categorias(categoria)
values('Programación'),
	  ('3d'),
	  ('Multimedia');

create table tutoriales(
	idTutorial int primary key auto_increment,
    titulo varchar(100),
    url varchar(250),
    prioridad int,
    estado boolean,
    idCategoria int,
    foreign key(idCategoria) references categorias(idcategoria)
);

insert into tutoriales(titulo,url,prioridad,estado,idCategoria)
values('Laravel','https://www.youtube.com',6,true,1);
	