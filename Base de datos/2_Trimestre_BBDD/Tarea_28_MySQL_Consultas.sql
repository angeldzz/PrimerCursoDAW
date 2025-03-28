-- Lista el primer apellido de todos los empleados.
SELECT APELLIDO1 FROM EMPLEADO;

-- Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
SELECT DISTINCT(APELLIDO1) FROM EMPLEADO;

-- Lista todas las columnas de la tabla empleado.
SELECT * FROM EMPLEADO;

-- Lista el nombre y los apellidos de todos los empleados.
SELECT NOMBRE,APELLIDO1,APELLIDO2 FROM EMPLEADO;

-- Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado.
SELECT ID_DEPARTAMENTO FROM EMPLEADO;

-- Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los identificadores 
--que aparecen repetidos.
SELECT DISTINCT(ID_DEPARTAMENTO) FROM EMPLEADO;

-- Lista el nombre y apellidos de los empleados en una única columna.
SELECT CONCAT(NOMBRE, APELLIDO1,APELLIDO2) FROM EMPLEADO;

-- Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
SELECT UPPER(CONCAT(NOMBRE, APELLIDO1,APELLIDO2)) FROM EMPLEADO;

-- Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
SELECT LOWER(CONCAT(NOMBRE, APELLIDO1,APELLIDO2)) FROM EMPLEADO;

-- Lista el identificador de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, una mostrará únicamente 
--los dígitos del nif y la otra la letra.
SELECT id, SUBSTRING(nif, 1, LENGTH(nif)-1) AS NUMEROS_NIF, RIGHT(nif, 1) AS letra_nif FROM empleado;

-- Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. Para calcular este dato tendrá que 
--| restar al valor del presupuesto inicial (columna presupuesto) los gastos que se han generado (columna gastos). Tenga en cuenta 
--| que en algunos casos pueden existir valores negativos. Utilice un alias apropiado para la nueva columna columna que está calculando.
SELECT NOMBRE, PRESUPUESTO-GASTOS AS PRESUPUESTO_ACTUAL FROM DEPARTAMENTO;

-- Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
SELECT NOMBRE, PRESUPUESTO-GASTOS AS PRESUPUESTO_ACTUAL FROM DEPARTAMENTO ORDER BY PRESUPUESTO_ACTUAL ASC;

-- Lista el nombre de todos los departamentos ordenados de forma ascendente.
SELECT NOMBRE FROM DEPARTAMENTO ORDER BY NOMBRE ASC;

-- Lista el nombre de todos los departamentos ordenados de forma descendente.
SELECT NOMBRE FROM DEPARTAMENTO ORDER BY NOMBRE DESC;

-- Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar 
--| sus apellidos y luego su nombre.
SELECT NOMBRE,APELLIDO1,APELLIDO2 FROM EMPLEADO ORDER BY APELLIDO1,NOMBRE DESC;

-- Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
SELECT NOMBRE, PRESUPUESTO FROM departamento ORDER BY PRESUPUESTO DESC LIMIT 3;

-- Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
SELECT NOMBRE, PRESUPUESTO FROM departamento ORDER BY PRESUPUESTO ASC LIMIT 3;

-- Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
SELECT NOMBRE, GASTOS FROM departamento ORDER BY GASTOS DESC LIMIT 2;

-- Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
SELECT NOMBRE, GASTOS FROM departamento ORDER BY GASTOS ASC LIMIT 2;

-- Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila se debe incluir en la respuesta. 
--| La respuesta debe incluir todas las columnas de la tabla empleado.
SELECT * FROM EMPLEADO LIMIT 5 OFFSET 2 ;

-- Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a 150000 euros.
SELECT NOMBRE, PRESUPUESTO FROM departamento WHERE PRESUPUESTO>= 150000;

-- Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.
SELECT NOMBRE, GASTOS FROM departamento WHERE GASTOS<= 5000 ;

-- Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto 
--| entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
SELECT NOMBRE FROM departamento WHERE PRESUPUESTO>= 100000 AND PRESUPUESTO<=200000;

-- Devuelve una lista con el nombre de los departamentos que  tienen un presupuesto entre 100000 y 200000 euros.
-- Sin utilizar el operador BETWEEN.
SELECT NOMBRE FROM departamento WHERE PRESUPUESTO>= 100000 AND PRESUPUESTO<=200000;

-- Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros.
-- Utilizando el operador BETWEEN.
SELECT NOMBRE, PRESUPUESTO FROM departamento WHERE PRESUPUESTO BETWEEN 100000 AND 200000;

-- Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde
-- los gastos sean mayores que el presupuesto del que disponen.
SELECT NOMBRE,GASTOS, PRESUPUESTO FROM departamento WHERE GASTOS > PRESUPUESTO;

-- Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde
-- los gastos sean menores que el presupuesto del que disponen.
SELECT NOMBRE,GASTOS, PRESUPUESTO FROM departamento WHERE GASTOS < PRESUPUESTO;

-- Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde 
--los gastos sean iguales al presupuesto del que disponen.
SELECT NOMBRE,GASTOS, PRESUPUESTO FROM departamento WHERE GASTOS = PRESUPUESTO;

-- Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
SELECT * FROM EMPLEADO WHERE APELLIDO2 IS NULL;

-- Lista todos los datos de los empleados cuyo segundo apellido no sea  NULL.
SELECT * FROM EMPLEADO WHERE APELLIDO2 IS NOT NULL;

-- Lista todos los datos de los empleados cuyo segundo apellido sea López.
SELECT * FROM EMPLEADO WHERE APELLIDO2 = "lÓPEZ";

-- Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
SELECT * FROM EMPLEADO WHERE APELLIDO2 = "DÍAZ" OR "MORENO";

-- Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.
SELECT * FROM EMPLEADO WHERE APELLIDO2 IN ("DÍAZ", "MORENO");

-- Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
SELECT NOMBRE,APELLIDO1,APELLIDO2,NIF FROM EMPLEADO WHERE ID_departamento = 3;

-- Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
SELECT NOMBRE,APELLIDO1,APELLIDO2,NIF FROM EMPLEADO WHERE ID_departamento = (3||4||5);