-- 1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su
-- representante de ventas.
Select c.nombre_cliente,e.nombre as Representante,e.apellido1 as ApellidoRep from cliente c 
Inner JOIN empleado e on c.codigo_empleado_rep_ventas=e.codigo_empleado;

-- 2. Muestra el nombre de los clientes que hayan realizado pagos junto con el
-- nombre de sus representantes de ventas.
SELECT c.nombre_cliente,e.nombre as Representante,e.apellido1 as ApellidoRep,p.total From cliente c INNER JOIN empleado e on c.codigo_empleado_rep_ventas=e.codigo_empleado
INNER JOIN pago p on c.codigo_cliente=p.codigo_cliente;

-- 3. Muestra el nombre de los clientes que no hayan realizado pagos junto con
-- el nombre de sus representantes de ventas.
SELECT c.nombre_cliente,e.nombre as Representante,e.apellido1 as ApellidoRep,p.total From cliente c INNER JOIN empleado e on c.codigo_empleado_rep_ventas=e.codigo_empleado
LEFT JOIN pago p on c.codigo_cliente=p.codigo_cliente WHERE p.total is null;

-- 4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus
-- representantes junto con la ciudad de la oficina a la que pertenece el
-- representante.
SELECT c.nombre_cliente,e.nombre as Representante,e.apellido1 as ApellidoRep,o.ciudad From cliente c 
INNER JOIN empleado e on c.codigo_empleado_rep_ventas=e.codigo_empleado
INNER JOIN pago p on c.codigo_cliente=p.codigo_cliente
INNER JOIN oficina o on e.codigo_oficina=o.codigo_oficina;

-- 5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre
-- de sus representantes junto con la ciudad de la oficina a la que pertenece el
-- representante.
SELECT c.nombre_cliente,e.nombre as Representante,e.apellido1 as ApellidoRep,o.ciudad,p.total 
From cliente c 
INNER JOIN empleado e on c.codigo_empleado_rep_ventas=e.codigo_empleado
LEFT JOIN pago p on c.codigo_cliente=p.codigo_cliente
INNER JOIN oficina o on e.codigo_oficina=o.codigo_oficina
WHERE p.total is null;

-- 6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
SELECT o.linea_direccion1,o.linea_direccion2,c.ciudad from oficina o INNER JOIN empleado e on e.codigo_oficina=o.codigo_oficina
INNER JOIN cliente c on e.codigo_empleado=c.codigo_empleado_rep_ventas
WHERE lower(c.ciudad)="fuenlabrada";

-- 7. Devuelve el nombre de los clientes y el nombre de sus representantes junto
-- con la ciudad de la oficina a la que pertenece el representante.
SELECT c.nombre_cliente,e.nombre,c.ciudad from oficina o INNER JOIN empleado e on e.codigo_oficina=o.codigo_oficina
INNER JOIN cliente c on e.codigo_empleado=c.codigo_empleado_rep_ventas;

-- 8. Devuelve un listado con el nombre de los empleados junto con el nombre
-- de sus jefes.
SELECT e1.nombre AS nombre_empleado, e2.nombre AS nombre_jefe
FROM empleado e1
LEFT JOIN empleado e2 ON e1.codigo_jefe = e2.codigo_empleado;

-- 9. Devuelve un listado que muestre el nombre de cada empleados, el nombre
-- de su jefe y el nombre del jefe de sus jefe.
SELECT e1.nombre AS nombre_empleado, e2.nombre AS nombre_jefe, e3.nombre AS nombre_Jefe_del_Jefe
FROM empleado e1
LEFT JOIN empleado e2 ON e1.codigo_jefe = e2.codigo_empleado
LEFT JOIN empleado e3 ON e2.codigo_jefe = e3.codigo_empleado;

-- 10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
SELECT c.nombre_cliente,p.fecha_esperada,p.fecha_entrega from cliente c INNER JOIN pedido p on c.codigo_cliente=p.codigo_cliente
WHERE p.fecha_entrega>p.fecha_esperada;

-- 11. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
SELECT gp.gama,c.nombre_cliente FROM cliente c INNER JOIN pedido pe on c.codigo_cliente=pe.codigo_cliente
INNER JOIN detalle_pedido dp on dp.codigo_pedido=pe.codigo_pedido
INNER JOIN producto pr on pr.codigo_producto=dp.codigo_producto
INNER JOIN gama_producto gp ON pr.gama= gp.gama
GROUP BY c.nombre_cliente,gp.gama;


-- 12. Devuelve un listado que muestre solamente los clientes que no han
-- realizado ningún pago.
SELECT DISTINCT c.nombre_cliente,p.total From cliente c 
LEFT JOIN pago p on c.codigo_cliente=p.codigo_cliente WHERE p.total is null;

