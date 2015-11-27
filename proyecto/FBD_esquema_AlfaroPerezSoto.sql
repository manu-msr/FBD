CREATE DATABASE tiendota
   WITH OWNER = postgres
      ENCODING = 'UTF8'
      TABLESPACE = pg_default
      CONNECTION LIMIT = -1;

CREATE TABLE Empleado(
   no_empleado   VARCHAR(4) NOT NULL,
   contrasenia VARCHAR(15) NOT NULL,
   rfc VARCHAR(13) NOT NULL,
   nombre VARCHAR(255) NOT NULL,
   calle VARCHAR(255) NOT NULL,
   numero INTEGER NOT NULL,
   colonia VARCHAR(255) NOT NULL,
   seccion VARCHAR(3),
   PRIMARY KEY(no_empleado),
   CHECK (seccion IN ('LIB', 'DSC')));

CREATE TABLE Selccion(
	seccion VARCHAR(3),
	sueldo INTEGER,
	PRIMARY KEY(seccion),
	CHECK (seccion IN ('LIB', 'DSC')),
	CHECK(sueldo>=0));

CREATE TABLE Administrador (
   nombre_usuario VARCHAR(50) NOT NULL,
   contrasenia   VARCHAR(30) NOT NULL,
   PRIMARY KEY(nombre_usuario));

CREATE TABLE Articulo(
   clave VARCHAR(10) NOT NULL,
   precio FLOAT,
   cantidad INTEGER,
   PRIMARY KEY(clave),
   CHECK(precio>=0.0),
   CHECK(cantidad>=0));

CREATE TABLE Clave_Libro(
   clave VARCHAR(10) NOT NULL,
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
   clave VARCHAR(10) NOT NULL,
   nombre VARCHAR(255) NOT NULL,
   PRIMARY KEY (clave));

CREATE TABLE Disco(
   nombre VARCHAR(255) NOT NULL,
   anio INTEGER NOT NULL,
   PRIMARY KEY (nombre));

CREATE TABLE Clave_Musica(
   clave VARCHAR(10) NOT NULL,
   interprete   VARCHAR(255) NOT NULL,
   pistas INTEGER,
   PRIMARY KEY (clave),
   CHECK(pistas>=0));

CREATE TABLE Musica(
   interprete   VARCHAR(255) NOT NULL,
   genero VARCHAR(255) NOT NULL,
   PRIMARY KEY (interprete));

CREATE TABLE DVD(
   clave VARCHAR(10) NOT NULL,
   formato VARCHAR(20),
   genero VARCHAR(255) NOT NULL,
   PRIMARY KEY (clave),
   CHECK(formato IN ('DVD', 'BRY')));

CREATE TABLE Videojuego(
   clave VARCHAR(10) NOT NULL,
   tipo  VARCHAR(255) NOT NULL,
   consola VARCHAR(255),
   PRIMARY KEY (clave),
   CHECK(consola IN ('NTO', 'PS3', 'XBX', 'CMP')));

CREATE TABLE Venta(
   ID_venta  INTEGER NOT NULL,
   total   INTEGER,
   fecha  DATE NOT NULL,
   PRIMARY KEY(ID_venta),
   CHECK(total>=0));

CREATE TABLE Empleado_Administrador (
   no_empleado VARCHAR(4),
   nombre_usuario VARCHAR(50) NOT NULL,
   FOREIGN KEY(no_empleado) REFERENCES Empleado(no_empleado),
   FOREIGN KEY(nombre_usuario) REFERENCES Administrador(nombre_usuario),
   PRIMARY KEY(nombre_usuario));

CREATE TABLE Venta_Empleado (
   ID_venta  INTEGER,
   no_empleado VARCHAR(4),
   FOREIGN KEY(ID_venta) REFERENCES Venta(ID_venta),
   FOREIGN KEY(no_empleado) REFERENCES Empleado(no_empleado),
   PRIMARY KEY(no_empleado));

CREATE TABLE Articulo_Administrador(
   nombre_usuario VARCHAR(50),
   clave VARCHAR(10),
   FOREIGN KEY (nombre_usuario) REFERENCES Administrador(nombre_usuario),
   FOREIGN KEY (clave) REFERENCES Articulo(clave),
   PRIMARY KEY(nombre_usuario));

CREATE TABLE Venta_Administrador (
   nombre_usuario  VARCHAR(50),
   ID_venta INTEGER,
   FOREIGN KEY(ID_venta) REFERENCES Venta(ID_venta),
   FOREIGN KEY(nombre_usuario) REFERENCES Administrador(nombre_usuario),
   PRIMARY KEY(nombre_usuario));

CREATE TABLE Venta_Articulo (
   ID_venta INTEGER,
   clave VARCHAR(10),
   cantidad INTEGER,
   FOREIGN KEY(ID_venta) REFERENCES Venta(ID_venta),
   FOREIGN KEY(clave) REFERENCES Articulo(clave),
   PRIMARY KEY(ID_venta),
   CHECK(cantidad>0));