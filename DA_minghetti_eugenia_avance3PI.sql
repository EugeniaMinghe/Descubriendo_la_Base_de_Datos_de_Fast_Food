--USO BASE DE DATOS CORRECTA
USE [FastFoodDB]
;

--CONSULTAS CON DML 
--1. Total de ventas globales
--Pregunta: ¿Cuál es el total de ventas (TotalCompra) a nivel global?

SELECT
	SUM(TotalCompra) AS TotalVentas
FROM  [dbo].[Ordenes]
;

--El total de ventas es 10023.51 

--2.Promedio de precios de productos por categoría
--Pregunta: ¿Cuál es el precio promedio de los productos dentro de cada categoría?

SELECT 
	CategoriaID,
	CAST(AVG([Precio]) AS DECIMAL(10,2)) AS PromedioPrecioProducto
FROM [dbo].[Productos]
GROUP BY CategoriaID
ORDER BY PromedioPrecioProducto
;

--OTRA OPCIÓN PARA QUE APAREZCA EL NOMBRE DE LA CATEGORÍA Y NO EL ID
SELECT 
	C.Nombre, 
	CAST(AVG([Precio]) AS DECIMAL(10,2)) AS PromedioPrecioProducto
FROM [dbo].[Productos] AS P,
	[dbo].[Categorias] AS C
WHERE P.CategoriaID=C.CategoriaID
GROUP BY C.Nombre
ORDER BY PromedioPrecioProducto
;
/*El Precio promedio  por categoría es Helado: 2.99, Postres: 3.49, Ensaladas: 6.49
Comida Rápida: 8.99 y Pizzas: 12.49.*/ 

--3.Orden mínima y máxima por sucursal
--Pregunta: ¿Cuál es el valor de la orden mínima y máxima por cada sucursal?

SELECT 
    SucursalID,
    MIN(TotalCompra) AS ValorOrdenMinima,
    MAX(TotalCompra) AS ValorOrdenMaxima
FROM [dbo].[Ordenes]
GROUP BY SucursalID
;

--OTRA COPCIÓN PARA QUE APAREZCA EL NOMBRE DE LA SUCURSAL Y NO EL ID
SELECT 
	S.Nombre, 
	MIN(TotalCompra) AS ValorOrdenMinima,
    MAX(TotalCompra) AS ValorOrdenMaxima
FROM [dbo].[Ordenes] AS O,
	 [dbo].[Sucursales] AS S
WHERE O.SucursalID=S.SucursalID
GROUP BY S.Nombre
;
/*Mismo valor de mínimo y máximo por sucursal: Sucursal Bosque 900.00, Sucursal Central 1053.51
Sucursal Este 920.00, Sucursal Lago 1095.00, Sucursal Montaña 1065.00, Sucursal Norte 1075.00, 
Sucursal Oeste 930.00, Sucursal Playa 945.00, Sucursal Sur 955.00 y Sucursal Valle 1085.00.*/

--4.Mayor número de kilómetros recorridos para entrega
--Pregunta: ¿Cuál es el mayor número de kilómetros recorridos para una entrega?

SELECT 
	MAX(KilometrosRecorrer) AS MayorKmRecorridos
FROM [dbo].[Ordenes]
;

SELECT 
	TOP 1
	OrdenID,
	KilometrosRecorrer 
FROM [dbo].[Ordenes]
ORDER BY KilometrosRecorrer DESC
;
--El máximo de km recorridos es 15km. 

--5.Promedio de cantidad de productos por orden
--Pregunta: ¿Cuál es la cantidad promedio de productos por orden?

SELECT 
	OrdenID,
	AVG(Cantidad) AS CantidadPromedioProductos
FROM [dbo].[DetalleOrden]
GROUP BY OrdenID
;
/*Sería apropiado insertar más datos para otras órdenes para dar una mejor respuesta a la pregunta (no se hizo).
De esta manera se evitan ambiguedades en la interpretación de la pregunta y la elaboración de la query
El promedio de productos para el OrdenID 1 es 3.*/

--6.Total de ventas por tipo de pago
--Pregunta: ¿Cómo se distribuye la Facturación Total del Negocio de acuerdo a los métodos de pago?

SELECT 
   TP.Descripcion,
    SUM(O.TotalCompra) AS FacturacionTotal
FROM 
	[dbo].[Ordenes] AS O,
	[dbo].[TiposPago] AS TP
WHERE TP.TipoPagoID=O.TipoPagoID
GROUP BY TP.Descripcion
ORDER BY FacturacionTotal DESC
;

