create database subconsultas;
use subconsultas;

CREATE TABLE deparments(
    deparmentId INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombreD VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE emmployees(
    IdEmployee INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50),
    salary DECIMAL(10,2),
    deparmentId INT,
    FOREIGN KEY (deparmentId) REFERENCES deparments(deparmentId)
);

CREATE TABLE projects(
    IdProject INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombreP VARCHAR(50),
    budget DECIMAL(10,2),
    deparmentId INT,
    FOREIGN KEY (deparmentId) REFERENCES deparments(deparmentId)
);

CREATE TABLE salaries(
    IdSalary INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    IdEmployee INT,
    año INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (IdEmployee) REFERENCES emmployees(IdEmployee)
);

-- Insertar datos en departments
INSERT INTO deparments (nombreD, location) VALUES
('Ventas', 'New York'),
('Marketing', 'Los Angeles'),
('TI', 'Chicago'),
('Recursos Humanos', 'Miami'),
('Finanzas', 'Boston'),
('Operaciones', 'Seattle'),
('Legal', 'Washington'),
('Investigación', 'Austin'),
('Producción', 'Denver'),
('Calidad', 'Phoenix'),
('Logística', 'Atlanta'),
('Compras', 'Dallas'),
('Servicio al Cliente', 'Houston'),
('Desarrollo', 'San Francisco'),
('Administración', 'Las Vegas');

-- Insertar datos en employees
INSERT INTO emmployees (nombre, salary, deparmentId) VALUES
('Juan Pérez', 50000.00, 1),
('María García', 60000.00, 2),
('Carlos López', 75000.00, 3),
('Ana Rodríguez', 55000.00, 1),
('Pedro Martínez', 80000.00, 4),
('Laura Hernández', 65000.00, 2),
('Miguel Sánchez', 90000.00, 3),
('Sofia Díaz', 48000.00, 5),
('David Ramírez', 72000.00, 4),
('Elena Torres', 58000.00, 6),
('Jorge Cruz', 85000.00, 7),
('Carmen Reyes', 52000.00, 8),
('Roberto Morales', 78000.00, 9),
('Patricia Ortega', 63000.00, 10),
('Fernando Castro', 95000.00, 11);

-- Insertar datos en projects
INSERT INTO projects (nombreP, budget, deparmentId) VALUES
('Sistema CRM', 150000.00, 1),
('Campaña Digital', 80000.00, 2),
('App Móvil', 200000.00, 3),
('Portal Web', 120000.00, 3),
('Estudio Mercado', 50000.00, 2),
('Automatización', 180000.00, 6),
('Seguridad IT', 220000.00, 3),
('Capacitación', 45000.00, 4),
('Optimización', 95000.00, 5),
('Nuevo Producto', 300000.00, 8),
('Control Calidad', 75000.00, 10),
('Logística 4.0', 160000.00, 11),
('Compras Inteligentes', 88000.00, 12),
('App Clientes', 175000.00, 13),
('ERP Empresarial', 400000.00, 14);

-- Insertar datos en salaries
INSERT INTO salaries (IdEmployee, año, amount) VALUES
(1, 2023, 48000.00),
(1, 2024, 50000.00),
(2, 2023, 58000.00),
(2, 2024, 60000.00),
(3, 2023, 72000.00),
(3, 2024, 75000.00),
(4, 2023, 53000.00),
(4, 2024, 55000.00),
(5, 2023, 78000.00),
(5, 2024, 80000.00),
(6, 2023, 63000.00),
(6, 2024, 65000.00),
(7, 2023, 87000.00),
(7, 2024, 90000.00),
(8, 2023, 46000.00);

