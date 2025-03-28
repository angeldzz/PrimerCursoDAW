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

