-- 1

SELECT nombre, id_venta, nombre_disco
FROM Empleado NATURAL JOIN Venta_Empleado NATURAL JOIN Venta_Articulo NATURAL JOIN Clave_Disco NATURAL JOIN Disco
WHERE anio = 2015
GROUP BY nombre, id_venta, nombre_disco
HAVING count(nombre_disco)>1

--2

SELECT nombre, no_empleado
FROM Empleado
WHERE nombre LIKE 'A%'

EXCEPT

SELECT nombre, no_empleado
FROM Empleado NATURAL JOIN Venta_Empleado;

--3

SELECT nombre, id_venta, clave
FROM Empleado NATURAL JOIN Venta_Empleado NATURAL JOIN Venta_Articulo
WHERE nombre LIKE 'E%'
GROUP BY nombre, id_venta, clave
HAVING count(clave)>1