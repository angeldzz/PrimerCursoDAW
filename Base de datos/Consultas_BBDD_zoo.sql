-- 1. Selecciona todos los animales de la tabla animal
SELECT * FROM animal;

-- 2. Selecciona todos los animales de la tabla animal que sean menores de 3 años
SELECT * FROM animal WHERE edad_animal < 3;

-- 3. Selecciona los datos del animal "Cocodrilo"
SELECT * FROM animal WHERE nombre_animal = 'Cocodrilo';

-- 4. Busca en la tabla horario si existe horario de comida a las 13:00:00
SELECT * FROM horario WHERE horario_comida = '13:00:00';

-- 5. Selecciona todos los animales que tengan de genero "macho"
SELECT * FROM animal WHERE sexo_animal = 'macho';

-- 6. Selecciona todos los animales que tengan de genero "hembra" y una edad entre 1 a 3 años
SELECT * FROM animal WHERE sexo_animal = 'hembra' AND edad_animal BETWEEN 1 AND 3;

-- 7. Muestra la cantidad de animales hembra que haya en la tabla animales
SELECT COUNT(*) FROM animal WHERE sexo_animal = 'hembra';

-- 8. Muestra cuantos animales tiene cada empleado a su cargo
SELECT e.nombre_empleado, COUNT(a.id_animal) AS num_animales
FROM animal a
INNER JOIN empleado e ON a.id_empleado = e.id_empleado
GROUP BY e.nombre_empleado;

-- 9. Cuenta y agrupa el numero de animales que su última comida del dia sea a las 18:00
SELECT h.horario_cena, COUNT(a.id_animal) AS num_animales
FROM animal a
INNER JOIN horario h ON a.id_horario = h.id_horario
WHERE h.horario_cena = '18:00:00'
GROUP BY h.horario_cena;

-- 10. Genera una consulta que permita ver que animales cuida el empleado "Pedro López"
-- usando la funcion INNER JOIN
SELECT * from animal a INNER JOIN empleado e on a.id_empleado=e.id_empleado 
WHERE e.nombre_empleado="Pedro López";

-- 11. Selecciona de todos los animales unicamente los sean de especie "Elefante"
SELECT * FROM animal
WHERE id_especie IN (SELECT id_especie FROM especie WHERE nombre_especie = 'Elefante');

-- 12. Selecciona los animales que esten en el recinto "Savannah"
SELECT * FROM animal
WHERE id_recinto IN (SELECT id_recinto FROM recinto WHERE nombre_recinto = 'Savannah');

-- 13. Selecciona los empleados que estan a cargo de el animal "Oso" ten en cuenta que puede estar 
-- en minuscula o mayuscula
SELECT * FROM empleado e
WHERE e.id_empleado IN (
    SELECT a.id_empleado FROM animal a
    WHERE LOWER(a.nombre_animal) = 'oso'
);

-- 14. Selecciona los animales que sean de la especie "Panda" y tengan como cuidador a "Sofía Díaz"
SELECT * FROM animal a
WHERE a.id_especie IN (SELECT id_especie FROM especie WHERE nombre_especie = 'Panda')
AND a.id_empleado IN (
    SELECT e.id_empleado FROM empleado e
    WHERE e.nombre_empleado = 'Sofía Díaz'
);

-- 15. Usando las subconsultas selecciona de la tabla animal el nombre de animal, la edad, el sexo,
-- nombre de recinto, nombre de empleado a cargo, solo selecciona los animales cuya edad se encuentre
-- entre los 2 y los 5 años, sean hembra y su cuidador a cargo sea "Ana Martínez"
SELECT
    nombre_animal,
    edad_animal,
    sexo_animal,
    (SELECT nombre_recinto FROM recinto WHERE id_recinto = animal.id_recinto) AS nombre_recinto,
    (SELECT nombre_empleado FROM empleado WHERE id_empleado = animal.id_empleado) AS nombre_empleado
FROM
    animal
WHERE
    edad_animal BETWEEN 2 AND 5
    AND sexo_animal = 'hembra'
    AND id_empleado = (SELECT id_empleado FROM empleado WHERE nombre_empleado = 'Ana Martínez');
