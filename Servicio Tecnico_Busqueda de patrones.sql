-- Buscar clientes cuyo nombre contenga "Juan"
SELECT * 
FROM Cliente
WHERE nombre LIKE '%Juan%';

-- Buscar técnicos cuyo email termine en "tecnicos.com"
SELECT * 
FROM Tecnico
WHERE email LIKE '%tecnicos.com';

-- Buscar servicios que empiecen con "Reparación"
SELECT * 
FROM Servicio
WHERE nombre LIKE 'Reparación%';

-- Buscar clientes cuyo nombre NO empiece con "M"
SELECT * 
FROM Cliente
WHERE nombre NOT LIKE 'M%';

-- Busqueda Por REGEXP

-- Buscar clientes cuyos nombres tengan "a" o "e"
SELECT * 
FROM Cliente
WHERE nombre REGEXP '[ae]';

-- Buscar técnicos cuyos nombres NO tengan "o"
SELECT * 
FROM Tecnico
WHERE nombre NOT REGEXP 'o';

-- Buscar servicios cuyo tipo comience con "E"
SELECT * 
FROM Servicio
WHERE tipo REGEXP '^E';

-- Buscar servicios cuyo nombre termine en "a"
SELECT * 
FROM Servicio
WHERE nombre REGEXP 'a$';





