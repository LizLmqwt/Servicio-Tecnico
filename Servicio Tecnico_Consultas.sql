
-- Solicitudes que están Programadas o En Proceso
SELECT * 
FROM SolicitudServicio
WHERE estado = 'Programado' OR estado = 'En Proceso';

-- Servicios que cuestan más de 150 o duran más de 2 horas, pero no ambos
SELECT * 
FROM Servicio
WHERE (costo > 150) XOR (duracionEstimada > '02:00:00');

-- Los 3 servicios mas claros
SELECT idServicio, costo
FROM Servicio
ORDER BY costo DESC
LIMIT 3;

-- solicitudes en cierto rango de fechas
SELECT idSolicitud, fechaSolicitud, idCliente, idTecnico
FROM solicitudservicio
WHERE fechaSolicitud BETWEEN '2025-01-01' AND '2025-12-31';

-- servicio con mas solicitudes
SELECT sv.nombre, COUNT(so.idSolicitud) AS TotalSolicitudes
FROM Servicio sv
JOIN solicitudservicio so ON sv.idServicio = so.idServicio
GROUP BY sv.idServicio
HAVING COUNT(so.idSolicitud) > 1;


