Consultas multitabla
SELECT Orders.OrderID, Customers.CustomerName
FROM Orders
INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

Ejemplo de subconsulta no correlacionada:
SELECT ProductName
FROM Products
WHERE ProductID IN (SELECT ProductID FROM OrderDetails WHERE OrderID = 10248);

Ejemplo de subconsulta correlacionada:
SELECT CustomerName,
       (SELECT COUNT(*) FROM Orders WHERE Orders.CustomerID = Customers.CustomerID) AS OrderCount
FROM Customers;

--------------------------------------------------------------------------
Funciones de Agregación:

COUNT: Cuenta el número de filas en un conjunto de resultados.
SUM: Calcula la suma de los valores en una columna.
AVG: Calcula el promedio de los valores en una columna.
MIN: Encuentra el valor mínimo en una columna.
MAX: Encuentra el valor máximo en una colu

SELECT COUNT(*) AS TotalOrders FROM Orders
--------------------------------------------------------------------------
Ordenamiento de Resultados:

ORDER BY: Ordena los resultados basados en una o más columnas.
ASC: Ordena en orden ascendente (predeterminado).
DESC: Ordena en orden descendente.
SELECT * FROM Products ORDER BY UnitPrice DESC;

--------------------------------------------------------------------------
Puedes combinar funciones de agregación con ORDER BY para clasificar resultados basados en valores agregados.

SELECT CustomerID, COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY CustomerID
ORDER BY OrderCount DESC;







--------------------------------------------------------------------------------------------------------------------------------------------------------
                                                        EJEMPLO UNIVERSIDAD
--------------------------------------------------------------------------------------------------------------------------------------------------------




1.5.4 Consultas sobre una tabla
1.Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
SELECT apellido1, apellido2, nombre
FROM alumno
ORDER BY apellido1, apellido2, nombre;

2.verigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT nombre, apellido1, apellido2
FROM alumno
WHERE telefono IS NULL OR telefono = '';

3.Devuelve el listado de los alumnos que nacieron en 1999.
SELECT nombre, apellido1, apellido2
FROM alumno
WHERE YEAR(fecha_nacimiento) = 1999;


4.Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.
SELECT nombre, apellido1, apellido2
FROM profesor
WHERE (telefono IS NULL OR telefono = '') AND nif LIKE '%K';

5.Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
SELECT nombre
FROM asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

1.5.5 Consultas multitabla (Composición interna)
Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el Grado en Ingeniería Informática (Plan 2015).
SELECT a.*
FROM alumno a
JOIN alumno_se_matricula_asignatura am ON a.id = am.id_alumno
JOIN asignatura asig ON am.id_asignatura = asig.id
JOIN grado g ON asig.id_grado = g.id
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)' AND a.sexo = 'M';

6.Devuelve un listado con todas las asignaturas ofertadas en el Grado en Ingeniería Informática (Plan 2015).
SELECT asig.*
FROM asignatura asig
JOIN grado g ON asig.id_grado = g.id
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

7.Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS nombre_departamento
FROM profesor p
JOIN departamento d ON p.id_departamento = d.id
ORDER BY p.apellido1, p.apellido2, p.nombre;

8.Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.
SELECT asig.nombre, ce.anyo_inicio, ce.anyo_fin
FROM alumno a
JOIN alumno_se_matricula_asignatura am ON a.id = am.id_alumno
JOIN asignatura asig ON am.id_asignatura = asig.id
JOIN curso_escolar ce ON am.id_curso_escolar = ce.id
WHERE a.nif = '26902806M';

9.Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).
SELECT DISTINCT d.nombre
FROM departamento d
JOIN profesor p ON d.id = p.id_departamento
JOIN asignatura asig ON p.id = asig.id_profesor
JOIN grado g ON asig.id_grado = g.id
WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

10.Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
SELECT DISTINCT a.*
FROM alumno a
JOIN alumno_se_matricula_asignatura am ON a.id = am.id_alumno
JOIN curso_escolar ce ON am.id_curso_escolar = ce.id
WHERE ce.anyo_inicio = 2018 AND ce.anyo_fin = 2019;

