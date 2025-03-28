DROP TABLE infor_fabricante;
DROP TABLE infor_producto;

CREATE TABLE infor_fabricante (
  id NUMBER(10) PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL
);

CREATE TABLE infor_producto (
  id NUMBER(10) PRIMARY KEY,
  nombre VARCHAR2(100) NOT NULL,
  precio NUMBER(10,2) NOT NULL,
  id_fabricante NUMBER(10) NOT NULL,
  CONSTRAINT fk_fabricante_id FOREIGN KEY (id_fabricante) REFERENCES infor_fabricante(id)
);

INSERT INTO infor_fabricante VALUES(1, 'Asus');
INSERT INTO infor_fabricante VALUES(2, 'Lenovo');
INSERT INTO infor_fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO infor_fabricante VALUES(4, 'Samsung');
INSERT INTO infor_fabricante VALUES(5, 'Seagate');
INSERT INTO infor_fabricante VALUES(6, 'Crucial');
INSERT INTO infor_fabricante VALUES(7, 'Gigabyte');
INSERT INTO infor_fabricante VALUES(8, 'Huawei');
INSERT INTO infor_fabricante VALUES(9, 'Xiaomi');

INSERT INTO infor_producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO infor_producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO infor_producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO infor_producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO infor_producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO infor_producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO infor_producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO infor_producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO infor_producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO infor_producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO infor_producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);