
-- Insertar Usuarios
INSERT INTO Usuario(nombreemail, contrasena, rol) values
('Admin', 'admin@servicio.com', 'admin123', 'Administrador'),
('Soporte1', 'soporte1@servicio.com', 'pass123', 'Soporte'),
('Soporte2', 'soporte2@servicio.com', 'pass456', 'Soporte');

-- Insertar Clientes

INSERT INTO Cliente (nombre, ci, telefono) VALUES
('Juan Pérez', '7894561', '76543210'),
('María López', '6541237', '71234567'),
('Carlos Gómez', '9632584', '70112233');

select * from cliente;

-- Direcciones

INSERT INTO Direccion (idCliente, pais, ciudad, zona, numero, latitud, longitud) VALUES
(1, 'Bolivia', 'La Paz', 'Sopocachi', '123', -16.500000, -68.150000),
(2, 'Bolivia', 'Cochabamba', 'Queru Queru', '45', -17.400000, -66.150000),
(3, 'Bolivia', 'Santa Cruz', 'Equipetrol', '87', -17.783333, -63.183333);


-- Técnicos

INSERT INTO Tecnico (nombre, ci, telefono, email) VALUES
('Luis Ramos', '8521479', '78965412', 'luis@tecnicos.com'),
('Ana Fernández', '9517536', '77889900', 'ana@tecnicos.com'),
('Pedro Morales', '7539518', '70011223', 'pedro@tecnicos.com');


-- Especialidades

INSERT INTO Especialidad (nombre) VALUES
('Electricidad'),
('Plomería'),
('Electrodomésticos');

-- Relacionar técnicos con especialidades
INSERT INTO TecnicoEspecialidad (idTecnico, idEspecialidad) VALUES
(1, 1), -- Luis → Electricidad
(2, 2), -- Ana → Plomería
(3, 3), -- Pedro → Electrodomésticos
(1, 3); -- Luis → también Electrodomésticos


-- Disponibilidad Técnicos

INSERT INTO DisponibilidadTecnico (idTecnico, diaSemana, horaInicio, horaFin) VALUES
(1, 'Lunes', '08:00:00', '16:00:00'),
(2, 'Martes', '09:00:00', '17:00:00'),
(3, 'Miércoles', '10:00:00', '18:00:00');


-- Servicios

INSERT INTO Servicio (nombre, tipo, costo, duracionEstimada, materialesRequeridos) VALUES
('Instalación de enchufe', 'Electricidad', 120.50, '01:00:00', 'Cable, enchufe'),
('Reparación de cañería', 'Plomería', 200.00, '02:30:00', 'Tubo, sellador'),
('Mantenimiento de lavadora', 'Electrodomésticos', 300.00, '03:00:00', 'Herramientas varias'),
('Reparacion de computadora', 'Aparatos tecnologicos', 300.00, '04:00:00', 'Herramientas varias');

-- Solicitudes de servicio

INSERT INTO SolicitudServicio (idCliente, idTecnico, idServicio, fechaSolicitud, fechaProgramada, estado, prioridad) VALUES
(4, 1, 4, '2025-11-09', '2025-15-10 09:00:00', 'Programado', 'Alta'),
(2, 2, 2, '2025-09-11', '2025-09-13 10:00:00', 'En Proceso', 'Media'),
(3, 3, 3, '2025-09-12', '2025-09-15 11:00:00', 'Pendiente', 'Baja');



-- Pagos

INSERT INTO Pago (idSolicitud, monto, metodoPago, fechaPago, comprobante) VALUES
(1, 120.50, 'Efectivo', '2025-09-12', 'comprobante1.jpg'),
(2, 200.00, 'Tarjeta', '2025-09-13', 'comprobante2.jpg');


-- Retroalimentación

INSERT INTO Retroalimentacion (idSolicitud, comentario, calificacion) VALUES
(1, 'Excelente servicio, rápido y profesional.', 5),
(2, 'Bueno, pero tardó más de lo esperado.', 3);
