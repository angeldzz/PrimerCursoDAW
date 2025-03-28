-- Subconsultas

-- Con operadores básicos de comparación

-- 43. Devuelve el nombre del cliente con mayor límite de crédito.
SELECT c.nombre_cliente, (SELECT c.limite_credito FROM cliente c LIMIT 1) 
as MaxCreditoCliente FROM cliente c ORDER BY c.limite_credito LIMIT 1;

-- 44. Devuelve el nombre del producto que tenga el precio de venta más caro.
SELECT p.nombre, (SELECT p.precio_venta FROM producto LIMIT 1) as Precio
From producto p ORDER BY p.precio_venta DESC LIMIT 1;

-- 45. Devuelve el nombre del producto del que se han vendido más unidades.
-- (Ten en cuenta que tendrá que calcular cuál es el número total de unidades
-- que se han vendido de cada producto a partir de los datos de la tabla
-- detalle_pedido)
SELECT p.nombre, p.codigo_producto FROM producto p 
WHERE p.codigo_producto=(SELECT dp.codigo_producto FROM detalle_pedido dp 
GROUP BY dp.codigo_producto ORDER BY SUM(dp.cantidad) DESC LIMIT 1);

-- 46. Los clientes cuyo límite de crédito sea mayor que los pagos que haya
-- realizado. (Sin utilizar INNER JOIN).
SELECT c.nombre_cliente FROM cliente c WHERE c.limite_credito >
(SELECT SUM(p.total) FROM pago p WHERE c.codigo_cliente=p.codigo_cliente)

-- 47. Devuelve el producto que más unidades tiene en stock.
SELECT p.nombre,p.cantidad_en_stock from producto p 
WHERE p.cantidad_en_stock=(SELECT MAX(producto.cantidad_en_stock) from producto);

-- 48. Devuelve el producto que menos unidades tiene en stock.
SELECT p.nombre,p.cantidad_en_stock from producto p 
WHERE p.cantidad_en_stock=(SELECT MIN(producto.cantidad_en_stock) from producto);

-- 49. Devuelve el nombre, los apellidos y el email de los empleados que están a
-- cargo de Alberto Soria.

SELECT e1.nombre,e1.apellido1,e1.apellido2,e1.email,e1.codigo_jefe FROM empleado e1 
WHERE e1.codigo_jefe=(SELECT empleado.codigo_empleado FROM empleado 
WHERE lower(empleado.nombre) like "alberto" and lower(empleado.apellido1) like "soria")


-- Subconsultas con ALL y ANY
-- 50. Devuelve el nombre del cliente con mayor límite de crédito.
SELECT nombre_cliente 
FROM cliente 
WHERE limite_credito = ANY (SELECT MAX(limite_credito) FROM cliente);

-- 51. Devuelve el nombre del producto que tenga el precio de venta más caro.
SELECT p.nombre from producto p 
WHERE p.precio_venta = ANY (SELECT MAX(producto.precio_venta) from producto)

-- 52. Devuelve el producto que menos unidades tiene en stock.
SELECT producto.nombre,producto.cantidad_en_stock from producto 
WHERE producto.cantidad_en_stock = 
ALL(SELECT MIN(producto.cantidad_en_stock) FROM producto)

-- Subconsultas con IN y NOT IN
-- 53. Devuelve el nombre, apellido1 y cargo de los empleados que no
-- representen a ningún cliente.
SELECT empleado.codigo_empleado,empleado.nombre FROM empleado WHERE empleado.codigo_empleado 
NOT IN(SELECT cliente.codigo_empleado_rep_ventas from cliente)

-- 54. Devuelve un listado que muestre solamente los clientes que no han
-- realizado ningún pago.
SELECT cliente.nombre_cliente,
(SELECT pago.codigo_cliente from pago WHERE pago.codigo_cliente=cliente.codigo_cliente) AS Cod_Cliente_Pago
FROM cliente where  cliente.codigo_cliente NOT IN(SELECT pago.codigo_cliente FROM pago)

-- 55. Devuelve un listado que muestre solamente los clientes que sí han realizado
-- algún pago.
SELECT cliente.nombre_cliente,
(SELECT pago.codigo_cliente from pago WHERE pago.codigo_cliente=cliente.codigo_cliente LIMIT 1)
FROM cliente where  cliente.codigo_cliente IN(SELECT pago.codigo_cliente FROM pago)

-- 56. Devuelve un listado de los productos que nunca han aparecido en un
-- pedido.
SELECT producto.nombre FROM producto WHERE producto.codigo_producto 
NOT IN(SELECT detalle_pedido.codigo_producto FROM detalle_pedido)

-- 57. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
-- empleados que no sean representante de ventas de ningún cliente.
SELECT producto.nombre,
(SELECT detalle_pedido.codigo_producto from detalle_pedido WHERE detalle_pedido.codigo_producto=producto.codigo_producto)
 as Cod_Producto_DP FROM producto WHERE producto.codigo_producto NOT IN(SELECT detalle_pedido.codigo_producto FROM detalle_pedido)

