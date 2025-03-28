CREATE TABLE customer (
    CustomerID        NUMBER(3) PRIMARY KEY,
    CustomerName VARCHAR2(50),
    ContactName        VARCHAR2(50),
    Address        VARCHAR2(50),
    City VARCHAR2(50),
    PostalCode NUMBER (5),
    Country VARCHAR2(50)
);

insert into customer values(1,'Alfreds Futterkiste', 'Maria Anders', 'Obere Str.57', 'Berlin', 12209, 'Germany');

insert into customer(CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
values(2,'Ana Trujillo Emparedados y Helados', 'Ana trujillo', 'Avda. de la Constitucion 2222', 'Mexico D.F', 5021, 'Mexico');

insert into customer(Country,PostalCode, City,Address ,ContactName ,CustomerName , CustomerID)
values('Mexico', 5023, 'Mexico D.F', 'Mataderos 2312','Antonio Moreno','Antonio Moreno Taquería',3 );

insert into customer values(4,'Around the Horn', 'Thomas Hardy', '120 Hanover Sq.', 'London', 11234, 'UK');

insert into customer values(5,'Berglunds snabbkop', 'Christina Berglund', 'Bergusvsvagen8', 'Lulea', 95822, 'Sweden');

update customer set Address= 'C fasfsa 27', PostalCode =12412, City= 'Frankfurt' where CustomerID = 1;

update customer set ContactName = 'Amancio Ortega' where Country = 'Mexico';

delete from customer where Country = 'Sweden';



DROP TABLE pedidos CASCADE CONSTRAINTS;
DROP TABLE oficinas CASCADE CONSTRAINTS;
DROP TABLE clientes CASCADE CONSTRAINTS;
DROP TABLE empleados CASCADE CONSTRAINTS;
DROP TABLE productos CASCADE CONSTRAINTS;
DROP TABLE fabricante CASCADE CONSTRAINTS;



---------------------------------------------------------------------------
CREATE TABLE empleados (
numemp NUMBER PRIMARY KEY,
nombre VARCHAR2(30) NOT NULL,
edad NUMBER,
oficina NUMBER, 
titulo VARCHAR2(20),
contrato VARCHAR2(20) NOT NULL,
director NUMBER,
cuota NUMBER,
ventas NUMBER);

CREATE TABLE oficinas (
oficina NUMBER PRIMARY KEY,
ciudad VARCHAR2(30),
region VARCHAR2(20),
dir NUMBER,
objetivo NUMBER,
ventas NUMBER,
FOREIGN KEY (dir) REFERENCES empleados(numemp));

CREATE TABLE fabricante (
idfab NUMBER PRIMARY KEY,
nombre VARCHAR2(30) NOT NULL
);

CREATE TABLE productos (
idfab NUMBER,
idproducto NUMBER,
descripcion VARCHAR2(30) NOT NULL,
precio NUMBER NOT NULL,
existencias NUMBER,
CONSTRAINT cp PRIMARY KEY (idfab, idproducto),
FOREIGN KEY (idfab) REFERENCES fabricante(idfab));

CREATE TABLE clientes (
numclie NUMBER PRIMARY KEY,
nombre VARCHAR2(30) NOT NULL,
repclie NUMBER,
FOREIGN KEY (repclie) REFERENCES empleados(numemp)) ;

CREATE TABLE pedidos (
codigo NUMBER,
numpedido NUMBER PRIMARY KEY,
fechapedido VARCHAR2(15) NOT NULL,
clie NUMBER NOT NULL,
rep NUMBER NOT NULL,
fab NUMBER NOT NULL,
producto NUMBER NOT NULL,
cant NUMBER NOT NULL,
importe NUMBER NOT NULL,
FOREIGN KEY (clie) REFERENCES clientes(numclie),
FOREIGN KEY (rep) REFERENCES empleados(numemp),
FOREIGN KEY (fab, producto) REFERENCES productos(idfab, idproducto) );

INSERT INTO empleados
VALUES (1, 'Juan Pérez', 28, 1, 'Gerente', 'Tiempo completo', 2, 5000, 12000);
INSERT INTO empleados 
VALUES (2, 'María Rodríguez', 35, 1, 'Analista', 'Tiempo completo', 1, 4000, 8000);
INSERT INTO empleados 
VALUES (3, 'Carlos Gómez', 30, 2, 'Vendedor', 'Medio tiempo', 1, 3000, 6000);
INSERT INTO empleados
VALUES (4, 'Laura Martínez', 40, 2, 'Gerente', 'Tiempo completo', 3, 5500, 15000);
INSERT INTO empleados 
VALUES (5, 'Pedro Sánchez', 25, 1, 'Asistente', 'Tiempo completo', 1, 3500, 7000);
INSERT INTO empleados 
VALUES (6, 'Ana López', 32, 2, 'Analista', 'Tiempo completo', 4, 4200, 8500);
INSERT INTO empleados 
VALUES (7, 'Miguel Torres', 28, 1, 'Vendedor', 'Medio tiempo', 5, 3200, 6500);
INSERT INTO empleados 
VALUES (8, 'Isabel García', 38, 2, 'Gerente', 'Tiempo completo', 3, 5800, 16000);
INSERT INTO empleados 
VALUES (9, 'Javier Hernández', 27, 1, 'Asistente', 'Tiempo completo', 1, 3800, 7500);
INSERT INTO empleados 
VALUES (10, 'Lucía Díaz', 33, 2, 'Vendedor', 'Medio tiempo', 4, 3100, 6200);

INSERT INTO oficinas 
VALUES (1, 'México', 'Centro', 1, 25000, 18000);
INSERT INTO oficinas 
VALUES (2, 'Guadalajara', 'Oeste', 4, 20000, 15000);
INSERT INTO oficinas 
VALUES (3, 'Monterrey', 'Norte', 8, 18000, 12000);
INSERT INTO oficinas 
VALUES (4, 'Puebla', 'Sur', 2, 22000, 16000);

INSERT INTO fabricante 
VALUES (1, 'Electrónicos Delegao');
INSERT INTO fabricante 
VALUES (2, 'Tecnología Ethan');
INSERT INTO fabricante 
VALUES (3, 'Pamplinadas');

INSERT INTO productos VALUES (1, 1, 'Laptop', 1500, 30);
INSERT INTO productos VALUES (1, 2, 'Tablet', 800, 20);
INSERT INTO productos VALUES (1, 3, 'Mouse', 30, 50);
INSERT INTO productos VALUES (1, 4, 'Teclado', 50, 40);
INSERT INTO productos VALUES (1, 5, 'Impresora', 200, 15);


INSERT INTO productos VALUES (2, 1, 'Smartphone', 1000, 50);
INSERT INTO productos VALUES (2, 2, 'Monitor', 400, 15);
INSERT INTO productos VALUES (2, 3, 'Auriculares', 80, 25);
INSERT INTO productos VALUES (2, 4, 'Altavoces', 120, 30);
INSERT INTO productos VALUES (2, 5, 'Cargador', 20, 40);


INSERT INTO productos VALUES (3, 1, 'Cámara', 600, 25);
INSERT INTO productos VALUES (3, 2, 'Reloj Inteligente', 300, 35);
INSERT INTO productos VALUES (3, 3, 'Drone', 800, 10);
INSERT INTO productos VALUES (3, 4, 'Gafas VR', 400, 18);
INSERT INTO productos VALUES (3, 5, 'Batería Externa', 40, 50);

INSERT INTO clientes VALUES (1, 'Cliente A', 1);
INSERT INTO clientes VALUES (2, 'Cliente B', 3);
INSERT INTO clientes VALUES (3, 'Cliente C', 5);
INSERT INTO clientes VALUES (4, 'Cliente D', 2);
INSERT INTO clientes VALUES (5, 'Cliente E', 4);

INSERT INTO pedidos VALUES (1, 101, '2024-02-02', 1, 1, 1, 1, 3, 4500);
INSERT INTO pedidos VALUES (2, 102, '2024-02-03', 2, 2, 2, 2, 5, 8000);
INSERT INTO pedidos VALUES (3, 103, '2024-02-04', 3, 3, 3, 3, 2, 3000);
INSERT INTO pedidos VALUES (4, 104, '2024-02-05', 4, 4, 1, 4, 4, 6000);
INSERT INTO pedidos VALUES (5, 105, '2024-02-06', 5, 5, 2, 5, 6, 7200);
INSERT INTO pedidos VALUES (6, 106, '2024-02-07', 1, 6, 3, 1, 8, 9600);
INSERT INTO pedidos VALUES (7, 107, '2024-02-08', 2, 7, 1, 2, 10, 10000);
INSERT INTO pedidos VALUES (8, 108, '2024-02-09', 3, 8, 2, 3, 3, 2400);
INSERT INTO pedidos VALUES (9, 109, '2024-02-10', 4, 9, 3, 4, 7, 8400);
INSERT INTO pedidos VALUES (10, 110, '2024-02-11', 5, 10, 1, 5, 5, 5000);


UPDATE empleados SET oficina = 1 WHERE numemp = 1;
UPDATE empleados SET oficina = 2 WHERE numemp = 2;
UPDATE empleados SET oficina = 1 WHERE numemp = 3;
UPDATE empleados SET oficina = 2 WHERE numemp = 4;
UPDATE empleados SET oficina = 1 WHERE numemp = 5;
UPDATE empleados SET oficina = 2 WHERE numemp = 6;
UPDATE empleados SET oficina = 1 WHERE numemp = 7;
UPDATE empleados SET oficina = 2 WHERE numemp = 8;
UPDATE empleados SET oficina = 1 WHERE numemp = 9;
UPDATE empleados SET oficina = 2 WHERE numemp = 10;

update productos set precio = precio * 1.05 where idfab = 1;

insert into oficinas VALUES (30, 'Madrid', 'Centro', 1, 100000, 18000);

update empleados set oficina = 3 where oficina = 2; 

delete from pedidos where rep = 2;

---------------------------------------------------------------------------
create table plataforma(
idPlataforma number primary key,
nombre varchar2(25) not null
);

create table usuario(
idUsuario number primary key,
nickname varchar2(30) not null,
email varchar2(50) not null,
telefono varchar2(9) not null,
generofavorito varchar2(25)
);

create table videojuego(
idVideojuego number primary key,
idPlataforma number not null,
nombre varchar2(25) not null,
genero varchar2(25) CHECK (genero IN ('deporte', 'carreras', 'lucha', 'superviviencia', 'rol', 'simulacion')) not null,
desarrollador varchar2(50) not null,
fechacompra varchar2(25) not null,
descripcion varchar2(500) not null,
activo varchar2(2) not null,
foreign key (idPlataforma) references plataforma(idPlataforma)
);


create table partida(
idPartida number primary key,
idUsuario number not null,
idVideojuego number not null,
resultado varchar2(11) check (resultado IN ('Has ganado', 'Has perdido')) not null,
fecha_juego varchar2(25) not null,
foreign key (idUsuario) references usuario(idUsuario),
foreign key (idVideojuego) references videojuego(idVideojuego)
);

insert into plataforma(idPlataforma,nombre)
values(1,'PS4');

insert into plataforma
values(2,'PS5');

insert into plataforma
values(3,'XBOX');

insert into usuario
values (1,'Juanito24', 'juanito@gmail.com', '987654324','CARRERAS');

insert into usuario
values (2,'moskito', 'moskito@gmail.com', '123456845','LUCHA');

insert into usuario
values (3,'paquito', 'paquito@gmail.com', '987521324','SUPERVIVENCIA');


insert into videojuego
values (1, 1, 'FAR CRY','simulacion', 'ubisoft','2024-02-02' , 'ta bien', 'si' );

insert into videojuego
values (2, 2, 'Mario Kart','carreras', 'nintendo','2022-04-07' , 'gasolina', 'no' );

insert into videojuego
values (3, 3, 'LOL','rol', 'Rito Games','2026-01-06' , 'podria mejorar', 'si' );

insert into partida
values (1,1,1,'Has ganado','2023-02-02');

insert into partida
values (2,2,2,'Has ganado','2018-06-02');

insert into partida
values (3,3,3,'Has perdido','2020-03-07');

UPDATE partida SET resultado = 'Has ganado' WHERE idPartida = 3;

UPDATE plataforma SET nombre = 'PS6' WHERE idPlataforma=1;

UPDATE usuario SET nickname = 'holatio' WHERE idUsuario = 1;

UPDATE videojuego SET idPlataforma = 2 WHERE nombre = 'FAR CRY';
