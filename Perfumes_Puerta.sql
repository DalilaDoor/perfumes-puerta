DROP SCHEMA IF EXISTS PERFUMES;
CREATE SCHEMA PERFUMES;
USE PERFUMES;
-- _____________________ CREACION DE TABLAS _____________________

-- Creamos la tabla de clientes
create table cliente (
	id_cliente int not null primary key auto_increment,
	nombre_cliente varchar(50) not null,
	apellido_cliente varchar(30) not null,
	direccion varchar(100),
	telefono varchar(20) not null,
	email varchar(100) not null
);

-- Creamos la tabla de lineas
create table linea (
	id_linea int not null primary key auto_increment,
    nombre_linea varchar(50) not null,
    descripcion varchar(100)
);

-- Creamos la tabla de fragancias
create table fragancia (
	id_fragancia int not null primary key auto_increment,
	nombre_fragancia varchar(60) not null,
    descripcion varchar(100)
);

-- Creamos la tabla de notas olfativas
create table nota_olfativa (
	id_nota int not null primary key auto_increment,
	nombre_nota varchar(60) not null,
    descripcion varchar(100)
);

-- Creamos la tabla de los productos
create table producto (
	id_producto int not null primary key auto_increment,
	id_linea int not null,
	id_fragancia int not null,
	id_nota int not null,
	tamaño int not null,
	tipo varchar(50) not null,
    stock int not null,
	foreign key(id_linea) references linea(id_linea),
	foreign key(id_fragancia) references fragancia(id_fragancia),
    foreign key(id_nota) references nota_olfativa(id_nota)
);

-- Creamos la tabla de ventas
create table venta (
	id_venta int not null primary key auto_increment,
    fecha date not null,
    id_cliente int not null,
    total_venta decimal(10,2) not null,
    foreign key(id_cliente) references cliente(id_cliente)
);

-- Creamos la tabla de detalles de ventas
create table detalle_venta (
	id_detalle int not null primary key auto_increment,
    id_venta int not null,
    id_producto int not null,
    cantidad_vendida int not null,
    precio_unitario decimal(10,2) not null,
    foreign key(id_venta) references venta(id_venta),
    foreign key(id_producto) references producto(id_producto)
);


-- ________________________________________________________________________________________
-- ___________________ INSERCIÓN DE REGISTROS _____________________________________________

-- Insertamos clientes
INSERT INTO cliente (nombre_cliente, apellido_cliente, direccion, telefono, email) VALUES
('Juan', 'Pérez', 'Av. Siempre Viva 123', '555-1234', 'juan.perez@example.com'),
('María', 'Gómez', 'Calle Falsa 456', '555-5678', 'maria.gomez@example.com'),
('Carlos', 'López', 'Carrera 12 #34-56', '555-8765', 'carlos.lopez@example.com'),
('Ana', 'Martínez', 'Diagonal 78 #90-12', '555-3456', 'ana.martinez@example.com'),
('Luis', 'Rodríguez', 'Paseo del Prado 321', '555-4321', 'luis.rodriguez@example.com'),
('Sofía', 'Fernández', 'Calle Luna 789', '555-6789', 'sofia.fernandez@example.com'),
('Pedro', 'Sánchez', 'Av. Central 101', '555-1010', 'pedro.sanchez@example.com'),
('Laura', 'Díaz', 'Calle del Sol 202', '555-2020', 'laura.diaz@example.com'),
('Daniel', 'Torres', 'Plaza Mayor 303', '555-3030', 'daniel.torres@example.com'),
('Andrea', 'Morales', 'Calle Verde 404', '555-4040', 'andrea.morales@example.com'),
('Javier', 'Ortega', 'Calle Azul 505', '555-5050', 'javier.ortega@example.com'),
('Carolina', 'Mendoza', 'Camino Real 606', '555-6060', 'carolina.mendoza@example.com'),
('Miguel', 'Ruiz', 'Av. del Parque 707', '555-7070', 'miguel.ruiz@example.com'),
('Patricia', 'Herrera', 'Carrera 808', '555-8080', 'patricia.herrera@example.com'),
('Alejandro', 'Jiménez', 'Paseo del Río 909', '555-9090', 'alejandro.jimenez@example.com');

-- Insertamos marcas
INSERT INTO linea (nombre_linea, descripcion) VALUES
('Chanel', 'Marca de lujo francesa'),
('Dior', 'Marca francesa de moda y perfumes'),
('Calvin Klein', 'Marca de moda estadounidense'),
('Versace', 'Marca de lujo italiana'),
('Gucci', 'Marca italiana reconocida'),
('Burberry', 'Marca británica con elegancia clásica'),
('Hugo Boss', 'Marca alemana sofisticada'),
('Carolina Herrera', 'Marca de moda y fragancias'),
('Yves Saint Laurent', 'Marca francesa de alta costura'),
('Paco Rabanne', 'Diseñador con fragancias icónicas'),
('Lacoste', 'Marca deportiva y elegante'),
('Bvlgari', 'Marca de lujo italiana'),
('Givenchy', 'Marca de moda francesa'),
('Armani', 'Marca de lujo italiana'),
('Tom Ford', 'Diseñador estadounidense de prestigio');

