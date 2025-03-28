------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------
--- TODOS LOS CASOS VISTOS EN ESTA LISTA SON PUROS EJEMPLOS,NINGUNO ES FUNCIONAL YA QUE DEBES APLICARLO A LAS TABLAS QUE TU HAS CREADO --- 
------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------


--CREAR TABLAS--
CREATE TABLE ejemplo (
ejemplo NUMBER(2) PRIMARY KEY, --Es la clave primaria --
ejemplo NUMBER(6) CONSTRAINT ejemplo_pk PRIMARY KEY, --CONSTRAINT significa darle un nombre a la pk por si la quieres usar en otra tabla 
ejemplo VARCHAR2(50) NOT NULL, -- significa que no puede estar vacio--
ejemplo VARCHAR2(50) UNIQUE, -- solo puede existir un correo igual--
ejemplo NUMBER(6) CHECK (ejemplo >= 0), --la opcion CHECK se usa para que lo unico que se pueda poner ahi sea lo que indica la (condicion)
ejemplo_2_1 VARCHAR(2), --se crea la columna llamada como el codigo_foraneo_ejemplo
FOREIGN KEY (ejemplo) REFERENCES  ejemplo(ejemplo) -- se pone primero la tabla en la que estas/quieres ponerlo 
                                                --y luego el nombre de la columna foranea y despues (codigo_foraneo)
);

--MODIFICAR TALAS--
ALTER TABLE ejemplo
ADD columna NUMBER(3)
;

--INSERTAR DATOS--
insert into ejemplo VALUES (1,'hola'); --se inserta en la tabla en base a las columnas los valores = 1 , 'hola'

--MODIFICAR DATOS--
update ejemplo --se actualiza la tabla
set --que haga lo siguiente:
apellido = 'garcia',-- indicas los datos nuevos que quieres introducir 
nombre = 'roldan'
where codigo = 1 --aqui indicas la condicion de donde quieres hacerlo 
;

--ELIMINAR DATOS--
 
 select * from ejemplo where nombre= 'sergio'; -- antes de borrar hay que hacer un select para listar que vamos a coger
 delete from ejemplo where nombre = 'sergio'; -- aqui ya lo borramos 
 
--SELECCIONAR DATOS--EJEMPLOS:
select all cod, nombre from asignaturas; -- aqui pedimos que muestre cod y nombre de la tabla asignaturas
select dni,direc from alumnos; --aqui direccion y dni de alumnos
select distinct dni from notas; -- aqui la funcion distinct te muestra los dni sin repetirlos 
select dni from notas; -- en este caso te mostraria todos,hasta duplicados

select distinct oficio, comision from emple E; -- muestra oficio y comision sin repetirlos de la tabla emple, pero asocia E a emple para que sea mas facil buscarlo
select all oficio, comision from emple E; --aqui muestra lo mismo pero hasta duplicados

select A.nombre from alum0405 A; --aqui el se usa el alias  A para una busqueda mas precisa de alumn0405
select nombre as nombre, fecha_nac as "Fecha de nacimiento" from alum0405 A; --aqui muestra el nombre y la fech_nac como "fehca de nacimiento" de la tabla alumn0405 A

select apellido as "Empleado", salario + comision as "Nomina" from emple; -- en este caso hacemos un calculo que es que sume salario + comision y que te lo muestre como "Nomina" 


select tema, LOWER(tema) as " en minusculas" from libreria; --selecciona la columna tema, y muestre en minusculas la columna(tema) y que te lo muestre "en minusculas" de la tabla libreria
select nombre, poblacion || ' (' || provincia || ')' as "Localidad" from alum0405; --selecciona el nombre y la poblacion añadiendo con tuberias(la privincia) como localidad de la tabla alumno


select oficio,apellido, salario from emple order by oficio, salario desc; --selecciona oficio,apellido,salario de la tabla emple ordenado por oficio y salario descenciente

select * from notas; --seleciona todo de la columna notas
select * from notas where dni ='12344345' AND nota >5;-- selecciona todo de notas donde dni es igual '' y nota es mayor que 5
select * from notas where cod >=5 or cod =1;-- selecciona todo de notas donde cod es mayor o igual que 5 o cod es igual a 1
select * from notas where dni='4448242' or not nota=8; --selecciona todo de notas donde dni sea '' y nota no sea igual a 8

select * from notas where nota =5 AND nota =4;--seleccionada todo de notas donde sea  igual a 5 y 4
select * from notas where nota =5 OR nota =4; --lo mismo de arriba pero que sea 5 o 4

select * from emple where salario > 2000 AND salario < 3000; --seleccionada de la tabla emple donde salario sea mayor de 2000 y salario sea menor de 3000
select * from emple where salario between 300 and 200; --selecciona de la tabla emple donde salario este entre 300 y 200

