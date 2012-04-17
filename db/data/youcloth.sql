-- MySQL dump 10.13  Distrib 5.5.20, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: youcloth
-- ------------------------------------------------------
-- Server version	5.5.16

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
-- Current Database: `youcloth`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `youcloth` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `youcloth`;

--
-- Table structure for table `cloth_items`
--

DROP TABLE IF EXISTS `cloth_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloth_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_cloth_items_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloth_items`
--

LOCK TABLES `cloth_items` WRITE;
/*!40000 ALTER TABLE `cloth_items` DISABLE KEYS */;
INSERT INTO `cloth_items` VALUES (1,10,'양복정장',6000,'2012-03-19 06:55:13','2012-03-24 12:50:09'),(2,20,'양복상의',4000,'2012-03-19 06:55:57','2012-03-19 06:55:57'),(3,30,'바지',3000,'2012-03-19 06:56:19','2012-03-19 06:56:19'),(4,40,'코트',6000,'2012-03-19 06:59:20','2012-03-19 06:59:20'),(5,50,'반코트',6000,'2012-03-19 06:59:42','2012-03-19 06:59:42'),(6,60,'T셔츠',3000,'2012-03-19 07:00:24','2012-03-19 07:00:24'),(7,70,'Y셔츠',3000,'2012-03-19 07:00:35','2012-03-19 07:01:05'),(8,80,'잠바',6000,'2012-03-19 07:12:19','2012-03-19 07:12:19'),(9,90,'조끼',4000,'2012-03-19 07:14:43','2012-03-19 07:14:43'),(10,100,'한복',NULL,'2012-03-19 07:15:10','2012-03-19 07:15:10'),(11,110,'운동화',5000,'2012-03-19 07:15:50','2012-03-19 07:15:50'),(12,999,'기타',NULL,'2012-03-19 07:16:38','2012-03-19 07:16:38'),(13,120,'스커트',NULL,'2012-03-19 07:37:24','2012-03-19 07:37:24'),(14,130,'이불',10000,'2012-03-19 07:38:08','2012-03-19 07:38:08'),(15,75,'니트',3000,'2012-03-21 11:11:55','2012-03-21 11:11:55'),(16,140,'카펫',10000,'2012-03-21 23:23:04','2012-03-21 23:23:04'),(17,85,'가죽',NULL,'2012-03-21 23:24:29','2012-03-21 23:24:29'),(18,86,'무스탕',NULL,'2012-03-21 23:25:21','2012-03-21 23:25:21'),(19,990,'다림질',2000,'2012-03-21 23:27:13','2012-03-21 23:27:13'),(20,995,'빨래',NULL,'2012-03-21 23:28:30','2012-03-21 23:28:30'),(21,82,'츄리닝(운동복)',6000,'2012-03-24 12:56:39','2012-03-24 12:56:39'),(22,83,'원피스',5000,'2012-03-24 13:02:49','2012-03-24 13:02:49');
/*!40000 ALTER TABLE `cloth_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cloths`
--

DROP TABLE IF EXISTS `cloths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cloths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_price` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `repair` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `repair_price` int(11) DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `released_on` date DEFAULT NULL,
  `wash_id` int(11) DEFAULT NULL,
  `cloth_item_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cloths`
--

LOCK TABLES `cloths` WRITE;
/*!40000 ALTER TABLE `cloths` DISABLE KEYS */;
INSERT INTO `cloths` VALUES (4,6000,1,'',0,'입고',NULL,4,8,'2012-03-19 07:32:40','2012-03-19 07:32:40'),(8,4000,1,'',0,'입고',NULL,5,9,'2012-03-19 07:36:52','2012-03-19 07:40:37'),(9,3000,6,'',0,'입고',NULL,5,3,'2012-03-19 07:40:37','2012-03-19 07:40:37'),(10,6000,3,'',0,'입고',NULL,5,5,'2012-03-19 07:40:37','2012-03-19 07:40:37'),(11,0,2,'2벌',0,'입고',NULL,5,10,'2012-03-19 07:40:37','2012-03-19 07:40:37'),(12,3000,1,'',0,'입고',NULL,5,13,'2012-03-19 07:40:37','2012-03-19 07:40:37'),(13,3000,2,'',0,'입고',NULL,6,3,'2012-03-19 07:42:12','2012-03-19 07:42:12'),(14,3000,2,'',0,'입고',NULL,6,6,'2012-03-19 07:42:12','2012-03-19 07:42:12'),(15,4000,1,'',0,'입고',NULL,6,9,'2012-03-19 07:42:12','2012-03-19 07:42:12'),(16,4000,1,'',0,'입고',NULL,7,2,'2012-03-19 07:44:41','2012-03-19 07:44:41'),(17,3000,6,'',0,'입고',NULL,7,3,'2012-03-19 07:44:41','2012-03-19 07:44:41'),(18,3000,2,'',0,'입고',NULL,7,6,'2012-03-19 07:44:41','2012-03-19 07:44:41'),(19,6000,3,'',0,'입고',NULL,7,8,'2012-03-19 07:44:41','2012-03-19 07:44:41'),(20,0,1,'바지 통 줄임',5000,'입고',NULL,8,3,'2012-03-19 07:47:30','2012-03-19 07:47:30'),(21,6000,1,'',0,'입고',NULL,9,8,'2012-03-19 07:49:24','2012-03-19 07:49:24'),(25,3000,2,'',0,'입고',NULL,11,3,'2012-03-19 07:54:57','2012-03-21 11:32:35'),(27,6000,1,'',0,'입고',NULL,12,5,'2012-03-19 07:56:32','2012-03-19 07:56:32'),(28,5000,1,'선불',0,'입고',NULL,1,11,'2012-03-19 08:10:52','2012-03-19 08:10:52'),(29,6000,1,'',0,'입고',NULL,2,8,'2012-03-19 08:11:31','2012-03-19 08:11:31'),(30,6000,1,'',0,'입고',NULL,3,5,'2012-03-19 08:12:23','2012-03-19 08:12:23'),(31,5000,1,'',0,'입고',NULL,13,11,'2012-03-19 08:15:47','2012-03-19 08:15:47'),(32,5000,1,'',0,'입고',NULL,14,11,'2012-03-19 12:08:16','2012-03-19 12:08:16'),(33,0,19,'',0,'입고',NULL,14,12,'2012-03-19 12:08:16','2012-03-19 12:08:16'),(34,3000,1,'',0,'입고',NULL,15,6,'2012-03-19 12:11:03','2012-03-19 12:11:03'),(35,7000,1,'',0,'입고',NULL,16,1,'2012-03-21 11:11:02','2012-03-21 11:13:30'),(43,3000,1,'',0,'입고',NULL,16,6,'2012-03-21 11:12:32','2012-03-21 11:14:32'),(47,3000,3,'',0,'입고',NULL,16,7,'2012-03-21 11:13:30','2012-03-21 11:14:32'),(50,3000,2,'',0,'입고',NULL,16,3,'2012-03-21 11:14:31','2012-03-21 11:14:31'),(51,3000,1,'',0,'입고',NULL,16,15,'2012-03-21 11:14:32','2012-03-21 11:14:32'),(52,4000,1,'',0,'입고',NULL,16,9,'2012-03-21 11:14:32','2012-03-21 11:14:32'),(53,0,1,'손수건',0,'입고',NULL,16,12,'2012-03-21 11:14:32','2012-03-21 11:14:32'),(54,3000,1,'',0,'입고',NULL,17,3,'2012-03-21 11:17:27','2012-03-21 11:17:27'),(55,10000,2,'',0,'입고',NULL,17,14,'2012-03-21 11:17:27','2012-03-21 11:17:27'),(57,6000,1,'아기잠바',0,'입고',NULL,18,8,'2012-03-21 11:20:48','2012-03-21 11:20:48'),(60,4500,2,'',0,'입고',NULL,19,11,'2012-03-21 11:24:53','2012-03-21 11:24:53'),(61,7000,1,'',0,'출고완료',NULL,20,1,'2012-03-21 11:27:33','2012-03-24 12:41:09'),(64,3000,1,'바지 1 수선',4000,'입고',NULL,10,3,'2012-03-21 11:30:40','2012-03-21 11:30:40'),(65,6000,1,'',0,'입고',NULL,10,8,'2012-03-21 11:30:40','2012-03-21 11:30:40'),(66,6000,1,'',0,'입고',NULL,11,4,'2012-03-21 11:32:35','2012-03-21 11:32:35'),(67,3000,2,'',0,'입고',NULL,11,7,'2012-03-21 11:32:35','2012-03-21 11:32:35'),(68,0,1,'다림질',2000,'출고완료',NULL,20,7,'2012-03-24 12:41:09','2012-03-24 12:41:09'),(69,0,1,'아기잠바 수선',0,'출고완료',NULL,20,8,'2012-03-24 12:41:09','2012-03-24 12:41:09'),(71,1500,1,'다림질',0,'출고완료',NULL,21,3,'2012-03-24 12:45:25','2012-03-24 12:45:25'),(72,5000,1,'',0,'입고',NULL,22,11,'2012-03-24 12:47:12','2012-03-24 12:47:12'),(73,6000,1,'',0,'입고',NULL,23,1,'2012-03-24 12:48:36','2012-03-24 12:48:36'),(75,3000,1,'',0,'입고',NULL,23,15,'2012-03-24 12:49:46','2012-03-24 12:49:46'),(78,3000,4,'',0,'입고',NULL,24,15,'2012-03-24 12:51:30','2012-03-24 12:51:53'),(79,3000,1,'',0,'입고',NULL,24,3,'2012-03-24 12:51:53','2012-03-24 12:51:53'),(80,6000,1,'',0,'입고',NULL,24,8,'2012-03-24 12:51:53','2012-03-24 12:51:53'),(81,6000,1,'',0,'출고완료',NULL,25,1,'2012-03-24 12:55:28','2012-03-24 12:58:54'),(83,3000,1,'',0,'출고완료',NULL,25,7,'2012-03-24 12:58:54','2012-03-24 12:58:54'),(84,6000,1,'',0,'출고완료',NULL,25,21,'2012-03-24 12:58:54','2012-03-24 12:58:54'),(86,5000,1,'',0,'출고완료',NULL,26,22,'2012-03-24 13:05:17','2012-03-24 13:05:17'),(87,6000,1,'호주머니 수선',0,'입고',NULL,27,8,'2012-03-24 13:08:02','2012-03-24 13:08:02'),(88,6000,1,'',0,'출고완료',NULL,28,1,'2012-03-24 13:10:35','2012-03-24 13:11:24'),(90,6000,1,'',0,'출고완료',NULL,28,5,'2012-03-24 13:11:24','2012-03-24 13:11:24'),(91,0,5,'',0,'입고',NULL,29,12,'2012-03-24 13:13:20','2012-03-24 13:13:20'),(92,4000,1,'다림질',0,'출고완료',NULL,30,1,'2012-03-24 13:17:09','2012-03-24 13:18:01'),(94,2000,1,'',0,'출고완료',NULL,30,7,'2012-03-24 13:18:02','2012-03-24 13:18:02'),(96,0,1,'',5000,'출고완료',NULL,31,22,'2012-03-24 13:20:11','2012-03-24 13:20:11'),(97,3000,1,'',0,'입고',NULL,32,3,'2012-03-24 13:22:08','2012-03-24 13:22:08'),(98,5000,1,'',0,'입고',NULL,32,11,'2012-03-24 13:22:08','2012-03-24 13:22:08'),(99,0,8,'바지수선',24000,'입고',NULL,33,3,'2012-03-24 13:24:50','2012-03-24 13:24:50'),(104,3000,3,'바지2 수선',6000,'입고',NULL,34,3,'2012-03-24 13:29:43','2012-03-24 13:29:43'),(105,3000,3,'',0,'입고',NULL,34,15,'2012-03-24 13:29:43','2012-03-24 13:29:43'),(106,4000,1,'츄리닝 상의',0,'입고',NULL,34,21,'2012-03-24 13:29:43','2012-03-24 13:29:43'),(107,0,1,'모자',0,'입고',NULL,34,12,'2012-03-24 13:29:43','2012-03-24 13:29:43');
/*!40000 ALTER TABLE `cloths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_customers_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'usemodj','010-8131-3208','','','',NULL,2,'2012-03-19 06:51:39','2012-03-19 06:51:39'),(2,'정대민','','2857-2814','','',NULL,3,'2012-03-19 07:26:46','2012-03-19 07:26:46'),(3,'안수진','010-6689-8020','','','',NULL,4,'2012-03-19 07:28:37','2012-03-19 07:28:37'),(4,'건물 301호','','','','건물 301호',NULL,5,'2012-03-19 07:31:07','2012-03-19 07:31:07'),(5,'노친네','','','','',NULL,6,'2012-03-19 07:34:27','2012-03-19 07:34:27'),(6,'금방','','','','',NULL,7,'2012-03-19 07:41:11','2012-03-19 07:41:11'),(7,'몽실','','','','일동 621-2번지 501호',NULL,8,'2012-03-19 07:43:32','2012-03-19 07:43:32'),(8,'강동주','','','','',NULL,9,'2012-03-19 07:45:50','2012-03-19 07:45:50'),(9,'김한진','','','','',NULL,10,'2012-03-19 07:48:43','2012-03-19 07:48:43'),(10,'서정우','010-3017-3889','','','',NULL,11,'2012-03-19 07:50:19','2012-03-19 07:50:19'),(11,'성실부동산','','','','',NULL,12,'2012-03-19 07:53:02','2012-03-19 07:53:02'),(12,'김다슬','','408-0811','','',NULL,13,'2012-03-19 07:55:54','2012-03-19 07:55:54'),(13,'이하율','','','','',NULL,14,'2012-03-19 08:15:25','2012-03-19 08:15:25'),(14,'대성세탁소','010-9976-6647','031-416-3208','경기도 안산시 본오동 ','669-8 1층',NULL,15,'2012-03-19 08:32:51','2012-03-19 08:32:51'),(15,'청솔','','','','',NULL,16,'2012-03-19 12:07:17','2012-03-19 12:07:17'),(16,'설경우','','','','669-8',NULL,17,'2012-03-19 12:10:26','2012-03-19 12:10:26'),(17,'913-3 203','010-5533-8919','','본오동','913-3 203',NULL,18,'2012-03-21 11:01:38','2012-03-21 11:01:38'),(18,'715-8 302호','','070-8185-4474','본오동','715-8 302호',NULL,19,'2012-03-21 11:16:40','2012-03-21 11:16:40'),(19,'이효정','','','본오동','',NULL,20,'2012-03-21 11:19:53','2012-03-21 11:19:53'),(20,'가마솥 통닭','','','본오동','가마솥 통닭',NULL,21,'2012-03-21 11:22:34','2012-03-21 11:22:34'),(21,'하늘','','','','',NULL,22,'2012-03-24 12:42:55','2012-03-24 12:42:55'),(22,'오해자','010-9991-2315','','','',NULL,23,'2012-03-24 12:46:35','2012-03-24 12:46:35'),(23,'715-12 301호','010-7178-8601','','본오동','715-12 301호',NULL,24,'2012-03-24 12:54:01','2012-03-24 12:54:01'),(24,'장소망','010-7178-8601','','본오동','',NULL,25,'2012-03-24 13:00:43','2012-03-24 13:00:43'),(25,'박인혜','010-5159-9410','','본오동','',NULL,26,'2012-03-24 13:06:31','2012-03-24 13:06:31'),(26,'김현아','','031-408-8037','본오동','',NULL,27,'2012-03-24 13:09:44','2012-03-24 13:09:44'),(27,'청솔','','','','',NULL,28,'2012-03-24 13:12:33','2012-03-24 13:12:33'),(28,'선정호','010-3312-2105','','','',NULL,29,'2012-03-24 13:14:35','2012-03-24 13:14:35'),(29,'안수진','010-6689-8020','','','',NULL,30,'2012-03-24 13:21:30','2012-03-24 13:21:30'),(30,'유경훈','010-5882-1432','','','',NULL,31,'2012-03-24 13:23:15','2012-03-24 13:23:15'),(31,'970-13 201호','010-5882-1432','','본오동','970-13 201호',NULL,32,'2012-03-24 13:25:51','2012-03-24 13:25:51');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_roles`
--

DROP TABLE IF EXISTS `role_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_roles`
--

LOCK TABLES `role_roles` WRITE;
/*!40000 ALTER TABLE `role_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_roles_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'guest','sugin up default role','2012-03-18 12:00:18','2012-03-18 12:00:18'),(2,'admin','administrator role','2012-03-18 12:00:18','2012-03-18 12:00:18');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,2,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,2,2,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,1,3,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,1,4,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,1,5,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,1,6,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,1,7,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,1,8,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(9,1,9,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,1,10,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(11,1,11,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(12,1,12,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,1,13,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,1,14,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(15,1,15,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(16,1,16,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(17,1,17,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,2,15,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(19,1,18,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,1,19,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(21,1,20,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(22,1,21,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(23,1,22,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(24,1,23,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(25,1,24,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(26,1,25,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(27,1,26,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(28,1,27,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(29,1,28,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(30,1,29,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(31,1,30,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(32,1,31,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(33,1,32,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20120229053219'),('20120301041030'),('20120301041302'),('20120302040331'),('20120304225909'),('20120305021455'),('20120305041606'),('20120305043014');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@youcloth.kr','$2a$10$.Qy8jsGXtYGqasZek6EXOuP1p1hEtwaEqvryjBsi6fgReYeKZqcWS',NULL,NULL,NULL,9,'2012-03-25 02:07:23','2012-03-25 01:55:34','127.0.0.1','127.0.0.1','2012-03-18 12:00:18','2012-03-25 02:07:23'),(2,'usemodj@gmail.com','$2a$10$RQRIydO/ujgDTCFeqr9sLuYcpaEhRIEPt9wQQSjiaCEqbfES9VDku',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-19 06:51:39','2012-03-19 06:51:39'),(3,'you10@youcloth.kr','$2a$10$0Eps8gptkXIQ/hhsPnsQMeLp/HqLbvPPNnP5iSNq18IwE6/itsjTS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-19 07:26:46','2012-03-19 07:26:46'),(4,'you11@youcloth.kr','$2a$10$hK.oGan61MrkBLVMzzoLUeuJTeWWlv9EqLIJifmg2Jhy/5rwAqeZa',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-19 07:28:37','2012-03-19 07:28:37'),(5,'you12@youcloth.kr','$2a$10$SxtcLUaTWq7WatOOF6nvGe0lA5ePEEERPMppjL8bPj8oyOX76sNvu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-19 07:31:07','2012-03-19 07:31:07'),(6,'you13@youcloth.kr','$2a$10$2fT8PyIBjA4WrvdenVyUZex6UOKMDOEqUTnxK0IkNEy8hvhw/yQGm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-19 07:34:27','2012-03-19 07:34:27'),(7,'you14@youcloth.kr','$2a$10$dACC7yy2DSYcxZLz40wbzedlGy4IZbgvimDBFVofyzz3h.5.8Chg2',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-19 07:41:11','2012-03-19 07:41:11'),(8,'you15@youcloth.kr','$2a$10$3H91fj605cvNsW4k9K/1xOd5bjAQbO3EvB3Ivijhtc.Fq8/Z1FzCy',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-19 07:43:32','2012-03-19 07:43:32'),(9,'you16@youcloth.kr','$2a$10$ILOJr6hBjOBO.jE6ekB0Ku/ehRN7mxR2VeuBOtFfXpX3DPFBMX5na',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-19 07:45:49','2012-03-19 07:45:49'),(10,'you17@youcloth.kr','$2a$10$BP7E/uck1Oeg8EtG2zpv7OxKAms7qDR.uQZGMLs/Zncm1yZukQizG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-19 07:48:42','2012-03-19 07:48:42'),(11,'you18@youcloth.kr','$2a$10$vrpf9Fgp2mMN705lApRxPuL5kzRMGtie/tJWy0VzuOxez9mvqEPPi',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-19 07:50:19','2012-03-19 07:50:19'),(12,'you19@youcloth.kr','$2a$10$krbCCLg6avySfLJOgRuagOFDNYGMjLE.fbIX5C07HjPSN.c.2ejNG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-19 07:53:02','2012-03-19 07:53:02'),(13,'you20@youcloth.kr','$2a$10$zw8vVdLYio37PJGRHGudneNuPucczvrL8cJPS1/JA44czm58uCt6a',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-19 07:55:54','2012-03-19 07:55:54'),(14,'you21@youcloth.kr','$2a$10$0jnOPKf0xIqc2wpEOG40ReV5RQNad.6WlgB0nMhHyxOiR.Y4uBdku',NULL,NULL,NULL,1,'2012-03-19 12:47:21','2012-03-19 12:47:21','127.0.0.1','127.0.0.1','2012-03-19 08:15:25','2012-03-19 12:47:21'),(15,'webmaster@youcloth.kr','$2a$10$uDXlRGQ9yaJNl8EELSYmxua1g8p5n.HFouAxZOOffIQrGw1Pf8wcK',NULL,NULL,NULL,1,'2012-03-19 12:48:10','2012-03-19 12:48:10','127.0.0.1','127.0.0.1','2012-03-19 08:32:50','2012-03-19 12:48:10'),(16,'you22@youcloth.kr','$2a$10$mUzpYRgv324D55mL/uUh2.hz9A/TzpZggLXIp7HlI5HjFVq0w1e5u',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-19 12:07:16','2012-03-19 12:07:16'),(17,'you23@youcloth.kr','$2a$10$Pj8gExdz6ET5Y6.ixpgyouHuDuQUIFoqH7ZPsbrlCiwfjaI1U6IZe',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-19 12:10:26','2012-03-19 12:10:26'),(18,'you24@youcloth.kr','$2a$10$RAtLRUrdVp2JNtokCadsoOYm/gwKTFxidwDADLwa7ioxYH4pADlKu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-21 11:01:38','2012-03-21 11:01:38'),(19,'you25@youcloth.kr','$2a$10$AwJW3JWvHwoiBv4jrqS3rO/U5P.izRLOzdBei2mEsbou5qwHormzS',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-21 11:16:40','2012-03-21 11:16:40'),(20,'you26@youcloth.kr','$2a$10$nsa9X81tr4d4tX3VD4a3Oeheu9ofCVlDeJXEqrggkwtoVbiG2ScaC',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-21 11:19:53','2012-03-21 11:19:53'),(21,'you27@youcloth.kr','$2a$10$AqJU2cu1Ltx.UDig/Lb/iOJRZhrTJ2dINFkIDAdkRU9yIJ.ziApXa',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-21 11:22:33','2012-03-21 11:22:33'),(22,'you28@youcloth.kr','$2a$10$irS37EkDPA/7aoR/64e9juDxmxDt1w/hmMgBKLAmirow4cEcxZkEK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-24 12:42:55','2012-03-24 12:42:55'),(23,'you29@youcloth.kr','$2a$10$aQ4b/smXLl0wEsrVDLRX0ehdDfL58H6qCVWB5Ty3epmtFFHxRUc7q',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-24 12:46:35','2012-03-24 12:46:35'),(24,'you30@youcloth.kr','$2a$10$3hxfSpxe8p9ZLc6gSdg.JuHQuftqukomiGbLVEPnLxKGxNB60LqyG',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-24 12:54:01','2012-03-24 12:54:01'),(25,'you31@youcloth.kr','$2a$10$MljhjjeGgXA.FFkXi7PxouZtZBhYxxOGoro.XQ05KVzNpvUhj.j6q',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-24 13:00:43','2012-03-24 13:00:43'),(26,'you32@youcloth.kr','$2a$10$nMDjAK9nRXw.BEmyrO7E2ezq9woRaulc/dWKQO5rYuDdInES1RPGm',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-24 13:06:31','2012-03-24 13:06:31'),(27,'you33@youcloth.kr','$2a$10$YOOTQhTALAPTAiTjfsdn2eeL7Qgr748yfLrwFhRBAClBWoAB9Luh.',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-24 13:09:43','2012-03-24 13:09:43'),(28,'you34@youcloth.kr','$2a$10$1N9MrPqTJPc49pTJ9hceKeKYtO1P6gAT2gFvP0bvSNDHWAOlrDbPu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-24 13:12:33','2012-03-24 13:12:33'),(29,'you35@youcloth.kr','$2a$10$GkfN1Om8vGL/niH2cnE/i.ShtaNBCl6uU6mD.yfRHmofykWFYUGOK',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-24 13:14:34','2012-03-24 13:14:34'),(30,'you36@youcloth.kr','$2a$10$.M6mEnYnDumYTXYqgqVvze3w5/2FIidlONKJzO9VTDDESU03IAwie',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-24 13:21:30','2012-03-24 13:21:30'),(31,'you37@youcloth.kr','$2a$10$Ud10.b2VDPsrbxfqRYIEjuSMbfWjNV8q4fEYLdqfUG5cEFOfp7y.S',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-24 13:23:15','2012-03-24 13:23:15'),(32,'you38@youcloth.kr','$2a$10$rIunzRHRB.Z.LKiixLDJmeOTylK8BNYQbAOxLODY6pKMRmIZ/W9Tu',NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2012-03-24 13:25:51','2012-03-24 13:25:51');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `washes`
--

DROP TABLE IF EXISTS `washes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `washes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stocked_on` date DEFAULT NULL,
  `released_on` date DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `memo` text COLLATE utf8_unicode_ci,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `washes`
--

LOCK TABLES `washes` WRITE;
/*!40000 ALTER TABLE `washes` DISABLE KEYS */;
INSERT INTO `washes` VALUES (1,'you10@youcloth.kr','정대민','','2857-2814','','','2012-03-17',NULL,'입고','',2,'2012-03-19 07:26:46','2012-03-19 08:10:52'),(2,'you11@youcloth.kr','안수진','010-6689-8020','','','','2012-03-17',NULL,'입고','',3,'2012-03-19 07:28:37','2012-03-19 08:11:31'),(3,'you12@youcloth.kr','건물 301호','','','','건물 301호','2012-03-17',NULL,'입고','',4,'2012-03-19 07:31:07','2012-03-19 08:12:23'),(4,'you11@youcloth.kr','안수진','010-6689-8020','','','','2012-03-17',NULL,'입고',NULL,3,'2012-03-19 07:28:37','2012-03-19 07:28:37'),(5,'you13@youcloth.kr','노친네','','','','','2012-03-17',NULL,'입고','',5,'2012-03-19 07:34:27','2012-03-19 07:40:36'),(6,'you14@youcloth.kr','금방','','','','','2012-03-17',NULL,'입고',NULL,6,'2012-03-19 07:41:11','2012-03-19 07:41:11'),(7,'you15@youcloth.kr','몽실','','','','일동 621-2번지 501호','2012-03-17',NULL,'입고',NULL,7,'2012-03-19 07:43:32','2012-03-19 07:43:32'),(8,'you16@youcloth.kr','강동주','','','','','2012-03-17',NULL,'입고',NULL,8,'2012-03-19 07:45:50','2012-03-19 07:45:50'),(9,'you17@youcloth.kr','김한진','','','','','2012-03-19',NULL,'입고',NULL,9,'2012-03-19 07:48:43','2012-03-19 07:48:43'),(10,'you18@youcloth.kr','서정우','010-3017-3889','','','','2012-03-19','2012-03-21','출고완료','13,000원',10,'2012-03-19 07:50:19','2012-03-21 11:30:39'),(11,'you19@youcloth.kr','성실부동산','','','본오동','','2012-03-19','2012-03-21','출고완료','18,000원 ',11,'2012-03-19 07:53:02','2012-03-21 11:32:35'),(12,'you20@youcloth.kr','김다슬','','408-0811','','','2012-03-19',NULL,'입고',NULL,12,'2012-03-19 07:55:54','2012-03-19 07:55:54'),(13,'you21@youcloth.kr','이하율','','','','','2012-03-19',NULL,'입고',NULL,13,'2012-03-19 08:15:25','2012-03-19 08:15:25'),(14,'you22@youcloth.kr','청솔','','','','','2012-03-19',NULL,'입고',NULL,15,'2012-03-19 12:07:17','2012-03-19 12:07:17'),(15,'you23@youcloth.kr','설경우','','','','669-8','2012-03-19',NULL,'입고',NULL,16,'2012-03-19 12:10:26','2012-03-19 12:10:26'),(16,'you24@youcloth.kr','913-3 203','010-5533-8919','','본오동','913-3 203','2012-03-20',NULL,'입고','',17,'2012-03-21 11:01:38','2012-03-21 11:14:31'),(17,'you25@youcloth.kr','715-8 302호','','070-8185-4474','본오동','715-8 302호','2012-03-20',NULL,'입고',NULL,18,'2012-03-21 11:16:40','2012-03-21 11:16:40'),(18,'you26@youcloth.kr','이효정','','','본오동','','2012-03-20',NULL,'입고','',19,'2012-03-21 11:19:53','2012-03-21 11:20:48'),(19,'you27@youcloth.kr','가마솥 통닭','','','본오동','가마솥 통닭','2012-03-20',NULL,'입고','운동화 1(4000), 1(5000)',20,'2012-03-21 11:22:34','2012-03-21 11:24:53'),(20,'you26@youcloth.kr','이효정','','','본오동','','2012-03-21','2012-03-23','출고완료','9,000원',19,'2012-03-21 11:19:53','2012-03-24 12:41:09'),(21,'you28@youcloth.kr','하늘','','','','','2012-03-22','2012-03-22','출고완료','',21,'2012-03-24 12:42:55','2012-03-24 12:45:25'),(22,'you29@youcloth.kr','오해자','010-9991-2315','','','','2012-03-22',NULL,'입고',NULL,22,'2012-03-24 12:46:35','2012-03-24 12:46:35'),(23,'you23@youcloth.kr','설경우','','','','669-8','2012-03-22',NULL,'입고','',16,'2012-03-19 12:10:26','2012-03-24 12:49:46'),(24,'you14@youcloth.kr','금방','','','','','2012-03-22',NULL,'입고','',6,'2012-03-19 07:41:11','2012-03-24 12:51:52'),(25,'you30@youcloth.kr','715-12 301호','010-7178-8601','','본오동','715-12 301호','2012-03-22','2012-03-24','출고완료','',23,'2012-03-24 12:54:01','2012-03-24 12:58:54'),(26,'you31@youcloth.kr','장소망','010-7175-2818','','본오동','','2012-03-24','2012-03-24','출고완료','',24,'2012-03-24 13:00:43','2012-03-24 13:05:17'),(27,'you32@youcloth.kr','박인혜','010-5159-9410','','본오동','','2012-03-22',NULL,'입고',NULL,25,'2012-03-24 13:06:31','2012-03-24 13:06:31'),(28,'you33@youcloth.kr','김현아','','031-408-8037','본오동','','2012-03-23','2012-03-24','출고완료','',26,'2012-03-24 13:09:44','2012-03-24 13:11:24'),(29,'you34@youcloth.kr','청솔','','','','','2012-03-23',NULL,'입고',NULL,27,'2012-03-24 13:12:33','2012-03-24 13:12:33'),(30,'you35@youcloth.kr','선정호','010-3312-2105','','','','2012-03-23','2012-03-23','출고완료','',28,'2012-03-24 13:14:35','2012-03-24 13:18:01'),(31,'you31@youcloth.kr','장소망','010-7178-8601','','본오동','','2012-03-23','2012-03-24','출고완료','',24,'2012-03-24 13:00:43','2012-03-24 13:20:11'),(32,'you36@youcloth.kr','안수진','010-6689-8020','','','','2012-03-24',NULL,'입고',NULL,29,'2012-03-24 13:21:30','2012-03-24 13:21:30'),(33,'you37@youcloth.kr','유경훈','010-5882-1432','','','','2012-03-24',NULL,'입고',NULL,30,'2012-03-24 13:23:15','2012-03-24 13:23:15'),(34,'you38@youcloth.kr','970-13 201호','010-9014-7862','','본오동','970-13 201호','2012-03-24',NULL,'입고','',31,'2012-03-24 13:25:51','2012-03-24 13:29:42');
/*!40000 ALTER TABLE `washes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-03-26  3:31:59
