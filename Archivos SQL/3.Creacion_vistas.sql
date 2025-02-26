-- ______________________________________________________________________________________________________
-- _________________ VISTAS _____________________________________________________________________________

-- primer vista: Ventas detalladas
CREATE VIEW vw_ventas_detalladas AS
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
CREATE VIEW vw_productos_en_stock AS
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
CREATE VIEW vw_clientes_frecuentes AS
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