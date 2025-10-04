-- consultas 
-- Ejercicio 1: HAVING - Clientes con más de 5 pedidos
SELECT c.nombre, COUNT(p.id_pedido) as total_pedidos
FROM clientes c
JOIN pedidos p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nombre
HAVING COUNT(p.id_pedido) > 5;

-- Ejercicio 2: HAVING - Productos con más de $10,000 en ventas
SELECT nombre_producto, SUM(cantidad) as total_vendido
FROM productos
GROUP BY nombre_producto
HAVING SUM(cantidad) > 10000;

-- Ejercicio 3: HAVING - Clases con promedio mayor a 75
SELECT clase, AVG(calificacion) as promedio_calificaciones
FROM calificaciones
GROUP BY clase
HAVING AVG(calificacion) > 75;

-- Ejercicio 4: PIVOT - Ventas por producto y mes
SELECT 
    nombre_producto,
    SUM(CASE WHEN mes = 'Enero' THEN cantidad ELSE 0 END) as Enero,
    SUM(CASE WHEN mes = 'Febrero' THEN cantidad ELSE 0 END) as Febrero,
    SUM(CASE WHEN mes = 'Marzo' THEN cantidad ELSE 0 END) as Marzo
FROM productos
GROUP BY nombre_producto;

-- Ejercicio 5: PIVOT - Ventas por trimestre
SELECT 
    nombre_producto,
    SUM(CASE 
        WHEN mes IN ('Enero', 'Febrero', 'Marzo') THEN cantidad 
        ELSE 0 
    END) as Primer_Trimestre
FROM productos
GROUP BY nombre_producto;

-- Ejercicio 6: HAVING - Departamentos con más de 10 empleados
SELECT id_departamento, COUNT(*) as total_empleados
FROM empleados
GROUP BY id_departamento
HAVING COUNT(*) > 10;

-- Ejercicio 7: HAVING - Autores con más de 3 libros
SELECT id_autor, COUNT(*) as total_libros
FROM libros
GROUP BY id_autor
HAVING COUNT(*) > 3;

-- Ejercicio 8: PIVOT - Ingresos anuales por empleado
SELECT 
    e.nombre,
    SUM(CASE WHEN i.mes = 'Enero' THEN i.cantidad ELSE 0 END) as Enero,
    SUM(CASE WHEN i.mes = 'Febrero' THEN i.cantidad ELSE 0 END) as Febrero,
    SUM(i.cantidad) as Total_Anual
FROM empleados e
LEFT JOIN ingresos i ON e.id_empleado = i.id_empleado
GROUP BY e.id_empleado, e.nombre;

-- Ejercicio 9: HAVING - Publicaciones con más de 100 comentarios
SELECT p.titulo, COUNT(c.id_comentario) as total_comentarios
FROM publicaciones p
LEFT JOIN comentarios c ON p.id_publicacion = c.id_publicacion
GROUP BY p.id_publicacion, p.titulo
HAVING COUNT(c.id_comentario) > 100;

-- Ejercicio 10: PIVOT - Estudiantes aprobados y reprobados por asignatura
SELECT 
    clase,
    SUM(CASE WHEN calificacion >= 70 THEN 1 ELSE 0 END) as Aprobados,
    SUM(CASE WHEN calificacion < 70 THEN 1 ELSE 0 END) as Reprobados,
    COUNT(*) as Total_Estudiantes
FROM calificaciones
GROUP BY clase;
