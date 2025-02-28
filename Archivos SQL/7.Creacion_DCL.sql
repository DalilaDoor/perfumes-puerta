-- ______________________________________________________________________________________________________
-- ___________________ DCL ______________________________________________________________________________

-- Creamos un usuario
create user if not exists 'usuario1'@'localhost' IDENTIFIED BY 'contraseña_2025';
-- verificamos que se haya creado
SHOW GRANTS FOR 'usuario1'@'localhost';

-- 1_OTORGAMOS PERMISO AL ESQUEMA DEL PROYECTO "PERFUMES"
grant all on perfumes.* to 'usuario1'@'localhost';

-- 2_REVOCAMOS PERMISOS DEL USUARIO GENERADO
REVOKE INSERT, UPDATE, DELETE ON *.* FROM 'usuario1'@'localhost';