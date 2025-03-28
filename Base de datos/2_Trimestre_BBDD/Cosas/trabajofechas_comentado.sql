DROP TABLE estudiantes CASCADE CONSTRAINTS;

CREATE TABLE estudiantes (
    identificador INTEGER,
    nombre VARCHAR(50),
    apellido1 VARCHAR(50),
    apellido2 VARCHAR(50),
    fechanacimiento DATE,
    fechamatricula DATE,
    primerlogin TIMESTAMP
	ultimologin TIMESTAMP,
);


INSERT INTO estudiantes (identificador, nombre, apellido1, apellido2, fechanacimiento, fechamatricula, primerlogin, ultimologin) 
VALUES (1, 'Ana', 'García', 'Martínez', TO_DATE('15/04/1995', 'DD/MM/YYYY'), TO_DATE('01/09/2021', 'DD/MM/YYYY'), TO_TIMESTAMP('02/04/2023 08:30:00', 'DD/MM/YYYY HH24:MI:SS'), TO_TIMESTAMP('15/04/2023 10:45:00', 'DD/MM/YYYY HH24:MI:SS'));

INSERT INTO estudiantes (identificador, nombre, apellido1, apellido2, fechanacimiento, fechamatricula, primerlogin, ultimologin) 
VALUES (2, 'Juan', 'Pérez', 'López', TO_DATE('20/06/1998', 'DD/MM/YYYY'), TO_DATE('01/09/2021', 'DD/MM/YYYY'), TO_TIMESTAMP('01/04/2023 09:15:00', 'DD/MM/YYYY HH24:MI:SS'), TO_TIMESTAMP('16/04/2023 13:45:00', 'DD/MM/YYYY HH24:MI:SS'));

INSERT INTO estudiantes (identificador, nombre, apellido1, apellido2, fechanacimiento, fechamatricula, primerlogin, ultimologin) 
VALUES (3, 'María', 'Gutiérrez', 'González', TO_DATE('10/11/1999', 'DD/MM/YYYY'), TO_DATE('02/09/2021', 'DD/MM/YYYY'), TO_TIMESTAMP('03/04/2023 09:45:00', 'DD/MM/YYYY HH24:MI:SS'), TO_TIMESTAMP('14/04/2023 21:05:00', 'DD/MM/YYYY HH24:MI:SS'));

INSERT INTO estudiantes (identificador, nombre, apellido1, apellido2, fechanacimiento, fechamatricula, primerlogin, ultimologin) 
VALUES (4, 'Carlos', 'Fernández', 'Rodríguez', TO_DATE('05/09/1997', 'DD/MM/YYYY'), TO_DATE('03/09/2021', 'DD/MM/YYYY'), TO_TIMESTAMP('02/04/2023 10:15:00', 'DD/MM/YYYY HH24:MI:SS'), TO_TIMESTAMP('15/04/2023 12:35:00', 'DD/MM/YYYY HH24:MI:SS'));

INSERT INTO estudiantes (identificador, nombre, apellido1, apellido2, fechanacimiento, fechamatricula, primerlogin, ultimologin) 
VALUES (5, 'Laura', 'Martínez', 'García', TO_DATE('03/02/1996', 'DD/MM/YYYY'), TO_DATE('01/09/2021', 'DD/MM/YYYY'), TO_TIMESTAMP('01/04/2023 11:25:00', 'DD/MM/YYYY HH24:MI:SS'), TO_TIMESTAMP('15/04/2023 22:01:00', 'DD/MM/YYYY HH24:MI:SS'));

INSERT INTO estudiantes (identificador, nombre, apellido1, apellido2, fechanacimiento, fechamatricula, primerlogin, ultimologin) 
VALUES (6, 'Manuel', 'Sánchez', 'Romero', TO_DATE('25/08/1997', 'DD/MM/YYYY'), TO_DATE('04/09/2021', 'DD/MM/YYYY'), TO_TIMESTAMP('01/04/2023 10:45:00', 'DD/MM/YYYY HH24:MI:SS'), TO_TIMESTAMP('16/04/2023 09:44:00', 'DD/MM/YYYY HH24:MI:SS'));
COMMIT;


#MYSQL

CREATE TABLE estudiantes (
  identificador INT NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido1 VARCHAR(50) NOT NULL,
  apellido2 VARCHAR(50),
  fechanacimiento DATE NOT NULL,
  fechamatricula DATE NOT NULL,
  primerlogin TIMESTAMP,
  ultimologin TIMESTAMP,
  PRIMARY KEY (identificador)
);

