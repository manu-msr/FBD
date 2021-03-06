CREATE DATABASE Tienda
   WITH OWNER = postgres
      ENCODING = 'UTF8'
      TABLESPACE = pg_default
      CONNECTION LIMIT = -1;

CREATE TABLE Empleado(
   no_empleado INTEGER NOT NULL,
   contrasenia VARCHAR(30) NOT NULL,
   rfc VARCHAR(13) NOT NULL,
   nombre VARCHAR(255) NOT NULL,
   calle VARCHAR(255) NOT NULL,
   numero INTEGER NOT NULL,
   colonia VARCHAR(255) NOT NULL,
   seccion VARCHAR(3),
   PRIMARY KEY(no_empleado),
   CHECK (seccion IN ('LIB', 'DSC')));

CREATE TABLE Seccion(
	seccion VARCHAR(3),
	sueldo FLOAT,
	PRIMARY KEY(seccion),
	CHECK (seccion IN ('LIB', 'DSC')),
	CHECK(sueldo>=0));

CREATE TABLE Administrador (
   no_administrador INTEGER NOT NULL,
   contrasenia   VARCHAR(30) NOT NULL,
   PRIMARY KEY(no_administrador));

CREATE TABLE Articulo(
   clave INTEGER NOT NULL,
   precio FLOAT,
   cantidad_articulo INTEGER,
   PRIMARY KEY(clave),
   CHECK(precio>=0.0),
   CHECK(cantidad_articulo>=0));

CREATE TABLE Clave_Libro(
   clave INTEGER NOT NULL,
   titulo VARCHAR(255) NOT NULL,
   PRIMARY KEY (clave));

CREATE TABLE Libro(
   titulo VARCHAR(255) NOT NULL,
   editorial  VARCHAR(255) NOT NULL,
   autor VARCHAR(255) NOT NULL,
   pais VARCHAR(255) NOT NULL,
   anio INTEGER NOT NULL,
   tema VARCHAR(255) NOT NULL,
   PRIMARY KEY (titulo));

CREATE TABLE Clave_Disco(
   clave INTEGER NOT NULL,
   nombre_disco VARCHAR(255) NOT NULL,
   PRIMARY KEY (clave));

CREATE TABLE Disco(
   nombre_disco VARCHAR(255) NOT NULL,
   anio INTEGER NOT NULL,
   PRIMARY KEY (nombre_disco));

CREATE TABLE Clave_Musica(
   clave INTEGER NOT NULL,
   interprete   VARCHAR(255) NOT NULL,
   pistas INTEGER,
   PRIMARY KEY (clave),
   CHECK(pistas>=0));

CREATE TABLE Musica(
   interprete   VARCHAR(255) NOT NULL,
   genero VARCHAR(255) NOT NULL,
   PRIMARY KEY (interprete));

CREATE TABLE DVD(
   clave INTEGER NOT NULL,
   formato VARCHAR(20),
   genero VARCHAR(255) NOT NULL,
   PRIMARY KEY (clave),
   CHECK(formato IN ('DVD', 'BRY')));

CREATE TABLE Videojuego(
   clave INTEGER NOT NULL,
   tipo  VARCHAR(255) NOT NULL,
   consola VARCHAR(255),
   PRIMARY KEY (clave),
   CHECK(consola IN ('NTO', 'PS3', 'XBX', 'CMP')));

CREATE TABLE Venta(
   ID_venta  INTEGER NOT NULL,
   total   FLOAT,
   fecha  DATE NOT NULL,
   PRIMARY KEY(ID_venta),
   CHECK(total>=0.0));

CREATE TABLE Empleado_Administrador (
   no_empleado INTEGER,
   no_administrador INTEGER NOT NULL,
   FOREIGN KEY(no_empleado) REFERENCES Empleado(no_empleado),
   FOREIGN KEY(no_administrador) REFERENCES Administrador(no_administrador),
   PRIMARY KEY(no_empleado));

CREATE TABLE Venta_Empleado (
   ID_venta  INTEGER,
   no_empleado INTEGER,
   FOREIGN KEY(ID_venta) REFERENCES Venta(ID_venta),
   FOREIGN KEY(no_empleado) REFERENCES Empleado(no_empleado),
   PRIMARY KEY(ID_venta));

CREATE TABLE Articulo_Administrador(
   clave INTEGER,
   no_administrador INTEGER,
   FOREIGN KEY (no_administrador) REFERENCES Administrador(no_administrador),
   FOREIGN KEY (clave) REFERENCES Articulo(clave),
   PRIMARY KEY(clave));

CREATE TABLE Venta_Administrador (
   no_administrador  INTEGER,
   ID_venta INTEGER,
   FOREIGN KEY(ID_venta) REFERENCES Venta(ID_venta),
   FOREIGN KEY(no_administrador) REFERENCES Administrador(no_administrador),
   PRIMARY KEY(ID_venta));

CREATE TABLE Venta_Articulo (
   ID_venta INTEGER,
   clave INTEGER,
   cantidad INTEGER,
   FOREIGN KEY(ID_venta) REFERENCES Venta(ID_venta),
   FOREIGN KEY(clave) REFERENCES Articulo(clave),
   PRIMARY KEY(clave),
   CHECK(cantidad>0));