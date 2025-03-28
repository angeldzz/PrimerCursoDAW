

--Selecciona el precio mas bajo de la tabla
select  Min(Price) as PrecioMasBajo from products_fun;

--Selecciona el precio mas alto de la tabla
select Max(Price) as PrecioMasAlto from products_fun;

--Cuenta cuantas filas hay en esa tabla que el precio sea menos de 25
select count(*) from products_fun where Price<25;

--Saca la media de price 
select AVG(Price) as PrecioMedio from products_fun;

--Selecciona donde la idcategoria sea 2
select ProductName as ProductosCat2 from products_fun where CategoryID = 2;

--Cuenta sin contar repetidos cuantas categoriasid hay
select count(Distinct CategoryID) as CategoriasDistintas from products_fun;

--Selecciona donde la supllierid sea 3
select ProductName as ProductosSuministradosProv3 from products_fun where SupplierID = 3;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Selecciona donde el salario sea menor y tambien el oficio sea ese
select emp_no from emple where salario < 2000 and oficio = 'VENDEDOR';

--Selecciona donde comision este vacio y la fecha sea la que se marca
select oficio, salario, fecha_alt from emple where comision is null and fecha_alt < '17/11/1991';

--Selecciona sumando salario y comision y metiendolo en una columna llamada sueldo de las filas en las que el oficio sea el marcado y la suma sea menor que 2000
select apellido, (salario + comision) as sueldo from emple where oficio = 'VENDEDOR' and (salario + comision) < 2000;

--Selecciona solo las filas que tengan como numero de dept el 20 o 30
select distinct oficio from emple where dept_no in (20,30);

--Selecciona el dni donte notas tenga 8 o 9
select dni from notas where nota in (8,9);

--Selecciona donde el estantte sea A y los ejemplares mas de 10
select tema from libreria where estante = 'A' and ejemplares > 10;

--Selecciona donde la provincia sea la marcada y apellidos contenga vidal  %% cualquier posicion delante o atras
select dni, nombre, apellidos from alum0405 where provincia = 'CACERES' and apellidos like '%VIDAL%';

--Selecciona donde apellido contenga A como primera letra y oficio copntenga E en cualquier posicion
select * from emple where apellido like 'A%' and oficio like '%E%';

--Selecciona donde salario sea alguno de esos valores
select apellido, salario from emple where salario in (1200,1600,2450,2975);

--Sirve para sacar una descripcion de la tabla
describe emple;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- el nombre de tabla
select nombre from infor_producto;

-- Selecciona el nombre y el precio de la tabla
select nombre, precio from infor_producto;

--Selecciona todo de la tabla
select * from infor_producto;

-- Selecciona el nombre, precio con nombre euros y el precio en dolares *1.13
select nombre, precio as euros, precio * 1.13 as dolares from infor_producto;

--lo mismo q el anterior
select nombre as "nombre de producto", precio as euros, precio * 1.13 as dolares from infor_producto;

--Selecciona el nombre y lo muestra en mayusculas
select upper(nombre), precio from infor_producto;

--Selecciona el nombre y lo muestra en minusculas
select lower(nombre), precio from infor_producto;

--Selecciona y pone en mayusculas la letra numero 1 y 2 
select nombre, upper(substr(nombre, 1, 2)) from infor_fabricante;

--Selecciona y redondea el precio
select nombre, round(precio) from infor_producto;

--Selecciona y trunca el precio
select nombre, trunc(precio) from infor_producto;

--Selecciona las id sin que se repitan
select distinct id_fabricante from infor_producto;

--Selecciona las id sin que se repitan
select distinct id_fabricante from infor_producto;

--Selecciona el nombre ordenado de forma ascendente
select nombre from infor_fabricante order by nombre asc;

--Selecciona el nombre ordenado de forma descendente
select nombre from infor_fabricante order by nombre desc;

--Selecciona ordenando por el nombre ascendentemente y el precio desceendente
select nombre, precio from infor_producto order by nombre asc, precio desc;

