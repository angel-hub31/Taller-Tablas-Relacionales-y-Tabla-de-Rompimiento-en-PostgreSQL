create table libros(
codigo varchar (5) primary key,
titulo varchar (50) not null,
paginas int not null
);
select * from libros;


create table autores(
id int primary key,
nombre varchar (50) not null,
pais varchar (30) not null
);
select * from autores;


--Tabla de rompimiento
create table libro_autor(
la_libro_codigo_fk varchar(5) not null,
la_autor_id_fk int not null,
anio_publicacion int not null,

constraint libro_fk foreign key (la_libro_codigo_fk) references libros(codigo),
constraint autores_fk foreign key (la_autor_id_fk) references autores(id),

--llave compuesta
constraint pk_libro_autor primary key (la_libro_codigo_fk,la_autor_id_fk )

);
select  * from libro_autor;


