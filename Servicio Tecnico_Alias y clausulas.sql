-- Contar cuántos servicios existen por tipo
SELECT tipo AS TipoServicio, COUNT(*) AS Cantidad
FROM Servicio
GROUP BY tipo;

-- Ver la cantidad de solicitudes por estado
SELECT estado AS EstadoSolicitud, COUNT(*) AS Total
FROM SolicitudServicio
GROUP BY estado
ORDER BY Total DESC;

-- Ver técnicos que tienen más de 1 especialidad
SELECT idTecnico, COUNT(*) AS NumEspecialidades
FROM TecnicoEspecialidad
GROUP BY idTecnico
HAVING NumEspecialidades > 1;
