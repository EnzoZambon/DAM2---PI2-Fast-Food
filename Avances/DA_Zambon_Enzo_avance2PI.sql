--///////CARGA DE DATOS A LAS TABLAS///////--

-- Insertar datos en Categorias
INSERT INTO Categorias (Categoria) VALUES
('Comida R�pida'), ('Postres'), ('Bebidas'), ('Ensaladas'), ('Desayunos'),
('Cafeter�a'), ('Helados'), ('Comida Vegana'), ('Carnes'), ('Pizzas');


-- Insertar datos en Productos
INSERT INTO Productos (Producto, Id_categoria, Precio) VALUES
('Hamburguesa Deluxe', 1, 9.99), ('Cheeseburger', 1, 7.99), ('Pizza Margarita', 10, 11.99), ('Pizza Pepperoni', 10, 12.99), ('Helado de Chocolate', 7, 2.99),
('Helado de Vainilla', 7, 2.99), ('Ensalada C�sar', 4, 5.99), ('Ensalada Griega', 4, 6.99), ('Pastel de Zanahoria', 2, 3.99), ('Brownie', 2, 2.99);


-- Insertar datos en Sucursales
INSERT INTO Sucursales (Sucursal, Direccion) VALUES
('Sucursal Central', '1234 Main St'), ('Sucursal Norte', '5678 North St'), ('Sucursal Este', '9101 East St'), ('Sucursal Oeste', '1121 West St'), ('Sucursal Sur', '3141 South St'),
('Sucursal Playa', '1516 Beach St'), ('Sucursal Monta�a', '1718 Mountain St'), ('Sucursal Valle', '1920 Valley St'), ('Sucursal Lago', '2122 Lake St'), ('Sucursal Bosque', '2324 Forest St');


-- Insertar datos en Empleados
INSERT INTO Empleados (Nombre_empleado, Posicion, Departamento, Id_sucursal, Rol) VALUES
('John Doe', 'Gerente', 'Administraci�n', 1, 'Vendedor'), ('Jane Smith', 'Subgerente', 'Ventas', 1, 'Vendedor'), ('Bill Jones', 'Cajero', 'Ventas', 1, 'Vendedor'), ('Alice Johnson', 'Cocinero', 'Cocina', 1, 'Vendedor'), ('Tom Brown', 'Barista', 'Cafeter�a', 1, 'Vendedor'),
('Emma Davis', 'Repartidor', 'Log�stica', 1, 'Mensajero'), ('Lucas Miller', 'Atenci�n al Cliente', 'Servicio', 1, 'Vendedor'), ('Olivia Garc�a', 'Encargado de Turno', 'Administraci�n', 1, 'Vendedor'), ('Ethan Martinez', 'Mesero', 'Restaurante', 1, 'Vendedor'), ('Sophia Rodriguez', 'Auxiliar de Limpieza', 'Mantenimiento', 1, 'Vendedor');


-- Insertar datos en Clientes
INSERT INTO Clientes (Nombre_cliente, Direccion) VALUES
('Cliente Uno', '1000 A Street'), ('Cliente Dos', '1001 B Street'), ('Cliente Tres', '1002 C Street'), ('Cliente Cuatro', '1003 D Street'), ('Cliente Cinco', '1004 E Street'),
('Cliente Seis', '1005 F Street'), ('Cliente Siete', '1006 G Street'), ('Cliente Ocho', '1007 H Street'), ('Cliente Nueve', '1008 I Street'), ('Cliente Diez', '1009 J Street');


-- Insertar datos en OrigenesOrden
INSERT INTO Origenes (Origen) VALUES
('En l�nea'), ('Presencial'), ('Tel�fono'), ('Drive Thru'), ('App M�vil'),
('Redes Sociales'), ('Correo Electr�nico'), ('Publicidad'), ('Recomendaci�n'), ('Evento');


-- Insertar datos en TiposPago
INSERT INTO Tipos_Pago (Descripcion) VALUES
('Efectivo'), ('Tarjeta de Cr�dito'), ('Tarjeta de D�bito'), ('PayPal'), ('Transferencia Bancaria'),
('Criptomonedas'), ('Cheque'), ('Vale de Comida'), ('Cup�n de Descuento'), ('Pago M�vil');


