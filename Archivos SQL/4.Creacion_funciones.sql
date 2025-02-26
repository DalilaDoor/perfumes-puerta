-- ______________________________________________________________________________________________________
-- ___________________ FUNCIONES ________________________________________________________________________

-- Funcion 1: Calcular total venta
-- SELECT calcular_total_venta(3);
DELIMITER //
CREATE FUNCTION fn_calcular_total_venta(idVenta INT) RETURNS DECIMAL(10,2)
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
CREATE FUNCTION fn_obtener_stock_producto(idProducto INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE stock_disponible INT;

    SELECT stock INTO stock_disponible
    FROM producto
    WHERE id_producto = idProducto;

    RETURN IFNULL(stock_disponible, 0);
END //
DELIMITER ;