-- 58. Devuelve las oficinas donde no trabajan ninguno de los empleados que
-- hayan sido los representantes de ventas de algún cliente que haya realizado
-- la compra de algún producto de la gama Frutales.
SELECT oficina.linea_direccion1 FROM oficina WHERE oficina.codigo_oficina 
in(SELECT empleado.codigo_oficina FROM empleado WHERE empleado.codigo_empleado 
   in(SELECT cliente.codigo_empleado_rep_ventas FROM cliente WHERE cliente.codigo_cliente 
      in(SELECT pedido.codigo_cliente FROM pedido WHERE pedido.codigo_pedido 
         in(SELECT detalle_pedido.codigo_pedido FROM detalle_pedido WHERE detalle_pedido.codigo_pedido
           in(SELECT detalle_pedido.codigo_pedido FROM detalle_pedido WHERE detalle_pedido.codigo_producto 
              in(SELECT producto.codigo_producto  FROM producto WHERE producto.gama 
                in(SELECT gama_producto.gama FROM gama_producto WHERE lower(gama_producto.gama) LIKE "frutales")))))))

-- 59. Devuelve un listado con los clientes que han realizado algún pedido pero no
-- han realizado ningún pago.
SELECT cliente.nombre_cliente FROM cliente WHERE cliente.codigo_cliente
NOT in(SELECT pago.codigo_cliente from pago) AND
cliente.codigo_cliente IN(SELECT pedido.codigo_cliente FROM pedido)


-- Subconsultas con EXISTS y NOT EXISTS
-- 60. Devuelve un listado que muestre solamente los clientes que no han
-- realizado ningún pago.
SELECT cliente.nombre_cliente 
FROM cliente 
WHERE NOT EXISTS (
    SELECT pago.codigo_cliente
    FROM pago 
    WHERE cliente.codigo_cliente = pago.codigo_cliente
);

-- 61. Devuelve un listado que muestre solamente los clientes que sí han realizado
-- algún pago.
SELECT cliente.nombre_cliente from  cliente 
WHERE EXISTS (SELECT pago.codigo_cliente from pago WHERE pago.codigo_cliente=cliente.codigo_cliente)

-- 62. Devuelve un listado de los productos que nunca han aparecido en un
-- pedido.
SELECT producto.nombre from producto WHERE NOT EXISTS(SELECT detalle_pedido.codigo_producto 
FROM detalle_pedido WHERE detalle_pedido.codigo_producto=producto.codigo_producto)

-- 63. Devuelve un listado de los productos que han aparecido en un pedido
-- alguna vez.
SELECT producto.nombre from producto WHERE EXISTS(SELECT detalle_pedido.codigo_producto 
FROM detalle_pedido WHERE detalle_pedido.codigo_producto=producto.codigo_producto)

-- Consultas variadas
-- 64. Devuelve el listado de clientes indicando el nombre del cliente y cuántos
-- pedidos ha realizado. Ten en cuenta que pueden existir clientes que no han
-- realizado ningún pedido.
SELECT cliente.nombre_cliente,
Count((SELECT pedido.codigo_pedido FROM pedido WHERE pedido.codigo_cliente=cliente.codigo_cliente 
GROUP BY cliente.nombre_cliente)) AS  TotalPedidos 
FROM cliente GROUP BY  cliente.nombre_cliente;

-- 65. Devuelve un listado con los nombres de los clientes y el total pagado por
-- cada uno de ellos. Ten en cuenta que pueden existir clientes que no han
-- realizado ningún pago.
SELECT cliente.nombre_cliente,Count(pedido.codigo_pedido) FROM cliente 
LEFT JOIN pedido on cliente.codigo_cliente=pedido.codigo_cliente 
GROUP BY cliente.nombre_cliente;

-- 66. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008
-- ordenados alfabéticamente de menor a mayor.
SELECT DISTINCT cliente.nombre_cliente from cliente 
INNER JOIN pedido ON cliente.codigo_cliente=pedido.codigo_cliente 
WHERE YEAR(pedido.fecha_pedido)= 2008
ORDER BY cliente.nombre_cliente asc

-- 67. Devuelve el nombre del cliente, el nombre y primer apellido de su
-- representante de ventas y el número de teléfono de la oficina del
-- representante de ventas, de aquellos clientes que no hayan realizado
-- ningún pago.
SELECT c.nombre_cliente,e.nombre,e.apellido1,o.telefono FROM cliente c 
INNER JOIN empleado e on c.codigo_empleado_rep_ventas=e.codigo_empleado
INNER JOIN oficina o on o.codigo_oficina=e.codigo_oficina
LEFT JOIN pago p on c.codigo_cliente=p.codigo_cliente
WHERE p.codigo_cliente is null;

-- 68. Devuelve el listado de clientes donde aparezca el nombre del cliente, el
-- nombre y primer apellido de su representante de ventas y la ciudad donde
-- está su oficina.
SELECT c.nombre_cliente,e.nombre,e.apellido1,o.ciudad from cliente c 
INNER JOIN empleado e on c.codigo_empleado_rep_ventas=e.codigo_empleado
INNER JOIN oficina o on o.codigo_oficina=e.codigo_oficina;

-- 69. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos
-- empleados que no sean representante de ventas de ningún cliente.
SELECT e.nombre,e.apellido1,e.apellido2,e.puesto,o.telefono,c.codigo_empleado_rep_ventas from cliente c 
RIGHT JOIN empleado e on c.codigo_empleado_rep_ventas=e.codigo_empleado
INNER JOIN oficina o on o.codigo_oficina=e.codigo_oficina
WHERE c.codigo_empleado_rep_ventas is null

-- 70. Devuelve un listado indicando todas las ciudades donde hay oficinas y el
-- número de empleados que tiene.
SELECT o.ciudad, COUNT(e.codigo_empleado) as NºEmpleados from oficina o 
INNER JOIN empleado e on e.codigo_oficina=o.codigo_oficina GROUP BY o.ciudad;