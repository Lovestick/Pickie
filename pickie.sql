-- MySQL dump 10.13  Distrib 5.5.16, for Linux (x86_64)
--
-- Host: localhost    Database: securepot
-- ------------------------------------------------------
-- Server version	5.5.16-log

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
-- Table structure for table `container_objects`
--

DROP TABLE IF EXISTS `container_objects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `container_objects` (
  `object_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `container_id` int(10) unsigned NOT NULL,
  `object_name` varbinary(250) NOT NULL,
  `object_value` blob NOT NULL,
  `date_created` int(11) unsigned NOT NULL,
  `date_modified` int(11) unsigned NOT NULL,
  `modified_by` int(10) unsigned NOT NULL,
  `keep_history` int(1) unsigned DEFAULT '0',
  PRIMARY KEY (`object_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `container_permissions`
--

DROP TABLE IF EXISTS `container_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `container_permissions` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `container_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `allow_create_object` int(1) unsigned NOT NULL DEFAULT '0',
  `allow_del_object` int(1) unsigned NOT NULL DEFAULT '0',
  `allow_modify_object` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `containers`
--

DROP TABLE IF EXISTS `containers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `containers` (
  `container_id` int(11) NOT NULL AUTO_INCREMENT,
  `container_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `date_created` int(15) unsigned NOT NULL,
  `date_modified` int(15) unsigned NOT NULL,
  `modified_by` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`container_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger NewContainer AFTER INSERT ON containers FOR EACH ROW BEGIN INSERT INTO decrypt_keys (user_id,container_id) values (NEW.modified_by,NEW.container_id); INSERT INTO container_permissions (container_id,user_id,allow_create_object,allow_del_object,allow_modify_object) values (NEW.container_id,NEW.modified_by,1,1,1); END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `decrypt_keys`
--

DROP TABLE IF EXISTS `decrypt_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `decrypt_keys` (
  `key_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `container_id` int(10) unsigned NOT NULL,
  `decrypt_key` blob NOT NULL,
  PRIMARY KEY (`key_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `email_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varbinary(250) NOT NULL,
  `email_to` blob NOT NULL,
  `email_subject` varbinary(250) NOT NULL,
  `email_date` int(12) unsigned NOT NULL,
  `email_body` blob NOT NULL,
  `email_sent` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`email_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `external_messages`
--

DROP TABLE IF EXISTS `external_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `external_messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `level1` int(10) unsigned NOT NULL,
  `level2` int(10) unsigned NOT NULL,
  `level3` int(10) unsigned NOT NULL,
  `level4` int(20) unsigned NOT NULL,
  `expire` int(15) unsigned NOT NULL,
  `delete_on_read` int(1) unsigned NOT NULL DEFAULT '1',
  `message` blob NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login_fails`
--

DROP TABLE IF EXISTS `login_fails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_fails` (
  `fail_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varbinary(250) NOT NULL,
  `fail_ip` varchar(250) NOT NULL,
  `fail_date` int(13) unsigned NOT NULL,
  `fail_reason` varchar(250) NOT NULL,
  PRIMARY KEY (`fail_id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL,
  `message_date` int(11) unsigned NOT NULL,
  `message_from` varbinary(250) NOT NULL,
  `message_to` varbinary(250) NOT NULL,
  `message_unread` int(1) unsigned NOT NULL DEFAULT '1',
  `message_read_date` int(11) unsigned NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pending_potters`
--

DROP TABLE IF EXISTS `pending_potters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending_potters` (
  `pending_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `requesting_potter` varbinary(250) NOT NULL,
  `destination_potter` varbinary(250) NOT NULL,
  `passphrase` varbinary(250) NOT NULL,
  `request_date` int(11) unsigned NOT NULL,
  `last_change` int(11) unsigned NOT NULL,
  `shared_key` blob NOT NULL,
  PRIMARY KEY (`pending_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `permissions_view`
--

DROP TABLE IF EXISTS `permissions_view`;
/*!50001 DROP VIEW IF EXISTS `permissions_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `permissions_view` (
  `user_id` int(10) unsigned,
  `date_created` int(15) unsigned,
  `date_modified` int(15) unsigned,
  `modified_by` varchar(250),
  `container_id` int(11),
  `container_name` varchar(250),
  `allow_create_object` int(1) unsigned,
  `allow_del_object` int(1) unsigned,
  `allow_modify_object` int(1) unsigned
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `pot_permissions`
--

DROP TABLE IF EXISTS `pot_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pot_permissions` (
  `perm_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pot_id` int(10) unsigned NOT NULL,
  `pot_name` varbinary(250) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `role` varchar(250) NOT NULL,
  `allow_add_object` int(1) unsigned NOT NULL DEFAULT '0',
  `allow_del_object` int(1) unsigned DEFAULT '0',
  `allow_mod_object` int(1) unsigned DEFAULT '0',
  `allow_add_member` int(1) unsigned NOT NULL DEFAULT '0',
  `allow_del_member` int(1) unsigned NOT NULL DEFAULT '0',
  `allow_mod_perms` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`perm_id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varbinary(25) NOT NULL,
  `login_password` varchar(250) NOT NULL,
  `key_password` varchar(250) NOT NULL,
  `disabled` int(1) unsigned DEFAULT '0',
  `email` varchar(250) NOT NULL,
  `email_validated` int(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(250) NOT NULL,
  `last_login` varchar(250) NOT NULL,
  `last_login_date` int(13) unsigned NOT NULL,
  `join_date` int(13) unsigned NOT NULL,
  `pot_soft_limit` int(3) unsigned NOT NULL DEFAULT '10',
  `pot_hard_limit` int(3) unsigned NOT NULL DEFAULT '15',
  `timezone` varchar(250) NOT NULL DEFAULT 'America/New_York',
  `external_message_time_limit` int(10) unsigned NOT NULL DEFAULT '300',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`),
  KEY `username_index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `permissions_view`
--

/*!50001 DROP TABLE IF EXISTS `permissions_view`*/;
/*!50001 DROP VIEW IF EXISTS `permissions_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `permissions_view` AS select `container_permissions`.`user_id` AS `user_id`,`containers`.`date_created` AS `date_created`,`containers`.`date_modified` AS `date_modified`,`containers`.`modified_by` AS `modified_by`,`containers`.`container_id` AS `container_id`,`containers`.`container_name` AS `container_name`,`container_permissions`.`allow_create_object` AS `allow_create_object`,`container_permissions`.`allow_del_object` AS `allow_del_object`,`container_permissions`.`allow_modify_object` AS `allow_modify_object` from (`containers` join `container_permissions` on((`containers`.`container_id` = `container_permissions`.`container_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-02-22 18:17:15