select * from emple where apellido like '__R%';--busca de la tabla emple donde apellido contenga dos caracteres antes de la R y cualquiera despues 

describe emple; --para mostrar todo--


------------------------
----FUNCIONES- LISTAS---
------------------------
--ABS-- da el valor absoluto 
SELECT ABS(-10) AS "valor absoluto" FROM dual; -- el valor absoluto de -10 es 10
SELECT valor, ABS(valor) AS "valor absoluto" FROM numeros;--dario el valor absoluto de numeros en una tabla llamada "valor absoluto"
SELECT ABS(15 - 25) AS "diferencia_absoluta" FROM dual; --aqui calcula la diferencia absoluta entre los numeros del parentesis
SELECT ABS(-1000 + 500) AS resultado_absoluto FROM dual; --aqui daria en negativo y el abs lo convierte en valor absoluto

--POWER--

SELECT POWER(2, 3) AS resultado FROM dual; --eleva dos elevado a la potencia 3 


SELECT base,exponente,POWER(base, exponente) AS resultado FROM numeros; --devuelve la columna (base) y(exponente) y el resultado de elevar la base de cada exponente


SELECT POWER(9, 0.5) AS raiz_cuadrada FROM dual; --aqui esta calculantdo la raiz cuadrada de 9

 
SELECT POWER(10, -2) AS resultado FROM dual; --aqui calcula la inversa del cuadrado

--ROUND--
SELECT ROUND(3.14159) AS resultado FROM dual; --redondea el numero del parentesis en este caso mostrara 3

SELECT ROUND(3.14159, 2) AS resultado FROM dual; --redondea el numero del paretesis indicando la precision que es 2(osea 2 decimales)

SELECT ROUND(-3.14159) AS resultado FROM dual; --La función ROUND también puede manejar números negativos. En este caso, el número -3.14159 se redondeará al entero más cercano, que es -3.

SELECT ROUND(3.5) AS resultado FROM dual; --Cuando el número a redondear tiene una fracción exactamente igual a 0.5, la función ROUND redondea hacia el valor más cercano con la mitad par. Por lo tanto, el número 3.5 se redondeará a 4.

--GREATES--
SELECT GREATEST(10, 5, 8, 15, 3) AS mayor_valor FROM dual; --Este ejemplo calculará el valor más grande entre los números 10, 5, 8, 15 y 3, y devolverá ese valor como resultado. En este caso, el resultado sería 15, ya que es el número más grande de la lista.

--LEAST-
SELECT LEAST(10, 5, 8, 15, 3) AS menor_valor FROM dual; --Este ejemplo calculará el valor más pequeño entre los números 10, 5, 8, 15 y 3, y devolverá ese valor como resultado. En este caso, el resultado sería 3, ya que es el número más pequeño de la lista.

----------------------------------
----FUNCIONES--GRUPO DE VALORES---
----------------------------------

--COUNT
--basicamente sirve para contar X numero que hay en una columna
SELECT COUNT(*) AS "total_empleados" FROM empleados; --Este ejemplo devolverá el número total de filas en la tabla empleados, que es el total de empleados.

SELECT COUNT(salario) AS "empleados_con_salario" FROM empleados; --Este ejemplo devolverá el número de empleados que tienen un valor distinto de nulo en la columna salario.

--SUM
SELECT SUM(numero) AS "total_ventas" FROM ventas;-- Este ejemplo devolverá la suma total de todos los numeros de venta registrados en la tabla ventas.

SELECT SUM(monto) AS total_ventas_mes FROM ventas WHERE MONTH(fecha) = 1; -- (Suponiendo que 1 representa el mes de enero) tambien puedes aplicar un where Este ejemplo devolverá la suma total de los montos de venta registrados en la tabla ventas para el mes de enero.

--MAX
SELECT MAX(salario) AS salario_maximo FROM empleados; --Este ejemplo devolverá el salario máximo entre todos los empleados registrados en la tabla empleados.

SELECT MAX(edad) AS edad_maxima FROM empleados WHERE departamento = 'Ventas'; -- puedes aplicar tambien un where Este ejemplo devolverá la edad máxima de los empleados que trabajan en el departamento de "Ventas".

--MIN
SELECT MIN(salario) AS salario_minimo FROM empleados;--Este ejemplo devolverá el salario mínimo entre todos los empleados registrados en la tabla empleados.

SELECT MIN(edad) AS edad_minima FROM empleados WHERE departamento = 'Ventas'; --puedes aplicar un where este ejemplo devolverá la edad mínima de los empleados que trabajan en el departamento de "Ventas".

----------------------------------
----FUNCIONES--VALORES CARACTER---
----------------------------------

