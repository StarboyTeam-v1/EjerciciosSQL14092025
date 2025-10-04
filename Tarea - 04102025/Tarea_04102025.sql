-- Crear base de datos Tarea 
CREATE DATABASE laboratorio_having_pivot;
USE laboratorio_having_pivot;

-- Tabla: clientes
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(100)
);

INSERT INTO clientes (id_cliente, nombre) VALUES
(1, 'Juan Pérez'),
(2, 'María López'),
(3, 'Carlos García'),
(4, 'Ana Torres'),
(5, 'Luis Fernández');

-- Tabla: pedidos
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    monto DECIMAL(10,2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO pedidos (id_pedido, id_cliente, monto) VALUES
(1, 1, 1500),
(2, 1, 2500),
(3, 1, 3000),
(4, 2, 1200),
(5, 2, 9000),
(6, 3, 500),
(7, 3, 700),
(8, 3, 4000),
(9, 4, 300),
(10, 4, 1200);

-- Tabla: calificaciones
CREATE TABLE calificaciones (
    id_estudiante INT,
    clase VARCHAR(50),
    calificacion INT
);

INSERT INTO calificaciones (id_estudiante, clase, calificacion) VALUES
(1, 'Matemáticas', 80),
(2, 'Matemáticas', 65),
(3, 'Historia', 78),
(4, 'Historia', 82),
(5, 'Ciencias', 90),
(6, 'Ciencias', 70);

-- Tabla: productos
CREATE TABLE productos (
    id_producto INT,
    nombre_producto VARCHAR(100),
    mes VARCHAR(20),
    cantidad INT
);

INSERT INTO productos (id_producto, nombre_producto, mes, cantidad) VALUES
(1, 'Producto A', 'Enero', 100),
(2, 'Producto B', 'Enero', 200),
(1, 'Producto A', 'Febrero', 150),
(2, 'Producto B', 'Febrero', 250),
(1, 'Producto A', 'Marzo', 300),
(2, 'Producto B', 'Marzo', 400);

-- Tabla: empleados
CREATE TABLE empleados (
    id_empleado INT PRIMARY KEY,
    nombre VARCHAR(100),
    id_departamento INT
);

INSERT INTO empleados (id_empleado, nombre, id_departamento) VALUES
(1, 'Pedro Ruiz', 1),
(2, 'Laura Martínez', 1),
(3, 'Juan Díaz', 2),
(4, 'Sofía Gómez', 2),
(5, 'Clara López', 2),
(6, 'Miguel Torres', 3);

-- Tabla: libros
CREATE TABLE libros (
    id_libro INT PRIMARY KEY,
    id_autor INT,
    titulo VARCHAR(100)
);

INSERT INTO libros (id_libro, id_autor, titulo) VALUES
(1, 1, 'Libro A'),
(2, 1, 'Libro B'),
(3, 2, 'Libro C'),
(4, 2, 'Libro D'),
(5, 3, 'Libro E');

-- Tabla: ingresos
CREATE TABLE ingresos (
    id_ingreso INT PRIMARY KEY,
    id_empleado INT,
    mes VARCHAR(20),
    cantidad DECIMAL(10,2)
);

INSERT INTO ingresos (id_ingreso, id_empleado, mes, cantidad) VALUES
(1, 1, 'Enero', 5000),
(2, 1, 'Febrero', 6000),
(3, 2, 'Enero', 7000),
(4, 2, 'Febrero', 8000),
(5, 3, 'Enero', 3000);

-- Tabla: publicaciones
CREATE TABLE publicaciones (
    id_publicacion INT PRIMARY KEY,
    titulo VARCHAR(100)
);

INSERT INTO publicaciones (id_publicacion, titulo) VALUES
(1, 'Post A'),
(2, 'Post B'),
(3, 'Post C');

-- Tabla: comentarios
CREATE TABLE comentarios (
    id_comentario INT PRIMARY KEY,
    id_publicacion INT,
    contenido VARCHAR(200),
    FOREIGN KEY (id_publicacion) REFERENCES publicaciones(id_publicacion)
);

INSERT INTO comentarios (id_comentario, id_publicacion, contenido) VALUES
(1, 1, 'Comentario 1'),
(2, 1, 'Comentario 2'),
(3, 1, 'Comentario 3'),
(4, 2, 'Comentario 4'),
(5, 2, 'Comentario 5');

