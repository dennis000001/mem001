/*
 Navicat Premium Dump SQL

 Source Server         : mysql-test
 Source Server Type    : MySQL
 Source Server Version : 80018 (8.0.18)
 Source Host           : abcg-game789789.rwlb.singapore.rds.aliyuncs.com:3306
 Source Schema         : site_resource

 Target Server Type    : MySQL
 Target Server Version : 80018 (8.0.18)
 File Encoding         : 65001

 Date: 13/02/2026 11:59:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_app_version_archive
-- ----------------------------
DROP TABLE IF EXISTS `tb_app_version_archive`;
CREATE TABLE `tb_app_version_archive`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `os_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统类型',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用名称',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `archive_size` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源大小',
  `version` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态ON,OFF',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件地址',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `update_content_i18n` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `source_system` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统来源:\r\n代理系统-AGENT;\r\n会员系统-MEMBER',
  `update_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新方式：FORCE强制更新、OPTIONAL选择更新、SILENT静默更新',
  `effective_time` bigint(20) NULL DEFAULT NULL COMMENT '生效时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'app版本资源' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_comm_repair
-- ----------------------------
DROP TABLE IF EXISTS `tb_comm_repair`;
CREATE TABLE `tb_comm_repair`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `repair_start_time` bigint(20) NULL DEFAULT NULL COMMENT '维修开始时间',
  `repair_end_time` bigint(20) NULL DEFAULT NULL COMMENT '维修结束时间',
  `status` smallint(6) NULL DEFAULT NULL COMMENT '状态0待维修,1维修完成,2维修异常',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `scene` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场景',
  `scene_id` bigint(20) NULL DEFAULT NULL COMMENT '场景id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公共维修表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_conf_email
-- ----------------------------
DROP TABLE IF EXISTS `tb_conf_email`;
CREATE TABLE `tb_conf_email`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email_provider` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '厂商',
  `sender_email` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '发送人邮箱',
  `status` smallint(6) NULL DEFAULT NULL COMMENT '状态：	\r\n0：开启；\r\n1：关闭；',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `param1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `param2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `param3` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `email_host` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '邮箱服务地址',
  `email_port` bigint(20) NULL DEFAULT NULL COMMENT '邮箱服务器端口',
  `email_user` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '邮箱账户',
  `email_password` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '邮箱授权码或密码',
  `daily_cap` bigint(20) NULL DEFAULT NULL COMMENT '每日封顶',
  `encrypt_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '加密方式   \"no\":不加密; \"ssl\":ssl;\"tls\":tls',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '邮箱配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_conf_sms
-- ----------------------------
DROP TABLE IF EXISTS `tb_conf_sms`;
CREATE TABLE `tb_conf_sms`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sms_provider` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '厂商枚举,aliyun,twilio',
  `signature` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '短信签名',
  `status` smallint(6) NULL DEFAULT NULL COMMENT '状态：	\r\n0：开启；\r\n1：关闭；',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `app_key` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `secret_key` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `region` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `api_url` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '短信平台的 API 接口地',
  `api_key` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '用于认证的 API 密钥',
  `extra` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '扩展字段，json格式',
  `send_by` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '发送人',
  `phone_code_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '电话国码管理ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 53 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短信配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_cs_live_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_cs_live_resource`;
CREATE TABLE `tb_cs_live_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID自增',
  `status` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '在线客服可用状态',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作人备注',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` smallint(6) NULL DEFAULT NULL COMMENT '本记录是否有效',
  `system_source` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统源(使用场景):\r\n代理-AGENT;\r\n会员-MEMBER',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '在线客服资源' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_cs_live_resource_i18n
-- ----------------------------
DROP TABLE IF EXISTS `tb_cs_live_resource_i18n`;
CREATE TABLE `tb_cs_live_resource_i18n`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID自增',
  `resource_id` bigint(20) NOT NULL COMMENT '对应主记录id',
  `lang` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '本记录语言id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客服名称',
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '在线客服线路地址',
  `tag` bigint(20) NULL DEFAULT NULL COMMENT '客服标签',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` smallint(6) NULL DEFAULT NULL COMMENT '本记录是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_live_resource_id_lang`(`resource_id` ASC, `lang` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 397 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '在线客服资源多语言表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_cs_sns_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_cs_sns_resource`;
CREATE TABLE `tb_cs_sns_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID自增',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客服社交媒体类别',
  `icon_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'PRE_DEFINED' COMMENT '图标类型：PRE_DEFINED-预设，CUSTOMIZED-使用icon2',
  `icon2` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自定义图标URL',
  `bg_color` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#FC2F2E' COMMENT '图标背景色',
  `status` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '客服可用状态',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作人备注',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` smallint(6) NULL DEFAULT NULL COMMENT '本记录是否有效',
  `system_source` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统源(使用场景):\r\n代理-AGENT;\r\n会员-MEMBER',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社交媒体客服资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_cs_sns_resource_i18n
-- ----------------------------
DROP TABLE IF EXISTS `tb_cs_sns_resource_i18n`;
CREATE TABLE `tb_cs_sns_resource_i18n`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID自增',
  `resource_id` bigint(20) NOT NULL COMMENT '对应主记录id',
  `lang` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '本记录语言id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客服名称',
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '客服线路地址',
  `tag` bigint(20) NULL DEFAULT NULL COMMENT '客服标签',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` smallint(6) NULL DEFAULT NULL COMMENT '本记录是否有效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sns_resource_id_lang`(`resource_id` ASC, `lang` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 463 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '社交媒体客户资源多语言字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_dns_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_dns_config`;
CREATE TABLE `tb_dns_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `account_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `auth_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `authorization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_float_window_setting
-- ----------------------------
DROP TABLE IF EXISTS `tb_float_window_setting`;
CREATE TABLE `tb_float_window_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `menu` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一级菜单',
  `menu_sub` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二级菜单',
  `menu_param` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单参数',
  `external_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单参数',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `name_i18n` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名字多语言',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2887 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '悬浮窗配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_home_page_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_home_page_config`;
CREATE TABLE `tb_home_page_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型: DOWNLOAD-下载; AMBASSADOR-大使;PARTNER-合作伙伴',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态:ON-开启,OFF-关闭',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下载链接/形象图',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '首页配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_home_page_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_home_page_detail`;
CREATE TABLE `tb_home_page_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `config_id` bigint(20) NULL DEFAULT NULL COMMENT '配置Id',
  `name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '名称',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `start_time` bigint(20) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接',
  `sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `banner` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '宣传图',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '宣传文(多语言,json格式)',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 317 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '首页配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_ip_domain_list
-- ----------------------------
DROP TABLE IF EXISTS `tb_ip_domain_list`;
CREATE TABLE `tb_ip_domain_list`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `domain_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '域名地址',
  `domain_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名类型, 例如： 官网公域， 代理私域， 好友分享， 其它域名',
  `status` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态（ON=正常，OFF=停用）',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注描述',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间（Unix 时间戳）',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间（Unix 时间戳）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_operation_log`;
CREATE TABLE `tb_member_operation_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `uid` bigint(20) NULL DEFAULT NULL,
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `operation_item` tinyint(2) NULL DEFAULT NULL COMMENT '操作项目',
  `operation_subitem` tinyint(2) NULL DEFAULT NULL COMMENT '操作子项',
  `operation_type` tinyint(1) NULL DEFAULT NULL COMMENT '操作类型 create read update delete up down',
  `old_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '变更前的状态或内容',
  `new_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '变更后的状态或内容',
  `operation_result` tinyint(1) NULL DEFAULT NULL COMMENT '操作结果 success fail',
  `entry_point` tinyint(1) NULL DEFAULT NULL COMMENT '操作入口 front back',
  `source` tinyint(1) NULL DEFAULT NULL COMMENT '操作来源 browser backend',
  `client_type` tinyint(1) NULL DEFAULT NULL COMMENT '客户端类型（浏览器、客户端等）',
  `browser_brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器品牌',
  `operating_system` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `system_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统版本号',
  `device_brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备品牌',
  `device_model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备型号',
  `device_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备号',
  `device_fingerprint` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备指纹标识',
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作时的IP地址',
  `ip_location` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP所在地区',
  `remarks` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作时的附加备注信息',
  `scene` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作发生的背景或场景',
  `operator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `operation_time` bigint(20) NULL DEFAULT NULL COMMENT '操作时间',
  `create_time` bigint(20) NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_operation_log_operation_time`(`operation_time` ASC) USING BTREE,
  INDEX `idx_user_operation_log_member_account`(`account` ASC) USING BTREE,
  INDEX `idx_user_operation_log_ip`(`ip_address` ASC) USING BTREE,
  INDEX `idx_user_operation_log_operation_item`(`operation_item` ASC, `operation_subitem` ASC) USING BTREE,
  INDEX `idx_user_operation_log_fingerprint`(`device_fingerprint`(191) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12828 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_message_strike
-- ----------------------------
DROP TABLE IF EXISTS `tb_message_strike`;
CREATE TABLE `tb_message_strike`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `msg_tpl_id` bigint(50) NULL DEFAULT NULL,
  `system` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统',
  `sender` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送人uid',
  `receiver` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收人uid',
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态：\r\nuntreated-未处理\r\ntreated-已处理\r\nrecall-撤回\r\nrepeat-重复\r\ndifferent-参数不一致\r\nerror-数据异常',
  `data_json` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据json',
  `timing` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否定时：DELAYED-延迟, IMMEDIATE-立即发送',
  `assign_send_time` bigint(20) NULL DEFAULT NULL COMMENT '发送时间',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级：1-10',
  `lang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息语言',
  `sender_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者ip',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `sender_identity` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送身份',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10247835 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息消费记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_message_strike_track
-- ----------------------------
DROP TABLE IF EXISTS `tb_message_strike_track`;
CREATE TABLE `tb_message_strike_track`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `system` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统',
  `channel_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道类型：SMS,EMAIL,SITE',
  `sender` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者uid',
  `receiver` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收者uid',
  `meta_id` bigint(50) NULL DEFAULT NULL COMMENT '元数据id',
  `strike_id` bigint(255) NULL DEFAULT NULL COMMENT 'strike池子id',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态：SUCCESS,FAILED',
  `receive_status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收状态',
  `receive_text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '接收状态描述-(可为三方通知状态描述)',
  `sender_identity` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者身份',
  `sms_provider` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短信厂商',
  `sender_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者ip',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `msg_tpl_id` bigint(20) NULL DEFAULT NULL COMMENT '模板id',
  `desensitized_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '脱敏内容',
  `receiver_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接受者账号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_msg_strike_type_receiver_update_create`(`channel_type` ASC, `receiver` ASC, `update_time` ASC, `create_time` ASC) USING BTREE,
  INDEX `idx_msg_strike_sender_ip`(`sender_ip` ASC) USING BTREE,
  INDEX `idx_msg_strike_type_status_update_create`(`channel_type` ASC, `status` ASC, `update_time` ASC, `create_time` ASC) USING BTREE,
  INDEX `idx_channel_type_update_create`(`channel_type` ASC, `update_time` ASC, `create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10466852 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息追踪日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_message_template
-- ----------------------------
DROP TABLE IF EXISTS `tb_message_template`;
CREATE TABLE `tb_message_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uniq_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一编码',
  `biz_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `system` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统',
  `scene` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '触发场景',
  `scene_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场景描述',
  `receiver_identity` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收者身份：\r\nMEMBER-会员;\r\nAGENT-代理;\r\nVISITOR-游客',
  `status` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态:ON,OFF',
  `extra_attr` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '扩展属性',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_message_template_meta
-- ----------------------------
DROP TABLE IF EXISTS `tb_message_template_meta`;
CREATE TABLE `tb_message_template_meta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `msg_tpl_id` bigint(50) NULL DEFAULT NULL COMMENT '模板id',
  `lang` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语种',
  `tpl_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板类型：SMS,EMAIL,SITE',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ON,OFF',
  `extra_attr` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '扩展属性',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1886 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息模板元数据' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_message_template_var
-- ----------------------------
DROP TABLE IF EXISTS `tb_message_template_var`;
CREATE TABLE `tb_message_template_var`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `biz_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型名称',
  `var_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量名',
  `var_value` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变量值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息模板变量' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_official_contact_setting
-- ----------------------------
DROP TABLE IF EXISTS `tb_official_contact_setting`;
CREATE TABLE `tb_official_contact_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `official_contact` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '官方联系方式（例如：官方邮箱,客服电话、代理部电话，联系地址）',
  `content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用开关-ON/OFF',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作人备注',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '官方联系方式设置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_phone_code_management
-- ----------------------------
DROP TABLE IF EXISTS `tb_phone_code_management`;
CREATE TABLE `tb_phone_code_management`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `dealing_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '国码',
  `country_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简码',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标（URL）',
  `country_name_cn` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家名称（中文）',
  `country_name_en` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家名称（英文）',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `member_app_status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员端状态 , ON=已启用， OFF=已禁用',
  `agent_app_status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理端状态 , ON=已启用， OFF=已禁用',
  `admin_app_status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '后台端状态 , ON=已启用， OFF=已禁用',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 584 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '电话国码管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_region_restriction
-- ----------------------------
DROP TABLE IF EXISTS `tb_region_restriction`;
CREATE TABLE `tb_region_restriction`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `country_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '简码',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标（URL）',
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用开关 , ON=打开， OFF=关闭',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 234 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '地区限制' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_searcher_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_searcher_config`;
CREATE TABLE `tb_searcher_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `search_keyword` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '词条名称',
  `games_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏数量JSON',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态：ON-开启；OFF-关闭',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间（时间戳）',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间（时间戳）',
  `sort_order` int(11) NULL DEFAULT NULL COMMENT '最终排序',
  `relation_config_id` bigint(20) NOT NULL COMMENT '关系配置ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 165 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '搜索器配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_site
-- ----------------------------
DROP TABLE IF EXISTS `tb_site`;
CREATE TABLE `tb_site`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `site_id` int(11) NOT NULL COMMENT '站点ID，从10001开始自增',
  `site_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站点编码',
  `site_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站点名称',
  `site_languages` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站点语言列表',
  `default_language` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '默认语言',
  `site_currencies` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站点币种列表',
  `default_currency` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '默认币种',
  `site_status` smallint(6) NOT NULL COMMENT '站点状态：0=未启用，1=已激活，2=已停用',
  `site_domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点域名',
  `activate_time` datetime NULL DEFAULT NULL COMMENT '激活时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `site_logo` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '站点 logo URL',
  `agent_site_languages` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '代理站点语言列表',
  `agent_default_language` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理站点默认语言列表',
  `site_zone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点时区',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_site_status`(`site_status` ASC) USING BTREE,
  INDEX `idx_site_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '站点信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_site_file_resource
-- ----------------------------
DROP TABLE IF EXISTS `tb_site_file_resource`;
CREATE TABLE `tb_site_file_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `file_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件类型',
  `file_scene` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件使用场景',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文件URL',
  `file_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文件名字',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `deleted` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语言代码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_file_type`(`file_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '站点文件资源表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_site_footer
-- ----------------------------
DROP TABLE IF EXISTS `tb_site_footer`;
CREATE TABLE `tb_site_footer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `enable_social_media` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用社交媒体',
  `enable_page_guide` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用页面指南',
  `guide1` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '第一组指南信息',
  `guide2` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '第二组指南信息',
  `guide3` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '第三组指南信息',
  `enable_payment` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用支付方式',
  `enable_cert` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用证书信息',
  `cert_logo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '安全与证书Logo列表',
  `enable_foot_info` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用页脚信息',
  `foot_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '页脚说明文字',
  `enable_compliance` tinyint(1) NULL DEFAULT NULL COMMENT '是否启用合规信息',
  `compliance_logo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '合规认证Logo列表',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_site_create_time`(`enable_compliance` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '站点信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_site_maintenance
-- ----------------------------
DROP TABLE IF EXISTS `tb_site_maintenance`;
CREATE TABLE `tb_site_maintenance`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `maintain_start_time` bigint(20) NULL DEFAULT NULL COMMENT '维护开始时间',
  `maintain_end_time` bigint(20) NULL DEFAULT NULL COMMENT '维护结束时间',
  `maintain_time` bigint(20) NULL DEFAULT NULL COMMENT '维护开启时间',
  `site_scope` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '站点作用范围：\r\n会员端-MEMBER\r\n代理端-AGENT\r\n后台-ADMIN',
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态：\r\n待维护-PENDING\r\n维护中-IN_PROGRESS\r\n已结束-COMPLETED',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `whitelist_ip` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '白名单',
  `notify_content_i18n` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '多语言通知内容',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '站点维护' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_social_media_setting
-- ----------------------------
DROP TABLE IF EXISTS `tb_social_media_setting`;
CREATE TABLE `tb_social_media_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标（URL）',
  `icon_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'PRE_DEFINED' COMMENT '图标类型：PRE_DEFINED-预设图标(使用icon)，CUSTOMIZED-自定义图标(使用icon2)',
  `bg_color` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#FC2F2E' COMMENT '图标背景色',
  `icon2` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自定义图标URL',
  `social_media_account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '社交媒体账号',
  `account_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '账号链接',
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '使用开关 , ON=打开， OFF=关闭',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作人备注',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '官方社交媒体账号设置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_task_reminder
-- ----------------------------
DROP TABLE IF EXISTS `tb_task_reminder`;
CREATE TABLE `tb_task_reminder`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `module_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块类型',
  `order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统订单号',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间（Unix 时间戳）',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间（Unix 时间戳）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_orderno_moduletype`(`order_no` ASC, `module_type` ASC) USING BTREE,
  INDEX `idx_createtime`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 203199 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 站内信' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_template_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_template_message`;
CREATE TABLE `tb_template_message`  (
  `id` bigint(20) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `uniq_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一编码',
  `type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SMS,EMAIL,SITE',
  `system` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统',
  `modules` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块',
  `scene` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '触发场景',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `status` smallint(6) NULL DEFAULT NULL COMMENT '0启用,1停用',
  `meta_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '元数据',
  `extra_attr` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '扩展属性',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_template_message_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_template_message_log`;
CREATE TABLE `tb_template_message_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tpl_id` bigint(20) NULL DEFAULT NULL COMMENT '消息模板id',
  `log_id` bigint(20) NULL DEFAULT NULL COMMENT '记录id',
  `msg_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息id',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员id',
  `system_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统',
  `member_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `recipient_address` varchar(104) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号或者邮箱',
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ip_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `provider` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `send_time` bigint(20) NULL DEFAULT NULL COMMENT '发送时间',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `verify_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '验证状态',
  `callback_payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '回调',
  `raw_callback_payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '原始回调',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息模板发送日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_track_event_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_track_event_log`;
CREATE TABLE `tb_track_event_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `facebook_pixel_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '脸书pixelKey',
  `tiktok_pixel_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '抖音pixelKey',
  `register_time` bigint(20) NULL DEFAULT NULL COMMENT '注册时间',
  `register_website` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册网址',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `referrer` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推荐人',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `event` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事件',
  `event_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事件id',
  `event_time` bigint(20) NULL DEFAULT NULL COMMENT '事件时间',
  `amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '金额',
  `website` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网址',
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'userAgent',
  `raw_text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始记录',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 179 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '埋点日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_track_member
-- ----------------------------
DROP TABLE IF EXISTS `tb_track_member`;
CREATE TABLE `tb_track_member`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NULL DEFAULT NULL COMMENT 'uid',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号',
  `referrer_uid` bigint(20) NULL DEFAULT NULL COMMENT '推荐人uid',
  `referrer` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推荐人',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理',
  `sr_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '埋点渠道码',
  `create_time` bigint(20) NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '埋点用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_track_source_channel
-- ----------------------------
DROP TABLE IF EXISTS `tb_track_source_channel`;
CREATE TABLE `tb_track_source_channel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sr_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道码',
  `sr_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道名称',
  `sr_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道链接',
  `sr_link_with_cid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道链接携带cid',
  `sr_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道类型：TikTok, Facebook',
  `pixel_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'pixelKey',
  `pixel_security` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'pixel秘钥',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` bigint(20) NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sr_link_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接网址类型：LINK,DOMAIN',
  `designate_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指定代理/全民代理',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 132 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '埋点渠道表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
