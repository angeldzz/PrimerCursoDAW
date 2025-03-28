-- 24. ¿Cuántos empleados hay en la compañía?
SELECT COUNT(*) as Nº_Empleados FROM empleado;

-- 25. ¿Cuántos clientes tiene cada país?
SELECT c.pais, COUNT(*) as Nº_Clientes FROM cliente c
GROUP BY c.pais;

-- 26. ¿Cuál fue el pago medio en 2009?
SELECT AVG(total) mediaPagos FROM pago;

-- 27. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma
-- descendente por el número de pedidos.
SELECT p.estado, COUNT(*) as Nº_Pedidos FROM pedido p
GROUP BY p.estado;

-- 28. Calcula el precio de venta del producto más caro y más barato en una
-- misma consulta.
SELECT max(precio_venta) as PrecioMasCaro, 
min(precio_venta) as PrecioMasBarato FROM producto;

-- 29. Calcula el número de clientes que tiene la empresa.
SELECT COUNT(*) as NºClientes FROM cliente;

-- 30. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
SELECT COUNT(*) as NºClientes FROM cliente WHERE lower(ciudad)="madrid";

-- 31. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por
-- M?
SELECT ciudad,COUNT(*) as NºClientes FROM cliente 
GROUP BY ciudad HAVING ciudad like "m%";

-- 32. Devuelve el nombre de los representantes de ventas y el número de
-- clientes al que atiende cada uno.
SELECT puesto,COUNT(*) FROM empleado 
GROUP BY puesto HAVING lower(puesto) like "representante ventas";

-- 33. Calcula el número de clientes que no tiene asignado representante de
-- ventas.
SELECT COUNT(*) as ClientesSinRep from cliente 
WHERE codigo_empleado_rep_ventas is null;

-- 34. Calcula la fecha del primer y último pago realizado por cada uno de los
-- clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
SELECT c.nombre_cliente,c.apellido_contacto,
min(p.fecha_pago) as PrimeraFechaPago,
max(p.fecha_pago) as UltimaFechaPago from cliente c
INNER JOIN pago p on p.codigo_cliente=c.codigo_cliente 
GROUP BY c.codigo_cliente;

-- 35. Calcula el número de productos diferentes que hay en cada uno de los
-- pedidos.
SELECT DP.codigo_producto,COUNT(*) as CantidadDeProductosDistintos 
FROM detalle_pedido dp GROUP BY dp.codigo_pedido;

-- 36. Calcula la suma de la cantidad total de todos los productos que aparecen en
-- cada uno de los pedidos.
SELECT p.codigo_pedido,COUNT(*) as ProductosXPedido FROM pedido p 
INNER JOIN detalle_pedido dp on p.codigo_pedido=dp.codigo_pedido
INNER JOIN producto pd ON pd.codigo_producto=dp.codigo_producto
GROUP BY p.codigo_pedido;

-- 37. Devuelve un listado de los 20 productos más vendidos y el número total de
-- unidades que se han vendido de cada uno. El listado deberá estar ordenado
-- por el número total de unidades vendidas.
SELECT dp.codigo_producto,dp.cantidad FROM detalle_pedido dp
ORDER BY dp.cantidad desc
LIMIT 20;

-- 38. La facturación que ha tenido la empresa en toda la historia, indicando la
-- base imponible, el IVA y el total facturado. La base imponible se calcula
-- sumando el coste del producto por el número de unidades vendidas de la
-- tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la
-- suma de los dos campos anteriores.
SELECT 
    SUM(dp.cantidad * dp.precio_unidad) AS base_imponible,
    SUM(dp.cantidad * dp.precio_unidad) * 0.21 AS iva,
    SUM(dp.cantidad * dp.precio_unidad) * 1.21 AS total_facturado
FROM 
    detalle_pedido dp;

-- 39. La misma información que en la pregunta anterior, pero agrupada por
-- código de producto.
SELECT 
	dp.codigo_producto,
    SUM(dp.cantidad * dp.precio_unidad) AS base_imponible,
    SUM(dp.cantidad * dp.precio_unidad) * 0.21 AS iva,
    SUM(dp.cantidad * dp.precio_unidad) * 1.21 AS total_facturado
FROM 
    detalle_pedido dp
    GROUP BY 
    dp.codigo_producto;

-- 40. La misma información que en la pregunta anterior, pero agrupada por
-- código de producto filtrada por los códigos que empiecen por OR.
SELECT 
	dp.codigo_producto,
    SUM(dp.cantidad * dp.precio_unidad) AS base_imponible,
    SUM(dp.cantidad * dp.precio_unidad) * 0.21 AS iva,
    SUM(dp.cantidad * dp.precio_unidad) * 1.21 AS total_facturado
FROM 
    detalle_pedido dp
    GROUP BY 
    dp.codigo_producto
    HAVING 
    lower(dp.codigo_producto) LIKE "or%";

-- 41. Lista las ventas totales de los productos que hayan facturado más de 3000
-- euros. Se mostrará el nombre, unidades vendidas, total facturado y total
-- facturado con impuestos (21% IVA).
SELECT 
	dp.codigo_producto,
    SUM(dp.cantidad * dp.precio_unidad) AS base_imponible,
    SUM(dp.cantidad * dp.precio_unidad) * 0.21 AS iva,
    SUM(dp.cantidad * dp.precio_unidad) * 1.21 AS total_facturado
FROM 
    detalle_pedido dp
    GROUP BY 
    dp.codigo_producto
    HAVING 
    total_facturado>3000;

-- 42. Muestre la suma total de todos los pagos que se realizaron para cada uno
-- de los años que aparecen en la tabla pagos.
SELECT Year(p.fecha_pago) as Anio,Sum(p.total) as SumaTotales FROM pago p 
GROUP BY Anio
