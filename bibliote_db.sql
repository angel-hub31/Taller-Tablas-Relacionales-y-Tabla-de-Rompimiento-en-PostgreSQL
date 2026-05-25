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

--insertar datos
insert into libros(codigo,titulo,paginas)
values 
('1','Huasipungo',850),
('2','Polvo y ceniza',630),
('3','Siete lunas y siete serpientes',580),
('4','la iliada',350);

insert into autores(id,nombre,pais)
values
(01,'Jorje Icaza','Ecuador'),
(02,'Luis Martinez','Colombia'),
(03,'Jorge Davila','Argentina');

insert into libro_autor(la_libro_codigo_fk,la_autor_id_fk,anio_publicacion)
values
('1',1,1967),
('2',2,1981),
('3',3,1963),
('4',1,1944),
('2',1,2016);


-- la: tabla de rompimiento
--la :libro_autor
--l:libros
--a: autores
--fecha en libro_autor

-- consulta 1
select l.titulo, a.nombre, a.pais, la.anio_publicacion 
from libro_autor la
inner join libros l on la.la_libro_codigo_fk = l.codigo
inner join autores a on la.la_autor_id_fk = a.id;

