-- Función: Calcular el total pagado por un cliente
DELIMITER $$
CREATE FUNCTION TotalPagadoCliente(p_idCliente INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);
    SELECT IFNULL(SUM(p.monto),0)
    INTO total
    FROM Pago p
    INNER JOIN SolicitudServicio s ON p.idSolicitud = s.idSolicitud
    WHERE s.idCliente = p_idCliente;
    RETURN total;
END$$
DELIMITER ;

SELECT TotalPagadoCliente(1);