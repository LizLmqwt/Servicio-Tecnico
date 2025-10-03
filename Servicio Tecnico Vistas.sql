-- 1. Listar todas las solicitudes con cliente, técnico y servicio
SELECT s.idSolicitud, c.nombre AS Cliente, t.nombre AS Tecnico, 
       srv.nombre AS Servicio, s.estado, s.fechaProgramada
FROM SolicitudServicio s
JOIN Cliente c ON s.idCliente = c.idCliente
JOIN Tecnico t ON s.idTecnico = t.idTecnico
JOIN Servicio srv ON s.idServicio = srv.idServicio;

-- 2. Ver los pagos realizados junto al cliente y servicio
SELECT p.idPago, c.nombre AS Cliente, srv.nombre AS Servicio, 
       p.monto, p.metodoPago, p.fechaPago
FROM Pago p
JOIN SolicitudServicio s ON p.idSolicitud = s.idSolicitud
JOIN Cliente c ON s.idCliente = c.idCliente
JOIN Servicio srv ON s.idServicio = srv.idServicio;

-- 3. Técnicos y sus especialidades
SELECT t.nombre AS Tecnico, e.nombre AS Especialidad
FROM TecnicoEspecialidad te
JOIN Tecnico t ON te.idTecnico = t.idTecnico
JOIN Especialidad e ON te.idEspecialidad = e.idEspecialidad;

-- 4. Solicitudes pendientes (filtros WHERE)
SELECT * FROM SolicitudServicio WHERE estado = 'Pendiente';

-- 5. Reprogramar una solicitud
UPDATE SolicitudServicio
SET fechaProgramada = '2025-09-20 15:00:00', estado = 'Reprogramado'
WHERE idSolicitud = 3;

-- 6. Eliminar un pago 
DELETE FROM Pago WHERE idPago = 2;

-- 7. Promedio de calificaciones por técnico
SELECT t.nombre AS Tecnico, AVG(r.calificacion) AS PromedioCalificacion
FROM Retroalimentacion r
JOIN SolicitudServicio s ON r.idSolicitud = s.idSolicitud
JOIN Tecnico t ON s.idTecnico = t.idTecnico
GROUP BY t.nombre;
