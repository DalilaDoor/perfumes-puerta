-- ______________________________________________________________________________________________________
-- ___________________ TRIGGERS _________________________________________________________________________

-- __ Primer trigger: before_insert_detalle_venta
-- Evita ventas con stock insuficiente. Ejemplo
-- SELECT id_producto, stock FROM producto WHERE id_producto = 1;
-- INSERT INTO detalle_venta (id_venta, id_producto, cantidad_vendida, precio_unitario)
-- VALUES (1, 1, 60, 120.50);
-- resultado = Error Code: 1644. No hay suficiente stock para completar la venta
DELIMITER //
CREATE TRIGGER before_insert_detalle_venta
BEFORE INSERT ON detalle_venta
FOR EACH ROW
BEGIN
    DECLARE stock_disponible INT;

    -- Obtener el stock actual del producto
    SELECT stock INTO stock_disponible
    FROM producto
    WHERE id_producto = NEW.id_producto;

    -- Verificar si hay suficiente stock
    IF stock_disponible < NEW.cantidad_vendida THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hay suficiente stock para completar la venta';
    END IF;
END;
//
DELIMITER ;

-- __ Segundo trigger: after_insert_detalle_venta
-- Actualiza el total de la venta después de insertar un detalle de venta. ejemplo
-- SELECT * FROM venta WHERE id_venta = 1;
-- INSERT INTO detalle_venta (id_venta, id_producto, cantidad_vendida, precio_unitario)
-- VALUES (1, 2, 2, 85.75);
-- SELECT * FROM venta WHERE id_venta = 1;
DELIMITER //
CREATE TRIGGER after_insert_detalle_venta
AFTER INSERT ON detalle_venta
FOR EACH ROW
BEGIN
    -- Actualizar el total de la venta sumando los productos vendidos
    UPDATE venta
    SET total_venta = (SELECT SUM(cantidad_vendida * precio_unitario) FROM detalle_venta WHERE id_venta = NEW.id_venta)
    WHERE id_venta = NEW.id_venta;
END;
//
DELIMITER ;