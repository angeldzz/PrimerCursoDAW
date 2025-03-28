drop table libros CASCADE CONSTRAINTS;

create table libros(
titulo varchar2(40) not null,
autor varchar2(20) default 'Desconocido',
editorial varchar2(20),
edicion date,
precio number(6,2));

insert into libros values('El aleph','Borges','Emece','10/10/1980',25.33);
insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI','05/05/2000',50.65);
insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Emece','08/09/2000',19.95);
insert into libros values('Aprenda PHP','Mario Molina','Siglo XXI','02/04/2000',45);
insert into libros values('Los pilares de la Tierra','Ken Follet','Plaza Janes','08/01/2001',23.65);
insert into libros values('El Médico','Noah Gordon','Rocabolsillo','25/01/2008',13.35);