--CONCAT: Se utiliza para concatenar dos o más cadenas de caracteres.
SELECT CONCAT('Hola', ' ', 'mundo') AS resultado;
-- Devuelve 'Hola mundo'

--UPPER: Convierte una cadena de caracteres a mayúsculas.
SELECT CONCAT('Hola', ' ', 'mundo') AS resultado;
-- Devuelve 'Hola mundo'

--LOWER: Convierte una cadena de caracteres a minúsculas.
SELECT LOWER('HOLA') AS resultado;
-- Devuelve 'hola'

--INITCAP: Convierte la primera letra de cada palabra en una cadena de caracteres a mayúscula y el resto en minúscula.
SELECT INITCAP('hOla muNdO') AS resultado;
-- Devuelve 'Hola Mundo'

--REPLACE: Reemplaza todas las ocurrencias de una subcadena dentro de una cadena con otra subcadena.
SELECT REPLACE('hola mundo', 'mundo', 'amigo') AS resultado;
-- Devuelve 'hola amigo'

--INSTR: Devuelve la posición de la primera ocurrencia de una subcadena dentro de una cadena
SELECT INSTR('hola mundo', 'mundo') AS posicion;
-- Devuelve 6

--DATE: No es exactamente una función de valores de caracteres, sino una función para manejar fechas y horas. En Oracle SQL, DATE se utiliza para representar valores de fecha y hora.
SELECT DATE '2022-01-01' AS fecha;
-- Devuelve '2022-01-01 00:00:00'
----------------------------------
----FUNCIONES--FECHAS-------------
----------------------------------
--SYSDATE
SELECT SYSDATE FROM dual; --nos da la fecha actual 

--SYSTIMESTAMP
SELECT SYSTIMESTAMP FROM dual; --obtener la fecha y hora actual con mayor precision

--DBTMIEZONE
SELECT DBTIMEZONE FROM dual; --obtendremos la zona horaria de la base de datos

--CURRENT_DATE
SELECT CURRENT_DATE FROM dual;--nos da la fehca actual sin la hora

--CURRENT_TIMESTAMP
SELECT CURRENT_TIMESTAMP FROM dual; --Obtener la fecha y hora actual en la zona horaria de la sesión:

--ADDMONTHS
SELECT ADD_MONTHS('01-Jan-2024', 3) FROM dual;-- Sumar tres meses a una fecha específica (por ejemplo, '01-Jan-2024'):

--LAST_DAY
SELECT LAST_DAY('15-Feb-2024') FROM dual;-- Obtener el último día del mes para una fecha específica (por ejemplo, '15-Feb-2024')

----------------------------------
----FUNCIONES--CONVERSION DATOS---
----------------------------------
--DUAL
SELECT 1 + 1 FROM DUAL; --Este comando devolverá el resultado de la suma de 1 más 1, que es 2.

--TO_CHAR
SELECT TO_CHAR(SYSDATE, 'DD-MON-YYYY HH:MI:SS') AS fecha_actual FROM DUAL; --Este comando devolverá la fecha y hora actual en el formato 'DD-MON-YYYY HH:MI:SS', por ejemplo, '06-MAR-2024 15:30:00'.

--TO_NUMBER
SELECT TO_NUMBER('12345') AS numero_convertido FROM DUAL; --Este comando devolverá el número 12345 como un valor numérico en lugar de una cadena de caracteres.

--TO_DATE
SELECT TO_DATE('2024-03-06', 'YYYY-MM-DD') AS fecha_convertida FROM DUAL; --Este comando devolverá la fecha '06 de marzo de 2024' en formato DATE.

----------------------------------
----FUNCIONES--NULL---------------
----------------------------------
SELECT NVL(nombre_columna, 'Valor predeterminado') FROM tabla;--Esta consulta seleccionará la columna 'nombre_columna', y si alguno de sus valores es nulo, se mostrará 'Valor predeterminado' en su lugar. Si los valores no son nulos, se mostrarán los valores originales de la columna.

--En resumen, NULL representa la ausencia de un valor,mientras que NVL es una función que permite manejar valores nulos sustituyéndolos por valores específicos en consultas SQL.


----------------------------
--AGRUPACION DE ELEMENTOS---
----------------------------

SELECT ---------> LISTA DE SELECCION---           
---------------------------------------
FROM -------->ORIGEN DE DATOS---------
---------------------------------------
WHERE----->CONDICION DE SELECCION-----
---------------------------------------
GROUP BY----->COLUMNAS DE AGRUPACION
---------------------------------------
HAVING----->CONDICION DE SELECCION
---------------------------------------
ORDER BY----->COLUMNAS DE ORDENACION

