# Ejercicios SQL - 14/09/2025

Este repositorio contiene ejercicios de base de datos MySQL con consultas SQL, incluyendo creación de tablas, inserción de datos y consultas para análisis de ventas.

---

## 1️⃣ Creación de la base de datos y tablas

```sql
CREATE DATABASE Ejercicios14092025;
USE Ejercicios14092025;

CREATE TABLE Clientes(
    idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE Productos(
    idProducto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2)
);

CREATE TABLE Ventas(
    idVenta INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    idCliente INT,
    idProducto INT,
    cantidad INT,
    fecha DATE,
    FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente),
    FOREIGN KEY (idProducto) REFERENCES Productos(idProducto)
);
2️⃣ Consultas SQL de ejemplo
Total de ventas por producto
sql
SELECT p.idProducto, p.nombre AS Producto, SUM(v.cantidad) AS Total_Vendido
FROM Ventas v
INNER JOIN Productos p ON v.idProducto = p.idProducto
GROUP BY p.idProducto, p.nombre;
Ventas realizadas por el cliente "Juan"
sql
Copiar código
SELECT v.idVenta, c.nombre AS Cliente, p.nombre AS Producto, v.cantidad, v.fecha
FROM Ventas v
INNER JOIN Clientes c ON v.idCliente = c.idCliente
INNER JOIN Productos p ON v.idProducto = p.idProducto
WHERE c.nombre = 'Juan';
Clientes sin ventas
sql
Copiar código
SELECT c.idCliente, c.nombre, c.email
FROM Clientes c
LEFT JOIN Ventas v ON c.idCliente = v.idCliente
WHERE v.idCliente IS NULL;
Ventas en un rango de fechas
sql
Copiar código
SELECT v.idVenta, c.nombre AS Cliente, p.nombre AS Producto, v.cantidad, v.fecha
FROM Ventas v
INNER JOIN Clientes c ON v.idCliente = c.idCliente
INNER JOIN Productos p ON v.idProducto = p.idProducto
WHERE v.fecha BETWEEN '2023-09-01' AND '2023-09-05';
Productos más vendidos
sql
Copiar código
SELECT p.idProducto, p.nombre AS Producto, SUM(v.cantidad) AS Total_Vendido
FROM Ventas v
INNER JOIN Productos p ON v.idProducto = p.idProducto
GROUP BY p.idProducto, p.nombre
ORDER BY Total_Vendido DESC;
Total de ventas por cliente (en dinero)
sql
Copiar código
SELECT c.idCliente, c.nombre AS Cliente, SUM(v.cantidad * p.precio) AS Total_Ventas
FROM Ventas v
INNER JOIN Clientes c ON v.idCliente = c.idCliente
INNER JOIN Productos p ON v.idProducto = p.idProducto
GROUP BY c.idCliente, c.nombre;
Ventas detalladas por cliente y producto
sql
Copiar código
SELECT c.nombre AS Cliente, p.nombre AS Producto, SUM(v.cantidad) AS Cantidad_Total
FROM Ventas v
INNER JOIN Clientes c ON v.idCliente = c.idCliente
INNER JOIN Productos p ON v.idProducto = p.idProducto
GROUP BY c.nombre, p.nombre
ORDER BY c.nombre, Cantidad_Total DESC;
Actualizar precio de un producto (solo si existe)
sql
Copiar código
UPDATE Productos
SET precio = 350.00
WHERE nombre = 'Tablet Samsung';
Eliminar una venta por ID
sql
Copiar código
DELETE FROM Ventas
WHERE idVenta = 3;
Contar número total de ventas
sql
Copiar código
SELECT COUNT(*) AS Total_Ventas
FROM Ventas;
Clientes que compraron más de un producto
sql
Copiar código
SELECT c.nombre AS Cliente, COUNT(DISTINCT v.idProducto) AS Productos_Comprados
FROM Ventas v
INNER JOIN Clientes c ON v.idCliente = c.idCliente
GROUP BY c.idCliente, c.nombre
HAVING COUNT(DISTINCT v.idProducto) > 1;
3️⃣ Autor
Nombre: Tu Nombre

Fecha: 14/09/2025
