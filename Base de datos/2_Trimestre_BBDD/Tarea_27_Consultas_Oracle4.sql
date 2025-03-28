
/*
Obt�n en una columna el apellido y el oficio de cada uno de los empleados de la
tabla EMPLE, de la siguiente manera: APELLIDO es OFICIO, por ejemplo, SANCHEZ es EMPLEADO 
(hay que anidar dos funciones CONCAT).
*/
SELECT CONCAT(APELLIDO || ' ',OFICIO) FROM EMPLE;

/*
De la tabla EMPLE, visualiza el apellido del empleado y la primera letra del apellido en min�scula.
Resta 3 a�os a la fecha de alta de los empleados de EMPLE.
*/
SELECT apellido, LOWER(SUBSTR(apellido, 1, 1)) "primera_letra_MINUSCULA" FROM EMPLE;

/*
Resta 3 a�os a la fecha de alta de los empleados de EMPLE
*/
select EMP_NO, APELLIDO, FECHA_ALT - INTERVAL '3' YEAR AS Nueva_Fecha_Alta from EMPLE;
/*
Obt�n la fecha de hoy con el siguiente formato: �Hoy es nombre_dia,dia_mes de 
nombre_mes de a�o �. Visualiza la suma de salarios de la tabla EMPLE de manera 
formateada, de tal manera que aparezca el s�mbolo
*/
SELECT 'Hoy es ' || TO_CHAR(SYSDATE, 'DAY, DD "de" MONTH "de" YYYY') AS "FECHA ACTUAL" FROM DUAL;
/*
Visualiza la suma de salarios de la tabla EMPLE de manera formateada, de tal 
manera que aparezca el s�mbolo de la moneda local, el punto para los miles y la 
coma para los decimales.
*/
SELECT TO_CHAR(SUM(SALARIO), 'FM999G999G999G990D00', 'NLS_NUMERIC_CHARACTERS='',.''') AS "Suma Salarios" FROM EMPLE;
/*
Dada la tabla LIBRERIA, visualiza todas sus filas sustituyendo el tema 'DIBUJO'
por 'DISE�O', y 'LABORES' por 'HOGAR'. En cualquier otro caso, deja el tema como
est�.
*/
SELECT 
    CASE
        WHEN TEMA = 'DIBUJO' THEN 'DISE�O'
        WHEN TEMA = 'LABORES' THEN 'HOGAR'
        ELSE TEMA
    END AS TEMA,
    * 
FROM LIBRERIA;