---------------------------------------------------------
--RESUMEN Y PEQUEÑAS EXPLICACIONES DE FUNCIONES Y USOS:--
---------------------------------------------------------
--
--

UPPER(string): Convierte una cadena de caracteres a mayúsculas.
LOWER(string): Convierte una cadena de caracteres a minúsculas.
INITCAP(string): Convierte la primera letra de cada palabra en una cadena de caracteres a mayúscula.
SUBSTR(string, start_position, length): Extrae una subcadena de una cadena de caracteres, comenzando desde una posición especificada y de una longitud dada.
LENGTH(string): Devuelve la longitud de una cadena de caracteres.
FUNCIONES NUMÉRICAS:

ROUND(number, precision): Redondea un número al número especificado de dígitos decimales.
TRUNC(number, precision): Trunca un número al número especificado de dígitos decimales.
ABS(number): Devuelve el valor absoluto de un número.
MOD(dividend, divisor): Devuelve el resto de la división de dos números.
FUNCIONES DE FECHA Y HORA:

SYSDATE: Devuelve la fecha y hora actuales del sistema.
TO_DATE(string, format): Convierte una cadena de caracteres en un tipo de dato de fecha.
TO_CHAR(date, format): Convierte un tipo de dato de fecha en una cadena de caracteres con un formato específico.
MONTHS_BETWEEN(date1, date2): Devuelve el número de meses entre dos fechas.
ADD_MONTHS(date, num_months): Agrega un número específico de meses a una fecha.
FUNCIONES DE CONDICIÓN:

CASE: Permite realizar evaluaciones condicionales en una expresión SQL.
NVL(expr1, expr2): Devuelve expr2 si expr1 es nulo, de lo contrario, devuelve expr1.
FUNCIONES DE AGREGACIÓN:

SUM(column): Calcula la suma de los valores de una columna.
AVG(column): Calcula el promedio de los valores de una columna.
COUNT(*): Cuenta el número de filas en un conjunto de resultados.
MAX(column): Devuelve el valor máximo de una columna.
MIN(column): Devuelve el valor mínimo de una columna.


--------------------------------------------------------------------------------------------------------------------------------------------------------
------------------
--COUNT GROUP BY--
------------------
/*COUNT:

COUNT es una función de agregación que se utiliza para contar el número de filas en un conjunto de resultados.
Se puede utilizar de diferentes maneras:
COUNT(*): Cuenta el número total de filas en un conjunto de resultados.
COUNT(column): Cuenta el número de filas en un conjunto de resultados donde el valor de la columna especificada no es nulo.
Por ejemplo, SELECT COUNT(*) FROM emple; devolverá el número total de filas en la tabla emple.
HAVING:

HAVING se utiliza junto con la cláusula GROUP BY para filtrar los resultados de una consulta basada en condiciones agregadas.
Mientras que WHERE se utiliza para filtrar filas individuales, HAVING se utiliza para filtrar grupos de filas agregadas.
Por ejemplo, si quieres seleccionar solo los grupos donde la cantidad de filas es mayor que cierto valor, usarías HAVING.
Ejemplo de uso conjunto de COUNT y HAVING:

Supongamos que tienes una tabla ventas con columnas producto y cantidad_vendida. Quieres encontrar los productos que tienen más de 100 unidades vendidas. Puedes hacerlo así:
*/

SELECT producto, COUNT(*) AS total_ventas
FROM ventas
GROUP BY producto
HAVING COUNT(*) > 100;
/*
En este ejemplo:

COUNT(*) cuenta el número de ventas para cada producto.
GROUP BY producto agrupa las ventas por producto.
HAVING COUNT(*) > 100 filtra los grupos para mostrar solo aquellos productos que tienen más de 100 ventas.
En resumen, COUNT se usa para contar filas o valores no nulos, y HAVING se utiliza para filtrar grupos agregados basados en condiciones agregadas.
*/


--------------
----HAVING----
--------------

--Supongamos que tenemos una tabla llamada "ventas" con las siguientes columnas: "producto", "cantidad" y "precio_unitario". Queremos encontrar los productos cuyo monto total de ventas sea superior a $1000:

SELECT producto, SUM(cantidad * precio_unitario) AS monto_total
FROM ventas
GROUP BY producto
HAVING SUM(cantidad * precio_unitario) > 1000;

/*Este comando agrupa las ventas por producto y muestra el monto total de ventas para cada producto,
pero solo devuelve los productos cuyo monto total de ventas es superior a $1000.
En resumen, la cláusula HAVING en SQL se utiliza junto con la cláusula GROUP BY para filtrar grupos de filas basados en condiciones que involucran valores agregados. 
Esto es útil cuando deseas aplicar condiciones a resultados agregados después de la agrupación.*/









