/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : nacos

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 04/12/2024 02:51:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'group_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'configuration description',
  `c_use` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'configuration usage',
  `effect` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '配置生效的描述',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '配置的类型',
  `c_schema` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '配置的模式',
  `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (1, 'shop-commodity-dev.yaml', 'DEV_GROUP', 'server:\n  port: 8090\njackson:\n  time-zone: GMT+8\n  date-format: yyyy-MM-dd HH:mm:ss\nspring:\n  servlet:\n    multipart:\n      enabled: true #开启文件上传\n      max-file-size: 200MB #限制文件上传大小为10M\n      file-size-threshold: 10MB #单个文件大小限制\n  jackson:\n    serialization:\n      FAIL_ON_EMPTY_BEANS: false\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/shop_commodity?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai&useSSL=false\n    username: root\n    password: root\n    hikari:\n      connection-timeout: 60000\n      validation-timeout: 5000\n      idle-timeout: 60000\n      leak-detection-threshold: 300000\n      max-lifetime: 120000\n      max-pool-size: 100\n      min-idle: 10\n      initialization-fail-timeout: 1\n#mybatis配置\nmybatis:\n  mapper-locations: classpath*:mapper/*Mapper.xml\npagehelper:\n  helper-dialect: mysql\n  reasonable: true\n  support-methods-arguments: false\n  params: count=countsql\n  #打印sql\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n\n', '373f359bfbf4a38cb4fbbd5a6ccf3e79', '2024-11-29 15:28:36', '2024-11-29 15:28:36', NULL, '127.0.0.1', '', 'c7fbbcd8-f6e9-4e59-9a66-256cd95a84db', '', NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (2, 'shop-uaa-dev.yaml', 'DEV_GROUP', 'server:\n  port: 8092\njackson:\n  time-zone: GMT+8\n  date-format: yyyy-MM-dd HH:mm:ss\nspring:\n  servlet:\n    multipart:\n      enabled: true #开启文件上传\n      max-file-size: 200MB #限制文件上传大小为10M\n      file-size-threshold: 10MB #单个文件大小限制\n  jackson:\n    serialization:\n      FAIL_ON_EMPTY_BEANS: false\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/shop-uaa?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai&useSSL=false\n    username: root\n    password: root\n    hikari:\n      connection-timeout: 60000\n      validation-timeout: 5000\n      idle-timeout: 60000\n      leak-detection-threshold: 300000\n      max-lifetime: 120000\n      max-pool-size: 100\n      min-idle: 10\n      initialization-fail-timeout: 1\n  data:\n    redis:\n      host: 39.99.233.57:6379\n      password: 123456\n#mybatis配置\nmybatis:\n  mapper-locations: classpath*:mapper/*Mapper.xml\npagehelper:\n  helper-dialect: mysql\n  reasonable: true\n  support-methods-arguments: false\n  params: count=countsql\n  #打印sql\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n\n', 'c00986a4b9e492db07c13aadf0e56390', '2024-11-29 15:28:36', '2024-11-29 15:28:36', NULL, '127.0.0.1', '', 'c7fbbcd8-f6e9-4e59-9a66-256cd95a84db', '', NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (3, 'shop-order-dev.yaml', 'DEV_GROUP', 'server:\n  port: 8091\njackson:\n  time-zone: GMT+8\n  date-format: yyyy-MM-dd HH:mm:ss\nspring:\n  servlet:\n    multipart:\n      enabled: true #开启文件上传\n      max-file-size: 200MB #限制文件上传大小为10M\n      file-size-threshold: 10MB #单个文件大小限制\n  jackson:\n    serialization:\n      FAIL_ON_EMPTY_BEANS: false\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/shop-order?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai&useSSL=false\n    username: root\n    password: root\n    hikari:\n      connection-timeout: 60000\n      validation-timeout: 5000\n      idle-timeout: 60000\n      leak-detection-threshold: 300000\n      max-lifetime: 120000\n      max-pool-size: 100\n      min-idle: 10\n      initialization-fail-timeout: 1\n\n#mybatis配置\nmybatis:\n  mapper-locations: classpath*:mapper/*Mapper.xml\npagehelper:\n  helper-dialect: mysql\n  reasonable: true\n  support-methods-arguments: false\n  params: count=countsql\n  #打印sql\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n\n', '9e8f1cff735c8926c1fd908455f7804b', '2024-11-29 15:28:36', '2024-11-29 15:28:36', NULL, '127.0.0.1', '', 'c7fbbcd8-f6e9-4e59-9a66-256cd95a84db', '', NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (4, 'shop-gateway-dev.yaml', 'DEV_GROUP', 'server:\n  port: 9000\njackson:\n  time-zone: GMT+8\n  date-format: yyyy-MM-dd HH:mm:ss\nspring:\n  servlet:\n    multipart:\n      enabled: true #开启文件上传\n      max-file-size: 200MB #限制文件上传大小为10M\n      file-size-threshold: 10MB #单个文件大小限制\n  jackson:\n    serialization:\n      FAIL_ON_EMPTY_BEANS: false\n  data:\n    redis:\n      host: 39.99.233.57:6379\n      password: 123456\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true # 让gateway可以发现nacos中的微服务\n      routes:\n        - id: uaa_route\n          uri: lb://shop-uaa # lb指的是从nacos中按照名称获取微服务,并遵循负载均 衡策略\n          predicates:\n            - Path=/uaa/**\n          filters:\n            - StripPrefix=1\n        - id: commodity_route\n          uri: lb://shop-commodity\n          predicates:\n            - Path=/commodity/**\n          filters:\n            - StripPrefix=1\n        - id: order_route\n          uri: lb://shop-order\n          predicates:\n            - Path=/order/**\n          filters:\n            - StripPrefix=1\n\n\n', 'ef15ff5c554a0d7371b1331967b5dce3', '2024-11-29 15:28:36', '2024-11-29 16:26:02', NULL, '127.0.0.1', '', 'c7fbbcd8-f6e9-4e59-9a66-256cd95a84db', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (6, 'test-nacos.yaml', 'DEFAULT_GROUP', 'server:\n  port: 8000', 'd58642c2f75c2a7f6eef5a7171887ec6', '2024-12-02 18:59:02', '2024-12-02 18:59:02', 'nacos', '127.0.0.1', '', '', '', NULL, NULL, 'yaml', NULL, '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id`, `group_id`, `tenant_id`, `datum_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '增加租户字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id`, `group_id`, `tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_beta' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id`, `group_id`, `tenant_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_info_tag' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT COMMENT 'nid, 自增长标识',
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id`, `tag_name`, `tag_type`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'config_tag_relation' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint UNSIGNED NOT NULL COMMENT 'id',
  `nid` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'nid, 自增标识',
  `data_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'source ip',
  `op_type` char(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'operation type',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '密钥',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create`) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified`) USING BTREE,
  INDEX `idx_did`(`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '多租户改造' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (0, 1, 'shop-commodity-dev.yaml', 'DEV_GROUP', '', 'server:\n  port: 8090\njackson:\n  time-zone: GMT+8\n  date-format: yyyy-MM-dd HH:mm:ss\nspring:\n  servlet:\n    multipart:\n      enabled: true #开启文件上传\n      max-file-size: 200MB #限制文件上传大小为10M\n      file-size-threshold: 10MB #单个文件大小限制\n  jackson:\n    serialization:\n      FAIL_ON_EMPTY_BEANS: false\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/shop_commodity?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai&useSSL=false\n    username: root\n    password: root\n    hikari:\n      connection-timeout: 60000\n      validation-timeout: 5000\n      idle-timeout: 60000\n      leak-detection-threshold: 300000\n      max-lifetime: 120000\n      max-pool-size: 100\n      min-idle: 10\n      initialization-fail-timeout: 1\n#mybatis配置\nmybatis:\n  mapper-locations: classpath*:mapper/*Mapper.xml\npagehelper:\n  helper-dialect: mysql\n  reasonable: true\n  support-methods-arguments: false\n  params: count=countsql\n  #打印sql\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n\n', '373f359bfbf4a38cb4fbbd5a6ccf3e79', '2024-11-29 23:28:36', '2024-11-29 15:28:36', NULL, '127.0.0.1', 'I', 'c7fbbcd8-f6e9-4e59-9a66-256cd95a84db', '');
