-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: localhost    Database: shogi
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) NOT NULL,
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Владивосток'),(2,'Хабаровск'),(3,'Москва'),(4,'Санкт-Петербург'),(5,'Находка'),(6,'Дальнегорск'),(7,'Амурск'),(8,'Симферополь');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `game` (
  `game_id` int NOT NULL AUTO_INCREMENT,
  `tour_id` int NOT NULL,
  `player1_id` int NOT NULL,
  `player2_id` int NOT NULL,
  `outcome` int DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  KEY `game_FK` (`player1_id`),
  KEY `game_FK_1` (`player2_id`),
  KEY `game_FK_2` (`tour_id`),
  CONSTRAINT `game_FK` FOREIGN KEY (`player1_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `game_FK_1` FOREIGN KEY (`player2_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `game_FK_2` FOREIGN KEY (`tour_id`) REFERENCES `tour` (`tour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `game`
--

LOCK TABLES `game` WRITE;
/*!40000 ALTER TABLE `game` DISABLE KEYS */;
/*!40000 ALTER TABLE `game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `player_id` int NOT NULL AUTO_INCREMENT,
  `player_name` varchar(100) NOT NULL,
  `city_id` int NOT NULL,
  `date_of_birth` date NOT NULL,
  `rating` int NOT NULL DEFAULT '1',
  `win_streak` int NOT NULL DEFAULT '0',
  `rank_id` int DEFAULT '1',
  PRIMARY KEY (`player_id`),
  KEY `player_FK` (`city_id`),
  KEY `player_rank_FK` (`rank_id`),
  CONSTRAINT `player_FK` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`),
  CONSTRAINT `player_rank_FK` FOREIGN KEY (`rank_id`) REFERENCES `rank` (`rank_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rank`
--

DROP TABLE IF EXISTS `rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rank` (
  `rank_id` int NOT NULL,
  `rank_name` varchar(100) NOT NULL,
  `LB` int NOT NULL,
  `MP` int NOT NULL,
  `UB` int NOT NULL,
  `#LB` int DEFAULT NULL,
  `#MP` int DEFAULT NULL,
  PRIMARY KEY (`rank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rank`
--

LOCK TABLES `rank` WRITE;
/*!40000 ALTER TABLE `rank` DISABLE KEYS */;
INSERT INTO `rank` VALUES (1,'20 кю',1,40,80,6,3),(2,'19 кю',80,120,160,6,3),(3,'18 кю',160,200,240,6,3),(4,'17 кю',240,280,320,6,3),(5,'16 кю',320,360,400,6,3),(6,'15 кю',400,440,480,6,3),(7,'14 кю',480,520,560,6,3),(8,'13 кю',560,600,640,6,3),(9,'12 кю',640,680,720,6,3),(10,'11 кю',720,760,800,8,4),(11,'10 кю',800,840,880,8,4),(12,'9 кю',880,920,960,8,4),(13,'8 кю',960,1000,1040,8,4),(14,'7 кю',1040,1080,1120,10,5),(15,'6 кю',1120,1160,1200,10,5),(16,'5 кю',1200,1240,1280,10,5),(17,'4 кю',1280,1320,1360,12,6),(18,'3 кю',1360,1410,1460,12,6),(19,'2 кю',1460,1510,1560,12,6),(20,'1 кю',1560,1620,1680,14,7),(21,'1 дан',1680,1740,1800,14,7),(22,'2 дан',1800,1860,1920,14,7),(23,'3 дан',1920,2000,2080,16,8),(24,'4 дан',2080,2160,2240,16,8),(25,'5 дан',2240,2340,2440,NULL,10),(26,'6 дан',2440,2540,2640,NULL,NULL);
/*!40000 ALTER TABLE `rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour` (
  `tour_id` int NOT NULL AUTO_INCREMENT,
  `tournament_id` int NOT NULL,
  `number` int NOT NULL,
  PRIMARY KEY (`tour_id`),
  KEY `tour_FK` (`tournament_id`),
  CONSTRAINT `tour_FK` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`tournament_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournament`
--

DROP TABLE IF EXISTS `tournament`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournament` (
  `tournament_id` int NOT NULL AUTO_INCREMENT,
  `tournament_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `city_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`tournament_id`),
  KEY `tornament_FK` (`city_id`),
  CONSTRAINT `tornament_FK` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament`
--

LOCK TABLES `tournament` WRITE;
/*!40000 ALTER TABLE `tournament` DISABLE KEYS */;
/*!40000 ALTER TABLE `tournament` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournament_player`
--

DROP TABLE IF EXISTS `tournament_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournament_player` (
  `tournament_player_id` int NOT NULL AUTO_INCREMENT,
  `player_id` int NOT NULL,
  `tournament_id` int NOT NULL,
  `points` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`tournament_player_id`),
  KEY `tournament_player_FK` (`player_id`),
  KEY `tournament_player_FK_1` (`tournament_id`),
  CONSTRAINT `tournament_player_FK` FOREIGN KEY (`player_id`) REFERENCES `player` (`player_id`),
  CONSTRAINT `tournament_player_FK_1` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`tournament_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournament_player`
--

LOCK TABLES `tournament_player` WRITE;
/*!40000 ALTER TABLE `tournament_player` DISABLE KEYS */;
/*!40000 ALTER TABLE `tournament_player` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-19 22:18:15
