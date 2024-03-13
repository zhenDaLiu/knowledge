/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : shopping

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 13/11/2023 15:44:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sp_brand
-- ----------------------------
DROP TABLE IF EXISTS `sp_brand`;
CREATE TABLE `sp_brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sp_brand
-- ----------------------------
BEGIN;
INSERT INTO `sp_brand` (`id`, `brand_name`, `create_time`, `remarks`, `update_time`) VALUES (1, '达利园', '2023-01-20 20:07:17.019000', NULL, '2023-01-20 20:07:17.019000');
INSERT INTO `sp_brand` (`id`, `brand_name`, `create_time`, `remarks`, `update_time`) VALUES (2, '康师傅', '2023-01-20 20:07:28.107000', NULL, '2023-01-20 20:07:28.107000');
INSERT INTO `sp_brand` (`id`, `brand_name`, `create_time`, `remarks`, `update_time`) VALUES (3, '蒙牛', '2023-02-14 22:47:15.938000', NULL, '2023-02-14 22:47:15.938000');
INSERT INTO `sp_brand` (`id`, `brand_name`, `create_time`, `remarks`, `update_time`) VALUES (4, '伊利', '2023-02-14 22:47:24.267000', NULL, '2023-02-14 22:47:24.267000');
INSERT INTO `sp_brand` (`id`, `brand_name`, `create_time`, `remarks`, `update_time`) VALUES (5, '旺旺仔', '2023-02-14 23:16:30.354000', NULL, '2023-02-14 23:16:30.354000');
INSERT INTO `sp_brand` (`id`, `brand_name`, `create_time`, `remarks`, `update_time`) VALUES (6, '哇哈哈', '2023-02-15 00:37:07.954000', NULL, '2023-02-15 00:37:07.954000');
INSERT INTO `sp_brand` (`id`, `brand_name`, `create_time`, `remarks`, `update_time`) VALUES (7, '可口可乐', '2023-02-15 00:37:14.794000', NULL, '2023-02-15 00:37:14.794000');
INSERT INTO `sp_brand` (`id`, `brand_name`, `create_time`, `remarks`, `update_time`) VALUES (8, '百事可乐', '2023-02-15 00:37:47.198000', NULL, '2023-02-15 00:37:47.198000');
INSERT INTO `sp_brand` (`id`, `brand_name`, `create_time`, `remarks`, `update_time`) VALUES (9, '达能', '2023-02-15 00:37:53.345000', NULL, '2023-02-15 00:37:53.345000');
INSERT INTO `sp_brand` (`id`, `brand_name`, `create_time`, `remarks`, `update_time`) VALUES (10, '张一元', '2023-02-15 00:38:13.142000', NULL, '2023-02-15 00:38:13.142000');
INSERT INTO `sp_brand` (`id`, `brand_name`, `create_time`, `remarks`, `update_time`) VALUES (11, '吴裕泰', '2023-02-15 00:38:20.550000', NULL, '2023-02-15 00:38:20.550000');
INSERT INTO `sp_brand` (`id`, `brand_name`, `create_time`, `remarks`, `update_time`) VALUES (12, '草善堂', '2023-02-15 00:38:48.221000', NULL, '2023-02-15 00:38:48.221000');
COMMIT;

-- ----------------------------
-- Table structure for sp_customer
-- ----------------------------
DROP TABLE IF EXISTS `sp_customer`;
CREATE TABLE `sp_customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `iphone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sp_customer
-- ----------------------------
BEGIN;
INSERT INTO `sp_customer` (`id`, `address`, `create_time`, `customer_name`, `iphone`, `remarks`, `update_time`) VALUES (1, '河北省承德市双滦区', '2023-01-20 08:33:03.732000', '金滦大酒店', '1345566447', NULL, '2023-01-20 08:33:03.732000');
INSERT INTO `sp_customer` (`id`, `address`, `create_time`, `customer_name`, `iphone`, `remarks`, `update_time`) VALUES (3, '河北省承德市承德县高寺台镇加油站南侧10米', '2023-02-14 23:03:15.265000', '新黎明度假村', '1352059529999', NULL, '2023-02-14 23:03:15.265000');
INSERT INTO `sp_customer` (`id`, `address`, `create_time`, `customer_name`, `iphone`, `remarks`, `update_time`) VALUES (4, '承德市双桥区武烈路', '2023-02-15 01:13:41.157000', '新乾隆', '134443456784', NULL, '2023-02-15 01:13:41.157000');
INSERT INTO `sp_customer` (`id`, `address`, `create_time`, `customer_name`, `iphone`, `remarks`, `update_time`) VALUES (5, '河北省承德市', '2023-02-15 01:14:37.703000', '老边饺子馆', '13244553244', NULL, '2023-02-15 01:14:37.703000');
INSERT INTO `sp_customer` (`id`, `address`, `create_time`, `customer_name`, `iphone`, `remarks`, `update_time`) VALUES (6, '河北省承德市', '2023-02-15 01:14:56.792000', '钱库', '13233432323', NULL, '2023-02-15 01:14:56.792000');
INSERT INTO `sp_customer` (`id`, `address`, `create_time`, `customer_name`, `iphone`, `remarks`, `update_time`) VALUES (7, '河北省承德市', '2023-02-15 01:15:19.287000', '承钢', '1345544322', NULL, '2023-02-15 01:15:19.287000');
COMMIT;

-- ----------------------------
-- Table structure for sp_goods
-- ----------------------------
DROP TABLE IF EXISTS `sp_goods`;
CREATE TABLE `sp_goods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `goods_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `packing_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `specifications` int DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sp_goods
-- ----------------------------
BEGIN;
INSERT INTO `sp_goods` (`id`, `create_time`, `goods_name`, `packing_type`, `price`, `remarks`, `specifications`, `stock`, `supplier_id`, `update_time`, `brand_id`) VALUES (1, '2023-01-20 19:39:12.738000', '旺仔牛奶', '1', 100, NULL, 1000, 100, 1, '2023-01-20 19:39:12.738000', 1);
INSERT INTO `sp_goods` (`id`, `create_time`, `goods_name`, `packing_type`, `price`, `remarks`, `specifications`, `stock`, `supplier_id`, `update_time`, `brand_id`) VALUES (3, '2023-01-28 06:11:12.785000', '蛋黄派', '1', 100, NULL, 100, 1000, 1, '2023-01-28 06:11:12.785000', 1);
INSERT INTO `sp_goods` (`id`, `create_time`, `goods_name`, `packing_type`, `price`, `remarks`, `specifications`, `stock`, `supplier_id`, `update_time`, `brand_id`) VALUES (4, '2023-02-13 05:26:32.658000', '碗康', '1', 10.45, NULL, 100, NULL, 1, '2023-02-13 05:26:32.658000', 2);
INSERT INTO `sp_goods` (`id`, `create_time`, `goods_name`, `packing_type`, `price`, `remarks`, `specifications`, `stock`, `supplier_id`, `update_time`, `brand_id`) VALUES (5, '2023-02-14 23:33:47.700000', '1234', '0', 1230, NULL, 1236, NULL, 1, '2023-02-14 23:33:47.700000', 1);
INSERT INTO `sp_goods` (`id`, `create_time`, `goods_name`, `packing_type`, `price`, `remarks`, `specifications`, `stock`, `supplier_id`, `update_time`, `brand_id`) VALUES (6, '2023-02-15 00:36:55.086000', '哇哈哈矿泉水', '0', 100, NULL, 100000, NULL, 2, '2023-02-15 00:36:55.086000', 5);
COMMIT;