-- Insertar datos en Mensajeros
INSERT INTO Mensajeros (Nombre_mensajero, EsExterno) VALUES
('Mensajero Uno', 0), ('Mensajero Dos', 1), ('Mensajero Tres', 0), ('Mensajero Cuatro', 1), ('Mensajero Cinco', 0),
('Mensajero Seis', 1), ('Mensajero Siete', 0), ('Mensajero Ocho', 1), ('Mensajero Nueve', 0), ('Mensajero Diez', 1);


INSERT INTO Ordenes (Id_cliente, Id_empleado, Id_sucursal, Id_mensajero, Id_pago, Id_origen, Horario_venta, Total_compra , Kms_recorrer, Fecha_despacho, Fecha_entrega, Fecha_orden_tomada, Fecha_orden_lista) VALUES
(1, 1, 1, 1, 1, 1, 'Ma�ana', 1053.51, 5.5, '2023-01-10 08:30:00', '2023-01-10 09:00:00', '2023-01-10 08:00:00', '2023-01-10 08:15:00'),
(2, 2, 2, 2, 2, 2, 'Tarde', 1075.00, 10.0, '2023-02-15 14:30:00', '2023-02-15 15:00:00', '2023-02-15 13:30:00', '2023-02-15 14:00:00'),
(3, 3, 3, 3, 3, 3, 'Noche', 920.00, 2.0, '2023-03-20 19:30:00', '2023-03-20 20:00:00', '2023-03-20 19:00:00', '2023-03-20 19:15:00'),
(4, 4, 4, 4, 4, 4, 'Ma�ana', 930.00, 0.5, '2023-04-25 09:30:00', '2023-04-25 10:00:00', '2023-04-25 09:00:00', '2023-04-25 09:15:00'),
(5, 5, 5, 5, 5, 5, 'Tarde', 955.00, 8.0, '2023-05-30 15:30:00', '2023-05-30 16:00:00', '2023-05-30 15:00:00', '2023-05-30 15:15:00'),
(6, 6, 6, 6, 6, 1, 'Noche', 945.00, 12.5, '2023-06-05 20:30:00', '2023-06-05 21:00:00', '2023-06-05 20:00:00', '2023-06-05 20:15:00'),
(7, 7, 7, 7, 7, 2, 'Ma�ana', 1065.00, 7.5, '2023-07-10 08:30:00', '2023-07-10 09:00:00', '2023-07-10 08:00:00', '2023-07-10 08:15:00'),
(8, 8, 8, 8, 8, 3, 'Tarde', 1085.00, 9.5, '2023-08-15 14:30:00', '2023-08-15 15:00:00', '2023-08-15 14:00:00', '2023-08-15 14:15:00'),
(9, 9, 9, 9, 9, 4, 'Noche', 1095.00, 3.0, '2023-09-20 19:30:00', '2023-09-20 20:00:00', '2023-09-20 19:00:00', '2023-09-20 19:15:00'),
(10, 10, 10, 10, 10, 5, 'Ma�ana', 900.00, 15.0, '2023-10-25 09:30:00', '2023-10-25 10:00:00', '2023-10-25 09:00:00', '2023-10-25 09:15:00');


-- Insertar datos en DetalleOrdenes
INSERT INTO Detalle_Ordenes (Id_orden, Id_producto, Cantidad, Precio) VALUES
(1, 1, 3, 23.44),
(1, 2, 5, 45.14),
(1, 3, 4, 46.37),
(1, 4, 4, 42.34),
(1, 5, 1, 18.25),
(1, 6, 4, 20.08),
(1, 7, 2, 13.31),
(1, 8, 2, 20.96),
(1, 9, 4, 30.13),
(1, 10, 3, 38.34);

--///////TRANSFORMACI�N DE LOS DATOS///////--

--UPDATE Y DELETE

--ACTUALIZACIONES DE EJEMPLO (UPDATE)

-- Aumentar el precio de todos los productos en la categor�a 1
UPDATE Productos SET Precio = Precio + 1 WHERE Id_categoria = 1;

-- Cambiar la posici�n de todos los empleados del departamento 'Cocina' a 'Chef'
UPDATE Empleados SET Posicion = 'Chef' WHERE Departamento = 'Cocina';

-- Actualizar la direcci�n de una sucursal espec�fica
UPDATE Sucursales SET Direccion = '1234 New Address St' WHERE Id_Sucursal = 1;

--ELIMINACIONES DE EJEMPLO (DELETE)