--Selecciona las 5 primeras filas
select * from infor_fabricante where rownum <= 5;

--Selecciona el producto donde el precio sea el minimo
select nombre, precio from infor_producto where precio = (select min(precio) from infor_producto);

--Selecciona el producto donde el precio sea el maximo
select nombre, precio from infor_producto where precio = (select max(precio) from infor_producto);

--Selecciona donde id es 2
select nombre from infor_producto where id_fabricante = 2;

--Selecciona donde precio es menor o igual a 120
select nombre from infor_producto where precio <= 120;

--Selecciona donde precio es mayor o igual que 400
select nombre from infor_producto where precio >= 400;

--Selecciona donde el precio es mayor o igual a 80 y menor o igual a 300
select nombre from infor_producto where precio >= 80 and precio <= 300;

--Selecciona donde el precio este entre 60 y 200
select nombre from infor_producto where precio between 60 and 200;

--Selecciona donde el precio sea mayor que 200 y la id sea 6
select nombre from infor_producto where precio > 200 and id_fabricante = 6;

--Selecciona donde el id sea 1 3 o 5
select nombre from infor_producto where id_fabricante = 1 or id_fabricante = 3 or id_fabricante = 5;

--Selecciona donde el id contenga 1 3 o5
select nombre from infor_producto where id_fabricante in (1,3,5);

--Selecciona y enseña el precio en centimos
select nombre, precio * 100 as "céntimos" from infor_producto;

--Selecciona donde el id sea 1 3 o 5 donde nombre tenga una S como primer caracter
select nombre from infor_fabricante where nombre like 'S%';

--Selecciona donde nombre acabe en e
select nombre from infor_fabricante where nombre like '%e';

--Selecciona donde nombre contenga una w
select nombre from infor_fabricante where nombre like '%w%';

--Selecciona donde nombre sea de un tamaño de 4 letras
select nombre from infor_fabricante where length(nombre)=4;

--Selecciona donde nombre contenga portatil 
select nombre from infor_producto where nombre like '%Portátil%';

--Selecciona donde nombre contenga monitor y el precio sea menor que 215
select nombre from infor_producto where nombre like '%Monitor%' and precio < 215; 

--Selecciona donde el precio sea mayor o igual a 180 y lo ordena por el precio descendientemente y el nombre ascendentementte
select nombre, precio from infor_producto where precio >= 180 order by precio desc, nombre asc;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

--Selecciona concatenando apellido y oficio añadiento es en medio y lo muestra en una columna
select APELLIDO || ' es ' || OFICIO as OficioEmpleado  from EMPLE;

--Seleciona y enseña la primera letra del apellido en minuscula
select APELLIDO, LOWER(SUBSTR (APELLIDO,1,1)) as Primeraletra from EMPLE;

--Selecciona y resta 3 años a la fecha 
select EMP_NO, APELLIDO, FECHA_ALT - INTERVAL '3' YEAR AS Nueva_Fecha_Alta from EMPLE;

-- Saca el texto marcado y lo concatena con la fecha actual, ademas utilizamos la tabla dual que es una pseudotabla
select 'Hoy es ' || TO_CHAR(SYSDATE, 'Day, DD "de" Month "de" YYYY') as Fecha_Hoy from dual;

-- Calcula la suma de los salarios de todos los empleados y lo formatea como una cadena con el símbolo de dólar y el separador de miles y decimales definido por el idioma español.
select to_char(SUM(SALARIO), '$999G999D99', 'NLS_NUMERIC_CHARACTERS = '',.''') as Suma_Salarios from EMPLE;

-- Convierte el tema de los libros a una nueva categoría: 'DIBUJO' se convierte en 'DISEÑO', 'LABORES' se convierte en 'HOGAR', y cualquier otro tema se deja sin cambios. Luego, selecciona el tema modificado, el estante y el número de ejemplares de la tabla LIBRERIA.
select case when TEMA = 'DIBUJO' then 'DISEÑO' when TEMA = 'LABORES' then 'HOGAR' else TEMA end as TEMA, ESTANTE, EJEMPLARES from LIBRERIA;