--OTRA OPCIÓN PARA CONTEMPLAR TODAS LAS POSIBILIDADES DE REFERIRSE A LA DISTRIBUCIÓN DE LA FACTURACIÓN TOTAL
SELECT 
   TP.Descripcion,
   SUM(O.TotalCompra) AS FacturacionTotal, 
   CAST(AVG(O.TotalCompra) AS DECIMAL (10,2)) AS FacturacionPromedio,
   COUNT(O.TotalCompra) AS FrecuenciaFacturacion
FROM 
	[dbo].[Ordenes] AS O,
	[dbo].[TiposPago] AS TP
WHERE TP.TipoPagoID=O.TipoPagoID
GROUP BY TP.Descripcion
ORDER BY FacturacionTotal DESC
;
/*La Facturación Total del Negocio de acuerdo a los métodos de pago se distribuye 
de la siguiente manera Cupón de Descuento, Vale de comida, Tarjeta de Crédito. Cheque, 
Efectivo, Transferencia Bancaria, Criptomonedas, Paypal, Tarjeta de Débito y Pago Móvil*/

--7.Sucursal con la venta promedio más alta
--Pregunta: ¿Cuál Sucursal tiene el ingreso promedio más alto?

SELECT TOP 1
	SucursalID,
	CAST(AVG(TotalCompra) AS DECIMAL (10,2)) AS IngresoPromedio
FROM [dbo].[Ordenes]
GROUP BY SucursalID
ORDER BY IngresoPromedio DESC
;
--La sucursal con el ingreso promedio más alto es la 9, con 1095.

--8.Sucursal con la mayor cantidad de ventas por encima de un umbral
--Pregunta: ¿Cuáles son las sucursales que han generado ventas totales por encima de $ 1000?

SELECT
	S.Nombre AS NombreSucursal,
	SUM(TotalCompra) AS VentasTotales
FROM [dbo].[Ordenes] AS O,
	[dbo].[Sucursales] AS S
WHERE O.SucursalID=S.SucursalID
GROUP BY S.Nombre
HAVING SUM(TotalCompra)>1000
ORDER BY VentasTotales
;
--Las sucursales con ventas totales mayor a 1000 son Central, Montaña, Norte, Valle y Lago en orden ascendente.

--9.Comparación de ventas promedio antes y después de una fecha específica
--Pregunta: ¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?

SELECT 
	CAST(AVG(TotalCompra) AS DECIMAL (10,2)) AS VentaPromedio_Antes1julio
FROM [dbo].[Ordenes]
WHERE FechaOrdenTomada < '2023-07-01'
;
SELECT 
	CAST(AVG(TotalCompra) AS DECIMAL (10,2)) AS VentaPromedio_Despues1julio
FROM [dbo].[Ordenes]
WHERE FechaOrdenTomada >= '2023-07-01'
;

--SEGUNDA OPCIÓN PARA OBTENER UNA SOLA TABLA CON LOS RESULTADOS
SELECT 
    CASE 
        WHEN FechaOrdenTomada < '2023-07-01' THEN 'Antes del 1 de julio de 2023'
        ELSE 'Después del 1 de julio de 2023'
    END AS periodo,
    CAST(AVG(TotalCompra) AS DECIMAL (10,2)) AS VentaPromedio
FROM [dbo].[Ordenes]
GROUP BY 
    CASE 
        WHEN FechaOrdenTomada < '2023-07-01' THEN 'Antes del 1 de julio de 2023'
        ELSE 'Después del 1 de julio de 2023'
    END;

--Venta promedio antes del 1 julio es de 979.75, mientras que después del 1 de julio es 1036.25

--10.	Análisis de actividad de ventas por horario
/*Pregunta: ¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de ventas, 
cuál es el ingreso promedio de estas ventas, y cuál ha sido el importe máximo alcanzado por una orden en dicha jornada?*/

SELECT 
	TOP 1
    HorarioVenta,
    COUNT(OrdenID) AS CantidadTotalVentas,
    CAST(AVG(TotalCompra) AS DECIMAL (10,2)) AS CompraPromedio,
    MAX(TotalCompra) AS ImporteMaximo
FROM 
    [dbo].[Ordenes]
GROUP BY 
    HorarioVenta
ORDER BY 
    CantidadTotalVentas DESC
;
--El horario con más ventas es la mañana con 4, una compra promedio de 987.13 y un importe máximo de 1065.00.
