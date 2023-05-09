CREATE DATABASE  IF NOT EXISTS `watersystem` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `watersystem`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: watersystem
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
-- Table structure for table `alerta`
--

DROP TABLE IF EXISTS `alerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `m3` int DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `residencia` int DEFAULT NULL,
  `periodo` int DEFAULT NULL,
  `valor_periodo` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `residencia` (`residencia`),
  KEY `periodo` (`periodo`),
  CONSTRAINT `alerta_ibfk_1` FOREIGN KEY (`residencia`) REFERENCES `residencia` (`id`),
  CONSTRAINT `alerta_ibfk_2` FOREIGN KEY (`periodo`) REFERENCES `periodo_consumo_alerta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerta`
--

LOCK TABLES `alerta` WRITE;
/*!40000 ALTER TABLE `alerta` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumo`
--

DROP TABLE IF EXISTS `consumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `h_inicial` time DEFAULT NULL,
  `h_final` time DEFAULT NULL,
  `dias` int DEFAULT NULL,
  `residencia` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `residencia` (`residencia`),
  CONSTRAINT `consumo_ibfk_1` FOREIGN KEY (`residencia`) REFERENCES `residencia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumo`
--

LOCK TABLES `consumo` WRITE;
/*!40000 ALTER TABLE `consumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `consumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_consumo`
--

DROP TABLE IF EXISTS `historico_consumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_consumo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datahora` datetime DEFAULT NULL,
  `m3` int DEFAULT NULL,
  `residencia` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `residencia` (`residencia`),
  CONSTRAINT `historico_consumo_ibfk_1` FOREIGN KEY (`residencia`) REFERENCES `residencia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_consumo`
--

LOCK TABLES `historico_consumo` WRITE;
/*!40000 ALTER TABLE `historico_consumo` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_consumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historico_tarifa`
--

DROP TABLE IF EXISTS `historico_tarifa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico_tarifa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `valor` decimal(10,2) DEFAULT NULL,
  `mes` varchar(255) DEFAULT NULL,
  `historico_consumo` int DEFAULT NULL,
  `residencia` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `historico_consumo` (`historico_consumo`),
  KEY `residencia` (`residencia`),
  CONSTRAINT `historico_tarifa_ibfk_1` FOREIGN KEY (`historico_consumo`) REFERENCES `historico_consumo` (`id`),
  CONSTRAINT `historico_tarifa_ibfk_2` FOREIGN KEY (`residencia`) REFERENCES `residencia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico_tarifa`
--

LOCK TABLES `historico_tarifa` WRITE;
/*!40000 ALTER TABLE `historico_tarifa` DISABLE KEYS */;
/*!40000 ALTER TABLE `historico_tarifa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo_consumo_alerta`
--

DROP TABLE IF EXISTS `periodo_consumo_alerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodo_consumo_alerta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `periodo` date DEFAULT NULL,
  `horas` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo_consumo_alerta`
--

LOCK TABLES `periodo_consumo_alerta` WRITE;
/*!40000 ALTER TABLE `periodo_consumo_alerta` DISABLE KEYS */;
/*!40000 ALTER TABLE `periodo_consumo_alerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `residencia`
--

DROP TABLE IF EXISTS `residencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `residencia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `complemento` varchar(255) DEFAULT NULL,
  `apelido` varchar(255) DEFAULT NULL,
  `usuario` int DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario` (`usuario`),
  CONSTRAINT `residencia_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`cpf`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `residencia`
--

LOCK TABLES `residencia` WRITE;
/*!40000 ALTER TABLE `residencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `residencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `cpf` int NOT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `idade` int DEFAULT NULL,
  `categoria` int DEFAULT NULL,
  PRIMARY KEY (`cpf`),
  KEY `categoria` (`categoria`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vazamento`
--

DROP TABLE IF EXISTS `vazamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vazamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `datahora` datetime DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `consumo` int DEFAULT NULL,
  `residencia` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consumo` (`consumo`),
  KEY `residencia` (`residencia`),
  CONSTRAINT `vazamento_ibfk_1` FOREIGN KEY (`consumo`) REFERENCES `consumo` (`id`),
  CONSTRAINT `vazamento_ibfk_2` FOREIGN KEY (`residencia`) REFERENCES `residencia` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vazamento`
--

LOCK TABLES `vazamento` WRITE;
/*!40000 ALTER TABLE `vazamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `vazamento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-08 21:15:53
