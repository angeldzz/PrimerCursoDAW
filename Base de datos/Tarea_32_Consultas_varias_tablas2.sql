-- 1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar 
-- ordenados por la fecha de realización mostrando en primer lugar los pedidos más recientes.
SELECT * from pedido p order by p.fecha desc;

-- 2. Devuelve todos los datos de los dos pedidos de mayor valor.
SELECT * from pedido p order by p.total desc LIMIT 2;

-- 3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. 
-- Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
SELECT c.id from cliente c INNER JOIN pedido p on c.id = p.id_cliente
group by c.id;

-- 4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.
SELECT * from pedido p 
where year(p.fecha)=2017 and p.total>500;

-- 5. Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.
SELECT c.nombre,c.apellido1,c.apellido2 from comercial c 
where comision BETWEEN 0.05 and 0.11;

-- 6. Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
SELECT c.comision from comercial c 
order by c.comision desc LIMIT 1;

-- 7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apellido no es NULL. 
-- El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
SELECT c.id,c.nombre,c.apellido1 from cliente c 
where c.apellido2 is not null
order by c.nombre asc,c.apellido1 asc;

-- 8. Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y también los nombres 
-- que empiezan por P. El listado deberá estar ordenado alfabéticamente.
SELECT c.nombre,c.apellido1 from cliente c 
where c.nombre like "A%n" or c.nombre like "P%"
order by c.nombre asc;

-- 9. Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá estar ordenado alfabéticamente.
SELECT c.nombre,c.apellido1 from cliente c 
where c.nombre not like "A%"
order by c.nombre asc;

-- 10. Devuelve un listado con los nombres de los comerciales que terminan por el ,o, o. Ten en cuenta que se deberán eliminar 
-- los nombres repetidos.
SELECT c.nombre,c.apellido1 from comercial c 
where c.nombre like "%el" or c.nombre like "%o"
group by c.nombre asc;

-- 11. Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. 
-- El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
SELECT c.id,c.nombre,c.apellido1 from cliente c 
INNER JOIN pedido p on c.id=p.id_cliente
group by c.nombre asc
order by c.nombre asc;

-- 12. Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos 
-- los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
SELECT c.*,p.id as Id_Pedido from cliente c 
INNER JOIN pedido p on c.id=p.id_cliente
order by c.nombre asc;

-- 13. Devuelve un listado que muestre todos los pedidos en los que ha participado un comercial. El resultado debe mostrar 
-- todos los datos de los pedidos y de los comerciales. El listado debe mostrar los datos de los comerciales ordenados alfabéticamente.
SELECT c.*,p.id as Id_Pedido from comercial c 
INNER JOIN pedido p on c.id=p.id_comercial
order by c.nombre asc;

-- 14. Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los
--  comerciales asociados a cada pedido.
SELECT cli.nombre as Nombre_Cliente,com.*,p.id as Id_Pedido from comercial com
INNER JOIN pedido p on com.id=p.id_comercial
INNER JOIN cliente cli on p.id_cliente=cli.id;--Doble Inner Join


-- 15. Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2017, cuya cantidad esté entre 300 € y 1000 €.
SELECT c.*,p.fecha,p.total as Cantidad from cliente c INNER JOIN pedido p on c.id=p.id_cliente
WHERE year(p.fecha)=2017 and p.total BETWEEN 300 and 1000
ORDER by c.nombre asc;

-- 16. Devuelve el nombre y los apellidos de todos los comerciales que han participado en algún pedido realizado por María 
-- Santana Moreno.
SELECT com.nombre,com.apellido1,cli.nombre as Nombre_Cliente from comercial com
INNER JOIN pedido p on com.id=p.id_comercial
INNER JOIN cliente cli on p.id_cliente=cli.id
where cli.nombre like "María" and 
cli.apellido1 like "Santana" and 
cli.apellido2 like "Moreno";

-- 17. Devuelve el nombre de todos los clientes que han realizado algún pedido con el comercial Daniel Sáez Vega.
SELECT cli.nombre as Nombre_Cliente,concat(com.nombre,"  ",com.apellido1) as Nombre_Comercial from comercial com
INNER JOIN pedido p on com.id=p.id_comercial
INNER JOIN cliente cli on p.id_cliente=cli.id
where com.nombre like "Daniel" AND
com.apellido1 like "Sáez" and 
com.apellido2 like "Vega";
--esta tambien se puede hacer de esta forma para hacerla mas rapidamente 
SELECT cli.nombre as Nombre_Cliente,concat(com.nombre,"  ",com.apellido1) as Nombre_Comercial from comercial com
INNER JOIN pedido p on com.id=p.id_comercial
INNER JOIN cliente cli on p.id_cliente=cli.id
where concat(com.nombre,com.apellido1,com.apellido2) like "DanielSáezVega";

-- 18. Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado 
-- también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente 
-- por el primer apellido, segundo apellido y nombre de los clientes.
SELECT c.* from cliente c INNER JOIN pedido p on c.id=p.id_cliente
ORDER by c.apellido1 asc, c.apellido2 asc, c.nombre asc;

