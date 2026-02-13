/*
 Navicat Premium Dump SQL

 Source Server         : mysql-test
 Source Server Type    : MySQL
 Source Server Version : 80018 (8.0.18)
 Source Host           : abcg-game789789.rwlb.singapore.rds.aliyuncs.com:3306
 Source Schema         : site_agent

 Target Server Type    : MySQL
 Target Server Version : 80018 (8.0.18)
 File Encoding         : 65001

 Date: 13/02/2026 12:00:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_agent_app_build_archive
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_app_build_archive`;
CREATE TABLE `tb_agent_app_build_archive`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `upload_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上传的应用名称',
  `os_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统类型',
  `version` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本号',
  `archive_size` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '资源大小',
  `channel_id` bigint(20) NULL DEFAULT NULL COMMENT '渠道id',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图标',
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态:\r\n上传中-PENDING;\r\n成功-SUCCESS;\r\n失败-FAILED',
  `download_count` smallint(6) NULL DEFAULT NULL COMMENT '下载次数',
  `download_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '下载url',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `agent_account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `archive_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指定的资源应用名称',
  `apply_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '代理申请备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 136 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'app打包构建资源' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_bankcard
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_bankcard`;
CREATE TABLE `tb_agent_bankcard`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `agent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理',
  `alias_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户命名',
  `bank_short_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '银行简称',
  `bankcard_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `bankcard_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行账户（持有人）',
  `bank_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '银行名称',
  `bank_branch_name` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '银行分行名称',
  `use_count` int(11) NOT NULL COMMENT '使用次数',
  `enable_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y' COMMENT '启用状态:Y-是;N-否',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `last_use_time` bigint(20) NULL DEFAULT NULL COMMENT '最后一次使用时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_agent_bankcard`(`agent` ASC, `bank_short_name` ASC, `bankcard_number` ASC, `bankcard_account` ASC) USING BTREE,
  INDEX `idx_member_bankcard_bankcard`(`bank_short_name` ASC, `bankcard_number` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 592 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理银行卡' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_bonus_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_bonus_log`;
CREATE TABLE `tb_agent_bonus_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号',
  `grade` int(11) NULL DEFAULT NULL COMMENT '等级',
  `wallet_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钱包类型: \r\n额度钱包-DEPOSIT\r\n佣金钱包-COMMISSION',
  `bonus_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '红利类型:\r\nREFERRAL_REWARD-推广奖励',
  `bonus_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '红利金额',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态:\r\nPENDING-审核中,\r\nSUCCESS-成功,\r\nREJECTED-已拒绝,',
  `audit_time` bigint(20) NULL DEFAULT NULL COMMENT '审核时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间(发放时间共用)',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `agent_audit_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审核备注（代理）',
  `admin_audit_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审核备注（后台）',
  `order_time` bigint(20) NULL DEFAULT NULL COMMENT '订单完成时间',
  `agent_user_path_index` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理路径索引位置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 897510592357730959 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理红利记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_commission_calc_view
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_commission_calc_view`;
CREATE TABLE `tb_agent_commission_calc_view`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `date_time` date NULL DEFAULT NULL COMMENT '计算日期',
  `commission_group_id` bigint(20) NULL DEFAULT NULL COMMENT '佣金组id',
  `schema_id` bigint(20) NULL DEFAULT NULL COMMENT '代理模式id',
  `negative_profit_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '负盈利金额=(输赢金额)',
  `net_profit` decimal(18, 2) NULL DEFAULT NULL COMMENT '净盈利',
  `discount_bonus_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '优惠红利金额',
  `discount_bonus_fee` decimal(18, 2) NULL DEFAULT NULL COMMENT '优惠红利费用',
  `deposit_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '存款金额（取自报表tb_basic_member_fund_daily_report的depositAmount金额字段）',
  `deposit_fee` decimal(18, 2) NULL DEFAULT NULL COMMENT '存款费用',
  `withdrawal_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '提款金额',
  `withdrawal_fee` decimal(18, 2) NULL DEFAULT NULL COMMENT '提款费用',
  `platform_game_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '平台游戏金额',
  `platform_game_fee` decimal(18, 2) NULL DEFAULT NULL COMMENT '平台游戏费用',
  `manual_adjust_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '人工调整金额',
  `manual_adjust_fee` decimal(18, 2) NULL DEFAULT NULL COMMENT '人工调整费用',
  `valid_bet_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '有效投注金额',
  `member_profit_loss` decimal(18, 2) NULL DEFAULT NULL COMMENT '会员输赢金额',
  `valid_member_count` int(11) NULL DEFAULT NULL COMMENT '有效会员数',
  `deferred_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '上期递延佣金',
  `due_commission` decimal(18, 2) NULL DEFAULT NULL COMMENT '应发佣金（结算佣金 + 递延金额）',
  `settle_commission` decimal(18, 2) NULL DEFAULT NULL COMMENT '结算佣金（计算出来的佣金）',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1006047 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '佣金计算中间视图表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_commission_conf
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_commission_conf`;
CREATE TABLE `tb_agent_commission_conf`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组名称',
  `deposit_amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款金额',
  `valid_bets` decimal(20, 2) NULL DEFAULT NULL COMMENT '有效投注',
  `deposit_fee` decimal(20, 2) NULL DEFAULT NULL COMMENT '存款费用',
  `withdrawal_fee` decimal(20, 2) NULL DEFAULT NULL COMMENT '提款费用',
  `platform_fee` decimal(20, 2) NULL DEFAULT NULL COMMENT '平台费用',
  `commission_rate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '佣金比例设定',
  `commission_exception_rate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '佣金例外计算',
  `agent_account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账户',
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态ON,OFF',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `agent_user_path_index` int(11) NULL DEFAULT NULL COMMENT '代理路径索引位置',
  `data_from` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据来源：AGENT-代理系统,SITE-后台系统',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 193 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理佣金配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_commission_disburse_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_commission_disburse_log`;
CREATE TABLE `tb_agent_commission_disburse_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账号',
  `commission_group_id` bigint(20) NULL DEFAULT NULL COMMENT '佣金组id',
  `calculation_time` bigint(20) NULL DEFAULT NULL COMMENT '计算时间',
  `calculation_date` date NULL DEFAULT NULL COMMENT '计算日期',
  `active_member_count` bigint(20) NULL DEFAULT NULL COMMENT '有效会员数',
  `current_profit` decimal(18, 2) NULL DEFAULT NULL COMMENT '当期盈利',
  `current_expenses` decimal(18, 2) NULL DEFAULT NULL COMMENT '当期费用',
  `negative_profit` decimal(18, 2) NULL DEFAULT NULL COMMENT '负盈利金额',
  `deferred_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '递延金额（当期未发放佣金）',
  `settle_commission` decimal(18, 2) NULL DEFAULT NULL COMMENT '结算佣金（计算出来的佣金）',
  `actual_commission` decimal(18, 2) NULL DEFAULT NULL COMMENT '实发佣金（用户手输的金额）',
  `due_commission` decimal(18, 2) NULL DEFAULT NULL COMMENT '应发佣金（结算佣金 + 递延金额）',
  `adjust_commission` decimal(18, 2) NULL DEFAULT NULL COMMENT '后台调节佣金（实发佣金 - 应发佣金）',
  `audit_status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核状态：\r\nPENDING-审核中,\r\nSUCCESS-成功,\r\nREJECTED-已拒绝',
  `receive_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领取状态：\r\nDEFERRED-已递延\r\nCLEARED-已清零\r\nAPPLY-可申请\r\nPENDING_RECEIVE-待领取\r\nRECEIVED-已领取\r\nEXPIRED-已过期\r\nREVOKED-已撤回',
  `audit_time` bigint(20) NULL DEFAULT NULL COMMENT '审核时间',
  `settle_time` bigint(20) NULL DEFAULT NULL COMMENT '结算时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `deferred_current` smallint(6) NULL DEFAULT NULL COMMENT '记录当前递延期数',
  `commission_status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '这可能要弃用\r\n佣金状态：\r\nDISTRIBUTED-已派发\r\nCLEARED-已清零\r\nDEFERRED-已递延',
  `reached_limit` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '已达上限：Y,N',
  `reset_current` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当期清零：Y,N',
  `defer_current` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '当期递延：Y,N',
  `total_deferred_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '这可能也要弃用，直接试试聚合递延金额;累计递延金额（上期结余，累计未结算佣金）',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `audit_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `discount_bonus_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '优惠红利金额',
  `discount_bonus_fee` decimal(18, 2) NULL DEFAULT NULL COMMENT '优惠红利费用',
  `deposit_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '存款金额',
  `deposit_fee` decimal(18, 2) NULL DEFAULT NULL COMMENT '存款费用',
  `withdrawal_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '提款金额',
  `withdrawal_fee` decimal(18, 2) NULL DEFAULT NULL COMMENT '提款费用',
  `platform_game_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '平台游戏金额',
  `platform_game_fee` decimal(18, 2) NULL DEFAULT NULL COMMENT '平台游戏费用',
  `manual_adjust_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '人工调整金额',
  `manual_adjust_fee` decimal(18, 2) NULL DEFAULT NULL COMMENT '人工调整费用',
  `valid_bet_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '有效投注金额',
  `member_profit_loss` decimal(18, 2) NULL DEFAULT NULL COMMENT '会员输赢金额',
  `grant_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发放人',
  `grant_time` bigint(20) NULL DEFAULT NULL COMMENT '发放时间',
  `grant_date` date NULL DEFAULT NULL COMMENT '发放日期（统计用）',
  `revoke_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '撤回人',
  `revoke_time` bigint(20) NULL DEFAULT NULL COMMENT '撤回时间',
  `receive_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领取时间',
  `receive_date` date NULL DEFAULT NULL COMMENT '领取日期（统计用）',
  `agent_user_path_index` int(11) NULL DEFAULT NULL COMMENT '代理路径索引位置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12517 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理佣金发放记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_commission_manual_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_commission_manual_log`;
CREATE TABLE `tb_agent_commission_manual_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `settle_start_date` date NULL DEFAULT NULL COMMENT '结算开始日期',
  `settle_end_date` date NULL DEFAULT NULL COMMENT '结算结束日期',
  `commission_group_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '佣金组id',
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态:SUCCESS,FAILED',
  `create_time` bigint(20) NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理佣金手动结算任务' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_fund_audit_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_fund_audit_log`;
CREATE TABLE `tb_agent_fund_audit_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `audit_level` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '审核级别：\r\n一审-FIRST_AUDIT,\r\n二审-SECOND_AUDIT',
  `auditor_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一审审核人',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '审核状态：\r\nWAIT_FIRST_AUDIT-待一审,\r\nFIRST_AUDITING-一审中,\r\nWAIT_SECOND_AUDIT,-待二审,\r\nSECOND_AUDITING-二审中,\r\nAUDIT_APPROVAL-审核通过,\r\nAUDIT_REFUSE-审核拒绝',
  `locked_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一审锁单用户ID',
  `locked_at` bigint(20) NULL DEFAULT NULL COMMENT '一审锁单时间',
  `audit_time` bigint(20) NULL DEFAULT NULL COMMENT '审核完成时间',
  `comments` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '一审意见(后台)',
  `remark` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `comments_vip` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审核意见（会员）',
  `order_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单类型\r\nDEPOSIT-存款,\r\nWITHDRAW-取款,\r\nFUND_ADJUST-资金调整,\r\nCOMMISSION_ISSUE-佣金发放,\r\nBONUS_ISSUE-红利发放',
  `lock_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '锁单状态：\r\nWAIT_AUDIT_LOCK-待锁单,\r\nFIRST_AUDIT_LOCKED-一审锁单,\r\nSECOND_AUDIT_LOCKED-二审锁单;',
  `second_locked_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二审锁单的用户ID',
  `second_locked_at` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二审锁单时间',
  `second_comments` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二审意见(后台)',
  `second_auditor_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二审审核人',
  `withdraw_tag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '撤销标识',
  `auditor_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一审审核人名称',
  `second_auditor_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二审审核人名称',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `deposit_confirm_amount` decimal(16, 8) NULL DEFAULT NULL COMMENT '存款确认金额',
  `deposit_all_amount` decimal(16, 8) NULL DEFAULT NULL COMMENT '存款总金额',
  `deposit_property` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存款性质\r\nFIRST_DEPOSIT-首存;\r\nFIRST_WITHDRAW-首提;\r\nSECOND_DEPOSIT-二存',
  `payment_method` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `third_part_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方code',
  `force_withdraw` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '强制提款',
  `large_amount_withdraw` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '大额提款',
  `cash_back_amount` decimal(16, 8) NULL DEFAULT NULL COMMENT '返现金额',
  `wallet_change_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账变类型(加额类型)：\r\n账变类型(加额类型)：\r\nDEPOSIT-存款,\r\nWITHDRAW-提款,\r\nCOMMISSION-结佣\r\nADJUST_AGENT_DEPOSIT-人工调整-代理存款\r\nADJUST_UPPER_TRANSFER_IN-人工调整-上级转入,\r\nADJUST_COMMISSION_ISSUANCE-人工调整-佣金发放,\r\nADJUST_DEPOSIT_REFUND-人工调整-存款退回,\r\nADJUST_UPPER_TRANSFER_OUT-人工调整-上级转出,\r\nADJUST_COMMISSION_REFUND-人工调整-佣金退回,\r\nADJUST_WITHDRAWAL_REFUND-人工调整-提现退回\r\nTRANSFER_AGENT-代充-代理代充\r\nTRANSFER_MEMBER-代充-会员代充',
  `adjust_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '加额备注',
  `vip_account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账户',
  `order_amount` decimal(16, 2) NULL DEFAULT NULL COMMENT '下单金额',
  `order_time` bigint(20) NULL DEFAULT NULL COMMENT '下单时间',
  `third_part_order_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方订单号',
  `rebate_multiple` decimal(16, 2) NULL DEFAULT NULL COMMENT '流水倍数',
  `wallet_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钱包类型: \r\n额度钱包-CREDIT,\r\n佣金钱包-COMMISSION',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理资金审核记录(可能弃用)' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_fund_deposit_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_fund_deposit_log`;
CREATE TABLE `tb_agent_fund_deposit_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `third_party_order_no` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方订单号',
  `payment_method_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式',
  `third_party_platform_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方平台',
  `order_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '下单金额',
  `confirmed_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '确认金额',
  `audit_time` bigint(20) NULL DEFAULT NULL COMMENT '审核时间',
  `audit_status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态：\r\nSUCCESS-成功,\r\nWAIT_AUDIT-待审核\r\nPENDING-审核中,\r\nREJECTED-已拒绝',
  `locked_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '锁单用户',
  `locked_at` bigint(20) NULL DEFAULT NULL COMMENT '锁单时间',
  `third_party_platform_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方平台code',
  `payment_method_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式code',
  `payment_channel_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方通道',
  `payment_channel_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方通道code',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `agent_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `order_time` bigint(20) NULL DEFAULT NULL COMMENT '订单完成时间',
  `agent_audit_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审核备注（代理）',
  `admin_audit_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审核备注（后台）',
  `third_party_pay_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方支付链接',
  `third_party_order_status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '三方订单状态',
  `order_status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态：\r\nPROCESSING-处理中\r\nSUCCESS-成功\r\nFAILURE-失败',
  `member_fees` decimal(20, 2) NULL DEFAULT NULL COMMENT '会员手续费',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_orderno`(`order_no` ASC) USING BTREE,
  INDEX `create_time_index`(`create_time` ASC, `audit_status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 534 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理存款记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_fund_manual_adjust_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_fund_manual_adjust_log`;
CREATE TABLE `tb_agent_fund_manual_adjust_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `biz_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型：\r\n人工加额-INCREASE;人工减额-DECREASE;其他-OTHER',
  `order_no` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `amount` decimal(20, 2) NULL DEFAULT NULL COMMENT '调整金额',
  `currency` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '货币类型',
  `multiplier` int(11) NULL DEFAULT NULL COMMENT '流水倍数',
  `wallet_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钱包类型: \r\n额度钱包-CREDIT,\r\n佣金钱包-COMMISSION',
  `operation_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作类型：ADD-增加；SUB-减少',
  `wallet_change_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '账变类型：// DEPOSIT - 代理存款, DEPOSIT_FROM_ADJUST - 代理存款(后台), DEPOSIT_FROM_TRANSFER - 代理代存, DEPOSIT_REFUND_FROM_ADJUST - 存款退回(后台), WITHDRAWAL - 代理提款, WITHDRAWAL_FROM_ADJUST - 代理提款(后台), REFUND_FOR_WITHDRAWAL - 提现退回, TRANSFER_FOR_MEMBER - 会员代存, TRANSFER_FOR_AGENT - 代理代存, COMMISSION - 佣金发放, COMMISSION_FROM_ADJUST - 佣金发放(后台), COMMISSION_REFUND_FROM_ADJUST - 佣金退回(后台), REWARD_FROM_PROMOTION - 推广奖励, OTHER_FROM_ADJUST_INCR - 其它人工上分, OTHER_FROM_ADJUST_TRANSFER_IN - 上级转入(后台), OTHER_FROM_ADJUST_DECR - 其它人工下分, OTHER_FROM_ADJUST_TRANSFER_OUT - 上级转出(后台)',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态：\r\nSUCCESS-成功,\r\nWAIT_AUDIT-待审核\r\nPENDING-审核中,\r\nREJECTED-已拒绝',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `audit_time` bigint(20) NULL DEFAULT NULL COMMENT '审核完成时间',
  `order_time` bigint(20) NULL DEFAULT NULL COMMENT '订单完成时间',
  `agent_audit_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审核备注（代理）',
  `admin_audit_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审核备注（后台）',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `locked_by` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '锁单人',
  `locked_at` bigint(20) NULL DEFAULT NULL COMMENT '锁单时间',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40720 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理人工资金调整记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_fund_transfer
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_fund_transfer`;
CREATE TABLE `tb_agent_fund_transfer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `agent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理',
  `wallet_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钱包类型：DEPOSIT-额度钱包；COMMISSION-佣金',
  `transfer_object_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转账对象类型：AGENT-代理，MEMBER-会员',
  `transfer_object` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '转账对象',
  `transfer_amount` decimal(20, 2) NOT NULL COMMENT '转账金额',
  `order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `order_finish_time` bigint(20) NULL DEFAULT NULL COMMENT '订单完成时间',
  `multiple` decimal(20, 2) NULL DEFAULT NULL COMMENT '流水倍数（针对会员）',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `disburse_time` bigint(20) NULL DEFAULT NULL COMMENT '发放时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新者',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_agent_fund_wallet_log_wallet_1_1`(`agent` ASC, `wallet_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 593 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理资金转账（代充）' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_fund_wallet
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_fund_wallet`;
CREATE TABLE `tb_agent_fund_wallet`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `agent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理',
  `wallet_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钱包类型：DEPOSIT-额度钱包；COMMISSION-佣金',
  `balance` decimal(20, 2) NULL DEFAULT NULL COMMENT '余额',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_agent_fund_wallet_agent`(`agent` ASC, `wallet_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41873 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理资金钱包' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_fund_wallet_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_fund_wallet_log`;
CREATE TABLE `tb_agent_fund_wallet_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `agent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理',
  `wallet_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钱包类型：DEPOSIT-额度钱包；COMMISSION-佣金',
  `order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `change_subject` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账变科目：DEPOSIT-存款,WITHDRAWAL-提款,TRANSFER-转账/代充,COMMISSION-佣金,REWARD-红利,OTHER-其他',
  `change_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账变类型：\r\nDEPOSIT-代理存款,\r\nDEPOSIT_FROM_ADJUST-代理存款(后台),\r\nDEPOSIT_REFUND_FROM_ADJUST-存款退回(后台),\r\nWITHDRAWAL-代理提款,\r\nWITHDRAWAL_FROM_ADJUST-代理提款(后台),\r\nWITHDRAWAL_REFUND-提款退回,\r\nWITHDRAWAL_REFUND_FROM_ADJUST-提款退回(后台)\r\n,TRANSFER_IN-上线转入,\r\nTRANSFER_IN_FROM_ADJUST-上线转入(后台),\r\nTRANSFER_OUT_FOR_MEMBER-会员代存,\r\nTRANSFER_OUT_FOR_AGENT-代理代存,\r\nTRANSFER_OUT_FROM_ADJUST-代理转出(后台),\r\nCOMMISSION-佣金发放,\r\nCOMMISSION_FROM_ADJUST-佣金发放(后台),\r\nCOMMISSION_REFUND_FROM_ADJUST-佣金退回(后台),\r\nREWARD_FOR_PROMOTION-推广奖励,\r\nREWARD_FOR_PROMOTION_FROM_ADJUST-推广奖励(后台),\r\nREWARD_REFUND_FROM_ADJUST-奖励退回(后台),\r\nOTHER_INCR_FROM_ADJUST-其它人工上分,\r\nOTHER_DECR_FROM_ADJUST-其它人工下分',
  `change_amount` decimal(20, 2) NOT NULL COMMENT '账变金额',
  `balance_before` decimal(20, 2) NOT NULL COMMENT '账变前余额',
  `balance_after` decimal(20, 2) NOT NULL COMMENT '账变后余额',
  `related_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联订单号',
  `change_time` bigint(20) NULL DEFAULT NULL COMMENT '账变时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新者',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_agent_fund_wallet_log_wallet`(`agent` ASC, `wallet_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2118 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理资金钱包日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_fund_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_fund_withdrawal`;
CREATE TABLE `tb_agent_fund_withdrawal`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `agent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理',
  `wallet_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钱包类型：DEPOSIT-额度钱包；COMMISSION-佣金',
  `payment_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付方式类型',
  `payment_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付方式编码：参考金流配置',
  `payment_channel` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付通道',
  `payment_info` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '支付方式信息（JSON）：银行卡信息/钱包信息/虚拟币信息等',
  `first_withdraw` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否首次提款：Y-是，N-否',
  `amount` decimal(20, 2) NOT NULL COMMENT '提款金额',
  `order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `order_create_time` bigint(20) NOT NULL COMMENT '下单时间',
  `order_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单状态：O1_FIRST_PENDING-待一审, O2_FIRST_LOCKED-一审中, O3_SECOND_PENDING-待二审, O4_SECOND_LOCKED-二审中, O5_APPROVED-通过, O6_REJECTED-拒绝, O7_DISBURSE_PENDING-待出款, O8_DISBURSING-出款中, O9_DISBURSED-已出款',
  `remark_for_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核备注(代理)',
  `first_remark_for_admin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一审审核备注(后台)',
  `first_approver` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一审审核人',
  `first_approval_time` bigint(20) NULL DEFAULT NULL COMMENT '一审审核时间',
  `second_approver` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二审审核人',
  `second_approval_time` bigint(20) NULL DEFAULT NULL COMMENT '二审审核时间',
  `order_approve_time` bigint(20) NULL DEFAULT NULL COMMENT '订单审核完成时间',
  `order_finish_time` bigint(20) NULL DEFAULT NULL COMMENT '完成时间',
  `second_remark_for_admin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二审审核备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新者',
  `create_time` bigint(20) NOT NULL COMMENT '创建时间',
  `update_time` bigint(20) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_agent_fund_wallet_log_wallet_1`(`agent` ASC, `wallet_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理资金提款' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_global_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_global_config`;
CREATE TABLE `tb_agent_global_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `config_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置键',
  `config_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置值：json格式',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_agent_global_config_key`(`config_key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理全局配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_grade
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_grade`;
CREATE TABLE `tb_agent_grade`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `grade` smallint(6) NULL DEFAULT NULL COMMENT '等级',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '等级名称',
  `name_i18n` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '等级多语言',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '等级logo',
  `total_commission` decimal(18, 2) NULL DEFAULT NULL COMMENT '累计佣金',
  `pre_period_effective_add` int(11) NULL DEFAULT NULL COMMENT '上期有效新增数',
  `cur_period_effective_add` int(11) NULL DEFAULT NULL COMMENT '本期有效新增数',
  `extra_commission` decimal(18, 2) NULL DEFAULT NULL COMMENT '额外佣金',
  `create_time` bigint(20) NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ON,OFF',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理等级' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_grade_change_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_grade_change_log`;
CREATE TABLE `tb_agent_grade_change_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `before_grade` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变更前等级名称（和之前会员等级保持一致）',
  `cond_type` smallint(6) NULL DEFAULT NULL COMMENT '类型1升级类型,2降级类型',
  `after_grade` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变更后等级名称（和之前会员等级保持一致）',
  `change_reason` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '变更原因',
  `device_info` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备信息',
  `os_info` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统信息',
  `ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理等级变更记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_grade_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_grade_reward_log`;
CREATE TABLE `tb_agent_grade_reward_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账号',
  `reward_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖金订单号',
  `reward_amount` decimal(18, 2) NULL DEFAULT NULL COMMENT '奖金金额',
  `reward_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖励条件名称',
  `claim_time` bigint(20) NULL DEFAULT NULL COMMENT '领取时间',
  `grade_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理等级名称',
  `grade` int(11) NULL DEFAULT NULL COMMENT '等级',
  `parent_agent_account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级代理账户',
  `claim_status` smallint(6) NULL DEFAULT NULL COMMENT '领取状态0未领取,1已领取,2已失效,3领取失败',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理升级奖励记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_h5_quick_tools
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_h5_quick_tools`;
CREATE TABLE `tb_agent_h5_quick_tools`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理',
  `data_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据',
  `create_time` bigint(20) NULL DEFAULT NULL,
  `creator` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'H5常用工具' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tb_agent_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_info`;
CREATE TABLE `tb_agent_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '电话',
  `region` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家区号',
  `sex` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户性别（M男 W女 UNKNOW未知）',
  `real_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `nickname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `pay_password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付密码',
  `pwd_reset_time` bigint(20) NULL DEFAULT NULL COMMENT '密码重置时间',
  `ppwd_reset_time` bigint(20) NULL DEFAULT NULL COMMENT '支付密码重置时间',
  `salt` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码加密盐',
  `status` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号状态：ON-正常；OFF-停用; LOCKED-锁定',
  `google_validate` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Google验证',
  `secret` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密钥',
  `active` tinyint(1) NULL DEFAULT NULL COMMENT '是否激活',
  `reset_pwd_required` tinyint(1) NULL DEFAULT NULL COMMENT '是否需要重设密码',
  `zalo` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'zalo',
  `facebook` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'facebook',
  `line` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'line',
  `telegram` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'telegram',
  `whatsapp` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'whatsapp',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `remarker` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注人',
  `remark_time` bigint(20) NULL DEFAULT NULL COMMENT '备注时间',
  `register_source` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册来源',
  `register_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册IP',
  `register_time` bigint(20) NOT NULL COMMENT '注册时间',
  `login_source` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录来源',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录IP',
  `login_time` bigint(20) NULL DEFAULT NULL COMMENT '登录时间',
  `online` tinyint(1) NULL DEFAULT NULL COMMENT '是否在线',
  `agent_source` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理来源：REGISTER-注册；TOP_AGENT-总代添加；ADMIN-站长添加',
  `parent_agent_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上级代理',
  `agent_grade` smallint(6) NULL DEFAULT NULL COMMENT '代理等级',
  `agent_schema_id` bigint(20) NULL DEFAULT NULL COMMENT '代理模式ID',
  `commission_group_id` bigint(20) NULL DEFAULT NULL COMMENT '佣金组ID',
  `deposit_wallet_id` bigint(20) NULL DEFAULT NULL COMMENT '额度钱包ID',
  `commission_wallet_id` bigint(20) NULL DEFAULT NULL COMMENT '佣金钱包ID',
  `approver` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核者',
  `approval_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核结果：PENDING-审核中;APPROVED-通过;REJECTED-拒绝',
  `approval_time` bigint(20) NULL DEFAULT NULL COMMENT '审核时间',
  `approval_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审核备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `email_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱状态：NOT_VERIFIED-未验证；VERIFIED-已验证',
  `phone_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机状态：NOT_VERIFIED-未验证；VERIFIED-已验证',
  `security_question` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安保问题',
  `security_answer` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '安保答案',
  `register_domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册域名',
  `register_feature_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册唯一特征码',
  `commission_withdraw_enabled` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提取佣金开关,ENABLE-开启,DISABLE-关闭',
  `parent_agent_user_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '上级代理路径',
  `agent_user_path_index` int(11) NULL DEFAULT NULL COMMENT '代理路径索引位置',
  `register_fp_localid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '注册时设备指纹 local_id',
  `child_max_height` int(11) NULL DEFAULT NULL COMMENT '代理层数(下级最大高度)',
  `offline_days` int(11) NULL DEFAULT NULL COMMENT '未登录天数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_agent_info_phone`(`region` ASC, `phone` ASC) USING BTREE,
  INDEX `idx_agent_info_user_name`(`user_name` ASC) USING BTREE,
  INDEX `idx_agent_user_name`(`user_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40678 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_login_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_login_log`;
CREATE TABLE `tb_agent_login_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `login_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登入IP',
  `browser` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录设备信息',
  `login_status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登入状态: FAIL-失败； SUCCESS-成功',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '登入时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `location` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '地区位置',
  `operating_system` varchar(104) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统详细信息',
  `os_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统名称',
  `os_version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统版本',
  `platform` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'WEB,H5,APP',
  `domain` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `feature_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '唯一特征码',
  `fp_localid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '设备指纹 local_id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8474 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理用户登录日志' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_member_reassign
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_member_reassign`;
CREATE TABLE `tb_agent_member_reassign`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理用户',
  `member` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账户',
  `member_agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员当前代理账号',
  `apply_time` bigint(20) NULL DEFAULT NULL COMMENT '申请时间',
  `apply_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '申请备注',
  `verify_time` bigint(20) NULL DEFAULT NULL COMMENT '验证时间',
  `verify_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '验证状态：NOT_REQUIRED-无需验证；NOT_VERIFIED-未验证；VERIFIED-已验证',
  `verify_ip` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '验证IP',
  `approver` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核者',
  `approval_status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核结果：CANNOT_APPLY-无法申请；CAN_APPLY-可以申请；PENDING-审核中；APPROVED-审核通过；REJECTED-审核拒绝',
  `approval_time` bigint(20) NULL DEFAULT NULL COMMENT '审核时间',
  `approval_remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '审核备注',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 146 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理会员溢出表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_promotion_channel
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_promotion_channel`;
CREATE TABLE `tb_agent_promotion_channel`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `agent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理',
  `channel_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '渠道名称',
  `invite_code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邀请码',
  `link_page` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接页面：HOME-首页，REGISTER-注册页，DEPOSIT-存款页',
  `is_default` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '是否预设:Y-是;N-否',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_agent_promotion_channel_agent`(`agent` ASC, `channel_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21910 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理推广渠道' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_promotion_domain
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_promotion_domain`;
CREATE TABLE `tb_agent_promotion_domain`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `domain` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '域名',
  `domain_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '域名类型：PRIVATE-专属域名, PUBLIC-共用域名',
  `display_side` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '显示端:WEB,H5',
  `link_page` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '链接页面：HOME-首页，REGISTER-注册页',
  `assign_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '指定代理-类型：ALL-所有代理,TOP-所有总代,COMMON-所有一般代理,SPECIFIED-指定代理',
  `specified_agent` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指定代理：类型为SPECIFIED时',
  `recommend_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'N' COMMENT '推荐状态:Y-是;N-否',
  `enable_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y' COMMENT '启用状态:Y-是;N-否',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1027 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理推广域名' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_promotion_material
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_promotion_material`;
CREATE TABLE `tb_agent_promotion_material`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `material_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '素材名称',
  `material_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '素材类型: CONTEST-赛事推广,GAME-游戏推广,ACTIVITY-活动推广,BRAND-品牌推广,APP-APP推广,OTHER-其它',
  `material_i18n` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '素材多语系',
  `enable_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y' COMMENT '启用状态:Y-是;N-否',
  `download_agents` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '下载的代理：英文逗号,分隔',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1074 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理推广素材' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_promotion_material_i18n
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_promotion_material_i18n`;
CREATE TABLE `tb_agent_promotion_material_i18n`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `material_id` bigint(20) NOT NULL COMMENT '素材ID',
  `lang` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '语系',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片标题',
  `image` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片地址',
  `image_width` int(11) NOT NULL COMMENT '图片宽度',
  `image_height` int(11) NOT NULL COMMENT '图片高度',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_agent_promotion_material_i18n`(`material_id` ASC, `lang` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 161 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理推广素材多语系' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_remark_log
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_remark_log`;
CREATE TABLE `tb_agent_remark_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `agent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理',
  `remarker` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注人',
  `remark_time` bigint(20) NOT NULL COMMENT '备注时间',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20503 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理备注历史' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_schema
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_schema`;
CREATE TABLE `tb_agent_schema`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模式名称',
  `settlement_interval` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算周期DAY:日,WEEK:周,MON:月,CUSTOM:自定义',
  `non_profit_settlement` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '无盈利计算NO:不结算,DELAY:延迟',
  `delay_day` smallint(6) NULL DEFAULT NULL COMMENT '递延期数',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ON,OFF',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `agent_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '代理账户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理模式' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_system_notice_i18n
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_system_notice_i18n`;
CREATE TABLE `tb_agent_system_notice_i18n`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `notice_id` bigint(20) NOT NULL COMMENT '内部信id：admin系统的id',
  `lang` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '语言',
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告内容',
  `notice_create_time` bigint(20) NOT NULL COMMENT '公告创建时间',
  `notice_send_time` bigint(20) NOT NULL COMMENT '公告发送时间',
  `notice_receive_time` bigint(20) NOT NULL COMMENT '公告接收时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理系统公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_system_notice_receiver
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_system_notice_receiver`;
CREATE TABLE `tb_agent_system_notice_receiver`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `agent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理',
  `notice_id` bigint(20) NOT NULL COMMENT '内部信id：admin系统的id',
  `read_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '读取状态:Y-是;N-否',
  `read_time` bigint(20) NULL DEFAULT NULL COMMENT '读取时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_agent_system_notice_receiver_agent`(`agent` ASC, `notice_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 992 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理系统公告接收者' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_tags
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_tags`;
CREATE TABLE `tb_agent_tags`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `color` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '颜色',
  `create_time` bigint(20) NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ON,OFF',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理标签' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_tags_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_tags_user`;
CREATE TABLE `tb_agent_tags_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `agent_id` bigint(20) NULL DEFAULT NULL COMMENT '代理id',
  `tag_id` bigint(20) NULL DEFAULT NULL COMMENT '标签id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 587 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理标签用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_virtual
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_virtual`;
CREATE TABLE `tb_agent_virtual`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `agent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理',
  `alias_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户命名',
  `virtual_address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '虚拟币地址',
  `virtual_currency` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '虚拟币种',
  `virtual_protocol` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '虚拟币协议',
  `use_count` int(11) NOT NULL COMMENT '使用次数',
  `enable_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y' COMMENT '启用状态:Y-是;N-否',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `last_use_time` bigint(20) NULL DEFAULT NULL COMMENT '最后一次使用时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_agent_virtual`(`agent` ASC, `virtual_address` ASC) USING BTREE,
  INDEX `idx_member_virtual_address`(`virtual_address` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理虚拟币' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_agent_wallet
-- ----------------------------
DROP TABLE IF EXISTS `tb_agent_wallet`;
CREATE TABLE `tb_agent_wallet`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `agent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '代理',
  `alias_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户命名',
  `wallet_brand` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钱包品牌',
  `wallet_number` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钱包账号',
  `use_count` int(11) NOT NULL COMMENT '使用次数',
  `enable_status` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Y' COMMENT '启用状态:Y-是;N-否',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '备注',
  `last_use_time` bigint(20) NULL DEFAULT NULL COMMENT '最后一次使用时间',
  `creator` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `updater` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_agent_wallet`(`agent` ASC, `wallet_brand` ASC, `wallet_number` ASC) USING BTREE,
  INDEX `idx_member_wallet_wallet`(`wallet_brand` ASC, `wallet_number` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代理钱包' ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
