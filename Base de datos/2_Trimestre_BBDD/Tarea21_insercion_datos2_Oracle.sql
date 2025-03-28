CREATE TABLE tarea21_empleados (
numemp NUMBER PRIMARY KEY,
nombre VARCHAR2(30) NOT NULL,
edad NUMBER,
oficina NUMBER, 
titulo VARCHAR2(20),
contrato VARCHAR2(20) NOT NULL,
director NUMBER,
cuota NUMBER,
ventas NUMBER
);

CREATE TABLE tarea21_oficinas (
oficina NUMBER PRIMARY KEY,
ciudad VARCHAR2(30),
region VARCHAR2(20),
dir NUMBER,
objetivo NUMBER,
ventas NUMBER,
FOREIGN KEY (dir) REFERENCES tarea21_empleados(numemp)
);

CREATE TABLE tarea21_fabricante (
idfab NUMBER PRIMARY KEY,
nombre VARCHAR2(30) NOT NULL
);

CREATE TABLE tarea21_productos (
idfab NUMBER,
idproducto NUMBER,
descripcion VARCHAR2(30) NOT NULL,
precio NUMBER NOT NULL,
existencias NUMBER,
CONSTRAINT cp PRIMARY KEY (idfab, idproducto),
FOREIGN KEY (idfab) REFERENCES tarea21_fabricante(idfab)
);

CREATE TABLE tarea21_clientes (
numclie NUMBER PRIMARY KEY,
nombre VARCHAR2(30) NOT NULL,
repclie NUMBER,
FOREIGN KEY (repclie) REFERENCES tarea21_empleados(numemp)
);

CREATE TABLE tarea21_pedidos (
codigo NUMBER,
numpedido NUMBER PRIMARY KEY,
fechapedido VARCHAR2(15) NOT NULL,
clie NUMBER NOT NULL,
rep NUMBER NOT NULL,
fab NUMBER NOT NULL,
producto NUMBER NOT NULL,
cant NUMBER NOT NULL,
importe NUMBER NOT NULL,
FOREIGN KEY (clie) REFERENCES tarea21_clientes(numclie),
FOREIGN KEY (rep) REFERENCES tarea21_empleados(numemp),
FOREIGN KEY (fab, producto) REFERENCES tarea21_productos(idfab, idproducto) 
);

INSERT INTO tarea21_empleados
VALUES(1,'Mauricio',21,4,'FP','Temporal',2,220,163);
INSERT INTO tarea21_empleados
VALUES(2,'Antonio',42,1,'Universitario','Fijo',2,412,565);
INSERT INTO tarea21_empleados
VALUES(3,'Jesus',54,3,'Universitario','Temporal',2,232,45);
INSERT INTO tarea21_empleados
VALUES(4,'Marcos',19,4,'Universitario','Fijo',1,231,454);
INSERT INTO tarea21_empleados
VALUES(5,'Angel',64,2,'FP','Temporal',1,422,343);
INSERT INTO tarea21_empleados
VALUES(6,'Fernando',63,2,'FP','Temporal',1,21,675);
INSERT INTO tarea21_empleados
VALUES(7,'Marta',51,2,'Universitario','Fijo',1,412,445);
INSERT INTO tarea21_empleados
VALUES(8,'Francisco',25,1,'Universitario','Fijo',2,43,46);
INSERT INTO tarea21_empleados
VALUES(9,'Julio',42,1,'Universitario','Fijo',1,12,754);
INSERT INTO tarea21_empleados
VALUES(10,'Lucia',32,3,'ESO','Temporal',2,324,0);

INSERT INTO tarea21_oficinas
VALUES(1,'Madrid','España',01,1100,2300);
INSERT INTO tarea21_oficinas
VALUES(2,'Paris','Francia',02,2043,2213);
INSERT INTO tarea21_oficinas
VALUES(3,'Berlin','Alemania',03,4112,3242);
INSERT INTO tarea21_oficinas
VALUES(4,'Moscu','Rusia',04,1231,4322);

INSERT INTO tarea21_fabricante
VALUES(01,'Endesa');
INSERT INTO tarea21_fabricante
VALUES(02,'Mercadona');
INSERT INTO tarea21_fabricante
VALUES(03,'Costco');
INSERT INTO tarea21_fabricante
VALUES(04,'Grefusa');
INSERT INTO tarea21_fabricante
VALUES(05,'Primor');

