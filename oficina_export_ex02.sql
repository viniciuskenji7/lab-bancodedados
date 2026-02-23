-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: oficina
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.24-MariaDB

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
-- Table structure for table `fabricante`
--

DROP TABLE IF EXISTS `fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fabricante` (
  `id_fabricante` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `responsavel` varchar(100) NOT NULL,
  PRIMARY KEY (`id_fabricante`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabricante`
--

LOCK TABLES `fabricante` WRITE;
/*!40000 ALTER TABLE `fabricante` DISABLE KEYS */;
/*!40000 ALTER TABLE `fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maquina`
--

DROP TABLE IF EXISTS `maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maquina` (
  `id_registro` int(11) NOT NULL AUTO_INCREMENT,
  `ano_fabricacao` varchar(4) NOT NULL,
  `horas_uso` time NOT NULL,
  `codigo_modelo` bigint(20) NOT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `maquina` (`codigo_modelo`),
  CONSTRAINT `maquina` FOREIGN KEY (`codigo_modelo`) REFERENCES `modelo` (`codigo_modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maquina`
--

LOCK TABLES `maquina` WRITE;
/*!40000 ALTER TABLE `maquina` DISABLE KEYS */;
/*!40000 ALTER TABLE `maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo` (
  `codigo_modelo` bigint(20) NOT NULL,
  `tipo_modelo` varchar(50) NOT NULL,
  `peso` decimal(10,2) DEFAULT 1.00,
  `codigo_fabricante` int(11) NOT NULL,
  `hora_teste` time NOT NULL,
  PRIMARY KEY (`codigo_modelo`),
  KEY `modelo` (`codigo_fabricante`),
  CONSTRAINT `modelo` FOREIGN KEY (`codigo_fabricante`) REFERENCES `fabricante` (`id_fabricante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo_oficina`
--

DROP TABLE IF EXISTS `modelo_oficina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo_oficina` (
  `codigo_modelo` bigint(20) NOT NULL,
  `id_oficina` int(11) NOT NULL,
  PRIMARY KEY (`codigo_modelo`,`id_oficina`),
  KEY `fk_ofi` (`id_oficina`),
  CONSTRAINT `fk_mod` FOREIGN KEY (`codigo_modelo`) REFERENCES `modelo` (`codigo_modelo`),
  CONSTRAINT `fk_ofi` FOREIGN KEY (`id_oficina`) REFERENCES `oficina` (`id_oficina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo_oficina`
--

LOCK TABLES `modelo_oficina` WRITE;
/*!40000 ALTER TABLE `modelo_oficina` DISABLE KEYS */;
/*!40000 ALTER TABLE `modelo_oficina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oficina`
--

DROP TABLE IF EXISTS `oficina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oficina` (
  `id_oficina` int(11) NOT NULL AUTO_INCREMENT,
  `cnpj` varchar(14) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `responsavel` varchar(100) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id_oficina`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oficina`
--

LOCK TABLES `oficina` WRITE;
/*!40000 ALTER TABLE `oficina` DISABLE KEYS */;
/*!40000 ALTER TABLE `oficina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico`
--

DROP TABLE IF EXISTS `tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnico` (
  `codigo_funcional` int(11) NOT NULL AUTO_INCREMENT,
  `endereco` varchar(100) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `qualificacao` varchar(50) NOT NULL,
  `codigo_oficina` int(11) NOT NULL,
  PRIMARY KEY (`codigo_funcional`),
  KEY `tecnico` (`codigo_oficina`),
  CONSTRAINT `tecnico` FOREIGN KEY (`codigo_oficina`) REFERENCES `oficina` (`id_oficina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico`
--

LOCK TABLES `tecnico` WRITE;
/*!40000 ALTER TABLE `tecnico` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tecnico_modelo`
--

DROP TABLE IF EXISTS `tecnico_modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnico_modelo` (
  `codigo_funcional` int(11) NOT NULL,
  `codigo_modelo` bigint(20) NOT NULL,
  PRIMARY KEY (`codigo_funcional`,`codigo_modelo`),
  KEY `fk_codigo_modelo` (`codigo_modelo`),
  CONSTRAINT `fk_codigo_funcional` FOREIGN KEY (`codigo_funcional`) REFERENCES `tecnico` (`codigo_funcional`),
  CONSTRAINT `fk_codigo_modelo` FOREIGN KEY (`codigo_modelo`) REFERENCES `modelo` (`codigo_modelo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tecnico_modelo`
--

LOCK TABLES `tecnico_modelo` WRITE;
/*!40000 ALTER TABLE `tecnico_modelo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tecnico_modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teste`
--

DROP TABLE IF EXISTS `teste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teste` (
  `id_teste` int(11) NOT NULL AUTO_INCREMENT,
  `id_oficina` int(11) NOT NULL,
  `id_tecnico` int(11) NOT NULL,
  `pontuacao` bigint(20) NOT NULL,
  `resultado` bigint(20) NOT NULL,
  `recomendacoes` varchar(100) NOT NULL,
  PRIMARY KEY (`id_teste`),
  KEY `fk_teste_oficina` (`id_oficina`),
  KEY `fk_teste_tecnico` (`id_tecnico`),
  CONSTRAINT `fk_teste_oficina` FOREIGN KEY (`id_oficina`) REFERENCES `oficina` (`id_oficina`),
  CONSTRAINT `fk_teste_tecnico` FOREIGN KEY (`id_tecnico`) REFERENCES `tecnico` (`codigo_funcional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teste`
--

LOCK TABLES `teste` WRITE;
/*!40000 ALTER TABLE `teste` DISABLE KEYS */;
/*!40000 ALTER TABLE `teste` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-23 14:44:45
