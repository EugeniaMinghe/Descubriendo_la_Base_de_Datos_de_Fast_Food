-- Crear la base de datos
CREATE DATABASE FastFoodDB
ON
(
NAME="FastFoodDB_Data", 
FILENAME= "C:\SQL_DB\FastFoodDB_Data.mdf",
SIZE=50MB, 
MAXSIZE= 1GB, 
FILEGROWTH= 5MB
)
--Crear la base de registro
LOG ON 
(
NAME="Carrera_DB_Log", 
FILENAME= "C:\SQL_DB\FastFoodDB_Data.ldf",
SIZE=25MB, 
MAXSIZE= 256MG, 
FILEGROWTH= 5MB
)
; 
-- Comando de uso de la base de datos creada
USE FastFoodDB;

--Crear la tabla Categorías
CREATE TABLE Categorias (
CategoriaID INT PRIMARY KEY IDENTITY (1,1), 
Nombre VARCHAR (150) NOT NULL 
);

-- Crear la tabla Productos
CREATE TABLE Productos (
    ProductoID INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR (150) NOT NULL, 
    CategoriaID INT,
	Precio DECIMAL (10,2) NOT NULL, 
	FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);

-- Crear la tabla Sucursal
CREATE TABLE Sucursales (
	SucursalID INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR (150) NOT NULL, 
	Direccion VARCHAR (150) NOT NULL
);

-- Crear la tabla Empleados
CREATE TABLE Empleados (
    EmployeeID INT PRIMARY KEY IDENTITY (1,1),
    Nombre VARCHAR(150) NOT NULL,
	Posicion VARCHAR(150) NOT NULL,
	Departamento VARCHAR(150),
    SucursalID INT, 
	Rol VARCHAR(150) NOT NULL,
	FOREIGN KEY (SucursalID) REFERENCES Sucursales(SucursalID)
);

-- Crear la tabla Clientes
CREATE TABLE Clientes (
	ClienteID INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR(150) NOT NULL,
	Direccion VARCHAR(150)
);

-- Crear la tabla Origen Orden
CREATE TABLE OrigenOrden (
	 OrigenID INT PRIMARY KEY IDENTITY (1,1),
	 Descripcion VARCHAR (150) NOT NULL
);

-- Crear la tabla Tipos de Pago
CREATE TABLE TiposPago (
	TipoPagoID INT PRIMARY KEY IDENTITY (1,1),
	Descripcion VARCHAR (150) NOT NULL
);

-- Crear la tabla Mensajeros
CREATE TABLE Mensajeros (
	MensajeroID INT PRIMARY KEY IDENTITY (1,1),
	Nombre VARCHAR (150) NOT NULL, 
	EsExterno BIT NOT NULL
);

-- Crear la tabla Ordenes
CREATE TABLE Ordenes (
    OrdenID INT PRIMARY KEY IDENTITY (1,1),
    ClienteID INT,
	EmployeeID INT, 
	SucursalID INT,
	MensajeroID INT,
	TipoPagoID INT,
	OrigenID INT,
	HorarioVenta VARCHAR (150) NOT NULL, 
	TotalCompra DECIMAL (10,2) NOT NULL,
	KilometrosRecorrer DECIMAL (10,2), 
	FechaDEspacho DATETIME, 
	FechaEntrega DATETIME, 
	FechaOrdenTomada DATETIME, 
	FechaOrdenLista DATETIME,
	FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
	FOREIGN KEY (EmployeeID) REFERENCES Empleados(EmployeeID),
	FOREIGN KEY (SucursalID) REFERENCES Sucursales(SucursalID),
	FOREIGN KEY (MensajeroID) REFERENCES Mensajeros(MensajeroID),
	FOREIGN KEY (TipoPagoID) REFERENCES TiposPago(TipoPagoID),
	FOREIGN KEY (OrigenID) REFERENCES OrigenOrden(OrigenID)
);
-- Crear la tabla Detalle de Ordenes
CREATE TABLE DetalleOrden (
	OrdenID INT, 
	ProductoID INT, 
	Cantidad INT, 
	Precio DECIMAL (10,2), 
	PRIMARY KEY (OrdenID,ProductoID), 
	FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID),
	FOREIGN KEY (OrdenID) REFERENCES Ordenes(OrdenID)
); 
