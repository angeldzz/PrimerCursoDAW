-- 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
SELECT CODIGO_OFICINA, CIUDAD FROM OFICINA;

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
SELECT CIUDAD,TELEFONO FROM OFICINA WHERE PAIS = 'ESPAÑA';

-- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un
-- código de jefe igual a 7.
SELECT NOMBRE,APELLIDO1,APELLIDO2,EMAIL FROM EMPLEADO WHERE CODIGO_JEFE=7;

-- 4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.
SELECT PUESTO, NOMBRE,APELLIDO1,APELLIDO2,EMAIL FROM EMPLEADO WHERE PUESTO = 'DIRECTOR GENERAL';

-- 5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean
-- representantes de ventas.
SELECT NOMBRE,APELLIDO1,APELLIDO2,PUESTO FROM EMPLEADO WHERE PUESTO !='REPRESENTANTE VENTAS';

-- 6. Devuelve un listado con el nombre de los todos los clientes españoles.
SELECT NOMBRE_CLIENTE FROM CLIENTE WHERE PAIS = 'SPAIN';

-- 7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.
SELECT DISTINCT(ESTADO) FROM PEDIDO ORDER BY ESTADO ASC;

-- 8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago
-- en 2008. Ten en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan
-- repetidos. Resuelva la consulta:
    -- a. Utilizando la función YEAR de MySQL.
SELECT DISTINCT(CODIGO_CLIENTE) AS "COD CLIENTE" FROM PEDIDO WHERE YEAR(FECHA_PEDIDO)=2008;
    -- b. Utilizando la función DATE_FORMAT de MySQL.
SELECT DISTINCT(CODIGO_CLIENTE) AS "COD CLIENTE" FROM PEDIDO WHERE DATE_FORMAT(FECHA_PEDIDO,"%Y")=2008*;
    -- c. Sin utilizar ninguna de las funciones anteriores.
SELECT DISTINCT(CODIGO_CLIENTE) AS "COD CLIENTE" FROM PEDIDO 
WHERE FECHA_PEDIDO BETWEEN '2008/01/01' AND '2008/12/31';

-- 9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de
-- entrega de los pedidos que no han sido entregados a tiempo.
SELECT CODIGO_PEDIDO,CODIGO_CLIENTE,FECHA_ESPERADA,FECHA_ENTREGA FROM PEDIDO WHERE FECHA_ENTREGA <= FECHA_ESPERADA;

-- 10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de
-- entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha
-- esperada.
    -- a. Utilizando la función ADDDATE de MySQL.
SELECT CODIGO_PEDIDO,CODIGO_CLIENTE,FECHA_ESPERADA,FECHA_ENTREGA FROM PEDIDO WHERE FECHA_ENTREGA <= ADDDATE(FECHA_ESPERADA,-2);
    -- b. Utilizando la función DATEDIFF de MySQL.
SELECT CODIGO_PEDIDO,CODIGO_CLIENTE,FECHA_ESPERADA,FECHA_ENTREGA FROM PEDIDO WHERE DATEDIFF(FECHA_ENTREGA,FECHA_ESPERADA)>=2;    
    -- c. ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?
SELECT CODIGO_PEDIDO,CODIGO_CLIENTE,FECHA_ESPERADA,FECHA_ENTREGA FROM PEDIDO WHERE FECHA_ENTREGA < FECHA_ESPERADA - INTERVAL 2 DAY;

-- 11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
SELECT * FROM PEDIDO WHERE ESTADO='RECHAZADO' AND FECHA_PEDIDO BETWEEN '2009/01/01' AND '2009/12/31';

-- 12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de
-- cualquier año.
SELECT * FROM PEDIDO WHERE FECHA_ENTREGA = 1 MONTH;

-- 13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal.
-- Ordene el resultado de mayor a menor.
SELECT * FROM PEDIDO WHERE MONTH(FECHA_ENTREGA) = 1;

-- 14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Ten en
-- cuenta que no deben aparecer formas de pago repetidas.
SELECT DISTINCT(FORMA_PAGO) FROM PAGO;

-- 15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y
-- que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio
-- de venta, mostrando en primer lugar los de mayor precio.
SELECT * FROM PRODUCTO WHERE (CANTIDAD_EN_STOCK >= 100) AND (GAMA='ORNAMENTALES');

-- 16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo
-- representante de ventas tenga el código de empleado 11 o 30.
SELECT * FROM CLIENTE WHERE (CIUDAD='MADRID') AND (CODIGO_EMPLEADO_REP_VENTAS IN (11,30));