-- MariaDB dump 10.19  Distrib 10.4.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: cart_db
-- ------------------------------------------------------
-- Server version	10.4.18-MariaDB-1:10.4.18+maria~bionic-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/* Create database */
CREATE DATABASE IF NOT EXISTS cart_db;
/* Create tables */
USE cart_db;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add product type',7,'add_producttype'),(26,'Can change product type',7,'change_producttype'),(27,'Can delete product type',7,'delete_producttype'),(28,'Can view product type',7,'view_producttype'),(29,'Can add all product',8,'add_allproduct'),(30,'Can change all product',8,'change_allproduct'),(31,'Can delete all product',8,'delete_allproduct'),(32,'Can view all product',8,'view_allproduct'),(33,'Can add all shop cart',9,'add_allshopcart'),(34,'Can change all shop cart',9,'change_allshopcart'),(35,'Can delete all shop cart',9,'delete_allshopcart'),(36,'Can view all shop cart',9,'view_allshopcart'),(37,'Can add shop cart product',10,'add_shopcartproduct'),(38,'Can change shop cart product',10,'change_shopcartproduct'),(39,'Can delete shop cart product',10,'delete_shopcartproduct'),(40,'Can view shop cart product',10,'view_shopcartproduct');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$216000$onX0HFYVo5gb$/TlAV+ez3yDTH8am2z+7jfvnCwJRtf0eLdqkZHUI7AQ=','2021-03-22 15:39:38.647461',1,'admin','','','chen.finland@outlook.com',1,1,'2021-03-21 19:54:56.595624');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(8,'product','allproduct'),(7,'product','producttype'),(6,'sessions','session'),(9,'shopcart','allshopcart'),(10,'shopcart','shopcartproduct');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-03-21 19:54:14.242329'),(2,'auth','0001_initial','2021-03-21 19:54:14.650031'),(3,'admin','0001_initial','2021-03-21 19:54:16.020322'),(4,'admin','0002_logentry_remove_auto_add','2021-03-21 19:54:16.360627'),(5,'admin','0003_logentry_add_action_flag_choices','2021-03-21 19:54:16.387395'),(6,'contenttypes','0002_remove_content_type_name','2021-03-21 19:54:16.553047'),(7,'auth','0002_alter_permission_name_max_length','2021-03-21 19:54:16.721877'),(8,'auth','0003_alter_user_email_max_length','2021-03-21 19:54:16.769610'),(9,'auth','0004_alter_user_username_opts','2021-03-21 19:54:16.792088'),(10,'auth','0005_alter_user_last_login_null','2021-03-21 19:54:16.907305'),(11,'auth','0006_require_contenttypes_0002','2021-03-21 19:54:16.916514'),(12,'auth','0007_alter_validators_add_error_messages','2021-03-21 19:54:16.941664'),(13,'auth','0008_alter_user_username_max_length','2021-03-21 19:54:16.971448'),(14,'auth','0009_alter_user_last_name_max_length','2021-03-21 19:54:17.002188'),(15,'auth','0010_alter_group_name_max_length','2021-03-21 19:54:17.042666'),(16,'auth','0011_update_proxy_permissions','2021-03-21 19:54:17.064048'),(17,'auth','0012_alter_user_first_name_max_length','2021-03-21 19:54:17.088743'),(18,'sessions','0001_initial','2021-03-21 19:54:17.146387'),(19,'product','0001_initial','2021-03-22 14:31:41.635466'),(20,'product','0002_auto_20210322_1536','2021-03-22 15:36:49.674191'),(21,'shopcart','0001_initial','2021-03-22 16:00:32.789313'),(22,'product','0003_allproduct_product_code','2021-03-22 17:36:08.410878');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('08wdrpsj5qxx4rra2um0e5za0tb4voqh','.eJxVjMsOwiAQRf-FtSE8LFCX7vsNZGYYpGogKe3K-O_apAvd3nPOfYkI21ri1nmJcxIXocXpd0OgB9cdpDvUW5PU6rrMKHdFHrTLqSV-Xg_376BAL98aEiXODnHgQPaMqIKz7D0EMga91mMiN1rlNLLKWTs1ZKsoOKMNBAbx_gAMkzhT:1lO4Af:PvcEaRU_uD1k3SoYQRKoQ7AFqPHeKApmm5kEcsUfMRE','2021-04-04 19:55:33.281211'),('cu82n4zim2kp2ge03eyi2p84xt1wvsze','.eJxVjMsOwiAQRf-FtSE8LFCX7vsNZGYYpGogKe3K-O_apAvd3nPOfYkI21ri1nmJcxIXocXpd0OgB9cdpDvUW5PU6rrMKHdFHrTLqSV-Xg_376BAL98aEiXODnHgQPaMqIKz7D0EMga91mMiN1rlNLLKWTs1ZKsoOKMNBAbx_gAMkzhT:1lOMeY:itxdCb1WNCzFY_aubMO5N1xKZViK6wFxPit7WNxvF2s','2021-04-05 15:39:38.655731');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_allproduct`
--

