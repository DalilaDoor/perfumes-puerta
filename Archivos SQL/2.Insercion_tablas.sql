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