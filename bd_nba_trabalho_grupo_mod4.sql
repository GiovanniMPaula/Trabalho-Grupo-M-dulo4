CREATE DATABASE  IF NOT EXISTS `db_sistema` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_sistema`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: db_sistema
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `games` (
  `Game_id` int NOT NULL AUTO_INCREMENT,
  `Game_date_est` date NOT NULL,
  `Game_status_text` char(5) NOT NULL,
  `Home_team_id` int NOT NULL,
  `Visitor_team_id` int NOT NULL,
  `Season` year NOT NULL,
  `PTS_home` int NOT NULL,
  `FG_PCT_home` float NOT NULL,
  `FT_PCT_home` float NOT NULL,
  `FG3_PCT_home` float NOT NULL,
  `AST_home` int NOT NULL,
  `REB_home` int NOT NULL,
  `PTS_visitor` int NOT NULL,
  `FG_PCT_visitor` float NOT NULL,
  `FT_PCT_visitor` float NOT NULL,
  `FG3_PCT_visitor` float NOT NULL,
  `AST_visitor` int NOT NULL,
  `REB_visitor` int NOT NULL,
  `Home_team_wins` binary(1) DEFAULT NULL,
  PRIMARY KEY (`Game_id`),
  UNIQUE KEY `Game_id_UNIQUE` (`Game_id`),
  UNIQUE KEY `Home_team_id_UNIQUE` (`Home_team_id`),
  UNIQUE KEY `Visitor_team_id_UNIQUE` (`Visitor_team_id`),
  CONSTRAINT `fk_game_teams` FOREIGN KEY (`Home_team_id`) REFERENCES `teams` (`Team_id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `player` (
  `Player_id` int NOT NULL AUTO_INCREMENT,
  `Player_name` varchar(45) NOT NULL,
  `Team_id` int NOT NULL,
  `season` varchar(4) NOT NULL,
  PRIMARY KEY (`Player_id`),
  UNIQUE KEY `Player_id_UNIQUE` (`Player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ranking`
--

DROP TABLE IF EXISTS `ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ranking` (
  `Team_id` int NOT NULL AUTO_INCREMENT,
  `Team` varchar(100) NOT NULL,
  `League_id` varchar(2) DEFAULT NULL,
  `Season` year NOT NULL,
  `Standingdate` date DEFAULT NULL,
  `Conference` char(50) DEFAULT NULL,
  `G` int DEFAULT NULL,
  `W` int DEFAULT NULL,
  `L` int DEFAULT NULL,
  `W_PCT` float DEFAULT NULL,
  `Home_Record` varchar(30) DEFAULT NULL,
  `Road_Record` varchar(30) DEFAULT NULL,
  UNIQUE KEY `Team_id_UNIQUE` (`Team_id`),
  CONSTRAINT `fk_ranking_teams` FOREIGN KEY (`Team_id`) REFERENCES `teams` (`Team_id`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ranking`
--

LOCK TABLES `ranking` WRITE;
/*!40000 ALTER TABLE `ranking` DISABLE KEYS */;
/*!40000 ALTER TABLE `ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `Team_id` int NOT NULL AUTO_INCREMENT,
  `League_id` varchar(2) DEFAULT NULL,
  `Nickname` varchar(50) NOT NULL,
  `Abbreviation` varchar(3) NOT NULL,
  `Yearfounded` year NOT NULL,
  `City` varchar(100) NOT NULL,
  `Arena` varchar(100) NOT NULL,
  `ArenaCapacity` int NOT NULL,
  `Owner` varchar(100) NOT NULL,
  `GeneralManager` varchar(100) NOT NULL,
  `Headcoach` varchar(100) NOT NULL,
  PRIMARY KEY (`Team_id`),
  UNIQUE KEY `Team_id_UNIQUE` (`Team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-18  0:01:32