-- ----------------------------
-- Table structure for sp_order
-- ----------------------------
DROP TABLE IF EXISTS `sp_order`;
CREATE TABLE `sp_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `admin_id` int DEFAULT NULL,
  `order_detail` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` int DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sp_order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sp_order_log
-- ----------------------------
DROP TABLE IF EXISTS `sp_order_log`;
CREATE TABLE `sp_order_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `state` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sp_order_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sp_supplier
-- ----------------------------
DROP TABLE IF EXISTS `sp_supplier`;
CREATE TABLE `sp_supplier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `iphone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `supplier_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sp_supplier
-- ----------------------------
BEGIN;
INSERT INTO `sp_supplier` (`id`, `address`, `create_time`, `iphone`, `remarks`, `supplier_name`, `update_time`) VALUES (1, '河北省承德市承德县下板城镇', '2023-01-20 19:37:34.199000', '13455665544', NULL, '乾隆醉酒业', '2023-01-20 19:37:34.199000');
INSERT INTO `sp_supplier` (`id`, `address`, `create_time`, `iphone`, `remarks`, `supplier_name`, `update_time`) VALUES (2, '河北省承德市丰宁县凤山镇', '2023-02-14 23:03:22.965000', '132223343299', NULL, '丰宁九龙醉', '2023-02-14 23:03:22.965000');
INSERT INTO `sp_supplier` (`id`, `address`, `create_time`, `iphone`, `remarks`, `supplier_name`, `update_time`) VALUES (3, '贵州省遵义市仁怀市茅台镇', '2023-02-15 00:56:14.957000', '132445543221', NULL, '贵州茅台酒股份有限公司', '2023-02-15 00:56:14.957000');
INSERT INTO `sp_supplier` (`id`, `address`, `create_time`, `iphone`, `remarks`, `supplier_name`, `update_time`) VALUES (4, '四川省宜宾市', '2023-02-15 01:11:34.404000', '1324433627893', NULL, '四川省宜宾五粮液集团有限公司', '2023-02-15 01:11:34.404000');
INSERT INTO `sp_supplier` (`id`, `address`, `create_time`, `iphone`, `remarks`, `supplier_name`, `update_time`) VALUES (5, '北京市顺义区牛栏山镇', '2023-02-15 01:12:10.187000', '173645374949', NULL, '牛栏山二锅头', '2023-02-15 01:12:10.187000');
INSERT INTO `sp_supplier` (`id`, `address`, `create_time`, `iphone`, `remarks`, `supplier_name`, `update_time`) VALUES (6, '山西省汾阳市杏花村', '2023-02-15 01:12:56.580000', '13455667788', NULL, '汾酒集团', '2023-02-15 01:12:56.580000');
COMMIT;

