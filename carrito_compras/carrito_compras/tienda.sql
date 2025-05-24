CREATE DATABASE  IF NOT EXISTS `tienda` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tienda`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: tienda
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `carrito`
--

DROP TABLE IF EXISTS `carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `producto_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrito`
--

LOCK TABLES `carrito` WRITE;
/*!40000 ALTER TABLE `carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `precio` decimal(10,2) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Laptop','Laptop gamer de alto rendimiento',15000.00,'imagenes/laptop.jpg'),(2,'Smartphone','Teléfono inteligente con buena cámara',8000.00,'imagenes/smartphone.jpg'),(3,'Tablet','Tablet para lectura y navegación',3000.00,'imagenes/tablet.jpg'),(4,'Auriculares Bluetooth','Auriculares inalámbricos con cancelación de ruido',1200.00,'imagenes/auriculares.jpg'),(5,'Smartwatch','Reloj inteligente compatible con Android y iOS',1500.00,'imagenes/smartwatch.jpg'),(6,'Monitor 4K','Monitor UHD de 27 pulgadas para diseño y gaming',4000.00,'imagenes/monitor4k.jpg'),(7,'Teclado Mecánico','Teclado mecánico retroiluminado RGB',850.00,'imagenes/teclador.jpg'),(8,'Mouse Gamer','Mouse ergonómico con 7 botones programables',450.00,'imagenes/mouse.jpg'),(9,'Router Wi-Fi 6','Router de última generación con velocidad ultra rápida',1300.00,'imagenes/router.jpg'),(10,'Cámara Web HD','Cámara web 1080p ideal para videollamadas',600.00,'imagenes/camara.jpg'),(11,'SSD 1TB','Unidad de estado sólido de 1TB NVMe',110.00,'imagenes/ssd.jpg'),(12,'Disco Duro Externo 2TB','Disco portátil para respaldo de datos',950.00,'imagenes/discoduro.jpg'),(13,'Impresora Multifunción','Impresora, escáner y copiadora inalámbrica',1500.00,'imagenes/impresora.jpg'),(14,'Cargador Inalámbrico','Base de carga rápida para celulares',300.00,'imagenes/cargador.jpg'),(15,'Tablet Gráfica','Tableta para diseño digital con lápiz',2000.00,'imagenes/tableta.jpg'),(16,'Dron con Cámara','Dron con cámara 4K y control remoto',3000.00,'imagenes/dron.jpg'),(17,'Altavoz Inteligente','Altavoz con asistente de voz integrado',700.00,'imagenes/altavoz.jpg'),(18,'Proyector Portátil','Mini proyector para presentaciones y películas',1800.00,'imagenes/proyector.jpg'),(19,'Luz LED para Streaming','Iluminación profesional para creadores de contenido',400.00,'imagenes/luzled.jpg'),(20,'Micrófono USB','Micrófono de condensador para podcast y streaming',900.00,'imagenes/microfono.jpg'),(21,'Controlador MIDI','Controlador para producción musical digital',1600.00,'imagenes/midi.jpg'),(22,'VR Headset','Casco de realidad virtual compatible con PC y consola',3500.00,'imagenes/vr.jpg'),(23,'Cámara de Seguridad','Cámara IP para monitoreo remoto',750.00,'imagenes/camaraseguridad.jpg'),(24,'Estabilizador para Celular','Gimbal de 3 ejes para grabación estable',1200.00,'imagenes/estabilizador.jpg'),(25,'Hub USB-C','Expansor de puertos para laptops modernas',500.00,'imagenes/hub.jpg'),(26,'Laptop Ultrabook','Laptop ligera con batería de larga duración',9500.00,'imagenes/ultrabook.jpg'),(27,'Pantalla Táctil Portátil','Pantalla externa con función táctil',2200.00,'imagenes/pantalla.jpg'),(28,'Repetidor Wi-Fi','Extensor de señal Wi-Fi de doble banda',3500.00,'imagenes/repetidor.jpg'),(29,'Soporte para Laptop','Base ajustable con ventilación',250.00,'imagenes/soporte.jpg'),(30,'Webcam 4K','Cámara web profesional para conferencias',1500.00,'imagenes/webcam.jpg');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'ismrcoah007@gmail.com','$2y$10$1AAWlzeFMFRt4RdcqPDDyuh.4IRViJ6mjrVEVqOWjgqKVXj7KEjFK');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'tienda'
--

--
-- Dumping routines for database 'tienda'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-22  9:49:31
