-- AVANCE 3: CONSULTAS CON PREGUNTAS DE AGREGACIÓN

-- 1. Pregunta: ¿Cuál es el total de ventas (TotalCompra) a nivel global?
Select SUM (Total_compra) As Total_ventas
FROM Ordenes;
-- Respuesta: $9123.51


-- 2. Pregunta: ¿Cuál es el precio promedio de los productos dentro de cada categoría?
SELECT Id_categoria, AVG (Precio) as Promedio
FROM Productos
GROUP BY Id_categoria


-- 3. Pregunta: ¿Cuál es el valor de la orden mínima y máxima por cada sucursal?
SELECT Id_sucursal, MIN (Total_compra) as Importe_orden_minima, MAX (Total_compra) as Importe_orden_maxima
FROM Ordenes
GROUP BY Id_sucursal


-- 4. Pregunta: ¿Cuál es el mayor número de kilómetros recorridos para una entrega?
SELECT Max (Kms_recorrer) as Maximo_Kms
FROM Ordenes


-- 5. Pregunta: ¿Cuál es la cantidad promedio de productos por orden?
SELECT Id_orden, AVG (Cantidad) as Promedio_productos
FROM Detalle_Ordenes
GROUP BY Id_orden


-- 6. ¿Cómo se distribuye la Facturación Total del Negocio de acuerdo a los métodos de pago?
SELECT Id_pago, SUM (Total_compra) as Total_Compra
FROM Ordenes
GROUP BY Id_pago

-- 7. Pregunta: ¿Cuál Sucursal tiene el ingreso promedio más alto?
SELECT TOP (1) Id_sucursal, AVG (Total_compra) as Ingreso_promedio
FROM Ordenes
GROUP BY Id_sucursal

-- 8.  ¿Cuáles son las sucursales que han generado ventas totales por encima de $ 1000?
SELECT Id_sucursal, Total_compra
FROM Ordenes
WHERE Total_compra>1000.00
ORDER BY Total_compra DESC

-- 9.  ¿Cómo se comparan las ventas promedio antes y después del 1 de julio de 2023?

SELECT 'Antes de Julio' as Periodo,
AVG (Total_compra) as Promedio_ventas
FROM Ordenes
WHERE Fecha_entrega < '2023-07-01'
UNION
SELECT 'Despues de Julio' as Periodo,
AVG (Total_compra) as Promedio_ventas
FROM Ordenes
WHERE Fecha_entrega >= '2023-07-01'


 -- 10 ¿Durante qué horario del día (mañana, tarde, noche) se registra la mayor cantidad de ventas, 
 -- cuál es el ingreso promedio de estas ventas, y cuál ha sido el importe máximo alcanzado por una orden en dicha jornada?


WITH VentasPorHorario AS(
    SELECT Horario_venta, 
           COUNT(*) AS CantidadVentas, 
           AVG(Total_compra) AS IngresoPromedio, 
           MAX(Total_compra) AS ImporteMaximo
    FROM Ordenes
    GROUP BY Horario_venta)

SELECT Horario_venta, 
       CantidadVentas, 
       IngresoPromedio, 
       ImporteMaximo
FROM VentasPorHorario
WHERE CantidadVentas = (
    SELECT MAX(CantidadVentas) 
    FROM VentasPorHorario);

-- Debio ser necesario utilizar una consulta temporal (WITH) que permitió definir variables como las cantidades vendidas, el ingreso promedio y el importe maximo
-- y una subsconsulta (WHERE) para seleccionar el maximo de ventas por horario, lo que permitió a la  tabla brindar todas las especificaciones en conjunto
