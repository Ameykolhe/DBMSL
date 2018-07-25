-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: localhost    Database: te3144db
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu18.04.1

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
-- Table structure for table `Department`
--

DROP TABLE IF EXISTS `Department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Department` (
  `dId` int(11) NOT NULL,
  `dName` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`dId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Department`
--

LOCK TABLES `Department` WRITE;
/*!40000 ALTER TABLE `Department` DISABLE KEYS */;
INSERT INTO `Department` VALUES (1,'Comp'),(2,'IT'),(3,'ENTC'),(4,'Mech');
/*!40000 ALTER TABLE `Department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Professor`
--

DROP TABLE IF EXISTS `Professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Professor` (
  `pId` int(11) NOT NULL,
  `FName` varchar(20) DEFAULT NULL,
  `LName` varchar(20) DEFAULT NULL,
  `dId` int(11) DEFAULT NULL,
  `designation` varchar(20) DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `DOJ` date DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `city` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pId`),
  KEY `dId` (`dId`),
  CONSTRAINT `Professor_ibfk_1` FOREIGN KEY (`dId`) REFERENCES `Department` (`dId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Professor`
--

LOCK TABLES `Professor` WRITE;
/*!40000 ALTER TABLE `Professor` DISABLE KEYS */;
INSERT INTO `Professor` VALUES (10001,'Amey','Kolhe',1,'Assistant Professor',30000,'2015-01-01','ameykolhe@gmail.com','8957265358','Pune'),(10002,'Akash','Patil',1,'Assistant Professor',60000,'2015-01-30','patilakash@pict.edu','8957242358','Pune'),(10003,'Pratik','Patil',1,'Assistant Professor',50000,'2015-07-21','pratikpatil@pict.edu','8957243333','Pune'),(10004,'Saurabh','Bora',2,'Assistant Professor',10000,'2015-07-12','saurabhbora11@pict.edu','8957222233','Pune'),(10005,'Aditya','Mahadalkar',3,'Assistant Professor',40000,'2016-06-22','adityam@pict.edu','9996121233','Pune'),(10006,'Mandar','Pande',3,'Assistant Professor',40000,'2016-07-31','mandarpande@pict.edu','3336121233','Pune'),(10007,'Atharva','Dharmadhikari',2,'Assistant Professor',20000,'2016-07-12','dharmya@pict.edu','9689921233','Mumbai'),(10008,'Aniket','Gokhale',2,'Assistant Professor',30000,'2016-09-12','aniketgokhale@pict.edu','9689927235','Mumbai'),(10009,'Aniket','Kotalwar',3,'Assistant Professor',30000,'2016-01-01','kotalwaraniket@live.com','9421163395','Newyork'),(10010,'Sanket','Pokar',1,'Assistant Professor',10000,'2016-03-12','madsanket@pict.edu','9689211221','Pune');
/*!40000 ALTER TABLE `Professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shift`
--

DROP TABLE IF EXISTS `Shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Shift` (
  `pId` int(11) DEFAULT NULL,
  `shift` varchar(10) DEFAULT NULL,
  `workingHours` int(11) DEFAULT NULL,
  KEY `pId` (`pId`),
  CONSTRAINT `Shift_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `Professor` (`pId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shift`
--

LOCK TABLES `Shift` WRITE;
/*!40000 ALTER TABLE `Shift` DISABLE KEYS */;
INSERT INTO `Shift` VALUES (10001,'First',1),(10002,'First',2),(10003,'First',3),(10004,'First',4),(10005,'First',5),(10006,'Second',6),(10007,'Second',7),(10008,'Second',8),(10009,'Second',9),(10010,'Second',10);
/*!40000 ALTER TABLE `Shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Works`
--

DROP TABLE IF EXISTS `Works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Works` (
  `pId` int(11) DEFAULT NULL,
  `dId` int(11) DEFAULT NULL,
  `Duration` date DEFAULT NULL,
  KEY `pId` (`pId`),
  KEY `dId` (`dId`),
  CONSTRAINT `Works_ibfk_1` FOREIGN KEY (`pId`) REFERENCES `Professor` (`pId`) ON DELETE CASCADE,
  CONSTRAINT `Works_ibfk_2` FOREIGN KEY (`dId`) REFERENCES `Department` (`dId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Works`
--

LOCK TABLES `Works` WRITE;
/*!40000 ALTER TABLE `Works` DISABLE KEYS */;
INSERT INTO `Works` VALUES (10001,1,'0000-00-00'),(10002,1,'0000-00-00'),(10003,1,'0000-00-00'),(10004,2,'0000-00-00'),(10005,3,'0000-00-00'),(10006,3,'0000-00-00'),(10007,2,'0000-00-00'),(10008,2,'0000-00-00'),(10009,3,'0000-00-00'),(10010,1,'0000-00-00');
/*!40000 ALTER TABLE `Works` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-25 23:40:29
