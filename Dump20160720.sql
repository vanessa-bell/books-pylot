-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: books
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (1,'Gabriel Garcia Marquez','2016-07-19 21:47:25','2016-07-19 21:47:25'),(2,'Anthony Doerr','2016-07-19 21:47:25','2016-07-19 21:47:25'),(17,'Vanessa Bell','2016-07-20 19:20:51','2016-07-20 19:20:51'),(20,'Dr Seuss','2016-07-20 19:41:25','2016-07-20 19:41:25'),(21,'chipmunk','2016-07-20 19:43:06','2016-07-20 19:43:06');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_books_authors1_idx` (`author_id`),
  CONSTRAINT `fk_books_authors1` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'One Hundred Years of Solitude',1,'2016-07-19 17:56:12','2016-07-19 17:56:12'),(2,'All the Light We Cannot See',2,'2016-07-19 17:59:30','2016-07-19 17:59:30'),(6,'Best Book Ever',20,'2016-07-20 19:41:25','2016-07-20 19:41:25'),(7,'Yet Another Book',21,'2016-07-20 19:43:06','2016-07-20 19:43:06'),(8,'Self Help 101',17,'2016-07-20 22:39:49','2016-07-20 22:39:49'),(12,'Love in the Time of Cholera',1,'2016-07-20 22:44:51','2016-07-20 22:44:51');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `review` varchar(45) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `book_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Reviews_books_idx` (`book_id`),
  KEY `fk_Reviews_users1_idx` (`user_id`),
  KEY `fk_Reviews_authors1_idx` (`author_id`),
  CONSTRAINT `fk_Reviews_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reviews_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'This is a fantastic novel.',5,1,4,1,'2016-07-19 17:43:12','2016-07-19 17:43:12'),(2,'A heartbreaking journey',4,2,4,2,'2016-07-19 18:00:17','2016-07-19 18:00:17'),(3,'I don\'t like this book',1,6,5,20,'2016-07-20 19:41:25','2016-07-20 19:41:25'),(4,'I enjoyed the darkness',4,7,5,21,'2016-07-20 19:43:06','2016-07-20 19:43:06'),(7,'let\'s try this again',1,1,5,1,'2016-07-20 20:23:15','2016-07-20 20:23:15'),(8,'This is an emotional rollercoaster',5,2,5,2,'2016-07-20 20:24:11','2016-07-20 20:24:11'),(9,'I really hate this book.',1,2,7,2,'2016-07-20 21:54:54','2016-07-20 21:54:54'),(10,'Hey, it\'s not so bad!',3,6,7,20,'2016-07-20 22:15:13','2016-07-20 22:15:13'),(11,'Amazing',5,8,7,17,'2016-07-20 22:39:49','2016-07-20 22:39:49'),(15,'An epic story',5,12,7,1,'2016-07-20 22:44:51','2016-07-20 22:44:51'),(19,'My all-time favorite novel.',5,12,5,1,'2016-07-20 23:35:12','2016-07-20 23:35:12');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `pw_hash` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'Billy Bob','Bill','bill@bill.com','$2b$12$itt.yRsR1KN1DCUcBnMhHOvRqprTnp9W6K5dDxkh37evMeFQKjXDu','2016-07-19 18:30:31','2016-07-19 18:30:31'),(5,'Vanessa Bell','Vanessa','vanessa.bell14@gmail.com','$2b$12$NkIr1o4.XqzV66K6xReV9eWPRdNDjt6SenGiZuE1qB1poJx0/SZfi','2016-07-19 21:01:04','2016-07-19 21:01:04'),(7,'Susie Jean','Susie','susie@susie.com','$2b$12$JhhL3ytEPUiiZ/uRW3XGAuH6qf7GDJG6Cu9f7hO/V1esE9MpIxcrO','2016-07-19 21:15:14','2016-07-19 21:15:14');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-20 23:42:47
