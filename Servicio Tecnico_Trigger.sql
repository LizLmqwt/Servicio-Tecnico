-- Trigger: Validar que los pagos tengan monto mayor a 0
DELIMITER $$
CREATE TRIGGER trg_validar_pago
BEFORE INSERT ON Pago
FOR EACH ROW
BEGIN
    IF NEW.monto <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El monto del pago debe ser mayor a 0';
    END IF;
END$$
DELIMITER ;

INSERT INTO Pago (idSolicitud, monto, metodoPago, fechaPago, comprobante) VALUES
(1, 0, 'Efectivo', '2025-09-12', 'comprobante1.jpg'),
(2, 0, 'Tarjeta', '2025-09-13', 'comprobante2.jpg');
