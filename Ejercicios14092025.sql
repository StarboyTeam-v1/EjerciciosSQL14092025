create database Ejercicios14092025;
use Ejercicios14092025;
create table Clientes(
idCliente int not null auto_increment primary key,
nombre varchar(100),
email varchar(100)
);
create table Productos(
idProducto int not null auto_increment primary key,
nombre varchar(100),
precio decimal(10.2)
);
create table Ventas(
idVenta int not null auto_increment primary key,
idCliente int,
idProducto int,
cantidad int,
fecha date,
FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente),
FOREIGN KEY (idProducto) REFERENCES Productos(idProducto)
);
-- Insertar Registros
-- Clientes
INSERT INTO Clientes (nombre, email) VALUES
('Ana López', 'ana.lopez@gmail.com'),
('Carlos Méndez', 'carlos.mendez@yahoo.com'),
('Lucía Ramírez', 'lucia.ramirez@outlook.com'),
('Pedro Torres', 'pedro.torres@gmail.com'),
('María González', 'maria.gonzalez@hotmail.com'),
('Jorge Castillo', 'jorge.castillo@gmail.com'),
('Sofía Vega', 'sofia.vega@yahoo.com'),
('Luis Morales', 'luis.morales@outlook.com'),
('Valeria Cruz', 'valeria.cruz@gmail.com'),
('Andrés Herrera', 'andres.herrera@hotmail.com'),
('Camila Díaz', 'camila.diaz@gmail.com'),
('Fernando Ruiz', 'fernando.ruiz@yahoo.com'),
('Paola Navarro', 'paola.navarro@outlook.com'),
('Diego Ríos', 'diego.rios@gmail.com'),
('Isabel Soto', 'isabel.soto@hotmail.com'),
('Ricardo Paredes', 'ricardo.paredes@gmail.com'),
('Gabriela León', 'gabriela.leon@yahoo.com'),
('Martín Salazar', 'martin.salazar@outlook.com'),
('Natalia Méndez', 'natalia.mendez@gmail.com'),
('Esteban Lara', 'esteban.lara@hotmail.com');

-- Productos
INSERT INTO Productos (nombre, precio) VALUES
('Laptop Lenovo', 799.99),
('Mouse inalámbrico', 25.50),
('Teclado mecánico', 89.90),
('Monitor 24"', 159.99),
('Audífonos Bluetooth', 49.99),
('Impresora HP', 129.00),
('Tablet Samsung', 299.99),
('Webcam HD', 39.95),
('Disco SSD 1TB', 109.99),
('Memoria USB 64GB', 15.75),
('Router WiFi', 69.99),
('Silla ergonómica', 199.00),
('Micrófono USB', 59.90),
('Cámara de seguridad', 89.50),
('Cargador portátil', 22.99),
('Smartwatch', 149.99),
('Hub USB-C', 34.90),
('Base para laptop', 44.99),
('Cable HDMI', 12.50),
('Altavoz Bluetooth', 79.99);
-- Ventas
INSERT INTO Ventas (idCliente, idProducto, cantidad, fecha) VALUES
(1, 1, 1, '2025-09-01'),
(2, 3, 2, '2025-09-02'),
(3, 5, 1, '2025-09-03'),
(4, 2, 3, '2025-09-04'),
(5, 4, 1, '2025-09-05'),
(6, 6, 1, '2025-09-06'),
(7, 7, 1, '2025-09-07'),
(8, 8, 2, '2025-09-08'),
(9, 9, 1, '2025-09-09'),
(10, 10, 4, '2025-09-10'),
(11, 11, 1, '2025-09-11'),
(12, 12, 1, '2025-09-12'),
(13, 13, 1, '2025-09-13'),
(14, 14, 2, '2025-09-14'),
(15, 15, 3, '2025-09-15'),
(16, 16, 1, '2025-09-16'),
(17, 17, 2, '2025-09-17'),
(18, 18, 1, '2025-09-18'),
(19, 19, 5, '2025-09-19'),
(20, 20, 1, '2025-09-20');
