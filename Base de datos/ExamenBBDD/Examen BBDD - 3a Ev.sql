-- ***************************************************************************************************************************************************
-- Nombre y Apellidos: Angel Pinto Diaz.
-- ***************************************************************************************************************************************************

use universidad;

-- ***************************************************************************************************************************************************
-- •	Consultas sobre una tabla:
-- 1.	Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. 
-- El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
SELECT a.apellido1,a.apellido2,a.nombre FROM alumno a ORDER BY a.apellido1, a.apellido2, a.nombre;

-- 2.	Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT a.nombre, a.apellido1, a.apellido2,a.telefono FROM alumno a WHERE telefono IS NULL;

-- 3.	Devuelve el listado de los alumnos que nacieron en 1999 y en 2000.
SELECT a.nombre, a.apellido1, a.apellido2,a.fecha_nacimiento FROM alumno a WHERE YEAR(a.fecha_nacimiento) IN (1999, 2000);

-- 4.	Devuelve el listado de profesores que su N.I.F. tiene algún 4 y termina en K o en L.
SELECT p.nombre, p.apellido1, p.apellido2,p.nif FROM profesor p WHERE p.nif LIKE "%4%" AND (p.nif LIKE "%K" OR p.nif LIKE "%L");

-- 5.	Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su N.I.F.
-- tiene algún 6 o termina en K.
SELECT p.nombre, p.apellido1, p.apellido2,p.telefono,p.nif FROM profesor p WHERE telefono IS NULL AND (p.nif LIKE "%6%" OR p.nif LIKE "%K");

-- 6.	Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que 
-- tiene el identificador 7.
SELECT a.nombre,a.id_grado FROM asignatura a WHERE a.cuatrimestre = 1 AND a.curso = 3 AND a.id_grado = 7;

-- ***************************************************************************************************************************************************
-- •	Consultas multitabla (Composición interna)
-- 7.	Devuelve un listado con todas las asignaturas ofertadas en el “Grado en Ingeniería Informática (Plan 2015)”.
SELECT a.nombre AS Asignatura FROM asignatura a INNER JOIN grado g ON a.id_grado = g.id 
WHERE lower(g.nombre) = "grado en ingeniería informática (plan 2015)";

-- 8.	Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado 
-- debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado 
-- estará ordenado alfabéticamente de menor a mayor por los apellidos y el nombre.
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS NombreDep FROM profesor p 
INNER JOIN departamento d ON p.id_departamento = d.id 
ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

-- 9.	Devuelve un listado con los datos de todas las alumnas que se han matriculado alguna vez en el “Grado en 
-- Ingeniería Informática (Plan 2015)”.
SELECT a.*,g.nombre FROM alumno a 
INNER JOIN alumno_se_matricula_asignatura am ON a.id = am.id_alumno 
INNER JOIN asignatura asi ON am.id_asignatura = asi.id 
INNER JOIN grado g ON asi.id_grado = g.id 
WHERE lower(g.nombre) = "grado en ingeniería informática (plan 2015)" AND a.sexo = "M";

-- 10.	Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con N.I.F. 26902806M.
SELECT asi.nombre AS NombreAsignatira, c.anyo_inicio as AñoInicio, c.anyo_fin as AñoFin FROM alumno a 
INNER JOIN alumno_se_matricula_asignatura am ON a.id = am.id_alumno 
INNER JOIN asignatura asi ON am.id_asignatura = asi.id
INNER JOIN curso_escolar c ON am.id_curso_escolar = c.id WHERE a.nif = '26902806M';

-- 11.	Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en 
-- el “Grado en Ingeniería Informática (Plan 2015)”.
SELECT DISTINCT d.nombre AS Departamento FROM departamento d 
INNER JOIN profesor p ON  p.id_departamento = d.id 
INNER JOIN asignatura asi ON p.id = asi.id_profesor 
INNER JOIN grado g ON asi.id_grado = g.id WHERE lower(g.nombre) = "grado en ingeniería informática (plan 2015)";

-- 12.	Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.
SELECT a.*,c.anyo_inicio as AñoInicio,c.anyo_fin as AñoFin FROM alumno a 
INNER JOIN alumno_se_matricula_asignatura am ON a.id = am.id_alumno 
INNER JOIN curso_escolar c ON am.id_curso_escolar = c.id 
WHERE YEAR(c.anyo_inicio) = 2018 AND YEAR(c.anyo_fin) = 2019;

