/*
1) De la tabla customer, muestra el n�mero de clientes que hay en cada pa�s.
*/
SELECT CITY, COUNT(CUSTOMERID) 
FROM CUSTOMER 
GROUP BY CITY;
/*
2) Repite la consulta anterior pero ahora ordenada de mayor a menor.
*/
SELECT CITY, COUNT(CUSTOMERID) 
FROM CUSTOMER GROUP BY CITY 
ORDER BY COUNT(CUSTOMERID) DESC;
/*
3) De la tabla customer, muestra el n�mero de clientes pero solo de los pa�ses 
que tienen m�s de uno
*/
SELECT CITY, COUNT(CUSTOMERID) 
FROM CUSTOMER GROUP BY CITY 
HAVING COUNT(CUSTOMERID)1;
/*
4) Por cada oficio de la tabla EMPLE, muestra el nombre del oficio, el n�mero de
personas que hay y el total de salarios de cada grupo.
*/
SELECT OFICIO, COUNT(EMP_NO),SUM(SALARIO) 
FROM EMPLE 
GROUP BY OFICIO;
/*
5) De la tabla EMPLE, muestra el n�mero de departamento y el salario m�ximo de 
sus empleados, de aquellos departamentos que tienen un salario medio superior 
a 2000.
*/
SELECT DEPT_NO, MAX(SALARIO) 
FROM EMPLE GROUP BY DEPT_NO 
HAVING AVG(SALARIO)  2000;
/*
6) De la tabla EMPLE muestra el salario medio y m�ximo de los departamentos cuyo
salario medio es inferior a 2000
*/
SELECT AVG(SALARIO),MAX(SALARIO) 
FROM EMPLE GROUP BY DEPT_NO 
HAVING AVG(SALARIO) 2000;
/*
7) Por cada oficio de la tabla EMPLE, muestra el nombre del oficio, el n�mero de
personas que hay y el total de salarios de cada grupo solo para los salarios que
est�n entre los 6000 y los 7000 �.
*/
SELECT OFICIO, COUNT(APELLIDO),SUM(SALARIO) 
FROM EMPLE GROUP BY OFICIO 
HAVING SUM(SALARIO) BETWEEN 6000 AND 7000;
/*
8) De la tabla EMPLE, muestra el n�mero de departamento, el n�mero de empleados 
del departamento y el salario medio de sus empleados, de aquellos empleados cuyo
oficio sea VENDEDOR
*/
SELECT DEPT_NO, COUNT(), AVG(SALARIO) 
FROM EMPLE WHERE OFICIO = 'VENDEDOR'
GROUP BY DEPT_NO;

/*
9) De la tabla EMPLE, muestra para cada n�mero de departamento y para cada oficio
a la vez, el n�mero de empleados y el salario medio
*/
SELECT dept_no,oficio, Count(apellido) AS "EMPLEADOS",AVG(Salario) AS "SALARIO MEDIO" FROM EMPLE Group by dept_no,oficio order by dept_no asc;
/*
10) De la tabla EMPLE, muestra el n�mero de departamento, el n�mero de empleados
del departamento y el salario medio de sus empleados, de aquellos empleados cuyo
oficio sea DIRECTOR y la media del salario sea mayor o igual a 2900 � en orden 
ascendente  
*/
SELECT DEPT_NO AS "DEPARTAMENTO DIRECTORES", COUNT(APELLIDO) AS "EMPLEADOS", AVG(SALARIO) AS "SALARIO MEDIO"
FROM EMPLE
WHERE OFICIO = 'DIRECTOR'
GROUP BY DEPT_NO
HAVING AVG(SALARIO) >= 2900
ORDER BY "SALARIO MEDIO" ASC;
/*
11) De la tabla LIBRERIA extrae cu�ntos ejemplares de inform�tica se encuentran 
en el estante A
*/
SELECT * FROM LIBRERIA 
WHERE ESTANTE ='A';
/*
12) De la tabla LIBRERIA extrae cu�ntos temas distintos hay para cada estante 
ordenados por n�mero de temas de manera descendente
*/
SELECT ESTANTE, COUNT(DISTINCT TEMA) AS "TEMAS DISTINOS"
FROM LIBRERIA GROUP BY ESTANTE 
ORDER BY COUNT(DISTINCT TEMA) DESC;
/*
13) De la tabla EMPLE extrae el n�mero de empleados que hay por cada oficio cuyos
oficios sean o empleado o analista, y cuya fecha de alta sea posterior al 01011991
*/
SELECT OFICIO, COUNT(APELLIDO) AS "N� EMPLEADOS" 
FROM EMPLE 
WHERE (OFICIO = 'EMPLEADO' OR OFICIO = 'ANALISTA') AND FECHA_ALT >= '01-01-1991'
GROUP BY OFICIO;
/*
14) De la tabla customer, muestra el n�mero de clientes que hay en cada ciudad y
c�digo postal.
*/
SELECT CITY,POSTALCODE,COUNT(*) AS "CLIENTES" FROM CUSTOMER GROUP BY CITY,POSTALCODE ORDER BY CITY ASC;
/*
15) De la tabla EMPLE muestra el n�mero de departamento y el salario m�nimo, 
siempre y cuando ese salario m�nimo sea menor a 1500 �
*/
SELECT DEPT_NO, MIN(SALARIO) FROM EMPLE GROUP BY DEPT_NO HAVING MIN(SALARIO) >= '1500';