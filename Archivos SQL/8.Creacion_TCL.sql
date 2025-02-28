-- ______________________________________________________________________________________________________
-- ___________________ TCL ______________________________________________________________________________

-- 1_PRIMER TCL: SAVEPOINT y ROLLBACK TO SAVEPOINT

-- Este ejemplo crea puntos de guardado dentro de una transacción, 
-- permitiendo deshacer solo una parte de los cambios sin afectar toda la transacción
START TRANSACTION;

INSERT INTO venta (fecha, id_cliente, total_venta) 
VALUES ('2025-02-27', 4, 300.00);

SAVEPOINT antes_de_detalle; -- Guardamos un punto antes de insertar detalles

INSERT INTO detalle_venta (id_venta, id_producto, cantidad_vendida, precio_unitario) 
VALUES (LAST_INSERT_ID(), 3, 2, 150.00);

-- Si algo sale mal, deshacemos solo los detalles de la venta
ROLLBACK TO SAVEPOINT antes_de_detalle;

COMMIT; -- Confirmamos la venta sin los detalles

-- ________________________________________________________________________________

-- 2_ SEGUNDO TCL: SAVEPOINT, COMMIT
-- Ejmplo para manejar actualizaciones y revertir solo una parte de la transacción

-- Iniciamos una transacción
START TRANSACTION;

-- Actualizamos el stock de algunos productos
UPDATE producto SET stock = stock - 1 WHERE id_producto = 1;  -- Producto 1
UPDATE producto SET stock = stock - 2 WHERE id_producto = 2;  -- Producto 2

-- Creamos un punto de guardado después de las actualizaciones exitosas
SAVEPOINT punto_actualizacion;

-- Intentamos actualizar un producto que no tiene suficiente stock
UPDATE producto SET stock = stock - 10 WHERE id_producto = 3;  -- Producto 3, stock insuficiente

-- Como hubo un error (supongamos que el stock no es suficiente para la actualización), revertimos a punto_actualizacion
ROLLBACK TO SAVEPOINT punto_actualizacion;

-- Confirmamos la transacción, los cambios hasta el punto de guardado son efectivos
COMMIT;