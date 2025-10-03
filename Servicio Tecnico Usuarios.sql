-- Crear el usuario
CREATE USER 'Admin'@'localhost' IDENTIFIED BY '1010';

GRANT ALL PRIVILEGES ON serviciostecnicos.* TO 'usuario1'@'localhost';

FLUSH PRIVILEGES;

-- Usuario de un solo privilegio
CREATE USER 'Pepito'@'localhost' IDENTIFIED BY '1234';


GRANT SELECT ON serviciostecnicos.clientes TO 'Pepito'@'localhost';

FLUSH PRIVILEGES;