1.5.6 Consultas multitabla (Composición externa)
1.Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
SELECT d.nombre AS nombre_departamento, p.apellido1, p.apellido2, p.nombre
FROM profesor p
LEFT JOIN departamento d ON p.id_departamento = d.id
ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;


2.Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
SELECT p.*
FROM profesor p
LEFT JOIN departamento d ON p.id_departamento = d.id
WHERE d.id IS NULL;


3.Devuelve un listado con los profesores que no están asociados a un departamento.
SELECT d.*
FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
WHERE p.id IS NULL;


4.Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT p.*
FROM profesor p
LEFT JOIN asignatura asig ON p.id = asig.id_profesor
WHERE asig.id IS NULL;


5.Devuelve un listado con los profesores que no imparten ninguna asignatura.
SELECT p.*
FROM profesor p
LEFT JOIN asignatura asig ON p.id = asig.id_profesor
WHERE asig.id IS NULL;


6.Devuelve un listado con las asignaturas que no tienen un profesor asignado.
SELECT asig.*
FROM asignatura asig
LEFT JOIN profesor p ON asig.id_profesor = p.id
WHERE p.id IS NULL;


7.Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar. El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.
SELECT d.nombre AS nombre_departamento, asig.nombre AS nombre_asignatura
FROM departamento d
JOIN profesor p ON d.id = p.id_departamento
JOIN asignatura asig ON p.id = asig.id_profesor
LEFT JOIN alumno_se_matricula_asignatura am ON asig.id = am.id_asignatura
WHERE am.id_asignatura IS NULL;

1.5.7 Consultas resumen
1.Devuelve el número total de alumnas que hay.
SELECT COUNT(*) AS total_alumnas
FROM alumno
WHERE sexo = 'M';

2.Calcula cuántos alumnos nacieron en 1999.
SELECT COUNT(*) AS total_alumnos_1999
FROM alumno
WHERE YEAR(fecha_nacimiento) = 1999;

3.Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.
SELECT d.nombre AS nombre_departamento, COUNT(p.id) AS numero_profesores
FROM departamento d
JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.nombre
HAVING numero_profesores > 0
ORDER BY numero_profesores DESC;

4.Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también tienen que aparecer en el listado.
SELECT d.nombre AS nombre_departamento, COUNT(p.id) AS numero_profesores
FROM departamento d
LEFT JOIN profesor p ON d.id = p.id_departamento
GROUP BY d.nombre;

5.Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
SELECT g.nombre AS nombre_grado, COUNT(asig.id) AS numero_asignaturas
FROM grado g
LEFT JOIN asignatura asig ON g.id = asig.id_grado
GROUP BY g.nombre
ORDER BY numero_asignaturas DESC;

6.Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.
SELECT g.nombre AS nombre_grado, COUNT(asig.id) AS numero_asignaturas
FROM grado g
LEFT JOIN asignatura asig ON g.id = asig.id_grado
GROUP BY g.nombre
HAVING numero_asignaturas > 40;


7.Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay de ese tipo. Ordene el resultado de mayor a menor por el número total de crédidos.
SELECT g.nombre AS nombre_grado, asig.tipo, SUM(asig.creditos) AS total_creditos
FROM grado g
JOIN asignatura asig ON g.id = asig.id_grado
GROUP BY g.nombre, asig.tipo
ORDER BY total_creditos DESC;

8.Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
SELECT ce.anyo_inicio, COUNT(DISTINCT am.id_alumno) AS numero_alumnos
FROM curso_escolar ce
JOIN alumno_se_matricula_asignatura am ON ce.id = am.id_curso_escolar
GROUP BY ce.anyo_inicio;

9.Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(asig.id) AS numero_asignaturas
FROM profesor p
LEFT JOIN asignatura asig ON p.id = asig.id_profesor
GROUP BY p.id, p.nombre, p.apellido1, p.apellido2
ORDER BY numero_asignaturas DESC;

