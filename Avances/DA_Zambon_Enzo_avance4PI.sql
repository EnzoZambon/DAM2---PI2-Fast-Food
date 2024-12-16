--- AVANCE 4: PREGUNTAS PARA CONSULTAS ---

--1 Listar todos los productos y sus categor�as
--Pregunta: �C�mo puedo obtener una lista de todos los productos junto con sus categor�as?

SELECT v.Producto, a.Categoria as Categoria
FROM Productos v
INNER JOIN Categorias a ON v.Id_categoria = a.Id_categoria


--2 Obtener empleados y su sucursal asignada
--Pregunta: �C�mo puedo saber a qu� sucursal est� asignado cada empleado?

SELECT v.Nombre_empleado, a.Sucursal as Sucursal
FROM Empleados v
INNER JOIN Sucursales a ON v.Id_sucursal = a.Id_sucursal


-- 3 Identificar productos sin categor�a asignada
-- Pregunta: �Existen productos que no tienen una categor�a asignada?

SELECT v.Producto, a.Id_categoria AS Categoria
FROM Productos v
FULL JOIN Categorias a ON v.Id_categoria = a.Id_categoria
-- Respuesta: No existen productos sin categoria, solo existen categor�as sin productos asignados


--4 Detalle completo de �rdenes
-- Pregunta: �C�mo puedo obtener un detalle completo de las �rdenes, incluyendo el Nombre del cliente, Nombre del empleado que tom� la orden, y Nombre del mensajero que la entreg�?

SELECT t1.Id_orden,
t2.Nombre_cliente, t3.Nombre_empleado, t4.Nombre_mensajero,  t1.Horario_venta,t1.Total_compra,
t1.Kms_recorrer, t1.Fecha_despacho, t1.Fecha_entrega, t1.Fecha_orden_lista, t1.Fecha_orden_tomada
FROM Ordenes as t1
JOIN Clientes as t2
	ON t1.Id_cliente = t2.Id_cliente
JOIN Empleados as t3
	ON t1.Id_empleado = t3.Id_empleado
JOIN Mensajeros as t4
	ON t1.Id_mensajero = t4.Id_mensajero


-- 5 Productos vendidos por sucursal
-- Pregunta: �Cu�ntos art�culos correspondientes a cada Categor�a de Productos se han vendido en cada sucursal?

SELECT Sucursales.Sucursal, 
       Categorias.Categoria, 
       SUM (Detalle_Ordenes.Cantidad) AS TotalArticulosVendidos
FROM Detalle_Ordenes
JOIN Productos ON Detalle_Ordenes.Id_producto = Productos.Id_producto
JOIN Categorias ON Productos.Id_categoria = Categorias.Id_categoria
JOIN Ordenes ON Detalle_Ordenes.Id_orden = Ordenes.Id_orden
JOIN Sucursales ON Ordenes.Id_sucursal = Sucursales.Id_sucursal
GROUP BY Sucursales.Sucursal, Categorias.Categoria




---CONSULTAS FINALES---

-- Eficiencia de los mensajeros: 
-- �Cu�l es el tiempo promedio desde el despacho hasta la entrega de los pedidos gestionados por todo el equipo de mensajer�a?

SELECT AVG (DATEDIFF (MINUTE,Fecha_despacho, Fecha_entrega)) as Minutos_promedio
FROM Ordenes


--An�lisis de Ventas por Origen de Orden: 
-- �Qu� canal de ventas genera m�s ingresos?

SELECT a.Origen AS Canal_ventas, SUM(o.Total_compra) AS Ingresos_totales
FROM Ordenes o
JOIN Origenes a ON o.Id_origen = a.Id_origen
GROUP BY a.Origen
ORDER BY Ingresos_totales DESC;

-- Productividad de los Empleados: 
-- �Cu�l es el nivel de ingreso generado por Empleado?

SELECT a.nombre_empleado AS Empleado, SUM(o.Total_compra) AS Ingresos_totales
FROM Ordenes o
JOIN Empleados a ON o.Id_empleado = a.Id_empleado
GROUP BY a.nombre_empleado
ORDER BY Ingresos_totales DESC



--- An�lisis de Demanda por Horario y D�a: 
-- �C�mo var�a la demanda de productos a lo largo del d�a? 
-- NOTA: Esta consulta no puede ser implementada sin una definici�n clara del horario (ma�ana, tarde, noche) en la base de datos existente. 
 -- Asumiremos que HorarioVenta refleja esta informaci�n correctamente. --


SELECT 
    t1.Horario_venta, SUM(t2.Cantidad) as Demanda,
	COUNT(t1.Id_orden) as Cantidad_ordenes
FROM 
    Ordenes as t1
	JOIN Detalle_ordenes as t2
	ON t1.Id_orden = t2.Id_orden
GROUP BY 
    t1.Horario_venta;


-- Comparaci�n de Ventas Mensuales: �Cu�l es la tendencia de los ingresos generados en cada periodo mensual?

SELECT 
    YEAR(Fecha_entrega) AS A�o,
    MONTH(Fecha_entrega) AS Mes,
    SUM(Total_compra) AS Ingresos_mensuales
FROM 
    Ordenes
GROUP BY 
    YEAR(Fecha_entrega), 
    MONTH(Fecha_entrega)
ORDER BY 
    Mes ASC;


-- An�lisis de Fidelidad del Cliente: 
-- �Qu� porcentaje de clientes son recurrentes versus nuevos clientes cada mes? 
-- NOTA: La consulta se enfocar�a en la frecuencia de �rdenes por cliente para inferir la fidelidad.

SELECT Id_cliente, COUNT(Id_orden) as Cantidad
    FROM Ordenes
    GROUP BY Id_cliente;
--- Respuesta: No podemos determinar la frecuencia de los clientes porque todos compraron 1 sola vez


-----EXTRA CREDIT-----
SELECT 
    c.Id_cliente,
    c.nombre_cliente,
    o.Id_orden,
    p.producto,
    d.cantidad,
    o.Fecha_orden_tomada
FROM 
    clientes c
INNER JOIN 
    ordenes o ON c.Id_cliente = o.Id_cliente
INNER JOIN 
    Detalle_Ordenes d ON o.Id_orden = d.Id_orden
INNER JOIN 
    productos p ON d.Id_producto = p.Id_producto
ORDER BY 
    c.nombre_cliente, o.Fecha_orden_tomada;

