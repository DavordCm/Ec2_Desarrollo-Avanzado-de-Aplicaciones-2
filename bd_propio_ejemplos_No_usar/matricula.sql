-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: matricula
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `apertura`
--

DROP TABLE IF EXISTS `apertura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apertura` (
  `uid` varchar(40) NOT NULL,
  `uid_curso` varchar(40) DEFAULT NULL,
  `uid_profesor` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `uid_curso` (`uid_curso`),
  KEY `uid_profesor` (`uid_profesor`),
  CONSTRAINT `apertura_ibfk_1` FOREIGN KEY (`uid_curso`) REFERENCES `curso` (`uid`),
  CONSTRAINT `apertura_ibfk_2` FOREIGN KEY (`uid_profesor`) REFERENCES `profesor` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apertura`
--

LOCK TABLES `apertura` WRITE;
/*!40000 ALTER TABLE `apertura` DISABLE KEYS */;
INSERT INTO `apertura` VALUES ('APER001','CURS001','PROF001'),('APER002','CURS002','PROF001'),('APER003','CURS003','PROF002'),('APER004','CURS004','PROF002'),('APER005','CURS005','PROF001');
/*!40000 ALTER TABLE `apertura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apertura_detalle`
--

DROP TABLE IF EXISTS `apertura_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apertura_detalle` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid_apertura` varchar(40) DEFAULT NULL,
  `uid_alumno` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid_apertura` (`uid_apertura`),
  KEY `uid_alumno` (`uid_alumno`),
  CONSTRAINT `apertura_detalle_ibfk_1` FOREIGN KEY (`uid_apertura`) REFERENCES `apertura` (`uid`),
  CONSTRAINT `apertura_detalle_ibfk_2` FOREIGN KEY (`uid_alumno`) REFERENCES `student` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apertura_detalle`
--

LOCK TABLES `apertura_detalle` WRITE;
/*!40000 ALTER TABLE `apertura_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `apertura_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `apertura_detalle_seq`
--

DROP TABLE IF EXISTS `apertura_detalle_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apertura_detalle_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `apertura_detalle_seq`
--

LOCK TABLES `apertura_detalle_seq` WRITE;
/*!40000 ALTER TABLE `apertura_detalle_seq` DISABLE KEYS */;
INSERT INTO `apertura_detalle_seq` VALUES (1);
/*!40000 ALTER TABLE `apertura_detalle_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso` (
  `uid` varchar(40) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `ciclo` varchar(5) DEFAULT NULL,
  `carrera` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES ('CURS001','Programación Básica','I','Ingeniería de Sistemas'),('CURS002','Algoritmos y Estructuras de Datos','II','Ingeniería de Sistemas'),('CURS003','Programación Orientada a Objetos','III','Ingeniería de Software'),('CURS004','Bases de Datos','III','Ingeniería de Software'),('CURS005','Desarrollo Web','IV','Ingeniería de Sistemas');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profesor` (
  `uid` varchar(40) NOT NULL,
  `nro_documento` varchar(30) DEFAULT NULL,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `correo` varchar(60) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `activo` int DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES ('PROF001','12345678','Juan','Pérez','987654321','juan.perez@idat.edu.pe','',1),('PROF002','87654321','María','Gómez','912345678','maria.gomez@idat.edu.pe','',1);
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `uid` varchar(40) NOT NULL,
  `nro_documento` varchar(30) DEFAULT NULL,
  `nombres` varchar(60) DEFAULT NULL,
  `apellidos` varchar(60) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `correo` varchar(60) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `activo` int DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-23 17:44:44
