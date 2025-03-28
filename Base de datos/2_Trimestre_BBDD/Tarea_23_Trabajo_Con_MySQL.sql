DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas CHARACTER SET latin1;
ALTER DATABASE ventas CHARACTER SET utf8mb4;
USE ventas;

CREATE TABLE tarea_23_cliente (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(25),
  primer_apellido VARCHAR(15) NOT NULL,
  ciudad VARCHAR(100),
  categoria INT UNSIGNED
);
ALTER TABLE tarea_23_cliente MODIFY nombre VARCHAR(100) NOT NULL;
ALTER TABLE tarea_23_cliente CHANGE COLUMN primer_apellido apellido1 VARCHAR(100) NOT NULL;
ALTER TABLE tarea_23_cliente ADD COLUMN apellido2 VARCHAR(100) DEFAULT NULL AFTER apellido1;
ALTER TABLE tarea_23_cliente DROP COLUMN categoria;
INSERT INTO tarea_23_cliente (id,nombre, apellido1,apellido2, ciudad)
VALUES (1,'Manolo', 'Gonzalez','Diaz', 'Granada'),
       (2,'Juan', 'Pinto','Moraleda', 'Toledo'),
       (3,'Jesus', 'Giligil','Madrigal', 'Andorra'),
       (4,'Borja', 'Escalona','Dominguez', 'Madrid'),
       (5,'Luis', 'Franco','Catela', 'Bilbao');
       
INSERT INTO tarea_23_cliente (ciudad, nombre, apellido2, apellido1, id)
VALUES ('Extremadura', 'Jotanda','Turizo', 'Dominguez',6),
       ('Badajoz', 'Angel','Cid', 'Corporales',7),
       ('Gualajara', 'Enrique','Sanchez', 'Murillo',8),
       ('Jaen', 'Pablo','Ruiz', 'Quijote',9),
       ('Barcelona', 'Fernando','Martinez', 'Martin',10);

DESCRIBE tarea_23_cliente;

CREATE TABLE tarea_23_comercial (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  ciudad VARCHAR(100),
  comision FLOAT
);
ALTER TABLE tarea_23_comercial MODIFY COLUMN comision FLOAT DEFAULT 10;
INSERT INTO tarea_23_comercial (nombre, apellido1, ciudad, comision)
VALUES ('Jotanda', 'Dominguez', 'Extremadura', 10.5),
       ('Angel', 'Corporales', 'Badajoz', 8.75),
       ('Enrique', 'Murillo', 'Gualajara', 9.25),
       ('Pablo', 'Quijote', 'Jaen', 11),
       ('Fernando', 'Martin', 'Barcelona', 12.5);
INSERT INTO tarea_23_comercial (ciudad, comision, nombre, apellido1)
VALUES ('Granada', 10.25, 'Manolo', 'Gonzalez'),
       ('Toledo', 9.75, 'Juan', 'Pinto'),
       ('Andorra', 11.5, 'Jesus', 'Giligil'),
       ('Madrid', 12, 'Borja', 'Escalona'),
       ('Bilbao', 9.25, 'Luis', 'Franco');