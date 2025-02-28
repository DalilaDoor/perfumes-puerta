-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: perfumes
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(50) NOT NULL,
  `apellido_cliente` varchar(30) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan','Pérez','Av. Siempre Viva 123','555-1234','juan.perez@example.com'),(2,'María','Gómez','Calle Falsa 456','555-5678','maria.gomez@example.com'),(3,'Carlos','López','Carrera 12 #34-56','555-8765','carlos.lopez@example.com'),(4,'Ana','Martínez','Diagonal 78 #90-12','555-3456','ana.martinez@example.com'),(5,'Luis','Rodríguez','Paseo del Prado 321','555-4321','luis.rodriguez@example.com'),(6,'Sofía','Fernández','Calle Luna 789','555-6789','sofia.fernandez@example.com'),(7,'Pedro','Sánchez','Av. Central 101','555-1010','pedro.sanchez@example.com'),(8,'Laura','Díaz','Calle del Sol 202','555-2020','laura.diaz@example.com'),(9,'Daniel','Torres','Plaza Mayor 303','555-3030','daniel.torres@example.com'),(10,'Andrea','Morales','Calle Verde 404','555-4040','andrea.morales@example.com'),(11,'Javier','Ortega','Calle Azul 505','555-5050','javier.ortega@example.com'),(12,'Carolina','Mendoza','Camino Real 606','555-6060','carolina.mendoza@example.com'),(13,'Miguel','Ruiz','Av. del Parque 707','555-7070','miguel.ruiz@example.com'),(14,'Patricia','Herrera','Carrera 808','555-8080','patricia.herrera@example.com'),(15,'Alejandro','Jiménez','Paseo del Río 909','555-9090','alejandro.jimenez@example.com');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_venta`
--

