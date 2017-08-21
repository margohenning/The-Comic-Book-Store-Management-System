-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: comic
-- ------------------------------------------------------
-- Server version	5.7.11-enterprise-commercial-advanced-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `timestampdeletesale`
--

DROP TABLE IF EXISTS `timestampdeletesale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timestampdeletesale` (
  `TransactionName` varchar(50) NOT NULL,
  `timestampID` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `customerID` int(11) NOT NULL,
  `employeeID` int(11) NOT NULL,
  PRIMARY KEY (`timestampID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timestampdeletesale`
--

LOCK TABLES `timestampdeletesale` WRITE;
/*!40000 ALTER TABLE `timestampdeletesale` DISABLE KEYS */;
INSERT INTO `timestampdeletesale` VALUES ('DeleteSale',1,'2017-05-21 20:27:03',1,1),('DeleteSale',2,'2017-05-21 20:27:03',1,1),('DeleteSale',4,'2017-05-21 20:34:25',1,1),('DeleteSale',5,'2017-05-21 20:34:25',1,1),('DeleteSale',6,'2017-05-21 20:35:47',1,1),('DeleteSale',7,'2017-05-21 20:35:47',1,1),('DeleteSale',8,'2017-05-21 20:45:10',1,1),('DeleteSale',9,'2017-05-21 20:45:10',1,1),('DeleteSale',10,'2017-05-21 20:46:51',1,1),('DeleteSale',11,'2017-05-21 20:46:51',1,1),('DeleteSale',12,'2017-05-21 20:49:27',1,1),('DeleteSale',13,'2017-05-21 20:49:27',1,1);
/*!40000 ALTER TABLE `timestampdeletesale` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-22  1:54:13