1.5.8 Subconsultas
1.Devuelve todos los datos del alumno más joven.
SELECT *
FROM alumno
ORDER BY fecha_nacimiento DESC
LIMIT 1;

2.Devuelve un listado con los profesores que no están asociados a un departamento.
SELECT *
FROM profesor
WHERE id_departamento IS NULL;

3.Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT *
FROM departamento d
WHERE NOT EXISTS (
  SELECT 1
  FROM profesor p
  WHERE p.id_departamento = d.id
);

4.Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.
SELECT p.*
FROM profesor p
WHERE p.id_departamento IS NOT NULL AND NOT EXISTS (
  SELECT 1
  FROM asignatura asig
  WHERE asig.id_profesor = p.id
);

5.Devuelve un listado con las asignaturas que no tienen un profesor asignado.
SELECT *
FROM asignatura
WHERE id_profesor IS NULL;

6.Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
SELECT d.*
FROM departamento d
WHERE NOT EXISTS (
  SELECT 1
  FROM asignatura asig
  JOIN alumno_se_matricula_asignatura am ON asig.id = am.id_asignatura
  WHERE asig.id_profesor IN (
    SELECT p.id
    FROM profesor p
    WHERE p.id_departamento = d.id
  )
);

---------------------------------------------------------------------------------------------------------------------------
                                                REPASO JARDINERIA EJERCICIO REALIZADO EN CASA -
----------------------------------------------------------------------------------------------------------------------------



-- 1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
SELECT c.nombre_cliente, e.apellido1 FROM cliente c inner join
empleado e on c.codigo_empleado_rep_ventas =
e.codigo_empleado;
-- 2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
SELECT c.nombre_cliente, e.nombre FROM cliente c inner join
pago p on c.codigo_cliente = p.codigo_cliente INNER JOIN
empleado e on c.codigo_empleado_rep_ventas =
e.codigo_empleado;
-- 3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
SELECT
    c.nombre_cliente,
    e.nombre AS nombre_representante
FROM
    cliente c
LEFT JOIN
    pago p ON c.codigo_cliente = p.codigo_cliente
JOIN
    empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
WHERE
    p.codigo_cliente IS NULL;
-- 4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT c.nombre_cliente, e.nombre AS nombre_representante, o.ciudad 
    FROM 
        cliente c LEFT JOIN pago p ON c.codigo_cliente = p.codigo_cliente 
    INNER JOIN 
        empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado 
    INNER JOIN 
        oficina o ON e.codigo_oficina=o.codigo_oficina 
    WHERE 
        p.codigo_cliente IS NOT NULL;
-- 5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT
    c.nombre_cliente,
    e.nombre AS nombre_representante,
    o.ciudad
FROM
    cliente c
LEFT JOIN
    pago p ON c.codigo_cliente = p.codigo_cliente
INNER JOIN
    empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
INNER JOIN
	oficina o ON e.codigo_oficina=o.codigo_oficina
WHERE
    p.codigo_cliente IS NULL;
-- 6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

SELECT o.codigo_oficina, o.linea_direccion1, o.linea_direccion2, c.ciudad 
FROM
     cliente c 
INNER JOIN 
    empleado e 
ON 
    c.codigo_empleado_rep_ventas=e.codigo_empleado 
inner JOIN 
    oficina o 
ON 
    e.codigo_oficina=o.codigo_oficina
WHERE 
    LOWER(c.ciudad) = 'fuenlabrada';

-- 7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT 
    c.nombre_cliente, e.nombre as representante, o.ciudad 
    FROM 
        cliente c 
    INNER JOIN 
        empleado e ON c.codigo_empleado_rep_ventas=e.codigo_empleado 
    INNER JOIN 
        oficina o ON e.codigo_oficina=o.codigo_oficina;
-- 8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

SELECT e.nombre as nombre_empleado, j.nombre as nombre_jefe 
FROM 
    empleado e 