/*1. Eliminar una orden espec�fica
Imaginemos que quieres eliminar una orden espec�fica, 
por ejemplo, la orden con OrdenID = 10. 
Esta operaci�n eliminar�a la orden junto con sus detalles asociados 
(deber�as asegurarte de eliminar o actualizar cualquier dato relacionado 
para mantener la integridad referencial).*/

DELETE FROM Detalle_Ordenes WHERE Id_orden = 10;
DELETE FROM Ordenes WHERE Id_orden = 10;


/*2. Eliminar todos los productos de una categor�a espec�fica
Si decides dejar de ofrecer todos los "Postres" 
(supongamos que Categorias.CategoriaID = 2 para "Postres"), 
podr�as querer eliminar todos los productos asociados a esa categor�a.*/

-- Eliminar los detalles de ordenes asociados a los productos de categoria 2
DELETE FROM Detalle_Ordenes 
 WHERE Id_producto IN (
        SELECT Id_Producto
        FROM Productos
        WHERE Id_categoria = 2);


-- Eliminar los productos asociados con la categoria 2
DELETE FROM Productos WHERE Id_categoria = 2;

--Antes de ejecutar este comando, deber�as considerar si hay �rdenes que incluyen estos productos y decidir c�mo manejar esas referencias.


/*3. Eliminar empleados de una sucursal que cerr�
Si una sucursal cierra, por ejemplo, 
SucursalID = 10 (Sucursal Bosque), 
podr�as necesitar eliminar a todos los empleados asociados con esa sucursal.*/

DELETE FROM Empleados WHERE Id_sucursal = 10;
DELETE FROM Ordenes WHERE Id_sucursal = 10;
DELETE FROM Sucursales WHERE Id_sucursal = 10;

--/////PREGUNTAS PARA CONSULTAS///////--

 --1 REGISTROS �NICOS:
 --Pregunta: �Cu�l es la cantidad total de registros �nicos en la tabla de �rdenes?
SELECT COUNT (*) AS Registros_unicos
FROM (SELECT DISTINCT * FROM Ordenes) AS Subconsulta
-- Respuesta: En total los registros �nicos en la tabla �rdenes (Ordenes) son 9


--2 EMPLEADOS POR DEPARTAMENTO:
--Pregunta: �Cu�ntos empleados existen en cada departamento?
SELECT Departamento, COUNT (Id_empleado) as Cantidad_empleados
FROM Empleados
GROUP BY Departamento
--Respuesta: Existen 2 empleados en los departamentos Administraci�n y Ventas y 1 en los dem�s


--3 PRODUCTOS POR CATEGOR�A:
--Pregunta: �Cu�ntos productos hay por c�digo de categor�a?
SELECT Id_categoria, COUNT (Id_categoria) as Cantidad_productos
FROM Productos
GROUP BY Id_categoria
--Respuesta: Hay 2 productos en las categorias 1,4,7 y 10 y en las dem�s no hay


--4 IMPORTACI�N DE CLIENTES:
--Pregunta: �Cu�ntos clientes se han importado a la tabla de clientes?
SELECT COUNT (Id_cliente) as Total_clientes
FROM Clientes
-- Respuesta: Se han importado 10 Clientes


--5 AN�LISIS DE DESEMPE�O DE SUCURSALES:
--Pregunta: �Cu�les son las sucursales con un promedio de Facturaci�n/Ingresos superior a 1000.00 y que minimizan sus costos en base al promedio de kil�metros recorridos de todas de sus entregas gestionadas? Para un mejor relevamiento, ordene el listado por el Promedio Km Recorridos.

-- Interpreto que hay dos formas de resolver la pregunta:

-- Forma 1:
SELECT Id_sucursal, 
       AVG(total_compra) AS Facturacion_promedio, 
       AVG(Kms_recorrer) AS Kms_promedio
FROM Ordenes
GROUP BY Id_sucursal
HAVING AVG(total_compra) > 1000.00
ORDER BY Kms_promedio ASC;
-- Respuesta: Las Sucursales son 9-1-7-8-2

-- Forma 2:
SELECT Id_sucursal, Total_compra, Kms_recorrer
FROM Ordenes
WHERE Kms_recorrer < (SELECT AVG(Kms_recorrer) FROM Ordenes) AND Total_compra > 1000.00
ORDER BY Kms_recorrer ASC;
-- Respuestas: Las sucursales con ese nivel de eficiencia son la 9 (Sucursal Lago) y la 1 (Sucursal Central)





