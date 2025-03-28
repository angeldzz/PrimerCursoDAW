-- 1. SUBCONSULTAS (EN LA CLÁUSULA WHERE)
    -- 1.1.Con operadores básicos de comparación
        -- 1.1.1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar
        -- INNER JOIN).
SELECT * FROM producto p WHERE p.id_fabricante = (SELECT id from fabricante WHERE lower(nombre) like "lenovo");

        -- 1.1.2. Devuelve todos los datos de los productos que tienen el mismo
        -- precio que el producto más caro del fabricante Lenovo. (Sin utilizar
        -- INNER JOIN).
 --PD: las dos son validas       
SELECT * from producto p WHERE p.precio = (SELECT p.precio FROM producto p WHERE p.id_fabricante = (SELECT id from fabricante WHERE lower(nombre) like "lenovo") ORDER by p.precio  desc limit 1);

SELECT * from producto p 
WHERE p.precio = (SELECT Max(p.precio) FROM producto p 
WHERE p.id_fabricante = (SELECT id from fabricante 
WHERE lower(nombre) like "lenovo"));

        -- 1.1.3. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT p.nombre from producto p 
WHERE p.precio = (SELECT Max(p.precio) FROM producto p 
WHERE p.id_fabricante = (SELECT id from fabricante 
WHERE lower(nombre) like "lenovo"));

        -- 1.1.4. Lista el nombre del producto más barato del fabricante Hewlett-
        -- Packard.
SELECT p.nombre from producto p 
WHERE p.precio = (SELECT min(p.precio) FROM producto p 
WHERE p.id_fabricante = (SELECT id from fabricante 
WHERE lower(nombre) like "hewlett-packard"));

        -- 1.1.5. Devuelve todos los productos de la base de datos que tienen un
        -- precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT * from producto p 
WHERE p.precio >= (SELECT Max(p.precio) FROM producto p 
WHERE p.id_fabricante = (SELECT id from fabricante 
WHERE lower(nombre) like "lenovo"));

        -- 1.1.6. Lista todos los productos del fabricante Asus que tienen un precio
        -- superior al precio medio de todos sus productos.
SELECT * from producto p 
WHERE p.id_fabricante = (select f.id from fabricante f 
WHERE lower(f.nombre) = "asus") and p.precio > (select AVG(p.precio) from producto);

    -- 1.2.Subconsultas con ALL y ANY
        -- 1.2.1. Devuelve el producto más caro que existe en la tabla producto sin
        -- hacer uso de MAX, ORDER BY ni LIMIT.
SELECT *
FROM producto
WHERE precio >= ALL (SELECT precio FROM producto);

        -- 1.2.2. Devuelve el producto más barato que existe en la tabla producto sin
        -- hacer uso de MIN, ORDER BY ni LIMIT.
SELECT *
FROM producto
WHERE precio <= ALL (SELECT precio FROM producto);

        -- 1.2.3. Devuelve los nombres de los fabricantes que tienen productos
        -- asociados. (Utilizando ALL o ANY).
SELECT * FROM fabricante 
WHERE id = ANY (SELECT id_fabricante FROM producto);

        -- 1.2.4. Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
SELECT * FROM fabricante f WHERE f.id != All (SELECT p.id_fabricante FROM producto p);

    -- 1.3.Subconsultas con IN y NOT IN
        -- 1.3.1. Devuelve los nombres de los fabricantes que tienen productos
        -- asociados. (Utilizando IN o NOT IN).
SELECT * FROM fabricante f WHERE f.id in (SELECT p.id_fabricante FROM producto p);

        -- 1.3.2. Devuelve los nombres de los fabricantes que no tienen productos
        -- asociados. (Utilizando IN o NOT IN).
SELECT * FROM fabricante f WHERE f.id not in (SELECT p.id_fabricante FROM producto p);

    -- 1.4.Subconsultas con EXISTS y NOT EXISTS

        -- 1.4.1. Devuelve los nombres de los fabricantes que tienen productos
        -- asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT *
FROM fabricante f
WHERE EXISTS (SELECT 1 FROM producto p WHERE f.id = p.id_fabricante);

        -- 1.4.2. Devuelve los nombres de los fabricantes que no tienen productos
        -- asociados. (Utilizando EXISTS o NOT EXISTS).
SELECT *
FROM fabricante f
WHERE NOT EXISTS (SELECT 1 FROM producto p WHERE f.id = p.id_fabricante);

    -- 1.5.Subconsultas correlacionadas
        -- 1.5.1. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
SELECT 
    (SELECT nombre FROM fabricante WHERE id = p.id_fabricante) AS fabricante,
    p.nombre AS Producto,
    p.precio AS Precio_Mas_Caro 
FROM 
    producto p
WHERE 
    p.precio = (
        SELECT MAX(precio) 
        FROM producto 
        WHERE id_fabricante = p.id_fabricante
    );

        -- 1.5.2. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los 
        -- productos de su mismo fabricante.
SELECT 
    (SELECT nombre FROM fabricante WHERE id = p.id_fabricante) AS fabricante,
    p.nombre AS Producto,
    p.precio AS Precio_Mas_Caro 
FROM 
    producto p
WHERE 
    p.precio >(
        SELECT AVG(precio) 
        FROM producto 
        WHERE id_fabricante = p.id_fabricante
    );

        -- 1.5.3. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT nombre
FROM producto p1
WHERE p1.id_fabricante = (
    SELECT id 
    FROM fabricante 
    WHERE nombre = 'Lenovo'
) 
AND p1.precio = (
    SELECT MAX(precio) 
    FROM producto p2 
    WHERE p2.id_fabricante = p1.id_fabricante
);

-- 2. SUBCONSULTAS (EN LA CLÁUSULA HAVING)
        -- 2.1.Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que 
        -- el fabricante Lenovo.
        SELECT nombre
FROM fabricante
GROUP BY nombre
HAVING COUNT(*) = (
    SELECT COUNT(*) 
    FROM producto 
    WHERE id_fabricante = (SELECT id FROM fabricante WHERE nombre = 'Lenovo'));