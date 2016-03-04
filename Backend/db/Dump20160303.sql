-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: hsv
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `lm_article`
--

DROP TABLE IF EXISTS `lm_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET latin1 NOT NULL,
  `content` mediumtext CHARACTER SET latin1 NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm_article`
--

LOCK TABLES `lm_article` WRITE;
/*!40000 ALTER TABLE `lm_article` DISABLE KEYS */;
INSERT INTO `lm_article` VALUES (153,'Holthausen ist Meister 2015','<p>Der Holthausener Sportverein ist mit 30 Punkten Meister der Saison 2015 geworden. Damit ist dieser Ausrichter der Saison 2015.</p>\n','2016-01-02 15:43:41','2016-01-21 13:36:14',NULL),(154,'Wir sind Meister 2015','<p>HSV !!! Meister 2015</p>\n','2016-02-11 20:14:13','2016-02-11 20:32:30',3),(157,'Test','<p>asdf</p>\n','2016-02-24 09:01:34','0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `lm_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lm_document`
--

DROP TABLE IF EXISTS `lm_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm_document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `filename` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm_document`
--

LOCK TABLES `lm_document` WRITE;
/*!40000 ALTER TABLE `lm_document` DISABLE KEYS */;
INSERT INTO `lm_document` VALUES (4,'Historie','historie.html'),(11,'Kreispokal','ForwardPokal.html'),(16,'Richtlinien 2015','Richtlinien_2015_Cosmos.pdf'),(17,'Adressliste 2015','Adressliste 2015.pdf'),(18,'Spielbericht 2015','Spielbericht 2015.pdf');
/*!40000 ALTER TABLE `lm_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lm_guestbook`
--

DROP TABLE IF EXISTS `lm_guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_german1_ci DEFAULT NULL,
  `email` varchar(255) COLLATE latin1_german1_ci DEFAULT NULL,
  `message` text COLLATE latin1_german1_ci,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm_guestbook`
--

LOCK TABLES `lm_guestbook` WRITE;
/*!40000 ALTER TABLE `lm_guestbook` DISABLE KEYS */;
INSERT INTO `lm_guestbook` VALUES (1,'Manni',NULL,'Hi, erster Testeintrag','2011-12-28 11:54:31'),(14,'Michael Raida',NULL,'Sehr, sehr schön :-)','2012-02-24 15:18:08'),(16,'Uwe','Au.sarau@gmx.de','Tolle vorbereitung von euch','2012-02-28 17:09:07'),(17,'Marius Schulze Beiering',NULL,'Hey, das habt ihr aber sehr schön gemacht! Ein dickes Lob im Vorhinein!! Sollte alles aktuell über die Dauer der Saison beibehalten werden gibt es noch ein dickes Lob im Nachhinein! Auf eine gute Saison....','2012-02-28 23:37:26'),(20,'Manni','manfred.rosskamp@gmx.de','Tag,\nhab mal eine Historie hinzugefügt. Die Infos stammen von der Cosmos Seite. Weiß jemand wer 2010 Torschützenkönig war?','2012-03-03 16:40:14'),(21,'Michael Warmers',NULL,'Hey zusammen!!\nEcht klasse die Seite, dickes lob an Holthausen(Manni)!\nHab übrigens gerade gehört das die Bröker Jungs dieses Jahr nicht mitspielen werden,schade!\nSchönes We noch Gruß Michael','2012-03-03 18:36:37'),(22,'M.Raida',NULL,'Glückwunsch an Cosmos zur Meisterschaft ! ! ! ','2012-09-20 10:22:04'),(23,'Massen','noebert.jaegering@borken.de','Betr. Torjäger: Marius Schulze Beiering und Marius Schulze sind meines Wissens ein und die selbe Person. Also kommt er auf 10 Tore. ','2012-09-20 17:22:02'),(24,'Präsi Böinghook','fcboeinghook@gmx.de','Hi Leute neuer ansprech partner vom FCBöinghook ist Jan-Gerth Niehaus ','2013-02-17 10:32:13'),(25,'holthausen',NULL,'nur zur info, der spieler d. holtkamp spielt für holthauen und nich für bieling,\nbitte in der torjägerliste ändern','2013-06-20 20:42:06'),(26,'M. Raida',NULL,'Was ist denn mit den ganzen Spielen, die noch nicht gespielt sind, aber laut Spielplan LÄNGST gespielt hätten sein sollen ? ? ? \nJeder Verein kann doch die Spieldaten selber ändern ! ! ! !','2013-08-16 16:45:36'),(27,'Daniel Lüdiger',NULL,'Alle Termine, die sich im Laufe der Zeit geändert haben, bitte eintragen. Sonst blickt hier keiner mehr druch. Werde nochmal ne Rundmal verfassen.','2013-08-20 08:47:35'),(28,'Michael R.',NULL,'Das klappt ja super ;-)\n','2013-09-03 15:42:52'),(29,'Daniel Lüdiger',NULL,'Hallo Fußballfreunde!\n\nDie Saison 2013 ist schon bald wieder Geschichte.\nZum Saisonabschluss am Samstag, 28. September 2013 möchten wir euch\nherzlich einladen. Um den neuen Meister bei einigen Bierchen mit seinen\nInsignien auszustatten, treffen wir uns um 20:00 Uhr in der Gaststätte\nAutohof in Weseke. (Wer ein Navy brauchen sollte: Hauptstraße 66, 46325\nBorken). Dort wird auch der Torschützenkönig der Saison geehrt.\n\nAuf euer zahlreiches Erscheinen freut sich\nFC Cosmos Weseke','2013-09-24 18:40:05'),(30,'Michael Raida / Holthausener SV','M.Raida@t-online.de','Guten Tag zusammen,\nzwei Termine für die kommende Saison unserer Hobbyliga:\nAm 22.01.14 findet um  19:30 am Platz von Fiat Gescher die Besprechung der Hobbyliga Ahaus statt.\nZu dieser sind auch wir eingeladen, weil es da u.a. auch um die Pokalrunde geht.\nDie Versammlung zu unsderer Hobbyligasaison findet am 17.02.14 um 19:30 Uhr in Holthausen (alte Schule) statt.\nEine Einladung hierzu folgt ab er noch.\nCiao M. Raida','2014-01-09 13:35:15'),(31,'Massen, FC Cosmos','norbert.jaegering@borken.de','Tach!\nIch bin der Meinung das die Spiele von/gegen SF Reken in der Torschützenliste nicht gestrichen werden sollten. Lasst dem Bücker, Haddick und sonst noch wer ihre Tore doch!\n','2014-09-09 17:48:50'),(32,'Frank','lachexperte@web.de','Das Team Lette veranstaltet jeweils an der Terminen Samstag 15.11 und Samstag 13.12 von jeweils 11.00UHR - ca.16.00UHR im Soccertreff Coesfeld ein Soccerhallenturnier für Freizeit + Betriebsmannschaften,falls Teams Intresse haben an einem der Soccerturniere teilzunehmen,,meldet euch für weitere Infos unter lachexperte@web.de','2014-10-28 19:09:17'),(33,'ssdf',NULL,'ASfret','2016-01-02 18:57:46');
/*!40000 ALTER TABLE `lm_guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `lm_locks`
--

DROP TABLE IF EXISTS `lm_locks`;
/*!50001 DROP VIEW IF EXISTS `lm_locks`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `lm_locks` AS SELECT 
 1 AS `id`,
 1 AS `id_saison`,
 1 AS `id_match`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `team_name`,
 1 AS `date`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `lm_match`
--

DROP TABLE IF EXISTS `lm_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `description` text COLLATE latin1_german1_ci,
  `goal1` int(11) DEFAULT NULL,
  `goal2` int(11) DEFAULT NULL,
  `id_saison_team1` int(11) NOT NULL,
  `id_saison_team2` int(11) NOT NULL,
  `type` enum('TOURNAMENT','FRIEND') COLLATE latin1_german1_ci DEFAULT 'TOURNAMENT',
  PRIMARY KEY (`id`),
  KEY `fk_lm_spiel_lm_saison_mannschaft1` (`id_saison_team1`),
  KEY `fk_lm_spiel_lm_saison_mannschaft2` (`id_saison_team2`),
  CONSTRAINT `fk_lm_spiel_lm_saison_mannschaft1` FOREIGN KEY (`id_saison_team1`) REFERENCES `lm_saison_team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lm_spiel_lm_saison_mannschaft2` FOREIGN KEY (`id_saison_team2`) REFERENCES `lm_saison_team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm_match`
--

LOCK TABLES `lm_match` WRITE;
/*!40000 ALTER TABLE `lm_match` DISABLE KEYS */;
INSERT INTO `lm_match` VALUES (1,'2012-09-10 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\">?</font></span></p>',4,1,1,2,'TOURNAMENT'),(2,'2012-07-02 19:00:00','',6,1,1,3,'TOURNAMENT'),(3,'2012-09-19 18:45:00','',2,6,1,4,'TOURNAMENT'),(4,'2012-09-03 19:00:00','',2,5,1,5,'TOURNAMENT'),(6,'2012-09-24 19:00:00','',7,5,1,7,'TOURNAMENT'),(8,'2012-04-30 19:00:00','',2,1,2,1,'TOURNAMENT'),(9,'2012-05-23 19:00:00','',2,4,2,3,'TOURNAMENT'),(10,'2012-08-27 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\">Eigentor von Cosmos<br /></font></span></p>',3,2,2,4,'TOURNAMENT'),(11,'2012-05-14 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\"></font></span></p><p><font size=\"4\"><span style=\"font-family:Verdana;\"><font size=\"4\"><br /></font></span></font></p><p></p>',6,2,2,5,'TOURNAMENT'),(13,'2012-05-07 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\"></font></span></p><p><font size=\"4\"><span style=\"font-family:Verdana;\"><br /></span></font></p><p></p>',6,5,2,7,'TOURNAMENT'),(15,'2012-04-23 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\"><br /></font></span></p>',7,5,3,1,'TOURNAMENT'),(16,'2012-09-03 18:30:00','',1,3,3,2,'TOURNAMENT'),(17,'2012-06-20 19:00:00','',5,5,3,4,'TOURNAMENT'),(18,'2012-09-10 18:30:00','',3,2,3,5,'TOURNAMENT'),(20,'2012-06-25 19:00:00','',6,4,3,7,'TOURNAMENT'),(22,'2012-06-11 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\">?</font></span></p>',5,3,4,1,'TOURNAMENT'),(23,'2012-07-07 12:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\"></font></span></p><p><font size=\"4\"><span style=\"font-family:Verdana;\"><br /></span></font></p><p></p>',3,2,4,2,'TOURNAMENT'),(24,'2012-05-14 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\"></font></span></p><p><font size=\"4\"><span style=\"font-family:Verdana;\"><br /></span></font></p><p></p>',2,1,4,3,'TOURNAMENT'),(25,'2012-09-15 15:00:00','',2,0,4,5,'TOURNAMENT'),(27,'2012-08-13 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\">?Spiel wurde von Bieling abgesagt<br /></font></span></p>',2,0,4,7,'TOURNAMENT'),(29,'2012-05-30 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\">?</font></span></p>',1,1,5,1,'TOURNAMENT'),(30,'2012-07-04 19:00:00','',3,2,5,2,'TOURNAMENT'),(31,'2012-06-29 19:00:00','',0,2,5,3,'TOURNAMENT'),(32,'2012-07-16 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\">?Absage von Brinker wegen Leutemangel<br /></font></span></p>',0,2,5,4,'TOURNAMENT'),(34,'2012-07-30 19:00:00','',7,2,5,7,'TOURNAMENT'),(43,'2012-06-18 18:30:00','',3,7,7,1,'TOURNAMENT'),(44,'2012-08-06 19:00:00','',1,3,7,2,'TOURNAMENT'),(45,'2012-04-16 19:00:00','',2,7,7,3,'TOURNAMENT'),(46,'2012-05-21 19:00:00','',3,2,7,4,'TOURNAMENT'),(47,'2012-06-11 19:00:00','',5,2,7,5,'TOURNAMENT'),(48,'2013-05-15 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\"></font></span></p><p><font size=\"4\"><span style=\"font-family:Verdana;\"><font size=\"4\"></font></span></font></p><p><font size=\"4\"><font size=\"4\"><font size=\"4\"><span><br /></span></font></font></font></p><p></p><p></p>',7,4,8,9,'TOURNAMENT'),(49,'2013-04-15 19:00:00','',2,1,8,10,'TOURNAMENT'),(50,'2013-09-04 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\">?Torschützen HSV: 2 x Ludger Roßkamp</font></span></p><p><span style=\"font-family:Verdana;\"><font size=\"4\">                            1 x Chr. Thesing<br /></font></span></p>',3,1,8,11,'TOURNAMENT'),(51,'2013-09-25 19:00:00','',4,3,8,12,'TOURNAMENT'),(52,'2013-09-16 19:00:00','',10,0,8,13,'TOURNAMENT'),(53,'2013-09-23 18:30:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\"></font></span></p><p><font size=\"4\"><span style=\"font-family:Verdana;\"><font size=\"4\"></font></span></font></p><br /><p></p><p></p>',2,2,9,8,'TOURNAMENT'),(54,'2013-09-02 19:00:00','',3,1,9,10,'TOURNAMENT'),(55,'2013-08-26 19:00:00','',7,1,9,11,'TOURNAMENT'),(56,'2013-09-18 19:00:00','',NULL,NULL,9,12,'TOURNAMENT'),(57,'2013-04-15 19:00:00','',10,4,9,13,'TOURNAMENT'),(58,'2013-06-24 19:00:00','',3,5,10,8,'TOURNAMENT'),(59,'2013-05-06 19:00:00','',4,2,10,9,'TOURNAMENT'),(60,'2013-09-23 18:30:00','',1,1,10,11,'TOURNAMENT'),(61,'2013-07-15 19:00:00','',3,3,10,12,'TOURNAMENT'),(62,'2013-07-22 19:00:00','',0,3,10,13,'TOURNAMENT'),(63,'2013-06-19 19:00:00','',1,6,11,8,'TOURNAMENT'),(64,'2013-06-12 19:00:00','',1,3,11,9,'TOURNAMENT'),(65,'2013-06-29 15:00:00','',3,2,11,10,'TOURNAMENT'),(66,'2013-09-16 18:30:00','',2,2,11,12,'TOURNAMENT'),(67,'2013-06-24 19:00:00','',8,4,11,13,'TOURNAMENT'),(68,'2013-04-24 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\">?Tore HSV: Thomas Schwerhoff 2x<br /></font></span></p>',2,2,12,8,'TOURNAMENT'),(69,'2013-05-22 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\"></font></span></p><p><font size=\"4\"><span style=\"font-family:Verdana;\"><font size=\"4\"></font></span></font></p><p></p>',1,2,12,9,'TOURNAMENT'),(70,'2013-06-17 19:00:00','',2,2,12,10,'TOURNAMENT'),(71,'2013-07-10 19:00:00','',3,1,12,11,'TOURNAMENT'),(72,'2013-09-02 19:00:00','',3,0,12,13,'TOURNAMENT'),(73,'2013-05-27 19:00:00','',2,9,13,8,'TOURNAMENT'),(74,'2013-06-04 00:00:00','',1,0,13,9,'TOURNAMENT'),(75,'2013-06-10 19:00:00','',5,4,13,10,'TOURNAMENT'),(76,'2013-05-13 19:00:00','',2,0,13,11,'TOURNAMENT'),(77,'2013-04-29 19:00:00','',5,5,13,12,'TOURNAMENT'),(79,'2014-05-05 19:00:00','',5,2,14,16,'TOURNAMENT'),(80,'2014-09-10 19:00:00','',3,4,14,17,'TOURNAMENT'),(81,'2014-09-03 19:00:00','',5,4,14,18,'TOURNAMENT'),(82,'2014-08-18 19:00:00','',2,1,14,19,'TOURNAMENT'),(88,'2014-07-02 19:00:00','',5,1,16,14,'TOURNAMENT'),(90,'2014-08-25 19:00:00','',3,3,16,17,'TOURNAMENT'),(91,'2014-06-30 18:30:00','',3,3,16,18,'TOURNAMENT'),(92,'2014-06-23 19:00:00','',9,0,16,19,'TOURNAMENT'),(93,'2014-05-19 19:00:00','',8,0,17,14,'TOURNAMENT'),(95,'2014-09-08 19:00:00','',2,2,17,16,'TOURNAMENT'),(96,'2014-06-23 19:00:00','',3,4,17,18,'TOURNAMENT'),(97,'2014-07-02 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\">2. Torschütze Bieling: Arjen Torwesten?<br />?</font></span></p>',9,2,17,19,'TOURNAMENT'),(98,'2014-06-11 19:00:00','',2,6,18,14,'TOURNAMENT'),(100,'2014-07-09 19:00:00','',1,3,18,16,'TOURNAMENT'),(101,'2014-09-22 18:30:00','<br />',1,4,18,17,'TOURNAMENT'),(102,'2014-05-21 19:00:00','',11,1,18,19,'TOURNAMENT'),(103,'2014-04-14 18:30:00','',0,5,19,14,'TOURNAMENT'),(105,'2014-07-07 19:00:00','<br />',1,0,19,16,'TOURNAMENT'),(106,'2014-09-01 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\"></font></span></p><p><font size=\"4\"><span style=\"font-family:Verdana;\"><font size=\"4\"><br /></font></span></font></p><p></p>',2,4,19,17,'TOURNAMENT'),(107,'2014-08-04 19:00:00','',1,4,19,18,'TOURNAMENT'),(150,'2015-07-29 19:00:00','',7,4,20,21,'TOURNAMENT'),(151,'2015-09-21 19:00:00','',NULL,NULL,20,22,'TOURNAMENT'),(152,'2015-04-27 19:00:00','',5,3,20,23,'TOURNAMENT'),(153,'2015-05-27 19:00:00','',2,4,20,24,'TOURNAMENT'),(154,'2015-06-10 19:00:00','',5,2,20,25,'TOURNAMENT'),(155,'2015-08-03 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\">?</font></span></p>',5,0,20,26,'TOURNAMENT'),(156,'2015-04-08 19:00:00','',3,4,21,20,'TOURNAMENT'),(157,'2015-05-20 19:00:00','',0,3,21,22,'TOURNAMENT'),(158,'2015-06-17 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\"><br />?</font></span></p>',1,2,21,23,'TOURNAMENT'),(159,'2015-05-06 19:00:00','',3,5,21,24,'TOURNAMENT'),(160,'2015-05-09 12:00:00','',10,0,21,25,'TOURNAMENT'),(161,'2015-09-09 19:00:00','',NULL,NULL,21,26,'TOURNAMENT'),(162,'2015-09-14 18:30:00','',NULL,NULL,22,20,'TOURNAMENT'),(163,'2015-07-02 19:00:00','',3,3,22,21,'TOURNAMENT'),(164,'2015-06-22 19:00:00','',7,1,22,23,'TOURNAMENT'),(165,'2015-06-29 19:00:00','',2,1,22,24,'TOURNAMENT'),(166,'2015-05-04 19:00:00','',6,0,22,25,'TOURNAMENT'),(167,'2015-07-06 19:00:00','',8,2,22,26,'TOURNAMENT'),(168,'2015-07-08 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\"></font></span></p><p></p>',4,9,23,20,'TOURNAMENT'),(169,'2015-08-26 19:00:00','',8,0,23,21,'TOURNAMENT'),(170,'2015-09-07 19:00:00','',NULL,NULL,23,22,'TOURNAMENT'),(171,'2015-05-18 19:00:00','',2,3,23,24,'TOURNAMENT'),(172,'2015-06-15 19:00:00','',2,2,23,25,'TOURNAMENT'),(173,'2015-07-27 19:00:00','',NULL,NULL,23,26,'TOURNAMENT'),(174,'2015-08-26 19:00:00','<p><b>Super</b> spannendes Spiel bis zum 1:0.</p>',0,3,24,20,'TOURNAMENT'),(175,'2015-05-02 12:00:00',NULL,NULL,NULL,24,21,'TOURNAMENT'),(176,'2015-06-17 19:00:00','',4,2,24,22,'TOURNAMENT'),(177,'2015-08-03 19:00:00','',NULL,NULL,24,23,'TOURNAMENT'),(178,'2015-04-07 13:29:00','',8,1,24,25,'TOURNAMENT'),(179,'2015-07-20 19:00:00','',9,0,24,26,'TOURNAMENT'),(180,'2015-08-20 19:00:00','',1,7,25,20,'TOURNAMENT'),(181,'2015-05-05 13:29:00',NULL,NULL,NULL,25,21,'TOURNAMENT'),(182,'2015-06-25 19:00:00','',0,3,25,22,'TOURNAMENT'),(183,'2015-09-03 19:00:00','',1,1,25,23,'TOURNAMENT'),(184,'2015-04-11 12:00:00',NULL,NULL,NULL,25,24,'TOURNAMENT'),(185,'2015-09-17 19:00:00','',NULL,NULL,25,26,'TOURNAMENT'),(186,'2015-06-08 19:00:00','',NULL,NULL,26,20,'TOURNAMENT'),(187,'2015-06-24 19:00:00','<p><span style=\"font-family:Verdana;\"><font size=\"4\"><br />?</font></span></p>',3,5,26,21,'TOURNAMENT'),(188,'2015-04-27 19:00:00','',0,10,26,22,'TOURNAMENT'),(189,'2015-09-02 19:00:00','',7,1,26,23,'TOURNAMENT'),(190,'2015-06-01 19:00:00','',2,9,26,24,'TOURNAMENT'),(191,'2015-05-28 12:00:00','',NULL,NULL,26,25,'TOURNAMENT');
/*!40000 ALTER TABLE `lm_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `lm_matches`
--

DROP TABLE IF EXISTS `lm_matches`;
/*!50001 DROP VIEW IF EXISTS `lm_matches`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `lm_matches` AS SELECT 
 1 AS `id`,
 1 AS `date`,
 1 AS `description`,
 1 AS `goal1`,
 1 AS `goal2`,
 1 AS `team1_id`,
 1 AS `team1_name`,
 1 AS `team2_id`,
 1 AS `team2_name`,
 1 AS `saison_id`,
 1 AS `saison_name`,
 1 AS `my_key`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lm_play_table`
--

DROP TABLE IF EXISTS `lm_play_table`;
/*!50001 DROP VIEW IF EXISTS `lm_play_table`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `lm_play_table` AS SELECT 
 1 AS `id_saison`,
 1 AS `id`,
 1 AS `name`,
 1 AS `icon`,
 1 AS `homepage`,
 1 AS `match_count`,
 1 AS `shoot`,
 1 AS `got`,
 1 AS `wins`,
 1 AS `stand_off`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `lm_player`
--

DROP TABLE IF EXISTS `lm_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_team` int(11) NOT NULL,
  `firstname` varchar(255) COLLATE latin1_german1_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE latin1_german1_ci DEFAULT NULL,
  `nickname` varchar(45) COLLATE latin1_german1_ci DEFAULT NULL,
  `hoeherALiga` tinyint(1) DEFAULT NULL,
  `count_goals` int(11) unsigned DEFAULT '0' COMMENT 'Gibt die Anzahl Tore an vor 2012',
  `count_games` int(11) unsigned DEFAULT '0' COMMENT 'Anzahl Spiele vor 2012',
  PRIMARY KEY (`id`),
  KEY `fk_lm_spieler_lm_mannschaft1` (`id_team`),
  CONSTRAINT `fk_lm_spieler_lm_mannschaft1` FOREIGN KEY (`id_team`) REFERENCES `lm_team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=252 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm_player`
--

LOCK TABLES `lm_player` WRITE;
/*!40000 ALTER TABLE `lm_player` DISABLE KEYS */;
INSERT INTO `lm_player` VALUES (9,3,'Norbert','Roßkamp','Rossi',NULL,124,629),(12,9,'St.','Tenk',NULL,NULL,0,0),(13,9,'J.','Peters',NULL,NULL,0,0),(14,5,'Henning','Klöcker',NULL,NULL,0,0),(15,5,'Max','Tesing',NULL,NULL,0,0),(16,5,'David','Bleker',NULL,NULL,0,0),(17,5,'Marius','Schulze Beiering',NULL,NULL,0,0),(18,5,'Tobias','Lütjann',NULL,NULL,0,0),(19,5,'Dennis','Lütjann',NULL,NULL,0,0),(20,5,'Benedikt','Lensing',NULL,NULL,0,0),(21,3,'Carsten','Thiehoff',NULL,NULL,21,32),(22,3,'Thomas','Schwerhoff',NULL,NULL,95,228),(23,4,'Michael','Stienen',NULL,NULL,0,0),(24,3,'Benedikt','Sicking',NULL,NULL,116,275),(25,4,'Pascal','Stasch',NULL,NULL,0,0),(26,4,'Reinhard','Boer',NULL,NULL,0,0),(27,4,'Manuel','Güttler',NULL,NULL,0,0),(28,4,'Michael','Bösing',NULL,NULL,0,0),(29,9,'Lukas','Kremer',NULL,NULL,0,0),(33,9,'T.','Schüttert',NULL,NULL,0,0),(34,9,'H','Flinkert',NULL,NULL,0,0),(35,6,'Jan','Gesing',NULL,NULL,0,0),(36,6,'Pascal','Herzog',NULL,NULL,0,0),(37,4,'Daniel','Schlecking',NULL,NULL,0,0),(38,7,'Dominik','Sievers',NULL,NULL,0,0),(39,9,'Thomas','Tenk',NULL,NULL,0,0),(40,6,'Patrick','Herzog',NULL,NULL,0,0),(41,6,'Achim','Schlüter',NULL,NULL,0,0),(42,6,'Andreas','Klein-Ridder',NULL,NULL,0,0),(43,4,'Olli','Vaut',NULL,NULL,0,0),(44,4,'Rudiger','Schmidt',NULL,NULL,0,0),(45,5,'Mark','Hellenkamp',NULL,NULL,0,0),(47,4,'Marius','Lütjann',NULL,NULL,0,0),(48,6,'Andre','Stenert',NULL,NULL,0,0),(49,6,'F.','Meisel',NULL,NULL,0,0),(50,9,'Hendrik','Mümken',NULL,NULL,0,0),(51,9,'Christian','Tenkamp',NULL,NULL,0,0),(52,9,'Andre','Tenkamp',NULL,NULL,0,0),(53,3,'Dennis','Selting',NULL,NULL,10,11),(54,3,'Manfred','Roßkamp','Manni',NULL,45,278),(57,6,'Sebastian','Ebbing',NULL,NULL,0,0),(59,9,'Michael','Tenk',NULL,NULL,0,0),(60,5,'Benny','Ehning',NULL,NULL,0,0),(61,3,'Sebastian','Tegelkamp',NULL,NULL,2,11),(62,5,'Yannik','Hellenkamp',NULL,NULL,0,0),(63,7,'Michael','Warmers',NULL,NULL,0,0),(64,7,'Andy','Kösters',NULL,NULL,0,0),(65,7,'Wansing','Michael',NULL,NULL,0,0),(66,4,'Stefan','Nienhaus',NULL,NULL,0,0),(68,4,'Christian','Gerwert',NULL,NULL,0,0),(69,7,'Haddick','Bernd',NULL,NULL,0,0),(70,7,'Christoph ','Ebbing',NULL,NULL,0,0),(71,9,'Jan','Peters',NULL,NULL,0,0),(72,4,'C.','Böttcher',NULL,NULL,0,0),(73,4,'Dominik','Stengenhoff',NULL,NULL,0,0),(74,4,'R.','Richhoff',NULL,NULL,0,0),(75,6,'Sebastian','Kamperschroer',NULL,NULL,0,0),(76,7,'Christoph','Lütjann',NULL,NULL,0,0),(77,7,'Andreas','Elsing',NULL,NULL,0,0),(78,7,'Dirk','Terhechte',NULL,NULL,0,0),(79,3,'Christian','Thesing',NULL,NULL,57,231),(80,7,'Markus','Diekmann',NULL,NULL,0,0),(81,6,'Brian','Terfrüchte',NULL,NULL,0,0),(82,3,'Steffen','Uphues',NULL,NULL,8,23),(83,3,'Christian','Schlattmann',NULL,NULL,5,48),(84,3,'Aljoscha','Kamp','Joschi',NULL,57,79),(85,5,'Marius','Schulze',NULL,NULL,0,0),(86,4,'Tobias','Terlau',NULL,NULL,0,0),(87,4,'Jonas','Heiming',NULL,NULL,0,0),(88,4,'Thomas','Niewerth',NULL,NULL,0,0),(89,9,'H.','Lübbering',NULL,NULL,0,0),(90,7,'Christoph','Ebbing',NULL,NULL,0,0),(91,3,'Kai','Grevenbrock',NULL,NULL,0,0),(92,3,'Eigentor','',NULL,NULL,0,0),(93,4,'Dominik','Sengenhorst',NULL,NULL,0,0),(94,9,'D.','Holtkamp',NULL,NULL,0,0),(95,9,'St,','Hoging',NULL,NULL,0,0),(96,9,'','',NULL,NULL,0,0),(97,3,'Lukas','Uphues',NULL,NULL,0,1),(98,3,'St.','Hoging',NULL,NULL,0,0),(99,5,'F.','Lütjann',NULL,NULL,0,0),(100,5,'J.','Klöcker',NULL,NULL,0,0),(101,5,'Jan','Meiners',NULL,NULL,0,0),(102,3,'Stefan','Hüging',NULL,NULL,141,384),(103,3,'Christian','Brengenberg',NULL,NULL,0,3),(104,3,'Carsten','Deppe','',NULL,308,529),(105,6,'NiklasVorfeld','',NULL,NULL,0,0),(106,6,'Jan','Zimmermann',NULL,NULL,0,0),(107,6,'Christian','Lüdiger',NULL,NULL,0,0),(108,6,'Nikals','Vorfeld',NULL,NULL,0,0),(109,9,'Jan','',NULL,NULL,0,0),(110,9,'J.','Zimmermann',NULL,NULL,0,0),(111,6,'Niklas','Vorfeld',NULL,NULL,0,0),(112,3,'Daniel','Holtkamp',NULL,NULL,13,242),(113,3,'Michael','Raida',NULL,NULL,31,287),(114,3,'Friderich','Schulze Holthausen',NULL,NULL,1,20),(115,7,'Christoph','',NULL,NULL,0,0),(116,7,'Dennis','Schweers',NULL,NULL,0,0),(117,3,'Ludger','Roßkamp',NULL,NULL,1,81),(118,4,'Raphael','Löbbing',NULL,NULL,0,0),(119,7,'Ludger','Börger',NULL,NULL,0,0),(120,3,'Lukas','Brokamp',NULL,NULL,0,0),(122,9,'Simon','Gravermann',NULL,NULL,0,0),(123,4,'Sebastian','Trautmann',NULL,NULL,0,0),(124,7,'Stefan','Bücker',NULL,NULL,0,0),(125,7,'Michael','Elsing',NULL,NULL,0,0),(126,7,'Christian','Elsing',NULL,NULL,0,0),(127,7,'Bernd','Haddick',NULL,NULL,0,0),(128,4,'Dave','Marnold',NULL,NULL,0,0),(129,4,'Marco','Bröker',NULL,NULL,0,0),(130,6,'Pascal','Schlottbohm',NULL,NULL,0,0),(131,3,'Lukas','Robert',NULL,NULL,13,149),(132,3,'Bernd','Sunderhaus',NULL,NULL,0,0),(133,7,'Florian','Lindenbuss',NULL,NULL,0,0),(134,7,'Marcus','Büscher',NULL,NULL,0,0),(135,7,'Denis','Schweers',NULL,NULL,0,0),(136,5,'Robin','Ring',NULL,NULL,0,0),(137,5,'Oliver','Nünning',NULL,NULL,0,0),(138,5,'Jan','Ista',NULL,NULL,0,0),(139,5,'Michael','Heistermann',NULL,NULL,0,0),(140,7,'David','Schüring',NULL,NULL,0,0),(141,7,'Eigentor','Klein',NULL,NULL,0,0),(142,6,'Maher','El',NULL,NULL,0,0),(143,7,'Leon','Eming',NULL,NULL,0,0),(144,7,'Alexander','Sühling',NULL,NULL,0,0),(145,6,'Max','Becker',NULL,NULL,0,0),(146,6,'Michael','Linfert',NULL,NULL,0,0),(147,6,'Dennis','Kamp',NULL,NULL,0,0),(148,9,'Joscha','',NULL,NULL,0,0),(149,6,'D.','Urbanski',NULL,NULL,0,0),(150,6,'J.','Rottstegge',NULL,NULL,0,0),(151,6,'M.','Krüger',NULL,NULL,0,0),(152,7,'Jannert','Patrick',NULL,NULL,0,0),(153,7,'Elsing','Christian',NULL,NULL,0,0),(154,7,'Büscher','Marcus',NULL,NULL,0,0),(155,7,'Eming','Leon',NULL,NULL,0,0),(156,7,'Terhechte','Dirk',NULL,NULL,0,0),(157,8,'Niehues,','Jan',NULL,NULL,0,0),(159,3,'Sicking','Benedikt',NULL,NULL,0,0),(161,3,'Bernd','Trepmann',NULL,NULL,0,6),(162,6,'Herzog','Pascal',NULL,NULL,0,0),(164,4,'Gerwert','Christian',NULL,NULL,0,0),(165,4,'Hellenkamp','Christopher',NULL,NULL,0,0),(166,4,'Stiene','Andre',NULL,NULL,0,0),(168,3,'Uphues','Steffen',NULL,NULL,0,0),(169,4,'Suttrup','Achim',NULL,NULL,0,0),(170,4,'Marnold','Dave',NULL,NULL,0,0),(171,4,'Stienen','Michael',NULL,NULL,0,0),(172,7,'Eming','Leon',NULL,NULL,0,0),(173,7,'Alscher','Matthias',NULL,NULL,0,0),(174,7,'Elsing','Christian',NULL,NULL,0,0),(175,7,'Bücker','Stephan',NULL,NULL,0,0),(176,4,'Mecking','Tristan',NULL,NULL,0,0),(177,4,'Karmann','Christoph',NULL,NULL,0,0),(178,4,'Schleking','Daniel',NULL,NULL,0,0),(179,5,'Jonas','Klöcker',NULL,NULL,0,0),(180,5,'Kevin','Juch',NULL,NULL,0,0),(181,5,'Tim','Winking',NULL,NULL,0,0),(182,5,'Felix','Lütjann',NULL,NULL,0,0),(183,7,'Warmers','Michael',NULL,NULL,0,0),(184,5,'Rene','Wellermann',NULL,NULL,0,0),(185,3,'Ivo','Schulz',NULL,NULL,0,0),(187,7,'Gesing','Hendrik',NULL,NULL,0,0),(188,5,'Alexander','Schlüter',NULL,NULL,0,0),(189,5,'Jan','Winking',NULL,NULL,0,0),(190,6,'Nils','Sterken',NULL,NULL,0,0),(191,6,'Simon','Schmitz',NULL,NULL,0,0),(192,6,'Fabian','Brettschneider',NULL,NULL,0,0),(193,8,'L.','Wendholt',NULL,NULL,0,0),(194,8,'M.','Müggenborg',NULL,NULL,0,0),(195,8,'Christian','Neumann',NULL,NULL,0,0),(196,9,'Franz','Kremer',NULL,NULL,0,0),(197,9,'Hendrik','Flinkert',NULL,NULL,0,0),(198,9,'Andre','Warmers',NULL,NULL,0,0),(199,5,'Tim','Riemenschneider',NULL,NULL,0,0),(200,5,'Simon','Ladenberger',NULL,NULL,0,0),(201,5,'Niclas','Schulten',NULL,NULL,0,0),(202,5,'Nils','Lünenborg',NULL,NULL,0,0),(203,3,'Jonas','Pöpping',NULL,NULL,0,0),(205,6,'Marc','Schulz',NULL,NULL,0,0),(206,6,'Lennart','Jägering',NULL,NULL,0,0),(207,8,'Jens','Rottstegge',NULL,NULL,0,0),(208,3,'C.','Ernst',NULL,NULL,0,0),(209,3,'F.','Klose',NULL,NULL,0,0),(210,3,'Hendrik','Strump',NULL,NULL,0,6),(211,4,'Chris','Karmann',NULL,NULL,0,0),(212,4,'Benjamin','Seier',NULL,NULL,0,0),(213,4,'Achim','Suttrup',NULL,NULL,0,0),(214,7,'Börger','Ludger',NULL,NULL,0,0),(215,7,'Lütjann','Christoph',NULL,NULL,0,0),(216,9,'Philipp','Schulz',NULL,NULL,0,0),(217,9,'Arjen','Torwesten',NULL,NULL,0,0),(219,3,'Stefan','Thesing',NULL,NULL,10,56),(220,3,'Sebastian','Sieverding',NULL,NULL,136,315),(221,8,'Fabian','Heisterkamp',NULL,NULL,0,0),(222,6,'Johann','Heynck',NULL,NULL,0,0),(223,3,'Alex',NULL,'Alex',NULL,0,2),(224,3,'Alexander','Kerkhoff',NULL,NULL,20,218),(225,3,'Bernhard','Enning','Ente',NULL,0,15),(226,3,'Christian','Selting',NULL,NULL,0,22),(227,3,'Dennis','Kamp',NULL,NULL,10,22),(228,3,'Frank','Sühling',NULL,NULL,1,6),(229,3,'Hartmut','Holtkamp',NULL,NULL,0,4),(230,3,'Heiner','Sunderhaus',NULL,NULL,4,22),(231,3,'Heino','Strump',NULL,NULL,0,4),(232,3,'Hendrik','Dirking',NULL,NULL,1,73),(233,3,'Ingo','Thiesing',NULL,NULL,1,82),(234,3,'Jan','Storks',NULL,NULL,2,104),(235,3,'Johannes','Schulze Holthausen',NULL,NULL,0,4),(236,3,'Jürgen','Roßkamp',NULL,NULL,2,94),(237,3,'Kevin','Meierdierks',NULL,NULL,2,5),(238,3,'Lars','Bröring',NULL,NULL,0,1),(240,3,'Marcel','Kaiser',NULL,NULL,3,4),(241,3,'Marco','Korte',NULL,NULL,3,5),(242,3,'Marius','Grevelhorst',NULL,NULL,0,1),(243,3,'Markus','Eichhorn','Ike',NULL,47,325),(244,3,'Markus','Sparwel',NULL,NULL,0,1),(245,3,'Markus','Wobbling',NULL,NULL,0,5),(246,3,'Michael','Schlottbom',NULL,NULL,10,31),(247,3,'Michael','Trepmann',NULL,NULL,1,55),(248,3,'Patrick','Schlautmann',NULL,NULL,35,78),(249,3,'Philiph Espen','Willer',NULL,NULL,0,2),(250,3,'Philipp','Baumeister',NULL,NULL,4,8),(251,3,'Rainer','Hövelbrinks',NULL,NULL,4,183);
/*!40000 ALTER TABLE `lm_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lm_player_match`
--

DROP TABLE IF EXISTS `lm_player_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm_player_match` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_match` int(11) NOT NULL,
  `id_saison_player` int(11) NOT NULL,
  `hasRedCard` tinyint(1) DEFAULT NULL,
  `hasYellowCard` tinyint(1) DEFAULT NULL,
  `hasYellowRedCard` tinyint(1) DEFAULT NULL,
  `goals` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_match` (`id_match`),
  KEY `idx_saison_player` (`id_saison_player`),
  CONSTRAINT `fk_match_in_player_match` FOREIGN KEY (`id_match`) REFERENCES `lm_match` (`id`),
  CONSTRAINT `fk_saison_player_in_player_match` FOREIGN KEY (`id_saison_player`) REFERENCES `lm_saison_player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=550 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm_player_match`
--

LOCK TABLES `lm_player_match` WRITE;
/*!40000 ALTER TABLE `lm_player_match` DISABLE KEYS */;
INSERT INTO `lm_player_match` VALUES (13,45,9,0,0,0,1),(14,45,10,0,0,0,1),(15,45,11,0,0,0,2),(16,45,12,0,0,0,1),(17,45,13,0,0,0,2),(18,45,14,0,0,0,2),(19,15,15,0,0,0,2),(20,15,14,0,0,0,2),(21,15,16,0,0,0,1),(22,15,17,0,0,0,2),(23,15,18,0,0,0,4),(24,15,19,0,0,0,1),(25,8,20,0,0,0,2),(26,8,21,0,0,0,1),(27,13,22,0,0,0,1),(28,13,23,0,0,0,2),(29,13,24,0,0,0,1),(30,13,25,0,0,0,1),(31,13,20,0,0,0,1),(32,13,26,0,0,0,3),(34,13,30,1,0,0,0),(36,13,31,0,0,0,2),(37,24,32,0,0,0,1),(38,24,33,0,0,0,1),(39,24,15,0,0,0,1),(40,11,20,0,0,0,5),(41,11,34,0,0,0,1),(42,11,35,0,0,0,2),(43,46,36,0,0,0,1),(44,46,26,0,0,0,2),(45,46,33,0,0,1,0),(46,46,37,0,0,1,0),(47,46,38,0,0,0,1),(48,46,39,0,0,0,1),(49,9,40,1,0,0,0),(50,9,20,0,0,0,2),(51,9,41,1,0,0,0),(52,9,42,0,0,0,1),(53,9,16,0,0,1,1),(54,9,15,0,0,0,1),(55,9,11,0,0,0,1),(56,9,44,0,0,1,0),(57,29,35,0,0,0,1),(58,29,21,0,0,0,1),(59,22,45,0,0,0,2),(60,22,46,0,0,0,1),(61,22,33,0,0,0,2),(62,22,21,0,0,0,2),(63,22,19,0,0,0,1),(64,47,47,0,0,0,1),(65,47,31,0,0,0,2),(66,47,48,0,0,0,2),(67,47,35,0,0,0,2),(68,43,48,0,0,0,1),(69,43,31,0,0,0,1),(70,43,49,0,0,0,1),(71,43,18,0,0,0,1),(72,43,21,0,0,0,1),(73,43,19,0,0,0,1),(74,43,50,0,0,0,1),(75,43,51,0,0,0,3),(76,17,14,0,0,0,2),(77,17,15,0,0,0,3),(78,17,32,0,0,0,1),(79,17,33,0,0,0,2),(80,17,39,0,0,0,1),(81,17,54,0,0,0,1),(82,20,13,0,0,0,3),(83,20,14,0,0,0,3),(84,20,36,0,0,0,3),(85,20,56,0,0,0,1),(86,31,14,0,0,0,1),(87,31,57,0,0,0,1),(88,2,21,0,0,0,1),(89,2,18,0,0,0,1),(90,2,19,0,0,0,1),(91,2,58,0,0,0,1),(92,2,50,0,0,0,2),(93,2,59,0,0,0,1),(94,30,60,0,0,0,1),(95,30,61,0,0,0,1),(96,30,62,0,0,0,1),(97,30,20,0,0,0,1),(98,30,63,0,0,0,1),(99,23,33,0,0,0,2),(100,23,45,0,0,0,1),(101,23,25,0,0,0,1),(103,23,65,0,0,0,1),(104,34,66,0,0,0,2),(105,34,62,0,0,0,2),(106,34,67,0,0,0,2),(107,34,61,0,0,0,1),(108,34,68,0,0,0,2),(109,44,68,0,0,0,1),(110,44,23,0,0,0,1),(111,44,41,0,0,0,1),(112,44,69,0,0,0,1),(113,10,70,0,0,0,1),(114,10,69,0,0,0,1),(115,10,71,0,0,0,1),(116,10,72,0,0,0,1),(117,4,73,0,0,0,2),(118,4,35,0,0,0,1),(119,4,74,0,0,0,1),(120,4,75,0,0,0,1),(121,16,42,0,0,0,1),(122,16,34,0,0,0,1),(123,16,20,0,0,0,1),(124,16,65,0,0,0,1),(125,4,76,0,0,0,2),(126,18,13,0,0,0,1),(127,18,42,0,0,0,1),(128,18,77,0,0,0,1),(129,18,74,0,0,0,1),(130,18,78,0,0,0,1),(131,1,58,0,0,0,1),(132,1,19,0,0,0,2),(133,1,18,0,0,0,1),(134,1,20,0,0,0,1),(135,25,72,0,0,0,1),(136,25,39,0,0,0,1),(137,3,21,0,0,0,1),(138,3,19,0,0,0,1),(139,3,37,0,0,0,1),(140,3,46,0,0,0,1),(141,3,33,0,0,0,2),(142,3,79,0,0,0,1),(143,6,18,0,0,0,1),(144,6,76,0,0,0,2),(145,6,80,0,0,0,2),(146,6,81,0,0,0,1),(147,6,50,0,0,0,1),(148,6,56,0,0,0,2),(149,6,26,0,0,0,3),(150,49,147,0,0,0,1),(151,49,89,0,0,0,1),(152,49,148,0,0,0,1),(153,57,99,0,0,0,3),(154,57,102,0,0,0,1),(155,57,94,0,0,0,1),(156,57,149,0,0,0,1),(157,57,150,0,0,0,3),(158,57,151,0,0,0,1),(159,57,152,0,0,0,1),(160,57,146,0,0,0,1),(161,57,142,0,0,0,2),(162,68,153,0,0,0,1),(163,68,127,0,0,0,1),(164,68,91,0,0,0,2),(165,77,138,0,0,0,1),(166,77,142,0,0,0,4),(167,77,128,0,0,0,1),(168,77,129,0,0,0,1),(169,77,130,0,0,0,1),(170,77,134,0,0,0,2),(171,48,89,0,0,0,2),(172,48,147,0,0,0,2),(173,48,154,0,0,0,1),(174,48,83,0,0,0,1),(175,48,155,0,0,0,1),(176,48,156,0,0,0,1),(177,48,96,0,0,0,1),(178,48,93,0,0,0,1),(179,48,157,0,0,0,1),(180,59,150,0,0,0,1),(181,59,99,0,0,0,1),(182,59,114,0,0,0,2),(183,59,112,0,0,0,1),(184,59,107,0,0,0,1),(185,73,143,0,0,0,1),(186,73,142,0,0,0,1),(187,73,147,0,0,0,1),(188,73,84,0,0,0,2),(189,73,89,0,0,0,2),(193,73,161,0,0,0,2),(195,73,162,0,0,0,1),(196,75,146,0,0,0,1),(197,75,136,0,0,0,2),(198,75,138,0,0,0,1),(199,75,140,0,0,0,1),(200,75,115,0,0,0,1),(201,75,163,0,0,0,1),(202,75,164,0,0,0,1),(203,75,107,0,0,0,1),(204,64,123,0,0,0,1),(205,64,94,0,0,0,2),(206,64,99,0,0,0,1),(207,70,132,0,0,0,1),(208,70,135,0,0,0,1),(209,70,114,0,0,0,1),(210,70,165,0,0,0,1),(211,58,148,0,0,0,2),(212,58,165,0,0,0,1),(213,58,84,0,0,0,1),(214,58,90,0,0,0,1),(215,58,166,0,0,0,1),(216,58,167,0,0,0,1),(217,58,168,0,0,0,1),(218,67,116,0,0,0,1),(219,67,117,0,0,0,2),(220,67,123,0,0,0,2),(221,67,118,0,0,0,1),(223,67,143,0,0,0,2),(224,67,136,0,0,0,1),(226,65,114,0,0,0,1),(227,65,123,0,0,0,2),(228,65,171,0,0,0,1),(234,67,175,0,0,0,2),(235,67,174,0,0,0,1),(236,71,130,0,0,0,2),(237,71,132,0,0,0,1),(238,71,123,0,0,0,1),(240,73,176,0,0,0,1),(241,55,94,0,0,0,2),(242,55,99,0,0,0,2),(243,55,102,0,0,0,1),(244,55,103,0,0,0,1),(245,55,149,0,0,0,1),(246,55,122,0,0,0,1),(247,72,130,0,0,0,3),(248,74,146,0,0,0,0),(249,54,96,0,0,0,1),(250,54,102,0,0,0,1),(251,54,99,0,0,0,1),(252,54,115,0,0,0,1),(253,52,84,0,0,0,1),(254,52,91,0,0,0,1),(255,52,166,0,0,0,2),(256,52,147,0,0,0,2),(257,52,167,0,0,0,1),(258,52,168,0,0,0,3),(259,52,177,0,0,0,0),(260,53,150,0,0,0,1),(261,53,99,0,0,0,1),(262,53,147,0,0,0,1),(263,53,178,0,0,0,1),(264,60,179,0,0,0,0),(265,51,168,0,0,0,1),(266,51,161,0,0,0,1),(267,51,89,0,0,0,1),(268,51,180,0,0,0,1),(269,51,181,0,0,0,1),(270,51,129,0,0,0,1),(271,51,182,0,0,0,1),(272,50,183,0,0,0,2),(273,50,84,0,0,0,1),(274,50,171,0,0,0,1),(275,63,147,0,0,0,1),(276,63,167,0,0,0,2),(277,63,161,0,0,0,2),(278,63,89,0,0,0,1),(279,63,123,0,0,0,1),(280,69,184,0,0,0,1),(281,69,99,0,0,0,1),(282,69,185,0,0,0,1),(283,103,283,0,0,0,1),(284,103,190,0,0,0,1),(285,103,191,0,0,0,1),(286,103,187,0,0,0,2),(292,79,188,0,0,0,1),(293,79,187,0,0,0,1),(294,79,191,0,0,0,2),(295,79,186,0,0,0,1),(296,79,231,0,0,0,1),(297,79,240,0,0,0,1),(299,93,243,0,0,0,1),(300,93,247,0,0,0,3),(301,93,250,0,0,0,2),(302,93,251,0,0,0,1),(303,93,287,0,0,0,1),(304,102,288,0,0,0,4),(305,102,254,0,0,0,2),(306,102,289,0,0,0,2),(307,102,290,0,0,0,1),(308,102,260,0,0,0,1),(309,102,291,0,0,0,1),(314,98,187,0,0,0,1),(315,98,295,0,0,0,1),(316,98,203,0,0,0,1),(317,98,191,0,0,0,1),(318,98,186,0,0,0,1),(319,98,291,0,0,0,1),(320,98,259,0,0,0,1),(321,98,296,0,0,0,1),(322,96,291,0,0,0,1),(323,96,288,0,0,0,1),(324,96,297,0,0,0,1),(325,96,298,0,0,0,1),(326,96,242,0,0,0,2),(327,96,250,0,0,0,1),(332,91,291,0,0,0,1),(333,91,288,0,0,0,1),(334,91,265,0,0,0,1),(335,91,232,0,0,0,1),(336,91,300,0,0,0,1),(337,91,235,0,0,0,1),(338,92,229,0,0,0,2),(339,92,239,0,0,0,2),(340,92,235,0,0,0,1),(341,92,232,0,0,0,2),(342,92,301,0,0,0,1),(343,92,302,0,0,0,1),(344,88,187,0,0,0,1),(345,88,229,0,0,0,1),(346,88,235,0,0,0,1),(347,88,227,0,0,0,1),(348,88,300,0,0,0,1),(349,88,303,0,0,0,1),(355,97,250,0,0,0,5),(356,97,247,0,0,0,2),(357,97,243,0,0,0,1),(358,97,306,0,0,0,1),(359,97,274,0,0,0,1),(360,97,307,0,0,0,0),(361,100,288,0,0,0,1),(362,100,302,0,0,0,2),(363,100,237,0,0,0,1),(364,105,267,0,0,0,1),(365,107,254,0,0,0,1),(366,107,291,0,0,0,1),(367,107,265,0,0,0,1),(368,107,308,0,0,0,1),(369,107,260,1,0,0,0),(370,90,247,0,0,0,2),(371,90,306,0,0,0,1),(372,90,302,0,0,0,1),(373,90,235,0,0,0,2),(374,81,291,0,0,0,2),(375,81,299,0,0,0,1),(376,81,309,0,0,0,1),(377,106,306,0,0,0,2),(378,106,310,0,0,0,1),(379,106,311,0,0,0,1),(380,95,312,0,0,0,1),(381,95,242,0,0,0,1),(382,106,270,0,0,0,1),(383,106,313,0,0,0,1),(384,95,235,0,0,0,1),(385,95,300,0,0,0,1),(386,80,186,0,0,1,2),(387,80,190,0,0,0,1),(388,80,314,0,0,0,1),(389,80,315,1,0,0,0),(390,80,316,0,0,0,1),(391,80,250,0,0,0,2),(392,101,312,0,0,0,1),(393,101,306,0,0,0,1),(394,101,250,0,0,0,0),(395,178,434,0,0,0,3),(396,178,435,0,0,0,1),(397,178,436,0,0,0,2),(399,178,438,0,0,0,1),(400,178,439,0,0,0,1),(401,152,372,0,0,0,1),(402,152,441,0,0,0,1),(403,152,357,0,0,0,2),(404,152,443,0,0,0,1),(405,152,444,0,0,0,2),(406,152,389,0,0,0,1),(407,156,446,0,0,0,1),(408,156,447,0,0,0,1),(409,156,448,0,0,0,1),(410,156,360,0,0,0,1),(411,156,450,0,0,0,1),(412,156,357,0,0,0,2),(413,159,451,0,0,0,1),(414,159,452,0,0,0,1),(415,159,453,0,0,0,1),(416,159,454,0,0,0,2),(417,159,455,0,0,0,1),(418,159,456,0,0,0,1),(419,159,457,0,0,0,1),(420,160,458,0,0,0,1),(421,160,459,0,0,0,3),(422,160,451,0,0,0,2),(423,160,460,0,0,0,3),(424,160,446,0,0,0,1),(425,188,322,0,0,0,2),(426,188,332,0,0,0,1),(427,188,461,0,0,0,4),(428,188,334,0,0,0,1),(429,188,462,0,0,0,2),(430,166,322,0,0,0,1),(431,166,324,0,0,0,1),(432,166,463,0,0,0,2),(433,166,464,0,0,0,1),(434,171,438,0,0,0,1),(435,171,465,0,0,0,2),(436,157,320,0,0,0,1),(437,157,461,0,0,0,1),(438,157,466,0,0,0,1),(439,153,455,0,0,0,2),(440,153,418,0,0,0,1),(441,153,434,0,0,0,1),(442,153,467,0,0,0,1),(443,153,450,0,0,0,1),(444,171,444,0,0,0,1),(445,171,456,0,0,0,1),(446,190,454,0,0,0,5),(447,190,455,0,0,0,2),(448,190,434,0,0,0,1),(449,190,469,0,0,0,1),(450,178,454,0,0,0,1),(451,176,455,0,0,0,2),(453,176,470,0,0,0,1),(454,176,464,0,0,0,1),(455,176,461,0,0,0,1),(457,176,456,0,0,0,1),(458,164,322,0,0,0,1),(459,164,461,0,0,0,2),(460,164,328,0,0,0,1),(461,164,471,0,0,0,1),(462,164,472,0,0,0,2),(463,164,473,0,0,0,1),(464,158,340,0,0,0,1),(465,158,473,0,0,0,1),(466,158,390,0,0,0,1),(467,172,474,0,0,0,1),(468,172,475,0,0,0,1),(469,172,476,0,0,0,1),(470,172,477,0,0,0,1),(471,182,319,0,0,0,1),(472,182,461,0,0,0,1),(473,165,461,0,0,0,1),(474,165,332,0,0,0,1),(475,165,454,0,0,0,1),(476,154,357,0,0,0,2),(477,154,361,0,0,0,1),(478,154,360,0,0,0,2),(479,154,476,0,0,0,1),(480,154,478,0,0,0,1),(481,187,479,0,0,0,1),(482,187,480,0,0,0,1),(483,187,481,0,0,0,1),(484,187,339,0,0,0,1),(485,187,341,0,0,0,4),(486,163,322,0,0,0,1),(487,163,466,0,0,0,1),(488,163,482,0,0,0,1),(489,167,464,0,0,0,1),(490,167,322,0,0,0,1),(491,167,461,0,0,0,2),(492,167,332,0,0,0,1),(493,167,428,0,0,0,2),(494,167,483,0,0,0,1),(495,167,484,0,0,0,1),(496,167,485,0,0,0,1),(497,168,387,0,0,0,1),(498,168,385,0,0,0,2),(499,168,394,0,0,0,1),(500,168,360,0,0,0,1),(501,168,358,0,0,0,1),(502,168,486,0,0,0,1),(503,168,357,0,0,0,2),(504,168,361,1,0,0,1),(505,168,372,0,0,0,1),(506,168,368,0,0,0,1),(507,168,362,0,0,0,1),(509,169,394,0,0,0,3),(510,169,395,0,0,0,1),(511,169,387,0,0,0,2),(512,169,488,0,0,0,1),(513,169,489,0,0,0,1),(514,180,490,0,0,0,1),(515,180,360,0,0,0,1),(516,180,491,0,0,0,2),(517,180,374,0,0,0,1),(518,180,371,0,0,0,1),(519,180,492,0,0,0,1),(520,180,493,0,0,0,1),(521,150,362,0,0,0,2),(522,150,358,0,0,0,1),(523,150,360,0,0,0,2),(524,150,357,0,0,0,2),(525,150,494,0,0,0,1),(526,150,495,0,0,0,1),(527,150,496,0,0,0,1),(528,150,345,0,0,0,1),(529,179,455,0,0,0,2),(530,179,434,0,0,0,2),(531,179,470,0,0,0,2),(532,179,497,0,0,0,1),(533,179,498,0,0,0,1),(534,179,469,0,0,0,1),(535,189,422,0,0,0,1),(536,189,499,0,0,0,1),(537,189,500,0,0,0,1),(538,189,429,0,0,0,2),(539,189,428,0,0,0,2),(540,189,390,0,0,0,1),(541,155,357,0,0,0,2),(542,155,358,0,0,0,1),(543,155,467,0,0,0,1),(544,155,502,0,0,0,1),(545,174,358,0,0,0,1),(546,174,503,0,0,0,1),(547,174,363,0,0,0,0),(548,183,504,0,0,0,1),(549,183,505,0,0,0,1);
/*!40000 ALTER TABLE `lm_player_match` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lm_saison`
--

DROP TABLE IF EXISTS `lm_saison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm_saison` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm_saison`
--

LOCK TABLES `lm_saison` WRITE;
/*!40000 ALTER TABLE `lm_saison` DISABLE KEYS */;
INSERT INTO `lm_saison` VALUES (1,'2012',0),(2,'2013',0),(3,'2014',0),(4,'2015',1);
/*!40000 ALTER TABLE `lm_saison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lm_saison_player`
--

DROP TABLE IF EXISTS `lm_saison_player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm_saison_player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_saison_team` int(11) NOT NULL,
  `id_player` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_lm_saison_spieler_lm_saison_mannschaft1` (`id_saison_team`),
  KEY `fk_lm_saison_spieler_lm_spieler1` (`id_player`),
  CONSTRAINT `fk_lm_saison_spieler_lm_saison_mannschaft1` FOREIGN KEY (`id_saison_team`) REFERENCES `lm_saison_team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lm_saison_spieler_lm_spieler1` FOREIGN KEY (`id_player`) REFERENCES `lm_player` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm_saison_player`
--

LOCK TABLES `lm_saison_player` WRITE;
/*!40000 ALTER TABLE `lm_saison_player` DISABLE KEYS */;
INSERT INTO `lm_saison_player` VALUES (6,1,9),(9,7,12),(10,7,13),(11,3,14),(12,3,15),(13,3,16),(14,3,17),(15,3,18),(16,3,19),(17,3,20),(18,1,21),(19,1,22),(20,2,23),(21,1,24),(22,2,25),(23,2,26),(24,2,27),(25,2,28),(26,7,29),(30,7,33),(31,7,34),(32,4,35),(33,4,36),(34,2,37),(35,5,38),(36,7,39),(37,4,40),(38,4,41),(39,4,42),(40,2,43),(41,2,44),(42,3,45),(44,2,47),(45,4,48),(46,4,49),(47,7,50),(48,7,51),(49,7,52),(50,1,53),(51,1,54),(54,4,57),(56,7,59),(57,3,60),(58,1,61),(59,3,62),(60,5,63),(61,5,64),(62,5,65),(63,2,66),(65,2,68),(66,5,69),(67,5,70),(68,7,71),(69,2,72),(70,2,73),(71,2,74),(72,4,75),(73,5,76),(74,5,77),(75,5,78),(76,1,79),(77,3,47),(78,5,80),(79,4,81),(80,1,82),(81,1,83),(82,8,24),(83,8,83),(84,8,79),(85,8,53),(86,8,21),(87,8,54),(88,8,9),(89,8,61),(90,8,82),(91,8,22),(92,9,72),(93,9,68),(94,9,37),(95,9,73),(96,9,27),(97,9,47),(98,9,28),(99,9,23),(100,9,43),(101,9,25),(102,9,74),(103,9,26),(104,9,44),(105,9,66),(106,10,20),(107,10,60),(108,10,16),(109,10,19),(110,10,14),(111,10,17),(112,10,45),(113,10,15),(114,10,18),(115,10,62),(116,11,41),(117,11,48),(118,11,42),(119,11,81),(120,11,49),(121,11,35),(122,11,36),(123,11,40),(124,11,57),(125,11,75),(126,12,77),(127,12,64),(128,12,76),(129,12,78),(130,12,38),(131,12,70),(132,12,69),(133,12,80),(134,12,63),(135,12,65),(136,13,52),(137,13,51),(138,13,34),(139,13,50),(140,13,13),(141,13,71),(142,13,29),(143,13,59),(144,13,12),(145,13,33),(146,13,39),(147,8,84),(148,10,85),(149,9,86),(150,9,87),(151,9,88),(152,13,89),(153,12,90),(154,8,91),(155,8,92),(156,9,93),(157,9,44),(158,13,94),(159,13,95),(160,13,96),(161,8,97),(162,8,98),(163,10,99),(164,10,100),(165,10,101),(166,8,102),(167,8,103),(168,8,104),(169,11,105),(170,11,106),(171,11,107),(172,11,108),(173,13,109),(174,13,110),(175,11,111),(176,8,112),(177,8,96),(178,8,113),(179,10,96),(180,8,114),(181,12,115),(182,12,116),(183,8,117),(184,9,118),(185,12,119),(186,14,84),(187,14,24),(188,14,104),(189,14,83),(190,14,103),(191,14,79),(192,14,53),(193,14,92),(194,14,114),(195,14,112),(196,14,91),(197,14,21),(198,14,97),(199,14,117),(200,14,54),(201,14,113),(202,14,9),(203,14,61),(205,14,102),(206,14,82),(207,14,22),(208,15,72),(209,15,68),(210,15,37),(211,15,73),(212,15,93),(213,15,87),(214,15,27),(215,15,47),(216,15,23),(217,15,28),(218,15,43),(219,15,25),(220,15,74),(221,15,118),(222,15,26),(223,15,44),(224,15,66),(225,15,88),(226,15,86),(227,16,20),(228,16,60),(229,16,16),(230,16,19),(231,16,99),(232,16,14),(233,16,100),(234,16,101),(235,16,85),(236,16,17),(237,16,45),(238,16,15),(239,16,18),(240,16,62),(241,17,41),(242,17,48),(243,17,42),(244,17,81),(245,17,107),(246,17,49),(247,17,35),(248,17,106),(249,17,108),(250,17,36),(251,17,40),(252,17,75),(253,17,57),(254,18,77),(255,18,64),(256,18,115),(257,18,90),(258,18,76),(259,18,116),(260,18,78),(261,18,38),(262,18,69),(263,18,119),(264,18,80),(265,18,63),(266,18,65),(267,19,52),(268,19,51),(269,19,94),(270,19,34),(271,19,89),(272,19,50),(273,19,110),(274,19,13),(276,19,109),(277,19,29),(278,19,59),(279,19,95),(280,19,12),(281,19,33),(282,19,39),(283,14,120),(285,19,122),(286,15,123),(287,17,92),(288,18,124),(289,18,125),(290,18,126),(291,18,127),(292,15,128),(293,15,129),(294,17,130),(295,14,131),(296,14,132),(297,18,133),(298,18,134),(299,18,135),(300,16,136),(301,16,137),(302,16,138),(303,16,139),(304,18,140),(305,18,141),(306,17,142),(307,17,96),(308,18,143),(309,18,144),(310,17,145),(311,17,146),(312,17,147),(313,19,148),(314,17,149),(315,17,150),(316,17,151),(317,22,20),(318,22,60),(319,22,16),(320,22,19),(321,22,99),(322,22,14),(323,22,100),(324,22,138),(325,22,101),(326,22,17),(327,22,85),(328,22,45),(329,22,15),(330,22,139),(331,22,137),(332,22,136),(333,22,18),(334,22,62),(335,21,72),(336,21,68),(337,21,37),(338,21,128),(339,21,93),(340,21,73),(341,21,87),(342,21,27),(343,21,129),(344,21,47),(345,21,23),(346,21,28),(347,21,43),(348,21,25),(349,21,74),(350,21,118),(351,21,26),(352,21,44),(353,21,123),(354,21,66),(355,21,88),(356,21,86),(357,20,84),(358,20,24),(359,20,132),(360,20,104),(361,20,103),(362,20,79),(363,20,83),(364,20,53),(365,20,114),(366,20,112),(367,20,91),(368,20,21),(369,20,97),(370,20,117),(371,20,131),(372,20,120),(373,20,54),(374,20,113),(375,20,9),(376,20,61),(377,20,98),(378,20,102),(379,20,82),(380,20,22),(381,23,48),(382,23,42),(383,23,107),(384,23,149),(385,23,147),(386,23,49),(387,23,35),(388,23,106),(389,23,151),(390,23,142),(391,23,145),(392,23,146),(393,23,130),(394,23,36),(395,23,40),(396,23,75),(397,23,57),(398,24,144),(399,24,77),(400,24,64),(401,24,127),(402,24,126),(403,24,90),(404,24,76),(405,24,140),(406,24,135),(407,24,116),(408,24,78),(409,24,38),(410,24,133),(411,24,143),(412,24,119),(413,24,134),(414,24,80),(415,24,125),(416,24,63),(417,24,124),(418,24,65),(419,26,52),(420,26,51),(421,26,94),(422,26,34),(423,26,89),(424,26,50),(425,26,110),(426,26,13),(427,26,29),(428,26,59),(429,26,122),(430,26,95),(431,26,12),(432,26,33),(433,26,39),(434,24,152),(435,24,153),(436,24,154),(437,24,155),(438,24,156),(439,25,157),(441,20,159),(443,20,161),(444,23,162),(446,21,164),(447,21,165),(448,21,166),(450,20,168),(451,21,169),(452,21,170),(453,21,171),(454,24,172),(455,24,173),(456,24,174),(457,24,175),(458,21,176),(459,21,177),(460,21,178),(461,22,179),(462,22,180),(463,22,181),(464,22,182),(465,24,183),(466,22,184),(467,20,185),(469,24,187),(470,24,69),(471,22,188),(472,22,189),(473,23,190),(474,23,191),(475,23,192),(476,25,193),(477,25,194),(478,25,195),(479,26,196),(480,26,197),(481,26,198),(482,22,199),(483,22,200),(484,22,201),(485,22,202),(486,20,203),(488,23,205),(489,23,206),(490,25,207),(491,20,208),(492,20,209),(493,20,210),(494,21,211),(495,21,212),(496,21,213),(497,24,214),(498,24,215),(499,26,216),(500,26,217),(502,20,219),(503,20,220),(504,25,221),(505,23,222);
/*!40000 ALTER TABLE `lm_saison_player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lm_saison_team`
--

DROP TABLE IF EXISTS `lm_saison_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm_saison_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_team` int(11) NOT NULL,
  `id_saison` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_saison_team_unique` (`id_team`,`id_saison`),
  KEY `fk_saison_team_mannschaft` (`id_team`),
  KEY `fk_saison_team_saison` (`id_saison`),
  CONSTRAINT `fk_lm_saison_mannschaft_lm_mannschaft1` FOREIGN KEY (`id_team`) REFERENCES `lm_team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_lm_saison_mannschaft_lm_saison1` FOREIGN KEY (`id_saison`) REFERENCES `lm_saison` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm_saison_team`
--

LOCK TABLES `lm_saison_team` WRITE;
/*!40000 ALTER TABLE `lm_saison_team` DISABLE KEYS */;
INSERT INTO `lm_saison_team` VALUES (1,3,1),(8,3,2),(14,3,3),(20,3,4),(2,4,1),(9,4,2),(15,4,3),(21,4,4),(3,5,1),(10,5,2),(16,5,3),(22,5,4),(4,6,1),(11,6,2),(17,6,3),(23,6,4),(5,7,1),(12,7,2),(18,7,3),(24,7,4),(25,8,4),(7,9,1),(13,9,2),(19,9,3),(26,9,4);
/*!40000 ALTER TABLE `lm_saison_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `lm_scorer`
--

DROP TABLE IF EXISTS `lm_scorer`;
/*!50001 DROP VIEW IF EXISTS `lm_scorer`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `lm_scorer` AS SELECT 
 1 AS `id`,
 1 AS `id_team`,
 1 AS `id_saison`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `team_name`,
 1 AS `goals`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `lm_settings`
--

DROP TABLE IF EXISTS `lm_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm_settings` (
  `key` varchar(50) COLLATE latin1_german1_ci NOT NULL,
  `value` varchar(255) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm_settings`
--

LOCK TABLES `lm_settings` WRITE;
/*!40000 ALTER TABLE `lm_settings` DISABLE KEYS */;
INSERT INTO `lm_settings` VALUES ('design_HighlightColor','rgb(160,193,255)'),('design_Image','fussball.png'),('design_NavBackColor','green'),('design_NavFrontColor','#FFF'),('design_Title','Hobbyliga Kreis Borken 2015'),('design_TitleBackColor','green'),('design_TitleFrontColor','#FFF'),('mail_from','liga@liga-borken.de'),('mail_guestbook','1'),('mail_sendMails','1');
/*!40000 ALTER TABLE `lm_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lm_team`
--

DROP TABLE IF EXISTS `lm_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `icon` varchar(45) COLLATE latin1_german1_ci DEFAULT NULL,
  `homepage` varchar(45) COLLATE latin1_german1_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm_team`
--

LOCK TABLES `lm_team` WRITE;
/*!40000 ALTER TABLE `lm_team` DISABLE KEYS */;
INSERT INTO `lm_team` VALUES (3,'SV Holthausen',NULL,'http://www.holthausener-sv.de/'),(4,'SF Klein Reken',NULL,'http://www.sportfreundekleinreken.de/'),(5,'FC Lupine Weseke',NULL,'http://www.fc-lupine.de/'),(6,'FC Cosmos Weseke',NULL,'http://www.fc-cosmos-weseke.de.tl/'),(7,'SC Brinker Jungs',NULL,'http://www.brinker-jungs.de.tl/'),(8,'FC Böinghook',NULL,'http://www.fc-boeinghook.de.tl'),(9,'Fortuna Bieling',NULL,'http://www.fortuna-bieling.de'),(10,'Bröker Jungs Reken',NULL,'http://www.broeker-jungs.de/');
/*!40000 ALTER TABLE `lm_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lm_users`
--

DROP TABLE IF EXISTS `lm_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lm_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) COLLATE latin1_german1_ci NOT NULL,
  `password` varchar(45) COLLATE latin1_german1_ci NOT NULL,
  `firstname` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `lastname` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `email` varchar(255) COLLATE latin1_german1_ci NOT NULL,
  `id_team` int(11) DEFAULT NULL,
  `rights` enum('USER','TEAM_ADMIN','LIGA_ADMIN','ADMIN') COLLATE latin1_german1_ci NOT NULL DEFAULT 'USER',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_lm_user_lm_mannschaft1` (`id_team`),
  CONSTRAINT `fk_lm_user_lm_mannschaft1` FOREIGN KEY (`id_team`) REFERENCES `lm_team` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COLLATE=latin1_german1_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lm_users`
--

LOCK TABLES `lm_users` WRITE;
/*!40000 ALTER TABLE `lm_users` DISABLE KEYS */;
INSERT INTO `lm_users` VALUES (1,'Admin','f3d51c970c7d8a1274024db79b7fd6ec635a3511','Manfred','Roßkamp','manfred.rosskamp@gmx.de',3,'ADMIN'),(2,'Norbert','8e38e83afc2dc2b00f1c3fe5fe4e988e9ffbf181','Norbert','Roßkamp','nr@altergarten4.de',3,'ADMIN'),(4,'Bieling','34335f376ab626ad695891307faa7a59844b251a','Burkhard','Strotmann','burkhard.strotmann@t-online.de',9,'TEAM_ADMIN'),(5,'Böinghook','1b89a346a0161922f786857aa28f9b1a5042510d','Rene','Müggenborg','fcboeinghook@gmx.de',8,'TEAM_ADMIN'),(6,'Brinker','6d801fb2355a07c9e004ea4635b4ce3edfe405d7','Michael','Warmers','warmers-michael@web.de',7,'TEAM_ADMIN'),(7,'Bröker','5ddcf858d06cfc58850ac39489f0e46f4746af62','Michael','Schmidt','info@heizung-sanitaerniewerth.de',10,'TEAM_ADMIN'),(8,'Cosmos','90a288256d486987a1f089a8740ff887a809de7e','Norbert','Jägering','norbert.jaegering@borken.de',6,'TEAM_ADMIN'),(9,'Holthausen','d03b4ac0042b2b9f9bd40c84ea504b5102de6ad1','Michael','Trepmann','m.trepmann@web.de',3,'TEAM_ADMIN'),(10,'Reken','4daae30edd631ac0f778310389b4bce90c8eae28','Uwe','Sarau','Uwe.Sarau@hobart.de',4,'TEAM_ADMIN'),(11,'Lupine','f360d128f6e34b605abe36c713341d9f5081a706','Christoph','Otert-Enning','christoph-otert-enning@gmx.de',5,'TEAM_ADMIN'),(12,'Twix','f169bb0a072977fa5df1351bae1688b8d3472cf2','Michael','Raida','m.raida@t-online.de',NULL,'LIGA_ADMIN'),(14,'Jumper','8f83e728b537eda8e428aa649f73e101cc92ccfc','Jumper','','',5,'TEAM_ADMIN'),(15,'Daniel Lüdiger','ce118a686b04f45fcd183f5357175bb9dd23c298','Daniel','Lüdiger','dluediger@aol.com',6,'TEAM_ADMIN'),(16,'DanielAdmin','03ed68dac1f810070f80fc2a1fe5e2fad8f93270','Daniel','Lüdiger','daniel-luediger@t-online.de',NULL,'ADMIN'),(17,'samename89','5ee82fbd6e8faa749861b9ccdcee1da4915299a9','Arjen','Torwesten','a.torwesten@web.de',9,'USER'),(18,'SfR','757a0a3799d6fde07712b01c9dfd7d2141f10616','Dominik','Sengenhorst','Dominik-Sengenhorst@gmx.de',4,'USER');
/*!40000 ALTER TABLE `lm_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `lm_locks`
--

/*!50001 DROP VIEW IF EXISTS `lm_locks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lm_locks` AS select `pm`.`id` AS `id`,`st`.`id_saison` AS `id_saison`,`m`.`id` AS `id_match`,`p`.`firstname` AS `firstname`,`p`.`lastname` AS `lastname`,`t`.`name` AS `team_name`,`m`.`date` AS `date` from (((((`lm_player_match` `pm` left join `lm_saison_player` `sp` on((`sp`.`id` = `pm`.`id_saison_player`))) left join `lm_saison_team` `st` on((`st`.`id` = `sp`.`id_saison_team`))) left join `lm_team` `t` on((`t`.`id` = `st`.`id_team`))) left join `lm_player` `p` on((`p`.`id` = `sp`.`id_player`))) left join `lm_match` `m` on((`m`.`id` = `pm`.`id_match`))) where `pm`.`hasRedCard` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lm_matches`
--

/*!50001 DROP VIEW IF EXISTS `lm_matches`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lm_matches` AS select `m`.`id` AS `id`,`m`.`date` AS `date`,`m`.`description` AS `description`,`m`.`goal1` AS `goal1`,`m`.`goal2` AS `goal2`,`t1`.`id` AS `team1_id`,`t1`.`name` AS `team1_name`,`t2`.`id` AS `team2_id`,`t2`.`name` AS `team2_name`,`s`.`id` AS `saison_id`,`s`.`name` AS `saison_name`,cast(((`s`.`id` * 1000000) + ((`t1`.`id` * 1000) + `t2`.`id`)) as char charset utf8) AS `my_key` from (((((`lm_match` `m` left join `lm_saison_team` `st1` on((`m`.`id_saison_team1` = `st1`.`id`))) left join `lm_team` `t1` on((`st1`.`id_team` = `t1`.`id`))) left join `lm_saison_team` `st2` on((`m`.`id_saison_team2` = `st2`.`id`))) left join `lm_team` `t2` on((`st2`.`id_team` = `t2`.`id`))) left join `lm_saison` `s` on((`st1`.`id_saison` = `s`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lm_play_table`
--

/*!50001 DROP VIEW IF EXISTS `lm_play_table`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lm_play_table` AS select `st`.`id_saison` AS `id_saison`,`t`.`id` AS `id`,`t`.`name` AS `name`,`t`.`icon` AS `icon`,`t`.`homepage` AS `homepage`,ifnull((select count(0) AS `count(*)` from `lm_match` where (((`lm_match`.`id_saison_team1` = `st`.`id`) and (`lm_match`.`goal1` is not null)) or ((`lm_match`.`id_saison_team2` = `st`.`id`) and (`lm_match`.`goal1` is not null)))),0) AS `match_count`,(ifnull((select sum(ifnull(`lm_match`.`goal1`,0)) AS `sum(IFNULL(goal1,0))` from `lm_match` where (`lm_match`.`id_saison_team1` = `st`.`id`)),0) + ifnull((select sum(ifnull(`lm_match`.`goal2`,0)) AS `sum(IFNULL(goal2,0))` from `lm_match` where (`lm_match`.`id_saison_team2` = `st`.`id`)),0)) AS `shoot`,(ifnull((select sum(ifnull(`lm_match`.`goal2`,0)) AS `sum(IFNULL(goal2,0))` from `lm_match` where (`lm_match`.`id_saison_team1` = `st`.`id`)),0) + ifnull((select sum(ifnull(`lm_match`.`goal1`,0)) AS `sum(IFNULL(goal1,0))` from `lm_match` where (`lm_match`.`id_saison_team2` = `st`.`id`)),0)) AS `got`,ifnull((select count(0) AS `count(*)` from `lm_match` where (((`lm_match`.`id_saison_team1` = `st`.`id`) and (`lm_match`.`goal1` > `lm_match`.`goal2`)) or ((`lm_match`.`id_saison_team2` = `st`.`id`) and (`lm_match`.`goal2` > `lm_match`.`goal1`)))),0) AS `wins`,ifnull((select count(0) AS `count(*)` from `lm_match` where (((`lm_match`.`id_saison_team1` = `st`.`id`) or (`lm_match`.`id_saison_team2` = `st`.`id`)) and (`lm_match`.`goal1` = `lm_match`.`goal2`))),0) AS `stand_off` from (`lm_saison_team` `st` left join `lm_team` `t` on((`t`.`id` = `st`.`id_team`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lm_scorer`
--

/*!50001 DROP VIEW IF EXISTS `lm_scorer`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lm_scorer` AS select `p`.`id` AS `id`,`t`.`id` AS `id_team`,`st`.`id_saison` AS `id_saison`,`p`.`firstname` AS `firstname`,`p`.`lastname` AS `lastname`,`t`.`name` AS `team_name`,(select sum(ifnull(`pm`.`goals`,0)) AS `sum(ifnull(``pm``.``goals``,0))` from `lm_player_match` `pm` where (`pm`.`id_saison_player` = `sp`.`id`)) AS `goals` from (((`lm_saison_player` `sp` left join `lm_player` `p` on((`p`.`id` = `sp`.`id_player`))) left join `lm_saison_team` `st` on((`st`.`id` = `sp`.`id_saison_team`))) left join `lm_team` `t` on((`t`.`id` = `st`.`id_team`))) */;
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

-- Dump completed on 2016-03-03 18:25:39