-- ----------------------------
-- Table structure for sp_unsubscribe
-- ----------------------------
DROP TABLE IF EXISTS `sp_unsubscribe`;
CREATE TABLE `sp_unsubscribe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sp_unsubscribe
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sp_warehousing
-- ----------------------------
DROP TABLE IF EXISTS `sp_warehousing`;
CREATE TABLE `sp_warehousing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `goods_id` int DEFAULT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `number` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of sp_warehousing
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yp_admin
-- ----------------------------
DROP TABLE IF EXISTS `yp_admin`;
CREATE TABLE `yp_admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `admin_pass` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `admin_status` int DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `background_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bandk` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bandk_account` bigint DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `is_audit` int DEFAULT NULL,
  `last_ip` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_time` datetime(6) DEFAULT NULL,
  `money` int DEFAULT NULL,
  `month_pay_price` int DEFAULT NULL,
  `name_bandk` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `nick_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `quarter_pay_price` int DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `year_pay_price` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_admin
-- ----------------------------
BEGIN;
INSERT INTO `yp_admin` (`id`, `admin_name`, `admin_pass`, `admin_status`, `avatar_url`, `background_url`, `bandk`, `bandk_account`, `create_time`, `is_audit`, `last_ip`, `last_time`, `money`, `month_pay_price`, `name_bandk`, `nick_name`, `quarter_pay_price`, `update_time`, `year_pay_price`) VALUES (1, 'liuzhenda', '7313c31fbfe479b3236bf7f2b2fb907f', 1, 'https://img0.baidu.com/it/u=3156137851,1307209439&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500', 'https://img0.baidu.com/it/u=3156137851,1307209439&fm=253&fmt=auto&app=138&f=JPEG?w=889&h=500', NULL, NULL, '2023-01-19 20:11:41.000000', NULL, '127.0.0.1', '2023-11-13 01:34:51.224000', 100, NULL, NULL, 'liuzhenda', NULL, '2023-01-19 20:11:55.000000', NULL);
INSERT INTO `yp_admin` (`id`, `admin_name`, `admin_pass`, `admin_status`, `avatar_url`, `background_url`, `bandk`, `bandk_account`, `create_time`, `is_audit`, `last_ip`, `last_time`, `money`, `month_pay_price`, `name_bandk`, `nick_name`, `quarter_pay_price`, `update_time`, `year_pay_price`) VALUES (2, 'liuchao', '123456', 1, NULL, NULL, NULL, NULL, '2023-02-13 05:21:14.640000', NULL, '127.0.0.1', '2023-02-14 23:02:47.707000', 0, NULL, NULL, 'liuchao0', NULL, '2023-02-13 05:21:14.640000', NULL);
COMMIT;

-- ----------------------------
-- Table structure for yp_lable
-- ----------------------------
DROP TABLE IF EXISTS `yp_lable`;
CREATE TABLE `yp_lable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `lable_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_lable
-- ----------------------------
BEGIN;
INSERT INTO `yp_lable` (`id`, `create_time`, `lable_name`) VALUES (1, '2023-11-13 01:12:48.391000', 'sf');
COMMIT;