-- 13. Devuelve un listado que muestre solamente los clientes que no han
-- realizado ningún pedido.
SELECT c.nombre_cliente,p.codigo_pedido From cliente c 
LEFT JOIN pedido p on c.codigo_cliente=p.codigo_cliente WHERE p.codigo_cliente is null;

-- 14. Devuelve un listado que muestre los clientes que no han realizado ningún
-- pago y los que no han realizado ningún pedido.
SELECT c.nombre_cliente,pd.codigo_cliente,pg.total From cliente c 
LEFT JOIN pago pg on c.codigo_cliente=pg.codigo_cliente
LEFT JOIN pedido pd on c.codigo_cliente=pd.codigo_cliente WHERE pd.codigo_cliente is null and pg.total is null;


-- 15. Devuelve un listado que muestre solamente los empleados que no tienen
-- una oficina asociada.
SELECT e.nombre FROM empleado e INNER JOIN oficina o on e.codigo_oficina=o.codigo_oficina;

-- 16. Devuelve un listado que muestre solamente los empleados que no tienen
-- un cliente asociado.
SELECT e.nombre,COUNT(c.codigo_cliente) as CantidadEmpleados from empleado e INNER JOIN cliente c ON e.codigo_empleado=c.codigo_empleado_rep_ventas
GROUP BY e.nombre
HAVING CantidadEmpleados=1;

-- 17. Devuelve un listado que muestre solamente los empleados que no tienen
-- un cliente asociado junto con los datos de la oficina donde trabajan.
SELECT DISTINCT e.nombre,o.linea_direccion1 as direccion_Oficina from empleado e 
LEFT JOIN cliente c on e.codigo_empleado=c.codigo_empleado_rep_ventas
INNER JOIN oficina o on e.codigo_oficina=o.codigo_oficina
WHERE c.codigo_empleado_rep_ventas is null;

-- 18. Devuelve un listado que muestre los empleados que no tienen una oficina
-- asociada y los que no tienen un cliente asociado.
SELECT e.nombre,c.nombre_cliente,o.linea_direccion1 FROM empleado e 
LEFT JOIN oficina o on o.codigo_oficina=e.codigo_oficina
LEFT JOIN cliente c on e.codigo_empleado=c.codigo_empleado_rep_ventas
WHERE c.codigo_empleado_rep_ventas is null or e.codigo_oficina is null;

-- 19. Devuelve un listado de los productos que nunca han aparecido en un
-- pedido.
SELECT pr.nombre,dp.codigo_pedido from pedido pd 
INNER JOIN detalle_pedido dp ON pd.codigo_pedido=dp.codigo_pedido
RIGHT JOIN producto pr ON pr.codigo_producto=dp.codigo_producto
WHERE dp.codigo_producto is null;

-- 20. Devuelve un listado de los productos que nunca han aparecido en un
-- pedido. El resultado debe mostrar el nombre, la descripción y la imagen del
-- producto.
SELECT p.nombre,p.descripcion,gp.imagen from producto p 
INNER JOIN gama_producto gp on p.gama=gp.gama
LEFT JOIN detalle_pedido dp ON p.codigo_producto=dp.codigo_producto 
WHERE dp.codigo_pedido is null;

-- 21. Devuelve las oficinas donde no trabajan ninguno de los empleados que
-- hayan sido los representantes de ventas de algún cliente que haya realizado
-- la compra de algún producto de la gama Frutales.
SELECT *
FROM oficina
WHERE codigo_oficina NOT IN (
    SELECT DISTINCT o.codigo_oficina
    FROM oficina o
    INNER JOIN empleado e ON o.codigo_oficina = e.codigo_oficina
    INNER JOIN cliente c ON e.codigo_empleado = c.codigo_empleado_rep_ventas
    INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
    INNER JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
    INNER JOIN producto pr ON dp.codigo_producto = pr.codigo_producto
    INNER JOIN gama_producto gp ON pr.gama = gp.gama
    WHERE gp.gama = 'Frutales'
);

-- 22. Devuelve un listado con los clientes que han realizado algún pedido pero no
-- han realizado ningún pago.
SELECT DISTINCT c.nombre_cliente from cliente c INNER JOIN pedido p on c.codigo_cliente=p.codigo_cliente
LEFT JOIN pago pg ON c.codigo_cliente=pg.codigo_cliente
WHERE pg.codigo_cliente is null;

-- 23. Devuelve un listado con los datos de los empleados que no tienen clientes
-- asociados y el nombre de su jefe asociado.
SELECT e1.nombre,e2.nombre FROM empleado e1
LEFT JOIN cliente c ON e1.codigo_empleado=c.codigo_empleado_rep_ventas
INNER JOIN empleado e2 on e1.codigo_empleado=e2.codigo_jefe
WHERE c.codigo_empleado_rep_ventas is null;


