-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: cyberlife
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `gh`
--

DROP TABLE IF EXISTS `gh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gh` (
  `ghid` int unsigned NOT NULL AUTO_INCREMENT,
  `gid` int unsigned NOT NULL,
  `hid` int unsigned NOT NULL,
  PRIMARY KEY (`ghid`) USING BTREE,
  UNIQUE KEY `uq_gh__gid_hid` (`gid`,`hid`) USING BTREE,
  KEY `fk_gh_human` (`hid`) USING BTREE,
  CONSTRAINT `fk_gh_group` FOREIGN KEY (`gid`) REFERENCES `group` (`gid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_gh_human` FOREIGN KEY (`hid`) REFERENCES `human` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gh`
--

LOCK TABLES `gh` WRITE;
/*!40000 ALTER TABLE `gh` DISABLE KEYS */;
INSERT INTO `gh` VALUES (1,1,1),(2,1,2),(3,2,2);
/*!40000 ALTER TABLE `gh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `gid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Group ID',
  `gname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Group Name',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Group Content',
  PRIMARY KEY (`gid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'Developer','Developer'),(2,'Manager','Management');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `human`
--

DROP TABLE IF EXISTS `human`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `human` (
  `hid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'human id',
  `human` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'human name',
  PRIMARY KEY (`hid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `human`
--

LOCK TABLES `human` WRITE;
/*!40000 ALTER TABLE `human` DISABLE KEYS */;
INSERT INTO `human` VALUES (1,'Stone'),(2,'Star');
/*!40000 ALTER TABLE `human` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdepend`
--

DROP TABLE IF EXISTS `pdepend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pdepend` (
  `pdid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL DEFAULT '0',
  `dpid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`pdid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pdepend`
--

LOCK TABLES `pdepend` WRITE;
/*!40000 ALTER TABLE `pdepend` DISABLE KEYS */;
INSERT INTO `pdepend` VALUES (1,1,5),(2,2,5),(3,3,5),(4,2,1),(5,3,1);
/*!40000 ALTER TABLE `pdepend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pgr`
--

DROP TABLE IF EXISTS `pgr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pgr` (
  `pgr` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL,
  `gid` int unsigned NOT NULL,
  `rid` int unsigned NOT NULL,
  PRIMARY KEY (`pgr`) USING BTREE,
  KEY `fk_pgr_pid` (`pid`) USING BTREE,
  KEY `fk_pgr_gid` (`gid`) USING BTREE,
  KEY `fk_pgr_rid` (`rid`) USING BTREE,
  CONSTRAINT `fk_pgr_gid` FOREIGN KEY (`gid`) REFERENCES `group` (`gid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_pgr_pid` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_pgr_rid` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pgr`
--

LOCK TABLES `pgr` WRITE;
/*!40000 ALTER TABLE `pgr` DISABLE KEYS */;
INSERT INTO `pgr` VALUES (1,1,1,1),(2,2,1,1),(3,3,1,1),(4,1,2,2);
/*!40000 ALTER TABLE `pgr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phr`
--

DROP TABLE IF EXISTS `phr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phr` (
  `phid` int unsigned NOT NULL AUTO_INCREMENT,
  `pid` int unsigned NOT NULL,
  `hid` int unsigned NOT NULL,
  `rid` int unsigned NOT NULL,
  PRIMARY KEY (`phid`) USING BTREE,
  KEY `fk_phr_pid` (`pid`) USING BTREE,
  KEY `fk_phr_hid` (`hid`) USING BTREE,
  KEY `fk_phr_rid` (`rid`) USING BTREE,
  CONSTRAINT `fk_phr_hid` FOREIGN KEY (`hid`) REFERENCES `human` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_phr_pid` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_phr_rid` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phr`
--

LOCK TABLES `phr` WRITE;
/*!40000 ALTER TABLE `phr` DISABLE KEYS */;
INSERT INTO `phr` VALUES (1,1,1,1),(2,2,1,1),(3,3,1,1);
/*!40000 ALTER TABLE `phr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plog`
--

DROP TABLE IF EXISTS `plog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plog` (
  `lid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `pid` int unsigned NOT NULL COMMENT 'Project ID',
  `action` int NOT NULL COMMENT 'Action',
  `aname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Action Name',
  `target_id` int unsigned DEFAULT '0' COMMENT 'The Target ID',
  `target_type` int DEFAULT '0' COMMENT 'Target Type',
  `content` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'content',
  `dt` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'log time',
  PRIMARY KEY (`lid`) USING BTREE,
  KEY `fk_log_task` (`pid`) USING BTREE,
  CONSTRAINT `fk_plog_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plog`
--

LOCK TABLES `plog` WRITE;
/*!40000 ALTER TABLE `plog` DISABLE KEYS */;
INSERT INTO `plog` VALUES (1,1,1,'Created Project',0,0,'Created Project','2020-06-12 18:44:37'),(2,2,1,'Created Project',0,0,'Created Project','2020-06-12 18:44:49'),(3,3,1,'Created Project',0,0,'Created Project','2020-06-12 18:44:59'),(4,1,2,'PGR',1,0,'P1<-G1','2020-06-12 20:16:54'),(5,1,2,'PGR',2,0,'P1<-G2','2020-06-12 20:17:20');
/*!40000 ALTER TABLE `plog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `pid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Project ID',
  `pname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Project Name',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Project Content',
  `pptype` enum('public','private') NOT NULL DEFAULT 'public',
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'Eureka','Eureka Math Moduling','public'),(2,'Winning','Winning Trade Software','public'),(3,'SpaceForce','SpaceForce IDE (Integrated Development Environment)','public'),(4,'Numen','Bodyguard Of The System','public'),(5,'Painting','The Visullazation Componets And Framework','public');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pschedule`
--

DROP TABLE IF EXISTS `pschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pschedule` (
  `sid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'schedule id',
  `pid` int unsigned NOT NULL COMMENT 'project id',
  `stime` datetime NOT NULL COMMENT 'start time',
  `etime` datetime NOT NULL COMMENT 'end time',
  `duration` int DEFAULT NULL COMMENT 'duration',
  `state` int NOT NULL COMMENT 'the status of the schedule',
  `why` int DEFAULT NULL COMMENT 'the reason of change ',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `fk_pschedule_project` (`pid`) USING BTREE,
  KEY `fk_pshedule_human` (`hid`) USING BTREE,
  CONSTRAINT `fk_pschedule_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_pshedule_human` FOREIGN KEY (`hid`) REFERENCES `human` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pschedule`
--

LOCK TABLES `pschedule` WRITE;
/*!40000 ALTER TABLE `pschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `pschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `rid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Role ID',
  `rname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Role Name',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Role Content',
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Developer','Developer'),(2,'Manager','Management');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `tid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Task ID',
  `tname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Task Name',
  `pid` int unsigned NOT NULL COMMENT 'Project ID',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Task Content',
  `ptid` int unsigned DEFAULT '0' COMMENT 'Parent Task ID',
  PRIMARY KEY (`tid`) USING BTREE,
  KEY `fk_task_project` (`pid`) USING BTREE,
  KEY `fk_task_parent_task` (`ptid`) USING BTREE,
  CONSTRAINT `fk_task_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,'Moduling Eureka',1,'Moduling Eureka',0),(2,'Moduling Trade',1,'Moduling Trade',0);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tdepend`
--

DROP TABLE IF EXISTS `tdepend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tdepend` (
  `tdid` int unsigned NOT NULL AUTO_INCREMENT,
  `tid` int unsigned NOT NULL DEFAULT '0',
  `dtid` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`tdid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tdepend`
--

LOCK TABLES `tdepend` WRITE;
/*!40000 ALTER TABLE `tdepend` DISABLE KEYS */;
/*!40000 ALTER TABLE `tdepend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tgr`
--

DROP TABLE IF EXISTS `tgr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tgr` (
  `tgid` int unsigned NOT NULL AUTO_INCREMENT,
  `tid` int unsigned NOT NULL,
  `gid` int unsigned NOT NULL,
  `rid` int unsigned NOT NULL,
  PRIMARY KEY (`tgid`) USING BTREE,
  KEY `fk_thr_group` (`tid`) USING BTREE,
  KEY `fk_tgr_group` (`gid`) USING BTREE,
  KEY `fk_tgr_role` (`rid`) USING BTREE,
  CONSTRAINT `fk_tgr_group` FOREIGN KEY (`gid`) REFERENCES `group` (`gid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tgr_role` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_thr_task` FOREIGN KEY (`tid`) REFERENCES `task` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tgr`
--

LOCK TABLES `tgr` WRITE;
/*!40000 ALTER TABLE `tgr` DISABLE KEYS */;
INSERT INTO `tgr` VALUES (1,1,1,1),(2,2,1,1);
/*!40000 ALTER TABLE `tgr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thr`
--

DROP TABLE IF EXISTS `thr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thr` (
  `thid` int unsigned NOT NULL AUTO_INCREMENT,
  `tid` int unsigned NOT NULL,
  `hid` int unsigned NOT NULL,
  `rid` int unsigned NOT NULL,
  PRIMARY KEY (`thid`) USING BTREE,
  KEY `fk_th_task` (`tid`) USING BTREE,
  KEY `fk_th_human` (`hid`) USING BTREE,
  KEY `fk_th_rid` (`rid`) USING BTREE,
  CONSTRAINT `fk_th_human` FOREIGN KEY (`hid`) REFERENCES `human` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_th_rid` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_th_task` FOREIGN KEY (`tid`) REFERENCES `task` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thr`
--

LOCK TABLES `thr` WRITE;
/*!40000 ALTER TABLE `thr` DISABLE KEYS */;
INSERT INTO `thr` VALUES (1,1,1,1),(2,2,1,1);
/*!40000 ALTER TABLE `thr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tlog`
--

DROP TABLE IF EXISTS `tlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tlog` (
  `lid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `tid` int unsigned NOT NULL COMMENT 'Task ID',
  `action` int NOT NULL COMMENT 'Action',
  `target_id` int unsigned DEFAULT '0' COMMENT 'Target ID',
  `target_type` int DEFAULT '0' COMMENT 'Target Type',
  `aname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Action Name',
  `content` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'content',
  PRIMARY KEY (`lid`) USING BTREE,
  KEY `fk_log_task` (`tid`) USING BTREE,
  CONSTRAINT `fk_log_task` FOREIGN KEY (`tid`) REFERENCES `task` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tlog`
--

LOCK TABLES `tlog` WRITE;
/*!40000 ALTER TABLE `tlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `tlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tschedule`
--

DROP TABLE IF EXISTS `tschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tschedule` (
  `sid` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'schedule id',
  `tid` int unsigned NOT NULL COMMENT 'task id',
  `stime` datetime NOT NULL COMMENT 'start time',
  `etime` datetime NOT NULL COMMENT 'end time',
  `duration` int DEFAULT NULL COMMENT 'duration',
  `state` int NOT NULL COMMENT 'the status of the schedule',
  `why` int DEFAULT NULL COMMENT 'the reason of change ',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hid` int unsigned DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  KEY `fk_tschedule_task` (`tid`) USING BTREE,
  KEY `fk_tschedule_human` (`hid`) USING BTREE,
  CONSTRAINT `fk_tschedule_human` FOREIGN KEY (`hid`) REFERENCES `human` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tschedule_task` FOREIGN KEY (`tid`) REFERENCES `task` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tschedule`
--

LOCK TABLES `tschedule` WRITE;
/*!40000 ALTER TABLE `tschedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `tschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_pghr`
--

DROP TABLE IF EXISTS `v_pghr`;
/*!50001 DROP VIEW IF EXISTS `v_pghr`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_pghr` AS SELECT 
 1 AS `pid`,
 1 AS `pname`,
 1 AS `pcontent`,
 1 AS `human`,
 1 AS `rname`,
 1 AS `rcontent`,
 1 AS `gname`,
 1 AS `gid`,
 1 AS `rid`,
 1 AS `hid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_pgr`
--

DROP TABLE IF EXISTS `v_pgr`;
/*!50001 DROP VIEW IF EXISTS `v_pgr`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_pgr` AS SELECT 
 1 AS `pgr`,
 1 AS `pid`,
 1 AS `gid`,
 1 AS `rid`,
 1 AS `gname`,
 1 AS `rname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_phr`
--

DROP TABLE IF EXISTS `v_phr`;
/*!50001 DROP VIEW IF EXISTS `v_phr`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_phr` AS SELECT 
 1 AS `human`,
 1 AS `rname`,
 1 AS `pid`,
 1 AS `pname`,
 1 AS `content`,
 1 AS `hid`,
 1 AS `rid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_tghr`
--

DROP TABLE IF EXISTS `v_tghr`;
/*!50001 DROP VIEW IF EXISTS `v_tghr`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_tghr` AS SELECT 
 1 AS `tgid`,
 1 AS `tid`,
 1 AS `gid`,
 1 AS `rid`,
 1 AS `tname`,
 1 AS `pid`,
 1 AS `human`,
 1 AS `gname`,
 1 AS `hid`,
 1 AS `pname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_tgr`
--

DROP TABLE IF EXISTS `v_tgr`;
/*!50001 DROP VIEW IF EXISTS `v_tgr`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_tgr` AS SELECT 
 1 AS `tgid`,
 1 AS `tid`,
 1 AS `gid`,
 1 AS `rid`,
 1 AS `tname`,
 1 AS `pid`,
 1 AS `gname`,
 1 AS `rname`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_thr`
--

DROP TABLE IF EXISTS `v_thr`;
/*!50001 DROP VIEW IF EXISTS `v_thr`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v_thr` AS SELECT 
 1 AS `thid`,
 1 AS `tid`,
 1 AS `hid`,
 1 AS `tname`,
 1 AS `pid`,
 1 AS `human`,
 1 AS `rid`,
 1 AS `rname`,
 1 AS `pname`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'cyberlife'
--

--
-- Final view structure for view `v_pghr`
--

/*!50001 DROP VIEW IF EXISTS `v_pghr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cyberlife`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_pghr` AS select `p`.`pid` AS `pid`,`p`.`pname` AS `pname`,`p`.`content` AS `pcontent`,`h`.`human` AS `human`,`r`.`rname` AS `rname`,`r`.`content` AS `rcontent`,`g`.`gname` AS `gname`,`pgr`.`gid` AS `gid`,`pgr`.`rid` AS `rid`,`h`.`hid` AS `hid` from (((((`project` `p` join `pgr` on((`p`.`pid` = `pgr`.`pid`))) join `group` `g` on((`pgr`.`gid` = `g`.`gid`))) join `gh` on((`g`.`gid` = `gh`.`gid`))) join `human` `h` on((`gh`.`hid` = `h`.`hid`))) join `role` `r` on((`pgr`.`rid` = `r`.`rid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_pgr`
--

/*!50001 DROP VIEW IF EXISTS `v_pgr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cyberlife`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_pgr` AS select `pgr`.`pgr` AS `pgr`,`pgr`.`pid` AS `pid`,`pgr`.`gid` AS `gid`,`pgr`.`rid` AS `rid`,`g`.`gname` AS `gname`,`r`.`rname` AS `rname` from (((`project` `p` join `pgr` on((`p`.`pid` = `pgr`.`pid`))) join `group` `g` on((`pgr`.`gid` = `g`.`gid`))) join `role` `r` on((`pgr`.`rid` = `r`.`rid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_phr`
--

/*!50001 DROP VIEW IF EXISTS `v_phr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cyberlife`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_phr` AS select `h`.`human` AS `human`,`r`.`rname` AS `rname`,`p`.`pid` AS `pid`,`p`.`pname` AS `pname`,`p`.`content` AS `content`,`phr`.`hid` AS `hid`,`phr`.`rid` AS `rid` from (((`project` `p` join `phr` on((`p`.`pid` = `phr`.`pid`))) join `human` `h` on((`phr`.`hid` = `h`.`hid`))) join `role` `r` on((`phr`.`rid` = `r`.`rid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_tghr`
--

/*!50001 DROP VIEW IF EXISTS `v_tghr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cyberlife`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_tghr` AS select `tgr`.`tgid` AS `tgid`,`tgr`.`tid` AS `tid`,`tgr`.`gid` AS `gid`,`tgr`.`rid` AS `rid`,`t`.`tname` AS `tname`,`t`.`pid` AS `pid`,`h`.`human` AS `human`,`g`.`gname` AS `gname`,`h`.`hid` AS `hid`,`p`.`pname` AS `pname` from (((((`tgr` join `task` `t` on((`tgr`.`tid` = `t`.`tid`))) join `group` `g` on((`tgr`.`gid` = `g`.`gid`))) join `gh` on((`g`.`gid` = `gh`.`gid`))) join `human` `h` on((`gh`.`hid` = `h`.`hid`))) join `project` `p` on((`t`.`pid` = `p`.`pid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_tgr`
--

/*!50001 DROP VIEW IF EXISTS `v_tgr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cyberlife`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_tgr` AS select `tgr`.`tgid` AS `tgid`,`tgr`.`tid` AS `tid`,`tgr`.`gid` AS `gid`,`tgr`.`rid` AS `rid`,`t`.`tname` AS `tname`,`t`.`pid` AS `pid`,`g`.`gname` AS `gname`,`r`.`rname` AS `rname` from ((((`tgr` join `task` `t` on((`tgr`.`tid` = `t`.`tid`))) join `group` `g` on((`tgr`.`gid` = `g`.`gid`))) join `role` `r` on((`tgr`.`rid` = `r`.`rid`))) join `project` `p` on((`t`.`pid` = `p`.`pid`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_thr`
--

/*!50001 DROP VIEW IF EXISTS `v_thr`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`cyberlife`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_thr` AS select `thr`.`thid` AS `thid`,`thr`.`tid` AS `tid`,`thr`.`hid` AS `hid`,`t`.`tname` AS `tname`,`t`.`pid` AS `pid`,`h`.`human` AS `human`,`thr`.`rid` AS `rid`,`r`.`rname` AS `rname`,`p`.`pname` AS `pname` from ((((`thr` join `task` `t` on((`thr`.`tid` = `t`.`tid`))) join `human` `h` on((`thr`.`hid` = `h`.`hid`))) join `role` `r` on((`thr`.`rid` = `r`.`rid`))) join `project` `p` on((`t`.`pid` = `p`.`pid`))) */;
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

-- Dump completed on 2020-06-13  1:49:35
