use subconsultas;
-- Ejercicio 1: Promedio de Salario
SELECT nombre 
FROM emmployees 
WHERE salary > (SELECT AVG(salary) FROM emmployees);

-- Ejercicio 2: Departamentos con Proyectos
SELECT d.nombreD 
FROM deparments d 
WHERE d.deparmentId IN (
    SELECT p.deparmentId 
    FROM projects p 
    WHERE p.budget > 100000
);

-- Ejercicio 3: Empleados en Departamentos
SELECT e.nombre 
FROM emmployees e 
WHERE e.deparmentId IN (
    SELECT d.deparmentId 
    FROM deparments d 
    WHERE d.location = 'New York'
);

-- Ejercicio 4: Salarios Anuales
SELECT e.nombre 
FROM emmployees e 
INNER JOIN salaries s ON e.IdEmployee = s.IdEmployee 
WHERE s.año = 2023 
AND s.amount > (
    SELECT AVG(s2.amount) 
    FROM salaries s2 
    INNER JOIN emmployees e2 ON s2.IdEmployee = e2.IdEmployee 
    WHERE e2.deparmentId = e.deparmentId 
    AND s2.año = 2023
);

-- Ejercicio 5: Proyectos sin Empleados
SELECT p.nombreP 
FROM projects p 
WHERE p.deparmentId NOT IN (
    SELECT DISTINCT e.deparmentId 
    FROM emmployees e
    WHERE e.deparmentId IS NOT NULL
);

-- Ejercicio 6: Empleados por Ubicación
SELECT e.nombre 
FROM emmployees e 
INNER JOIN deparments d ON e.deparmentId = d.deparmentId 
WHERE e.salary > (
    SELECT AVG(e2.salary) 
    FROM emmployees e2 
    INNER JOIN deparments d2 ON e2.deparmentId = d2.deparmentId 
    WHERE d2.location = d.location
);

-- Ejercicio 7: Múltiples Proyectos
SELECT d.nombreD 
FROM deparments d 
INNER JOIN (
    SELECT deparmentId, COUNT(*) as num_projects 
    FROM projects 
    GROUP BY deparmentId 
    HAVING num_projects > 2
) p ON d.deparmentId = p.deparmentId;

-- Ejercicio 8: Comparación de Salarios
SELECT e.nombre 
FROM emmployees e 
WHERE e.salary > (
    SELECT MAX(e2.salary) 
    FROM emmployees e2 
    WHERE e2.deparmentId = e.deparmentId
);

-- Ejercicio 9: Empleados por Presupuesto
SELECT e.nombre 
FROM emmployees e 
WHERE e.deparmentId IN (
    SELECT p.deparmentId 
    FROM projects p 
    GROUP BY p.deparmentId 
    HAVING SUM(p.budget) < 500000
);

-- Ejercicio 10: Empleados sin Salario

SELECT e.nombre 
FROM emmployees e 
WHERE e.IdEmployee NOT IN (
    SELECT DISTINCT s.IdEmployee 
    FROM salaries s
);
