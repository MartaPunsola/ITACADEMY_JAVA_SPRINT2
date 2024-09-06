CREATE DATABASE  IF NOT EXISTS `spotify` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `spotify`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: spotify
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `id_album` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `year_of_publication` date DEFAULT NULL,
  `cover` blob,
  `artist_id` int NOT NULL,
  PRIMARY KEY (`id_album`),
  KEY `artist_idx` (`artist_id`),
  CONSTRAINT `artist` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id_artist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `id_artist` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `photo` blob,
  `artist_id` int NOT NULL,
  PRIMARY KEY (`id_artist`),
  KEY `artist_related_idx` (`artist_id`),
  CONSTRAINT `artist_related` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id_artist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `creditcard`
--

DROP TABLE IF EXISTS `creditcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `creditcard` (
  `id_creditcard` int NOT NULL AUTO_INCREMENT,
  `number` varchar(45) NOT NULL,
  `expiration_date` date NOT NULL,
  `CVV` int NOT NULL,
  `subscription_id` int NOT NULL,
  PRIMARY KEY (`id_creditcard`),
  KEY `creditcard_subs_idx` (`subscription_id`),
  CONSTRAINT `creditcard_subs` FOREIGN KEY (`subscription_id`) REFERENCES `premium_subscription` (`id_subscription`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `creditcard`
--

LOCK TABLES `creditcard` WRITE;
/*!40000 ALTER TABLE `creditcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourite_album`
--

DROP TABLE IF EXISTS `favourite_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourite_album` (
  `favourite_album_id` int NOT NULL,
  `album_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`favourite_album_id`),
  KEY `album_liked_idx` (`album_id`),
  KEY `user_likes_album_idx` (`user_id`),
  CONSTRAINT `album_liked` FOREIGN KEY (`album_id`) REFERENCES `album` (`id_album`),
  CONSTRAINT `user_likes_album` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourite_album`
--

LOCK TABLES `favourite_album` WRITE;
/*!40000 ALTER TABLE `favourite_album` DISABLE KEYS */;
/*!40000 ALTER TABLE `favourite_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourite_artist`
--

DROP TABLE IF EXISTS `favourite_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourite_artist` (
  `favourite_artist_id` int NOT NULL,
  `artist_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`favourite_artist_id`),
  KEY `artist_liked_idx` (`artist_id`),
  KEY `user_likes_artist_idx` (`user_id`),
  CONSTRAINT `artist_liked` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`id_artist`),
  CONSTRAINT `user_likes_artist` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourite_artist`
--

LOCK TABLES `favourite_artist` WRITE;
/*!40000 ALTER TABLE `favourite_artist` DISABLE KEYS */;
/*!40000 ALTER TABLE `favourite_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourite_song`
--

DROP TABLE IF EXISTS `favourite_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favourite_song` (
  `favourite_song_id` int NOT NULL,
  `song_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`favourite_song_id`),
  KEY `song_liked_idx` (`song_id`),
  KEY `user_likes_song_idx` (`user_id`),
  CONSTRAINT `song_liked` FOREIGN KEY (`song_id`) REFERENCES `song` (`id_song`),
  CONSTRAINT `user_likes_song` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourite_song`
--

LOCK TABLES `favourite_song` WRITE;
/*!40000 ALTER TABLE `favourite_song` DISABLE KEYS */;
/*!40000 ALTER TABLE `favourite_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id_payment` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `invoice_num` int NOT NULL,
  `total_price` float NOT NULL,
  `subscription_id` int NOT NULL,
  PRIMARY KEY (`id_payment`),
  KEY `payment_subs_idx` (`subscription_id`),
  CONSTRAINT `payment_subs` FOREIGN KEY (`subscription_id`) REFERENCES `premium_subscription` (`id_subscription`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal`
--

DROP TABLE IF EXISTS `paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paypal` (
  `id_paypal` int NOT NULL AUTO_INCREMENT,
  `username_paypal` varchar(45) NOT NULL,
  `subscription_id` int NOT NULL,
  PRIMARY KEY (`id_paypal`),
  KEY `paypal_subs_idx` (`subscription_id`),
  CONSTRAINT `paypal_subs` FOREIGN KEY (`subscription_id`) REFERENCES `premium_subscription` (`id_subscription`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal`
--

LOCK TABLES `paypal` WRITE;
/*!40000 ALTER TABLE `paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `id_playlist` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `total_songs` int DEFAULT NULL,
  `creation_date` date NOT NULL,
  `deletion_date` date DEFAULT NULL,
  `created_by_user_id` int NOT NULL,
  `song_added_id` int DEFAULT NULL,
  PRIMARY KEY (`id_playlist`),
  KEY `user_creates_playlist_idx` (`created_by_user_id`),
  KEY `song_added_playlist_idx` (`song_added_id`),
  CONSTRAINT `song_added_playlist` FOREIGN KEY (`song_added_id`) REFERENCES `song` (`id_song`),
  CONSTRAINT `user_creates_playlist` FOREIGN KEY (`created_by_user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premium_subscription`
--

DROP TABLE IF EXISTS `premium_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premium_subscription` (
  `id_subscription` int NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `renovation_date` date NOT NULL,
  `payment_method` enum('creditcard','paypal') NOT NULL,
  `id_user` int NOT NULL,
  PRIMARY KEY (`id_subscription`),
  UNIQUE KEY `id_user_UNIQUE` (`id_user`),
  CONSTRAINT `user_pays` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premium_subscription`
--

LOCK TABLES `premium_subscription` WRITE;
/*!40000 ALTER TABLE `premium_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `premium_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song` (
  `id_song` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `length` varchar(45) DEFAULT NULL,
  `num_views` int DEFAULT NULL,
  `album_id` int NOT NULL,
  PRIMARY KEY (`id_song`),
  KEY `album_idx` (`album_id`),
  CONSTRAINT `album` FOREIGN KEY (`album_id`) REFERENCES `album` (`id_album`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song_added`
--

DROP TABLE IF EXISTS `song_added`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song_added` (
  `id_song_added` int NOT NULL AUTO_INCREMENT,
  `addition_date` date NOT NULL,
  `user_adds_id` int NOT NULL,
  `song_id` int NOT NULL,
  `playlist_id` int NOT NULL,
  PRIMARY KEY (`id_song_added`),
  KEY `user_adds_idx` (`user_adds_id`),
  KEY `song_idx` (`song_id`),
  KEY `playlist_idx` (`playlist_id`),
  CONSTRAINT `playlist` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`id_playlist`),
  CONSTRAINT `song` FOREIGN KEY (`song_id`) REFERENCES `song` (`id_song`),
  CONSTRAINT `user_adds` FOREIGN KEY (`user_adds_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song_added`
--

LOCK TABLES `song_added` WRITE;
/*!40000 ALTER TABLE `song_added` DISABLE KEYS */;
/*!40000 ALTER TABLE `song_added` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` enum('free','premium') NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `postal_code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-03 11:16:34
