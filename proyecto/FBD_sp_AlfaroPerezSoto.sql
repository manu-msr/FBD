CREATE OR REPLACE FUNCTION sp_insercion_empleado(
	no_empleado VARCHAR(14),
   	contrasenia VARCHAR(15),
   	rfc VARCHAR(13),
   	nombre VARCHAR(255),
   	calle VARCHAR(255),
   	numero INTEGER,
   	colonia VARCHAR(255),
   	seccion VARCHAR(3))

RETURNS VARCHAR(20)
AS
$$
BEGIN
INSERT INTO Empleado(no_empleado, contrasenia, rfc, nombre, calle, numero, colonia, seccion)
VALUES (no_empleado, contrasenia, rfc, nombre, calle, numero, colonia, seccion);

RETURN 'Inserción exitosa.';

END;
$$
LANGUAGE 'plpgsql';


CREATE OR REPLACE FUNCTION sp_update_administrador(
	n_usuario VARCHAR(50),
	contra VARCHAR(30))

RETURNS VARCHAR(20)
AS
$$
BEGIN
UPDATE Administrador
SET contrasenia = contra
WHERE nombre_usuario = n_usuario;

RETURN 'Actualización exitosa.';

END;
$$

LANGUAGE 'plpgsql';