-- Vista 1: Detalle de solicitudes con cliente, técnico y servicio
CREATE VIEW v_SolicitudesDetalle AS
SELECT s.idSolicitud, c.nombre AS Cliente, t.nombre AS Tecnico,
       sv.nombre AS Servicio, s.fechaProgramada, s.estado, s.prioridad
FROM SolicitudServicio s
INNER JOIN Cliente c ON s.idCliente = c.idCliente
INNER JOIN Tecnico t ON s.idTecnico = t.idTecnico
INNER JOIN Servicio sv ON s.idServicio = sv.idServicio;

select * from v_SolicitudesDetalle;

-- Vista 2: Pagos realizados con información del cliente
CREATE VIEW v_PagosCliente AS
SELECT p.idPago, c.nombre AS Cliente, p.monto, p.metodoPago, p.fechaPago
FROM Pago p
INNER JOIN SolicitudServicio s ON p.idSolicitud = s.idSolicitud
INNER JOIN Cliente c ON s.idCliente = c.idCliente;

select * from v_PagosCliente;