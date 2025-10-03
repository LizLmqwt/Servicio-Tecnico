-- Procedimiento 1: Registrar un nuevo cliente
DELIMITER $$
CREATE PROCEDURE RegistrarCliente(
    IN p_nombre VARCHAR(50),
    IN p_ci VARCHAR(20),
    IN p_telefono VARCHAR(15)
)
BEGIN
    INSERT INTO Cliente (nombre, ci, telefono)
    VALUES (p_nombre, p_ci, p_telefono);
END$$
DELIMITER ;

call RegistrarCliente('Eduardo','1056420','74462505');

select * from cliente;

-- Procedimiento 2: Cambiar estado de una solicitud
DELIMITER $$
CREATE PROCEDURE CambiarEstadoSolicitud(
    IN p_idSolicitud INT,
    IN p_nuevoEstado VARCHAR(20)
)
BEGIN
    UPDATE SolicitudServicio
    SET estado = p_nuevoEstado
    WHERE idSolicitud = p_idSolicitud;
END$$
DELIMITER ;

CALL CambiarEstadoSolicitud(4, 'Completado');


