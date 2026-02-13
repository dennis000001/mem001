/*
 Navicat Premium Dump SQL

 Source Server         : mysql-test
 Source Server Type    : MySQL
 Source Server Version : 80018 (8.0.18)
 Source Host           : abcg-game789789.rwlb.singapore.rds.aliyuncs.com:3306
 Source Schema         : site_member

 Target Server Type    : MySQL
 Target Server Version : 80018 (8.0.18)
 File Encoding         : 65001

 Date: 13/02/2026 11:59:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for push_user_message
-- ----------------------------
DROP TABLE IF EXISTS `push_user_message`;
CREATE TABLE `push_user_message`  (
  `id` bigint(20) NOT NULL COMMENT '主键Id',
  `system_id` int(11) NULL DEFAULT NULL COMMENT '业务系统Id',
  `biz_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务Id',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `event_source` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事件来源：触发事件的系统/模块，来自字典',
  `button_action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '按钮动作,json字符串存储',
  `terminal_type` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端类型: ALL, IOS, ANDROID, WEB, H5',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `expire_time` bigint(20) NULL DEFAULT NULL COMMENT '过期时间，默认30天过期',
  `user_message_number` bigint(20) NULL DEFAULT NULL COMMENT '用户消息数量',
  `push_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'P' COMMENT '推送状态：S-已推送；P-待推送；F-推送失败',
  `response_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '响应内容',
  PRIMARY KEY (`id`, `push_status`) USING BTREE,
  UNIQUE INDEX `unq_key`(`title` ASC, `system_id` ASC, `event_source` ASC, `biz_id` ASC) USING BTREE,
  INDEX `idx_bizId`(`biz_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户消息推送记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for push_user_message_detail
-- ----------------------------
DROP TABLE IF EXISTS `push_user_message_detail`;
CREATE TABLE `push_user_message_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_message_id` bigint(20) NOT NULL COMMENT '消息id',
  `biz_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务Id',
  `user_id` bigint(20) NOT NULL COMMENT '用户Id',
  `system_id` int(11) NULL DEFAULT NULL COMMENT '业务系统Id',
  `terminal_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端类型: IOS, ANDROID, WEB, OTHER',
  `push_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'P' COMMENT '推送状态：S-已推送；P-待推送；F-推送失败',
  `read_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '已读状态：Y-已读；N-未读',
  `event_source` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事件来源：触发事件的系统/模块，来自字典',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq_key`(`user_message_id` ASC, `user_id` ASC, `system_id` ASC) USING BTREE,
  INDEX `idx_bizId_and_time`(`biz_id` ASC, `create_time` ASC) USING BTREE,
  INDEX `idx_userId_and_time`(`user_id` ASC, `create_time` ASC) USING BTREE,
  INDEX `idx_user_msg_id`(`user_message_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7302314370 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户消息推送详情' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for push_user_message_log
-- ----------------------------
DROP TABLE IF EXISTS `push_user_message_log`;
CREATE TABLE `push_user_message_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_message_id` bigint(20) NOT NULL COMMENT '消息id',
  `biz_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务Id',
  `user_id` bigint(20) NOT NULL COMMENT '用户Id',
  `client_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端唯一标识码',
  `system_id` int(11) NULL DEFAULT NULL COMMENT '业务系统Id',
  `terminal_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '终端类型: H5, WEB, IOS, ANDROID, OTHER',
  `push_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'P' COMMENT '推送状态：S-已推送；F-推送失败',
  `push_server` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推送服务端',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `error_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息，推送失败时会填充错误信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_bizId_and_time`(`biz_id` ASC, `create_time` ASC) USING BTREE,
  INDEX `idx_userId_and_time`(`user_id` ASC, `create_time` ASC) USING BTREE,
  INDEX `idx_user_msg_id`(`user_message_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户消息推送日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_dwm_agent_dimension_statistics_all
-- ----------------------------
DROP TABLE IF EXISTS `tb_dwm_agent_dimension_statistics_all`;
CREATE TABLE `tb_dwm_agent_dimension_statistics_all`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `agent_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理类型：TOP-总代；COMMON-一般代理',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理账号',
  `agent_grade` smallint(6) NULL DEFAULT NULL COMMENT '代理等级',
  `parent_agent_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级代理',
  `register_count` bigint(20) NULL DEFAULT 0 COMMENT '注册人数',
  `first_deposit_count` bigint(20) NULL DEFAULT 0 COMMENT '注册首存数',
  `register_rate` decimal(20, 2) NULL DEFAULT NULL COMMENT '注册首存率',
  `active_user_count` bigint(20) NULL DEFAULT 0 COMMENT '总活跃数',
  `deposit_user_count` bigint(20) NULL DEFAULT 0 COMMENT '存款人数',
  `total_deposit_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '存款金额',
  `deposit_rate` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款比',
  `withdraw_user_count` bigint(20) NULL DEFAULT 0 COMMENT '提款人数',
  `total_withdraw_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '提款金额',
  `withdraw_rate` decimal(20, 2) NULL DEFAULT NULL COMMENT '提款比',
  `bonus_receive_user_count` bigint(20) NULL DEFAULT 0 COMMENT '领取人数',
  `total_welfare_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '福利金额',
  `total_bonus_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '红利金额',
  `total_rebate_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '返水金额',
  `bonus_rate` decimal(20, 2) NULL DEFAULT NULL COMMENT '优惠比',
  `bet_user_count` bigint(20) NULL DEFAULT 0 COMMENT '投注人数',
  `total_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '投注金额',
  `total_valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '打码(二次计算有效投注金额)',
  `total_win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '会员输赢',
  `total_manual_adjust_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '人工调整',
  `disbursed_commission_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '佣金金额',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `first_deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '首存金额',
  `first_deposit_numbers` bigint(20) NULL DEFAULT 0 COMMENT '首存人数',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `agent_user_path_index` bigint(20) NULL DEFAULT 0 COMMENT '代理路径索引位置',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号状态',
  `deposit_order_count` bigint(20) NULL DEFAULT 0 COMMENT '存款笔数',
  `withdraw_order_count` bigint(20) NULL DEFAULT 0 COMMENT '提款笔数',
  `bet_order_count` bigint(20) NULL DEFAULT 0 COMMENT '投注笔数',
  `total_discount_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '总优惠金额',
  `parent_agent_user_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级代理路径',
  `sub_agent_count` bigint(20) NULL DEFAULT 0 COMMENT '下级代理人数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `index_agent`(`agent` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 215696667 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理单层级报表-全量表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_bankcard
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_bankcard`;
CREATE TABLE `tb_member_bankcard`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `member_id` bigint(20) NOT NULL COMMENT '会员ID',
  `member_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `alias_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户命名',
  `bank_short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '银行简称',
  `bankcard_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `bankcard_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行账户（持有人）',
  `bank_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行名称',
  `bank_branch_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行分行名称',
  `bind_count` int(11) NOT NULL COMMENT '绑定次数',
  `bind_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '绑定状态:Y-是;N-否',
  `enable_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '启用状态:Y-是;N-否',
  `updater_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新者类型:MEMBER-会员;ADMIN-后台;SYSTEM-系统',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图标',
  `bank_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '银行代码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member_bankcard_bankcard`(`bank_short_name` ASC, `bankcard_number` ASC, `bankcard_account` ASC) USING BTREE,
  INDEX `uk_member_bankcard`(`member_id` ASC, `member_account` ASC, `bank_short_name` ASC, `bankcard_number` ASC, `bankcard_account` ASC) USING BTREE,
  INDEX `idx_member_bind_status`(`member_id` ASC, `bind_status` ASC) USING BTREE,
  INDEX `idex_update_time`(`update_time` ASC) USING BTREE,
  INDEX `idx_memberaccount_updatetime`(`member_account` ASC, `update_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1080 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_blacklist`;
CREATE TABLE `tb_member_blacklist`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员唯一id',
  `member_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `real_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `register_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册IP',
  `blacklist_type` int(11) NULL DEFAULT NULL COMMENT '黑名单类型 (1-会员账号, 2-IP地址, 3-手机号码·, 4-银行账号, 5-虚拟币地址, 6-三方钱包账号)',
  `status` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记录状态 (MEMBER-BLOCKED, RELEASED)',
  `member_status` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员状态,\r\nACTIVE(\"正常\", 1),\r\nGAME_BAN(\"禁止游戏\", 2),\r\nWITHDRAW_BAN(\"禁止提款\", 3),\r\nLOGIN_BAN(\"禁止登录\", 4)',
  `member_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '会员备注',
  `account_count` bigint(20) NULL DEFAULT NULL COMMENT '已解除关联账号数',
  `member_accounts` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '已解除关联账号',
  `blacklist_reason` int(11) NULL DEFAULT NULL COMMENT '黑名单归因类型 (1-封禁账号, 2-手机号黑名单, 3-IP地址黑名单, 4-银行账号黑名单,5-虚拟币地址黑名单，6-三方钱包黑名单)',
  `release_reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '解除黑名单原因',
  `releaser` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '解除记录的操作人',
  `blacklist_time` bigint(20) NULL DEFAULT NULL COMMENT '进入黑名单时间',
  `release_time` bigint(20) NULL DEFAULT NULL COMMENT '解除黑名单时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `account_number` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号: IP 地址, 手机号，银行账号 ,虚拟币地址 ,三方钱包账号',
  `brand_name` varchar(104) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行简称或三方钱包品牌',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `phone_blacklist_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '已列入黑名单手机号ID',
  `ip_blacklist_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '已列入黑名单IPID',
  `withdraw_blacklist_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '已列入黑名单提款ID',
  `fingerprint_blacklist_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '已列入黑名单指纹码ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_uid`(`uid` ASC) USING BTREE,
  FULLTEXT INDEX `ft_phone_blacklist_ids`(`phone_blacklist_ids`),
  FULLTEXT INDEX `ft_withdraw_blacklist_ids`(`withdraw_blacklist_ids`)
) ENGINE = InnoDB AUTO_INCREMENT = 357350 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员账号黑名单/已解除黑名单记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_commission
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_commission`;
CREATE TABLE `tb_member_commission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` bigint(20) NOT NULL COMMENT '会员ID',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `settle_date` date NULL DEFAULT NULL COMMENT '结算日期',
  `business_date_start` bigint(20) NOT NULL COMMENT '业务开始时间(时间戳)',
  `business_date_end` bigint(20) NOT NULL COMMENT '业务结束时间(时间戳)',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态：审核通过，审核拒绝，等待审核',
  `new_referee_count` int(11) NOT NULL DEFAULT 0 COMMENT '新增有效被推荐人数量',
  `total_loss_amount` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '下线负盈利金额',
  `total_commission` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '总佣金金额',
  `one_time_commission` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '一次性达标奖励佣金',
  `progressive_commission` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '阶段性达标奖励佣金',
  `loss_based_commission` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '负盈利抽成佣金',
  `loss_based_commission_rate` decimal(20, 2) NULL DEFAULT NULL COMMENT '负盈利抽成佣金比例(参与计算)',
  `commission_time` bigint(20) NOT NULL COMMENT '佣金时间(时间戳)',
  `commission_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '佣金单号',
  `audit_time` bigint(20) NULL DEFAULT NULL COMMENT '审核时间(时间戳)',
  `auditor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间(时间戳)',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间(时间戳)',
  `affiliate_commission` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '推广佣金',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1387 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '全民代理佣金表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_config`;
CREATE TABLE `tb_member_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '本条配置类型',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_type`(`type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员安全配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_contact
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_contact`;
CREATE TABLE `tb_member_contact`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `phone1` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '次要手机1',
  `phone2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '次要手机2',
  `email1` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '次要邮箱1',
  `email2` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '次要邮箱2',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `features` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '特征值',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member_contact_account`(`account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员联络方式表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_favorite_game
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_favorite_game`;
CREATE TABLE `tb_member_favorite_game`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID 使用 Member_uid',
  `games` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '游戏列表 JSONB gameId, ts-添加时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` smallint(6) NULL DEFAULT NULL COMMENT '本记录是否有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2026021000000009 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_feedback
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_feedback`;
CREATE TABLE `tb_member_feedback`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类',
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '提交时间/创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `internal_message_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '站内信内容',
  `image_url1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图片 URL 1',
  `image_url2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图片 URL 2',
  `image_url3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '图片 URL 3',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `member_uid` bigint(20) NOT NULL COMMENT '会员ID',
  `member_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `admin_updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理员更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 162 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '意见反馈表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_finance
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_finance`;
CREATE TABLE `tb_member_finance`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `deposit_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '存款总额',
  `deposit_times` int(11) NOT NULL DEFAULT 0 COMMENT '存款次数',
  `withdraw_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '提现总额',
  `withdraw_times` int(11) NULL DEFAULT 0 COMMENT '提现次数',
  `total_bet_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '投注总额',
  `total_effect_bet_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '有效投注总额',
  `total_offer` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '优惠总额（待确认）',
  `total_rebate_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '返水总额',
  `total_win_loss_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '输赢总额',
  `first_deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '首存金额',
  `first_deposit_time` bigint(20) NULL DEFAULT NULL COMMENT '首存时间',
  `second_deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '二存金额',
  `second_deposit_time` bigint(20) NULL DEFAULT NULL COMMENT '二存时间',
  `last_deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '最后存款金额',
  `last_deposit_time` bigint(20) NULL DEFAULT NULL COMMENT '最后存款时间',
  `last_withdraw_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '最后提现金额',
  `last_withdraw_time` bigint(20) NULL DEFAULT 0 COMMENT '最后提现时间',
  `cash_profit_loss` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '现金盈亏',
  `actual_profit_loss` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '实际盈亏（待确认）',
  `bet_multi` int(11) NULL DEFAULT 0 COMMENT '投注倍数（待确认）',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(5) NULL DEFAULT NULL COMMENT '是否删除',
  `version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `member_id` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `first_withdraw_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '最后提现金额',
  `first_withdraw_time` bigint(20) NULL DEFAULT NULL COMMENT '最后提现时间',
  `first_withdraw_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '首提状态',
  `first_deposit_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '首存状态',
  `second_deposit_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二存状态',
  `total_bonus_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '红利总额',
  `effect_bet_days` int(11) NULL DEFAULT 0 COMMENT '有效投注天数',
  `manual_add_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '人工加额总额',
  `manual_sub_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '人工减额总额',
  `large_deposit_times` int(11) NULL DEFAULT NULL COMMENT '大额存款次数',
  `large_withdraw_times` int(11) NULL DEFAULT NULL COMMENT '大额提款次数',
  `negative_profit` decimal(20, 2) NULL DEFAULT NULL COMMENT '负盈利金额(投注金额-输赢金额)',
  `total_balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '总余额（废弃）',
  `payout_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '总中奖（总派彩金额）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_member_finance_account`(`account` ASC) USING BTREE,
  INDEX `idx_memberid`(`member_id` ASC) USING BTREE,
  INDEX `idx_finance_deposit_withdraw_amounts`(`deposit_times` ASC, `withdraw_times` ASC, `deposit_amount` ASC, `withdraw_amount` ASC) USING BTREE,
  INDEX `idx_deposit_times`(`deposit_times` ASC) USING BTREE,
  INDEX `idx_withdraw_times`(`withdraw_times` ASC) USING BTREE,
  INDEX `idx_deposit_amount`(`deposit_amount` ASC) USING BTREE,
  INDEX `idx_withdraw_amount`(`withdraw_amount` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1605469 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员财务信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_finger_print
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_finger_print`;
CREATE TABLE `tb_member_finger_print`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `local_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'sdk本地生成的设备指纹',
  `root_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '服务端生成的设备指纹',
  `risk_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '当前请求命中的风险码',
  `risk_level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当前结果的处置建议',
  `ip_type` int(11) NULL DEFAULT NULL COMMENT 'IP类型只支持国内IPV4的IP',
  `ts` bigint(20) NULL DEFAULT NULL COMMENT '服务端时间戳',
  `client_ts` bigint(20) NULL DEFAULT NULL COMMENT '客户端数据生成的时间戳',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_local_id`(`local_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 185 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '指纹信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_member_flow_audit_setting
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_flow_audit_setting`;
CREATE TABLE `tb_member_flow_audit_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `deposit_flow` decimal(20, 2) NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创造者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创造时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_grade
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_grade`;
CREATE TABLE `tb_member_grade`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '等级',
  `default_lang` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '默认语系',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `logo_img` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'logo图',
  `sum_deposit_upgrade` decimal(20, 2) NULL DEFAULT NULL COMMENT '累计存款达到升级条件',
  `sum_valid_bets_upgrade` decimal(20, 2) NULL DEFAULT NULL COMMENT '累计有效投注升级条件',
  `sum_deposit_protect` decimal(20, 2) NULL DEFAULT NULL COMMENT '累计存款达到保级条件',
  `sum_valid_bets_protect` decimal(20, 2) NULL DEFAULT NULL COMMENT '累计有效投注保级条件',
  `protect_valid_day` smallint(6) NULL DEFAULT NULL COMMENT '保级有效期天数',
  `every_mo_dividend` decimal(20, 2) NULL DEFAULT NULL COMMENT '每月分红',
  `half_mo_dividend` decimal(20, 2) NULL DEFAULT NULL COMMENT '月半分红',
  `birthday_gift` decimal(20, 2) NULL DEFAULT NULL COMMENT '生日礼金',
  `upgrade_gift` decimal(20, 2) NULL DEFAULT NULL COMMENT '升级礼金',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `daily_max_withdraw_count` decimal(20, 2) NULL DEFAULT NULL COMMENT '日取款次数上限',
  `daily_max_withdraw_cash` decimal(20, 2) NULL DEFAULT NULL COMMENT '日取款法币上限',
  `daily_max_withdraw_crypto` decimal(20, 2) NULL DEFAULT NULL COMMENT '日取款虚拟币上限',
  `withdraw_once_limit` decimal(20, 2) NULL DEFAULT NULL COMMENT '单笔提款限额',
  `withdraw_once_limit_min` decimal(20, 2) NULL DEFAULT NULL COMMENT '单笔提款限额最小',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员等级表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_grade_cashback
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_grade_cashback`;
CREATE TABLE `tb_member_grade_cashback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `cashback_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '“存款返现”、“提款返现”',
  `member_grade_id` bigint(20) NOT NULL COMMENT '会员等级：VIP1至VIP10',
  `ratio_value` decimal(10, 2) NULL DEFAULT NULL COMMENT '返现比列模式：返现比例',
  `amout_value` decimal(20, 2) NULL DEFAULT NULL,
  `start_time` bigint(20) NOT NULL COMMENT '开始时间',
  `end_time` bigint(20) NOT NULL COMMENT '结束时间',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '修改时间',
  `turnover_multiplier` decimal(10, 2) NULL DEFAULT NULL,
  `cashback_mode` smallint(6) NOT NULL COMMENT '返现形式：1单笔返现金额；2单笔返现比列；0 all',
  `min_deposit_amount` decimal(20, 2) NULL DEFAULT NULL,
  `max_cashback_amount` decimal(20, 2) NULL DEFAULT NULL,
  `daily_cashback_limit` decimal(20, 2) NULL DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '返现策略名字',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态：NORMAL, INVALID',
  `channels` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_cashback_strategy_type`(`cashback_type` ASC) USING BTREE,
  INDEX `idx_cashback_strategy_dates`(`start_time` ASC, `end_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '返现策略表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_grade_change_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_grade_change_log`;
CREATE TABLE `tb_member_grade_change_log`  (
  `id` bigint(20) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT,
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `before_grade` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `cond_type` smallint(6) NULL DEFAULT NULL COMMENT '类型1升级类型,2降级类型',
  `after_grade` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `change_reason` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变更原因',
  `device_info` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备信息',
  `os_info` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统信息',
  `ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `before_grade_value` bigint(20) NULL DEFAULT NULL COMMENT '变更前等级值',
  `after_grade_value` bigint(20) NULL DEFAULT NULL COMMENT '变更后等级值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_account`(`account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62979 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员等级变更记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_grade_cond
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_grade_cond`;
CREATE TABLE `tb_member_grade_cond`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cond_field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '条件字段',
  `cond_type` smallint(6) NULL DEFAULT NULL COMMENT '条件类型1升级类型,2保级类型,3红利回报',
  `sort` smallint(6) NULL DEFAULT NULL COMMENT '排序',
  `status` smallint(6) NULL DEFAULT NULL COMMENT '状态0启用,1停用',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `is_valid` smallint(6) NULL DEFAULT NULL COMMENT '是否校验0校验,1不校验',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员等级条件变量表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_grade_progress
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_grade_progress`;
CREATE TABLE `tb_member_grade_progress`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间（毫秒时间戳）',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间（毫秒时间戳）',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `uid` bigint(20) NOT NULL COMMENT '用户ID',
  `deposit_amount` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '存款金额',
  `version` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `bet_amount` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '投注金额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tb_member_grade_progress_unique`(`uid` ASC) USING BTREE,
  UNIQUE INDEX `tb_member_grade_progress_unique_1`(`account` ASC) USING BTREE,
  INDEX `idx_member_grade_progress_uid`(`uid` ASC) USING BTREE,
  INDEX `idx_member_grade_progress_account`(`account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91209 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员等级进度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_grade_protect
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_grade_protect`;
CREATE TABLE `tb_member_grade_protect`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `before_grade_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `before_grade` smallint(6) NULL DEFAULT NULL COMMENT '上次等级',
  `current_grade` smallint(6) NULL DEFAULT NULL COMMENT '当前等级',
  `protect_valid_day` smallint(6) NULL DEFAULT NULL COMMENT '保级有效期天数',
  `protect_trigger_time` bigint(20) NULL DEFAULT NULL COMMENT '保级触发时间',
  `protect_start_time` bigint(20) NULL DEFAULT NULL COMMENT '保级开始时间',
  `member_id` bigint(20) NULL DEFAULT NULL COMMENT '会员id',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间戳',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间戳',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22199 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员等级保护表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_grade_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_grade_reward_log`;
CREATE TABLE `tb_member_grade_reward_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `reward_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖金订单号',
  `reward_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '奖金金额',
  `reward_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `claim_time` bigint(20) NULL DEFAULT NULL COMMENT '领取时间',
  `grade` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员等级',
  `parent_agent_account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级代理账户',
  `claim_status` smallint(6) NULL DEFAULT NULL COMMENT '领取状态0未领取,1已领取,2已失效,3领取失败',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `reward_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `grade_value` bigint(20) NULL DEFAULT NULL COMMENT '等级int',
  `issue_time` bigint(20) NULL DEFAULT NULL COMMENT '发放时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_account_rewardtype`(`create_time` ASC, `account` ASC, `reward_type`(100) ASC) USING BTREE,
  INDEX `idx_account_issue_time`(`account` ASC, `issue_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 476440 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员等级奖励记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_grade_rule_setting
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_grade_rule_setting`;
CREATE TABLE `tb_member_grade_rule_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(5) NULL DEFAULT NULL COMMENT '会员等级开关',
  `upgrade_condition_logic` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '升级条件要求ALL或者ANY',
  `keep_condition_logic` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '保级条件要求ALL或者ANY',
  `allow_jump_reward` tinyint(5) NULL DEFAULT NULL COMMENT '是否可以跳级领取福利',
  `allow_repeat_reward_after_demotion` tinyint(5) NULL DEFAULT NULL COMMENT '是否允许降级后升级重复领取奖励',
  `claim_valid_days` smallint(6) NULL DEFAULT NULL COMMENT '奖励领取有效期',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员等级规则设置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_help_center
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_help_center`;
CREATE TABLE `tb_member_help_center`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `category_id` int(11) NULL DEFAULT NULL COMMENT '分类ID',
  `category_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `view_count` bigint(20) NULL DEFAULT NULL COMMENT '查看次数',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帮助中心文章表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_help_center_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_help_center_category`;
CREATE TABLE `tb_member_help_center_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `status` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态- ON正常 OFF停用',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `category_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前默认语言分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 148 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帮助中心分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_help_center_category_i18n
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_help_center_category_i18n`;
CREATE TABLE `tb_member_help_center_category_i18n`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `category_id` bigint(20) NOT NULL COMMENT '分类ID',
  `category_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '多语言编码',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 194 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帮助中心分类多语言表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_help_center_i18n
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_help_center_i18n`;
CREATE TABLE `tb_member_help_center_i18n`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `article_id` int(11) NOT NULL COMMENT '文章ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内文',
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '多语言编码',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `category_id` int(11) NOT NULL COMMENT '分类ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 272 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '帮助中心文章多语言表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_image
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_image`;
CREATE TABLE `tb_member_image`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID自增',
  `key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'key暴漏出去',
  `ref_id` bigint(20) NULL DEFAULT NULL COMMENT '本image从属于某个内容,为空时本image是单独个体,不从属于其他内容',
  `ref_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '本image从属于内容的类别',
  `s3key` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '存放S3的key',
  `member_uid` bigint(20) NULL DEFAULT NULL COMMENT '冗余字段 从属于的用户,如果为空,所有用户可访问',
  `remarks` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'remarks',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` smallint(6) NULL DEFAULT NULL COMMENT '本记录是否有效',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_info`;
CREATE TABLE `tb_member_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `real_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像URL',
  `nick` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `region` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地区',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录密码',
  `agent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理商编码',
  `invite_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `recommender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推荐人账号',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员状态,\r\nACTIVE(\"正常\", 1),\r\nGAME_BAN(\"禁止游戏\", 2),\r\nWITHDRAW_BAN(\"禁止提款\", 3),\r\nLOGIN_BAN(\"禁止登录\", 4),\r\nBANNED(\"封禁\", 5),',
  `wallet_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钱包状态',
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生日',
  `email_valid` tinyint(5) NULL DEFAULT NULL COMMENT '邮箱是否验证',
  `phone_valid` tinyint(5) NULL DEFAULT NULL COMMENT '手机是否验证',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `login_time` bigint(20) NULL DEFAULT NULL COMMENT '最后登录时间',
  `register_time` bigint(20) NULL DEFAULT NULL COMMENT '注册时间',
  `register_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册来源',
  `register_terminal` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册终端',
  `register_ua` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册设备UA',
  `register_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册IP',
  `register_region` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册IP地区',
  `register_domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册地址',
  `login_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录状态 枚举：ONLINE ，OFFLINE',
  `withdraw_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现密码',
  `withdraw_password_hint` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现密码提示',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '修改时间',
  `grade_level` bigint(20) NULL DEFAULT NULL COMMENT '会员等级id（VIP等级id）',
  `account_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账户类型 ；NORMAL，TRIAL',
  `first_deposit_time` bigint(20) NULL DEFAULT NULL COMMENT '首存时间',
  `remarker` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注人',
  `remark_time` bigint(20) NULL DEFAULT NULL COMMENT '备注时间',
  `level_manual` bigint(20) NULL DEFAULT NULL COMMENT '对应level_auto_id(会员层级id)',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '唯一id',
  `inviter` bigint(20) NULL DEFAULT NULL,
  `first_deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '首存款金额',
  `rebate` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 1 COMMENT '是否返水，0 = false,1=true',
  `grade` bigint(20) NULL DEFAULT NULL COMMENT '会员等级值（VIP等级值）',
  `status_remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态备注',
  `level_manual_remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '层级备注',
  `tag_remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签备注',
  `base_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '基础类型：AGENT,MEMBER',
  `pwd_reset_time` bigint(20) NULL DEFAULT NULL COMMENT '管理员重设密码时间',
  `register_channel` bigint(20) NULL DEFAULT NULL COMMENT '注册渠道（代理的）',
  `signup_method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册方式 ACCOUNT/SMS/EMAIL/GG/LN/FB',
  `login_device_signature` varchar(750) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录设备指纹',
  `login_method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最近一次登录方式',
  `reset_pwd_required` tinyint(1) NULL DEFAULT NULL COMMENT '是否登录时必须重设密码',
  `setup_2fa_required` tinyint(1) NULL DEFAULT NULL COMMENT '是否引导用户设置双重验证',
  `active_member` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否是活跃会员:false 0-否，true 1-是，自然月底重置为非活跃会员',
  `active_time` bigint(20) NULL DEFAULT NULL COMMENT '活跃会员达成时间,(更新为活跃会员的时间,自然月底清空)',
  `register_feature_code` varchar(750) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录指纹唯一特征码',
  `salt` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '以后去掉',
  `two_fa_admin_reset_time` bigint(20) NULL DEFAULT NULL,
  `login_fp_localid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'login device fingerprint local_id from SDK',
  `register_fp_localid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'register device fingerprint local_id from SDK',
  `valid_new_member_mark` tinyint(1) NULL DEFAULT NULL COMMENT '有效新增会员标记:false 0-否，true 1-是',
  `valid_new_member_mark_time` bigint(20) NULL DEFAULT NULL COMMENT '活跃会员标记时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_member_info_account`(`account` ASC) USING BTREE,
  UNIQUE INDEX `idx_member_info_uid`(`uid` ASC) USING BTREE,
  UNIQUE INDEX `idx_member_info_phone`(`phone` ASC) USING BTREE,
  INDEX `idx_agent`(`agent` ASC) USING BTREE,
  INDEX `idx_member_info_create_time`(`register_time` ASC) USING BTREE,
  INDEX `idx_email`(`email` ASC) USING BTREE,
  INDEX `idx_member_info_inviteCode`(`invite_code` ASC) USING BTREE,
  INDEX `idx_member_info_realname`(`real_name` ASC) USING BTREE,
  INDEX `idx_rebate_only`(`rebate` ASC) USING BTREE,
  INDEX `idx_member_info_status_register_time_account`(`status` ASC, `register_time` DESC, `account` ASC) USING BTREE,
  INDEX `idx_register_feature_code`(`register_feature_code` ASC) USING BTREE,
  INDEX `idx_login_device_signature`(`login_device_signature` ASC) USING BTREE,
  INDEX `idx_register_ip`(`register_ip` ASC) USING BTREE,
  INDEX `idx_login_ip`(`login_ip` ASC) USING BTREE,
  INDEX `idx_member_gradeLevel`(`grade_level` ASC) USING BTREE,
  INDEX `idx_member_levelManual`(`level_manual` ASC) USING BTREE,
  INDEX `idx_member_activeMember`(`active_member` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 488967 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_info_bak
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_info_bak`;
CREATE TABLE `tb_member_info_bak`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `real_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像URL',
  `nick` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `region` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地区',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录密码',
  `agent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理商编码',
  `invite_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `recommender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推荐人账号',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员状态,\r\nACTIVE(\"正常\", 1),\r\nGAME_BAN(\"禁止游戏\", 2),\r\nWITHDRAW_BAN(\"禁止提款\", 3),\r\nLOGIN_BAN(\"禁止登录\", 4),\r\nBANNED(\"封禁\", 5),',
  `wallet_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钱包状态',
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '性别',
  `birthday` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生日',
  `email_valid` tinyint(5) NULL DEFAULT NULL COMMENT '邮箱是否验证',
  `phone_valid` tinyint(5) NULL DEFAULT NULL COMMENT '手机是否验证',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `login_time` bigint(20) NULL DEFAULT NULL COMMENT '最后登录时间',
  `register_time` bigint(20) NULL DEFAULT NULL COMMENT '注册时间',
  `register_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册来源',
  `register_terminal` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册终端',
  `register_ua` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册设备UA',
  `register_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册IP',
  `register_region` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册IP地区',
  `register_domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册地址',
  `login_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录状态 枚举：ONLINE ，OFFLINE',
  `withdraw_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现密码',
  `withdraw_password_hint` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提现密码提示',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '修改时间',
  `grade_level` bigint(20) NULL DEFAULT NULL COMMENT '会员等级id（VIP等级id）',
  `account_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账户类型 ；NORMAL，TRIAL',
  `first_deposit_time` bigint(20) NULL DEFAULT NULL COMMENT '首存时间',
  `remarker` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注人',
  `remark_time` bigint(20) NULL DEFAULT NULL COMMENT '备注时间',
  `level_manual` bigint(20) NULL DEFAULT NULL COMMENT '对应level_auto_id(会员层级id)',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '唯一id',
  `inviter` bigint(20) NULL DEFAULT NULL,
  `first_deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '首存款金额',
  `rebate` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT 1 COMMENT '是否返水，0 = false,1=true',
  `grade` bigint(20) NULL DEFAULT NULL COMMENT '会员等级值（VIP等级值）',
  `status_remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态备注',
  `level_manual_remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '层级备注',
  `tag_remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签备注',
  `base_type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '基础类型：AGENT,MEMBER',
  `pwd_reset_time` bigint(20) NULL DEFAULT NULL COMMENT '管理员重设密码时间',
  `register_channel` bigint(20) NULL DEFAULT NULL COMMENT '注册渠道（代理的）',
  `signup_method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册方式 ACCOUNT/SMS/EMAIL/GG/LN/FB',
  `login_device_signature` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录设备指纹',
  `login_method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最近一次登录方式',
  `reset_pwd_required` tinyint(1) NULL DEFAULT NULL COMMENT '是否登录时必须重设密码',
  `setup_2fa_required` tinyint(1) NULL DEFAULT NULL COMMENT '是否引导用户设置双重验证',
  `active_member` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否是活跃会员:false 0-否，true 1-是，自然月底重置为非活跃会员',
  `active_time` bigint(20) NULL DEFAULT NULL COMMENT '活跃会员达成时间,(更新为活跃会员的时间,自然月底清空)',
  `register_feature_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录指纹唯一特征码',
  `salt` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '以后去掉',
  `two_fa_admin_reset_time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_member_info_account`(`account` ASC) USING BTREE,
  UNIQUE INDEX `idx_member_info_uid`(`uid` ASC) USING BTREE,
  UNIQUE INDEX `idx_member_info_phone`(`phone` ASC) USING BTREE,
  INDEX `idx_agent`(`agent` ASC) USING BTREE,
  INDEX `idx_member_info_create_time`(`register_time` ASC) USING BTREE,
  INDEX `idx_email`(`email` ASC) USING BTREE,
  INDEX `idx_member_info_inviteCode`(`invite_code` ASC) USING BTREE,
  INDEX `idx_member_info_realname`(`real_name` ASC) USING BTREE,
  INDEX `idx_rebate_only`(`rebate` ASC) USING BTREE,
  INDEX `idx_member_info_status_register_time_account`(`status` ASC, `register_time` DESC, `account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 422388 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_invite_code
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_invite_code`;
CREATE TABLE `tb_member_invite_code`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邀请码',
  `status` smallint(6) NOT NULL COMMENT '状态：0-未使用，1-已使用，2-已失效，99-锁定中',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_member_invite_code`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45503130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员邀请码表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_level_auto
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_level_auto`;
CREATE TABLE `tb_member_level_auto`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `deposit_count` int(11) NULL DEFAULT NULL COMMENT '存款次数',
  `deposit_total_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '累计存款金额',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `level` smallint(6) NULL DEFAULT NULL COMMENT '层级',
  `level_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62185 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员自动层级表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_level_auto_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_level_auto_user`;
CREATE TABLE `tb_member_level_auto_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mbr_id` bigint(20) NULL DEFAULT NULL COMMENT '会员id',
  `ml_id` bigint(20) NULL DEFAULT NULL COMMENT '层级id',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `lock` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '层级锁定LOCK,UNLOCK',
  `data_from` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据来源TAG,MEMBER',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_mbrid_mlid`(`mbr_id` ASC, `ml_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 148108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员自动层级用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_level_change_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_level_change_log`;
CREATE TABLE `tb_member_level_change_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `original_level_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原层级类型：MANUAL_LEVEL-固定层级,AUTO_LEVEL-自动层级',
  `original_level_id` bigint(20) NULL DEFAULT NULL COMMENT '原层级id',
  `original_level_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `current_level_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前层级类型 MANUAL_LEVEL-固定层级,AUTO_LEVEL-自动层级',
  `current_level_id` bigint(20) NULL DEFAULT NULL COMMENT '当前层级id',
  `current_level_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `change_reason` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip地址',
  `os_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `browser_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 673593 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 会员层级变更记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_login_daily
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_login_daily`;
CREATE TABLE `tb_member_login_daily`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员id',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `report_date` date NULL DEFAULT NULL COMMENT '数据归属日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8371 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员每日登录记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_login_log`;
CREATE TABLE `tb_member_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `login_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登入IP',
  `browser` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录设备信息',
  `login_status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登入状态: FAIL-失败； SUCCESS-成功',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '登入时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '地区位置',
  `operating_system` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统详细信息',
  `os_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统名称',
  `os_version` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统版本',
  `platform` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '客户端类型WEB,H5,APP',
  `device_signature` varchar(750) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备指纹',
  `domain` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `login_date` date NULL DEFAULT NULL COMMENT '登录日期',
  `fp_localid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'device fingerprint local_id from SDK',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_account_createtime`(`account` ASC, `create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1854661 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 会员登录记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_phone_black_list
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_phone_black_list`;
CREATE TABLE `tb_member_phone_black_list`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `region` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '手机号码黑名单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_rebate_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_rebate_config`;
CREATE TABLE `tb_member_rebate_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID，自动递增',
  `member_grade` bigint(20) NOT NULL COMMENT '会员等级',
  `game_provider_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '游戏品类名',
  `rebate_percent` decimal(10, 1) NULL DEFAULT NULL COMMENT '返水比例（0.1%～3.0%, 默认:1%）',
  `rebate_limit` bigint(20) NULL DEFAULT 0 COMMENT '返利上限(null或0,表示不限制返水)',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `member_grade_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员等级名称',
  `game_provider_id` bigint(20) NULL DEFAULT NULL COMMENT '游戏品类ID',
  `category_code` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏品类Code',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2699 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员等级返水设置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_rebate_settings
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_rebate_settings`;
CREATE TABLE `tb_member_rebate_settings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键，自动递增',
  `system_auto_rebate` tinyint(1) NULL DEFAULT NULL COMMENT '系统定时自动返水',
  `rebate_start_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统定时自动返水时间设置',
  `member_self_rebate` tinyint(1) NULL DEFAULT NULL COMMENT '会员实时自助返水',
  `use_member_level` tinyint(1) NULL DEFAULT NULL COMMENT '按会员等级设置',
  `use_bet_amount_threshold` tinyint(1) NULL DEFAULT NULL COMMENT '按当天打码量指标设置',
  `rebate_flow_multiplier` decimal(20, 2) NULL DEFAULT NULL,
  `auto_distribute` tinyint(1) NULL DEFAULT NULL COMMENT '系统自动发放开关： 0-关闭（需要人工审批） 1-开启（不需要人工审批）',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `is_multiplier_empty` tinyint(1) NULL DEFAULT NULL COMMENT '返水金额流水倍数是否为空',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员返水设置数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_recipient_area
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_recipient_area`;
CREATE TABLE `tb_member_recipient_area`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `parent_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父级ID',
  `region_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地区名称',
  `sort_num` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '排序号',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `created_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` tinyint(5) NULL DEFAULT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员收件地区表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_referee
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_referee`;
CREATE TABLE `tb_member_referee`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `register_time` bigint(20) NULL DEFAULT NULL COMMENT '注册时间',
  `uid` bigint(20) NOT NULL COMMENT '会员ID',
  `total_contribution` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '总贡献金额',
  `one_time_commission` decimal(20, 2) NULL DEFAULT NULL COMMENT '受邀人一次性奖励',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `referrer_uid` bigint(20) NOT NULL COMMENT '推荐人用户ID',
  `referrer_account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '推荐人账户名',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态：有效会员；普通会员',
  `business_date` date NULL DEFAULT NULL COMMENT '启动日期',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间(时间戳)',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间(时间戳)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_uid`(`uid` ASC) USING BTREE,
  UNIQUE INDEX `uk_account`(`account` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_referrer_uid`(`referrer_uid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26923 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '被推荐人贡献表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_referral_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_referral_config`;
CREATE TABLE `tb_member_referral_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '全民代理配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_referral_img
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_referral_img`;
CREATE TABLE `tb_member_referral_img`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片名称',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `url_i18n` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '多语言图片URL，JSON格式',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '全民代理图片表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_referrer
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_referrer`;
CREATE TABLE `tb_member_referrer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` bigint(20) NOT NULL COMMENT '会员ID',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `referrer_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推荐码',
  `referrer_time` bigint(20) NULL DEFAULT NULL COMMENT '成为推荐人时间(时间戳)',
  `referrer_uid` bigint(20) NULL DEFAULT NULL COMMENT '推荐人用户ID',
  `referrer_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推荐人用户名',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `referee_count` int(11) NOT NULL DEFAULT 0 COMMENT '被推荐人数量',
  `total_commission` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '总佣金金额',
  `one_time_commission` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '一次性达标奖励佣金',
  `progressive_commission` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '阶段性达标奖励佣金',
  `loss_based_commission` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '负盈利抽成佣金',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间(时间戳)',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间(时间戳)',
  `affiliate_commission` decimal(20, 2) NULL DEFAULT NULL COMMENT '推广佣金',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_uid`(`uid` ASC) USING BTREE,
  UNIQUE INDEX `uk_account`(`account` ASC) USING BTREE,
  INDEX `idx_referrer_uid`(`referrer_uid` ASC) USING BTREE,
  INDEX `idx_referrer_code`(`referrer_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 254 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '全民代理推荐人表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_remark
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_remark`;
CREATE TABLE `tb_member_remark`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `member_uid` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member_remark_account`(`account` ASC) USING BTREE,
  INDEX `idx_member_remark_creator`(`creator` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 519 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_site_message_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_site_message_log`;
CREATE TABLE `tb_member_site_message_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) NULL DEFAULT NULL COMMENT '主任务id',
  `msg_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息唯一id',
  `biz_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `scene` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场景',
  `target_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '目标人群类型\r\nVIP-vip\r\nMANUAL_LEVEL-手动层级\r\nAUTO_LEVEL-自动层级\r\nTAG-标签\r\nPARENT-上级代理\r\nCHILD-下级代理\r\nCUSTOM-自定义\r\nUPLOAD-上传',
  `target_ids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '目标人群id集',
  `target_names` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '目标人群name集',
  `sender_count` int(11) NULL DEFAULT NULL COMMENT '发送人数',
  `sender_status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送状态\r\nSENT-已发送\r\nQUEUED-排队中\r\nDELETED-已删除',
  `sender_time` bigint(20) NULL DEFAULT NULL COMMENT '发送时间',
  `sender` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送人',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_msg_id`(`msg_id` ASC) USING BTREE,
  INDEX `idx_sender_status`(`sender_status` ASC) USING BTREE,
  INDEX `idx_task_id`(`task_id` ASC) USING BTREE,
  INDEX `idx_scene`(`scene` ASC) USING BTREE,
  INDEX `idx_biz_type`(`biz_type` ASC) USING BTREE,
  INDEX `idx_sender_time`(`sender_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8756638 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '站内消息任务发送日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_site_message_log_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_site_message_log_detail`;
CREATE TABLE `tb_member_site_message_log_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `msg_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `uid` bigint(11) NULL DEFAULT NULL COMMENT 'uid',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_msg_id_uid`(`msg_id` ASC, `uid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 599268040 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_site_message_task
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_site_message_task`;
CREATE TABLE `tb_member_site_message_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `msg_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息唯一id',
  `biz_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `sender_time` bigint(20) NULL DEFAULT NULL COMMENT '发送时间',
  `complete_status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主任务完成状态',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 292287 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '站内消息发送主任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_site_message_task_sub
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_site_message_task_sub`;
CREATE TABLE `tb_member_site_message_task_sub`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(11) NULL DEFAULT NULL COMMENT '主任务id',
  `uids` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'uids',
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'UNPROCESSED-未处理,PROCESSED-已处理',
  `offset` int(11) NULL DEFAULT NULL COMMENT '偏移量,查询时可根据偏移量查',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 291320 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '站内消息发送子任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_sso_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_sso_info`;
CREATE TABLE `tb_member_sso_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `source` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `member_uid` bigint(20) NOT NULL COMMENT '用户在SSO的UUID',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted` smallint(6) NULL DEFAULT NULL COMMENT '本记录是否有效',
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `avatar` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `nickname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `username` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_member_sso_uuid`(`source` ASC, `uuid` ASC, `member_uid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 399 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_tags
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_tags`;
CREATE TABLE `tb_member_tags`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` smallint(6) NULL DEFAULT NULL COMMENT '排序',
  `status` smallint(6) NULL DEFAULT NULL COMMENT '状态0启用,1停用',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `color` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 286 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员标签表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_tags_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_tags_log`;
CREATE TABLE `tb_member_tags_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `older_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `new_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `os_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `browser_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `updater` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9458 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '标签日志记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_tags_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_tags_user`;
CREATE TABLE `tb_member_tags_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) NULL DEFAULT NULL COMMENT '标签id',
  `mbr_id` bigint(20) NULL DEFAULT NULL COMMENT '会员id',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_tag_mbr`(`tag_id` ASC, `mbr_id` ASC) USING BTREE,
  INDEX `idx_tag_member`(`tag_id` ASC, `mbr_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14853 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员标签用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_two_fa
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_two_fa`;
CREATE TABLE `tb_member_two_fa`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `member_uid` bigint(20) NOT NULL COMMENT '会员ID',
  `two_factor_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `require_on_login` tinyint(5) NULL DEFAULT NULL COMMENT '登入时双重验证',
  `require_on_withdrawal` tinyint(5) NULL DEFAULT NULL COMMENT '提现时双重验证',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `two_fa_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `reset_time` bigint(20) NULL DEFAULT NULL COMMENT '管理员重置时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member_uid`(`member_uid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18567 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员双重验证表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_type_black_list
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_type_black_list`;
CREATE TABLE `tb_member_type_black_list`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `identity_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `identity_value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `restrict_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '限制类型：注册(REGISTER)、登录(LOGIN)、访问(ACCESS),用逗号拼接',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_identity_value`(`identity_value` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81924 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'IP地址，指纹黑名单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_virtual
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_virtual`;
CREATE TABLE `tb_member_virtual`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `member_id` bigint(20) NOT NULL COMMENT '会员ID',
  `member_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alias_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `virtual_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bind_count` int(11) NOT NULL COMMENT '绑定次数',
  `bind_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `enable_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updater_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `virtual_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_member_virtual`(`member_id` ASC, `member_account` ASC, `virtual_address` ASC) USING BTREE,
  INDEX `idx_member_virtual_address`(`virtual_address` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 252 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_wallet
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_wallet`;
CREATE TABLE `tb_member_wallet`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `member_id` bigint(20) NOT NULL COMMENT '会员ID',
  `member_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `alias_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wallet_brand` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wallet_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bind_count` int(11) NOT NULL COMMENT '绑定次数',
  `bind_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `enable_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updater_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_member_wallet`(`member_id` ASC, `member_account` ASC, `wallet_brand` ASC, `wallet_number` ASC) USING BTREE,
  INDEX `idx_member_wallet_wallet`(`wallet_brand` ASC, `wallet_number` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 224 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_withdraw_account_black_list
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_withdraw_account_black_list`;
CREATE TABLE `tb_member_withdraw_account_black_list`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account_type` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `brand_name` varchar(104) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `account_number` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `payment_id` bigint(20) NULL DEFAULT NULL COMMENT '支付ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '提款账号黑名单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_open_api_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_open_api_config`;
CREATE TABLE `tb_open_api_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `api_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `secret_key` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `company_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact_person` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `contact_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `qps_limit` int(11) NULL DEFAULT 100 COMMENT 'QPS限制',
  `daily_limit` int(11) NULL DEFAULT 10000 COMMENT '日请求量限制',
  `ip_whitelist` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态：0-禁用，1-启用',
  `last_access_time` bigint(20) NULL DEFAULT NULL COMMENT '最后访问时间',
  `daily_request_count` int(11) NULL DEFAULT 0 COMMENT '今日请求次数',
  `total_request_count` bigint(20) NULL DEFAULT 0 COMMENT '总请求次数',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_api_key`(`api_key` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_company`(`company_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'OpenAPI配置表' ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
