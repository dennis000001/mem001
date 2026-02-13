/*
 Navicat Premium Dump SQL

 Source Server         : mysql-test
 Source Server Type    : MySQL
 Source Server Version : 80018 (8.0.18)
 Source Host           : abcg-game789789.rwlb.singapore.rds.aliyuncs.com:3306
 Source Schema         : site_fund

 Target Server Type    : MySQL
 Target Server Version : 80018 (8.0.18)
 File Encoding         : 65001

 Date: 13/02/2026 12:00:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_audit
-- ----------------------------
DROP TABLE IF EXISTS `tb_audit`;
CREATE TABLE `tb_audit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `audit_time` bigint(20) NULL DEFAULT NULL COMMENT '稽核时间，取上次提款成功时的下单时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `related_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_account`(`account` ASC) USING BTREE,
  INDEX `idex_account`(`account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7974 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '稽核区间' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_audit_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_audit_config`;
CREATE TABLE `tb_audit_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `audit_model` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '稽核模式:STRICT_IN_LENIENT_IN-严存严送；STRICT_IN_LENIENT_OUT-严存宽送; LENIENT_IN_STRICT_OUT-宽存严送；LENIENT_IN_LENIENT_OUT-宽存宽送',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `site_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '稽核设置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_audit_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_audit_record`;
CREATE TABLE `tb_audit_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `fund_change_time` bigint(20) NULL DEFAULT NULL COMMENT '账变时间',
  `related_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联订单号',
  `wallet_change_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账变类型：FUND_ADJUST_ADD-会员存款(后台),FUND_ADJUST_SUB-会员提款(后台)',
  `change_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '账变金额',
  `change_amount_after` decimal(20, 2) NULL DEFAULT NULL COMMENT '账变后余额',
  `multiplier` decimal(20, 2) NULL DEFAULT NULL COMMENT '流水倍数',
  `required_masked_volume` decimal(20, 2) NOT NULL COMMENT '要求打码量',
  `remaining_masked_volume` decimal(20, 2) NULL DEFAULT NULL COMMENT '需完成打码量',
  `completed_masked_volume` decimal(20, 2) NULL DEFAULT NULL COMMENT '已完成打码量',
  `pending_masked_volume` decimal(20, 2) NULL DEFAULT NULL COMMENT '待完成打码量',
  `interval_result` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区间结果：Y- 已完成；N-未完成',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_account_fundchangetime`(`account` ASC, `fund_change_time` ASC) USING BTREE,
  INDEX `idx_uid_fundchangetime`(`uid` ASC, `fund_change_time` ASC) USING BTREE,
  INDEX `idx_account_walletchangetype_changeamount`(`account` ASC, `wallet_change_type` ASC, `change_amount` ASC) USING BTREE,
  INDEX `idx_account`(`account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 962268 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 稽核流水' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_audit_record_history
-- ----------------------------
DROP TABLE IF EXISTS `tb_audit_record_history`;
CREATE TABLE `tb_audit_record_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `fund_change_time` bigint(20) NULL DEFAULT NULL COMMENT '账变时间',
  `related_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联订单号',
  `wallet_change_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账变类型：DEPOSIT-会员存款, FUND_ADD-会员存款(后台),DEPOSIT_CASH_BACK-存款返现',
  `change_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '账变金额',
  `change_amount_after` decimal(20, 2) NULL DEFAULT NULL COMMENT '账变余额',
  `multiplier` decimal(20, 2) NULL DEFAULT NULL COMMENT '流水倍数',
  `required_masked_volume` decimal(20, 2) NULL DEFAULT NULL COMMENT '要求打码量',
  `remaining_masked_volume` decimal(20, 2) NULL DEFAULT NULL COMMENT '需完成打码量',
  `completed_masked_volume` decimal(20, 2) NULL DEFAULT NULL COMMENT '已完成打码量',
  `pending_masked_volume` decimal(20, 2) NULL DEFAULT NULL COMMENT '待完成打码量',
  `interval_result` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区间结果：Y-已完成；N-未完成',
  `audit_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '稽核单号',
  `audit_time` bigint(20) NULL DEFAULT NULL COMMENT '稽核时间起始时间（上一笔提款成功订单的创建时间）',
  `audit_completed_time` bigint(20) NULL DEFAULT NULL COMMENT '稽核完成时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1000004 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '稽核记录历史表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_auto_withdraw_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_auto_withdraw_config`;
CREATE TABLE `tb_auto_withdraw_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `thirdparty_payment_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '第三方支付编码',
  `member_level_ids` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '会员等级ID: 0-默认等级',
  `min_amount` decimal(20, 2) NOT NULL COMMENT '最小提款额度',
  `max_amount` decimal(20, 2) NOT NULL COMMENT '最大提款额度',
  `status` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'OFF' COMMENT '状态, 启动:ON, 禁用:OFF',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '自动提款配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_fund_audit_order_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_audit_order_detail`;
CREATE TABLE `tb_fund_audit_order_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `deposit_confirm_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款确认金额',
  `deposit_all_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款总金额',
  `deposit_property` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存款性质',
  `payment_method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `third_part_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方code',
  `withdraw_property` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提款性质',
  `force_withdraw` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '强制提款',
  `large_amount_withdraw` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大额提款',
  `cash_back_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '返现金额',
  `order_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `adjust_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '加整类型',
  `adjust_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '加额备注',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `vip_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账户',
  `audit_id` bigint(20) NOT NULL COMMENT '审核表主键id',
  `order_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '下单金额',
  `order_time` bigint(20) NULL DEFAULT NULL COMMENT '下单时间',
  `third_part_order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方订单号',
  `flow_multiplier` decimal(20, 2) NULL DEFAULT NULL COMMENT '流水倍数',
  `member_fees` decimal(20, 2) NULL DEFAULT NULL COMMENT '会员手续费（刮刮卡）',
  `flow_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '流水金额',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_auditid`(`audit_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25393 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_fund_audit_records
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_audit_records`;
CREATE TABLE `tb_fund_audit_records`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单no',
  `audit_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '审核级别：\r\n(\"FIRST_AUDIT\", \"一审\"),\r\n(\"SECOND_AUDIT\", \"二审\");',
  `auditor_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一审审核人',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '审核状态：\r\n   (\"WAIT_FIRST_AUDIT\", \"待一审\"),\r\n    (\"FIRST_AUDITING\", \"一审中\"),\r\n    (\"WAIT_SECOND_AUDIT\", \"待二审\"),\r\n    (\"SECOND_AUDITING\", \"二审中\"),\r\n    (\"AUDIT_APPROVAL\", \"审核通过\"),\r\n    (\"AUDIT_REFUSE\", \"审核拒绝\");',
  `locked_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一审锁单用户ID',
  `locked_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一审锁单用户名称',
  `locked_at` bigint(20) NULL DEFAULT NULL COMMENT '一审锁单时间',
  `audit_time` bigint(20) NULL DEFAULT NULL COMMENT '审核完成时间',
  `comments` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一审意见(后台)',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `comments_vip` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核意见（会员）',
  `order_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单类型',
  `lock_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '锁单状态：\r\n (\"WAIT_AUDIT_LOCK\", \"待锁单\"),\r\n (\"FIRST_AUDIT_LOCKED\", \"一审锁单\"),\r\n (\"SECOND_AUDIT_LOCKED\", \"二审锁单\");',
  `second_locked_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二审锁单的用户ID',
  `second_locked_at` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二审锁单时间',
  `second_comments` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二审意见(后台)',
  `second_auditor_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二审审核人',
  `withdraw_tag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '撤销标识',
  `auditor_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一审审核人名称',
  `second_auditor_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二审审核人名称',
  `vip_account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账户',
  `order_time` bigint(20) NULL DEFAULT NULL COMMENT '订单时间',
  `order_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '订单金额',
  `second_locked_user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二审锁单用户名称',
  `is_cash_back` tinyint(1) NULL DEFAULT NULL COMMENT '是否返现(会员存款后台,会员提款后台时有效)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tb_fund_audit_records_status_IDX`(`status` ASC) USING BTREE,
  INDEX `idx_cover_count`(`order_time` ASC, `order_type` ASC, `status` ASC) USING BTREE,
  INDEX `tb_fund_audit_records_order_no_IDX`(`order_no` ASC) USING BTREE,
  INDEX `idx_optimized`(`order_type` ASC, `status` ASC, `order_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14651 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_fund_audit_settings
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_audit_settings`;
CREATE TABLE `tb_fund_audit_settings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `setting_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `setting_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '审核订单类型：deposit_audit(存款审核), withdraw_audit(提款审核), business_deposit_audit(后台业务资金审核)',
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否启用',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `first_threshold_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '一审阈值',
  `second_threshold_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '二审阈值',
  `first_audit_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一审开关',
  `second_audit_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二审开关',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_fund_bank
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_bank`;
CREATE TABLE `tb_fund_bank`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name_ch` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡简称',
  `bin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡bin',
  `logo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'logo',
  `company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家',
  `maintain_status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 351 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_fund_bank_sub
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_bank_sub`;
CREATE TABLE `tb_fund_bank_sub`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '本地银行code',
  `logo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_ch` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name_en` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `maintain_status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `custom_logo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_use_sys_icon` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'Y' COMMENT '否使用系统图标 N-使用自定义图标，Y-使用系统图标',
  `sort` int(11) NOT NULL DEFAULT 999 COMMENT '排序（升序，值越小越靠前）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 418 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '银行管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_fund_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_config`;
CREATE TABLE `tb_fund_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置code',
  `value` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '三方支付参数配置json(需要和平台端比对新增字段)',
  `remark` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '金流配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_fund_currency
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_currency`;
CREATE TABLE `tb_fund_currency`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `status` int(11) NOT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_fund_deposit_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_deposit_detail`;
CREATE TABLE `tb_fund_deposit_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `payer` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款人',
  `payment_account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '付款账号',
  `bank` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行名称',
  `merchant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户号',
  `invoke_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用地址',
  `trace_log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '追踪日志',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_uid`(`uid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67039 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '三方存款订单详情' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_fund_deposit_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_deposit_order`;
CREATE TABLE `tb_fund_deposit_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `tp_order_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方订单号',
  `tp_platform` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方平台',
  `tp_channel` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方通道',
  `payment_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式，来自金流管理 > 支付方式管理',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种，来自站点资料管理 > 本站币种',
  `order_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '三方下单金额',
  `actual_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '三方回调金额',
  `exchange_rate` decimal(20, 8) NULL DEFAULT NULL COMMENT '兑换汇率(虚拟币汇率)',
  `order_state` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统存款订单状态：',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'MEMBER_DEPOSIT会员存款；AGENT_DEPOSIT代理存款',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `wallet_change_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '上下分金额',
  `order_currency_amount` decimal(20, 8) NULL DEFAULT NULL COMMENT '下单币种金额',
  `user_amount` decimal(20, 8) NULL DEFAULT NULL COMMENT '用户实际金额 （仅USDT使用）',
  `third_order_result` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SUCCESS--成功 FAIL--失败  EXCEPTION--异常',
  `callback_time` bigint(20) NULL DEFAULT NULL COMMENT '回调时间',
  `complete_time` bigint(20) NULL DEFAULT NULL COMMENT '完成时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_ordernumber`(`order_number` ASC) USING BTREE,
  INDEX `idx_fund_deposit_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_fund_deposit_uid`(`uid` ASC) USING BTREE,
  INDEX `idx_fund_deposit_account`(`account` ASC) USING BTREE,
  INDEX `tb_fund_deposit_order_tp_order_number_IDX`(`tp_order_number` ASC) USING BTREE,
  INDEX `tb_fund_deposit_order_order_state_IDX`(`order_state` ASC) USING BTREE,
  INDEX `idx_orderstate_createtime`(`order_state` ASC, `create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 738073374030362493 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 三方存款订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_fund_external_bank
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_external_bank`;
CREATE TABLE `tb_fund_external_bank`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `external_platform_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方平台名称',
  `external_bank_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方银行id',
  `external_bank_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方银行编码',
  `bank_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '我方银行编码',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态0：停用 1：启用',
  `external_bank_name_ch` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方银行名称中文',
  `external_bank_name_en` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方银行名称英文',
  `company` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用国家',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `external_platform_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方平台代码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4205 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_fund_global_audit_settings
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_global_audit_settings`;
CREATE TABLE `tb_fund_global_audit_settings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态：\"ENABLED\"/\"DISABLED\"',
  `audit_restriction` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核约束（一审与二审不能是同一账号）',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `operation_mode` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分配模式: AUTO/MANUAL',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_fund_member_transfer_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_member_transfer_record`;
CREATE TABLE `tb_fund_member_transfer_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `transfer_time` bigint(20) NOT NULL COMMENT '转账时间',
  `system_order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统订单号',
  `venue_order_no` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '场馆订单号',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `game_account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员游戏账户',
  `game_venue_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '游戏场馆名称',
  `transfer_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转账类型:',
  `amount` decimal(20, 2) NOT NULL COMMENT '转账金额（正数-转入，负数-转出）',
  `finish_time` bigint(20) NOT NULL COMMENT '完成时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  `uid` bigint(20) NOT NULL COMMENT '会员uid',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货币类型',
  `order_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `gp_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏厂商code',
  `gp_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏厂商name',
  `category_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '品类 1:SPORTS-体育 2:SLOT-老虎机 3:LIVE-真人 4:POKER-棋牌 5:FISHING-捕鱼,6:ESPORTS-电竞,7:LOTTERY-彩票,8:ANIMAL-斗鸡',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member_transfer_transfer_time`(`transfer_time` ASC) USING BTREE,
  INDEX `idx_member_transfer_finish_time`(`finish_time` ASC) USING BTREE,
  INDEX `idx_member_transfer_amount`(`amount` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 855574 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 会员转账记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_fund_order_event_history
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_order_event_history`;
CREATE TABLE `tb_fund_order_event_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `event_time` bigint(20) NULL DEFAULT NULL COMMENT '事件完成时间',
  `event_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '事件操作人',
  `order_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `event` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '事件',
  `event_add` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '事件补充',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作时ip',
  `order_action` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单后续动作：\r\n等待：表示订单还在继续跑流程\r\n订单关闭：表示订单已完成全部流程，达到终态',
  `remark` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_orderno`(`order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66763 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单事件详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_fund_payment
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_payment`;
CREATE TABLE `tb_fund_payment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式名称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式编码',
  `icon` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '支付方式图标',
  `currency` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付币种',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付类型',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `activate_time` bigint(20) NULL DEFAULT NULL COMMENT '激活时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 343 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付方式表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_fund_payment_callback_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_payment_callback_log`;
CREATE TABLE `tb_fund_payment_callback_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '(\'deposit\',\'withdraw\')',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `payment_method` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `platform_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `raw_body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `verified` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `handled` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `handled_time` bigint(20) NULL DEFAULT NULL,
  `amount_different` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方收单金额 和 三方回调金额差异',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3663 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_fund_withdraw_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_withdraw_detail`;
CREATE TABLE `tb_fund_withdraw_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `payee` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款人',
  `payee_account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收款账号',
  `bank` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行名称',
  `merchant_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商户号',
  `invoke_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '调用地址',
  `trace_log` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '追踪日志',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_uid`(`uid` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1009 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '三方出款订单详情' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_fund_withdraw_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_withdraw_order`;
CREATE TABLE `tb_fund_withdraw_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_number` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `tp_order_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方订单号',
  `tp_platform` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方平台',
  `tp_channel` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方通道',
  `payment_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式，来自金流管理 > 支付方式管理',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种，来自站点资料管理 > 本站币种',
  `order_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '三方下单金额',
  `actual_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '三方回调金额',
  `exchange_rate` decimal(20, 8) NULL DEFAULT NULL COMMENT '兑换汇率(虚拟币汇率)',
  `order_state` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统提款订单状态',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'MEMBER_DEPOSIT会员存款；AGENT_DEPOSIT代理存款',
  `wallet_change_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '上下分金额',
  `order_currency_amount` decimal(20, 8) NULL DEFAULT NULL COMMENT '下单币种金额',
  `user_amount` decimal(20, 8) NULL DEFAULT NULL COMMENT '用户实际金额 （仅USDT使用）',
  `third_order_result` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'SUCCESS--成功 FAIL--失败  EXCEPTION--异常',
  `callback_time` bigint(20) NULL DEFAULT NULL COMMENT '回调时间',
  `complete_time` bigint(20) NULL DEFAULT NULL COMMENT '完成时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_fund_withdraw_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_fund_withdraw_uid`(`uid` ASC) USING BTREE,
  INDEX `idx_fund_withdraw_account`(`account` ASC) USING BTREE,
  INDEX `tb_fund_withdraw_order_order_number_IDX`(`order_number` ASC) USING BTREE,
  INDEX `tb_fund_withdraw_order_tp_order_number_IDX`(`tp_order_number` ASC) USING BTREE,
  INDEX `tb_fund_withdraw_order_order_state_IDX`(`order_state` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 735449888669565781 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 三方提款订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_manual_adjust
-- ----------------------------
DROP TABLE IF EXISTS `tb_manual_adjust`;
CREATE TABLE `tb_manual_adjust`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统订单号：类型+日期+8位uuid',
  `biz_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型：1-会员存款，2-其他',
  `wallet_change_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账变类型：会员存款(后台)，会员提款(后台)',
  `amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '加额金额',
  `currency` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货币类型',
  `multiplier` decimal(20, 2) NULL DEFAULT NULL COMMENT '流水倍数',
  `operation_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作类型：ADD-增加；SUB-减少',
  `audit_time` bigint(20) NULL DEFAULT NULL COMMENT '审核完成时间',
  `complete_time` bigint(20) NULL DEFAULT NULL COMMENT '订单完成时间',
  `user_remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审核备注（会员）',
  `message_id` bigint(20) NULL DEFAULT NULL COMMENT '站内信消息Id',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态：SUCCESS-成功，PENDING-审核中，REJECTED-已拒绝',
  `fund_process_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '处理状态：PENDING-待处理，SUCCESS-处理成功，FAILED-处理失败',
  `error_msg` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '错误信息',
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `auditor` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审核备注（后台）',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '修改人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '修改时间',
  `is_cash_back` tinyint(1) NULL DEFAULT NULL COMMENT '是否返现(会员存款后台,会员提款后台时有效)',
  `member_grade_cashback_id` bigint(20) NULL DEFAULT NULL COMMENT '会员等级返现ID',
  `cashback_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '返现金额',
  `flow_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '流水金额',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_orderno`(`order_no` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_uid`(`uid` ASC) USING BTREE,
  INDEX `idx_account`(`account` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC, `fund_process_status` ASC) USING BTREE,
  INDEX `idx_update_time`(`update_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1136567 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员资金调整表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_manual_adjust_audit_bak
-- ----------------------------
DROP TABLE IF EXISTS `tb_manual_adjust_audit_bak`;
CREATE TABLE `tb_manual_adjust_audit_bak`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `adjustment_time` bigint(20) NULL DEFAULT NULL COMMENT '调整时间',
  `system_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统订单号',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `order_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态：P-处理中，S-成功，F-失败',
  `amount_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '加额类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员人工加额审核' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_manual_adjust_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_manual_adjust_message`;
CREATE TABLE `tb_manual_adjust_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `message_unique_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息唯一id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员资金人工调整站内信表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_payment_channel
-- ----------------------------
DROP TABLE IF EXISTS `tb_payment_channel`;
CREATE TABLE `tb_payment_channel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `payment_channel_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付渠道编码',
  `payment_channel_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付渠道名称',
  `thirdparty_payment_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方支付编码',
  `implementation_method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实现方式',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态：INIT-未启用，ENABLED-已激活，DISABLED-已停用',
  `activation_time` bigint(20) NULL DEFAULT NULL COMMENT '激活时间',
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `payment_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付类型：0-代收,1-代付,2-代收/代付',
  `payment_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种',
  `currency_unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种单位',
  `max_amount` decimal(20, 2) NULL DEFAULT NULL,
  `min_amount` decimal(20, 2) NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `implementation_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '实现代码',
  `request_template_id` bigint(20) NULL DEFAULT NULL COMMENT '请求 支付模板ID',
  `http_method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'HTTP方法  POST请求   GET请求    FORM请求',
  `http_data_type` int(4) NULL DEFAULT NULL COMMENT 'HTTP数据类型 1: JSON   2: URL   3: x-www-form-urlencoded',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tb_payment_channel_unique_1`(`payment_channel_code` ASC) USING BTREE,
  UNIQUE INDEX `tb_payment_channel_unique`(`thirdparty_payment_code` ASC, `payment_method` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 457 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付渠道信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_payment_template
-- ----------------------------
DROP TABLE IF EXISTS `tb_payment_template`;
CREATE TABLE `tb_payment_template`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `payment_template_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付模板名称',
  `payment_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付方式',
  `protocol_type` int(11) NOT NULL COMMENT '协议类型(1:请求协议,2:回调协议)',
  `http_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'HTTP方法(POST/GET/FORM)',
  `http_data_type` int(11) NOT NULL COMMENT 'HTTP数据类型(1:JSON,2:URL,3:x-www-form-urlencoded)',
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `api_type` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代收 FUND_DEPOSIT_API  FUND_DEPOSIT_URL; 代付 WITHDRAW_DEPOSIT_API WITHDRAW_DEPOSIT_URL； 查单 CHECK_ORDER_URL',
  `payment_channel_id` bigint(20) NULL DEFAULT NULL COMMENT '通道id',
  `payment_thirdparty_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方平台code',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 586 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付模板表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_payment_template_data
-- ----------------------------
DROP TABLE IF EXISTS `tb_payment_template_data`;
CREATE TABLE `tb_payment_template_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `payment_template_id` bigint(20) NOT NULL COMMENT '支付模板ID',
  `data_type` int(11) NOT NULL COMMENT '数据类型(1:SPEL表达式,2:请求模板,3:响应模板)',
  `data_detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据详情(JSON格式)',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `payment_thirdparty_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方支付代码',
  `data_category` int(11) NULL DEFAULT NULL COMMENT '数据分类(0:公共数据,1:私有数据)',
  `api_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '* FUND_DEPOSIT_API 代收\r\n     * FUND_DEPOSIT_URL 代收\r\n     * WITHDRAW_DEPOSIT_API\r\n     * WITHDRAW_DEPOSIT_URL',
  `payment_channel_id` bigint(20) NULL DEFAULT NULL COMMENT '通道id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member_info_register_time`(`payment_template_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2650 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付模板数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_payment_thirdparty
-- ----------------------------
DROP TABLE IF EXISTS `tb_payment_thirdparty`;
CREATE TABLE `tb_payment_thirdparty`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `thirdparty_payment_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '第三方支付编码',
  `thirdparty_payment_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '第三方支付名称',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态：INIT-未启用，ENABLED-已激活，DISABLED-已停用',
  `activation_time` bigint(20) NULL DEFAULT NULL COMMENT '激活时间',
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `order_url_redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下单重定向URL',
  `order_url_info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下单信息URL',
  `check_order_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '查单URL',
  `get_channel_status_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '获取通道状态URL',
  `get_balance_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '获取余额URL',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Logo URL',
  `get_exchange_rate_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `channel_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'ON' COMMENT '通道状态',
  `status_update_time` bigint(20) NULL DEFAULT NULL COMMENT '通道状态更新时间',
  `status_updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道状态更新人',
  `request_req_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求协议 -- 请求数据',
  `request_res_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '请求协议 -- 响应数据',
  `callback_req_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '回调协议 -- 请求数据',
  `callback_res_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '回调协议 -- 响应数据',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付第三方信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_rebate_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_rebate_detail`;
CREATE TABLE `tb_rebate_detail`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `related_order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联订单号',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账户',
  `uid` bigint(20) NOT NULL COMMENT '会员ID',
  `currency` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '币种',
  `order_amount` decimal(20, 2) NOT NULL COMMENT '订单金额',
  `finish_time` bigint(20) NULL DEFAULT NULL COMMENT '返水完成时间',
  `game_id` bigint(20) NULL DEFAULT NULL COMMENT '游戏主键ID',
  `venue_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆code',
  `category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏分类/品类code',
  `venue_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆名称',
  `grade` int(32) NULL DEFAULT NULL COMMENT '会员等级值',
  `order_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子订单状态：AUDITING-审核中，AUDIT_APPROVAL-审核完成，DEPRECATED-已废弃',
  `audit_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核方式：AUTO-自动审核,MANUAL-人工审核',
  `sum_date` date NULL DEFAULT NULL COMMENT '统计日期(YYYY-MM-DD,部署站点国家的日期）',
  `multiplier` decimal(20, 2) NULL DEFAULT NULL COMMENT '流水倍数',
  `type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '返水订单类型type：SYSTEM-系统领取，SELF-自助领取',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'PROCESSING' COMMENT '返水订单状态：PROCESSING-待处理，SUCCESS-成功，FAIL-失败',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idex_order_no`(`order_no` ASC) USING BTREE COMMENT '返水订单号唯一',
  INDEX `idx_rebate_detail_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_rebate_detail_order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_rebate_detail_account`(`account` ASC) USING BTREE,
  INDEX `idx_rebate_detail_finish_time`(`finish_time` ASC) USING BTREE,
  INDEX `idx_rebate_detail_uid`(`uid` ASC) USING BTREE,
  INDEX `idx_status_uid`(`status` ASC) USING BTREE COMMENT '返水状态索引'
) ENGINE = InnoDB AUTO_INCREMENT = 10632 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '返水明细表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_site_deposit_channel
-- ----------------------------
DROP TABLE IF EXISTS `tb_site_deposit_channel`;
CREATE TABLE `tb_site_deposit_channel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `payment_channel_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '三方通道标识',
  `site_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点标识',
  `max_amount` decimal(20, 0) NULL DEFAULT NULL COMMENT '单笔最大金额（不能超过平台限制）',
  `min_amount` decimal(20, 0) NULL DEFAULT NULL COMMENT '单笔最小金额（不能超过平台限制）',
  `is_mem_enter_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否允许会员输入Y-是 N-否',
  `is_quick_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否快捷金额 Y-是 N-否',
  `quick_amount_item` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快捷金额项集合',
  `channel_language` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '通道文案多语言配置json',
  `visible` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '存款设置-是否显示（Y显示 N隐藏）',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  `activation_time` bigint(20) NULL DEFAULT NULL COMMENT '激活时间',
  `fund_payment_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付方式标识',
  `thirdparty_payment_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方平台商户编码',
  `quick_amounts` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快捷金额项集合',
  `agent_grades` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理等级值集合',
  `member_grade_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道可见配置关联会员等级ID: 0-默认等级',
  `rate` decimal(20, 4) NULL DEFAULT NULL COMMENT '单笔费率（0-0.2）',
  `fix_rate` decimal(20, 2) NULL DEFAULT NULL COMMENT '单笔固定手续费（0-9999）',
  `member_rate` decimal(20, 4) NULL DEFAULT NULL COMMENT '会员单笔费率',
  `member_fix_rate` decimal(20, 2) NULL DEFAULT NULL COMMENT '会员单笔固定费率',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `terminal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支持终端配置，多个逗号隔开WEB,H5,ANDROID,IOS',
  `display_style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '展示方式：Popup-弹窗，IFRAM-ifram展示',
  `daily_limit` decimal(20, 2) NULL DEFAULT NULL COMMENT '每日限额',
  `total_limit` decimal(20, 2) NULL DEFAULT NULL COMMENT '累计限额',
  `daily_exceed_ratio` decimal(20, 2) NULL DEFAULT NULL COMMENT '每日限额超出比例',
  `total_exceed_ratio` decimal(20, 2) NULL DEFAULT NULL COMMENT '累计限额超出比例',
  `payment_channel_alias` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点通道名称别名（默认通道名称）',
  `bank_selectable` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否显示银行选取列表',
  `bank_mandatory` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否必填银行',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `channel_code_index`(`payment_channel_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 192 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存款设置代付通道配置站点表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_site_deposit_payment
-- ----------------------------
DROP TABLE IF EXISTS `tb_site_deposit_payment`;
CREATE TABLE `tb_site_deposit_payment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `site_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点标识',
  `sort` int(11) NOT NULL COMMENT '排序(序号小的排前面)',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  `fund_payment_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联的平台支付方式code',
  `visible` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存款设置-是否显示（Y显示 N隐藏）',
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种',
  `currency_unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种单位(已废弃)',
  `logo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标地址',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `pay_code_index`(`fund_payment_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存款设置支付方式表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_site_exchange_rate
-- ----------------------------
DROP TABLE IF EXISTS `tb_site_exchange_rate`;
CREATE TABLE `tb_site_exchange_rate`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `site_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点标识',
  `is_dep_wd_rate_same` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否存款与提款汇率统一 N-否 Y-是',
  `rate_type` int(11) NOT NULL COMMENT '汇率类型：0-固定汇率 1-实时汇率',
  `currency` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '币种',
  `exchange_rate_ratio` decimal(20, 2) NOT NULL COMMENT '汇率（1USD的汇率）',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新者',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型 DEPOSIT-存款，WITHDRAW-提款',
  `rate_source` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '汇率来源：BINANCE-币安，OKX-欧易，PLATFORM_BEST-平台最优，USER_BEST-用户最优',
  `binance_price` decimal(20, 2) NULL DEFAULT NULL COMMENT '币安汇率（1 USDT 对应法币)',
  `okx_price` decimal(20, 2) NULL DEFAULT NULL COMMENT '欧易汇率（1 USDT 对应法币）',
  `binance_update_time` bigint(20) NULL DEFAULT NULL COMMENT '币安汇率更新时间（毫秒时间戳）',
  `okx_update_time` bigint(20) NULL DEFAULT NULL COMMENT '欧易汇率更新时间（毫秒时间戳)',
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '站点金流汇率设置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_site_payment_thirdparty
-- ----------------------------
DROP TABLE IF EXISTS `tb_site_payment_thirdparty`;
CREATE TABLE `tb_site_payment_thirdparty`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `thirdparty_payment_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '第三方支付编码',
  `site_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站点标识',
  `thirdparty_payment_name_alias` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '三方平台支付方式别名',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点logo URL',
  `pay_param` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '三方支付参数配置json(需要和平台端比对新增字段)',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '财务基础设置-三方平台支付方式状态：OFF-关闭（已停用），ON-启用',
  `sort` int(11) NOT NULL COMMENT '排序',
  `ip_whitelist` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回调ip(即IP白名单), 多个ip地址用逗号隔开',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  `thirdparty_balance` decimal(20, 8) NULL DEFAULT 0.00000000 COMMENT '三方商户余额',
  `balance_update_time` bigint(20) NULL DEFAULT NULL COMMENT '余额更新时间，时间戳毫秒，可为null',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '财务设置站点三方通道配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_site_withdraw_channel
-- ----------------------------
DROP TABLE IF EXISTS `tb_site_withdraw_channel`;
CREATE TABLE `tb_site_withdraw_channel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `payment_channel_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '三方通道标识',
  `site_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点标识',
  `max_amount` decimal(20, 0) NULL DEFAULT NULL COMMENT '单笔最大金额（不能超过平台限制）',
  `min_amount` decimal(20, 0) NULL DEFAULT NULL COMMENT '单笔最小金额（不能超过平台限制）',
  `channel_language` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '通道文案多语言配置json',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `fund_payment_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式标识',
  `activation_time` bigint(20) NULL DEFAULT NULL COMMENT '激活时间',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'OFF' COMMENT '出款设置: ON-启用(出款轮询机制) OFF-停用',
  `thirdparty_payment_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方平台商户编码',
  `agent_grades` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理等级值集合',
  `member_grade_ids` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通道可见配置关联会员等级ID: 0-默认等级',
  `rate` decimal(20, 4) NULL DEFAULT NULL COMMENT '单笔费率（0-0.2）',
  `fix_rate` decimal(20, 3) NULL DEFAULT NULL COMMENT '单笔固定手续费（0-9999）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `terminal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支持终端配置，多个逗号隔开WEB,H5,ANDROID,IOS',
  `display_style` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '展示方式：Popup-弹窗，IFRAM-ifram展示',
  `daily_limit` decimal(20, 2) NULL DEFAULT NULL COMMENT '每日限额',
  `total_limit` decimal(20, 2) NULL DEFAULT NULL COMMENT '累计限额',
  `daily_exceed_ratio` decimal(20, 2) NULL DEFAULT NULL COMMENT '每日限额超出比例累计限额',
  `total_exceed_ratio` decimal(20, 2) NULL DEFAULT NULL COMMENT '累计限额超出比例',
  `payment_channel_alias` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点通道名称别名（默认通道名称）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出款设置代付通道配置站点表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_site_withdraw_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_site_withdraw_config`;
CREATE TABLE `tb_site_withdraw_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `large_deposit_amount` decimal(16, 0) NULL DEFAULT NULL COMMENT '大额存款金额阈值（超过此金额视为大额存款）',
  `force_withdraw_switch` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '强制提款开关（ON-开启强制提款，OFF-关闭强制提款）',
  `force_withdraw_condition` decimal(20, 2) NULL DEFAULT NULL COMMENT '强制提款触发条件百分比（当存款金额超过大额存款金额的百分比时触发强制提款）',
  `admin_fee_percent` decimal(20, 2) NULL DEFAULT NULL COMMENT '行政手续费百分比（精确到两位小数，如 0.50 表示 0.5%）',
  `deposit_cashback_percent` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款返现百分比（精确到两位小数，如 1.00 表示 1%）',
  `deposit_discount_percent` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款优惠百分比（精确到两位小数，如 2.00 表示 2%）',
  `promo_bonus_percent` decimal(20, 2) NULL DEFAULT NULL COMMENT '活动彩金百分比（精确到两位小数，如 3.00 表示 3%）',
  `site_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '站点代码',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `member_withdraw_switch` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员提款开关（ON-开启会员提款，OFF-关闭会员提款）',
  `admin_fee_switch` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行政手续费开关（ON-开启，OFF-关闭）',
  `deposit_cashback_switch` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '存款返现开关（ON-开启，OFF-关闭）',
  `deposit_discount_switch` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '存款优惠开关（ON-开启，OFF-关闭）',
  `promo_bonus_switch` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '活动彩金开关（ON-开启，OFF-关闭）',
  `forbid_withdrawal_switch` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '禁止提款开关（ON-开启，OFF-关闭）',
  `forbid_withdrawal_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '禁止提款详细配置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '站点提款配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_site_withdraw_payment
-- ----------------------------
DROP TABLE IF EXISTS `tb_site_withdraw_payment`;
CREATE TABLE `tb_site_withdraw_payment`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `site_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '站点标识',
  `sort` int(11) NOT NULL COMMENT '排序',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  `fund_payment_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联的平台支付方式标识',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出款设置 ON-已启用 OFF-已停用(客户端无法提款，不影响通道状态)',
  `currency` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种',
  `currency_unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '币种单位',
  `logo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '出款设置支付方式表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_venues_wallet
-- ----------------------------
DROP TABLE IF EXISTS `tb_venues_wallet`;
CREATE TABLE `tb_venues_wallet`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` bigint(20) NOT NULL COMMENT '会员uid',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `gp_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏厂商code',
  `total_balance` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '币种',
  `game_account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员游戏账户',
  `venue_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆code',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'ON' COMMENT '场馆钱包状态：ON-开启，OFF-关闭',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid_venuescode_index`(`account` ASC, `venue_code` ASC) USING BTREE,
  INDEX `idx_uid_currency_gp_code`(`uid` ASC, `currency` ASC, `gp_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7796 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '游戏场馆钱包' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_venues_wallet_balance_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_venues_wallet_balance_log`;
CREATE TABLE `tb_venues_wallet_balance_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `uid` bigint(20) NOT NULL COMMENT '用户ID',
  `venue_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆code',
  `related_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联订单号',
  `currency` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '货币类型',
  `amount` decimal(20, 2) NOT NULL COMMENT '金额',
  `before_balance` decimal(20, 2) NOT NULL COMMENT '变更前余额',
  `after_balance` decimal(20, 2) NOT NULL COMMENT '变更后余额',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间 (Unix时间戳)',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间 (Unix时间戳)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `related_order_no_index`(`related_order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16011 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员场馆钱包账变流水表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_wallet
-- ----------------------------
DROP TABLE IF EXISTS `tb_wallet`;
CREATE TABLE `tb_wallet`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` bigint(20) NOT NULL COMMENT '会员uid',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `total_balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '总余额(允许为负)',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '币种',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid_crrency_index`(`uid` ASC, `currency` ASC) USING BTREE,
  UNIQUE INDEX `uid_index`(`uid` ASC) USING BTREE,
  INDEX `idx_totalbalance_account`(`account` ASC, `total_balance` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 812219 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 会员中心钱包表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_wallet_balance_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_wallet_balance_log`;
CREATE TABLE `tb_wallet_balance_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户',
  `uid` bigint(20) NOT NULL COMMENT '用户ID',
  `related_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联订单号',
  `change_subject` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账变科目',
  `change_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账变类型',
  `currency` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '货币类型',
  `amount` decimal(20, 2) NOT NULL COMMENT '金额',
  `before_balance` decimal(20, 2) NOT NULL COMMENT '变更前余额',
  `after_balance` decimal(20, 2) NOT NULL COMMENT '变更后余额',
  `cashback_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款返现',
  `multiplier` decimal(20, 2) NULL DEFAULT NULL COMMENT '流水倍数',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新者',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  `remark_val` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账变备注',
  `keyword` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '筛选关键标识',
  `remark_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账变填充备注标识集合',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_relatedorderno`(`related_order_no` ASC) USING BTREE,
  INDEX `tb_wallet_balance_log_uid_IDX`(`uid` ASC, `create_time` DESC) USING BTREE,
  INDEX `idx_balance_log_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_balance_log_before_balance`(`before_balance` ASC) USING BTREE,
  INDEX `idx_balance_log_amount`(`amount` ASC) USING BTREE,
  INDEX `idx_balance_log_after_balance`(`after_balance` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1462994 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 会员钱包账变流水' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_wallet_balance_log_temp260129
-- ----------------------------
DROP TABLE IF EXISTS `tb_wallet_balance_log_temp260129`;
CREATE TABLE `tb_wallet_balance_log_temp260129`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户',
  `uid` bigint(20) NOT NULL COMMENT '用户ID',
  `related_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联订单号',
  `change_subject` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账变科目',
  `change_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账变类型',
  `currency` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '货币类型',
  `amount` decimal(20, 2) NOT NULL COMMENT '金额',
  `before_balance` decimal(20, 2) NOT NULL COMMENT '变更前余额',
  `after_balance` decimal(20, 2) NOT NULL COMMENT '变更后余额',
  `cashback_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款返现',
  `multiplier` decimal(20, 2) NULL DEFAULT NULL,
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新者',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  `remark_val` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账变备注',
  `keyword` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '筛选关键标识',
  `remark_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账变填充备注标识集合',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_relatedorderno`(`related_order_no` ASC) USING BTREE,
  INDEX `tb_wallet_balance_log_uid_IDX`(`uid` ASC, `create_time` DESC) USING BTREE,
  INDEX `idx_balance_log_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_balance_log_before_balance`(`before_balance` ASC) USING BTREE,
  INDEX `idx_balance_log_amount`(`amount` ASC) USING BTREE,
  INDEX `idx_balance_log_after_balance`(`after_balance` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1458466 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 会员钱包账变流水' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_wallet_cashback_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_wallet_cashback_order`;
CREATE TABLE `tb_wallet_cashback_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `related_order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联订单号',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账户',
  `uid` bigint(20) NOT NULL COMMENT '会员ID',
  `currency` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '币种',
  `need_audit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否需要审核 Y-需要 N-不需要',
  `complete_time` bigint(20) NULL DEFAULT NULL COMMENT '完成时间',
  `order_amount` decimal(20, 2) NOT NULL COMMENT '订单金额',
  `multiplier` decimal(20, 2) NULL DEFAULT NULL COMMENT '流水倍数',
  `cashback_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '返现金额',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型：存款（DEPOSIT）或取款（WITHDRAW）',
  `exchange_rate` decimal(20, 2) NULL DEFAULT NULL COMMENT '兑换汇率(虚拟币汇率)',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_wallet_cashback_type`(`type` ASC) USING BTREE,
  INDEX `idx_wallet_cashback_uid`(`uid` ASC) USING BTREE,
  INDEX `idx_wallet_cashback_account`(`account` ASC) USING BTREE,
  INDEX `idx_wallet_cashback_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_wallet_cashback_order_no`(`order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25456 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员返现订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_wallet_deposit_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_wallet_deposit_order`;
CREATE TABLE `tb_wallet_deposit_order`  (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `related_order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联订单号',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账户',
  `uid` bigint(20) NOT NULL COMMENT '会员ID',
  `currency` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '币种',
  `need_audit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否需要审核 Y-需要 N-不需要',
  `complete_time` bigint(20) NULL DEFAULT NULL COMMENT '完成时间',
  `order_amount` decimal(20, 2) NOT NULL COMMENT '订单金额',
  `multiplier` decimal(20, 2) NULL DEFAULT NULL COMMENT '流水倍数',
  `cashback_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '返现金额',
  `original_cashback_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '原始返现金额',
  `thirdparty_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方存款订单号',
  `thirdparty_order_state` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方订单状态：P-处理中 C-已入款',
  `pay_url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '支付地址',
  `thirdparty_payment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方平台code',
  `thirdparty_payment_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方平台名称',
  `payment_channel_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方通道code',
  `payment_channel_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方通道名称',
  `fund_payment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式code',
  `fund_payment_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式名称',
  `confirm_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '确认金额',
  `member_grade_cashback_id` bigint(20) NULL DEFAULT NULL COMMENT '用户返现策略ID',
  `total_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款总金额',
  `order_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态：PROCESSING-处理中(等待)，SUCCESS-成功，FAIL-失败，CANCEL_ORDER-会员撤单',
  `order_stage` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单阶段（映射审批阶段状态）',
  `nature` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存款性质',
  `audit_time` bigint(20) NULL DEFAULT NULL COMMENT '审核时间',
  `fees` decimal(20, 2) NULL DEFAULT NULL COMMENT '通道手续费',
  `member_fees` decimal(20, 2) NULL DEFAULT NULL COMMENT '会员手续费（刮刮卡）',
  `order_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单类型，走三方，或者线下',
  `large_amount_tag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大额标记，Y是，N不是',
  `large_amount_threshold` decimal(20, 2) NULL DEFAULT NULL COMMENT '大额阈值',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下单ip',
  `exchange_rate` decimal(20, 8) NULL DEFAULT NULL COMMENT '兑换汇率(虚拟币汇率)',
  `currency_amount` decimal(20, 8) NULL DEFAULT NULL COMMENT '币种下单金额',
  `order_currency` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下单币种',
  `third_page` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '三方页面富文本',
  `comments_vip` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核备注（会员）',
  `operation_notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `callback_time` bigint(20) NULL DEFAULT NULL COMMENT '回调时间',
  `flow_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '流水金额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_wallet_deposit_order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_wallet_deposit_uid`(`uid` ASC) USING BTREE,
  INDEX `idx_wallet_deposit_account`(`account` ASC) USING BTREE,
  INDEX `idx_wallet_deposit_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_wallet_deposit_status`(`order_status` ASC) USING BTREE,
  INDEX `idx_orderstatus_completetime_createtime`(`order_status` ASC, `complete_time` ASC, `create_time` ASC) USING BTREE,
  INDEX `idx_wallet_deposit_complete_time`(`complete_time` ASC) USING BTREE,
  INDEX `idx_wallet_deposit_order_amount`(`order_amount` ASC) USING BTREE,
  INDEX `idx_wallet_deposit_confirm_amount`(`confirm_amount` ASC) USING BTREE,
  INDEX `idx_wallet_deposit_cashback_amount`(`cashback_amount` ASC) USING BTREE,
  INDEX `idx_wallet_deposit_member_fees`(`member_fees` ASC) USING BTREE,
  INDEX `idx_wallet_deposit_total_amount`(`total_amount` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 会员存款订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_wallet_temp260129
-- ----------------------------
DROP TABLE IF EXISTS `tb_wallet_temp260129`;
CREATE TABLE `tb_wallet_temp260129`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` bigint(20) NOT NULL COMMENT '会员uid',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `total_balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '总余额(允许为负)',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '币种',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid_crrency_index`(`uid` ASC, `currency` ASC) USING BTREE,
  UNIQUE INDEX `uid_index`(`uid` ASC) USING BTREE,
  INDEX `idx_totalbalance_account`(`account` ASC, `total_balance` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 812068 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 会员中心钱包表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_wallet_transfer_game_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_wallet_transfer_game_record`;
CREATE TABLE `tb_wallet_transfer_game_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `transfer_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转账类型: ALL_AMOUNT-全部金额, TARGET_AMOUNT-指定金额',
  `uid` bigint(20) NOT NULL COMMENT '会员uid',
  `account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账户',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货币类型',
  `transfer_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '转账金额（正数-转入，负数-转出）',
  `transfer_direction` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏转账方向：IN-转入, OUT-转出（中心钱包视角）',
  `after_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '转账后余额',
  `order_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态：PROCESSING-处理中，SUCCESS-成功，FAIL-失败',
  `transfer_time` bigint(20) NULL DEFAULT NULL COMMENT '转账时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建人',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新人',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_uid`(`uid` ASC) USING BTREE,
  INDEX `idx_order_status`(`order_status` ASC) USING BTREE,
  INDEX `idx_uid_order_status`(`uid` ASC, `order_status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1554 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '中心钱包转游戏-转账记录表（单一钱包使用）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_wallet_withdraw_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_wallet_withdraw_order`;
CREATE TABLE `tb_wallet_withdraw_order`  (
  `id` bigint(20) NOT NULL COMMENT '主键ID',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `related_order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联订单号',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账户',
  `uid` bigint(20) NOT NULL COMMENT '会员ID',
  `currency` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '币种',
  `need_audit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否需要审核 Y-需要 N-不需要',
  `complete_time` bigint(20) NULL DEFAULT NULL COMMENT '完成时间',
  `order_amount` decimal(20, 2) NOT NULL COMMENT '订单金额',
  `multiplier` decimal(20, 2) NULL DEFAULT NULL COMMENT '流水倍数',
  `cashback_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '返现金额',
  `original_cashback_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '原始返现金额',
  `thirdparty_order_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方订单号',
  `member_grade_cashback_id` bigint(20) NULL DEFAULT NULL COMMENT '会员等级返现ID',
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提款类型',
  `thirdparty_payment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方支付代码',
  `thirdparty_payment_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方支付名称',
  `payment_channel_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道代码',
  `member_payment_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员支付类型',
  `member_payment_id` bigint(20) NULL DEFAULT NULL COMMENT '会员支付ID',
  `final_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '最终金额',
  `admin_fee_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '行政费',
  `deposit_cashback_deduct_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款返现扣款',
  `order_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态',
  `order_stage` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单阶段',
  `forced_withdraw` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否强制提款 Y-是 N-否',
  `audit_time` bigint(20) NULL DEFAULT NULL COMMENT '审核时间',
  `payment_channel_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方通道名称',
  `fund_payment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式code',
  `fund_payment_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式名称',
  `order_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单类型，走三方，或者线下',
  `large_amount_threshold` decimal(20, 2) NULL DEFAULT NULL COMMENT '大额标记，Y是，N不是',
  `large_amount_tag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大额阈值',
  `fees` decimal(20, 2) NULL DEFAULT NULL COMMENT '通道手续费',
  `ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下单ip',
  `exchange_rate` decimal(20, 8) NULL DEFAULT NULL COMMENT '兑换汇率(虚拟币汇率)',
  `currency_amount` decimal(20, 8) NULL DEFAULT NULL COMMENT '币种下单金额',
  `final_currency_amount` decimal(20, 8) NULL DEFAULT NULL COMMENT '最终金额(币种单位)',
  `order_currency` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下单币种',
  `lock_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '锁单状态 WAIT_LOCK-待锁单; LOCKED-已锁单',
  `lock_by` bigint(20) NULL DEFAULT NULL COMMENT '锁单人',
  `lock_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '锁单时间',
  `lock_by_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '锁单人名称',
  `audit_pass` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自动跳过审核',
  `comments_vip` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核备注（会员）',
  `operation_notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作备注',
  `callback_time` bigint(20) NULL DEFAULT NULL COMMENT '回调时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tb_wallet_withdraw_order_unique`(`order_no` ASC) USING BTREE,
  INDEX `idx_wallet_withdraw_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_wallet_withdraw_order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_wallet_withdraw_account`(`account` ASC) USING BTREE,
  INDEX `idx_wallet_withdraw_status`(`order_status` ASC) USING BTREE,
  INDEX `idx_uid_orderstage`(`uid` ASC, `order_stage` ASC) USING BTREE,
  INDEX `idx_wallet_withdraw_uid`(`uid` ASC) USING BTREE,
  INDEX `idx_wallet_withdraw_thirdparty_order_no`(`thirdparty_order_no` ASC) USING BTREE,
  INDEX `idx_wallet_withdraw_audit_time`(`audit_time` ASC) USING BTREE,
  INDEX `idx_wallet_withdraw_complete_time`(`complete_time` ASC) USING BTREE,
  INDEX `idx_wallet_withdraw_cashback_amount`(`cashback_amount` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员提款订单表' ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
