CREATE TABLE Categoria (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Producto (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    marca VARCHAR(255),
    categoria_id INT REFERENCES Categoria(id),
    precio_unitario DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Sucursal (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    direccion VARCHAR(255)
);

CREATE TABLE Stock (
    id SERIAL PRIMARY KEY,
    sucursal_id INT REFERENCES Sucursal(id),
    producto_id INT REFERENCES Producto(id),
    cantidad INT NOT NULL,
    UNIQUE (sucursal_id, producto_id)
);

CREATE TABLE Cliente (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    telefono VARCHAR(20)
);

CREATE TABLE Orden (
    id SERIAL PRIMARY KEY,
    cliente_id INTEGER,
	sucursal_id INTEGER,
	fecha DATE,
	total INTEGER
);

CREATE TABLE Item (
    id SERIAL PRIMARY KEY,
    orden_id INTEGER,
    producto_id INTEGER,
    cantidad INT NOT NULL,
    monto_venta DECIMAL(10, 2) NOT NULL
);

-- Insercion a tabla Categoria"
INSERT INTO Categoria (nombre) VALUES
    ('Electrónicos'),
    ('Ropa'),
    ('Hogar'),
    ('Deportes'),
    ('Juguetes');
	
-- Insercion a tabla "Producto"
INSERT INTO Producto (nombre, marca, categoria_id, precio_unitario) VALUES
    ('Televisor', 'Sony', 1, 1000.00),
    ('Laptop', 'HP', 1, 800.00),
    ('Camisa', 'Zara', 2, 50.00),
    ('Pantalón', 'Levi''s', 2, 70.00), -- Use comillas normales para levi's.
    ('Sartén', 'T-fal', 3, 30.00),
    ('Toalla', 'Cannon', 3, 20.00),
    ('Pelota', 'Nike', 4, 15.00),
    ('Raqueta', 'Wilson', 4, 50.00),
    ('Muñeca', 'Barbie', 5, 25.00),
    ('Carro', 'Hot Wheels', 5, 10.00);
	
-- Insercion a tabla "Sucursal"
INSERT INTO Sucursal (nombre, direccion)
VALUES
    ('Sucursal A', 'Calle 1'),
    ('Sucursal B', 'Calle 2'),
    ('Sucursal C', 'Calle 3');
	
-- Insercion a tabla "Stock"
INSERT INTO Stock (sucursal_id, producto_id, cantidad) VALUES
(1, 1, 65),
(1, 2, 71),
(1, 3, 8),
(1, 4, 42),
(1, 5, 61),
(1, 6, 14),
(1, 7, 70),
(1, 8, 66),
(1, 9, 13),
(1, 10, 68),
(2, 1, 14),
(2, 2, 67),
(2, 3, 74),
(2, 4, 32),
(2, 5, 75),
(2, 6, 37),
(2, 7, 14),
(2, 8, 42),
(2, 9, 51),
(2, 10, 41),
(3, 1, 59),
(3, 2, 98),
(3, 3, 52),
(3, 4, 85),
(3, 5, 31),
(3, 6, 17),
(3, 7, 13),
(3, 8, 18),
(3, 9, 76),
(3, 10, 1);

-- Insercion a tabla "Cliente"
INSERT INTO Cliente (nombre, telefono) VALUES
    ('Juan', '1234567890'),
    ('María', '0987654321'),
    ('Pedro', '5555555555');
	
--Insecion a tabla "Orden"
INSERT INTO Orden (cliente_id, sucursal_id, fecha, total) VALUES
    (1, 1, '2023-06-12', 575),
    (2, 2, '2023-06-12', 705),
    (3, 3, '2023-06-12', 9000),
    (4, 2, '2023-06-12', 10400),
    (5, 3, '2023-06-12', 85),
    (6, 1, '2023-06-12', 830),
    (7, 1, '2023-06-12', 490),
    (8, 3, '2023-06-12', 16100),
    (9, 3, '2023-06-12', 680),
    (10, 2, '2023-06-12', 7525),
    (11, 2, '2023-06-12', 725),
    (12, 3, '2023-06-12', 11430),
    (13, 3, '2023-06-12', 4900),
    (14, 3, '2023-06-12', 5490),
    (15, 1, '2023-06-12', 420);
	
-- Insercion a tabla "Item"
INSERT INTO Item (orden_id, producto_id, cantidad, monto_venta) VALUES
(1, 1, 9, 175.00),
(2, 1, 8, 400.00),
(6, 2, 9, 75.00),
(7, 2, 5, 270.00),
(8, 2, 5, 300.00),
(9, 2, 6, 60.00),
(11, 3, 1, 9000.00),
(16, 4, 1, 4000.00),
(17, 4, 2, 6400.00),
(21, 5, 6, 40.00),
(22, 5, 7, 45.00),
(26, 6, 4, 630.00),
(27, 6, 9, 100.00),
(28, 6, 3, 100.00),
(31, 7, 5, 240.00),
(32, 7, 9, 150.00),
(33, 7, 8, 100.00),
(36, 8, 1, 6000.00),
(37, 8, 1, 10000.00),
(38, 8, 3, 100.00),
(41, 9, 8, 450.00),
(42, 9, 3, 150.00),
(43, 9, 7, 30.00),
(44, 9, 10, 50.00),
(46, 10, 9, 225.00),
(47, 10, 1, 7000.00),
(48, 10, 3, 300.00),
(51, 11, 7, 75.00),
(52, 11, 9, 200.00),
(53, 11, 3, 450.00),
(56, 12, 2, 5600.00),
(57, 12, 1, 5000.00),
(58, 12, 6, 180.00),
(59, 12, 8, 450.00),
(60, 12, 8, 200.00),
(61, 13, 9, 100.00),
(62, 13, 2, 4800.00),
(66, 14, 1, 5000.00),
(67, 14, 4, 490.00),
(71, 15, 9, 150.00),
(72, 15, 5, 270.00);

