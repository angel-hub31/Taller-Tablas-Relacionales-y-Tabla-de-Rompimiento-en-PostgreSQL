create table libros(
codigo varchar (5) primary key,
titulo varchar (50) not null,
paginas int not null
);


create table autores(
id int primary key,
nombre varchar (50) not null,
pais varchar (30) not null
);