INNER JOIN 
    empleado j 
ON 
e.codigo_jefe=j.codigo_empleado;

-- 9. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

SELECT e.nombre as empleado, e2.nombre as Jefe, e3.nombre as Jefaso FROM empleado e INNER JOIN empleado e2 ON e.codigo_jefe=e2.codigo_empleado INNER JOIN empleado e3 ON e2.codigo_jefe=e3.codigo_empleado;

-- 10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

SELECT c.nombre_cliente FROM cliente c INNER JOIN pedido p ON c.codigo_cliente=p.codigo_cliente WHERE p.fecha_entrega > p.fecha_esperada;
-- 11. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.

SELECT DISTINCT c.nombre_cliente, g.gama FROM cliente c INNER JOIN pedido p ON c.codigo_cliente=p.codigo_cliente INNER JOIN detalle_pedido d ON p.codigo_pedido=d.codigo_pedido INNER JOIN producto pr on d.codigo_producto=pr.codigo_producto INNER JOIN gama_producto g ON pr.gama=g.gama;
-- 12. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

SELECT c.nombre_cliente, p.total as pago FROM cliente c LEFT JOIN pago p ON c.codigo_cliente=p.codigo_cliente where p.codigo_cliente IS null;
-- 13. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

SELECT c.nombre_cliente, p.codigo_cliente as pedido FROM cliente c LEFT JOIN pedido p ON c.codigo_cliente=p.codigo_cliente where p.codigo_pedido is null;
-- 14. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.

SELECT c.nombre_cliente, p.codigo_cliente as pedido, pg.codigo_cliente as ago  FROM cliente c LEFT JOIN pedido p ON c.codigo_cliente=p.codigo_cliente LEFT JOIN pago pg on c.codigo_cliente=pg.codigo_cliente where p.codigo_pedido is null AND pg.codigo_cliente is null;
-- 15. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

SELECT e.nombre, o.codigo_oficina FROM empleado e LEFT JOIN oficina o ON e.codigo_oficina=o.codigo_oficina WHERE o.codigo_oficina IS null;
-- 16. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.

SELECT e.nombre, c.codigo_cliente as cliente_asociado FROM empleado e LEFT JOIN cliente c ON e.codigo_empleado=c.codigo_empleado_rep_ventas WHERE c.codigo_empleado_rep_ventas is null;
-- 17. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.

SELECT e.nombre, c.codigo_cliente as cliente, o.* FROM empleado e LEFT JOIN cliente c ON e.codigo_empleado=c.codigo_empleado_rep_ventas INNER JOIN oficina o ON e.codigo_oficina=e.codigo_oficina WHERE c.codigo_empleado_rep_ventas is null;
-- 18. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.

SELECT e.nombre as empleado, o.codigo_oficina as oficina, c.codigo_cliente as cliente FROM empleado e LEFT JOIN oficina o ON e.codigo_oficina=o.codigo_oficina LEFT JOIN cliente c on e.codigo_empleado=c.codigo_empleado_rep_ventas WHERE o.codigo_oficina is null OR c.codigo_empleado_rep_ventas is null;
-- 19. Devuelve un listado de los productos que nunca han aparecido en un pedido.

SELECT p.nombre FROM producto p LEFT JOIN detalle_pedido d on p.codigo_producto=d.codigo_producto WHERE d.codigo_pedido is null;
-- 20. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.

SELECT p.nombre, p.descripcion FROM producto p LEFT JOIN detalle_pedido d on p.codigo_producto=d.codigo_producto WHERE d.codigo_pedido is null;
-- 21. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

SELECT * FROM oficina WHERE oficina.codigo_oficina NOT IN (SELECT DIST
INCT empleado.codigo_oficina from empleado where empleado.codigo
_empleado IN (SELECT DISTINCT c.codigo_empleado_rep_ventas FR
OM cliente c INNER JOIN pedido pe on c.codigo_cliente=pe.codi
go_cliente INNER JOIN detalle_pedido de on pe.codigo_pedido =
 de.codigo_pedido INNER JOIN producto p on de.codigo_producto
 = p.codigo_producto INNER JOIN gama_producto g on p.gama =g.
gama WHERE g.gama ='Frutales'));
-- 22. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

