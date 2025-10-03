-- Insertar con encriptación simétrica
INSERT INTO Usuario (nombre, email, contrasena, rol)
VALUES ('Soporte5', 'soporte5@servicio.com', AES_ENCRYPT('pass123', 'claveSegura'), 'Soporte');

select * from usuario;

-- Leer desencriptando
SELECT nombre, email, AES_DECRYPT(contrasena, 'claveSegura') AS Contrasena
FROM Usuario;