-- Insertamos fragancias
INSERT INTO fragancia (nombre_fragancia, descripcion) VALUES
('Floral', 'Aroma con notas de flores'),
('Amaderada', 'Aroma con notas de madera y musgo'),
('Cítrica', 'Aroma con notas de frutas cítricas'),
('Oriental', 'Aroma especiado y exótico'),
('Frutal', 'Dulce y afrutado'),
('Fresca', 'Limpia y ligera'),
('Especiada', 'Notas picantes y cálidas'),
('Acuática', 'Notas marinas y frescas'),
('Dulce', 'Azucarada y envolvente'),
('Herbácea', 'Aromas de hierbas y verdes'),
('Almizclada', 'Sensual y sofisticada'),
('Gourmand', 'Notas de caramelo y chocolate'),
('Balsámica', 'Cálida y resinosa'),
('Verde', 'Aromas frescos y naturales'),
('Leñosa', 'Profunda y terrosa');

-- Insertamos notas olfativas
INSERT INTO nota_olfativa (nombre_nota, descripcion) VALUES
('Rosa', 'Dulce y floral'),
('Sándalo', 'Madera cálida y cremosa'),
('Bergamota', 'Cítrico fresco y vibrante'),
('Vainilla', 'Dulce y especiada'),
('Jazmín', 'Floral y delicado'),
('Ámbar', 'Cálido y envolvente'),
('Coco', 'Dulce y tropical'),
('Canela', 'Especiada y cálida'),
('Patchouli', 'Terroso y profundo'),
('Madera de Cedro', 'Fresca y masculina'),
('Musk', 'Sensual y duradero'),
('Lavanda', 'Relajante y herbal'),
('Café', 'Intenso y envolvente'),
('Limón', 'Refrescante y chispeante'),
('Cereza', 'Afrutado y dulce');

-- Insertamos productos
INSERT INTO producto (id_linea, id_fragancia, id_nota, tamaño, tipo, stock) VALUES
(1, 1, 1, 100, 'Eau de Parfum', 50),
(2, 2, 2, 75, 'Eau de Toilette', 30),
(3, 3, 3, 50, 'Eau de Cologne', 20),
(4, 4, 4, 150, 'Eau de Parfum', 40),
(5, 5, 5, 200, 'Eau de Toilette', 25),
(6, 6, 6, 125, 'Eau de Parfum', 35),
(7, 7, 7, 80, 'Eau de Cologne', 15),
(8, 8, 8, 90, 'Eau de Parfum', 45),
(9, 9, 9, 110, 'Eau de Toilette', 20),
(10, 10, 10, 120, 'Eau de Parfum', 30),
(11, 11, 11, 70, 'Eau de Cologne', 18),
(12, 12, 12, 60, 'Eau de Toilette', 22),
(13, 13, 13, 130, 'Eau de Parfum', 50),
(14, 14, 14, 140, 'Eau de Toilette', 25),
(15, 15, 15, 95, 'Eau de Parfum', 40);

-- Insertamos ventas
INSERT INTO venta (fecha, id_cliente, total_venta) VALUES
('2024-02-01', 1, 120.50),
('2024-02-02', 2, 85.75),
('2024-02-03', 3, 150.00),
('2024-02-04', 4, 99.99),
('2024-02-05', 5, 180.00),
('2024-02-06', 6, 75.50),
('2024-02-07', 7, 200.00),
('2024-02-08', 8, 125.25),
('2024-02-09', 9, 95.75),
('2024-02-10', 10, 160.00),
('2024-02-11', 11, 110.30),
('2024-02-12', 12, 130.40),
('2024-02-13', 13, 140.50),
('2024-02-14', 14, 190.00),
('2024-02-15', 15, 99.99);

-- Insertamos detalles de ventas
INSERT INTO detalle_venta (id_venta, id_producto, cantidad_vendida, precio_unitario) VALUES
(1, 1, 1, 120.50),
(2, 2, 1, 85.75),
(3, 3, 2, 75.00),
(4, 4, 1, 99.99),
(5, 5, 1, 180.00),
(6, 6, 2, 37.75),
(7, 7, 1, 200.00),
(8, 8, 3, 41.75),
(9, 9, 2, 47.87),
(10, 10, 1, 160.00),
(11, 11, 1, 110.30),
(12, 12, 2, 65.20),
(13, 13, 1, 140.50),
(14, 14, 1, 190.00),
(15, 15, 2, 49.99);


-- ______________________________________________________________________________________________________
-- _________________ VISTAS _____________________________________________________________________________

-- primer vista: Ventas detalladas
CREATE VIEW ventas_detalladas AS
SELECT 
    v.id_venta,
    v.fecha,
    c.nombre_cliente,
    c.apellido_cliente,
    p.id_producto,
    l.nombre_linea AS lineas,
    f.nombre_fragancia AS fragancia,
    n.nombre_nota AS nota_olfativa,
    d.cantidad_vendida,
    d.precio_unitario,
    (d.cantidad_vendida * d.precio_unitario) AS total_por_producto