SELECT c.nombre_cliente as cliente, pg.codigo_cliente as pago, p.codigo_cliente as pedido FROM cliente c LEFT JOIN pedido p ON c.codigo_cliente=p.codigo_cliente LEFT JOIN pago pg ON c.codigo_cliente=pg.codigo_cliente WHERE p.codigo_cliente is NOT null AND pg.codigo_cliente IS null;
-- 23. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.
SELECT e.*,e2.nombre as jefe, c.codigo_empleado_rep_ventas as clientes FROM empleado e left JOIN cliente c ON e.codigo_empleado=c.codigo_empleado_rep_ventas INNER JOIN empleado e2 ON e.codigo_jefe=e2.codigo_empleado WHERE c.codigo_empleado_rep_ventas is null;

--Consultas resumen

-- 24. ¿Cuántos empleados hay en la compañía?
SELECT COUNT(*) FROM empleado;
-- 25. ¿Cuántos clientes tiene cada país?
SELECT pais, COUNT(*) as numero FROM cliente GROUP BY pais;
-- 26. ¿Cuál fue el pago medio en 2009?
SELECT AVG(total) as pago_medio FROM pago WHERE fecha_pago BETWEEN '2009-01-01' AND '2009-12-31';
-- 27. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
SELECT estado, COUNT(*) as numero_pedidos FROM pedido GROUP BY estado order BY COUNT(*) DESC;
-- 28. Calcula el precio de venta del producto más caro y más barato en una misma consulta.
SELECT MAX(p.precio_venta) as mas_caro, MIN(p.precio_venta) as mas_barato FROM producto p;
-- 29. Calcula el número de clientes que tiene la empresa.
SELECT COUNT(*) as numero_clientes FROM cliente;
-- 30. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
SELECT COUNT(*) as numero_de_residentes FROM cliente WHERE lower(ciudad) = 'madrid';
-- 31. Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M.
SELECT ciudad, COUNT(*) as num_clientes FROM cliente WHERE ciudad LIKE 'M%' GROUP by ciudad;
-- 32. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
SELECT e.nombre as nombre_representante, COUNT(c.codigo_cliente) as num_clientes_atendidos FROM empleado e LEFT JOIN cliente c ON e.codigo_empleado=c.codigo_empleado_rep_ventas GROUP BY e.nombre;
-- 33. Calcula el número de clientes que no tiene asignado representante de ventas.
SELECT COUNT(c.codigo_cliente) as num_clientes FROM cliente c INNER JOIN empleado e ON c.codigo_empleado_rep_ventas=e.codigo_empleado WHERE e.puesto like 'Representante Ventas';
-- 34. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
SELECT c.nombre_cliente as cliente, MAX(p.fecha_pago) as ultimo_pago,MIN(p.fecha_pago) as primer_pago FROM cliente c INNER JOIN pago p ON c.codigo_cliente=p.codigo_cliente GROUP BY c.codigo_cliente,c.nombre_cliente;
-- 35. Calcula el número de productos diferentes que hay en cada uno de los pedidos.
SELECT DISTINCT COUNT(pe.codigo_pedido) as numero,p.nombre  FROM producto p
INNER JOIN detalle_pedido dp ON p.codigo_producto=dp.codigo_producto inner join pedido pe ON dp.codigo_pedido=pe.codigo_pedido GROUP BY p.codigo_producto;
-- 36. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
SELECT DISTINCT p.nombre, COUNT(dp.codigo_producto) FROM producto p INNER JOIN detalle_pedido dp ON p.codigo_producto=dp.codigo_producto GROUP BY p.nombre;
-- 37. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.
SELECT p.nombre, SUM(dp.cantidad) FROM producto p INNER JOIN detalle_pedido dp ON p.codigo_producto=dp.codigo_producto GROUP BY p.nombre ORDER BY dp.cantidad DESC LIMIT 20;
-- 38. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.
SELECT p.nombre, SUM(dp.cantidad) FROM producto p INNER JOIN detalle_pedido dp ON p.codigo_producto=dp.codigo_producto GROUP BY p.nombre ORDER BY dp.cantidad DESC LIMIT 20;
-- 39. La misma información que en la pregunta anterior, pero agrupada por código de producto.
SELECT p.nombre, SUM(dp.cantidad) FROM producto p INNER JOIN detalle_pedido dp ON p.codigo_producto=dp.codigo_producto GROUP BY p.nombre ORDER BY dp.cantidad DESC LIMIT 20;
-- 40. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
SELECT p.nombre, SUM(dp.cantidad) FROM producto p INNER JOIN detalle_pedido dp ON p.codigo_producto=dp.codigo_producto GROUP BY p.nombre ORDER BY dp.cantidad DESC LIMIT 20;
-- 41. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).
SELECT p.nombre, SUM(dp.cantidad) as unidades_venidas,SUM(dp.cantidad * p.precio_venta) as base_imponible, SUM(dp.cantidad * p.precio_venta) * 0.21 as iva, SUM(dp.cantidad * p.precio_venta) * 1.21 as total_facturado FROM producto p INNER JOIN detalle_pedido dp on p.codigo_producto=dp.codigo_producto GROUP BY p.nombre HAVING base_imponible > 3000 ORDER BY total_facturado DESC;
-- 42. Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.
SELECT YEAR(p.fecha_pago) as año, COUNT(p.codigo_cliente) as pagos_realizados FROM pago p GROUP BY YEAR(p.fecha_pago);
-- Subconsultas

