-- MySQL dump 10.13  Distrib 8.0.15, for macos10.14 (x86_64)
--
-- Host: localhost    Database: STUDENT
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Mark_info`
--

DROP TABLE IF EXISTS `Mark_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Mark_info` (
  `Mark_id` int(11) NOT NULL AUTO_INCREMENT,
  `EC1` int(11) DEFAULT NULL,
  `EC2` int(11) DEFAULT NULL,
  `EC3` int(11) DEFAULT NULL,
  `EC4` int(11) DEFAULT NULL,
  `EC5` int(11) DEFAULT NULL,
  `StudentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Mark_id`),
  KEY `StudentId` (`StudentId`),
  CONSTRAINT `mark_info_ibfk_1` FOREIGN KEY (`StudentId`) REFERENCES `student_details` (`StudentId`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mark_info`
--

LOCK TABLES `Mark_info` WRITE;
/*!40000 ALTER TABLE `Mark_info` DISABLE KEYS */;
INSERT INTO `Mark_info` VALUES (200,50,55,28,30,35,1),(201,45,55,80,30,20,2),(202,45,55,85,40,60,3),(203,25,35,20,26,60,4);
/*!40000 ALTER TABLE `Mark_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Student_Details`
--

DROP TABLE IF EXISTS `Student_Details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `Student_Details` (
  `StudentId` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(40) DEFAULT NULL,
  `LastName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`StudentId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Student_Details`
--

LOCK TABLES `Student_Details` WRITE;
/*!40000 ALTER TABLE `Student_Details` DISABLE KEYS */;
INSERT INTO `Student_Details` VALUES (1,'Vijesh','E'),(2,'Libin','Babu'),(3,'Thej','Kiran'),(4,'Sumesh','P');
/*!40000 ALTER TABLE `Student_Details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-15 10:01:18