-- 19. Devuelve un listado con todos los comerciales junto con los datos de los pedidos que han realizado. Este listado 
-- también debe incluir los comerciales que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente 
-- por el primer apellido, segundo apellido y nombre de los comerciales.
SELECT c.* from comercial c INNER JOIN pedido p on c.id=p.id_comercial
GROUP BY c.nombre asc
ORDER by c.apellido1 asc, c.apellido2 asc, c.nombre asc;

-- 20. Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
SELECT c.* from cliente c left JOIN pedido p on c.id=p.id_cliente
WHERE p.id_cliente is null;

-- 21. Devuelve un listado que solamente muestre los comerciales que no han realizado ningún pedido.
SELECT c.* from comercial c left JOIN pedido p on c.id=p.id_comercial
WHERE p.id_comercial is null;

-- 22. Devuelve un listado con los clientes que no han realizado ningún pedido y de los comerciales que no han 
-- participado en ningún  pedido. Ordena el listado alfabéticamente por los apellidos y el nombre. 
-- En el listado deberás diferenciar de algún modo los clientes y los comerciales.
SELECT 'Cliente' AS tipo, cli.nombre
FROM cliente cli
LEFT JOIN pedido p ON cli.id = p.id_cliente
WHERE p.id IS NULL

UNION

SELECT 'Comercial' AS tipo, com.nombre
FROM comercial com
LEFT JOIN pedido p ON com.id = p.id_comercial
WHERE p.id IS NULL;

-- 23. Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido. 
SELECT COUNT(*) as Suma_Pedidos FROM pedido;

-- 24. Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
SELECT AVG(p.total) as Cantidad_Media FROM pedido p;

-- 25. Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
SELECT COUNT(p.id_comercial) as Cuenta_personas FROM pedido p right JOIN comercial c on p.id_comercial=c.id;--mal

-- 26. Calcula el número total de clientes que aparecen en la tabla cliente.
SELECT count(*) as Cantidad_Clientes from cliente c;

-- 27. Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
SELECT MAX(total) as Maxima_Cantidad from pedido p;

-- 28. Calcula cuál es la menor cantidad que aparece en la tabla pedido.
SELECT min(total) as Minima_Cantidad from pedido p;

-- 29. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
SELECT max(categoria) as Maxima_categoria from cliente;

-- 30. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes.
--  Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. 
-- Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. 
-- Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
select c.id,c.nombre,c.apellido1,c.apellido2,p.fecha,max(p.total) as MAX_Total from pedido p INNER JOIN cliente c on p.id_cliente=c.id
GROUP BY c.id asc,p.fecha asc;

-- 31. Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, 
-- teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
select c.id,c.nombre,c.apellido1,c.apellido2,p.fecha,max(p.total) as MAX_Total from pedido p INNER JOIN cliente c on p.id_cliente=c.id
GROUP BY c.id asc,p.fecha asc
HAVING MAX_Total>2000;

-- 32. Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17.
--  Muestra el identificador del comercial, nombre, apellidos y total.
select c.id,c.nombre,c.apellido1,c.apellido2,p.fecha,max(p.total) as MAX_Total from pedido p INNER JOIN comercial c on p.id_comercial=c.id
GROUP BY c.id asc,p.fecha asc
HAVING p.fecha='2016-08-17';

-- 33. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha 
-- realizado cada uno de clientes. Ten en cuenta que pueden existir clientes que no han realizado ningún pedido. 
-- Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
SELECT c.id, c.nombre, c.apellido1, c.apellido2, COUNT(p.id) as numPedidos AS total_pedidos
FROM cliente c
LEFT JOIN pedido p ON c.id = p.id_cliente
GROUP BY c.id, c.nombre, c.apellido1, c.apellido2;

-- 34. Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que 
-- ha realizado cada uno de clientes durante el año 2017.
SELECT c.id, c.nombre, c.apellido1, c.apellido2, COUNT(p.id) as numPedidos,p.fecha AS total_pedidos
FROM cliente c
LEFT JOIN pedido p ON c.id = p.id_cliente
where YEAR(p.fecha)=2017
GROUP BY c.id, c.nombre, c.apellido1, c.apellido2;

-- 35. Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la 
-- máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes 
-- que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0. Puede hacer 
-- uso de la función IFNULL (investiga).
SELECT c.id, c.nombre, c.apellido1, c.apellido2, IFNULL(MAX(p.total), 0) as maxCantidad,IFNULL(p.fecha, 0) AS total_pedidos
FROM cliente c
LEFT JOIN pedido p ON c.id = p.id_cliente
GROUP BY c.id, c.nombre, c.apellido1, c.apellido2;

-- 36. Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
SELECT p.fecha,MAX(p.total) AS total_pedidos
FROM cliente c
LEFT JOIN pedido p ON c.id = p.id_cliente
GROUP BY year(p.fecha);

-- 37. Devuelve el número total de pedidos que se han realizado cada año.
SELECT p.fecha,count(p.id) AS total_pedidos
FROM cliente c
LEFT JOIN pedido p ON c.id = p.id_cliente
GROUP BY year(p.fecha);