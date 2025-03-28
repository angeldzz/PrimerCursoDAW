-- *************************************************************************************
-- ***************************    EJERCICIO 1     **************************************
-- *************************************************************************************
CREATE TABLE DEPARTAMENTO(
ID_DEP NUMBER(10) PRIMARY KEY,
NOMBRE VARCHAR2(50) NOT NULL
);
CREATE TABLE PROFESOR(
ID_PROF NUMBER(10) PRIMARY KEY,
NIF VARCHAR2(9) NOT NULL,
NOMBRE VARCHAR2(25) NOT NULL,
APELLIDO1 VARCHAR2(50) NOT NULL,
APELLIDO2 VARCHAR2(50) NOT NULL,
CIUDAD VARCHAR2(25) NOT NULL,
DIRECCION VARCHAR2(50) NOT NULL,
TELEFONO VARCHAR2(9) NOT NULL,
FECHA_NACIMIENTO DATE,
SEXO VARCHAR(1) CHECK(SEXO IN('H','M')) NOT NULL,
ID_DEPARTAMENTO NUMBER(10),
FOREIGN KEY(ID_DEPARTAMENTO) REFERENCES DEPARTAMENTO(ID_DEP)
);
CREATE TABLE GRADO(
ID_GRADO NUMBER(10) PRIMARY KEY,
NOMBRE VARCHAR2(100) NOT NULL
);
CREATE TABLE ASIGNATURA(
ID_ASIGNATURA NUMBER(10) PRIMARY KEY,
NOMBRE VARCHAR2(100) NOT NULL,
CREDITO NUMBER NOT NULL,
TIPO VARCHAR2(30),
CURSO NUMBER(3) NOT NULL,
CUATRIMESTRE NUMBER(3) NOT NULL,
ID_PROF NUMBER(10) NOT NULL,
ID_GRADO NUMBER(10) NOT NULL,
FOREIGN KEY (ID_PROF)REFERENCES PROFESOR(ID_PROF),
FOREIGN KEY (ID_GRADO) REFERENCES GRADO(ID_GRADO)
);
CREATE TABLE ALUMNO(
ID_ALUM NUMBER(10) PRIMARY KEY,
NIF VARCHAR2(9) NOT NULL,
NOMBRE VARCHAR2(25) NOT NULL,
APELLIDO1 VARCHAR2(50) NOT NULL,
APELLIDO2 VARCHAR2(50) NOT NULL,
CIUDAD VARCHAR2(25) NOT NULL,
DIRECCION VARCHAR2(50) NOT NULL,
TELEFONO VARCHAR2(9) NOT NULL,
FECHA_NACIMIENTO DATE NOT NULL,
SEXO VARCHAR2(1) CHECK(SEXO IN ('H','M')) NOT NULL
);
CREATE TABLE CURSO_ESCOLAR(
ID_CURSO_ESCOLAR NUMBER(10)PRIMARY KEY,
ANYO_INICIO DATE NOT NULL,
ANYO_FIN DATE NOT NULL
);
CREATE TABLE ALUMNO_SE_MATRICULA_ASIGNATURA(
ID_ALUMNO NUMBER(10),
ID_ASIGNATURA NUMBER(10),
ID_CURSO_ESCOLAR NUMBER(10),
CONSTRAINT MATRICULAPK PRIMARY KEY(ID_ALUMNO,ID_ASIGNATURA,ID_CURSO_ESCOLAR),
FOREIGN KEY (ID_ALUMNO) REFERENCES ALUMNO(ID_ALUM),
FOREIGN KEY (ID_ASIGNATURA) REFERENCES ASIGNATURA(ID_ASIGNATURA),
FOREIGN KEY (ID_CURSO_ESCOLAR) REFERENCES CURSO_ESCOLAR(ID_CURSO)
);
-- *************************************************************************************
-- ***************************    EJERCICIO 2     **************************************
-- *************************************************************************************

