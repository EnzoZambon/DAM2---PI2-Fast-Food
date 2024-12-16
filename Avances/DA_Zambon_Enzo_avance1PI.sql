-----------------------------------------------------------------------------------------------------------------
--------------------------CREACIÓN Y SELECCIÓN DE LA BASE DE DATOS A UTILIZAR------------------------------------
-----------------------------------------------------------------------------------------------------------------
CREATE DATABASE Fast_Food_DB
USE Fast_Food_DB

-----------------------------------------------------------------------------------------------------------------
--CREACION DE LAS TABLAS A UTILIZAR, CON SUS RESPECTIVAS COLUMNAS Y RELACIONES (A PARTIR DE LAS CLAVES FORÁNEAS)--
-----------------------------------------------------------------------------------------------------------------


-- Crear Tabla Categorias:
CREATE TABLE Categorias(
	Id_categoria INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	Categoria VARCHAR (100));

-----------------------------------------------------------------------------------------------------------------

-- Crear Tabla sobre los Productos:
CREATE TABLE Productos (
	Id_producto INT IDENTITY (1,1) NOT NULL PRIMARY KEY, 
	Producto VARCHAR (100),
	Id_categoria INT FOREIGN KEY (Id_categoria) REFERENCES Categorias (Id_categoria),
	Precio DECIMAL);

-----------------------------------------------------------------------------------------------------------------

-- Crear Tabla sobre las Sucursales:
CREATE TABLE Sucursales (
	Id_sucursal INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	Sucursal VARCHAR (100),
	Direccion VARCHAR (200));

-----------------------------------------------------------------------------------------------------------------

-- Crear Tabla sobre los Empleados:
CREATE TABLE Empleados(
	Id_empleado INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	Nombre_empleado VARCHAR (100),
	Posicion VARCHAR (50),
	Departamento VARCHAR (50),
	Id_sucursal INT FOREIGN KEY (Id_sucursal) REFERENCES Sucursales (Id_sucursal),
	Rol VARCHAR (50),);

-----------------------------------------------------------------------------------------------------------------

-- Crear Tabla sobre los Clientes:
CREATE TABLE Clientes(
	Id_cliente INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	Nombre_cliente VARCHAR (100),
	Direccion VARCHAR (100));

-----------------------------------------------------------------------------------------------------------------

-- Crear Tabla de Origenes del Pedido:
CREATE TABLE Origenes(
	Id_origen INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	Origen VARCHAR (50));

-----------------------------------------------------------------------------------------------------------------

-- Crear Tabla de Tipos de Pago:
CREATE TABLE Tipos_Pago(
	Id_pago INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	Descripcion VARCHAR (50));

-----------------------------------------------------------------------------------------------------------------

-- Crear Tabla de Mensajeros:
CREATE TABLE Mensajeros(
	Id_mensajero INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	Nombre_mensajero VARCHAR (100),
	EsExterno BIT NOT NULL); --1 si es externo , 0 si es empleado

-----------------------------------------------------------------------------------------------------------------

-- Crear Tabla de Ordenes de Pedido:
CREATE TABLE Ordenes(
	Id_orden INT IDENTITY (1,1) PRIMARY KEY,
	Id_cliente INT FOREIGN KEY (Id_cliente) REFERENCES Clientes (Id_cliente),
	Id_empleado INT FOREIGN KEY (Id_empleado) REFERENCES Empleados (Id_empleado),
	Id_sucursal INT FOREIGN KEY (Id_sucursal) REFERENCES Sucursales (Id_sucursal),
	Id_mensajero INT FOREIGN KEY (Id_mensajero) REFERENCES Mensajeros (Id_mensajero),
	Id_origen INT FOREIGN KEY (Id_origen) REFERENCES Origenes (Id_origen),
	Id_pago INT FOREIGN KEY (Id_pago) REFERENCES Tipos_Pago (Id_pago),
	Horario_venta VARCHAR (20),
	Total_compra DECIMAL (10,2),
	Kms_recorrer DECIMAL (10,2),
	Fecha_despacho DATETIME,
	Fecha_entrega DATETIME,
	Fecha_orden_tomada DATETIME,
	Fecha_orden_lista DATETIME);

-----------------------------------------------------------------------------------------------------------------

-- Crear Tabla Detalle de las Ordenes:
CREATE TABLE Detalle_Ordenes(
	Id_detalle INT IDENTITY (1,1) NOT NULL PRIMARY KEY,
	Id_orden INT FOREIGN KEY (Id_orden) REFERENCES Ordenes (Id_orden),
	Id_producto INT FOREIGN KEY (Id_producto) REFERENCES Productos (Id_producto),
	Cantidad INT NOT NULL,
	Precio DECIMAL (10,2) NOT NULL);
	
