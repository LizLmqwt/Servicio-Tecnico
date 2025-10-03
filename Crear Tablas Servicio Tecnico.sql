CREATE DATABASE ServicioTecnico;
USE ServicioTecnico;


CREATE TABLE Usuario 
(
    idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    rol VARCHAR(20) NOT NULL
);


CREATE TABLE Cliente 
(
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ci VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(15) NOT NULL
);

select * from cliente;


CREATE TABLE Direccion
 (
    idDireccion INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL,
    pais VARCHAR(30) NOT NULL,
    ciudad VARCHAR(30) NOT NULL,
    zona VARCHAR(50),
    numero VARCHAR(10),
    latitud DECIMAL(9,6),
    longitud DECIMAL(9,6),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);


CREATE TABLE Tecnico
 (
    idTecnico INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    ci VARCHAR(20) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    email VARCHAR(50)
);


CREATE TABLE Especialidad 
(
    idEspecialidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Relación Técnico ↔ Especialidad
CREATE TABLE TecnicoEspecialidad 
(
    idTecnico INT,
    idEspecialidad INT,
    PRIMARY KEY (idTecnico, idEspecialidad),
    FOREIGN KEY (idTecnico) REFERENCES Tecnico(idTecnico),
    FOREIGN KEY (idEspecialidad) REFERENCES Especialidad(idEspecialidad)
);


CREATE TABLE DisponibilidadTecnico 
(
    idDisponibilidad INT AUTO_INCREMENT PRIMARY KEY,
    idTecnico INT NOT NULL,
    diaSemana VARCHAR(20) NOT NULL,
    horaInicio TIME NOT NULL,
    horaFin TIME NOT NULL,
    FOREIGN KEY (idTecnico) REFERENCES Tecnico(idTecnico)
);


CREATE TABLE Servicio
 (
    idServicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    duracionEstimada TIME,
    materialesRequeridos TEXT
);


CREATE TABLE SolicitudServicio
 (
    idSolicitud INT AUTO_INCREMENT PRIMARY KEY,
    idCliente INT NOT NULL,
    idTecnico INT NOT NULL,
    idServicio INT NOT NULL,
    fechaSolicitud DATE NOT NULL,
    fechaProgramada DATETIME,
    estado VARCHAR(20) NOT NULL,
    prioridad VARCHAR(20),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idTecnico) REFERENCES Tecnico(idTecnico),
    FOREIGN KEY (idServicio) REFERENCES Servicio(idServicio)
);


CREATE TABLE Reprogramacion 
(
    idReprogramacion INT AUTO_INCREMENT PRIMARY KEY,
    idSolicitud INT NOT NULL,
    motivo TEXT NOT NULL,
    nuevaFecha DATETIME NOT NULL,
    FOREIGN KEY (idSolicitud) REFERENCES SolicitudServicio(idSolicitud)
);


CREATE TABLE Pago 
(
    idPago INT AUTO_INCREMENT PRIMARY KEY,
    idSolicitud INT NOT NULL,
    monto DECIMAL(10,2) NOT NULL,
    metodoPago VARCHAR(20) NOT NULL,
    fechaPago DATE NOT NULL,
    comprobante VARCHAR(100),
    FOREIGN KEY (idSolicitud) REFERENCES SolicitudServicio(idSolicitud)
);


CREATE TABLE Historial 
(
    idHistorial INT AUTO_INCREMENT PRIMARY KEY,
    idSolicitud INT NOT NULL,
    cambio TEXT NOT NULL,
    fechaCambio DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (idSolicitud) REFERENCES SolicitudServicio(idSolicitud)
);


CREATE TABLE Retroalimentacion 
(
    idFeedback INT AUTO_INCREMENT PRIMARY KEY,
    idSolicitud INT NOT NULL,
    comentario TEXT,
    calificacion INT CHECK (calificacion BETWEEN 1 AND 5),
    FOREIGN KEY (idSolicitud) REFERENCES SolicitudServicio(idSolicitud)
);