-- ----------------------------
-- Table structure for yp_login_log
-- ----------------------------
DROP TABLE IF EXISTS `yp_login_log`;
CREATE TABLE `yp_login_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `addr` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `user_agent` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_login_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yp_message
-- ----------------------------
DROP TABLE IF EXISTS `yp_message`;
CREATE TABLE `yp_message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `is_read` int DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `receive` int DEFAULT NULL,
  `receive_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `send` int DEFAULT NULL,
  `send_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_message
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yp_original_apply
-- ----------------------------
DROP TABLE IF EXISTS `yp_original_apply`;
CREATE TABLE `yp_original_apply` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contact_way` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `qq` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `wx` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_original_apply
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yp_report
-- ----------------------------
DROP TABLE IF EXISTS `yp_report`;
CREATE TABLE `yp_report` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `work_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_report
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yp_user
-- ----------------------------
DROP TABLE IF EXISTS `yp_user`;
CREATE TABLE `yp_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `area` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `background_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `money` int DEFAULT NULL,
  `nick_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `personal_signature` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_user
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yp_user_advice
-- ----------------------------
DROP TABLE IF EXISTS `yp_user_advice`;
CREATE TABLE `yp_user_advice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_user_advice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yp_user_collection
-- ----------------------------
DROP TABLE IF EXISTS `yp_user_collection`;
CREATE TABLE `yp_user_collection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `work_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgyf3py3uu6kd349p4r9f7su5f` (`work_id`),
  CONSTRAINT `FKgyf3py3uu6kd349p4r9f7su5f` FOREIGN KEY (`work_id`) REFERENCES `yp_works` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_user_collection
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yp_user_deposit
-- ----------------------------
DROP TABLE IF EXISTS `yp_user_deposit`;
CREATE TABLE `yp_user_deposit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `pay_money` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `user_money` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_user_deposit
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yp_user_download_record
-- ----------------------------
DROP TABLE IF EXISTS `yp_user_download_record`;
CREATE TABLE `yp_user_download_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `work_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_user_download_record
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yp_user_follow
-- ----------------------------
DROP TABLE IF EXISTS `yp_user_follow`;
CREATE TABLE `yp_user_follow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_user_follow
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yp_user_order
-- ----------------------------
DROP TABLE IF EXISTS `yp_user_order`;
CREATE TABLE `yp_user_order` (
  `order_id` bigint NOT NULL,
  `body` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ip_address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `order_meta_data` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `order_pay_status` int DEFAULT NULL,
  `order_ship_status` int DEFAULT NULL,
  `order_status` int DEFAULT NULL,
  `pay_platform` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `time_expire` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `time_stamp` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `time_start` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `total_fee` decimal(19,2) DEFAULT NULL,
  `user_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `version` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_user_order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yp_user_pay
-- ----------------------------
DROP TABLE IF EXISTS `yp_user_pay`;
CREATE TABLE `yp_user_pay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `entity_id` int DEFAULT NULL,
  `expire_time` datetime(6) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_user_pay
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yp_user_pay_record
-- ----------------------------
DROP TABLE IF EXISTS `yp_user_pay_record`;
CREATE TABLE `yp_user_pay_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int DEFAULT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `money` int DEFAULT NULL,
  `type` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_user_pay_record
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yp_user_recharge_record
-- ----------------------------
DROP TABLE IF EXISTS `yp_user_recharge_record`;
CREATE TABLE `yp_user_recharge_record` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int DEFAULT NULL,
  `bank_type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `money` int DEFAULT NULL,
  `transaction_id` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_user_recharge_record
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yp_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `yp_withdrawal`;
CREATE TABLE `yp_withdrawal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int NOT NULL,
  `admin_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `bank_account` bigint DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `money` int NOT NULL,
  `state` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_withdrawal
-- ----------------------------
BEGIN;
INSERT INTO `yp_withdrawal` (`id`, `admin_id`, `admin_name`, `bank_account`, `create_time`, `money`, `state`) VALUES (1, 1, '哈哈哈', 2342423423, '2023-01-21 10:16:55.000000', 0, 1);
COMMIT;

-- ----------------------------
-- Table structure for yp_works
-- ----------------------------
DROP TABLE IF EXISTS `yp_works`;
CREATE TABLE `yp_works` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int DEFAULT NULL,
  `collection_count` bigint DEFAULT NULL,
  `collections_count` bigint DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cover_image_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `download_count` bigint DEFAULT NULL,
  `is_free` int DEFAULT NULL,
  `lable` int DEFAULT NULL,
  `look_count` bigint DEFAULT NULL,
  `price` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` int DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `visit_count` bigint DEFAULT NULL,
  `zip_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_works
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yp_works_comment
-- ----------------------------
DROP TABLE IF EXISTS `yp_works_comment`;
CREATE TABLE `yp_works_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(6) DEFAULT NULL,
  `reply_content` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `reply_time` datetime(6) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `work_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_works_comment
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yp_works_images
-- ----------------------------
DROP TABLE IF EXISTS `yp_works_images`;
CREATE TABLE `yp_works_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `file_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` int DEFAULT NULL,
  `update_time` datetime(6) DEFAULT NULL,
  `work_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_works_images
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yp_works_look_log
-- ----------------------------
DROP TABLE IF EXISTS `yp_works_look_log`;
CREATE TABLE `yp_works_look_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `create_time` datetime(6) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `works_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of yp_works_look_log
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