-- ***************************************************************************************************************************************************
-- •	Consultas multitabla (Composición externa)
-- 13.	Devuelve un listado con los nombres de todos los profesores y los departamentos que tienen vinculados. 
-- El listado también debe mostrar aquellos profesores que no tienen ningún departamento asociado. 
-- El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor.
-- El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y el nombre.
SELECT d.nombre as Ndep, p.apellido1, p.apellido2, p.nombre FROM profesor p 
RIGHT JOIN departamento d ON d.id=p.id_departamento 
ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre;

-- 14.	Devuelve un listado con los profesores que no están asociados a un departamento.
SELECT p.* FROM profesor p 
LEFT JOIN departamento d ON p.id_departamento=d.id WHERE p.id_departamento is null;

-- 15.	Devuelve un listado con los departamentos que no tienen profesores asociados.
SELECT d.*,p.id as IdProfesor FROM profesor p 
RIGHT JOIN departamento d ON p.id_departamento=d.id WHERE p.id_departamento is null;

-- 16.	Devuelve un listado con los profesores que no imparten ninguna asignatura.
SELECT p.nombre, p.apellido1, p.apellido2,asi.nombre FROM profesor p
LEFT JOIN asignatura asi ON p.id = asi.id_profesor 
WHERE asi.id_profesor IS NULL;

-- 17.	Devuelve un listado con las asignaturas que no tienen un profesor asignado.
SELECT asi.* FROM asignatura asi
 LEFT JOIN profesor p ON asi.id_profesor = p.id WHERE p.id IS NULL;

-- 18.	Devuelve un listado con todos los departamentos que tienen alguna asignatura que no se haya impartido en ningún curso escolar.
-- El resultado debe mostrar el nombre del departamento y el nombre de la asignatura que no se haya impartido nunca.
SELECT d.nombre AS NombreDep, asi.nombre AS NombreAsig FROM departamento d 
INNER JOIN profesor p ON d.id = p.id_departamento
INNER JOIN asignatura asi ON p.id = asi.id_profesor 
LEFT JOIN alumno_se_matricula_asignatura am ON asi.id = am.id_asignatura 
WHERE am.id_asignatura IS NULL;

-- 19.	Devuelve el NIF y el nombre y los dos apellidos (en una sola columna) de todos los profesores y de todos los alumnos, 
-- y en otra columna si se trata de un profesor o un alumno.
(SELECT "profesor" AS Alumno_Profesor,p.nif, CONCAT(p.nombre, ' ', p.apellido1, ' ', p.apellido2) as Nombre FROM profesor p)
UNION 
(SELECT "alumno" AS Alumno_Profesor,a.nif, CONCAT(a.nombre, ' ', a.apellido1, ' ', a.apellido2) as Nombre FROM alumno a);

-- 20.	Devuelve el NIF y el nombre y los dos apellidos (en una sola columna) de todos los profesores que no impartan ninguna 
-- asignatura y de todos los alumnos que estén matriculados en alguna asignatura, y en otra columna si se trata de un profesor o un alumno.
(SELECT "Profesor" AS Alumno_Profesor, p.nif, CONCAT(p.nombre, " ", p.apellido1," ", p.apellido2) AS NombreCompleto FROM profesor p 
LEFT JOIN asignatura asi ON p.id = asi.id_profesor WHERE asi.id_profesor IS NULL)
UNION  
(SELECT  "Alumno" AS Alumno_Profesor, a.nif, CONCAT(a.nombre, " ", a.apellido1, " ", a.apellido2) AS NombreCompleto FROM alumno a 
INNER JOIN alumno_se_matricula_asignatura am ON a.id = am.id_alumno);

-- ***************************************************************************************************************************************************
-- •	Consultas resumen
-- 21.	Devuelve el número total de alumnas que hay.
SELECT COUNT(a.id) as NumeroAlumnas FROM alumno a 
WHERE a.sexo like "M";

-- 22.	Calcula cuántos alumnos nacieron en 1999.
SELECT COUNT(a.id) as NumeroAlumnos FROM alumno a 
WHERE YEAR(a.fecha_nacimiento)=1999;

-- 23.	Calcula cuántos profesores hay en cada departamento. El resultado sólo debe mostrar dos columnas, una con el 
-- nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe 
-- incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.
SELECT d.nombre AS Departamento, COUNT(p.id) as Profesores FROM departamento d 
INNER JOIN profesor p ON d.id = p.id_departamento 
GROUP BY d.nombre 
HAVING COUNT(p.id) > 0 
ORDER BY COUNT(p.id) DESC;

