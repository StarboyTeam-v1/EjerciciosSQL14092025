-- Crear la base de datos
CREATE DATABASE funciones_sql_demo;
USE funciones_sql_demo;

-- 1. Tabla para PIVOT (simulado en MySQL)
CREATE TABLE ventas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    producto VARCHAR(50),
    mes VARCHAR(20),
    ventas DECIMAL(10,2),
    vendedor VARCHAR(50),
    region VARCHAR(50)
);

-- Insertar datos para PIVOT
INSERT INTO ventas (producto, mes, ventas, vendedor, region) VALUES
('Laptop', 'Enero', 10000.00, 'Juan Pérez', 'Norte'),
('Laptop', 'Febrero', 15000.00, 'Juan Pérez', 'Norte'),
('Laptop', 'Marzo', 12000.00, 'Juan Pérez', 'Norte'),
('Mouse', 'Enero', 5000.00, 'María García', 'Sur'),
('Mouse', 'Febrero', 6000.00, 'María García', 'Sur'),
('Mouse', 'Marzo', 5500.00, 'María García', 'Sur'),
('Teclado', 'Enero', 8000.00, 'Carlos López', 'Este'),
('Teclado', 'Febrero', 9000.00, 'Carlos López', 'Este'),
('Teclado', 'Marzo', 8500.00, 'Carlos López', 'Este'),
('Monitor', 'Enero', 20000.00, 'Ana Martínez', 'Oeste'),
('Monitor', 'Febrero', 22000.00, 'Ana Martínez', 'Oeste'),
('Monitor', 'Marzo', 21000.00, 'Ana Martínez', 'Oeste'),
('Laptop', 'Enero', 8000.00, 'Pedro Sánchez', 'Sur'),
('Laptop', 'Febrero', 9500.00, 'Pedro Sánchez', 'Sur'),
('Laptop', 'Marzo', 8800.00, 'Pedro Sánchez', 'Sur');

-- 2. Tabla para WHERE vs HAVING
CREATE TABLE empleados (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    salario DECIMAL(10,2),
    departamento VARCHAR(50),
    fecha_contratacion DATE,
    estado VARCHAR(20)
);

INSERT INTO empleados (nombre, salario, departamento, fecha_contratacion, estado) VALUES
('Juan Pérez', 6000.00, 'Ventas', '2019-03-15', 'Activo'),
('María García', 5500.00, 'Ventas', '2020-06-20', 'Activo'),
('Carlos López', 4500.00, 'IT', '2021-01-10', 'Activo'),
('Ana Martínez', 7000.00, 'IT', '2018-11-05', 'Activo'),
('Pedro Sánchez', 4800.00, 'Marketing', '2022-02-28', 'Activo'),
('Laura Díaz', 5200.00, 'Marketing', '2020-08-15', 'Inactivo'),
('Miguel Ruiz', 7500.00, 'Ventas', '2017-05-12', 'Activo'),
('Sofía Castro', 4200.00, 'IT', '2023-03-01', 'Activo'),
('David Torres', 5800.00, 'Marketing', '2019-09-20', 'Activo'),
('Elena Vargas', 6500.00, 'Ventas', '2021-07-30', 'Activo');

-- 3. Tabla adicional para más ejemplos
CREATE TABLE pedidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente VARCHAR(50),
    producto VARCHAR(50),
    cantidad INT,
    precio_unitario DECIMAL(10,2),
    fecha_pedido DATE,
    categoria VARCHAR(50)
);

INSERT INTO pedidos (cliente, producto, cantidad, precio_unitario, fecha_pedido, categoria) VALUES
('Empresa A', 'Laptop', 5, 1200.00, '2024-01-15', 'Tecnología'),
('Empresa B', 'Mouse', 20, 25.00, '2024-01-20', 'Accesorios'),
('Empresa C', 'Teclado', 15, 45.00, '2024-02-05', 'Accesorios'),
('Empresa A', 'Monitor', 3, 300.00, '2024-02-10', 'Tecnología'),
('Empresa D', 'Laptop', 2, 1500.00, '2024-02-15', 'Tecnología'),
('Empresa B', 'Monitor', 4, 350.00, '2024-03-01', 'Tecnología'),
('Empresa C', 'Mouse', 30, 20.00, '2024-03-10', 'Accesorios'),
('Empresa E', 'Teclado', 10, 50.00, '2024-03-15', 'Accesorios'),
('Empresa A', 'Mouse', 25, 22.00, '2024-03-20', 'Accesorios'),
('Empresa D', 'Monitor', 2, 400.00, '2024-03-25', 'Tecnología');

-- Consultas de demostración

-- 1. PIVOT (simulado en MySQL usando CASE)
SELECT 
    producto,
    SUM(CASE WHEN mes = 'Enero' THEN ventas ELSE 0 END) as Enero,
    SUM(CASE WHEN mes = 'Febrero' THEN ventas ELSE 0 END) as Febrero,
    SUM(CASE WHEN mes = 'Marzo' THEN ventas ELSE 0 END) as Marzo,
    SUM(ventas) as Total
FROM ventas
GROUP BY producto;

-- 2. WHERE vs HAVING
-- WHERE: Filtrar antes de agrupar
SELECT departamento, AVG(salario) as salario_promedio
FROM empleados
WHERE estado = 'Activo'
GROUP BY departamento;

-- HAVING: Filtrar después de agrupar
SELECT departamento, AVG(salario) as salario_promedio
FROM empleados
WHERE estado = 'Activo'
GROUP BY departamento
HAVING AVG(salario) > 5500;

-- 3. Combinación WHERE y HAVING
SELECT departamento, COUNT(*) as cantidad_empleados, AVG(salario) as salario_promedio
FROM empleados
WHERE fecha_contratacion > '2020-01-01' AND estado = 'Activo'
GROUP BY departamento
HAVING AVG(salario) > 5000;

-- 4. Ejemplo con ventas por vendedor
SELECT vendedor, region, SUM(ventas) as total_ventas
FROM ventas
GROUP BY vendedor, region
HAVING SUM(ventas) > 25000;

-- 5. Ejemplo con pedidos
SELECT 
    categoria,
    COUNT(*) as total_pedidos,
    SUM(cantidad * precio_unitario) as valor_total
FROM pedidos
WHERE fecha_pedido BETWEEN '2024-01-01' AND '2024-03-31'
GROUP BY categoria
HAVING SUM(cantidad * precio_unitario) > 1000;