-- 1.	Mostrar el nombre de todos los jugadores ordenados alfabéticamente en orden descendente.
SELECT NOMBRE FROM JUGADORES ORDER BY NOMBRE DESC;
-- 2.	Mostrar el nombre de los jugadores cuyo apellido termine en "r" ordenados alfabéticamente.
SELECT NOMBRE FROM JUGADORES WHERE NOMBRE LIKE '%r' ORDER BY NOMBRE ASC;
-- 3.	Mostrar el nombre de los jugadores que sean pivots (C) con más de 200 libras por orden alfabético.
SELECT NOMBRE FROM JUGADORES WHERE (POSICION LIKE 'c' OR POSICION LIKE 'C') AND (PESO >= 200) ORDER BY NOMBRE ASC;
-- 4.	Mostrar los equipos donde su ciudad empieza por c, por o por l, que la ciudad contenga alguna o y no pertenezcan a la conferencia 'SouthEast'.
SELECT NOMBRE FROM EQUIPOS WHERE CIUDAD LIKE 'C%' OR CIUDAD LIKE 'O%'OR CIUDAD LIKE 'L%' AND CIUDAD LIKE '%o%' AND CONFERENCIA NOT LIKE 'SouthEast';
-- 5.	Mostrar todos los jugadores del equipo “Raptors�? y de los "Warriors" mostrados alfabéticamente y todos los miembros del mismo equipo seguidos.
SELECT NOMBRE_EQUIPO, NOMBRE FROM JUGADORES WHERE NOMBRE_EQUIPO LIKE 'Raptors' OR NOMBRE_EQUIPO LIKE 'Warriors' ORDER BY NOMBRE_EQUIPO,NOMBRE ASC ;
-- 6.	Mostrar el número de jugadores de los "Lakers".
SELECT COUNT(NOMBRE) FROM JUGADORES WHERE NOMBRE_EQUIPO LIKE 'Lakers';
-- 7.	Mostrar la cantidad mayor de puntos por partido de cada temporada.
SELECT TEMPORADA, MAX(PUNTOS_LOCAL),MAX(PUNTOS_VISITANTE) FROM PARTIDOS GROUP BY TEMPORADA;
-- 8.	Mostrar la frase "Temporada: " y a continuación la temporada con el nombre de columna "Temporada jugada" y la frase "Puntos de por partido: " y a continuación los puntos por partido, con nombre de columna llamada "Puntos Gasol", UTILIZANDO una función de concatenación, de la tabla estadísticas de Pau Gasol (Gasol es el jugador 66). 
SELECT CONCAT('Temporada: ',TEMPORADA) AS "TEMPORADA JUGADA", CONCAT('PUNTOS POR PARTIDO: ',PUNTOS_POR_PARTIDO) AS "PUNTOS GASOL" FROM ESTADISTICAS WHERE JUGADOR = 66 ORDER BY TEMPORADA ASC;
-- 9.	Mostrar la frase "Temporada: " y a continuación la temporada con el nombre de columna "Temporada jugada" y la frase "Puntos de por partido: " y a continuación los puntos por partido, con nombre de columna llamada "Puntos Gasol", SIN UTILIZAR una función de concatenación, de la tabla estadísticas de Pau Gasol (Gasol es el jugador 66).
SELECT 'TEMPORADA: ' || TEMPORADA AS "TEMPORADA JUGADA", 'PUNTOS DE POR PARTIDO: ' || PUNTOS_POR_PARTIDO AS "PUNTOS GASOL" FROM ESTADISTICAS  WHERE JUGADOR = 66 ORDER BY TEMPORADA ASC;
-- 10.	Mostrar todos los datos de los jugadores (tabla jugadores) cuyo nombre empiece por “AL�? y cuya posición no contenga una “C�?.
SELECT NOMBRE,POSICION FROM JUGADORES WHERE NOMBRE LIKE 'Al%' and POSICION NOT LIKE '%C%';
-- 11.	Mostrar la suma de puntos que han conseguido los "Pistons" como equipo visitante
SELECT EQUIPO_VISITANTE, COUNT(PUNTOS_VISITANTE) AS "SUMA DE PUNTOS" FROM PARTIDOS group by EQUIPO_VISITANTE having EQUIPO_VISITANTE LIKE 'Pistons';
-- 12.	Mostrar el nombre de los jugadores, el equipo en minúsculas y las dos primeras letras del equipo en mayúsculas de aquellos jugadores que pesen más de 200 libras y menos de 300, SIN utilizar la función Between.
SELECT NOMBRE, LOWER(NOMBRE_EQUIPO),UPPER(SUBSTR(NOMBRE_EQUIPO,1,2)) AS "DOS PRIMERAS LETRAS" FROM JUGADORES WHERE PESO >= 200 AND PESO <= 300;
-- 13.	Mostrar la media de puntos por partido, redondeados, de Kobe Bryant (Kobe es el jugador 62).
SELECT ROUND(AVG(PUNTOS_POR_PARTIDO)) AS "PUNTOS DE KOBE" FROM ESTADISTICAS WHERE JUGADOR = 62;
-- 14.	Mostrar las 6 primeras filas de la tabla Equipos ordenados alfabéticamente descendentemente.
SELECT * FROM EQUIPOS  ORDER BY NOMBRE ASC FETCH FIRST 6 ROWS ONLY;
-- 15.	Mostrar 3 filas a partir de la 6ª fila de la tabla jugadores
SELECT * FROM JUGADORES  ORDER BY NOMBRE ASC  FETCH FIRST 3 ROWS ONLY;
-- 16.	Mostrar la temporada y la media de puntos, redondeado a 2 decimales,  como local de CADA temporada de los “Bulls�?, ordenado por media de puntos en orden descendente.
SELECT TEMPORADA, ROUND(AVG(PUNTOS_LOCAL),2) FROM PARTIDOS WHERE EQUIPO_LOCAL LIKE 'Bulls' GROUP BY TEMPORADA ORDER BY AVG(PUNTOS_LOCAL) DESC;
-- 17.	Mostrar la temporada y la media de puntos, redondeado a 2 decimales, como visitante de CADA temporada de los “Cavaliers�?, ordenado por media de puntos en orden ascendente, de aquellas temporadas cuya media de puntos como visitante sea superior a 100 puntos.
SELECT TEMPORADA, ROUND(AVG(PUNTOS_VISITANTE),2) FROM PARTIDOS WHERE EQUIPO_VISITANTE LIKE 'Cavaliers' GROUP BY TEMPORADA  HAVING AVG(PUNTOS_VISITANTE) > 100 ORDER BY AVG(PUNTOS_VISITANTE)ASC;
-- 18.	Mostrar el nombre del equipo EN MAYÚSCULAS y la media del peso de los jugadores, de cada equipo, cuya media de pesos sean exclusivamente 221, 223, 224 y 230.
SELECT UPPER(NOMBRE_EQUIPO),AVG(PESO) FROM JUGADORES GROUP BY NOMBRE_EQUIPO HAVING AVG(PESO)=221 OR AVG(PESO)=223 OR AVG(PESO)=224 OR AVG(PESO)=230;
-- 19.	Mostrar el nombre del equipo local como “Equipo Local�?, la mayor puntuación obtenida de local como “Mayor puntuación como local�?,
--la menor puntuación obtenida de local como “Menos puntuación como local�?, la diferencia de puntos entre la mayor y la menor puntuación como
--“Diferencia de puntos�?, y la media de puntos de local, redondeado a 2 decimales, como “Media de puntos como local�? de los “Bulls�? y de 
--los “Hornets�?, en una sola sentencia SQL. 
SELECT EQUIPO_LOCAL AS "EQUIPO LOCAL",
MAX(PUNTOS_LOCAL) AS "MAYOR PUNTUACION COMO LOCAL",
MIN(PUNTOS_LOCAL) AS "MENOR PUNTUACION COMO LOCAL",
(MAX(PUNTOS_LOCAL)-MIN(PUNTOS_LOCAL)) AS "DIFERENCIA DE PUNTOS",
ROUND(AVG(PUNTOS_LOCAL),2) AS "MEDIA DE PUNTOS LOCAL"
FROM PARTIDOS
GROUP BY EQUIPO_LOCAL
HAVING EQUIPO_LOCAL LIKE 'Bulls' OR EQUIPO_LOCAL LIKE 'Hornets';
-- 20.	Mostrar el nombre del equipo, la posición como “Posic.�? y el número de jugadores que juegan en esa posición como “Número de jugadores en la posición�?, de todos los equipos (tabla JUGADORES) pero sólo aquellas posiciones que contengan una “g�? en alguna parte de la posición.
SELECT NOMBRE_EQUIPO, POSICION AS "POSIC",COUNT(*) FROM JUGADORES WHERE POSICION LIKE '%G%' OR POSICION LIKE '%g%' GROUP BY POSICION,NOMBRE_EQUIPO;
-- 21.	Mostrar el nombre de los jugadores y el peso, en libras y en kilos (1 libra = 0,45 kg), de los jugadores que pesen 175 o 180 libras y el nombre del equipo contenga la letra "t" en cualquier posición.
SELECT NOMBRE, (PESO*0.45) FROM JUGADORES WHERE (PESO=175 OR PESO=180) AND (NOMBRE_EQUIPO LIKE '%T%' OR NOMBRE_EQUIPO LIKE '%t%');
-- 22.	Mostrar nombre de los equipos (sólo una vez), de la tabla jugadores, cuyo nombre (de equipo) sea de 4 caracteres

