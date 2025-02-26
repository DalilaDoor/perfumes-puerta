-- ______________________________________________________________________________________________________
-- ___________________ STORED PROCEDURE _________________________________________________________________

-- ___ Primer stored: REGISTRAR VENTA
-- Inserta una venta y sus detalles en la base de datos, actualizando el stock de los productos vendidos.
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
-- Modifica manualmente el stock de un producto en el inventario.
-- ejemplo a utilizar
-- CALL actualizar_stock_producto(2, 100);
-- consultemos la tabla, SELECT * FROM producto
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