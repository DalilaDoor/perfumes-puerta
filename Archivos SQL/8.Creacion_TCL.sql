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

-- 2_ SEGUNDO TCL: SET TRANSACTION y COMMIT
-- Este ejemplo configura el nivel de aislamiento de una transacción y la confirma
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
START TRANSACTION;

UPDATE producto 
SET stock = stock - 3 
WHERE id_producto = 7;

INSERT INTO detalle_venta (id_venta, id_producto, cantidad_vendida, precio_unitario) 
VALUES (21, 7, 3, 75.00);

COMMIT;