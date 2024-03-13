/*
 Navicat Premium Data Transfer

 Source Server         : 172.16.4.33
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : 172.16.4.33:23306
 Source Schema         : wvp

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 28/02/2023 16:08:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gb_stream_s
-- ----------------------------
DROP TABLE IF EXISTS `gb_stream_s`;
CREATE TABLE `gb_stream_s` (
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
) ENGINE=InnoDB AUTO_INCREMENT=301088 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of gb_stream_s
-- ----------------------------
BEGIN;
INSERT INTO `gb_stream_s` (`gbStreamId`, `app`, `stream`, `gbId`, `name`, `longitude`, `latitude`, `streamType`, `mediaServerId`, `createTime`) VALUES (301069, 'rtsp', '123', '34020000001320000006', 'rtsp', 0, 0, 'proxy', 'FQ3TF8yT83wh5Wvz', '2023-02-27 10:34:41');
INSERT INTO `gb_stream_s` (`gbStreamId`, `app`, `stream`, `gbId`, `name`, `longitude`, `latitude`, `streamType`, `mediaServerId`, `createTime`) VALUES (301070, 'rtsp', '223', '34020000001320000007', 'rtsp2', 0, 0, 'proxy', 'FQ3TF8yT83wh5Wvz', '2023-02-27 10:56:46');
INSERT INTO `gb_stream_s` (`gbStreamId`, `app`, `stream`, `gbId`, `name`, `longitude`, `latitude`, `streamType`, `mediaServerId`, `createTime`) VALUES (301071, 'rtsp', '323', '34020000001320000008', 'rtsp3', 0, 0, 'proxy', 'FQ3TF8yT83wh5Wvz', '2023-02-27 10:57:52');
INSERT INTO `gb_stream_s` (`gbStreamId`, `app`, `stream`, `gbId`, `name`, `longitude`, `latitude`, `streamType`, `mediaServerId`, `createTime`) VALUES (301072, 'rtsp', '423', '34020000001320000009', 'rtmp', 0, 0, 'proxy', 'FQ3TF8yT83wh5Wvz', '2023-02-27 10:58:53');
INSERT INTO `gb_stream_s` (`gbStreamId`, `app`, `stream`, `gbId`, `name`, `longitude`, `latitude`, `streamType`, `mediaServerId`, `createTime`) VALUES (301073, 'rtsp', '523', '34020000001320000010', 'rtmp2', 0, 0, 'proxy', 'FQ3TF8yT83wh5Wvz', '2023-02-27 14:51:56');
INSERT INTO `gb_stream_s` (`gbStreamId`, `app`, `stream`, `gbId`, `name`, `longitude`, `latitude`, `streamType`, `mediaServerId`, `createTime`) VALUES (301074, 'rtsp', '623', '34020000001320000011', 'rtmp3', 0, 0, 'proxy', 'FQ3TF8yT83wh5Wvz', '2023-02-27 14:53:12');
INSERT INTO `gb_stream_s` (`gbStreamId`, `app`, `stream`, `gbId`, `name`, `longitude`, `latitude`, `streamType`, `mediaServerId`, `createTime`) VALUES (301075, 'rtsp', '723', '34020000001320000012', 'rtmp4', 0, 0, 'proxy', 'FQ3TF8yT83wh5Wvz', '2023-02-27 14:53:59');
INSERT INTO `gb_stream_s` (`gbStreamId`, `app`, `stream`, `gbId`, `name`, `longitude`, `latitude`, `streamType`, `mediaServerId`, `createTime`) VALUES (301076, 'rtsp', '823', '34020000001320000013', 'rtmp5', 0, 0, 'proxy', 'FQ3TF8yT83wh5Wvz', '2023-02-27 14:54:47');
INSERT INTO `gb_stream_s` (`gbStreamId`, `app`, `stream`, `gbId`, `name`, `longitude`, `latitude`, `streamType`, `mediaServerId`, `createTime`) VALUES (301077, 'rtsp', '923', '34020000001320000014', 'rtmp6', 0, 0, 'proxy', 'FQ3TF8yT83wh5Wvz', '2023-02-27 14:55:41');
INSERT INTO `gb_stream_s` (`gbStreamId`, `app`, `stream`, `gbId`, `name`, `longitude`, `latitude`, `streamType`, `mediaServerId`, `createTime`) VALUES (301078, 'rtsp', '1023', '34020000001320000015', 'rtmp7', 0, 0, 'proxy', 'FQ3TF8yT83wh5Wvz', '2023-02-27 14:57:21');
INSERT INTO `gb_stream_s` (`gbStreamId`, `app`, `stream`, `gbId`, `name`, `longitude`, `latitude`, `streamType`, `mediaServerId`, `createTime`) VALUES (301079, 'rtsp', '1123', '34020000001320000016', 'rtmp8', 0, 0, 'proxy', 'FQ3TF8yT83wh5Wvz', '2023-02-27 14:58:07');
INSERT INTO `gb_stream_s` (`gbStreamId`, `app`, `stream`, `gbId`, `name`, `longitude`, `latitude`, `streamType`, `mediaServerId`, `createTime`) VALUES (301080, 'rtsp', '1223', '34020000001320000017', 'rtmp9', 0, 0, 'proxy', 'FQ3TF8yT83wh5Wvz', '2023-02-27 14:58:50');
INSERT INTO `gb_stream_s` (`gbStreamId`, `app`, `stream`, `gbId`, `name`, `longitude`, `latitude`, `streamType`, `mediaServerId`, `createTime`) VALUES (301081, 'rtsp', '1323', '34020000001320000018', 'rtmp10', 0, 0, 'proxy', 'FQ3TF8yT83wh5Wvz', '2023-02-27 15:03:31');
INSERT INTO `gb_stream_s` (`gbStreamId`, `app`, `stream`, `gbId`, `name`, `longitude`, `latitude`, `streamType`, `mediaServerId`, `createTime`) VALUES (301082, 'rtsp', '1423', '34020000001320000019', 'rtmp11', 0, 0, 'proxy', 'FQ3TF8yT83wh5Wvz', '2023-02-27 15:04:10');
INSERT INTO `gb_stream_s` (`gbStreamId`, `app`, `stream`, `gbId`, `name`, `longitude`, `latitude`, `streamType`, `mediaServerId`, `createTime`) VALUES (301083, 'rtsp', '1523', '34020000001320000020', 'rtmp12', 0, 0, 'proxy', 'FQ3TF8yT83wh5Wvz', '2023-02-27 15:04:54');
INSERT INTO `gb_stream_s` (`gbStreamId`, `app`, `stream`, `gbId`, `name`, `longitude`, `latitude`, `streamType`, `mediaServerId`, `createTime`) VALUES (301084, 'rtsp', '1623', '34020000001320000021', 'rtmp13', 0, 0, 'proxy', 'FQ3TF8yT83wh5Wvz', '2023-02-27 15:05:29');
INSERT INTO `gb_stream_s` (`gbStreamId`, `app`, `stream`, `gbId`, `name`, `longitude`, `latitude`, `streamType`, `mediaServerId`, `createTime`) VALUES (301086, 'hhh', '11233', '34020000001320000022', 'sdfsdfsf', 0, 0, 'proxy', 'FQ3TF8yT83wh5', '2023-02-27 17:16:53');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