-- Con operadores básicos de comparación

-- 43. Devuelve el nombre del cliente con mayor límite de crédito.

SELECT c.nombre_cliente 
from 
    cliente c 
WHERE  
    c.limite_credito = (SELECT Max(c.limite_credito) from cliente) LIMIT 1;

-- 44. Devuelve el nombre del producto que tenga el precio de venta más caro.
SELECT p.nombre, p.precio_venta FROM producto p WHERE p.precio_venta = (SELECT MAX(p.precio_venta) FROM producto p);


-- 45. Devuelve el nombre del producto del que se han vendido más unidades.
-- (Ten en cuenta que tendrá que calcular cuál es el número total de unidades
-- que se han vendido de cada producto a partir de los datos de la tabla
-- detalle_pedido)
SELECT p.nombre from producto p WHERE p.codigo_producto = (SELECT dp.codigo_producto FROM detalle_pedido dp WHERE dp.cantidad = (SELECT MAX(dp.cantidad) FROM detalle_pedido dp));
-- 46. Los clientes cuyo límite de crédito sea mayor que los pagos que haya
-- realizado. (Sin utilizar INNER JOIN).
SELECT c.nombre_cliente FROM cliente c WHERE c.limite_credito > (SELECT SUM(p.total) FROM pago p WHERE p.codigo_cliente=c.codigo_cliente);
-- 47. Devuelve el producto que más unidades tiene en stock.
SELECT p.codigo_producto, p.cantidad_en_stock FROM producto p WHERE p.cantidad_en_stock = (SELECT MAX(p2.cantidad_en_stock) FROM producto p2);
-- 48. Devuelve el producto que menos unidades tiene en stock.
SELECT p.codigo_producto, p.cantidad_en_stock FROM producto p WHERE p.cantidad_en_stock = (SELECT MIN(p2.cantidad_en_stock) FROM producto p2);
-- 49. Devuelve el nombre, los apellidos y el email de los empleados que están a
-- cargo de Alberto Soria.
SELECT e.nombre, e.apellido1, e.email FROM empleado e WHERE e.codigo_jefe = (SELECT ee.codigo_empleado FROM empleado ee WHERE ee.nombre like 'Alberto' AND ee.apellido1 like 'Soria');

