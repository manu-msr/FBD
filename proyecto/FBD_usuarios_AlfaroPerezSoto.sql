CREATE USER ehc;
GRANT SELECT, DELETE
ON Musica, DVD, Libro
TO ehc;

CREATE USER atd;
GRANT INSERT, SELECT
ON Administrador, Empleado, Clave_Libro
TO atd;

CREATE USER dor;
GRANT UPDATE, INSERT, DELETE
ON Clave_Musica, Articulo, Clave_Disco
TO dor;