INSERT INTO `his_config_info` VALUES (0, 2, 'shop-uaa-dev.yaml', 'DEV_GROUP', '', 'server:\n  port: 8092\njackson:\n  time-zone: GMT+8\n  date-format: yyyy-MM-dd HH:mm:ss\nspring:\n  servlet:\n    multipart:\n      enabled: true #开启文件上传\n      max-file-size: 200MB #限制文件上传大小为10M\n      file-size-threshold: 10MB #单个文件大小限制\n  jackson:\n    serialization:\n      FAIL_ON_EMPTY_BEANS: false\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/shop-uaa?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai&useSSL=false\n    username: root\n    password: root\n    hikari:\n      connection-timeout: 60000\n      validation-timeout: 5000\n      idle-timeout: 60000\n      leak-detection-threshold: 300000\n      max-lifetime: 120000\n      max-pool-size: 100\n      min-idle: 10\n      initialization-fail-timeout: 1\n  data:\n    redis:\n      host: 39.99.233.57:6379\n      password: 123456\n#mybatis配置\nmybatis:\n  mapper-locations: classpath*:mapper/*Mapper.xml\npagehelper:\n  helper-dialect: mysql\n  reasonable: true\n  support-methods-arguments: false\n  params: count=countsql\n  #打印sql\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n\n', 'c00986a4b9e492db07c13aadf0e56390', '2024-11-29 23:28:36', '2024-11-29 15:28:36', NULL, '127.0.0.1', 'I', 'c7fbbcd8-f6e9-4e59-9a66-256cd95a84db', '');
INSERT INTO `his_config_info` VALUES (0, 3, 'shop-order-dev.yaml', 'DEV_GROUP', '', 'server:\n  port: 8091\njackson:\n  time-zone: GMT+8\n  date-format: yyyy-MM-dd HH:mm:ss\nspring:\n  servlet:\n    multipart:\n      enabled: true #开启文件上传\n      max-file-size: 200MB #限制文件上传大小为10M\n      file-size-threshold: 10MB #单个文件大小限制\n  jackson:\n    serialization:\n      FAIL_ON_EMPTY_BEANS: false\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/shop-order?useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai&useSSL=false\n    username: root\n    password: root\n    hikari:\n      connection-timeout: 60000\n      validation-timeout: 5000\n      idle-timeout: 60000\n      leak-detection-threshold: 300000\n      max-lifetime: 120000\n      max-pool-size: 100\n      min-idle: 10\n      initialization-fail-timeout: 1\n\n#mybatis配置\nmybatis:\n  mapper-locations: classpath*:mapper/*Mapper.xml\npagehelper:\n  helper-dialect: mysql\n  reasonable: true\n  support-methods-arguments: false\n  params: count=countsql\n  #打印sql\nmybatis-plus:\n  configuration:\n    log-impl: org.apache.ibatis.logging.stdout.StdOutImpl\n\n\n', '9e8f1cff735c8926c1fd908455f7804b', '2024-11-29 23:28:36', '2024-11-29 15:28:36', NULL, '127.0.0.1', 'I', 'c7fbbcd8-f6e9-4e59-9a66-256cd95a84db', '');
INSERT INTO `his_config_info` VALUES (0, 4, 'shop-gateway-dev.yaml', 'DEV_GROUP', '', 'server:\n  port: 9000\njackson:\n  time-zone: GMT+8\n  date-format: yyyy-MM-dd HH:mm:ss\nspring:\n  servlet:\n    multipart:\n      enabled: true #开启文件上传\n      max-file-size: 200MB #限制文件上传大小为10M\n      file-size-threshold: 10MB #单个文件大小限制\n  jackson:\n    serialization:\n      FAIL_ON_EMPTY_BEANS: false\n  data:\n    redis:\n      host: 39.99.233.57:6379\n      password: 123456\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true # 让gateway可以发现nacos中的微服务\n      routes:\n        - id: uaa_route\n          uri: lb://shop-uaa # lb指的是从nacos中按照名称获取微服务,并遵循负载均 衡策略\n          predicates:\n            - Path=/uaa/**\n          filters:\n            - StripPrefix=1\n        - id: commodity_route\n          uri: lb://shop-commodity\n          predicates:\n            - Path=/commodity/**\n          filters:\n            - StripPrefix=1\n        - id: order_route\n          uri: lb://shop-order\n          predicates:\n            - Path=/order/**\n          filters:\n            - StripPrefix=1\n\n\n', 'ef15ff5c554a0d7371b1331967b5dce3', '2024-11-29 23:28:36', '2024-11-29 15:28:36', NULL, '127.0.0.1', 'I', 'c7fbbcd8-f6e9-4e59-9a66-256cd95a84db', '');
INSERT INTO `his_config_info` VALUES (4, 5, 'shop-gateway-dev.yaml', 'DEV_GROUP', '', 'server:\n  port: 9000\njackson:\n  time-zone: GMT+8\n  date-format: yyyy-MM-dd HH:mm:ss\nspring:\n  servlet:\n    multipart:\n      enabled: true #开启文件上传\n      max-file-size: 200MB #限制文件上传大小为10M\n      file-size-threshold: 10MB #单个文件大小限制\n  jackson:\n    serialization:\n      FAIL_ON_EMPTY_BEANS: false\n  data:\n    redis:\n      host: 39.99.233.57:6379\n      password: 123456\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true # 让gateway可以发现nacos中的微服务\n      routes:\n        - id: uaa_route\n          uri: lb://shop-uaa # lb指的是从nacos中按照名称获取微服务,并遵循负载均 衡策略\n          predicates:\n            - Path=/uaa/**\n          filters:\n            - StripPrefix=1\n        - id: commodity_route\n          uri: lb://shop-commodity\n          predicates:\n            - Path=/commodity/**\n          filters:\n            - StripPrefix=1\n        - id: order_route\n          uri: lb://shop-order\n          predicates:\n            - Path=/order/**\n          filters:\n            - StripPrefix=1\n\n\n', 'ef15ff5c554a0d7371b1331967b5dce3', '2024-11-30 00:02:32', '2024-11-29 16:02:33', NULL, '127.0.0.1', 'U', 'c7fbbcd8-f6e9-4e59-9a66-256cd95a84db', '');
INSERT INTO `his_config_info` VALUES (4, 6, 'shop-gateway-dev.yaml', 'DEV_GROUP', '', 'server:\n  port: 9000\njackson:\n  time-zone: GMT+8\n  date-format: yyyy-MM-dd HH:mm:ss\nspring:\n  application:\n    name: shop-gateway\n  servlet:\n    multipart:\n      enabled: true #开启文件上传\n      max-file-size: 200MB #限制文件上传大小为10M\n      file-size-threshold: 10MB #单个文件大小限制\n  jackson:\n    serialization:\n      FAIL_ON_EMPTY_BEANS: false\n  data:\n    redis:\n      host: 39.99.233.57:6379\n      password: 123456\n  cloud:\n    gateway:\n      discovery:\n        locator:\n          enabled: true # 让gateway可以发现nacos中的微服务\n      routes:\n        - id: uaa_route\n          uri: lb://shop-uaa # lb指的是从nacos中按照名称获取微服务,并遵循负载均 衡策略\n          predicates:\n            - Path=/uaa/**\n          filters:\n            - StripPrefix=1\n        - id: commodity_route\n          uri: lb://shop-commodity\n          predicates:\n            - Path=/commodity/**\n          filters:\n            - StripPrefix=1\n        - id: order_route\n          uri: lb://shop-order\n          predicates:\n            - Path=/order/**\n          filters:\n            - StripPrefix=1\n\n\n', '877beabca302c1ccd51f3f053a9b7846', '2024-11-30 00:26:01', '2024-11-29 16:26:02', NULL, '127.0.0.1', 'U', 'c7fbbcd8-f6e9-4e59-9a66-256cd95a84db', '');
INSERT INTO `his_config_info` VALUES (0, 7, 'test-nacos', 'DEFAULT_GROUP', '', 'server:\r\n    port: 8000', '5f9c3f225c851c2da5d1e79da8df3cd2', '2024-12-02 18:40:23', '2024-12-02 10:40:24', 'nacos', '127.0.0.1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (5, 8, 'test-nacos', 'DEFAULT_GROUP', '', 'server:\r\n    port: 8000', '5f9c3f225c851c2da5d1e79da8df3cd2', '2024-12-02 18:48:44', '2024-12-02 10:48:45', 'nacos', '127.0.0.1', 'U', '', '');
INSERT INTO `his_config_info` VALUES (0, 9, 'test-nacos.yaml', 'DEFAULT_GROUP', '', 'server:\n  port: 8000', 'd58642c2f75c2a7f6eef5a7171887ec6', '2024-12-02 18:59:02', '2024-12-02 10:59:02', 'nacos', '127.0.0.1', 'I', '', '');
INSERT INTO `his_config_info` VALUES (5, 10, 'test-nacos', 'DEFAULT_GROUP', '', 'server:\n  port: 8000', 'd58642c2f75c2a7f6eef5a7171887ec6', '2024-12-02 18:59:06', '2024-12-02 10:59:06', 'nacos', '127.0.0.1', 'D', '', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'role',
  `resource` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'resource',
  `action` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'action',
  UNIQUE INDEX `uk_role_permission`(`role`, `resource`, `action`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'username',
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'role',
  UNIQUE INDEX `idx_user_role`(`username`, `role`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '租户容量信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp`, `tenant_id`) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'tenant_info' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', 'c7fbbcd8-f6e9-4e59-9a66-256cd95a84db', 'dev', '开发环境', 'nacos', 1732894100234, 1733058767477);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'username',
  `password` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'password',
  `enabled` tinyint(1) NOT NULL COMMENT 'enabled',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$EuWPZHzz32dJN7jexM34MOeYirDdFAZm2kuWj7VEOJhhZkDrxfvUu', 1);

SET FOREIGN_KEY_CHECKS = 1;
