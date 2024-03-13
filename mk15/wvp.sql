-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: wvp
-- ------------------------------------------------------
-- Server version	5.7.29

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
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceId` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `firmware` varchar(255) DEFAULT NULL,
  `transport` varchar(50) DEFAULT NULL,
  `streamMode` varchar(50) DEFAULT NULL,
  `online` varchar(50) DEFAULT NULL,
  `registerTime` varchar(50) DEFAULT NULL,
  `keepaliveTime` varchar(50) DEFAULT NULL,
  `ip` varchar(50) NOT NULL,
  `createTime` varchar(50) NOT NULL,
  `updateTime` varchar(50) NOT NULL,
  `port` int(11) NOT NULL,
  `expires` int(11) NOT NULL,
  `subscribeCycleForCatalog` int(11) NOT NULL,
  `hostAddress` varchar(50) NOT NULL,
  `charset` varchar(50) NOT NULL,
  `subscribeCycleForMobilePosition` int(11) DEFAULT NULL,
  `mobilePositionSubmissionInterval` int(11) DEFAULT '5',
  `subscribeCycleForAlarm` int(11) DEFAULT NULL,
  `ssrcCheck` int(11) DEFAULT '0',
  `geoCoordSys` varchar(50) NOT NULL,
  `treeType` varchar(50) NOT NULL,
  `mediaServerId` varchar(50) DEFAULT 'auto',
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_deviceId_uindex` (`deviceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_alarm`
--

DROP TABLE IF EXISTS `device_alarm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_alarm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceId` varchar(50) NOT NULL,
  `channelId` varchar(50) NOT NULL,
  `alarmPriority` varchar(50) NOT NULL,
  `alarmMethod` varchar(50) DEFAULT NULL,
  `alarmTime` varchar(50) NOT NULL,
  `alarmDescription` varchar(255) DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `alarmType` varchar(50) DEFAULT NULL,
  `createTime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_alarm`
--

LOCK TABLES `device_alarm` WRITE;
/*!40000 ALTER TABLE `device_alarm` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_alarm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_channel`
--

DROP TABLE IF EXISTS `device_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channelId` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `manufacture` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `civilCode` varchar(50) DEFAULT NULL,
  `block` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `parentId` varchar(50) DEFAULT NULL,
  `safetyWay` int(11) DEFAULT NULL,
  `registerWay` int(11) DEFAULT NULL,
  `certNum` varchar(50) DEFAULT NULL,
  `certifiable` int(11) DEFAULT NULL,
  `errCode` int(11) DEFAULT NULL,
  `endTime` varchar(50) DEFAULT NULL,
  `secrecy` varchar(50) DEFAULT NULL,
  `ipAddress` varchar(50) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `PTZType` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `streamId` varchar(50) DEFAULT NULL,
  `deviceId` varchar(50) NOT NULL,
  `parental` varchar(50) DEFAULT NULL,
  `hasAudio` bit(1) DEFAULT NULL,
  `createTime` varchar(50) NOT NULL,
  `updateTime` varchar(50) NOT NULL,
  `subCount` int(11) DEFAULT '0',
  `longitudeGcj02` double DEFAULT NULL,
  `latitudeGcj02` double DEFAULT NULL,
  `longitudeWgs84` double DEFAULT NULL,
  `latitudeWgs84` double DEFAULT NULL,
  `businessGroupId` varchar(50) DEFAULT NULL,
  `gpsTime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_channel_id_uindex` (`id`),
  UNIQUE KEY `device_channel_pk` (`channelId`,`deviceId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_channel`
--

LOCK TABLES `device_channel` WRITE;
/*!40000 ALTER TABLE `device_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device_mobile_position`
--

DROP TABLE IF EXISTS `device_mobile_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device_mobile_position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceId` varchar(50) NOT NULL,
  `channelId` varchar(50) NOT NULL,
  `deviceName` varchar(255) DEFAULT NULL,
  `time` varchar(50) NOT NULL,
  `longitude` double NOT NULL,
  `latitude` double NOT NULL,
  `altitude` double DEFAULT NULL,
  `speed` double DEFAULT NULL,
  `direction` double DEFAULT NULL,
  `reportSource` varchar(50) DEFAULT NULL,
  `longitudeGcj02` double DEFAULT NULL,
  `latitudeGcj02` double DEFAULT NULL,
  `longitudeWgs84` double DEFAULT NULL,
  `latitudeWgs84` double DEFAULT NULL,
  `createTime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device_mobile_position`
--

LOCK TABLES `device_mobile_position` WRITE;
/*!40000 ALTER TABLE `device_mobile_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `device_mobile_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gb_stream`
--

DROP TABLE IF EXISTS `gb_stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gb_stream` (
  `gbStreamId` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `stream` varchar(255) NOT NULL,
  `gbId` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `streamType` varchar(50) DEFAULT NULL,
  `mediaServerId` varchar(50) DEFAULT NULL,
  `createTime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`gbStreamId`) USING BTREE,
  UNIQUE KEY `app` (`app`,`stream`) USING BTREE,
  UNIQUE KEY `gbId` (`gbId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=301136 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gb_stream`
--

LOCK TABLES `gb_stream` WRITE;
/*!40000 ALTER TABLE `gb_stream` DISABLE KEYS */;
INSERT INTO `gb_stream` VALUES (301128,'rtsp','1','34020000001320000001','1',0,0,'proxy','FQ3TF8yT83wh5Wvz','2023-03-14 17:37:30'),(301129,'rtsp','1001','34020000001320000002','Person',0,0,'proxy','FQ3TF8yT83wh5Wvz','2023-03-15 14:48:57'),(301132,'rtsp','10002','34020000001320000006','smoking',0,0,'proxy','FQ3TF8yT83wh5Wvz','2023-04-10 16:32:03'),(301135,'rtsp','10003','34020000001320000008','phone',0,0,'proxy','FQ3TF8yT83wh5Wvz','2023-04-10 16:33:58');
/*!40000 ALTER TABLE `gb_stream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `uri` varchar(200) NOT NULL,
  `address` varchar(50) NOT NULL,
  `result` varchar(50) NOT NULL,
  `timing` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `createTime` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_server`
--

DROP TABLE IF EXISTS `media_server`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_server` (
  `id` varchar(255) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `hookIp` varchar(50) NOT NULL,
  `sdpIp` varchar(50) NOT NULL,
  `streamIp` varchar(50) NOT NULL,
  `httpPort` int(11) NOT NULL,
  `httpSSlPort` int(11) NOT NULL,
  `rtmpPort` int(11) NOT NULL,
  `rtmpSSlPort` int(11) NOT NULL,
  `rtpProxyPort` int(11) NOT NULL,
  `rtspPort` int(11) NOT NULL,
  `rtspSSLPort` int(11) NOT NULL,
  `autoConfig` int(11) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `streamNoneReaderDelayMS` int(11) NOT NULL,
  `rtpEnable` int(11) NOT NULL,
  `rtpPortRange` varchar(50) NOT NULL,
  `sendRtpPortRange` varchar(50) NOT NULL,
  `recordAssistPort` int(11) NOT NULL,
  `defaultServer` int(11) NOT NULL,
  `createTime` varchar(50) NOT NULL,
  `updateTime` varchar(50) NOT NULL,
  `hookAliveInterval` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `media_server_i` (`ip`,`httpPort`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_server`
--

LOCK TABLES `media_server` WRITE;
/*!40000 ALTER TABLE `media_server` DISABLE KEYS */;
INSERT INTO `media_server` VALUES ('FQ3TF8yT83wh5Wvz','172.16.4.33','172.16.4.33','172.16.4.33','172.16.4.33',8100,443,19935,0,10000,554,0,1,'035c73f7-bb6b-4889-a715-d9eb2d1925cc',15000,1,'30000,30500','30000,30500',18081,1,'2023-04-10 10:29:41','2023-04-10 10:29:41',10);
/*!40000 ALTER TABLE `media_server` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent_platform`
--

DROP TABLE IF EXISTS `parent_platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parent_platform` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enable` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `serverGBId` varchar(50) NOT NULL,
  `serverGBDomain` varchar(50) DEFAULT NULL,
  `serverIP` varchar(50) DEFAULT NULL,
  `serverPort` int(11) DEFAULT NULL,
  `deviceGBId` varchar(50) NOT NULL,
  `deviceIp` varchar(50) DEFAULT NULL,
  `devicePort` varchar(50) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `expires` varchar(50) DEFAULT NULL,
  `keepTimeout` varchar(50) DEFAULT NULL,
  `transport` varchar(50) DEFAULT NULL,
  `characterSet` varchar(50) DEFAULT NULL,
  `catalogId` varchar(50) NOT NULL,
  `ptz` int(11) DEFAULT NULL,
  `rtcp` int(11) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `startOfflinePush` int(11) DEFAULT '0',
  `administrativeDivision` varchar(50) NOT NULL,
  `catalogGroup` int(11) DEFAULT '1',
  `createTime` varchar(50) DEFAULT NULL,
  `updateTime` varchar(50) DEFAULT NULL,
  `treeType` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parent_platform_id_uindex` (`id`),
  UNIQUE KEY `parent_platform_pk` (`serverGBId`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent_platform`
--

LOCK TABLES `parent_platform` WRITE;
/*!40000 ALTER TABLE `parent_platform` DISABLE KEYS */;
INSERT INTO `parent_platform` VALUES (48,1,'上级平台','34020000002000000012','3402000000','172.16.0.53',15060,'34020000002000000011','172.16.4.33','5060','34020000002000000011','123456','60','60','UDP','GB2312','34020000002000000011',1,0,_binary '',0,'340200',1,NULL,'2023-04-03 11:22:50','BusinessGroup');
/*!40000 ALTER TABLE `parent_platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform_catalog`
--

DROP TABLE IF EXISTS `platform_catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platform_catalog` (
  `id` varchar(50) NOT NULL,
  `platformId` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parentId` varchar(50) DEFAULT NULL,
  `civilCode` varchar(50) DEFAULT NULL,
  `businessGroupId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform_catalog`
--

LOCK TABLES `platform_catalog` WRITE;
/*!40000 ALTER TABLE `platform_catalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `platform_catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform_gb_channel`
--

DROP TABLE IF EXISTS `platform_gb_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platform_gb_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `platformId` varchar(50) NOT NULL,
  `catalogId` varchar(50) NOT NULL,
  `deviceChannelId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform_gb_channel`
--

LOCK TABLES `platform_gb_channel` WRITE;
/*!40000 ALTER TABLE `platform_gb_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `platform_gb_channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform_gb_stream`
--

DROP TABLE IF EXISTS `platform_gb_stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platform_gb_stream` (
  `platformId` varchar(50) NOT NULL,
  `catalogId` varchar(50) NOT NULL,
  `gbStreamId` int(11) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `platform_gb_stream_pk` (`platformId`,`catalogId`,`gbStreamId`)
) ENGINE=InnoDB AUTO_INCREMENT=301831 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform_gb_stream`
--

LOCK TABLES `platform_gb_stream` WRITE;
/*!40000 ALTER TABLE `platform_gb_stream` DISABLE KEYS */;
INSERT INTO `platform_gb_stream` VALUES ('34020000002000000012','34020000002000000011',301128,301825),('34020000002000000012','34020000002000000011',301129,301826),('34020000002000000012','34020000002000000011',301130,301827),('34020000002000000012','34020000002000000011',301131,301828),('34020000002000000012','34020000002000000011',301132,301829),('34020000002000000012','34020000002000000011',301135,301830);
/*!40000 ALTER TABLE `platform_gb_stream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stream_proxy`
--

DROP TABLE IF EXISTS `stream_proxy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stream_proxy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL,
  `app` varchar(255) NOT NULL,
  `stream` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `src_url` varchar(255) DEFAULT NULL,
  `dst_url` varchar(255) DEFAULT NULL,
  `timeout_ms` int(11) DEFAULT NULL,
  `ffmpeg_cmd_key` varchar(255) DEFAULT NULL,
  `rtp_type` varchar(50) DEFAULT NULL,
  `mediaServerId` varchar(50) DEFAULT NULL,
  `enable_hls` bit(1) DEFAULT NULL,
  `enable_mp4` bit(1) DEFAULT NULL,
  `enable` bit(1) NOT NULL,
  `status` bit(1) NOT NULL,
  `enable_remove_none_reader` bit(1) NOT NULL,
  `createTime` varchar(50) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `updateTime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stream_proxy_pk` (`app`,`stream`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stream_proxy`
--

LOCK TABLES `stream_proxy` WRITE;
/*!40000 ALTER TABLE `stream_proxy` DISABLE KEYS */;
INSERT INTO `stream_proxy` VALUES (1,'default','rtsp','1','rtsp://172.16.3.12:3554','','rtmp://127.0.0.1:19935/rtsp/1',0,'ffmpeg.cmd','','FQ3TF8yT83wh5Wvz',_binary '',_binary '\0',_binary '',_binary '',_binary '\0','2023-03-14 17:37:30','1',NULL),(2,'default','rtsp','1001','rtmp://172.16.4.29/ytx/v2l110162','','rtmp://127.0.0.1:19935/rtsp/1001',0,'','','FQ3TF8yT83wh5Wvz',_binary '',_binary '\0',_binary '',_binary '',_binary '\0','2023-03-15 14:48:57','Person',NULL),(5,'default','rtsp','10002','rtmp://172.16.4.29/ytx/v2l100125','','rtmp://127.0.0.1:19935/rtsp/10002',0,'ffmpeg.cmd','','FQ3TF8yT83wh5Wvz',_binary '',_binary '\0',_binary '',_binary '',_binary '\0','2023-04-10 16:32:03','smoking',NULL),(8,'default','rtsp','10003','rtmp://172.16.4.29/ytx/v2l110179	','','rtmp://127.0.0.1:19935/rtsp/10003',0,'ffmpeg.cmd','','FQ3TF8yT83wh5Wvz',_binary '',_binary '\0',_binary '',_binary '\0',_binary '\0','2023-04-10 16:33:58','phone',NULL);
/*!40000 ALTER TABLE `stream_proxy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stream_push`
--

DROP TABLE IF EXISTS `stream_push`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stream_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `stream` varchar(255) NOT NULL,
  `totalReaderCount` varchar(50) DEFAULT NULL,
  `originType` int(11) DEFAULT NULL,
  `originTypeStr` varchar(50) DEFAULT NULL,
  `createTime` varchar(50) DEFAULT NULL,
  `aliveSecond` int(11) DEFAULT NULL,
  `mediaServerId` varchar(50) DEFAULT NULL,
  `serverId` varchar(50) NOT NULL,
  `pushTime` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `updateTime` varchar(50) DEFAULT NULL,
  `pushIng` int(11) DEFAULT NULL,
  `self` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `stream_push_pk` (`app`,`stream`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stream_push`
--

LOCK TABLES `stream_push` WRITE;
/*!40000 ALTER TABLE `stream_push` DISABLE KEYS */;
/*!40000 ALTER TABLE `stream_push` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `roleId` int(11) NOT NULL,
  `createTime` varchar(50) NOT NULL,
  `updateTime` varchar(50) NOT NULL,
  `pushKey` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_username_uindex` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3',1,'2021 - 04 - 13 14:14:57','2021 - 04 - 13 14:14:57','3e80d1762a324d5b0ff636e0bd16f1e3'),(4,'admin123','4297f44b13955235245b2497399d7a93',1,'2023-02-24 12:51:52','2023-02-24 12:51:52','a4ddafec30d0d9feb1f41735e906c327'),(5,'haofw','e10adc3949ba59abbe56e057f20f883e',1,'2023-02-27 11:48:25','2023-02-27 11:48:25','72494fb4a448b67cf73e2a33fef8989a'),(6,'zenggq','e10adc3949ba59abbe56e057f20f883e',1,'2023-02-27 11:48:55','2023-02-27 11:48:55','958c0a236aaff06a67bd2aef82b81015'),(7,'xuxm','e10adc3949ba59abbe56e057f20f883e',1,'2023-02-27 11:49:08','2023-02-27 11:49:08','61edb51758ee5d7e820a598cc493ac25'),(8,'tianxj','e10adc3949ba59abbe56e057f20f883e',1,'2023-02-27 11:49:26','2023-02-27 11:49:26','3b50a75ea7518e58b8ba4d15ff2f5eff');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  `createTime` varchar(50) NOT NULL,
  `updateTime` varchar(50) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'admin','0','2021-04-13 14:14:57','2021-04-13 14:14:57');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'wvp'
--

--
-- Dumping routines for database 'wvp'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-26 11:04:51