DROP TABLE IF EXISTS `product_allproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_allproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `price` int(11) NOT NULL,
  `storage` int(11) NOT NULL,
  `product_type_id` int(11) NOT NULL,
  `product_code` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_allproduct_product_type_id_cc067fc6_fk_product_p` (`product_type_id`),
  CONSTRAINT `product_allproduct_product_type_id_cc067fc6_fk_product_p` FOREIGN KEY (`product_type_id`) REFERENCES `product_producttype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_allproduct`
--

LOCK TABLES `product_allproduct` WRITE;
/*!40000 ALTER TABLE `product_allproduct` DISABLE KEYS */;
INSERT INTO `product_allproduct` VALUES (1,'Become','Book form Mrs.Obama',30,5,1,'abcd'),(2,'Music','Book form about music',20,3,1,'c958'),(3,'Soya','Asian food',10,10,2,'weds'),(4,'Sushi','Japanese food',50,10,2,'3315'),(5,'Coat','J.Linderberg',70,1,3,'3652'),(6,'Mask','Zara',15,15,3,'we89');
/*!40000 ALTER TABLE `product_allproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_producttype`
--

DROP TABLE IF EXISTS `product_producttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_producttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_producttype`
--

LOCK TABLES `product_producttype` WRITE;
/*!40000 ALTER TABLE `product_producttype` DISABLE KEYS */;
INSERT INTO `product_producttype` VALUES (1,'book','Normal Book'),(2,'food','food'),(3,'clothes','Man and woman clothes');
/*!40000 ALTER TABLE `product_producttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopcart_allshopcart`
--

DROP TABLE IF EXISTS `shopcart_allshopcart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopcart_allshopcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopcart_allshopcart`
--

LOCK TABLES `shopcart_allshopcart` WRITE;
/*!40000 ALTER TABLE `shopcart_allshopcart` DISABLE KEYS */;
INSERT INTO `shopcart_allshopcart` VALUES (1,0);
/*!40000 ALTER TABLE `shopcart_allshopcart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopcart_shopcartproduct`
--

DROP TABLE IF EXISTS `shopcart_shopcartproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shopcart_shopcartproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL,
  `product_id_id` int(11) NOT NULL,
  `shopcart_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `shopcart_shopcartpro_product_id_id_bf24018d_fk_product_a` (`product_id_id`),
  KEY `shopcart_shopcartpro_shopcart_id_id_f42879b2_fk_shopcart_` (`shopcart_id_id`),
  CONSTRAINT `shopcart_shopcartpro_product_id_id_bf24018d_fk_product_a` FOREIGN KEY (`product_id_id`) REFERENCES `product_allproduct` (`id`),
  CONSTRAINT `shopcart_shopcartpro_shopcart_id_id_f42879b2_fk_shopcart_` FOREIGN KEY (`shopcart_id_id`) REFERENCES `shopcart_allshopcart` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopcart_shopcartproduct`
--

LOCK TABLES `shopcart_shopcartproduct` WRITE;
/*!40000 ALTER TABLE `shopcart_shopcartproduct` DISABLE KEYS */;
INSERT INTO `shopcart_shopcartproduct` VALUES (1,2,1,1),(18,1,1,1);
/*!40000 ALTER TABLE `shopcart_shopcartproduct` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-25 17:56:35