-- 24.	Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. 
-- Ten en cuenta que pueden existir departamentos que no tienen profesores asociados. Estos departamentos también 
-- tienen que aparecer en el listado.
SELECT d.nombre AS Departamento, COUNT(p.id) AS Profesores FROM departamento d 
LEFT JOIN profesor p ON d.id = p.id_departamento 
GROUP BY d.nombre 
ORDER BY COUNT(p.id) DESC;

-- 25.	Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno.
-- Ten en cuenta que pueden existir grados que no tienen asignaturas asociadas. Estos grados también tienen que aparecer en el listado. 
-- El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.
SELECT g.nombre AS Grado, COUNT(asi.id) AS Asignaturas FROM grado g 
LEFT JOIN asignatura asi ON g.id = asi.id_grado GROUP BY g.nombre ORDER BY COUNT(asi.id) DESC;

-- 26.	Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno,
-- de los grados que tengan más de 40 asignaturas asociadas.
SELECT g.nombre, COUNT(asi.id) AS CantAsignaturas FROM grado g 
LEFT JOIN asignatura asi ON g.id = asi.id_grado GROUP BY g.nombre 
HAVING COUNT(asi.id) > 40 ORDER BY CantAsignaturas DESC;

-- 27.	Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos que hay para cada tipo de asignatura.
-- El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que hay 
-- de ese tipo. Ordene el resultado de mayor a menor por el número total de créditos.
SELECT g.nombre AS Grado, asi.tipo AS AsignaturaT, SUM(asi.creditos)  
FROM grado g 
INNER JOIN asignatura asi ON asi.id_grado = g.id 
GROUP BY g.nombre, asi.tipo ORDER BY SUM(asi.creditos) DESC;

-- 28.	Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares.
-- El resultado deberá mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.
SELECT c.anyo_inicio AS AñoInicio, COUNT(DISTINCT am.id_alumno) AS Alumnos FROM curso_escolar c
INNER JOIN alumno_se_matricula_asignatura am ON c.id = am.id_curso_escolar 
GROUP BY c.anyo_inicio ORDER BY c.anyo_inicio ASC;

-- 29.	Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta aquellos 
-- profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo 
-- apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.
SELECT p.*, COUNT(asi.id) AS AsignaturasImpartidas FROM profesor p 
LEFT JOIN asignatura asi ON p.id = asi.id_profesor GROUP BY p.id, p.nombre, p.apellido1, p.apellido2 
ORDER BY AsignaturasImpartidas DESC;

-- ***************************************************************************************************************************************************
-- •	Subconsultas
-- 30.	Devuelve todos los datos del alumno más joven.
SELECT alumno.* FROM alumno 
WHERE alumno.fecha_nacimiento=(SELECT MAX(alumno.fecha_nacimiento) FROM alumno);

-- 31.	Devuelve un listado con los profesores que no están asociados a un departamento.
SELECT profesor.* FROM profesor 
WHERE profesor.id_departamento=(SELECT departamento.id FROM departamento WHERE profesor.id_departamento=departamento.id);

-- 32.	Devuelve un listado con los departamentos que no tienen profesores asociados. Ten en cuenta que si existe algún
-- id_departamento como NULL la consulta puede no funcionar, deberás gestionarlo.
SELECT * FROM departamento d WHERE NOT EXISTS (SELECT 1 FROM profesor p WHERE p.id_departamento = d.id);

-- 33.	Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.
SELECT profesor.*,(SELECT asignatura.nombre FROM asignatura WHERE profesor.id=asignatura.id_profesor) FROM profesor 
WHERE (profesor.id_departamento=(SELECT departamento.id FROM departamento WHERE departamento.id=profesor.id_departamento)) 
AND (profesor.id not in(SELECT asignatura.id_profesor FROM asignatura WHERE asignatura.id_profesor=profesor.id));

-- 34.	Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.
SELECT d.nombre FROM departamento d WHERE NOT EXISTS (SELECT 1 FROM profesor p WHERE p.id_departamento = d.id);

-- 35.	Devuelve el nombre de los departamentos que tengan asignaturas de 3 créditos en las que haya matriculada alguna mujer.
SELECT DISTINCT departamento.nombre FROM departamento WHERE departamento.id 
				in(SELECT profesor.id_departamento FROM profesor WHERE profesor.id 
                   in(SELECT asignatura.id_profesor FROM asignatura WHERE asignatura.creditos=3 AND asignatura.id
                      in(SELECT alumno_se_matricula_asignatura.id_asignatura FROM alumno_se_matricula_asignatura WHERE alumno_se_matricula_asignatura.id_alumno
                        in(SELECT alumno.id FROM alumno WHERE alumno.sexo like "M"))));
