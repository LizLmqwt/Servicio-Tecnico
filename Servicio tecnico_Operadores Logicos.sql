
-- Solicitudes en estado "Programado" o "Pendiente"
SELECT * 
FROM SolicitudServicio
WHERE estado = 'Programado' OR estado = 'Pendiente';

-- Servicios que cuesten más de 100 pero no de tipo Plomería
SELECT * 
FROM Servicio
WHERE costo > 100 AND NOT tipo = 'Plomería';

-- XOR: Clientes cuyo nombre empiece con 'J' Xor empiecen por ci
SELECT * 
FROM Cliente
WHERE (nombre LIKE 'J%') XOR (ci = '1056420');

select * from cliente;
