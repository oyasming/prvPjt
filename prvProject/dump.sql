-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: prv_pjt
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `seq` int(10) unsigned NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(45) NOT NULL,
  `position` varchar(45) NOT NULL,
  `authority` int(10) unsigned NOT NULL,
  `enabled` int(10) unsigned NOT NULL DEFAULT '1',
  `phone_no` varchar(20) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `post1` varchar(3) DEFAULT NULL,
  `post2` varchar(3) DEFAULT NULL,
  `address1` varchar(255) DEFAULT NULL,
  `address2` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`seq`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (20150001,'superadmin','$2a$10$BXU3YkWN7JYRV.dkcN2zxeko4fYf7uqlisZfpcAkBEpwkLnkdz9Ha','최고관리자','관리자',0,1,'042-472-2094','',NULL,NULL,'','',NULL),(20150002,'sskang','$2a$10$BXU3YkWN7JYRV.dkcN2zxeko4fYf7uqlisZfpcAkBEpwkLnkdz9Ha','강선석','차장',1,1,'','',NULL,NULL,'','',NULL),(20170001,'oyasming','$2a$10$sRORDAiCTBqquWIU72ggJe.FoYUnQmhnCFJQwXSoE9KD2UUMaNYbW','박지완','사원',2,1,'','',NULL,NULL,'','',NULL),(20170002,'test123','$2a$10$eOp7NvsnL6IqaT9EuL/v1uzWSffoykTzDVVpl1iSi3FvwbwoQToby','김실험1','피실험자1',2,1,'02-487-4875','test@test.com','302','808','대전 서구 월평동로 1 (갈마동)','대전 서구 갈마동 1465','010-2548-6543');
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

-- Dump completed on 2017-07-28 17:42:42