INSERT INTO estudiantes VALUES (1, 'María', 'García', 'González', '1995-06-23', '2021-09-01', '2021-09-01 09:30:00', '2022-03-15 10:23:12');
INSERT INTO estudiantes VALUES (2, 'Juan', 'Martínez', 'Sánchez', '1998-02-15', '2021-09-02', '2021-09-02 09:45:00', '2022-03-12 11:34:23');
INSERT INTO estudiantes VALUES (3, 'Lucía', 'Fernández', 'Pérez', '2000-11-30', '2021-09-03', '2021-09-03 10:00:00', '2022-03-14 12:45:31');
INSERT INTO estudiantes VALUES (4, 'Pablo', 'López', 'García', '1997-05-12', '2021-09-04', '2021-09-04 10:15:00', '2022-03-11 13:56:42');
INSERT INTO estudiantes VALUES (5, 'Ana', 'Sánchez', 'Martínez', '1999-08-08', '2021-09-05', '2021-09-05 10:30:00', '2022-03-10 14:08:57');
INSERT INTO estudiantes VALUES (6, 'Manuel', 'Pérez', 'González', '1996-03-17', '2021-09-06', '2021-09-06 10:45:00', '2022-03-13 15:21:05');
INSERT INTO estudiantes VALUES (7, 'Sara', 'González', 'Fernández', '1994-12-05', '2021-09-07', '2021-09-07 11:00:00', '2022-03-09 16:32:17');
INSERT INTO estudiantes VALUES (8, 'Javier', 'Sánchez', 'López', '1993-09-22', '2021-09-08', '2021-09-08 11:15:00', '2022-03-08 17:43:29');
INSERT INTO estudiantes VALUES (9, 'Laura', 'Martínez', 'Pérez', '2001-04-18', '2021-09-09', '2021-09-09 11:30:00', '2022-03-07 18:54:40');
INSERT INTO estudiantes VALUES (10, 'Carlos', 'García', 'Sánchez', '1992-07-10', '2021-09-10', '2021-09-10 11:45:00', '2022-03-06 19:05:52');






Seleccionar el nombre y la edad de los estudiantes (calculada a partir de la fecha de nacimiento).
SELECT nombre, TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) AS edad
FROM estudiantes;

Seleccionar el nombre y el número de días transcurridos desde la fecha de matrícula hasta la fecha actual.
SELECT nombre, DATEDIFF(CURDATE(), fecha_matricula) AS dias_transcurridos
FROM estudiantes;

Seleccionar el nombre y la fecha de matrícula de los estudiantes que se matricularon antes del 1 de abril de 2023.
SELECT nombre, fecha_matricula
FROM estudiantes
WHERE fecha_matricula < '2023-04-01';

Seleccionar el nombre y la fecha de último login de los estudiantes, y ordenar los resultados por fecha de último login en orden descendente.
SELECT nombre, fecha_ultimo_login
FROM estudiantes
ORDER BY fecha_ultimo_login DESC;

Seleccionar el nombre y la diferencia en días entre la fecha de matrícula y la fecha de nacimiento.
SELECT nombre, DATEDIFF(fecha_matricula, fecha_nacimiento) AS diferencia_dias
FROM estudiantes;

Mostrar el nombre y último login de todos los estudiantes que se hayan hecho login en los últimos 30 días.
SELECT nombre, fecha_ultimo_login
FROM estudiantes
WHERE fecha_ultimo_login >= DATE_SUB(CURDATE(), INTERVAL 30 DAY);

Mostrar el nombre y el número de días transcurridos desde la última vez que un estudiante inició sesión en el sistema.
SELECT nombre, DATEDIFF(CURDATE(), fecha_ultimo_login) AS dias_desde_ultimo_login
FROM estudiantes;

Mostrar el nombre y la fecha de matrícula de todos los estudiantes que se hayan matriculado en el tercer trimestre calculado a partir de la fechade matriculación.
SELECT nombre, fecha_matricula
FROM estudiantes
WHERE MONTH(fecha_matricula) BETWEEN 7 AND 9;

Mostrar el nombre y la fecha de nacimiento de todos los estudiantes que nacieron en el año 1997.
SELECT nombre, fecha_nacimiento
FROM estudiantes
WHERE YEAR(fecha_nacimiento) = 1997;

Mostrar el nombre y la fecha de matrícula de todos los estudiantes que se  hayan matriculado en un rango de fechas del 01/01/2021 al 01/01/2022.
SELECT nombre, fecha_matricula
FROM estudiantes
WHERE fecha_matricula BETWEEN '2021-01-01' AND '2022-01-01';

Mostrar el nombre y la fecha de matrícula de todos los estudiantes que se hayan matriculado en un día de la semana.
SELECT nombre, fecha_matricula
FROM estudiantes
WHERE DAYOFWEEK(fecha_matricula) IN (1, 7);

Obtener el nombre y la edad de los estudiantes en años y meses completos.
SELECT nombre, CONCAT(
    TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()), ' años ',
    TIMESTAMPDIFF(MONTH, fecha_nacimiento, CURDATE()) % 12, ' meses'
) AS edad_completa
FROM estudiantes;

Obtener los estudiantes que se matricularon hace más de un año y que no han iniciado sesión en los últimos 6 meses.
SELECT *
FROM estudiantes
WHERE fecha_matricula <= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
AND fecha_ultimo_login <= DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

Obtener los estudiantes que tienen más de 25 años y que se matricularon después del 1 de enero de 2022.
SELECT *
FROM estudiantes
WHERE TIMESTAMPDIFF(YEAR, fecha_nacimiento, CURDATE()) > 25
AND fecha_matricula > '2022-01-01';

Obtener los estudiantes que se matricularon en un día de fin de semana (sábado o domingo)
SELECT *
FROM estudiantes
WHERE DAYOFWEEK(fecha_matricula) IN (1, 7);