DROP TABLE IF EXISTS `detalle_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_venta` (
  `id_detalle` int NOT NULL AUTO_INCREMENT,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad_vendida` int NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_venta` (`id_venta`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `venta` (`id_venta`),
  CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_venta`
--

LOCK TABLES `detalle_venta` WRITE;
/*!40000 ALTER TABLE `detalle_venta` DISABLE KEYS */;
INSERT INTO `detalle_venta` VALUES (1,1,1,1,120.50),(2,2,2,1,85.75),(3,3,3,2,75.00),(4,4,4,1,99.99),(5,5,5,1,180.00),(6,6,6,2,37.75),(7,7,7,1,200.00),(8,8,8,3,41.75),(9,9,9,2,47.87),(10,10,10,1,160.00),(11,11,11,1,110.30),(12,12,12,2,65.20),(13,13,13,1,140.50),(14,14,14,1,190.00),(15,15,15,2,49.99);
/*!40000 ALTER TABLE `detalle_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fragancia`
--

DROP TABLE IF EXISTS `fragancia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fragancia` (
  `id_fragancia` int NOT NULL AUTO_INCREMENT,
  `nombre_fragancia` varchar(60) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_fragancia`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragancia`
--

LOCK TABLES `fragancia` WRITE;
/*!40000 ALTER TABLE `fragancia` DISABLE KEYS */;
INSERT INTO `fragancia` VALUES (1,'Floral','Aroma con notas de flores'),(2,'Amaderada','Aroma con notas de madera y musgo'),(3,'Cítrica','Aroma con notas de frutas cítricas'),(4,'Oriental','Aroma especiado y exótico'),(5,'Frutal','Dulce y afrutado'),(6,'Fresca','Limpia y ligera'),(7,'Especiada','Notas picantes y cálidas'),(8,'Acuática','Notas marinas y frescas'),(9,'Dulce','Azucarada y envolvente'),(10,'Herbácea','Aromas de hierbas y verdes'),(11,'Almizclada','Sensual y sofisticada'),(12,'Gourmand','Notas de caramelo y chocolate'),(13,'Balsámica','Cálida y resinosa'),(14,'Verde','Aromas frescos y naturales'),(15,'Leñosa','Profunda y terrosa');
/*!40000 ALTER TABLE `fragancia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linea`
--

DROP TABLE IF EXISTS `linea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `linea` (
  `id_linea` int NOT NULL AUTO_INCREMENT,
  `nombre_linea` varchar(50) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_linea`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linea`
--

LOCK TABLES `linea` WRITE;
/*!40000 ALTER TABLE `linea` DISABLE KEYS */;
INSERT INTO `linea` VALUES (1,'Chanel','Marca de lujo francesa'),(2,'Dior','Marca francesa de moda y perfumes'),(3,'Calvin Klein','Marca de moda estadounidense'),(4,'Versace','Marca de lujo italiana'),(5,'Gucci','Marca italiana reconocida'),(6,'Burberry','Marca británica con elegancia clásica'),(7,'Hugo Boss','Marca alemana sofisticada'),(8,'Carolina Herrera','Marca de moda y fragancias'),(9,'Yves Saint Laurent','Marca francesa de alta costura'),(10,'Paco Rabanne','Diseñador con fragancias icónicas'),(11,'Lacoste','Marca deportiva y elegante'),(12,'Bvlgari','Marca de lujo italiana'),(13,'Givenchy','Marca de moda francesa'),(14,'Armani','Marca de lujo italiana'),(15,'Tom Ford','Diseñador estadounidense de prestigio');
/*!40000 ALTER TABLE `linea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota_olfativa`
--

DROP TABLE IF EXISTS `nota_olfativa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nota_olfativa` (
  `id_nota` int NOT NULL AUTO_INCREMENT,
  `nombre_nota` varchar(60) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_nota`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota_olfativa`
--

LOCK TABLES `nota_olfativa` WRITE;
/*!40000 ALTER TABLE `nota_olfativa` DISABLE KEYS */;
INSERT INTO `nota_olfativa` VALUES (1,'Rosa','Dulce y floral'),(2,'Sándalo','Madera cálida y cremosa'),(3,'Bergamota','Cítrico fresco y vibrante'),(4,'Vainilla','Dulce y especiada'),(5,'Jazmín','Floral y delicado'),(6,'Ámbar','Cálido y envolvente'),(7,'Coco','Dulce y tropical'),(8,'Canela','Especiada y cálida'),(9,'Patchouli','Terroso y profundo'),(10,'Madera de Cedro','Fresca y masculina'),(11,'Musk','Sensual y duradero'),(12,'Lavanda','Relajante y herbal'),(13,'Café','Intenso y envolvente'),(14,'Limón','Refrescante y chispeante'),(15,'Cereza','Afrutado y dulce');
/*!40000 ALTER TABLE `nota_olfativa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_linea` int NOT NULL,
  `id_fragancia` int NOT NULL,
  `id_nota` int NOT NULL,
  `tamaño` int NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_linea` (`id_linea`),
  KEY `id_fragancia` (`id_fragancia`),
  KEY `id_nota` (`id_nota`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_linea`) REFERENCES `linea` (`id_linea`),
  CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`id_fragancia`) REFERENCES `fragancia` (`id_fragancia`),
  CONSTRAINT `producto_ibfk_3` FOREIGN KEY (`id_nota`) REFERENCES `nota_olfativa` (`id_nota`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,1,1,1,100,'Eau de Parfum',49),(2,2,2,2,75,'Eau de Toilette',28),(3,3,3,3,50,'Eau de Cologne',20),(4,4,4,4,150,'Eau de Parfum',40),(5,5,5,5,200,'Eau de Toilette',25),(6,6,6,6,125,'Eau de Parfum',35),(7,7,7,7,80,'Eau de Cologne',15),(8,8,8,8,90,'Eau de Parfum',45),(9,9,9,9,110,'Eau de Toilette',20),(10,10,10,10,120,'Eau de Parfum',30),(11,11,11,11,70,'Eau de Cologne',18),(12,12,12,12,60,'Eau de Toilette',22),(13,13,13,13,130,'Eau de Parfum',50),(14,14,14,14,140,'Eau de Toilette',25),(15,15,15,15,95,'Eau de Parfum',40);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `id_cliente` int NOT NULL,
  `total_venta` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,'2024-02-01',1,120.50),(2,'2024-02-02',2,85.75),(3,'2024-02-03',3,150.00),(4,'2024-02-04',4,99.99),(5,'2024-02-05',5,180.00),(6,'2024-02-06',6,75.50),(7,'2024-02-07',7,200.00),(8,'2024-02-08',8,125.25),(9,'2024-02-09',9,95.75),(10,'2024-02-10',10,160.00),(11,'2024-02-11',11,110.30),(12,'2024-02-12',12,130.40),(13,'2024-02-13',13,140.50),(14,'2024-02-14',14,190.00),(15,'2024-02-15',15,99.99),(16,'2025-02-27',4,300.00);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_clientes_frecuentes`
--

DROP TABLE IF EXISTS `vw_clientes_frecuentes`;
/*!50001 DROP VIEW IF EXISTS `vw_clientes_frecuentes`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_clientes_frecuentes` AS SELECT 
 1 AS `id_cliente`,
 1 AS `nombre_cliente`,
 1 AS `apellido_cliente`,
 1 AS `telefono`,
 1 AS `email`,
 1 AS `total_compras`,
 1 AS `monto_total_gastado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_productos_en_stock`
--

DROP TABLE IF EXISTS `vw_productos_en_stock`;
/*!50001 DROP VIEW IF EXISTS `vw_productos_en_stock`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_productos_en_stock` AS SELECT 
 1 AS `id_producto`,
 1 AS `lineas`,
 1 AS `fragancia`,
 1 AS `nota_olfativa`,
 1 AS `tamaño`,
 1 AS `tipo`,
 1 AS `stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ventas_detalladas`
--

DROP TABLE IF EXISTS `vw_ventas_detalladas`;
/*!50001 DROP VIEW IF EXISTS `vw_ventas_detalladas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ventas_detalladas` AS SELECT 
 1 AS `id_venta`,
 1 AS `fecha`,
 1 AS `nombre_cliente`,
 1 AS `apellido_cliente`,
 1 AS `id_producto`,
 1 AS `lineas`,
 1 AS `fragancia`,
 1 AS `nota_olfativa`,
 1 AS `cantidad_vendida`,
 1 AS `precio_unitario`,
 1 AS `total_por_producto`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_clientes_frecuentes`
--

/*!50001 DROP VIEW IF EXISTS `vw_clientes_frecuentes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_clientes_frecuentes` AS select `c`.`id_cliente` AS `id_cliente`,`c`.`nombre_cliente` AS `nombre_cliente`,`c`.`apellido_cliente` AS `apellido_cliente`,`c`.`telefono` AS `telefono`,`c`.`email` AS `email`,count(`v`.`id_venta`) AS `total_compras`,sum(`v`.`total_venta`) AS `monto_total_gastado` from (`cliente` `c` join `venta` `v` on((`c`.`id_cliente` = `v`.`id_cliente`))) group by `c`.`id_cliente`,`c`.`nombre_cliente`,`c`.`apellido_cliente`,`c`.`telefono`,`c`.`email` having (count(`v`.`id_venta`) > 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_productos_en_stock`
--

/*!50001 DROP VIEW IF EXISTS `vw_productos_en_stock`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_productos_en_stock` AS select `p`.`id_producto` AS `id_producto`,`l`.`nombre_linea` AS `lineas`,`f`.`nombre_fragancia` AS `fragancia`,`n`.`nombre_nota` AS `nota_olfativa`,`p`.`tamaño` AS `tamaño`,`p`.`tipo` AS `tipo`,`p`.`stock` AS `stock` from (((`producto` `p` join `linea` `l` on((`p`.`id_linea` = `l`.`id_linea`))) join `fragancia` `f` on((`p`.`id_fragancia` = `f`.`id_fragancia`))) join `nota_olfativa` `n` on((`p`.`id_nota` = `n`.`id_nota`))) where (`p`.`stock` > 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ventas_detalladas`
--

/*!50001 DROP VIEW IF EXISTS `vw_ventas_detalladas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ventas_detalladas` AS select `v`.`id_venta` AS `id_venta`,`v`.`fecha` AS `fecha`,`c`.`nombre_cliente` AS `nombre_cliente`,`c`.`apellido_cliente` AS `apellido_cliente`,`p`.`id_producto` AS `id_producto`,`l`.`nombre_linea` AS `lineas`,`f`.`nombre_fragancia` AS `fragancia`,`n`.`nombre_nota` AS `nota_olfativa`,`d`.`cantidad_vendida` AS `cantidad_vendida`,`d`.`precio_unitario` AS `precio_unitario`,(`d`.`cantidad_vendida` * `d`.`precio_unitario`) AS `total_por_producto` from ((((((`venta` `v` join `cliente` `c` on((`v`.`id_cliente` = `c`.`id_cliente`))) join `detalle_venta` `d` on((`v`.`id_venta` = `d`.`id_venta`))) join `producto` `p` on((`d`.`id_producto` = `p`.`id_producto`))) join `linea` `l` on((`p`.`id_linea` = `l`.`id_linea`))) join `fragancia` `f` on((`p`.`id_fragancia` = `f`.`id_fragancia`))) join `nota_olfativa` `n` on((`p`.`id_nota` = `n`.`id_nota`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-27 22:57:39