FROM venta v
JOIN cliente c ON v.id_cliente = c.id_cliente
JOIN detalle_venta d ON v.id_venta = d.id_venta
JOIN producto p ON d.id_producto = p.id_producto
JOIN linea l ON p.id_linea = l.id_linea
JOIN fragancia f ON p.id_fragancia = f.id_fragancia
JOIN nota_olfativa n ON p.id_nota = n.id_nota;

-- segunda vista: Productos en stock
CREATE VIEW productos_en_stock AS
SELECT 
    p.id_producto,
    l.nombre_linea AS lineas,
    f.nombre_fragancia AS fragancia,
    n.nombre_nota AS nota_olfativa,
    p.tamaño,
    p.tipo,
    p.stock
FROM producto p
JOIN linea l ON p.id_linea = l.id_linea
JOIN fragancia f ON p.id_fragancia = f.id_fragancia
JOIN nota_olfativa n ON p.id_nota = n.id_nota
WHERE p.stock > 0;

-- tercera vista: Clientes frecuentes
CREATE VIEW clientes_frecuentes AS
SELECT 
    c.id_cliente,
    c.nombre_cliente,
    c.apellido_cliente,
    c.telefono,
    c.email,
    COUNT(v.id_venta) AS total_compras,
    SUM(v.total_venta) AS monto_total_gastado
FROM cliente c
JOIN venta v ON c.id_cliente = v.id_cliente
GROUP BY c.id_cliente, c.nombre_cliente, c.apellido_cliente, c.telefono, c.email
HAVING COUNT(v.id_venta) > 0;


-- ______________________________________________________________________________________________________
-- ___________________ FUNCIONES ________________________________________________________________________

-- Funcion 1: Calcular total venta
-- SELECT calcular_total_venta(3);
DELIMITER //
CREATE FUNCTION calcular_total_venta(idVenta INT) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(10,2);

    SELECT SUM(cantidad_vendida * precio_unitario)
    INTO total
    FROM detalle_venta
    WHERE id_venta = idVenta;

    RETURN IFNULL(total, 0);
END //
DELIMITER ;

-- Funcion 2: Obtener el stock de productos
-- SELECT obtener_stock_producto(5);
DELIMITER //
CREATE FUNCTION obtener_stock_producto(idProducto INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE stock_disponible INT;

    SELECT stock INTO stock_disponible
    FROM producto
    WHERE id_producto = idProducto;

    RETURN IFNULL(stock_disponible, 0);
END //
DELIMITER ;


-- ______________________________________________________________________________________________________
-- ___________________ STORED PROCEDURE _________________________________________________________________

-- ___ Primer stored: REGISTRAR VENTA
-- ejemplo para utilizar
-- CALL registrar_venta(3, 250.00, '[{"id_producto": 1, "cantidad": 2, "precio_unitario": 100.00}, {"id_producto": 5, "cantidad": 1, "precio_unitario": 50.00}]');
-- consultemos la tabla venta SELECT * FROM VENTA (si habiamos insertado 15 registros, con este deberían ser 16)
DELIMITER //
CREATE PROCEDURE registrar_venta(
    IN p_id_cliente INT,
    IN p_total_venta DECIMAL(10,2),
    IN p_productos JSON
)
BEGIN
    DECLARE v_id_venta INT;
    DECLARE v_id_producto INT;
    DECLARE v_cantidad INT;
    DECLARE v_precio_unitario DECIMAL(10,2);
    DECLARE i INT DEFAULT 0;

    -- Insertamos la venta
    INSERT INTO venta (fecha, id_cliente, total_venta)
    VALUES (CURDATE(), p_id_cliente, p_total_venta);

    -- Obtenemos el ID de la venta recién creada
    SET v_id_venta = LAST_INSERT_ID();

    -- Iteramos sobre el JSON de productos y registramos los detalles de venta
    WHILE i < JSON_LENGTH(p_productos) DO
        SET v_id_producto = JSON_UNQUOTE(JSON_EXTRACT(p_productos, CONCAT('$[', i, '].id_producto')));
        SET v_cantidad = JSON_UNQUOTE(JSON_EXTRACT(p_productos, CONCAT('$[', i, '].cantidad')));
        SET v_precio_unitario = JSON_UNQUOTE(JSON_EXTRACT(p_productos, CONCAT('$[', i, '].precio_unitario')));

        -- Insertamos detalle de venta
        INSERT INTO detalle_venta (id_venta, id_producto, cantidad_vendida, precio_unitario)
        VALUES (v_id_venta, v_id_producto, v_cantidad, v_precio_unitario);

        -- Actualizamos stock del producto
        UPDATE producto
        SET stock = stock - v_cantidad
        WHERE id_producto = v_id_producto;

        SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

-- ___ Segundo stored: ACTUALIZAR STOCK DE PRODUCTO
-- 

DELIMITER //
CREATE PROCEDURE actualizar_stock_producto(
    IN p_id_producto INT,
    IN p_nuevo_stock INT
)
BEGIN
    UPDATE producto
    SET stock = p_nuevo_stock
    WHERE id_producto = p_id_producto;
END //
DELIMITER ;
