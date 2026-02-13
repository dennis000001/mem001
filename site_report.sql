/*
 Navicat Premium Dump SQL

 Source Server         : mysql-test
 Source Server Type    : MySQL
 Source Server Version : 80018 (8.0.18)
 Source Host           : abcg-game789789.rwlb.singapore.rds.aliyuncs.com:3306
 Source Schema         : site_report

 Target Server Type    : MySQL
 Target Server Version : 80018 (8.0.18)
 File Encoding         : 65001

 Date: 13/02/2026 11:59:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_activity_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity_daily_report`;
CREATE TABLE `tb_activity_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `activity_id` bigint(20) NULL DEFAULT NULL COMMENT '活动id',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `template_id` bigint(20) NULL DEFAULT NULL COMMENT '模板ID',
  `template_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板代码',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态,来自系统字典',
  `time_start` bigint(20) NULL DEFAULT NULL COMMENT '开始时间',
  `time_end` bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
  `display_time_start` bigint(20) NULL DEFAULT NULL COMMENT '显示开始时间',
  `display_time_end` bigint(20) NULL DEFAULT NULL COMMENT '显示结束时间',
  `date_time` date NULL DEFAULT NULL COMMENT '数据归属日期',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 98778 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '每日活动信息记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_general_report_all
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_general_report_all`;
CREATE TABLE `tb_agent_general_report_all`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `agent_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理类型：TOP-总代；COMMON-一般代理',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理账号',
  `agent_grade` smallint(6) NULL DEFAULT NULL COMMENT '代理等级',
  `sub_agent_count` bigint(20) NULL DEFAULT 0 COMMENT '下级代理数数',
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
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first_deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '首存金额',
  `first_deposit_numbers` bigint(20) NULL DEFAULT 0 COMMENT '首存人数',
  `agent_user_path_index` bigint(20) NULL DEFAULT 0 COMMENT '代理路径索引位置',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号状态',
  `deposit_order_count` bigint(20) NULL DEFAULT 0 COMMENT '存款笔数',
  `withdraw_order_count` bigint(20) NULL DEFAULT 0 COMMENT '提款笔数',
  `bet_order_count` bigint(20) NULL DEFAULT 0 COMMENT '投注笔数',
  `total_discount_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '总优惠金额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_report_date_user_name`(`agent` ASC) USING BTREE,
  INDEX `index_agent`(`agent` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 246059466 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理总报表-全量表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_general_report_daily
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_general_report_daily`;
CREATE TABLE `tb_agent_general_report_daily`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `report_date` date NOT NULL COMMENT '数据日期yyyy-MM-dd',
  `agent_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理类型：TOP-总代；COMMON-一般代理',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理账号',
  `agent_grade` smallint(6) NULL DEFAULT NULL COMMENT '代理等级',
  `sub_agent_count` bigint(20) NULL DEFAULT 0 COMMENT '下级代理数数',
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
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first_deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '首存金额',
  `first_deposit_numbers` bigint(20) NULL DEFAULT 0 COMMENT '首存人数',
  `agent_user_path_index` bigint(20) NULL DEFAULT 0 COMMENT '代理路径索引位置',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号状态',
  `deposit_order_count` bigint(20) NULL DEFAULT 0 COMMENT '存款笔数',
  `withdraw_order_count` bigint(20) NULL DEFAULT 0 COMMENT '提款笔数',
  `bet_order_count` bigint(20) NULL DEFAULT 0 COMMENT '投注笔数',
  `total_discount_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '总优惠金额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_report_date_user_name`(`report_date` ASC, `agent` ASC) USING BTREE,
  INDEX `index_report_date`(`report_date` ASC) USING BTREE,
  INDEX `index_agent`(`agent` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 252620413 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理总报表-日表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_general_report_month
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_general_report_month`;
CREATE TABLE `tb_agent_general_report_month`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `report_date` date NOT NULL COMMENT '数据日期yyyy-MM-dd(月表日期为每月的首日)',
  `agent_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理类型：TOP-总代；COMMON-一般代理',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理账号',
  `agent_grade` smallint(6) NULL DEFAULT NULL COMMENT '代理等级',
  `sub_agent_count` bigint(20) NULL DEFAULT 0 COMMENT '下级代理数数',
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
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first_deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '首存金额',
  `first_deposit_numbers` bigint(20) NULL DEFAULT 0 COMMENT '首存人数',
  `agent_user_path_index` bigint(20) NULL DEFAULT 0 COMMENT '代理路径索引位置',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号状态',
  `deposit_order_count` bigint(20) NULL DEFAULT 0 COMMENT '存款笔数',
  `withdraw_order_count` bigint(20) NULL DEFAULT 0 COMMENT '提款笔数',
  `bet_order_count` bigint(20) NULL DEFAULT 0 COMMENT '投注笔数',
  `total_discount_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '总优惠金额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_report_date_user_name`(`report_date` ASC, `agent` ASC) USING BTREE,
  INDEX `index_report_date`(`report_date` ASC) USING BTREE,
  INDEX `index_agent`(`agent` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 248045192 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理总报表-月表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_member_details
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_member_details`;
CREATE TABLE `tb_agent_member_details`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `report_date` date NOT NULL COMMENT '数据日期yyyy-MM-dd',
  `agent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理账号',
  `parent_agent_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级代理',
  `agent_user_path_index` bigint(20) NOT NULL COMMENT '代理路径索引位置',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `member_type` bigint(20) NOT NULL COMMENT '人数类别：1存款人数、2活跃人数、3提款人数、4领取人数、5投注人数',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_raaa_key`(`report_date` ASC, `agent` ASC, `agent_user_path_index` ASC, `account` ASC, `member_type` ASC) USING BTREE,
  INDEX `index_report_date`(`report_date` ASC) USING BTREE,
  INDEX `index_agent`(`agent` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51774895 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理总报表-日表-人数明细' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_number_of_member
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_number_of_member`;
CREATE TABLE `tb_agent_number_of_member`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `report_date` date NOT NULL COMMENT '数据日期yyyy-MM-dd',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `deposit_users` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `active_users` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `withdraw_users` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `bonus_receive_users` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `bet_users` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_report_date_user_name`(`report_date` ASC, `agent` ASC) USING BTREE,
  INDEX `index_report_date`(`report_date` ASC) USING BTREE,
  INDEX `index_agent`(`agent` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78429519 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理总报表-日表-人数数据集' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_basic_activity_count_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_basic_activity_count_daily_report`;
CREATE TABLE `tb_basic_activity_count_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_date` date NOT NULL COMMENT '报表日期',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `send_amount` decimal(20, 2) NOT NULL COMMENT '红利发送金额，单位为分',
  `claim_amount` decimal(20, 2) NOT NULL COMMENT '红利领取金额，单位为分',
  `unclaimed_amount` decimal(20, 2) NOT NULL COMMENT '红利未领取金额，单位为分',
  `expired_amount` decimal(20, 2) NOT NULL COMMENT '红利过期金额，单位为分',
  `blocked_amount` decimal(20, 2) NOT NULL COMMENT '红利拦截金额，单位为分',
  `reject_amount` decimal(20, 2) NOT NULL COMMENT '红利拒绝金额，单位为分',
  `send_count` bigint(20) NULL DEFAULT NULL COMMENT '红利发送次数',
  `claim_count` bigint(20) NULL DEFAULT NULL COMMENT '红利领取次数',
  `unclaimed_count` bigint(20) NULL DEFAULT NULL COMMENT '红利未领取次数',
  `expired_count` bigint(20) NULL DEFAULT NULL COMMENT '红利过期次数',
  `blocked_count` bigint(20) NULL DEFAULT NULL COMMENT '红利拦截次数',
  `reject_count` bigint(20) NULL DEFAULT NULL COMMENT '红利拒绝次数',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 97015 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员维度 -- 活动红利每日汇总' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_basic_activity_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_basic_activity_daily_report`;
CREATE TABLE `tb_basic_activity_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `report_date` date NOT NULL COMMENT '报表日期',
  `uid` bigint(20) NOT NULL COMMENT '用户uid',
  `account` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理商编码',
  `send_count` bigint(20) NOT NULL COMMENT '红利发送次数',
  `send_amount` decimal(20, 2) NOT NULL COMMENT '红利发送金额，单位为分',
  `claim_count` bigint(20) NOT NULL COMMENT '红利领取次数',
  `claim_amount` decimal(20, 2) NOT NULL COMMENT '红利领取金额，单位为分',
  `unclaimed_count` bigint(20) NOT NULL COMMENT '红利未领取次数',
  `unclaimed_amount` decimal(20, 2) NOT NULL COMMENT '红利未领取金额，单位为分',
  `expired_count` bigint(20) NOT NULL COMMENT '红利过期次数',
  `expired_amount` decimal(20, 2) NOT NULL COMMENT '红利过期金额，单位为分',
  `blocked_count` bigint(20) NOT NULL COMMENT '红利拦截次数',
  `blocked_amount` decimal(20, 2) NOT NULL COMMENT '红利拦截金额，单位为分',
  `reject_count` bigint(20) NOT NULL COMMENT '红利拒绝次数',
  `reject_amount` decimal(20, 2) NOT NULL COMMENT '红利拒绝金额，单位为分',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 799131 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员维度 -- 活动红利基础统计表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_basic_agent_union_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_basic_agent_union_report`;
CREATE TABLE `tb_basic_agent_union_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `agent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理账号',
  `parent_agent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级代理',
  `sum_date` date NOT NULL COMMENT '统计日期',
  `sub_agent_count` bigint(20) NULL DEFAULT 0 COMMENT '下级代理数',
  `grade_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理等级',
  `register_count` bigint(20) NULL DEFAULT 0 COMMENT '注册人数',
  `first_deposit_count` bigint(20) NULL DEFAULT 0 COMMENT '首存人数',
  `active_user_count` bigint(20) NULL DEFAULT 0 COMMENT '活跃人数',
  `deposit_user_count` bigint(20) NULL DEFAULT 0 COMMENT '存款人数',
  `withdraw_user_count` bigint(20) NULL DEFAULT 0 COMMENT '提款人数',
  `bet_user_count` bigint(20) NULL DEFAULT 0 COMMENT '投注人数',
  `bonus_receive_user_count` bigint(20) NULL DEFAULT 0 COMMENT '优惠领取人数',
  `total_deposit_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '总存款金额',
  `total_withdraw_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '总提款金额',
  `total_bet_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '总投注金额',
  `total_valid_bet_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '总有效投注金额',
  `total_win_lose_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '总输赢金额',
  `total_bonus_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '总红利金额',
  `total_welfare_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '总福利金额',
  `total_rebate_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '总返水金额',
  `total_manual_adjust_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '总人工调整金额',
  `disbursed_commission_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '已派发佣金金额',
  `register_rate` decimal(10, 4) NULL DEFAULT 0.0000 COMMENT '注册转化率',
  `deposit_rate` decimal(10, 4) NULL DEFAULT 0.0000 COMMENT '存投比',
  `withdraw_rate` decimal(10, 4) NULL DEFAULT 0.0000 COMMENT '提存比',
  `bonus_rate` decimal(10, 4) NULL DEFAULT 0.0000 COMMENT '优惠率',
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_agent_date`(`agent` ASC, `sum_date` ASC) USING BTREE,
  INDEX `idx_agent_date`(`agent` ASC, `sum_date` ASC) USING BTREE,
  INDEX `idx_parent_agent_date`(`parent_agent` ASC, `sum_date` ASC) USING BTREE,
  INDEX `idx_update_time`(`update_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理汇总统计表（5分钟更新）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_basic_manual_adjust_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_basic_manual_adjust_daily_report`;
CREATE TABLE `tb_basic_manual_adjust_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sum_date` date NULL DEFAULT NULL COMMENT '日期:yyyy-MM-dd',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `add_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '人工加额总金额',
  `sub_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '人工减额总金额',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4508 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '人工加额日统计表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_basic_member_behavior_tag_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_basic_member_behavior_tag_report`;
CREATE TABLE `tb_basic_member_behavior_tag_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sum_date` date NULL DEFAULT NULL COMMENT '日期',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT 'uid',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账户',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账户',
  `is_active_member` int(11) NULL DEFAULT NULL COMMENT '是否活跃会员, false 0-否，true 1-是',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33753 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员日维度行为标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_basic_member_bonus_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_basic_member_bonus_daily_report`;
CREATE TABLE `tb_basic_member_bonus_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增ID',
  `sum_date` date NULL DEFAULT NULL COMMENT '报表日期',
  `uid` bigint(20) NOT NULL COMMENT '用户ID',
  `account` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `agent` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级代理账号',
  `bonus_display_send_count` bigint(20) NULL DEFAULT NULL COMMENT '纯展示活动发送个数',
  `bonus_display_receive_count` bigint(20) NULL DEFAULT NULL COMMENT '纯展示活动领取个数',
  `bonus_display_unclaimed_count` bigint(20) NULL DEFAULT NULL COMMENT '纯展示活动未领取个数',
  `bonus_display_expired_count` bigint(20) NULL DEFAULT NULL COMMENT '纯展示活动过期个数',
  `bonus_display_blocked_count` bigint(20) NULL DEFAULT NULL COMMENT '纯展示活动拦截个数',
  `bonus_display_reject_count` bigint(20) NULL DEFAULT NULL COMMENT '纯展示活动拒绝个数',
  `bonus_display_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '纯展示活动发放金额',
  `bonus_display_receive_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '纯展示活动领取金额',
  `bonus_deposit_send_count` bigint(20) NULL DEFAULT NULL COMMENT '存款活动发送个数',
  `bonus_deposit_receive_count` bigint(20) NULL DEFAULT NULL COMMENT '存款活动领取个数',
  `bonus_deposit_unclaimed_count` bigint(20) NULL DEFAULT NULL COMMENT '存款活动未领取个数',
  `bonus_deposit_expired_count` bigint(20) NULL DEFAULT NULL COMMENT '存款活动过期个数',
  `bonus_deposit_blocked_count` bigint(20) NULL DEFAULT NULL COMMENT '存款活动拦截个数',
  `bonus_deposit_reject_count` bigint(20) NULL DEFAULT NULL COMMENT '存款活动拒绝个数',
  `bonus_deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款活动发放金额',
  `bonus_deposit_receive_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款活动领取金额',
  `bonus_bet_send_count` bigint(20) NULL DEFAULT NULL COMMENT '打码活动发送个数',
  `bonus_bet_receive_count` bigint(20) NULL DEFAULT NULL COMMENT '打码活动领取个数',
  `bonus_bet_unclaimed_count` bigint(20) NULL DEFAULT NULL COMMENT '打码活动未领取个数',
  `bonus_bet_expired_count` bigint(20) NULL DEFAULT NULL COMMENT '打码活动过期个数',
  `bonus_bet_blocked_count` bigint(20) NULL DEFAULT NULL COMMENT '打码活动拦截个数',
  `bonus_bet_reject_count` bigint(20) NULL DEFAULT NULL COMMENT '打码活动拒绝个数',
  `bonus_bet_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '打码活动发放金额',
  `bonus_bet_receive_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '打码活动领取金额',
  `bonus_rescue_send_count` bigint(20) NULL DEFAULT NULL COMMENT '救援金活动发送个数',
  `bonus_rescue_receive_count` bigint(20) NULL DEFAULT NULL COMMENT '救援金活动领取个数',
  `bonus_rescue_unclaimed_count` bigint(20) NULL DEFAULT NULL COMMENT '救援金活动未领取个数',
  `bonus_rescue_expired_count` bigint(20) NULL DEFAULT NULL COMMENT '救援金活动过期个数',
  `bonus_rescue_blocked_count` bigint(20) NULL DEFAULT NULL COMMENT '救援金活动拦截个数',
  `bonus_rescue_reject_count` bigint(20) NULL DEFAULT NULL COMMENT '救援金活动拒绝个数',
  `bonus_rescue_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '救援金活动发放金额',
  `bonus_rescue_receive_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '救援金活动领取金额',
  `bonus_redpacket_send_count` bigint(20) NULL DEFAULT NULL COMMENT '红包活动发送个数',
  `bonus_redpacket_receive_count` bigint(20) NULL DEFAULT NULL COMMENT '红包活动领取个数',
  `bonus_redpacket_unclaimed_count` bigint(20) NULL DEFAULT NULL COMMENT '红包活动未领取个数',
  `bonus_redpacket_expired_count` bigint(20) NULL DEFAULT NULL COMMENT '红包活动过期个数',
  `bonus_redpacket_blocked_count` bigint(20) NULL DEFAULT NULL COMMENT '红包活动拦截个数',
  `bonus_redpacket_reject_count` bigint(20) NULL DEFAULT NULL COMMENT '红包活动拒绝个数',
  `bonus_redpacket_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '红包活动发放金额',
  `bonus_redpacket_receive_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '红包活动领取金额',
  `bonus_signin_send_count` bigint(20) NULL DEFAULT NULL COMMENT '签到活动发送个数',
  `bonus_signin_receive_count` bigint(20) NULL DEFAULT NULL COMMENT '签到活动领取个数',
  `bonus_signin_unclaimed_count` bigint(20) NULL DEFAULT NULL COMMENT '签到活动未领取个数',
  `bonus_signin_expired_count` bigint(20) NULL DEFAULT NULL COMMENT '签到活动过期个数',
  `bonus_signin_blocked_count` bigint(20) NULL DEFAULT NULL COMMENT '签到活动拦截个数',
  `bonus_signin_reject_count` bigint(20) NULL DEFAULT NULL COMMENT '签到活动拒绝个数',
  `bonus_signin_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '签到活动发放金额',
  `bonus_signin_receive_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '签到活动领取金额',
  `bonus_wheel_send_count` bigint(20) NULL DEFAULT NULL COMMENT '转盘活动发送个数',
  `bonus_wheel_receive_count` bigint(20) NULL DEFAULT NULL COMMENT '转盘活动领取个数',
  `bonus_wheel_unclaimed_count` bigint(20) NULL DEFAULT NULL COMMENT '转盘活动未领取个数',
  `bonus_wheel_expired_count` bigint(20) NULL DEFAULT NULL COMMENT '转盘活动过期个数',
  `bonus_wheel_blocked_count` bigint(20) NULL DEFAULT NULL COMMENT '转盘活动拦截个数',
  `bonus_wheel_reject_count` bigint(20) NULL DEFAULT NULL COMMENT '转盘活动拒绝个数',
  `bonus_wheel_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '转盘活动发放金额',
  `bonus_wheel_receive_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '转盘活动领取金额',
  `total_send_count` bigint(20) NULL DEFAULT NULL COMMENT '总发送个数',
  `total_receive_count` bigint(20) NULL DEFAULT NULL COMMENT '总领取个数',
  `total_unclaimed_count` bigint(20) NULL DEFAULT NULL COMMENT '总未领取个数',
  `total_expired_count` bigint(20) NULL DEFAULT NULL COMMENT '总过期个数',
  `total_blocked_count` bigint(20) NULL DEFAULT NULL COMMENT '总拦截个数',
  `total_reject_count` bigint(20) NULL DEFAULT NULL COMMENT '总拒绝个数',
  `total_grant_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '总发放金额',
  `total_receive_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '总领取金额',
  `total_unclaimed_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '总未领取金额',
  `total_expired_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '总过期金额',
  `total_blocked_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '总拦截金额',
  `total_reject_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '总拒绝金额',
  `total_bonus_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '总红利金额',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tb_basic_member_bonus_daily_report_sum_date_IDX`(`sum_date` ASC, `uid` ASC) USING BTREE,
  INDEX `idx_account`(`account` ASC) USING BTREE,
  INDEX `idx_agent`(`agent` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1284421 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员维度红利每日统计报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_basic_member_deposit_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_basic_member_deposit_daily_report`;
CREATE TABLE `tb_basic_member_deposit_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sum_date` date NULL DEFAULT NULL COMMENT '日期:yyyy-MM-dd',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `payment_method` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款总金额（取确认金额）',
  `max_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '最大存款额',
  `number` int(11) NULL DEFAULT NULL COMMENT '存款次数',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27817 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员存款日统计表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_basic_member_fund_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_basic_member_fund_daily_report`;
CREATE TABLE `tb_basic_member_fund_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增ID',
  `uid` bigint(20) NOT NULL COMMENT '用户ID',
  `account` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `agent` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级代理账号',
  `sum_date` date NOT NULL COMMENT '报表日期',
  `deposit_number` bigint(20) NULL DEFAULT NULL COMMENT '存款笔数',
  `deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款金额',
  `withdraw_number` bigint(20) NULL DEFAULT NULL COMMENT '提款笔数',
  `withdraw_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '提款金额',
  `deposit_withdraw_diff_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存提差额',
  `manual_add_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '人工加额',
  `manual_sub_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '人工减额',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `transfer_to_venue_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '转入场馆金额',
  `transfer_from_venue_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '转出场馆金额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unq.member_fund_daily_report.sum_date_uid`(`uid` ASC, `sum_date` ASC) USING BTREE,
  INDEX `idx_member_fund_daily_report.account`(`account` ASC, `agent` ASC) USING BTREE,
  INDEX `idx_member_fund_daily_report.sum_date`(`sum_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18374948 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员维度资金日统计表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_basic_member_game_day_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_basic_member_game_day_report`;
CREATE TABLE `tb_basic_member_game_day_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sum_date` date NOT NULL COMMENT '统计日（yyyy-MM-dd)',
  `uid` bigint(20) NOT NULL COMMENT '会员uid',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `game_id` bigint(20) NULL DEFAULT NULL COMMENT '游戏id',
  `game_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏名称',
  `game_category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏品类code',
  `venue_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆code',
  `venue_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆名称',
  `gp_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏供应商code',
  `bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '投注金额',
  `valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '打码(二次计算有效投注金额)',
  `win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '会员输赢',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `bet_order_num` bigint(20) NULL DEFAULT NULL COMMENT '游戏的注单数量',
  `positive_win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '正数输赢金额（会员赢钱部分）',
  `negative_win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '负数输赢金额（会员输钱部分）',
  `payout_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '派彩金额',
  `gp_valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '厂商有效投注金额',
  `total_day_multiple` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '游戏每日倍数派彩金额 / 厂商有效投注总额 (保留两位小数，体育电竞彩票品类不算，为0)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_sum_date_account`(`sum_date` ASC, `account` ASC, `game_id` ASC, `game_category_code` ASC, `venue_code` ASC) USING BTREE,
  INDEX `idx_uid_sumdate_betamount`(`uid` ASC, `sum_date` ASC, `bet_amount` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2590830 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 会员维度游戏场馆日报表（5分钟更新一次，统计已结算数据）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_basic_member_game_day_report_cancel
-- ----------------------------
DROP TABLE IF EXISTS `tb_basic_member_game_day_report_cancel`;
CREATE TABLE `tb_basic_member_game_day_report_cancel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sum_date` date NOT NULL COMMENT '统计日（yyyy-MM-dd)',
  `uid` bigint(20) NOT NULL COMMENT '会员uid',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `game_id` bigint(20) NULL DEFAULT NULL COMMENT '游戏id',
  `game_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏名称',
  `game_category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏品类code',
  `venue_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆code',
  `venue_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆名称',
  `gp_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏供应商code',
  `order_status` tinyint(3) NULL DEFAULT NULL COMMENT '注单订单状态:1-已结算,2-已取消',
  `bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '投注金额',
  `valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '打码(二次计算有效投注金额)',
  `win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '会员输赢',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `bet_order_num` bigint(20) NULL DEFAULT NULL COMMENT '游戏的注单数量',
  `positive_win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '正数输赢金额（会员赢钱部分）',
  `negative_win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '负数输赢金额（会员输钱部分）',
  `payout_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '派彩金额',
  `gp_valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '厂商有效投注金额',
  `total_day_multiple` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '游戏每日倍数派彩金额 / 厂商有效投注总额 (保留两位小数，体育电竞彩票品类不算，为0)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_sum_date_account`(`sum_date` ASC, `account` ASC, `game_id` ASC, `game_category_code` ASC, `venue_code` ASC, `order_status` ASC) USING BTREE,
  INDEX `idx_uid_order_status_sum_date`(`uid` ASC, `order_status` ASC, `sum_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14510348 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员维度游戏场馆日报表（5分钟更新一次，统计已结算已取消数据）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_basic_member_game_day_report_unsettled
-- ----------------------------
DROP TABLE IF EXISTS `tb_basic_member_game_day_report_unsettled`;
CREATE TABLE `tb_basic_member_game_day_report_unsettled`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sum_date` date NOT NULL COMMENT '统计日（yyyy-MM-dd)',
  `uid` bigint(20) NOT NULL COMMENT '会员uid',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `game_id` bigint(20) NULL DEFAULT NULL COMMENT '游戏id',
  `game_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏名称',
  `game_category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏品类code',
  `venue_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆code',
  `venue_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆名称',
  `gp_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏供应商code',
  `bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '投注金额',
  `valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '打码(二次计算有效投注金额)',
  `win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '会员输赢',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `bet_order_num` bigint(20) NULL DEFAULT NULL COMMENT '游戏的注单数量',
  `positive_win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '正数输赢金额（会员赢钱部分）',
  `negative_win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '负数输赢金额（会员输钱部分）',
  `payout_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '派彩金额',
  `gp_valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '厂商有效投注金额',
  `total_day_multiple` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '游戏每日倍数派彩金额 / 厂商有效投注总额 (保留两位小数，体育电竞彩票品类不算，为0)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_sum_date_account`(`sum_date` ASC, `account` ASC, `game_id` ASC, `game_category_code` ASC, `venue_code` ASC) USING BTREE,
  INDEX `idx_uid_sum_date`(`uid` ASC, `sum_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 531251 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员维度游戏场馆日报表（5分钟更新一次，统计未结算数据）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_basic_member_game_order_day_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_basic_member_game_order_day_report`;
CREATE TABLE `tb_basic_member_game_order_day_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sum_date` date NOT NULL COMMENT '统计日（yyyy-MM-dd)',
  `uid` bigint(20) NOT NULL COMMENT '会员uid',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `game_id` bigint(20) NULL DEFAULT NULL COMMENT '游戏id',
  `game_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏名称',
  `game_category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏品类code',
  `venue_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆code',
  `venue_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆名称',
  `gp_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏供应商code',
  `bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '投注金额',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `bet_order_num` bigint(20) NULL DEFAULT NULL COMMENT '游戏的注单数量',
  `unsettled_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '正数输赢金额（会员赢钱部分）',
  `exception_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '负数输赢金额（会员输钱部分）',
  `valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '打码(二次计算有效投注金额)',
  `win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '会员输赢',
  `payout_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '派彩金额',
  `gp_valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '厂商有效投注金额',
  `total_day_multiple` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '游戏每日倍数派彩金额 / 厂商有效投注总额 (保留两位小数，体育电竞彩票品类不算，为0)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_sum_date_account`(`sum_date` ASC, `account` ASC, `game_id` ASC, `game_category_code` ASC, `venue_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16787094 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员注单时间维度注单日报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_basic_member_welfare_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_basic_member_welfare_daily_report`;
CREATE TABLE `tb_basic_member_welfare_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增ID',
  `uid` bigint(20) NOT NULL COMMENT '用户ID',
  `account` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账户',
  `agent` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级代理账号',
  `sum_date` date NOT NULL COMMENT '报表日期',
  `welfare_upgrade_receive_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '升级礼金领取金额',
  `welfare_birthday_receive_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '生日礼金领取金额',
  `welfare_monthly_receive_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '每月分红领取金额',
  `welfare_half_month_receive_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '半月分红领取金额',
  `welfare_subtotal_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '福利小计金额',
  `welfare_deposit_cashback_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '存款返现金额',
  `welfare_withdraw_cashback_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '提款返现金额',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sum_date`(`sum_date` ASC) USING BTREE,
  INDEX `idx_account`(`account` ASC) USING BTREE,
  INDEX `idx_agent`(`agent` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103449 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员福利日统计报表（会员等级福利、存款返现）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_basic_member_withdrawal_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_basic_member_withdrawal_daily_report`;
CREATE TABLE `tb_basic_member_withdrawal_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sum_date` date NULL DEFAULT NULL COMMENT '日期:yyyy-MM-dd',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `payment_method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '取款总金额',
  `number` int(11) NULL DEFAULT NULL COMMENT '取款总次数',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sum_date`(`sum_date` ASC) USING BTREE,
  INDEX `idx_account`(`account` ASC) USING BTREE,
  INDEX `idx_agent`(`agent` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25165 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员取款日统计' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_bonus_summary_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_bonus_summary_daily_report`;
CREATE TABLE `tb_bonus_summary_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增ID',
  `sum_date` date NULL DEFAULT NULL COMMENT '报表日期',
  `total_send_count` bigint(20) NULL DEFAULT NULL COMMENT '红利发放人次',
  `total_receive_count` bigint(20) NULL DEFAULT NULL COMMENT '红利领取人次',
  `total_unclaimed_count` bigint(20) NULL DEFAULT NULL COMMENT '红利未领人次',
  `total_expired_count` bigint(20) NULL DEFAULT NULL COMMENT '红利过期人次',
  `total_blocked_count` bigint(20) NULL DEFAULT NULL COMMENT '红利拦截人次',
  `total_reject_count` bigint(20) NULL DEFAULT NULL COMMENT '红利拒绝人次',
  `total_grant_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '红利发放总额',
  `total_receive_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '红利领取总额',
  `total_unclaimed_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '红利未领总额',
  `total_expired_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '红利过期总额',
  `total_blocked_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '红利拦截总额',
  `total_reject_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '红利拒绝总额',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tb_bonus_summary_daily_report_sum_date_IDX`(`sum_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员红利汇总统计报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_dashboard_stats_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_dashboard_stats_daily_report`;
CREATE TABLE `tb_dashboard_stats_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sum_date` date NOT NULL COMMENT '统计日期',
  `today_new_member_count` int(11) NULL DEFAULT 0 COMMENT '今日新增会员人数',
  `today_new_first_deposit_member_count` int(11) NULL DEFAULT 0 COMMENT '新增首存会员人数',
  `today_new_agent_count` int(11) NULL DEFAULT 0 COMMENT '新增代理人数',
  `total_member_count` int(11) NULL DEFAULT 0 COMMENT '累计会员人数',
  `total_first_deposit_member_count` int(11) NULL DEFAULT 0 COMMENT '累计首存会员人数',
  `total_agent_count` int(11) NULL DEFAULT 0 COMMENT '累计代理人数',
  `active_member_count` int(11) NULL DEFAULT 0 COMMENT '活跃会员人数',
  `today_member_balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '今日会员余额',
  `today_bonus_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '今日发放优惠',
  `today_bonus_receiver_count` int(11) NULL DEFAULT 0 COMMENT '今日领取人数',
  `today_activity_count` int(11) NULL DEFAULT 0 COMMENT '今日活动个数',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_sum_date`(`sum_date` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 145 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '仪表盘统计日报表（精简版）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_dwm_agent_dimension_details
-- ----------------------------
DROP TABLE IF EXISTS `tb_dwm_agent_dimension_details`;
CREATE TABLE `tb_dwm_agent_dimension_details`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `report_date` date NOT NULL COMMENT '数据日期yyyy-MM-dd',
  `agent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理账号',
  `parent_agent_user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级代理',
  `agent_user_path_index` bigint(20) NOT NULL COMMENT '代理路径索引位置',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `member_type` bigint(20) NOT NULL COMMENT '人数类别：1存款人数、2活跃人数、3提款人数、4领取人数、5投注人数',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_raaa_key`(`report_date` ASC, `agent` ASC, `agent_user_path_index` ASC, `account` ASC, `member_type` ASC) USING BTREE,
  INDEX `index_report_date`(`report_date` ASC) USING BTREE,
  INDEX `index_agent`(`agent` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 47731339 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '单层级代理总报表-日表-人数明细' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_dwm_agent_dimension_statistics
-- ----------------------------
DROP TABLE IF EXISTS `tb_dwm_agent_dimension_statistics`;
CREATE TABLE `tb_dwm_agent_dimension_statistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `report_date` date NOT NULL COMMENT '数据日期yyyy-MM-dd',
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
  UNIQUE INDEX `unique_report_date_agent`(`report_date` ASC, `agent` ASC) USING BTREE,
  INDEX `index_report_date`(`report_date` ASC) USING BTREE,
  INDEX `index_agent`(`agent` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 221763615 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理单层级报表-日表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 218328807 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理单层级报表-全量表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_dwm_dimension_statistics
-- ----------------------------
DROP TABLE IF EXISTS `tb_dwm_dimension_statistics`;
CREATE TABLE `tb_dwm_dimension_statistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_date` date NOT NULL COMMENT '数据日期yyyyMMdd',
  `net_profit_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '盈亏',
  `win_lose_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '玩家输赢金额/净输赢（有负数）',
  `calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '打码(二次计算有效投注金额)',
  `deposit_members` bigint(20) NULL DEFAULT NULL COMMENT '存款人数',
  `deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款金额',
  `deposit_number` bigint(20) NULL DEFAULT NULL COMMENT '存款笔数',
  `withdraw_members` bigint(20) NULL DEFAULT NULL COMMENT '提款人数',
  `withdraw_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '提款金额',
  `withdraw_number` bigint(20) NULL DEFAULT NULL COMMENT '提款笔数',
  `deposit_withdraw_diff_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存提差额',
  `manual_add_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '人工加额',
  `manual_sub_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '人工减额',
  `bonus_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '红利金额',
  `welfare_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '福利金额',
  `rebate_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '返水金额',
  `bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '投注金额',
  `payout_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '总中奖(总派彩额)',
  `bet_members` bigint(20) NULL DEFAULT NULL COMMENT '投注人数',
  `bet_number` bigint(20) NULL DEFAULT NULL COMMENT '注单笔数',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_report_date`(`report_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2739 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员汇总日维度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_dwm_dimension_statistics_member_game
-- ----------------------------
DROP TABLE IF EXISTS `tb_dwm_dimension_statistics_member_game`;
CREATE TABLE `tb_dwm_dimension_statistics_member_game`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sum_date` date NOT NULL COMMENT '统计日（yyyy-MM-dd)',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `game_id` bigint(20) NOT NULL COMMENT '游戏id',
  `game_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏名称',
  `bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '投注金额(以bet_time时间判定)',
  `bet_order_num` bigint(20) NULL DEFAULT NULL COMMENT '游戏的注单数量(以bet_time时间判定)',
  `unsettled_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '总未结算注单金额(以bet_time时间判定)',
  `exception_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '异常注单金额(以bet_time时间判定)',
  `payout_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '派彩金额(以bet_time时间判定)',
  `gp_valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '厂商有效投注金额(以bet_time时间判定)',
  `total_day_multiple` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '游戏每日倍数派彩金额 / 厂商有效投注总额(以bet_time时间判定)',
  `valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '有效投注金额（同打码量）(以settle_time时间判定)',
  `win_lose_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '输赢金额(以settle_time时间判定)',
  `positive_win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '正数输赢金额（会员赢钱部分）(以settle_time时间判定)',
  `negative_win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '负数输赢金额（会员输钱部分）(以settle_time时间判定)',
  `settlement_payout_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '派彩金额(以settle_time时间判定)',
  `settlement_gp_valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '厂商有效投注金额(以settle_time时间判定)',
  `settlement_total_day_multiple` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '游戏每日倍数派彩金额 / 厂商有效投注总额(以settle_time时间判定)',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_saggvg`(`sum_date` ASC, `account` ASC, `game_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3834441972 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 (游戏+会员)日维度统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_dwm_member_category_dimension_statistics
-- ----------------------------
DROP TABLE IF EXISTS `tb_dwm_member_category_dimension_statistics`;
CREATE TABLE `tb_dwm_member_category_dimension_statistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sum_date` date NOT NULL COMMENT '统计日（yyyy-MM-dd)',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `game_category_code` tinyint(3) NOT NULL COMMENT '品类 1:SPORTS-体育 2:SLOT-老虎机 3:LIVE-真人 4:POKER-棋牌 5:FISHING-捕鱼,6:ESPORTS-电竞,7:LOTTERY-彩票,8:ANIMAL-斗鸡',
  `bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '投注金额(以bet_time时间判定)',
  `bet_order_num` bigint(20) NULL DEFAULT NULL COMMENT '游戏的注单数量(以bet_time时间判定)',
  `unsettled_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '总未结算注单金额(以bet_time时间判定)',
  `exception_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '异常注单金额(以bet_time时间判定)',
  `payout_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '派彩金额(以bet_time时间判定)',
  `gp_valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '厂商有效投注金额(以bet_time时间判定)',
  `total_day_multiple` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '游戏每日倍数派彩金额 / 厂商有效投注总额(以bet_time时间判定)',
  `valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '有效投注金额（同打码量）(以settle_time时间判定)',
  `win_lose_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '输赢金额(以settle_time时间判定)',
  `positive_win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '正数输赢金额（会员赢钱部分）(以settle_time时间判定)',
  `negative_win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '负数输赢金额（会员输钱部分）(以settle_time时间判定)',
  `settlement_payout_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '派彩金额(以settle_time时间判定)',
  `settlement_gp_valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '厂商有效投注金额(以settle_time时间判定)',
  `settlement_total_day_multiple` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '游戏每日倍数派彩金额 / 厂商有效投注总额(以settle_time时间判定)',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_sagvg`(`sum_date` ASC, `account` ASC, `game_category_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3834412059 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 (类别+会员)日维度统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_dwm_member_game_dimension_statistics
-- ----------------------------
DROP TABLE IF EXISTS `tb_dwm_member_game_dimension_statistics`;
CREATE TABLE `tb_dwm_member_game_dimension_statistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sum_date` date NOT NULL COMMENT '统计日（yyyy-MM-dd)',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `game_category_code` tinyint(3) NOT NULL COMMENT '品类 1:SPORTS-体育 2:SLOT-老虎机 3:LIVE-真人 4:POKER-棋牌 5:FISHING-捕鱼,6:ESPORTS-电竞,7:LOTTERY-彩票,8:ANIMAL-斗鸡',
  `venue_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '场馆code',
  `venue_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆名称',
  `game_id` bigint(20) NOT NULL COMMENT '游戏id',
  `game_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏名称',
  `gp_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏厂商code',
  `bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '投注金额(以bet_time时间判定)',
  `bet_order_num` bigint(20) NULL DEFAULT NULL COMMENT '游戏的注单数量(以bet_time时间判定)',
  `unsettled_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '总未结算注单金额(以bet_time时间判定)',
  `exception_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '异常注单金额(以bet_time时间判定)',
  `payout_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '派彩金额(以bet_time时间判定)',
  `gp_valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '厂商有效投注金额(以bet_time时间判定)',
  `total_day_multiple` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '游戏每日倍数派彩金额 / 厂商有效投注总额(以bet_time时间判定)',
  `valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '有效投注金额（同打码量）(以settle_time时间判定)',
  `win_lose_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '输赢金额(以settle_time时间判定)',
  `positive_win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '正数输赢金额（会员赢钱部分）(以settle_time时间判定)',
  `negative_win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '负数输赢金额（会员输钱部分）(以settle_time时间判定)',
  `settlement_payout_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '派彩金额(以settle_time时间判定)',
  `settlement_gp_valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '厂商有效投注金额(以settle_time时间判定)',
  `settlement_total_day_multiple` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '游戏每日倍数派彩金额 / 厂商有效投注总额(以settle_time时间判定)',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_sagvg`(`sum_date` ASC, `account` ASC, `game_category_code` ASC, `venue_code` ASC, `game_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3834444783 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 (类别+场馆+游戏+会员)日维度统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_dwm_member_gp_category_venue_game_dimension_statistics
-- ----------------------------
DROP TABLE IF EXISTS `tb_dwm_member_gp_category_venue_game_dimension_statistics`;
CREATE TABLE `tb_dwm_member_gp_category_venue_game_dimension_statistics`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sum_date` date NOT NULL COMMENT '统计日（yyyy-MM-dd)',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `gp_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '游戏厂商code',
  `game_category_code` tinyint(3) NOT NULL COMMENT '品类 1:SPORTS-体育 2:SLOT-老虎机 3:LIVE-真人 4:POKER-棋牌 5:FISHING-捕鱼,6:ESPORTS-电竞,7:LOTTERY-彩票,8:ANIMAL-斗鸡',
  `venue_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '场馆code',
  `venue_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆名称',
  `game_id` bigint(20) NOT NULL COMMENT '游戏id',
  `game_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏名称',
  `bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '投注金额(以bet_time时间判定)',
  `bet_order_num` bigint(20) NULL DEFAULT NULL COMMENT '游戏的注单数量(以bet_time时间判定)',
  `unsettled_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '总未结算注单金额(以bet_time时间判定)',
  `exception_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '异常注单金额(以bet_time时间判定)',
  `payout_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '派彩金额(以bet_time时间判定)',
  `gp_valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '厂商有效投注金额(以bet_time时间判定)',
  `total_day_multiple` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '游戏每日倍数派彩金额 / 厂商有效投注总额(以bet_time时间判定)',
  `valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '有效投注金额（同打码量）(以settle_time时间判定)',
  `win_lose_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '输赢金额(以settle_time时间判定)',
  `positive_win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '正数输赢金额（会员赢钱部分）(以settle_time时间判定)',
  `negative_win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '负数输赢金额（会员输钱部分）(以settle_time时间判定)',
  `settlement_payout_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '派彩金额(以settle_time时间判定)',
  `settlement_gp_valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '厂商有效投注金额(以settle_time时间判定)',
  `settlement_total_day_multiple` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '游戏每日倍数派彩金额 / 厂商有效投注总额(以settle_time时间判定)',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` bigint(20) NULL DEFAULT 1767196800000 COMMENT '创建时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'system' COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'system' COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_saggvg`(`sum_date` ASC, `account` ASC, `gp_code` ASC, `game_category_code` ASC, `venue_code` ASC, `game_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3834444848 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 (厂商+类别+场馆+游戏+会员)日维度统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_dwm_member_venue_report_daily
-- ----------------------------
DROP TABLE IF EXISTS `tb_dwm_member_venue_report_daily`;
CREATE TABLE `tb_dwm_member_venue_report_daily`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_date` date NOT NULL COMMENT '统计日（yyyy-MM-dd)',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `venue_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '场馆code',
  `venue_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆名称',
  `bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '投注金额(以bet_time时间判定)',
  `bet_order_num` bigint(20) NULL DEFAULT NULL COMMENT '游戏的注单数量(以bet_time时间判定)',
  `unsettled_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '总未结算注单金额(以bet_time时间判定)',
  `exception_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '异常注单金额(以bet_time时间判定)',
  `payout_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '派彩金额(以bet_time时间判定)',
  `gp_valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '厂商有效投注金额(以bet_time时间判定)',
  `total_day_multiple` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '游戏每日倍数派彩金额 / 厂商有效投注总额(以bet_time时间判定)',
  `valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '有效投注金额（同打码量）(以settle_time时间判定)',
  `win_lose_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '输赢金额(以settle_time时间判定)',
  `positive_win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '正数输赢金额（会员赢钱部分）(以settle_time时间判定)',
  `negative_win_lose_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '负数输赢金额（会员输钱部分）(以settle_time时间判定)',
  `settlement_payout_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '派彩金额(以settle_time时间判定)',
  `settlement_gp_valid_bet_amount` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '厂商有效投注金额(以settle_time时间判定)',
  `settlement_total_day_multiple` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '游戏每日倍数派彩金额 / 厂商有效投注总额(以settle_time时间判定)',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_rav`(`report_date` ASC, `account` ASC, `venue_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3834425172 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 (游戏+会员)日维度统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_fund_payment_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_payment_daily_report`;
CREATE TABLE `tb_fund_payment_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sum_date` date NOT NULL COMMENT '日期',
  `fund_payment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资金支付方式代码',
  `fund_payment_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资金支付方式名称',
  `payment_channel_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付渠道代码',
  `payment_channel_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付渠道名称',
  `thirdparty_payment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方支付代码',
  `thirdparty_payment_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '第三方支付名称',
  `order_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单类型(DEPOSIT-存款,WITHDRAW-提款)',
  `order_count` int(11) NOT NULL DEFAULT 0 COMMENT '订单数量',
  `order_amount_total` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '订单总金额',
  `order_fee_total` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '手续费总额',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间戳(毫秒)',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间戳(毫秒)',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_fund_payment_daily_unique`(`sum_date` ASC, `fund_payment_code` ASC, `payment_channel_code` ASC, `thirdparty_payment_code` ASC, `order_type` ASC) USING BTREE,
  INDEX `idx_fund_payment_daily_date`(`sum_date` ASC) USING BTREE,
  INDEX `idx_fund_payment_daily_order_type`(`order_type` ASC) USING BTREE,
  INDEX `idx_fund_payment_daily_payment_code`(`fund_payment_code` ASC) USING BTREE,
  INDEX `idx_fund_payment_daily_channel_code`(`payment_channel_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 812 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付渠道日报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_fund_summary_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_summary_daily_report`;
CREATE TABLE `tb_fund_summary_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增ID',
  `sum_date` date NOT NULL COMMENT '报表日期',
  `deposit_number` bigint(20) NULL DEFAULT NULL COMMENT '存款笔数',
  `deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款金额',
  `withdraw_number` bigint(20) NULL DEFAULT NULL COMMENT '提款笔数',
  `withdraw_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '提款金额',
  `deposit_withdraw_diff_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存提差额',
  `bet_number` bigint(20) NULL DEFAULT NULL COMMENT '投注笔数',
  `bet_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '投注金额',
  `valid_bet_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '有效投注额(同打码量)',
  `rebate_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '返水金额',
  `bonus_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '红利金额',
  `welfare_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '福利金额',
  `manual_add_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '人工加额',
  `manual_sub_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '人工减额',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `deposit_members` bigint(20) NULL DEFAULT NULL COMMENT '存款人数',
  `withdraw_members` bigint(20) NULL DEFAULT NULL COMMENT '提款人数',
  `bet_members` bigint(20) NULL DEFAULT NULL COMMENT '投注人数',
  `win_lose_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '输赢金额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_fund_summary`(`sum_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 884 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员汇总报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_fund_thirdparty_summary_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_fund_thirdparty_summary_daily_report`;
CREATE TABLE `tb_fund_thirdparty_summary_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增ID',
  `sum_date` date NULL DEFAULT NULL COMMENT '报表日期',
  `deposit_number` bigint(20) NULL DEFAULT NULL COMMENT '存款笔数',
  `deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款金额',
  `withdraw_number` bigint(20) NULL DEFAULT NULL COMMENT '提款笔数',
  `withdraw_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '提款金额',
  `deposit_withdraw_diff_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存提差额',
  `deposit_members` bigint(20) NULL DEFAULT NULL COMMENT '存款人数',
  `withdraw_members` bigint(20) NULL DEFAULT NULL COMMENT '提款人数',
  `deposit_platforms` bigint(20) NULL DEFAULT NULL COMMENT '存款平台数',
  `withdraw_platforms` bigint(20) NULL DEFAULT NULL COMMENT '提款平台数',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_fund_summary_date_1`(`sum_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 197 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '第三方存提款汇总报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_game_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_game_daily_report`;
CREATE TABLE `tb_game_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sum_date` date NOT NULL COMMENT '统计日期:yyyy-MM-dd',
  `game_id` bigint(20) NOT NULL COMMENT '游戏ID',
  `game_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '游戏名称',
  `venue_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '场馆code',
  `gp_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏供应商code',
  `game_category_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '游戏分类(品类)code',
  `bet_amount` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '总投注金额（游戏维度统计）',
  `valid_bet_amount` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '总有效投注金额（游戏维度统计）',
  `win_lose_amount` decimal(20, 2) NOT NULL DEFAULT 0.00 COMMENT '总输赢金额（游戏维度统计）',
  `bet_order_num` bigint(20) NULL DEFAULT 0 COMMENT '注单笔数（游戏维度统计）',
  `bet_count` bigint(20) NULL DEFAULT 0 COMMENT '投注人数（游戏维度统计,去重）',
  `unsettled_bet_amount` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '总未结算注单金额（游戏维度统计）',
  `exception_bet_amount` decimal(18, 2) NULL DEFAULT 0.00 COMMENT '异常注单金额（游戏维度统计）',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `venue_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆名称',
  `category_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33369 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '游戏盈亏日报表（每天凌晨更新一次）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_game_venue_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_game_venue_daily_report`;
CREATE TABLE `tb_game_venue_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `sum_date` date NULL DEFAULT NULL COMMENT '报表日期，格式为yyyyMMdd',
  `venue_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '场馆code',
  `venue_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆名称',
  `game_category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏分类code(1:SPORTS-体育 2:SLOT-老虎机 3:LIVE-真人 4:POKER-棋牌 5:FISHING-捕鱼,6:ESPORTS-电竞,7:LOTTERY-彩票,8:ANIMAL-斗鸡)',
  `game_category` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏分类名称',
  `bet_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '总投注金额（场馆维度统计）',
  `valid_bet_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '总有效投注金额（场馆维度统计）',
  `win_lose_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '总会员输赢金额（场馆维度统计）',
  `bet_order_num` bigint(20) NULL DEFAULT 0 COMMENT '注单数量（场馆维度统计）',
  `bet_number` bigint(20) NULL DEFAULT 0 COMMENT '注单人数（场馆维度统计）',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11021 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '场馆盈亏日报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_ip_fp_device_signature_risk
-- ----------------------------
DROP TABLE IF EXISTS `tb_ip_fp_device_signature_risk`;
CREATE TABLE `tb_ip_fp_device_signature_risk`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `device_signature` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '设备指纹',
  `last_login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '地区位置',
  `device_signature_account_num` int(11) NULL DEFAULT 0 COMMENT '会员账号数量',
  `device_signature_account_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '会员账号列表',
  `device_signature_ip_num` int(11) NULL DEFAULT 0 COMMENT '设备指纹数量',
  `device_signature_ip_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT 'IP地址列表',
  `update_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '最后登入时间',
  `account` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '最后登入用户账号',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员状态,\r\nACTIVE(\"正常\", 1),\r\nGAME_BAN(\"禁止游戏\", 2),\r\nWITHDRAW_BAN(\"禁止提款\", 3),\r\nLOGIN_BAN(\"禁止登录\", 4),\r\nBANNED(\"封禁\", 5),',
  `gmt_create` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据更新时间',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_device_signature`(`device_signature`(700) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 120648 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'IP/FP账号关联查询-查询类型设备指纹-查询条件设备指纹' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_ip_fp_device_signature_risk_login_ip_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_ip_fp_device_signature_risk_login_ip_info`;
CREATE TABLE `tb_ip_fp_device_signature_risk_login_ip_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `device_signature` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '设备指纹',
  `login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '登入IP',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '唯一id',
  `agent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级代理',
  `grade` bigint(20) NULL DEFAULT NULL COMMENT '会员等级值',
  `level_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员层级',
  `tags_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '会员标签',
  `real_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员备注',
  `account_login_ip_num` int(11) NULL DEFAULT 0 COMMENT '持有IP数量',
  `account_device_signature_num` int(11) NULL DEFAULT 0 COMMENT '持有指纹数量',
  `register_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '注册时间',
  `register_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册IP',
  `register_device_signature` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '注册设备指纹',
  `update_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '最后登入时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `last_device_signature` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '最后登录设备指纹',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员状态,\r\nACTIVE(\"正常\", 1),\r\nGAME_BAN(\"禁止游戏\", 2),\r\nWITHDRAW_BAN(\"禁止提款\", 3),\r\nLOGIN_BAN(\"禁止登录\", 4),\r\nBANNED(\"封禁\", 5),',
  `gmt_create` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据更新时间',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tag_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '会员标签ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_login_ip_device_signature_account`(`login_ip` ASC, `device_signature`(100) ASC, `account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 782127 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'IP/FP账号关联查询-查询类型设备指纹-查询条件设备指纹-IP数量详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_ip_fp_device_signature_risk_member_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_ip_fp_device_signature_risk_member_info`;
CREATE TABLE `tb_ip_fp_device_signature_risk_member_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `device_signature` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '设备指纹',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '唯一id',
  `agent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级代理',
  `grade` bigint(20) NULL DEFAULT NULL COMMENT '会员等级值',
  `level_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员层级',
  `tags_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '会员标签',
  `real_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员备注',
  `account_login_ip_num` int(11) NULL DEFAULT 0 COMMENT '持有IP数量',
  `account_device_signature_num` int(11) NULL DEFAULT 0 COMMENT '持有指纹数量',
  `register_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '注册时间',
  `register_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册IP',
  `register_device_signature` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '注册设备指纹',
  `update_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '最后登入时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `last_device_signature` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '最后登录设备指纹',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员状态,\r\nACTIVE(\"正常\", 1),\r\nGAME_BAN(\"禁止游戏\", 2),\r\nWITHDRAW_BAN(\"禁止提款\", 3),\r\nLOGIN_BAN(\"禁止登录\", 4),\r\nBANNED(\"封禁\", 5),',
  `gmt_create` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据更新时间',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tag_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '会员标签ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_register_device_account`(`device_signature`(100) ASC, `account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3062257 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'IP/FP账号关联查询-查询类型设备指纹-查询条件设备指纹-会员账号数量详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_ip_fp_login_ip_risk
-- ----------------------------
DROP TABLE IF EXISTS `tb_ip_fp_login_ip_risk`;
CREATE TABLE `tb_ip_fp_login_ip_risk`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '地区位置',
  `login_ip_account_num` int(11) NULL DEFAULT 0 COMMENT '会员账号数量',
  `login_ip_account_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '会员账号列表',
  `device_signature_num` int(11) NULL DEFAULT 0 COMMENT '设备指纹数量',
  `device_signature_list` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '设备指纹列表',
  `update_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '最后登入时间',
  `device_signature` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '最后登录设备指纹',
  `account` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '最后登入用户账号',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员状态,\r\nACTIVE(\"正常\", 1),\r\nGAME_BAN(\"禁止游戏\", 2),\r\nWITHDRAW_BAN(\"禁止提款\", 3),\r\nLOGIN_BAN(\"禁止登录\", 4),\r\nBANNED(\"封禁\", 5),',
  `gmt_create` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据更新时间',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_login_ip`(`login_ip` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66356 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'IP/FP账号关联查询-查询类型IP-查询条件IP' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_ip_fp_login_ip_risk_device_signature_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_ip_fp_login_ip_risk_device_signature_info`;
CREATE TABLE `tb_ip_fp_login_ip_risk_device_signature_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `device_signature` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '设备指纹',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '唯一id',
  `agent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级代理',
  `grade` bigint(20) NULL DEFAULT NULL COMMENT '会员等级值',
  `level_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员层级',
  `tags_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '会员标签',
  `real_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员备注',
  `account_login_ip_num` int(11) NULL DEFAULT 0 COMMENT '持有IP数量',
  `account_device_signature_num` int(11) NULL DEFAULT 0 COMMENT '持有指纹数量',
  `register_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '注册时间',
  `register_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册IP',
  `register_device_signature` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '注册设备指纹',
  `update_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '最后登入时间',
  `last_login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_device_signature` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '最后登录设备指纹',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员状态,\r\nACTIVE(\"正常\", 1),\r\nGAME_BAN(\"禁止游戏\", 2),\r\nWITHDRAW_BAN(\"禁止提款\", 3),\r\nLOGIN_BAN(\"禁止登录\", 4),\r\nBANNED(\"封禁\", 5),',
  `gmt_create` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据更新时间',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tag_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '会员标签ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_login_ip_device_signature_account`(`login_ip` ASC, `device_signature`(100) ASC, `account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1373669 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'IP/FP账号关联查询-查询类型IP-查询条件IP-设备指纹数量详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_ip_fp_login_ip_risk_member_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_ip_fp_login_ip_risk_member_info`;
CREATE TABLE `tb_ip_fp_login_ip_risk_member_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '唯一id',
  `agent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级代理',
  `grade` bigint(20) NULL DEFAULT NULL COMMENT '会员等级值',
  `level_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员层级',
  `tags_name` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '会员标签',
  `real_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `remark` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员备注',
  `account_login_ip_num` int(11) NULL DEFAULT 0 COMMENT '持有IP数量',
  `account_device_signature_num` int(11) NULL DEFAULT 0 COMMENT '持有指纹数量',
  `register_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '注册时间',
  `register_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册IP',
  `register_device_signature` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '注册设备指纹',
  `update_time` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '最后登入时间',
  `last_login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登录IP',
  `last_device_signature` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '最后登录设备指纹',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员状态,\r\nACTIVE(\"正常\", 1),\r\nGAME_BAN(\"禁止游戏\", 2),\r\nWITHDRAW_BAN(\"禁止提款\", 3),\r\nLOGIN_BAN(\"禁止登录\", 4),\r\nBANNED(\"封禁\", 5),',
  `gmt_create` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '数据更新时间',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tag_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '会员标签ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_login_ip_account`(`login_ip` ASC, `account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 44126010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'IP/FP账号关联查询-查询类型IP-查询条件IP-会员账号数量详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_daily_report`;
CREATE TABLE `tb_member_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sum_date` date NOT NULL COMMENT '统计日期:yyyy-MM-dd',
  `uid` bigint(20) NOT NULL COMMENT '会员id',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理',
  `channel_id` bigint(20) NULL DEFAULT NULL COMMENT '渠道ID',
  `bet_amount` decimal(20, 2) NOT NULL COMMENT '投注额',
  `valid_bet_amount` decimal(20, 2) NOT NULL COMMENT '有效金额',
  `payout_amount` decimal(20, 2) NOT NULL COMMENT '派彩额',
  `win_loss_amount` decimal(20, 2) NOT NULL COMMENT '输赢金额',
  `today_registered` int(11) NOT NULL COMMENT '是否今日注册：1-是，0-否',
  `today_first_deposit` int(11) NOT NULL COMMENT '是否今日首存：1-是，0-否',
  `deposit_amount` decimal(20, 2) NOT NULL COMMENT '存款金额',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员日统计表(待确认废弃)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_first_deposit_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_first_deposit_report`;
CREATE TABLE `tb_member_first_deposit_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `time` bigint(20) NOT NULL COMMENT '存款时间',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员id',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存款单号',
  `payment_method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款金额',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `nature` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前次数',
  `report_date` date NULL DEFAULT NULL COMMENT '数据归属日期',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tb_member_first_deposit_report_unique`(`uid` ASC, `nature` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52756 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员首存记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_game_summary_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_game_summary_daily_report`;
CREATE TABLE `tb_member_game_summary_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键，自增ID',
  `sum_date` date NOT NULL COMMENT '报表日期',
  `uid` bigint(20) NOT NULL COMMENT '会员uid',
  `account` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `agent` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级代理账号',
  `slot_bet_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '老虎机投注金额',
  `slot_valid_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '老虎机有效投注金额',
  `slot_win_lose_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '老虎机输赢金额',
  `slot_bet_count` bigint(20) NULL DEFAULT NULL COMMENT '老虎机注单次数',
  `live_bet_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '真人投注金额',
  `live_valid_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '真人有效投注金额',
  `live_win_lose_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '真人输赢金额',
  `live_bet_count` bigint(20) NULL DEFAULT NULL COMMENT '真人注单次数',
  `sports_bet_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '体育投注金额',
  `sports_valid_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '体育有效投注金额',
  `sports_win_lose_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '体育输赢金额',
  `sports_bet_count` bigint(20) NULL DEFAULT NULL COMMENT '体育注单次数',
  `lottery_bet_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '彩票投注金额',
  `lottery_valid_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '彩票有效投注金额',
  `lottery_win_lose_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '彩票输赢金额',
  `lottery_bet_count` bigint(20) NULL DEFAULT NULL COMMENT '彩票注单次数',
  `poker_bet_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '扑克投注金额',
  `poker_valid_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '扑克有效投注金额',
  `poker_win_lose_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '扑克输赢金额',
  `poker_bet_count` bigint(20) NULL DEFAULT NULL COMMENT '扑克注单次数',
  `fishing_bet_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '捕鱼投注金额',
  `fishing_valid_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '捕鱼有效投注金额',
  `fishing_win_lose_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '捕鱼输赢金额',
  `fishing_bet_count` bigint(20) NULL DEFAULT NULL COMMENT '捕鱼注单次数',
  `esports_bet_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '电竞投注金额',
  `esports_valid_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '电竞有效投注',
  `esports_win_lose_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '电竞输赢金额',
  `esports_bet_count` bigint(20) NULL DEFAULT NULL COMMENT '电竞注单次数',
  `animal_bet_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '斗鸡投注金额',
  `animal_valid_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '斗鸡有效投注金额',
  `animal_win_lose_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '斗鸡输赢金额',
  `animal_bet_count` bigint(20) NULL DEFAULT NULL COMMENT '斗鸡注单次数',
  `total_bet_amount` decimal(20, 2) NOT NULL COMMENT '总投注金额',
  `total_valid_amount` decimal(20, 2) NOT NULL COMMENT '总有效投注金额',
  `total_win_lose_amount` decimal(20, 2) NOT NULL COMMENT '总输赢金额',
  `total_rebate_amount` decimal(20, 2) NOT NULL COMMENT '总返水金额',
  `total_bet_count` bigint(20) NOT NULL COMMENT '总注单次数',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `slot_rebate_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '老虎机返水金额（会员维度统计）',
  `live_rebate_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '真人返水金额（会员维度统计）',
  `sports_rebate_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '体育返水金额（会员维度统计）',
  `lottery_rebate_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '彩票返水金额（会员维度统计）',
  `poker_rebate_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '扑克返水金额（会员维度统计）',
  `fishing_rebate_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '捕鱼返水金额（会员维度统计）',
  `esports_rebate_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '电竞返水金额（会员维度统计）',
  `animal_rebate_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '斗鸡返水金额（会员维度统计）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sum_date`(`sum_date` ASC) USING BTREE,
  INDEX `idx_account`(`account` ASC) USING BTREE,
  INDEX `idx_agent`(`agent` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 197022 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员游戏品类维度（会员返水明细）和汇总日报表(T+1更新)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_general_report_all
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_general_report_all`;
CREATE TABLE `tb_member_general_report_all`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NULL DEFAULT NULL,
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员账号',
  `agent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `grade` bigint(20) NULL DEFAULT NULL COMMENT '会员等级',
  `grade_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `register_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `level_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `net_profit_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '盈亏',
  `win_lose_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '玩家输赢金额/净输赢（有负数）',
  `calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '打码(二次计算有效投注金额)',
  `deposit_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '存款金额（总充值）',
  `deposit_number` bigint(20) NULL DEFAULT 0 COMMENT '存款笔数',
  `deposit_days` bigint(20) NULL DEFAULT 0 COMMENT '存款天数',
  `withdraw_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '提款金额',
  `withdraw_number` bigint(20) NULL DEFAULT 0 COMMENT '提款笔数',
  `deposit_withdraw_diff_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '存提差额',
  `manual_add_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '人工加额',
  `manual_sub_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '人工减额',
  `bonus_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '红利金额',
  `welfare_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '福利金额',
  `rebate_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '返水金额',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '数据时间戳',
  `bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '总投注金额',
  `payout_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '总中奖(总派彩额)',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `effect_bet_days` bigint(20) NULL DEFAULT NULL COMMENT '有效投注天数',
  `bet_members` bigint(20) NULL DEFAULT NULL COMMENT '投注人数',
  `bet_number` bigint(20) NULL DEFAULT NULL COMMENT '注单笔数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_account`(`account` ASC) USING BTREE,
  INDEX `idx_grade`(`grade` ASC) USING BTREE,
  INDEX `idx_account`(`account` ASC) USING BTREE,
  INDEX `idx_cover`(`agent` ASC, `grade` ASC, `register_source` ASC) USING BTREE,
  INDEX `idx_register_source`(`register_source` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 190501627 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员总报表-全量表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_general_report_all_copy1
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_general_report_all_copy1`;
CREATE TABLE `tb_member_general_report_all_copy1`  (
  `id` bigint(32) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL COMMENT '唯一id',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '会员账号',
  `agent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `grade` bigint(20) NULL DEFAULT NULL COMMENT '会员等级',
  `grade_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `register_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `level_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `net_profit_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '盈亏',
  `win_lose_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '玩家输赢金额/净输赢（有负数）',
  `calc_valid_bet_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '打码(二次计算有效投注金额)',
  `deposit_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '存款金额（总充值）',
  `deposit_number` bigint(20) NULL DEFAULT 0 COMMENT '存款笔数',
  `deposit_days` bigint(20) NULL DEFAULT 0 COMMENT '存款天数',
  `withdraw_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '提款金额',
  `withdraw_number` bigint(20) NULL DEFAULT 0 COMMENT '提款笔数',
  `deposit_withdraw_diff_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '存提差额',
  `manual_add_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '人工加额',
  `manual_sub_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '人工减额',
  `bonus_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '红利金额',
  `welfare_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '福利金额',
  `rebate_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '返水金额',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '数据时间戳',
  `bet_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '总投注金额',
  `payout_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '总中奖(总派彩额)',
  `effect_bet_days` bigint(32) NULL DEFAULT 0 COMMENT '有效投注天数',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `deposit_times` int(11) NULL DEFAULT 0 COMMENT '存款次数',
  `first_deposit_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '首存金额',
  `first_deposit_time` bigint(20) NULL DEFAULT NULL COMMENT '首存时间',
  `second_deposit_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '二存金额',
  `second_deposit_time` bigint(20) NULL DEFAULT NULL COMMENT '二存时间',
  `second_deposit_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二存状态',
  `last_deposit_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '最后存款金额',
  `last_deposit_time` bigint(20) NULL DEFAULT NULL COMMENT '最后存款时间',
  `last_withdraw_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '最后提现金额',
  `last_withdraw_time` bigint(20) NULL DEFAULT 0 COMMENT '最后提现时间',
  `bet_multi` int(11) NULL DEFAULT 0 COMMENT '投注倍数',
  `first_withdraw_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '首提现金额',
  `first_withdraw_time` bigint(20) NULL DEFAULT NULL COMMENT '首提现时间',
  `first_withdraw_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '首提现金额',
  `first_deposit_status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '首提现金额',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_uid_account`(`uid` ASC, `account` ASC) USING BTREE,
  INDEX `idx_grade`(`grade` ASC) USING BTREE,
  INDEX `idx_account`(`account` ASC) USING BTREE,
  INDEX `idx_cover`(`agent` ASC, `grade` ASC, `register_source` ASC) USING BTREE,
  INDEX `idx_register_source`(`register_source` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 126292225 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员总报表-全量表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_general_report_daily
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_general_report_daily`;
CREATE TABLE `tb_member_general_report_daily`  (
  `report_date` date NOT NULL COMMENT '数据日期yyyyMMdd',
  `uid` bigint(20) NULL DEFAULT NULL,
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `agent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `grade` bigint(20) NULL DEFAULT NULL COMMENT '会员等级',
  `grade_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `register_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `net_profit_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '盈亏',
  `win_lose_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '玩家输赢金额/净输赢（有负数）',
  `calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '打码(二次计算有效投注金额)',
  `deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款金额',
  `deposit_number` bigint(20) NULL DEFAULT NULL COMMENT '存款笔数',
  `deposit_days` bigint(20) NULL DEFAULT NULL COMMENT '存款天数',
  `withdraw_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '提款金额',
  `withdraw_number` bigint(20) NULL DEFAULT NULL COMMENT '提款笔数',
  `deposit_withdraw_diff_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存提差额',
  `manual_add_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '人工加额',
  `manual_sub_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '人工减额',
  `bonus_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '红利金额',
  `welfare_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '福利金额',
  `rebate_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '返水金额',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '数据时间戳',
  `bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '总投注金额',
  `payout_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '总中奖(总派彩额)',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `effect_bet_days` bigint(20) NULL DEFAULT NULL COMMENT '有效投注天数',
  `bet_members` bigint(20) NULL DEFAULT NULL COMMENT '投注人数',
  `bet_number` bigint(20) NULL DEFAULT NULL COMMENT '注单笔数',
  PRIMARY KEY (`report_date`, `account`) USING BTREE,
  INDEX `idx_report_date_grade`(`report_date` ASC, `grade` ASC) USING BTREE,
  INDEX `idx_group_by`(`uid` ASC, `account` ASC) USING BTREE,
  INDEX `idx_report_date_account`(`report_date` ASC, `account` ASC) USING BTREE,
  INDEX `idx_report_date_cover`(`report_date` ASC, `agent` ASC, `grade` ASC, `register_source` ASC) USING BTREE,
  INDEX `idx_report_date_register_source`(`report_date` ASC, `register_source` ASC) USING BTREE,
  INDEX `idx_report_date`(`report_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员总报表-日表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_general_report_month
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_general_report_month`;
CREATE TABLE `tb_member_general_report_month`  (
  `report_date` date NOT NULL COMMENT '数据日期yyyyMMdd:为每个月的第一天',
  `uid` bigint(20) NULL DEFAULT NULL,
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `agent` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `grade` bigint(20) NULL DEFAULT NULL COMMENT '会员等级',
  `grade_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `register_source` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `net_profit_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '盈亏',
  `win_lose_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '玩家输赢金额/净输赢（有负数）',
  `calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '打码(二次计算有效投注金额)',
  `deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款金额',
  `deposit_number` bigint(20) NULL DEFAULT NULL COMMENT '存款笔数',
  `deposit_days` bigint(20) NULL DEFAULT NULL COMMENT '存款天数',
  `withdraw_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '提款金额',
  `withdraw_number` bigint(20) NULL DEFAULT NULL COMMENT '提款笔数',
  `deposit_withdraw_diff_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存提差额',
  `manual_add_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '人工加额',
  `manual_sub_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '人工减额',
  `bonus_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '红利金额',
  `welfare_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '福利金额',
  `rebate_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '返水金额',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '数据时间戳',
  `bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '总投注金额',
  `payout_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '总中奖(总派彩额)',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `effect_bet_days` bigint(20) NULL DEFAULT NULL COMMENT '有效投注天数',
  `bet_members` bigint(20) NULL DEFAULT NULL COMMENT '投注人数',
  `bet_number` bigint(20) NULL DEFAULT NULL COMMENT '注单笔数',
  PRIMARY KEY (`report_date`, `account`) USING BTREE,
  INDEX `idx_report_date_grade`(`report_date` ASC, `grade` ASC) USING BTREE,
  INDEX `idx_group_by`(`uid` ASC, `account` ASC) USING BTREE,
  INDEX `idx_report_date_account`(`report_date` ASC, `account` ASC) USING BTREE,
  INDEX `idx_report_date_cover`(`report_date` ASC, `agent` ASC, `grade` ASC, `register_source` ASC) USING BTREE,
  INDEX `idx_report_date_register_source`(`report_date` ASC, `register_source` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员总报表-月份表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_info_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_info_daily_report`;
CREATE TABLE `tb_member_info_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `date` date NOT NULL COMMENT '统计日期:yyyy-MM-dd',
  `first_deposit_member_amount` int(11) NOT NULL COMMENT '首存人数',
  `first_deposit_member_ratio` decimal(20, 2) NOT NULL COMMENT '首存人数比例',
  `first_deposit_amount` decimal(20, 2) NOT NULL COMMENT '首存金额',
  `first_deposit_amount_ratio` decimal(20, 2) NOT NULL COMMENT '首存金额占比',
  `n2_deposit_member_amount` int(11) NOT NULL COMMENT '二存人数',
  `n2_deposit_member_ratio` decimal(20, 2) NOT NULL COMMENT '二存人数比例',
  `n2_deposit_amount` decimal(20, 2) NOT NULL COMMENT '二存金额',
  `n2_deposit_amount_ratio` decimal(20, 2) NOT NULL COMMENT '二存金额占比',
  `nth_deposit_member_amount` int(11) NOT NULL COMMENT '复存人数',
  `nth_deposit_member_ratio` decimal(20, 2) NOT NULL COMMENT '复存比例',
  `nth_deposit_amount` decimal(20, 2) NOT NULL COMMENT '复存金额',
  `new_member_amount` int(11) NULL DEFAULT NULL COMMENT '新增会员人数',
  `first_deposit_new_member_amount_ratio` decimal(20, 2) NULL DEFAULT NULL COMMENT '新增会员首存金额占比',
  `nth_deposit_amount_new_member` decimal(20, 2) NULL DEFAULT NULL COMMENT '新增会员复存金额',
  `nth_deposit_new_member_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '新增会员复存人数',
  `nth_deposit_new_member_ratio` decimal(20, 2) NULL DEFAULT NULL COMMENT '新增会员复存比例',
  `nth_deposit_amount_new_member_ratio` decimal(20, 2) NULL DEFAULT NULL COMMENT '新增复存金额占比',
  `agent_channel_memeber_amount` int(11) NULL DEFAULT NULL COMMENT '来自上级代理人数',
  `official_channel_member_amount` int(11) NULL DEFAULT NULL COMMENT '来自官方渠道人数',
  `p2p_channel_member_amount` int(11) NULL DEFAULT NULL COMMENT '来自会员发展人数',
  `quick_add_member_amount` int(11) NULL DEFAULT NULL COMMENT '来自后台添加人数',
  `deposit_new_member_amount` int(11) NULL DEFAULT NULL COMMENT '新增会员存款人数',
  `deposit_new_member_ratio` decimal(20, 2) NULL DEFAULT NULL COMMENT '新增会员存款比例 = 新增会员首存比例',
  `new_member_total_deposit` decimal(20, 2) NULL DEFAULT NULL COMMENT '新增会员存款金额',
  `new_agent_amount` int(11) NULL DEFAULT NULL COMMENT '新增代理数量',
  `login_member_amount` int(11) NULL DEFAULT NULL COMMENT '登录人数',
  `active_member_amount` int(11) NULL DEFAULT NULL COMMENT '活跃会员人数',
  `organic_member_amount` int(11) NULL DEFAULT NULL COMMENT '有效会员人数 - 目前不用',
  `organic_active_member_amount` int(11) NULL DEFAULT NULL COMMENT '有效活跃会员人数 - 目前不用',
  `total_wallet_balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '中心钱包余额',
  `total_venue_balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '场馆钱包余额',
  `total_commission_balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '佣金钱包余额',
  `total_deposit_balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '额度钱包余额',
  `flag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据归属标识 CONTRIBUTION -- 会员贡献留存   ACCURATE  -- 会员精准留存',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tb_member_info_daily_report_unique`(`date` ASC, `flag` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1225 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员信息统计表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_payment_report_daily
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_payment_report_daily`;
CREATE TABLE `tb_member_payment_report_daily`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `report_date` date NOT NULL COMMENT '数据日期yyyy-MM-dd',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员ID',
  `currency` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '币种',
  `fund_payment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式code',
  `fund_payment_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式名称',
  `deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款金额',
  `deposit_number` bigint(20) NULL DEFAULT NULL COMMENT '存款笔数',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_date_account_payment`(`report_date` ASC, `account` ASC, `fund_payment_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84176 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 会员支付维度日表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_payment_report_month
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_payment_report_month`;
CREATE TABLE `tb_member_payment_report_month`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `report_date` date NOT NULL COMMENT '数据日期yyyy-MM-dd为每个月的第一天',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员ID',
  `currency` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '币种',
  `fund_payment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式code',
  `fund_payment_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式名称',
  `deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款金额',
  `deposit_number` bigint(20) NULL DEFAULT NULL COMMENT '存款笔数',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_date_account_payment`(`report_date` ASC, `account` ASC, `fund_payment_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1399476 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 会员支付维度月表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_payment_report_week
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_payment_report_week`;
CREATE TABLE `tb_member_payment_report_week`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `year` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据日期yyyy',
  `week` int(11) NOT NULL COMMENT '每一年的第几周',
  `report_date` date NOT NULL COMMENT '数据日期yyyy-MM-dd为每一周的第一天',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员ID',
  `currency` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '币种',
  `fund_payment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式code',
  `fund_payment_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式名称',
  `deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款金额',
  `deposit_number` bigint(20) NULL DEFAULT NULL COMMENT '存款笔数',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_date_account_payment`(`year` ASC, `week` ASC, `report_date` ASC, `account` ASC, `fund_payment_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 440772 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 会员支付维度周表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_profit_loss_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_profit_loss_daily_report`;
CREATE TABLE `tb_member_profit_loss_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `sum_date` date NOT NULL COMMENT '日期',
  `win_lose_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '会员输赢总额',
  `rebate_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '返水总额',
  `bonus_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '红利总额',
  `welfare_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '福利总额',
  `manual_add_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '人工加额总额',
  `manual_sub_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '人工减额总额',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `profit_loss_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '会员盈亏总额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 578 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员盈亏日报表（会员日维度,T+1更新）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_referrer_report_daily
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_referrer_report_daily`;
CREATE TABLE `tb_member_referrer_report_daily`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `report_date` date NOT NULL COMMENT '数据日期yyyy-MM-dd',
  `account_level` int(11) NOT NULL COMMENT '会员原始等级',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员ID',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `depth` int(11) NOT NULL COMMENT '会员下各层级标识',
  `sports_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '体育二次计算有效投注金额',
  `slot_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '老虎机二次计算有效投注金额',
  `live_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '真人二次计算有效投注金额',
  `poker_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '棋牌二次计算有效投注金额',
  `fishing_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '捕鱼二次计算有效投注金额',
  `esports_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '电竞二次计算有效投注金额',
  `lottery_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '彩票二次计算有效投注金额',
  `animal_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '斗鸡二次计算有效投注金额',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间(时间戳)',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间(时间戳)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_raat`(`report_date` ASC, `account_level` ASC, `account` ASC, `depth` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1125 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '全民代理统计表-日表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_referrer_report_month
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_referrer_report_month`;
CREATE TABLE `tb_member_referrer_report_month`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `report_date` date NOT NULL COMMENT '数据日期yyyy-MM-dd，为每个月的第一天',
  `account_level` int(11) NOT NULL COMMENT '会员原始等级',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员ID',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `depth` int(11) NOT NULL COMMENT '会员下各层级标识',
  `sports_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '体育二次计算有效投注金额',
  `slot_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '老虎机二次计算有效投注金额',
  `live_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '真人二次计算有效投注金额',
  `poker_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '棋牌二次计算有效投注金额',
  `fishing_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '捕鱼二次计算有效投注金额',
  `esports_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '电竞二次计算有效投注金额',
  `lottery_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '彩票二次计算有效投注金额',
  `animal_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '斗鸡二次计算有效投注金额',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间(时间戳)',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间(时间戳)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_raat`(`report_date` ASC, `account_level` ASC, `account` ASC, `depth` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14934 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '全民代理统计表-月表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_referrer_report_week
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_referrer_report_week`;
CREATE TABLE `tb_member_referrer_report_week`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `year` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据日期yyyy',
  `week` int(11) NOT NULL COMMENT '每一年的第几周',
  `report_date_list` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据日期yyyy-MM-dd集合',
  `account_level` int(11) NOT NULL COMMENT '会员原始等级',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员ID',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `depth` int(11) NOT NULL COMMENT '会员下各层级标识',
  `sports_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '体育二次计算有效投注金额',
  `slot_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '老虎机二次计算有效投注金额',
  `live_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '真人二次计算有效投注金额',
  `poker_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '棋牌二次计算有效投注金额',
  `fishing_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '捕鱼二次计算有效投注金额',
  `esports_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '电竞二次计算有效投注金额',
  `lottery_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '彩票二次计算有效投注金额',
  `animal_calc_valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '斗鸡二次计算有效投注金额',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间(时间戳)',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间(时间戳)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_raat`(`year` ASC, `week` ASC, `account_level` ASC, `account` ASC, `depth` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4945 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '全民代理统计表-周表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_venue_report_daily
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_venue_report_daily`;
CREATE TABLE `tb_member_venue_report_daily`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `report_date` date NOT NULL COMMENT '数据日期yyyy-MM-dd',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员ID',
  `currency` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前币种',
  `venue_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '场馆code',
  `venue_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆名称',
  `valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '有效投注金额（同打码量）',
  `win_lose_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '输赢金额',
  `bonus_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '红利金额',
  `welfare_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '福利金额',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_date_account_venue`(`report_date` ASC, `account` ASC, `venue_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5331 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 会员场馆维度日表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_venue_report_month
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_venue_report_month`;
CREATE TABLE `tb_member_venue_report_month`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `report_date` date NOT NULL COMMENT '数据日期yyyy-MM-dd为每个月的第一天',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员ID',
  `currency` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前币种',
  `venue_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '场馆code',
  `venue_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆名称',
  `valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '有效投注金额（同打码量）',
  `win_lose_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '输赢金额',
  `bonus_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '红利金额',
  `welfare_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '福利金额',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_date_account_venue`(`report_date` ASC, `account` ASC, `venue_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65681 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 会员场馆维度月表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_venue_report_week
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_venue_report_week`;
CREATE TABLE `tb_member_venue_report_week`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `year` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据日期yyyy',
  `week` int(11) NOT NULL COMMENT '每一年的第几周',
  `report_date` date NOT NULL COMMENT '数据日期yyyy-MM-dd为每一周的第一天',
  `account` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员ID',
  `currency` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当前币种',
  `venue_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '场馆code',
  `venue_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '场馆名称',
  `valid_bet_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '有效投注金额（同打码量）',
  `win_lose_amount` decimal(20, 4) NULL DEFAULT NULL COMMENT '输赢金额',
  `bonus_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '红利金额',
  `welfare_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '福利金额',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_date_account_venue`(`year` ASC, `week` ASC, `report_date` ASC, `account` ASC, `venue_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 会员场馆维度周表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_member_win_loss_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_member_win_loss_daily_report`;
CREATE TABLE `tb_member_win_loss_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sum_date` date NOT NULL COMMENT '统计日期',
  `win_lose_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '会员输赢总额',
  `bet_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '投注总额',
  `valid_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '有效投注总额',
  `bet_count` bigint(20) NULL DEFAULT NULL COMMENT '投注人数',
  `bet_order_num` bigint(20) NULL DEFAULT NULL COMMENT '注单笔数',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1376 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员输赢日报表（会员日维度,改成会员汇总报表数）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_op_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_op_daily_report`;
CREATE TABLE `tb_op_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sum_date` date NOT NULL COMMENT '数据日期yyyyMMdd',
  `time_range` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_agent_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first_deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deposit_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_deposit_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `large_deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdraw_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdraw_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_withdraw_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `large_withdraw_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `net_deposit` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bet_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bet_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `valid_total_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_winLose_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_unsettled_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_exception_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `real_turnover_multiplier` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_rebate_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_bouns_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_welfare_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_manual_add_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_manual_sub_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_wallet_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_venue_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_commission_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_deposit_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `osumDatetime_range_index`(`sum_date` ASC, `time_range` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 288 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员信息每日报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_op_eight_hours_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_op_eight_hours_report`;
CREATE TABLE `tb_op_eight_hours_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sum_date` date NOT NULL COMMENT '数据日期yyyyMMdd',
  `time_range` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_agent_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first_deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deposit_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_deposit_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `large_deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdraw_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdraw_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_withdraw_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `large_withdraw_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `net_deposit` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bet_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bet_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `valid_total_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_winLose_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_unsettled_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_exception_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `real_turnover_multiplier` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_rebate_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_bouns_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_welfare_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_manual_add_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_manual_sub_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_wallet_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_venue_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_commission_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_deposit_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `osumDatetime_range_index`(`sum_date` ASC, `time_range` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4127 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员信息8小时报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_op_four_hours_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_op_four_hours_report`;
CREATE TABLE `tb_op_four_hours_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sum_date` date NOT NULL COMMENT '数据日期yyyyMMdd',
  `time_range` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_agent_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first_deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deposit_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_deposit_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `large_deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdraw_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdraw_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_withdraw_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `large_withdraw_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `net_deposit` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bet_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bet_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `valid_total_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_winLose_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_unsettled_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_exception_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `real_turnover_multiplier` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_rebate_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_bouns_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_welfare_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_manual_add_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_manual_sub_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_wallet_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_venue_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_commission_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_deposit_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `osumDatetime_range_index`(`sum_date` ASC, `time_range` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19443 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员信息4小时报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_op_one_hours_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_op_one_hours_report`;
CREATE TABLE `tb_op_one_hours_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sum_date` date NOT NULL COMMENT '数据日期yyyyMMdd',
  `time_range` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_agent_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first_deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deposit_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_deposit_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `large_deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdraw_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdraw_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_withdraw_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `large_withdraw_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `net_deposit` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bet_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bet_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `valid_total_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_winLose_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_unsettled_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_exception_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `real_turnover_multiplier` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_rebate_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_bouns_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_welfare_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_manual_add_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_manual_sub_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_wallet_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_venue_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_commission_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_deposit_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `osumDatetime_range_index`(`sum_date` ASC, `time_range` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 356130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员信息1小时报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_op_six_hours_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_op_six_hours_report`;
CREATE TABLE `tb_op_six_hours_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sum_date` date NOT NULL COMMENT '数据日期yyyyMMdd',
  `time_range` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_agent_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first_deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deposit_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_deposit_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `large_deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdraw_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdraw_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_withdraw_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `large_withdraw_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `net_deposit` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bet_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bet_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `valid_total_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_winLose_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_unsettled_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_exception_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `real_turnover_multiplier` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_rebate_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_bouns_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_welfare_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_manual_add_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_manual_sub_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_wallet_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_venue_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_commission_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_deposit_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `osumDatetime_range_index`(`sum_date` ASC, `time_range` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8151 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员信息6小时报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_op_thirty_minutes_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_op_thirty_minutes_report`;
CREATE TABLE `tb_op_thirty_minutes_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sum_date` date NOT NULL COMMENT '数据日期yyyyMMdd',
  `time_range` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_agent_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first_deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deposit_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_deposit_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `large_deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdraw_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdraw_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_withdraw_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `large_withdraw_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `net_deposit` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bet_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bet_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `valid_total_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_winLose_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_unsettled_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_exception_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `real_turnover_multiplier` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_rebate_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_bouns_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_welfare_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_manual_add_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_manual_sub_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_wallet_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_venue_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_commission_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_deposit_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `osumDatetime_range_index`(`sum_date` ASC, `time_range` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1451316 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员信息三十分报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_op_three_hours_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_op_three_hours_report`;
CREATE TABLE `tb_op_three_hours_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sum_date` date NOT NULL COMMENT '数据日期yyyyMMdd',
  `time_range` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_agent_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first_deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deposit_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_deposit_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `large_deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdraw_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdraw_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_withdraw_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `large_withdraw_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `net_deposit` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bet_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bet_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `valid_total_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_winLose_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_unsettled_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_exception_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `real_turnover_multiplier` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_rebate_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_bouns_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_welfare_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_manual_add_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_manual_sub_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_wallet_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_venue_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_commission_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_deposit_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `osumDatetime_range_index`(`sum_date` ASC, `time_range` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36159 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员信息3小时报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_op_twelve_hours_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_op_twelve_hours_report`;
CREATE TABLE `tb_op_twelve_hours_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sum_date` date NOT NULL COMMENT '数据日期yyyyMMdd',
  `time_range` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_agent_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first_deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deposit_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_deposit_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `large_deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdraw_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdraw_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_withdraw_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `large_withdraw_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `net_deposit` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bet_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bet_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `valid_total_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_winLose_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_unsettled_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_exception_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `real_turnover_multiplier` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_rebate_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_bouns_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_welfare_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_manual_add_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_manual_sub_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_wallet_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_venue_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_commission_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_deposit_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `osumDatetime_range_index`(`sum_date` ASC, `time_range` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1544 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员信息12小时报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_op_two_hours_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_op_two_hours_report`;
CREATE TABLE `tb_op_two_hours_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sum_date` date NOT NULL COMMENT '数据日期yyyyMMdd',
  `time_range` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_agent_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `new_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first_deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `active_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `login_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `deposit_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_deposit_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `large_deposit_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdraw_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdraw_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_withdraw_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `large_withdraw_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `net_deposit` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bet_member_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bet_order_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `valid_total_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_winLose_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_unsettled_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_exception_bet_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `real_turnover_multiplier` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_rebate_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_bouns_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_welfare_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_manual_add_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_manual_sub_amount` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_wallet_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_venue_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_commission_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `total_deposit_balance` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `osumDatetime_range_index`(`sum_date` ASC, `time_range` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 84556 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员信息2小时报表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_operation_general_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_operation_general_daily_report`;
CREATE TABLE `tb_operation_general_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `date` date NOT NULL COMMENT '统计日期:yyyy-MM-dd',
  `new_agent_amount` bigint(20) NULL DEFAULT 0 COMMENT '新增代理数量',
  `new_member_amount` bigint(20) NULL DEFAULT 0 COMMENT '新增会员人数',
  `first_deposit_member_amount` bigint(20) NULL DEFAULT 0 COMMENT '首存会员人数',
  `login_member_amount` bigint(20) NULL DEFAULT 0 COMMENT '登录人数',
  `active_member_amount` bigint(20) NULL DEFAULT 0 COMMENT '活跃会员人数',
  `organic_member_amount` bigint(20) NULL DEFAULT 0 COMMENT '有效会员人数',
  `organic_active_member_amount` bigint(20) NULL DEFAULT 0 COMMENT '有效活跃会员人数',
  `deposit_member_amount` bigint(20) NULL DEFAULT 0 COMMENT '存款人数',
  `deposit_order_amount` bigint(20) NULL DEFAULT 0 COMMENT '存款笔数',
  `total_deposit_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '存款总额',
  `large_deposit_member_amount` bigint(20) NULL DEFAULT 0 COMMENT '大额存款人数',
  `withdraw_member_amount` bigint(20) NULL DEFAULT 0 COMMENT '提款人数',
  `withdraw_order_amount` bigint(20) NULL DEFAULT 0 COMMENT '提款笔数',
  `total_withdraw_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '提款总额',
  `large_withdraw_member_amount` bigint(20) NULL DEFAULT 0 COMMENT '大额提款人数',
  `net_deposit` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '存提差额',
  `bet_member_amount` bigint(20) NULL DEFAULT 0 COMMENT '投注人数',
  `bet_order_amount` bigint(20) NULL DEFAULT 0 COMMENT '注单笔数',
  `total_bet_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '投注总额',
  `valid_total_bet_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '有效投注总额',
  `total_win_lose_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '游戏输赢总额',
  `total_unsettled_bet_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '未结算注单总额',
  `total_exception_bet_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '异常注单总额',
  `real_turnover_multiplier` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '实际流水倍数',
  `total_rebate_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '返水总额',
  `total_bouns_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '红利总额',
  `total_welfare_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '福利总额',
  `total_manual_add_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '人工加额总额',
  `total_manual_sub_amount` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '人工减额总额',
  `total_wallet_balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '中心钱包余额',
  `total_venue_balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '场馆钱包余额',
  `total_commission_balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '佣金钱包余额',
  `total_deposit_balance` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '额度钱包余额',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间(时间戳)',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间(时间戳)',
  `creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_date`(`date` ASC) USING BTREE COMMENT '统计日期唯一索引',
  INDEX `idx_date`(`date` ASC) USING BTREE COMMENT '统计日期索引'
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '运营综合日报表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_operation_member_growth_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_operation_member_growth_report`;
CREATE TABLE `tb_operation_member_growth_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `date` date NOT NULL COMMENT '统计日期:yyyy-MM-dd',
  `new_member_amount` bigint(20) NULL DEFAULT 0 COMMENT '新增会员人数',
  `deposit_new_member_amount` bigint(20) NULL DEFAULT 0 COMMENT '新增会员存款人数',
  `deposit_new_member_ratio` decimal(10, 4) NULL DEFAULT 0.0000 COMMENT '新增会员存款比例',
  `new_member_total_deposit` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '新增会员存款金额',
  `first_deposit_amount_ratio` decimal(10, 4) NULL DEFAULT 0.0000 COMMENT '新增首存金额占比',
  `nth_deposit_new_member_amount` bigint(20) NULL DEFAULT 0 COMMENT '新增会员复存人数',
  `nth_deposit_amount_new_member` decimal(20, 2) NULL DEFAULT 0.00 COMMENT '新增会员复存金额',
  `nth_deposit_new_member_ratio` decimal(10, 4) NULL DEFAULT 0.0000 COMMENT '新增会员复存比例',
  `nth_deposit_amount_new_member_ratio` decimal(10, 4) NULL DEFAULT 0.0000 COMMENT '新增复存金额占比',
  `agent_channel_memeber_amount` bigint(20) NULL DEFAULT 0 COMMENT '来自上级代理人数',
  `official_channel_member_amount` bigint(20) NULL DEFAULT 0 COMMENT '来自官方渠道人数',
  `p2p_channel_member_amount` bigint(20) NULL DEFAULT 0 COMMENT '来自会员发展人数',
  `quick_add_member_amount` bigint(20) NULL DEFAULT 0 COMMENT '来自后台添加人数',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间(时间戳)',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间(时间戳)',
  `creator` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_date`(`date` ASC) USING BTREE COMMENT '统计日期唯一索引',
  INDEX `idx_date`(`date` ASC) USING BTREE COMMENT '统计日期索引'
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '运营会员增长日报表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_operation_thirty_minutes_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_operation_thirty_minutes_report`;
CREATE TABLE `tb_operation_thirty_minutes_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `sum_date` date NOT NULL COMMENT '统计日期:yyyy-MM-dd',
  `data_group_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data_group_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `data_key` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `time_range0030` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range0100` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range0130` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range0200` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range0230` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range0300` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range0330` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range0400` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range0430` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range0500` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range0530` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range0600` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range0630` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range0700` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range0730` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range0800` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range0830` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range0900` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range0930` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1000` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1030` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1100` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1130` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1200` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1230` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1300` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1330` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1400` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1430` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1500` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1530` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1600` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1630` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1700` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1730` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1800` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1830` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1900` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range1930` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range2000` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range2030` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range2100` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range2130` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range2200` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range2230` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range2300` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range2330` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `time_range2400` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `osumDatedataKey_index`(`sum_date` ASC, `data_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2934 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '30分钟维度运营统计表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_settle_bet_order_update_latest
-- ----------------------------
DROP TABLE IF EXISTS `tb_settle_bet_order_update_latest`;
CREATE TABLE `tb_settle_bet_order_update_latest`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `latest_time` bigint(20) NULL DEFAULT NULL COMMENT '已结算注单更新，定时任务标记最新标记时间戳',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已结算注单报表最新标记时间戳表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_wallet_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_wallet_daily_report`;
CREATE TABLE `tb_wallet_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `total_balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '总余额(允许为负)',
  `sum_date` date NOT NULL COMMENT '统计日期:yyyy-MM-dd',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '币种',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 745553 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 会员中心钱包每日记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_welfare_summary_daily_report
-- ----------------------------
DROP TABLE IF EXISTS `tb_welfare_summary_daily_report`;
CREATE TABLE `tb_welfare_summary_daily_report`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sum_date` date NOT NULL COMMENT '报表日期',
  `total_send_count` bigint(20) NULL DEFAULT NULL COMMENT '福利发送人次(备注:福利发放人次)',
  `total_receive_count` bigint(20) NULL DEFAULT NULL COMMENT '福利总领取人次',
  `total_unclaimed_count` bigint(20) NULL DEFAULT NULL COMMENT '福利未领取人次',
  `total_expired_count` bigint(20) NULL DEFAULT NULL COMMENT '福利过期人次',
  `total_grant_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '福利发放总额',
  `total_receive_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '福利领取总额',
  `total_unclaimed_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '福利未领总额',
  `total_expired_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '福利过期总额',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_sum_date`(`sum_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 405 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员福利汇总报表' ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
