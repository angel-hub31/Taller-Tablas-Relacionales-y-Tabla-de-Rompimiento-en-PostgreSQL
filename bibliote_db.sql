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
('2',1,2016),
('3',2,2026);


-- la: tabla de rompimiento
--la :libro_autor
--l:libros
--a: autores
--fecha en libro_autor

-- consulta 1
--Mostrar:título del libro,nombre del autor,país,año de publicación,Utilizando INNER JOIN.

select l.titulo, a.nombre, a.pais, la.anio_publicacion 
from libro_autor la
inner join libros l on la.la_libro_codigo_fk = l.codigo
inner join autores a on la.la_autor_id_fk = a.id;

--consulta 2
--Mostrar únicamente libros publicados después del año 2020.

select l.titulo,la.anio_publicacion from libro_autor la
inner join libros l on la.la_libro_codigo_fk=l.codigo
where la.anio_publicacion >2020;

--consulta 3
--Mostrar únicamente autores de un país específico usando WHERE.

select distinct a.nombre, a.pais
from libro_autor la
inner join autores a on la.la_autor_id_fk = a.id
where a.pais ='Ecuador'

-- Consulta 4
-- Ordenar los libros por año de publicación descendente.

select l.titulo, la.anio_publicacion
from libro_autor la
inner join libros l on la.la_libro_codigo_fk =l.codigo
order by la.anio_publicacion desc;

-- Consulta 5
-- Contar cuántos libros tiene cada autor utilizando COUNT() y GROUP BY

select a.nombre, count(la.la_libro_codigo_fk) as total_libros
from autores a
inner join libro_autor la on a.id = la.la_autor_id_fk
group by a.id, a.nombre;

--Agregamos una nueva columna a la tabla libros:

alter table libros add precio double precision;

update libros set precio = 15.50 where codigo = '1';
update libros set precio = 22.99 where codigo = '2';
update libros set precio = 18.00 where codigo = '3';
update libros set precio = 12.45 where codigo = '4';

