/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.139.208
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : 192.168.139.208:30002
 Source Schema         : shop_order_prd

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 28/11/2024 16:46:55
*/

CREATE DATABASE  IF NOT EXISTS shop_order_prd;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_order_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_info`;
CREATE TABLE `tb_order_info`  (
  `order_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `product_id` bigint(20) NULL DEFAULT NULL,
  `product_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `delivery_addr_id` bigint(20) NULL DEFAULT NULL,
  `product_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `product_count` int(11) NULL DEFAULT NULL,
  `product_price` decimal(10, 2) NULL DEFAULT NULL,
  `seckill_price` decimal(10, 2) NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  `create_date` datetime NULL DEFAULT NULL,
  `pay_date` datetime NULL DEFAULT NULL,
  `seckill_date` date NULL DEFAULT NULL,
  `sekill_time` int(11) NULL DEFAULT NULL,
  `intergral` decimal(10, 0) NULL DEFAULT NULL,
  `seckill_id` bigint(20) NULL DEFAULT NULL,
  `pay_type` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`order_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_order_info
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
