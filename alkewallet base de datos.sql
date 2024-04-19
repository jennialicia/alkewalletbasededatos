-- Crear la base de datos Alke Wallet
CREATE DATABASE IF NOT EXISTS alke_wallet;

-- Usar la base de datos Alke Wallet
USE alke_wallet;

-- Crear la tabla Usuario
CREATE TABLE Usuario (
    user_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    correo_electronico VARCHAR(50),
    contrasena VARCHAR(50),
    saldo DECIMAL(10,2)
);

-- Crear la tabla Moneda
CREATE TABLE Moneda (
    currency_id INT PRIMARY KEY,
    currency_name VARCHAR(50),
    currency_symbol VARCHAR(10)
);

-- Crear la tabla Transacción
CREATE TABLE Transaccion (
    transaction_id INT PRIMARY KEY,
    sender_user_id INT,
    receiver_user_id INT,
    importe DECIMAL(10,2),
    transaction_date DATE,
    id_Moneda INT,
    FOREIGN KEY (sender_user_id) REFERENCES Usuario(user_id),
    FOREIGN KEY (receiver_user_id) REFERENCES Usuario(user_id),
    FOREIGN KEY (id_Moneda) REFERENCES Moneda(currency_id)
);

/*insertar datos a tabla usuario*/
insert into usuario (idUsuario, nombre, correoElectronico, clave, saldo) 
values
(1, "Maria Rojas", "mariarojas@mail.com","123456", 650000), -- Corrección del tipo de datos de saldo
(2, "Clara Muñoz", "claram@mail.com","123456", 540000), -- Corrección del tipo de datos de saldo
(3, "Ester Lillo", "ester.li@mail.com","123456", 340000), -- Corrección del tipo de datos de saldo
(4, "Nicolas Lopez", "nico.lopez@mail.com","123456", 260000), -- Corrección del tipo de datos de saldo
(5, "Valentina Burgos", "valentinab@mail.com","123456", 890000), -- Corrección del tipo de datos de saldo
(6, "Maite Sepulveda", "maites@mail.com","123456", 360000), -- Corrección del tipo de datos de saldo
(7, "Matias Riquelme", "matiasr@mail.com","123456", 480000), -- Corrección del tipo de datos de saldo
(8, "Caty Gonzalez", "catyg@mail.com","123456", 550000), -- Corrección del tipo de datos de saldo
(9, "Thiare Garcia", "thiareg@mail.com","123456", 650000), -- Corrección del tipo de datos de saldo
(10, "Ruth Bahamondes", "ruthb@mail.com","123456", 700000) -- Corrección del tipo de datos de saldo
;

/*insertar datos a tabla usuario*/
insert into moneda (idMoneda, simbolo, nombre) 
values
("1", "CLP$", "Peso"),
("2", "US$", "Dolar"),
("3", "€", "Euro")
;

/*insertar datos a tabla transacción*/
insert into transaccion (idTransaccion, id_UsuarioEnvia, id_UsuarioRecibe, importe, id_Moneda,fecha)
values
("1","3", "5", "35.000", "1", "2023-01-01"),
("2","8", "1", "50.000", "3", "2023-01-01"),
("3","2", "7", "28.000", "2", "2023-01-01")
;

/*Consulta n°1: obtención nombre de moneda elegida por el usuario*/
SELECT u.nombre AS nombre_usuario, m.currency_name AS nombre_moneda
FROM Usuario u
JOIN Transaccion t ON u.user_id = t.sender_user_id OR u.user_id = t.receiver_user_id
JOIN Moneda m ON t.id_Moneda = m.currency_id
WHERE u.user_id = 1; -- Cambiar el id de usuario según sea necesario

/*Consulta n°2: obtención de transacciones registradas*/
select *
from transaccion;

/*Consulta n°3: obtención de transacciones por 1 usuario*/
SELECT * FROM Transaccion
WHERE sender_user_id = 1 ;

/*Consulta n°4_ Modificar campo correo electronico de un usuario*/
UPDATE Usuario
SET correo_electronico = 'jennimodificado@gmail.com'
WHERE user_id = 2; 

/*Consulta n°5: Eliminar datos de una transacción*/
DELETE FROM Transaccion
WHERE transaction_id = 2; 