-------------------------------------------------------------------------------------------------------------------------------------------------------------------


--Selecciona ,cuenta el numero de lineas y lo agrupa por ciudades  (muestra cuantas lineas de cada ciudad hay)
select country, count(*) as numero_customers from customer group by country;

--Selecciona, cuenta el numero de lineas y lo agrupa por ciudades, lo odena en orden descendente (muestra cuantas lineas de cada ciudad hay)
select country, count(*) as numero_customers from customer group by country order by numero_customers desc;

--Selecciona,, cuenta el numero de lineas, lo agrupa por ciudades en las que solo haya 1 (muestra las ciudades que solo tienen 1 linea en la tabla)
select country, count(*) as numero_customers from customer group by country having count(*) > 1;

--Selecciona, cuenta el numero de lineas muestra la suma de todos los salarios de cada oficio, agrupado por oficio  (mostrara el salario total de cada oficio y el numero de personas por cada oficio)
select oficio, count(*) as numeropersonas, sum(salario) as salariototal from emple group by oficio;

--Selecciona el salario mas alto de cada agrupacion de departamento en el que la media del salario sea mayor a 2000
select dept_no, max(salario) as salariomaximo from emple group by dept_no having avg(salario)>2000; 

--Selecciona, muestra la media del salario y el salario mas alto de cada depantamento que tenga un salario medio menor a 2000
select dept_no, avg(salario) as salarioMedio, max(salario) as salariomaximo from emple group by dept_no having avg(salario)<2000; 

--Selecciona, cuenta las lineas y tambien muestra la suma de los salarios de cada oficio los cuales la suma del salari oeste entre 6000 y 7000
select oficio, count(*) as numeropersonas, sum(salario) as salariototal  from emple group by oficio having sum(salario) between 6000 and 7000 ;

--Selecciona, cuenta las lineas, muesta el salario medio de las columnas que contengan vendedor y lo agrupa por departamentos
select dept_no, count(*) as numerodeempleados, avg(salario) from emple where oficio='VENDEDOR' group by dept_no;

--Selecciona, cuenta el numero de filas, nmuestra el salario medio agrupando por oficio y dept a la vez
select dept_no, oficio, count(*) as numeroempleados, avg(salario) as salariomedio from emple group by oficio,dept_no;

--Selecciona y cuenta las lineas, muestra el salario medio donde oficio contenga director y lo agrupa por el dept_no en el que el salario medio sea mayor o igual a 2900 y lo ordena ascendentemente por el salariomedio
select dept_no, count(*) as numeroempleados, avg(salario) as salariomedio from emple where oficio='DIRECTOR' group by dept_no having avg(salario) >= 2900 order by  salariomedio asc;

--Selecciona donde el tema sea informatica y el estante sea A
select estante, ejemplares as num_ejemplares_informatica from LIBRERIA where tema = 'INFORMATICA' and estante = 'A';

--Selecciona contando las lineas sin que se repitan los valores agrupandolo por estante y ordenando descendentemente por numtemas
select estante, count(distinct tema) as num_temas_distintos  from libreria group by estante order by num_temas_distintos desc;

--Selecciona, cuenta las lineas donde el oficio sea empleado o analista y la fecha sea la marcada, y lo agrupa por oficio
select oficio, count(*) as num_empleados from EMPLE where (oficio = 'EMPLEADO' or oficio = 'ANALISTA') and fecha_alt > '01/01/1991' GROUP BY oficio;

--Selecciona, cuenta todas las filas y muesttra los datos agrupando por la ciudad y el codigo postal a la vez
select count(*) as numerodeclientes, city, postalcode from customer group by city,postalcode; 

--Selecciona el salario mas pequeño de cada departamentto que tenga el salario mas bajo menor que 1500
select dept_no, min(salario) as salariominimo from emple group by dept_no having min(salario) < 1500 ;