-- Subconsultas con ALL y ANY
-- 50. Devuelve el nombre del cliente con mayor límite de crédito.
SELECT c.nombre_cliente FROM cliente c WHERE c.limite_credito >= ALL(SELECT c.limite_credito FROM cliente c);
-- 51. Devuelve el nombre del producto que tenga el precio de venta más caro.
SELECT p.nombre, p.precio_venta FROM producto p WHERE p.precio_venta >= all (SELECT pr.precio_venta from producto pr);
-- 52. Devuelve el producto que menos unidades tiene en stock.
SELECT p.nombre, p.cantidad_en_stock FROM producto p WHERE p.cantidad_en_stock <= all(SELECT pr.cantidad_en_stock FROM producto pr);

-- Subconsultas con IN y NOT IN
-- 53. Devuelve el nombre, apellido1 y cargo de los empleados que no
-- representen a ningún cliente.
SELECT e.nombre, e.apellido1, e.puesto FROM empleado e WHERE e.codigo_empleado NOT IN (SELECT c.codigo_empleado_rep_ventas FROM cliente c);
-- 54. Devuelve un listado que muestre solamente los clientes que no han
-- realizado ningún pago.
SELECT c.nombre_cliente FROM cliente c WHERE c.codigo_cliente not in (SELECT p.codigo_cliente FROM pago p);
-- 55. Devuelve un listado que muestre solamente los clientes que sí han realizado
-- algún pago.
SELECT c.nombre_cliente FROM cliente c WHERE c.codigo_cliente in(SELECT p.codigo_cliente FROM pago p);
-- 56. Devuelve un listado de los productos que nunca han aparecido en un
-- pedido.
SELECT p.nombre FROM producto p WHERE p.codigo_producto not in (SELECT dp.codigo_producto FROM detalle_pedido dp);
-- 57. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
-- empleados que no sean representante de ventas de ningún cliente.
SELECT e.nombre, e.apellido1, e.apellido2, o.telefono FROM empleado e INNER JOIN oficina o ON e.codigo_oficina=o.codigo_oficina WHERE e.codigo_empleado not in(SELECT c.codigo_empleado_rep_ventas FROM cliente c);
-- 58. Devuelve las oficinas donde no trabajan ninguno de los empleados que
-- hayan sido los representantes de ventas de algún cliente que haya realizado
-- la compra de algún producto de la gama Frutales.
SELECT o.codigo_oficina FROM oficina o WHERE o.codigo_oficina not in(SELECT em.codigo_oficina FROM empleado em WHERE em.codigo_empleado in(SELECT c.codigo_empleado_rep_ventas FROM cliente c WHERE c.codigo_cliente in(SELECT pe.codigo_cliente FROM pedido pe WHERE pe.codigo_pedido in(SELECT d.codigo_pedido FROM detalle_pedido d WHERE d.codigo_producto in(SELECT p.codigo_producto FROM producto p WHERE p.gama in(SELECT g.gama FROM gama_producto g WHERE g.gama LIKE 'Frutales'))))));
-- 59. Devuelve un listado con los clientes que han realizado algún pedido pero no
-- han realizado ningún pago.
SELECT c.nombre_cliente FROM cliente c WHERE c.codigo_cliente in (SELECT pe.codigo_cliente FROM pedido pe) AND c.codigo_cliente not in(SELECT p.codigo_cliente FROM pago p);

-- Subconsultas con EXISTS y NOT EXISTS

