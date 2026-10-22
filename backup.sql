-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: nexcell_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `activo` bit(1) NOT NULL,
  `dni` varchar(15) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `apellido` varchar(255) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `altura` varchar(255) DEFAULT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `provincia` varchar(255) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (_binary '','29876543','3794987654','jromero_82@yahoo.com','Romero','Javier',NULL,NULL,NULL,NULL,NULL,NULL),(_binary '','34567890','3794123456','lucas.fernandez@gmail.com','Fernández','Lucas','2150','9 de Julio','Capital','Corrientes',NULL,NULL),(_binary '','36987123','3794112233','flor.acosta@gmail.com','Acosta','Florencia',NULL,NULL,NULL,NULL,NULL,NULL),(_binary '','41234567','3794654321','maria.gimenez@hotmail.com','Giménez','asdsadsadsad','','','','Corrientes','2026-01-01',NULL),(_binary '','42111333','3794559988','gonza.diaz@gmail.com','Díaz','Gonzalo',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_ventas`
--

DROP TABLE IF EXISTS `detalle_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_ventas` (
  `cantidad` int NOT NULL,
  `subtotal` double NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `producto_id` bigint NOT NULL,
  `venta_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnunx2ycrr6jfyphwmmifo6lgx` (`producto_id`),
  KEY `FK2dn1sdhrbmva44wbs9fy6l7mn` (`venta_id`),
  CONSTRAINT `FK2dn1sdhrbmva44wbs9fy6l7mn` FOREIGN KEY (`venta_id`) REFERENCES `ventas` (`id`),
  CONSTRAINT `FKnunx2ycrr6jfyphwmmifo6lgx` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_ventas`
--

LOCK TABLES `detalle_ventas` WRITE;
/*!40000 ALTER TABLE `detalle_ventas` DISABLE KEYS */;
INSERT INTO `detalle_ventas` VALUES (2,1900000,1,6,1),(1,8500,2,19,1),(1,1400000,3,5,1),(1,2176900,4,1,2),(3,54000,5,14,2),(1,45000,6,13,3),(3,6530700,7,1,4),(3,1579500,8,4,4),(2,17000,9,16,5),(1,950000,10,6,5),(2,4200000,11,10,5),(2,17000,12,17,5),(1,2176900,13,1,6),(3,25500,14,20,6),(2,17000,15,16,6),(3,1050000,16,12,7),(1,1771900,17,2,7),(1,8500,18,19,8),(2,36000,19,14,8),(1,18000,20,14,9),(2,17000,21,19,9),(3,1050000,22,12,9),(3,4200000,23,5,9),(2,17000,24,17,10),(2,2200000,25,11,10),(1,2100000,26,10,11),(1,8500,27,15,11),(1,8500,28,16,11),(3,6530700,29,1,11),(3,3600000,30,7,12),(3,2850000,31,6,13),(1,480000,32,9,13),(3,54000,33,14,13),(1,420000,34,8,14),(1,8500,35,15,14),(1,350000,36,12,14),(1,1771900,37,2,15),(1,420000,38,8,15),(2,1900000,39,6,15),(1,950000,40,6,15),(1,2100000,41,10,16),(3,6530700,42,1,17),(1,2176900,43,1,17),(1,1100000,44,11,17),(1,8500,45,20,17),(2,2400000,46,7,18),(1,8500,47,20,18),(1,480000,48,9,19),(2,17000,49,19,20),(2,4200000,50,10,20),(3,6300000,51,10,21),(3,1440000,52,9,21),(3,2850000,53,6,22),(2,4200000,54,10,22),(3,1579500,55,4,23),(3,1260000,56,8,23),(1,1100000,57,11,23),(3,1260000,58,8,24),(1,350000,59,12,24),(2,4200000,60,10,25),(2,2800000,61,5,25),(1,420000,62,8,26),(3,4200000,63,5,26),(3,135000,64,13,26),(2,840000,65,8,27),(1,8500,66,15,28),(1,1100000,67,11,28),(2,17000,68,18,29),(3,5315700,69,2,29),(2,960000,70,9,29),(3,25500,71,15,29),(2,4353800,72,1,30),(3,1579500,73,4,30),(2,840000,74,8,30),(3,3300000,75,11,30),(1,8500,76,15,31),(2,17000,77,19,31),(3,3300000,78,11,32),(3,2850000,79,6,32),(3,1579500,80,4,32),(1,18000,81,14,32),(2,17000,82,20,33),(2,700000,83,12,33),(1,2176900,84,1,33),(3,2850000,85,6,33),(1,8500,86,15,34),(3,135000,87,13,34),(3,6948300,88,3,35),(3,1050000,89,12,35),(1,1100000,90,11,36),(3,5315700,91,2,36),(1,420000,92,8,36),(2,17000,93,20,36),(3,6300000,94,10,37),(3,25500,95,20,37),(2,36000,96,14,37),(2,2400000,97,7,38),(3,25500,98,15,38),(3,135000,99,13,39),(1,480000,100,9,39),(3,25500,101,18,39),(1,8500,102,16,39),(1,2100000,103,10,40),(1,8500,104,20,41),(1,2100000,105,10,41),(3,135000,106,13,41),(3,6300000,107,10,41),(1,8500,108,20,42),(2,4353800,109,1,42),(3,5315700,110,2,42),(3,6948300,111,3,42),(3,6948300,112,3,43),(2,700000,113,12,44),(1,480000,114,9,45),(2,1053000,115,4,45),(2,4200000,116,10,46),(1,8500,117,16,46),(1,2316100,118,3,46),(3,6948300,119,3,46),(1,950000,120,6,47),(1,1400000,121,5,47),(2,17000,122,16,48),(1,45000,123,13,48),(3,1050000,124,12,48),(1,1200000,125,7,49),(2,960000,126,9,50),(3,25500,127,20,50),(1,950000,128,6,50),(3,1440000,129,9,50);
/*!40000 ALTER TABLE `detalle_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `descuento` double NOT NULL,
  `estado` bit(1) NOT NULL,
  `precio` double NOT NULL,
  `stock` int NOT NULL,
  `fecha_creacion` datetime(6) DEFAULT NULL,
  `fecha_modificacion` datetime(6) DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `marca` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `rutaImagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (0,_binary '',2176900,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',1,'Smartphone','iPhone 15 Pro Max Apple','Apple','Iphone 15 Pro Max',NULL),(0,_binary '',1771900,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',2,'Smartphone','Samsung Galaxy S25 Ultra','Samsung','Samsung S25 Ultra',NULL),(0,_binary '',2316100,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',3,'Smartphone','Xiaomi Poco F7','Xiaomi','Poco F7',NULL),(0,_binary '',526500,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',4,'Smartphone','Motorola Edge 60 Pro','Motorola','Motorola Edge 60 Pro',NULL),(0,_binary '',1400000,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',5,'Smartphone','Apple Iphone 14','Apple','Iphone 14',NULL),(0,_binary '',950000,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',6,'Smartphone','Apple Iphone 12','Apple','Iphone 12',NULL),(0,_binary '',1200000,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',7,'Smartphone','Motorola Razr 40','Motorola','Motorola Razr 40',NULL),(0,_binary '',420000,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',8,'Smartphone','Motorola G56','Motorola','Motorola G56',NULL),(0,_binary '',480000,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',9,'Smartphone','Motorola G84','Motorola','Motorola G84',NULL),(0,_binary '',2100000,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',10,'Smartphone','Samsung Galaxy S26 Ultra','Samsung','Samsung Galaxy S26 Ultra',NULL),(0,_binary '',1100000,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',11,'Smartphone','Xiaomi Poco F8 Pro','Xiaomi','Xiaomi Poco F8 Pro',NULL),(0,_binary '',350000,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',12,'Smartphone','Xiaomi Redmi Note 14','Xiaomi','Xiaomi Redmi Note 14',NULL),(0,_binary '',45000,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',13,'Auricular','AirPods Apple','Apple','Apple AirPods (3ra generacion)',NULL),(0,_binary '',18000,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',14,'Accesorio','Cargador Samsung','Samsung','Cargador Samsung 25W',NULL),(0,_binary '',8500,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',15,'Accesorio','Funda para iPhone','Apple','Funda de silicona - iPhone 17',NULL),(0,_binary '',8500,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',16,'Auricular','Auriculares JBL vincha','JBL','Auriculares JBL',NULL),(0,_binary '',8500,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',17,'Auricular','Auriculares Apple vincha','Apple','Auriculares Apple',NULL),(0,_binary '',8500,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',18,'Parlante','Parlante JBL Charge 5','JBL','Parlante JBL Charge 5',NULL),(0,_binary '',8500,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',19,'Parlante','Parlante JBL Party Box','JBL','Parlante JBL Party Box',NULL),(0,_binary '',8500,50,'2026-10-04 16:12:29.387639','2026-10-04 16:12:29.387639',20,'SmartWatch','SmartWatch Samsung','Samsung','SmartWatch Samsung',NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `estado` bit(1) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rol` varchar(31) NOT NULL,
  `altura` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `calle` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `dni` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `provincia` varchar(255) DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_m2dvbwfge291euvmk6vkkocao` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (_binary '','1985-05-10','2026-10-04',1,'ADMIN','1050','Pérez','San Martin','Corrientes','11111111','juan@mail.com','Juan','123','Corrientes','juan'),(_binary '','1990-08-20','2026-10-04',2,'ADMIN','1423','Gómez','Junin','Corrientes','22222222','maria@mail.com','María','123','Corrientes','maria'),(_binary '','1982-12-05','2026-10-04',3,'ADMIN','850','López','Av. 3 de Abril','Corrientes','33333333','carlos@mail.com','Carlos','123','Corrientes','carlos'),(_binary '','1978-03-15','2026-10-04',4,'GERENTE','980','Martínez','Pellegrini','Corrientes','44444444','ana@mail.com','Ana','123','Corrientes','ana'),(_binary '','1995-07-25','2026-10-04',5,'VENDEDOR','1210','Sánchez','Salta','Corrientes','55555555','pedro@mail.com','Pedro','123','Corrientes','pedro'),(_binary '','1998-01-30','2026-10-04',6,'VENDEDOR','540','Fernández','Tucuman','Corrientes','66666666','lucia@mail.com','Lucía','123','Corrientes','lucia'),(_binary '','2000-11-11','2026-10-04',7,'VENDEDOR','1100','Ramírez','Buenos Aires','Corrientes','77777777','diego@mail.com','Diego','123','Corrientes','diego'),(_binary '','1996-04-18','2026-10-04',8,'VENDEDOR','732','Torres','San Lorenzo','Corrientes','88888888','sofia@mail.com','Sofía','123','Corrientes','sofia'),(_binary '','1993-09-09','2026-10-04',9,'VENDEDOR','645','Díaz','Santa Fe','Corrientes','99999999','martin@mail.com','Martín','123','Corrientes','martin'),(_binary '','1999-02-22','2026-10-04',10,'VENDEDOR','1300','Ruiz','Catamarca','Corrientes','10101010','elena@mail.com','Elena','123','Corrientes','elena');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `total` double NOT NULL,
  `fecha` datetime(6) DEFAULT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `usuario_id` bigint DEFAULT NULL,
  `cliente_dni` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK18iqe6twff2326xrkt9qs4jyt` (`cliente_dni`),
  KEY `FKco9r9xjcdqtgd4nvnnolsr6ei` (`usuario_id`),
  CONSTRAINT `FK18iqe6twff2326xrkt9qs4jyt` FOREIGN KEY (`cliente_dni`) REFERENCES `clientes` (`dni`),
  CONSTRAINT `FKco9r9xjcdqtgd4nvnnolsr6ei` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (3308500,'2026-10-02 08:12:29.585785',1,8,'34567890'),(2230900,'2026-05-17 11:12:29.603785',2,5,'34567890'),(45000,'2026-08-28 13:12:29.607785',3,10,'34567890'),(8110200,'2026-07-20 18:12:29.610783',4,8,'36987123'),(5184000,'2026-05-22 00:12:29.613783',5,8,'36987123'),(2219400,'2026-05-06 10:12:29.622786',6,8,'34567890'),(2821900,'2026-05-05 09:12:29.628785',7,9,'41234567'),(44500,'2026-07-05 09:12:29.632788',8,7,'42111333'),(5285000,'2026-07-28 01:12:29.637786',9,10,'29876543'),(2217000,'2026-07-16 09:12:29.643784',10,9,'42111333'),(8647700,'2026-09-28 11:12:29.646784',11,6,'42111333'),(3600000,'2026-05-29 09:12:29.651785',12,5,'41234567'),(3384000,'2026-04-08 17:12:29.654786',13,9,'41234567'),(778500,'2026-06-12 21:12:29.657784',14,8,'42111333'),(5041900,'2026-09-27 01:12:29.661784',15,6,'41234567'),(2100000,'2026-07-22 22:12:29.668784',16,7,'34567890'),(9816100,'2026-05-18 21:12:29.671786',17,6,'34567890'),(2408500,'2026-07-25 00:12:29.676785',18,8,'42111333'),(480000,'2026-09-12 12:12:29.679798',19,8,'34567890'),(4217000,'2026-06-13 10:12:29.682786',20,9,'42111333'),(7740000,'2026-09-27 05:12:29.685788',21,8,'34567890'),(7050000,'2026-08-02 08:12:29.688785',22,9,'42111333'),(3939500,'2026-05-25 18:12:29.690784',23,6,'42111333'),(1610000,'2026-06-23 07:12:29.694786',24,5,'42111333'),(7000000,'2026-10-03 20:12:29.696785',25,5,'36987123'),(4755000,'2026-06-09 12:12:29.698787',26,5,'34567890'),(840000,'2026-07-23 04:12:29.701788',27,5,'41234567'),(1108500,'2026-09-23 23:12:29.703787',28,7,'36987123'),(6318200,'2026-09-16 05:12:29.706787',29,8,'36987123'),(10073300,'2026-04-07 23:12:29.710787',30,7,'36987123'),(25500,'2026-05-07 12:12:29.714785',31,5,'41234567'),(7747500,'2026-05-26 18:12:29.716786',32,6,'41234567'),(5743900,'2026-06-13 14:12:29.720790',33,5,'36987123'),(143500,'2026-05-10 03:12:29.724785',34,9,'29876543'),(7998300,'2026-09-25 08:12:29.726785',35,8,'41234567'),(6852700,'2026-07-27 06:12:29.729814',36,10,'34567890'),(6361500,'2026-08-25 01:12:29.733782',37,10,'42111333'),(2425500,'2026-08-04 19:12:29.737784',38,8,'36987123'),(649000,'2026-08-29 15:12:29.739784',39,6,'29876543'),(2100000,'2026-07-22 11:12:29.744786',40,7,'42111333'),(8543500,'2026-08-15 21:12:29.746784',41,10,'34567890'),(16626300,'2026-05-11 07:12:29.749783',42,7,'41234567'),(6948300,'2026-04-27 09:12:29.753784',43,10,'41234567'),(700000,'2026-08-15 02:12:29.755786',44,7,'36987123'),(1533000,'2026-06-23 12:12:29.757793',45,9,'29876543'),(13472900,'2026-06-20 16:12:29.760782',46,10,'41234567'),(2350000,'2026-05-14 08:12:29.763787',47,8,'42111333'),(1112000,'2026-07-10 20:12:29.766788',48,8,'29876543'),(1200000,'2026-06-08 00:12:29.769785',49,6,'36987123'),(3375500,'2026-04-27 04:12:29.771784',50,7,'34567890');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-11 21:24:31