INSERT INTO tarea21_productos
VALUES(01,101,'PAN DE MOLDE',2,10000);
INSERT INTO tarea21_productos
VALUES(01,102,'JAMON',120,10131);
INSERT INTO tarea21_productos
VALUES(01,103,'RACION CALAMARES',14,20123);
INSERT INTO tarea21_productos
VALUES(01,104,'EUCALIPTO',1,81231);
INSERT INTO tarea21_productos
VALUES(01,105,'PUERTA',202,32033);
INSERT INTO tarea21_productos
VALUES(02,201,'CAMION',212122,10);
INSERT INTO tarea21_productos
VALUES(02,202,'IMAN',23,1213);
INSERT INTO tarea21_productos
VALUES(02,203,'YOYO',14,21212);
INSERT INTO tarea21_productos
VALUES(02,204,'YUCATAN',1222,1);
INSERT INTO tarea21_productos
VALUES(02,205,'VENTANA',22,32);
INSERT INTO tarea21_productos
VALUES(03,301,'GERONIMO',12,213);
INSERT INTO tarea21_productos
VALUES(03,302,'CARGADOR',2,3422);
INSERT INTO tarea21_productos
VALUES(03,303,'CAMARA GOPRO',132,122);
INSERT INTO tarea21_productos
VALUES(03,304,'GAFAS',12,223);
INSERT INTO tarea21_productos
VALUES(03,305,'MANIQUI',254,23);
INSERT INTO tarea21_productos
VALUES(04,401,'ESTROPAJO',21,323);
INSERT INTO tarea21_productos
VALUES(04,402,'PANTALLA',120,235);
INSERT INTO tarea21_productos
VALUES(04,403,'CERVEZA',2,211);
INSERT INTO tarea21_productos
VALUES(04,404,'NESTEA',1,333);
INSERT INTO tarea21_productos
VALUES(04,405,'COLACOLA',1,555);
INSERT INTO tarea21_productos
VALUES(05,501,'TOLDO',222,100);
INSERT INTO tarea21_productos
VALUES(05,502,'PERSIANA',88,10131);
INSERT INTO tarea21_productos
VALUES(05,503,'OVEJA',222,2200);
INSERT INTO tarea21_productos
VALUES(05,504,'VACA',111,888);
INSERT INTO tarea21_productos
VALUES(05,505,'GRANADA DE MANO',2,122);

INSERT INTO tarea21_clientes
values(01,'Manolo',01);
INSERT INTO tarea21_clientes
values(02,'Jose',02);
INSERT INTO tarea21_clientes
values(03,'Antonio',03);
INSERT INTO tarea21_clientes
values(04,'Marcos',04);
INSERT INTO tarea21_clientes
values(05,'Francisco',05);

INSERT INTO tarea21_pedidos
VALUES(01,901,'02/01/2023',02,1,01,102,32,3000);
INSERT INTO tarea21_pedidos
VALUES(02,902,'05/01/2023',02,5,01,102,12,43);
INSERT INTO tarea21_pedidos
VALUES(03,903,'19/01/2023',02,7,02,203,2,453);
INSERT INTO tarea21_pedidos
VALUES(04,904,'21/02/2023',02,6,02,202,333,242);
INSERT INTO tarea21_pedidos
VALUES(05,905,'06/03/2023',02,7,03,301,3312,335);
INSERT INTO tarea21_pedidos
VALUES(06,906,'13/04/2023',02,8,03,304,12,5453);
INSERT INTO tarea21_pedidos
VALUES(07,907,'24/05/2023',02,3,04,402,123,5344);
INSERT INTO tarea21_pedidos
VALUES(08,908,'21/01/2024',02,1,04,404,121,3343);
INSERT INTO tarea21_pedidos
VALUES(09,909,'25/01/2024',02,2,05,505,243,2344);
INSERT INTO tarea21_pedidos
VALUES(10,910,'12/09/2024',02,3,05,503,443,3420);


UPDATE tarea21_empleados
set oficina = 2
where oficina = 4;

UPDATE tarea21_productos
set precio=precio*1.05
where idfab = 2;

INSERT INTO tarea21_oficinas
VALUES(30,'Madrid','Centro',06,100000,430);

DELETE FROM tarea21_pedidos
WHERE rep = 2;

