-- 60. Devuelve un listado que muestre solamente los clientes que no han
-- realizado ningún pago.
SELECT c.nombre_cliente FROM cliente c WHERE not EXISTS (SELECT p.codigo_cliente FROM pago p WHERE p.codigo_cliente=c.codigo_cliente);
-- 61. Devuelve un listado que muestre solamente los clientes que sí han realizado
-- algún pago.
SELECT c.nombre_cliente FROM cliente c WHERE EXISTS (SELECT p.codigo_cliente FROM pago p WHERE p.codigo_cliente=c.codigo_cliente);
-- 62. Devuelve un listado de los productos que nunca han aparecido en un
-- pedido.
SELECT p.nombre FROM producto p WHERE not EXISTS(SELECT dp.codigo_producto FROM detalle_pedido dp WHERE dp.codigo_producto=p.codigo_producto);
-- 63. Devuelve un listado de los productos que han aparecido en un pedido
-- alguna vez.
SELECT p.nombre FROM producto p WHERE EXISTS(SELECT dp.codigo_producto FROM detalle_pedido dp WHERE dp.codigo_producto=p.codigo_producto);

-- Consultas variadas
-- 64. Devuelve el listado de clientes indicando el nombre del cliente y cuántos
-- pedidos ha realizado. Ten en cuenta que pueden existir clientes que no han
-- realizado ningún pedido.
SELECT c.nombre_cliente, COUNT(p.codigo_cliente) as numero_pedidos FROM cliente c LEFT JOIN pedido p on c.codigo_cliente=p.codigo_cliente GROUP BY c.nombre_cliente;
-- 65. Devuelve un listado con los nombres de los clientes y el total pagado por
-- cada uno de ellos. Ten en cuenta que pueden existir clientes que no han
-- realizado ningún pago.
SELECT c.nombre_cliente, SUM(p.total) FROM cliente c LEFT JOIN pago p ON c.codigo_cliente=p.codigo_cliente GROUP BY c.nombre_cliente;
-- 66. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008
-- ordenados alfabéticamente de menor a mayor.
SELECT c.nombre_cliente, YEAR(p.fecha_pedido) FROM cliente c INNER JOIN pedido p ON c.codigo_cliente=p.codigo_cliente WHERE YEAR(p.fecha_pedido) = 2008 GROUP BY c.nombre_cliente ORDER BY c.nombre_cliente ASC;
-- 67. Devuelve el nombre del cliente, el nombre y primer apellido de su
-- representante de ventas y el número de teléfono de la oficina del
-- representante de ventas, de aquellos clientes que no hayan realizado
-- ningún pago.
SELECT c.nombre_cliente as nombre_cliente, e.nombre as nombre_representante, e.apellido1 as apellido_representante, o.telefono as telefono_oficina FROM cliente c INNER JOIN empleado e ON c.codigo_empleado_rep_ventas=e.codigo_empleado INNER JOIN oficina o ON e.codigo_oficina=o.codigo_oficina LEFT JOIN pago p ON c.codigo_cliente=p.codigo_cliente WHERE p.codigo_cliente is null;
-- 68. Devuelve el listado de clientes donde aparezca el nombre del cliente, el
-- nombre y primer apellido de su representante de ventas y la ciudad donde
-- está su oficina.
SELECT c.nombre_cliente as cliente, e.nombre as nombre_representante, e.apellido1 as apellido_representante, o.ciudad as ciudad_oficina FROM cliente c INNER JOIN empleado e ON c.codigo_empleado_rep_ventas=e.codigo_empleado INNER JOIN oficina o on e.codigo_oficina=e.codigo_oficina;
-- 69. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
-- empleados que no sean representante de ventas de ningún cliente.
SELECT e.nombre, e.apellido1, e.puesto, o.telefono FROM empleado e INNER JOIN oficina o on e.codigo_oficina=o.codigo_oficina LEFT JOIN cliente c ON e.codigo_empleado=c.codigo_empleado_rep_ventas WHERE c.codigo_empleado_rep_ventas is null;

-- 70. Devuelve un listado indicando todas las ciudades donde hay oficinas y el
-- número de empleados que tiene.
SELECT o.ciudad, COUNT(e.codigo_oficina) as numero_empleados FROM oficina o INNER JOIN empleado e ON o.codigo_oficina=e.codigo_oficina GROUP BY o.ciudad;