-- 23.	Actualiza el dato de la conferencia de todos los equipos para poner Este dónde corresponda.

-- 24.	Actualiza el peso de los jugadores que pesen más de 300 libras de forma que les sumes 5 libras.
UPDATE JUGADORES
SET PESO = PESO+5
WHERE PESO>=300;
-- 25.	Actualiza el nombre del equipo, poniendo el nombre actual, después un " - " y seguidamente el numero de caracteres del nombre, de los equipos de la División "Central".


-- *************************************************************************************
-- ***************************    EJERCICIO 3     **************************************
-- *************************************************************************************

-- 1.	Mostrar el título del libro y el año de edición.
SELECT TITULO, EDICION FROM LIBROS;
-- 2.	Mostrar el título del libro y la fecha de edición del mismo en el siguiente formato (datos inventados): "Martes, 10 de Febrero de 2001". (OJO: el día y el mes sólo tienen la primera letra en mayúscula)
SELECT TITULO,  TO_CHAR(EDICION, 'DAY, DD "de" MONTH "de" YYYY') AS "EDICION" FROM LIBROS;
-- 3.	Mostrar el título del libro y los años que tiene desde que se editó con respecto a la fecha actual.
SELECT TITULO, EDICION-SYSDATE FROM LIBROS;
-- 4.	Mostrar el título, la fecha de edición, el año de edición y el texto "Se editó en la semana nº: " seguido del número de la semana del año en que se editó, de aquellos libros que se hayan editado en años posteriores al año 2000.

-- 5.	Muestra el título, la fecha de edicion, la “fecha de reimpresión�? (siendo esta 4 meses después de la fecha de edición) y las tres primeras letras del mes de la fecha de reimpresión.

