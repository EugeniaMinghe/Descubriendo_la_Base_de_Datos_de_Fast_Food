--USO DE LA BASE DE DATOS CORRECTA
USE [FastFoodDB];

--1.Listar todos los productos y sus categorías
--Pregunta: ¿Cómo puedo obtener una lista de todos los productos junto con sus categorías?
SELECT
	P.Nombre AS NombreProducto, C.Nombre AS NombreCategoria
	FROM [dbo].[Productos] P
	INNER JOIN [dbo].[Categorias] C ON P.CategoriaID=C.CategoriaID
;

--2.Obtener empleados y su sucursal asignada
--Pregunta: ¿Cómo puedo saber a qué sucursal está asignado cada empleado?
SELECT
	E.Nombre AS NombreEmpleado,E.Posicion, E.Departamento, S.Nombre AS NombreSucursal
	FROM [dbo].[Empleados] E
	INNER JOIN [dbo].[Sucursales] S ON E.SucursalID=S.SucursalID
;

--En caso que desee ver las sucursales sin empleados asignados, ya que todos los empleados de la base de datos estás asociados a una única sucursal
SELECT
	E.Nombre AS NombreEmpleado, E.Posicion, E.Departamento, S.Nombre AS NombreSucursal
	FROM [dbo].[Empleados] E
	RIGHT JOIN [dbo].[Sucursales] S ON E.SucursalID=S.SucursalID
;

--3.Identificar productos sin categoría asignada
--Pregunta: ¿Existen productos que no tienen una categoría asignada?
SELECT
	P.Nombre AS NombreProducto, C.Nombre AS NombreCategoria
	FROM [dbo].[Productos] P
	LEFT JOIN [dbo].[Categorias] C ON P.CategoriaID=C.CategoriaID
;

--HAY CATEGORÍAS QUE NO TIENEN PRODUCTOS ASIGNADOS
SELECT
	P.Nombre AS NombreProducto, C.Nombre AS NombreCategoria
	FROM [dbo].[Productos] P
	RIGHT JOIN [dbo].[Categorias] C ON P.CategoriaID=C.CategoriaID
;

--4.Detalle completo de órdenes
/*Pregunta: ¿Cómo puedo obtener un detalle completo de las órdenes, incluyendo el Nombre del cliente, 
Nombre del empleado que tomó la orden, y Nombre del mensajero que la entregó?*/

SELECT 
	O.OrdenID, O.TotalCompra, O.FechaOrdenTomada, O.HorarioVenta,
	C.Nombre AS NombreCliente, 
	E.Nombre AS NombreEmpelado,
	E.Posicion AS PosicionEmpleado,
	M.Nombre AS NombreMensajero
FROM [dbo].[Ordenes] O
INNER JOIN [dbo].[Clientes] AS C ON C.ClienteID=O.ClienteID
INNER JOIN [dbo].[Empleados] AS E ON E.EmployeeID=O.EmployeeID
INNER JOIN [dbo].[Mensajeros] AS M ON M.MensajeroID=O.MensajeroID
;

--5.Productos vendidos por sucursal
--Pregunta: ¿Cuántos artículos correspondientes a cada Categoría de Productos se han vendido en cada sucursal?

SELECT 
	C.Nombre AS NombreCategoria, 
	S.Nombre AS NombreSucursal,
	SUM(D.Cantidad) AS TotalProductosVendidos
FROM [dbo].[DetalleOrden] D 
	INNER JOIN [dbo].[Ordenes] AS O ON D.OrdenID=O.OrdenID
	INNER JOIN [dbo].[Productos] AS P ON P.ProductoID=D.ProductoID
	INNER JOIN [dbo].[Categorias] AS C ON C.CategoriaID=P.CategoriaID
	INNER JOIN [dbo].[Sucursales] AS S ON S.SucursalID=O.SucursalID
GROUP BY 
	S.Nombre,
	C.Nombre
ORDER BY NombreCategoria, NombreSucursal
;