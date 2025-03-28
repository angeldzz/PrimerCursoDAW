CREATE TABLE tarea20_customer (
    CustomerID NUMBER(3) PRIMARY KEY,
    CustomerName VARCHAR2(50),
    ContactName VARCHAR2(50),
    Address VARCHAR2(50),
    City VARCHAR2(50),
    PostalCode NUMBER (5),
    Country VARCHAR2(50)
);

INSERT INTO tarea20_customer
values(2,'Jesus','jesusito@gmail.com','av_escocia_1','Paris',42031,'Francia');

INSERT INTO tarea20_customer(CustomerID, CustomerName, ContactName, Address, City, PostalCode, Country)
values(1,'Manolo','manolito@gmail.com','av_civeles_12','Madrid',28340,'España');

INSERT INTO tarea20_customer(CustomerName,CustomerID, Address, City,ContactName, Country, PostalCode)
values('Antonio',3,'av_noruega_1','Londres','antonito@gmail.com','ReinoUnido',43021);

ALTER TABLE tarea20_customer
ADD dueño VARCHAR2 (20);

UPDATE tarea20_customer
SET Address = 'square_mixuvixi_2',
    PostalCode = 23023,
    City = 'Slat',
    Country = 'Frankfurt'
WHERE CustomerID = 1;

UPDATE tarea20_customer
SET City = 'Ciudad de Mexico',
    Country = 'Mexico'
WHERE CustomerID = 2;

UPDATE tarea20_customer
SET Address = 'AV_suecos_67',
    PostalCode = 21221,
    City = 'Frlin',
    Country = 'Suecia'
WHERE CustomerID = 3;

UPDATE tarea20_customer
SET Dueño = 'Amancio Ortega'
Where Country = 'Mexico';

DELETE FROM tarea20_customer
WHERE Country = 'Suecia';