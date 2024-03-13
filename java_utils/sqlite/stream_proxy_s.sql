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

 Date: 28/02/2023 16:12:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for stream_proxy_s
-- ----------------------------
DROP TABLE IF EXISTS `stream_proxy_s`;
CREATE TABLE `stream_proxy_s` (
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
) ENGINE=InnoDB AUTO_INCREMENT=570 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of stream_proxy_s
-- ----------------------------
BEGIN;
INSERT INTO `stream_proxy_s` (`id`, `type`, `app`, `stream`, `url`, `src_url`, `dst_url`, `timeout_ms`, `ffmpeg_cmd_key`, `rtp_type`, `mediaServerId`, `enable_hls`, `enable_mp4`, `enable`, `status`, `enable_remove_none_reader`, `createTime`, `name`, `updateTime`) VALUES (553, 'default', 'rtsp', '123', 'rtsp://172.16.3.12:3554', '', 'rtmp://127.0.0.1:19935/rtsp/123', 0, 'ffmpeg.cmd', '0', 'FQ3TF8yT83wh5Wvz', b'1', b'0', b'1', b'1', b'0', '2023-02-27 10:34:41', 'rtsp', NULL);
INSERT INTO `stream_proxy_s` (`id`, `type`, `app`, `stream`, `url`, `src_url`, `dst_url`, `timeout_ms`, `ffmpeg_cmd_key`, `rtp_type`, `mediaServerId`, `enable_hls`, `enable_mp4`, `enable`, `status`, `enable_remove_none_reader`, `createTime`, `name`, `updateTime`) VALUES (554, 'default', 'rtsp', '223', 'rtsp://admin:hk123456@172.16.3.11:554/Streaming/Channels/101', '', 'rtmp://127.0.0.1:19935/rtsp/223', 0, 'ffmpeg.cmd', '0', 'FQ3TF8yT83wh5Wvz', b'1', b'0', b'1', b'1', b'0', '2023-02-27 10:56:46', 'rtsp2', NULL);
INSERT INTO `stream_proxy_s` (`id`, `type`, `app`, `stream`, `url`, `src_url`, `dst_url`, `timeout_ms`, `ffmpeg_cmd_key`, `rtp_type`, `mediaServerId`, `enable_hls`, `enable_mp4`, `enable`, `status`, `enable_remove_none_reader`, `createTime`, `name`, `updateTime`) VALUES (555, 'default', 'rtsp', '323', 'rtsp://admin:hk123456@172.16.3.21:2554/Streaming/Channels/101', '', 'rtmp://127.0.0.1:19935/rtsp/323', 0, 'ffmpeg.cmd', '0', 'FQ3TF8yT83wh5Wvz', b'1', b'0', b'1', b'1', b'0', '2023-02-27 10:57:52', 'rtsp3', NULL);
INSERT INTO `stream_proxy_s` (`id`, `type`, `app`, `stream`, `url`, `src_url`, `dst_url`, `timeout_ms`, `ffmpeg_cmd_key`, `rtp_type`, `mediaServerId`, `enable_hls`, `enable_mp4`, `enable`, `status`, `enable_remove_none_reader`, `createTime`, `name`, `updateTime`) VALUES (556, 'default', 'rtsp', '423', 'rtmp://172.16.4.29/ytx/v2l110113', '', 'rtmp://127.0.0.1:19935/rtsp/423', 0, 'ffmpeg.cmd', '', 'FQ3TF8yT83wh5Wvz', b'1', b'0', b'1', b'1', b'0', '2023-02-27 10:58:53', 'rtmp', NULL);
INSERT INTO `stream_proxy_s` (`id`, `type`, `app`, `stream`, `url`, `src_url`, `dst_url`, `timeout_ms`, `ffmpeg_cmd_key`, `rtp_type`, `mediaServerId`, `enable_hls`, `enable_mp4`, `enable`, `status`, `enable_remove_none_reader`, `createTime`, `name`, `updateTime`) VALUES (557, 'default', 'rtsp', '523', 'rtmp://172.16.4.29/ytx/v2l1444673', '', 'rtmp://127.0.0.1:19935/rtsp/523', 0, 'ffmpeg.cmd', '', 'FQ3TF8yT83wh5Wvz', b'1', b'0', b'1', b'1', b'0', '2023-02-27 14:51:56', 'rtmp2', NULL);
INSERT INTO `stream_proxy_s` (`id`, `type`, `app`, `stream`, `url`, `src_url`, `dst_url`, `timeout_ms`, `ffmpeg_cmd_key`, `rtp_type`, `mediaServerId`, `enable_hls`, `enable_mp4`, `enable`, `status`, `enable_remove_none_reader`, `createTime`, `name`, `updateTime`) VALUES (558, 'default', 'rtsp', '623', 'rtmp://172.16.4.29/ytx/v2l100092', '', 'rtmp://127.0.0.1:19935/rtsp/623', 0, 'ffmpeg.cmd', '', 'FQ3TF8yT83wh5Wvz', b'1', b'0', b'1', b'1', b'0', '2023-02-27 14:53:12', 'rtmp3', NULL);
INSERT INTO `stream_proxy_s` (`id`, `type`, `app`, `stream`, `url`, `src_url`, `dst_url`, `timeout_ms`, `ffmpeg_cmd_key`, `rtp_type`, `mediaServerId`, `enable_hls`, `enable_mp4`, `enable`, `status`, `enable_remove_none_reader`, `createTime`, `name`, `updateTime`) VALUES (559, 'default', 'rtsp', '723', 'rtmp://172.16.4.29/ytx/v2l110207', '', 'rtmp://127.0.0.1:19935/rtsp/723', 0, 'ffmpeg.cmd', '', 'FQ3TF8yT83wh5Wvz', b'1', b'0', b'1', b'1', b'0', '2023-02-27 14:53:59', 'rtmp4', NULL);
INSERT INTO `stream_proxy_s` (`id`, `type`, `app`, `stream`, `url`, `src_url`, `dst_url`, `timeout_ms`, `ffmpeg_cmd_key`, `rtp_type`, `mediaServerId`, `enable_hls`, `enable_mp4`, `enable`, `status`, `enable_remove_none_reader`, `createTime`, `name`, `updateTime`) VALUES (560, 'default', 'rtsp', '823', 'rtmp://172.16.4.29/ytx/v2l6', '', 'rtmp://127.0.0.1:19935/rtsp/823', 0, 'ffmpeg.cmd', '', 'FQ3TF8yT83wh5Wvz', b'1', b'0', b'1', b'1', b'0', '2023-02-27 14:54:47', 'rtmp5', NULL);
INSERT INTO `stream_proxy_s` (`id`, `type`, `app`, `stream`, `url`, `src_url`, `dst_url`, `timeout_ms`, `ffmpeg_cmd_key`, `rtp_type`, `mediaServerId`, `enable_hls`, `enable_mp4`, `enable`, `status`, `enable_remove_none_reader`, `createTime`, `name`, `updateTime`) VALUES (561, 'default', 'rtsp', '923', 'rtmp://172.16.4.29/ytx/v2l110143', '', 'rtmp://127.0.0.1:19935/rtsp/923', 0, 'ffmpeg.cmd', '', 'FQ3TF8yT83wh5Wvz', b'1', b'0', b'1', b'1', b'0', '2023-02-27 14:55:41', 'rtmp6', NULL);
INSERT INTO `stream_proxy_s` (`id`, `type`, `app`, `stream`, `url`, `src_url`, `dst_url`, `timeout_ms`, `ffmpeg_cmd_key`, `rtp_type`, `mediaServerId`, `enable_hls`, `enable_mp4`, `enable`, `status`, `enable_remove_none_reader`, `createTime`, `name`, `updateTime`) VALUES (562, 'default', 'rtsp', '1023', 'rtmp://172.16.4.29/ytx/v2l110198', '', 'rtmp://127.0.0.1:19935/rtsp/1023', 0, 'ffmpeg.cmd', '', 'FQ3TF8yT83wh5Wvz', b'1', b'0', b'1', b'1', b'0', '2023-02-27 14:57:21', 'rtmp7', NULL);
INSERT INTO `stream_proxy_s` (`id`, `type`, `app`, `stream`, `url`, `src_url`, `dst_url`, `timeout_ms`, `ffmpeg_cmd_key`, `rtp_type`, `mediaServerId`, `enable_hls`, `enable_mp4`, `enable`, `status`, `enable_remove_none_reader`, `createTime`, `name`, `updateTime`) VALUES (563, 'default', 'rtsp', '1123', 'rtmp://172.16.4.29/ytx/v2l1444671', '', 'rtmp://127.0.0.1:19935/rtsp/1123', 0, 'ffmpeg.cmd', '', 'FQ3TF8yT83wh5Wvz', b'1', b'0', b'1', b'1', b'0', '2023-02-27 14:58:07', 'rtmp8', NULL);
INSERT INTO `stream_proxy_s` (`id`, `type`, `app`, `stream`, `url`, `src_url`, `dst_url`, `timeout_ms`, `ffmpeg_cmd_key`, `rtp_type`, `mediaServerId`, `enable_hls`, `enable_mp4`, `enable`, `status`, `enable_remove_none_reader`, `createTime`, `name`, `updateTime`) VALUES (564, 'default', 'rtsp', '1223', 'rtmp://172.16.4.29/ytx/v2l1444460', '', 'rtmp://127.0.0.1:19935/rtsp/1223', 0, 'ffmpeg.cmd', '', 'FQ3TF8yT83wh5Wvz', b'1', b'0', b'1', b'1', b'0', '2023-02-27 14:58:50', 'rtmp9', NULL);
INSERT INTO `stream_proxy_s` (`id`, `type`, `app`, `stream`, `url`, `src_url`, `dst_url`, `timeout_ms`, `ffmpeg_cmd_key`, `rtp_type`, `mediaServerId`, `enable_hls`, `enable_mp4`, `enable`, `status`, `enable_remove_none_reader`, `createTime`, `name`, `updateTime`) VALUES (565, 'default', 'rtsp', '1323', 'rtmp://172.16.4.29/ytx/v2l1444467', '', 'rtmp://127.0.0.1:19935/rtsp/1323', 0, 'ffmpeg.cmd', '', 'FQ3TF8yT83wh5Wvz', b'1', b'0', b'1', b'1', b'0', '2023-02-27 15:03:31', 'rtmp10', NULL);
INSERT INTO `stream_proxy_s` (`id`, `type`, `app`, `stream`, `url`, `src_url`, `dst_url`, `timeout_ms`, `ffmpeg_cmd_key`, `rtp_type`, `mediaServerId`, `enable_hls`, `enable_mp4`, `enable`, `status`, `enable_remove_none_reader`, `createTime`, `name`, `updateTime`) VALUES (566, 'default', 'rtsp', '1423', 'rtmp://172.16.4.29/ytx/v2l1444495', '', 'rtmp://127.0.0.1:19935/rtsp/1423', 0, 'ffmpeg.cmd', '', 'FQ3TF8yT83wh5Wvz', b'1', b'0', b'1', b'1', b'0', '2023-02-27 15:04:10', 'rtmp11', NULL);
INSERT INTO `stream_proxy_s` (`id`, `type`, `app`, `stream`, `url`, `src_url`, `dst_url`, `timeout_ms`, `ffmpeg_cmd_key`, `rtp_type`, `mediaServerId`, `enable_hls`, `enable_mp4`, `enable`, `status`, `enable_remove_none_reader`, `createTime`, `name`, `updateTime`) VALUES (567, 'default', 'rtsp', '1523', 'rtmp://172.16.4.29/ytx/v2l110127', '', 'rtmp://127.0.0.1:19935/rtsp/1523', 0, 'ffmpeg.cmd', '', 'FQ3TF8yT83wh5Wvz', b'1', b'0', b'1', b'1', b'0', '2023-02-27 15:04:54', 'rtmp12', NULL);
INSERT INTO `stream_proxy_s` (`id`, `type`, `app`, `stream`, `url`, `src_url`, `dst_url`, `timeout_ms`, `ffmpeg_cmd_key`, `rtp_type`, `mediaServerId`, `enable_hls`, `enable_mp4`, `enable`, `status`, `enable_remove_none_reader`, `createTime`, `name`, `updateTime`) VALUES (568, 'default', 'rtsp', '1623', 'rtmp://172.16.4.29/ytx/v2l1444669', '', 'rtmp://127.0.0.1:19935/rtsp/1623', 0, 'ffmpeg.cmd', '', 'FQ3TF8yT83wh5Wvz', b'1', b'0', b'1', b'1', b'0', '2023-02-27 15:05:29', 'rtmp13', NULL);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
