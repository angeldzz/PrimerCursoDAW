-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT p.nombre,p.precio,f.nombre
FROM producto p INNER JOIN fabricante f 
on p.id_fabricante = f.id;

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
-- Ordena el resultado por el nombre del fabricante, por orden alfabético.
SELECT p.nombre,p.precio,f.nombre
FROM producto p INNER JOIN fabricante f 
on p.id_fabricante = f.id
ORDER By f.nombre asc;

-- Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del 
-- fabricante, de todos los productos de la base de datos.
SELECT p.id, p.nombre,f.id,f.nombre
FROM producto p INNER JOIN fabricante f 
on p.id_fabricante = f.id;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT p.nombre,p.precio,f.nombre
FROM producto p INNER JOIN fabricante f 
on p.id_fabricante = f.id
order by p.precio asc
limit 1;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT p.nombre,p.precio,f.nombre
FROM producto p INNER JOIN fabricante f 
on p.id_fabricante = f.id
order by p.precio desc
limit 1;

-- Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT p.nombre,p.precio,f.nombre
FROM producto p INNER JOIN fabricante f 
on p.id_fabricante = f.id
where f.nombre like "Lenovo";

-- Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT p.nombre,p.precio,f.nombre
FROM producto p INNER JOIN fabricante f 
on p.id_fabricante = f.id
where f.nombre like "Crucial" and p.precio>200;

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT p.nombre,p.precio,f.nombre
FROM producto p INNER JOIN fabricante f 
on p.id_fabricante = f.id
where f.nombre like "Asus" or f.nombre like "Hewlett-Packard"or f.nombre like "Seagate";
-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT p.nombre,p.precio,f.nombre
FROM producto p INNER JOIN fabricante f 
on p.id_fabricante = f.id
where f.nombre in ("Asus","Hewlett-Packard","Seagate");

-- Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT p.nombre,p.precio,f.nombre
FROM producto p INNER JOIN fabricante f 
on p.id_fabricante = f.id
where f.nombre like "%e";

-- Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w 
-- en su nombre.
SELECT p.nombre,p.precio,f.nombre
FROM producto p INNER JOIN fabricante f 
on p.id_fabricante = f.id
where f.nombre like "%w%";

-- Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor
--  o igual a 180€. Ordena el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
SELECT p.nombre,p.precio,f.nombre
FROM producto p INNER JOIN fabricante f 
on p.id_fabricante = f.id
where p.precio>180
ORDER by p.precio desc, f.nombre asc;

-- Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos 
-- asociados en la base de datos.
SELECT f.id,f.nombre
FROM producto p INNER JOIN fabricante f 
on p.id_fabricante = f.id;

-- Devuelve un listado de todos los fabricantes que existen en la base de datos, 
-- junto con los productos que tiene cada uno de ellos. 
-- El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT f.id,f.nombre
FROM producto p RIGHT JOIN fabricante f 
on p.id_fabricante = f.id;

-- Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto
--  asociado.
SELECT f.id,f.nombre
FROM producto p RIGHT JOIN fabricante f 
on p.id_fabricante = f.id
WHERE p.id_fabricante is null;

-- Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no
-- tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que 
-- tiene. Ordena el resultado descendentemente por el número de productos.
SELECT f.nombre,COUNT(*) as Cantidad_De_Productos
FROM producto p INNER JOIN fabricante f 
on p.id_fabricante = f.id
GROUP BY f.nombre
ORDER BY Cantidad_De_Productos desc;

-- Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los 
-- fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT f.nombre,max(p.precio) as Precio_Maximo ,min(p.precio) as Precio_Minimo
FROM producto p INNER JOIN fabricante f 
on p.id_fabricante = f.id
GROUP BY f.nombre;

-- Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los 
-- fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del
--  fabricante, con el identificador del fabricante es suficiente.
SELECT f.nombre,max(p.precio) as Precio_Maximo ,min(p.precio) as Precio_Minimo,AVG(p.precio) as Precio_Medio
FROM producto p INNER JOIN fabricante f 
on p.id_fabricante = f.id
GROUP BY f.nombre
HAVING Precio_Medio>200;

-- Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y 
-- el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es 
-- necesario mostrar el nombre del fabricante.
SELECT f.id,f.nombre,max(p.precio) as Precio_Maximo ,min(p.precio) as Precio_Minimo,AVG(p.precio) as Precio_Medio
FROM producto p INNER JOIN fabricante f 
on p.id_fabricante = f.id
GROUP BY f.nombre
HAVING Precio_Medio>200
ORDER by f.id asc;