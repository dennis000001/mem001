/*
 Navicat Premium Dump SQL

 Source Server         : mysql-test
 Source Server Type    : MySQL
 Source Server Version : 80018 (8.0.18)
 Source Host           : abcg-game789789.rwlb.singapore.rds.aliyuncs.com:3306
 Source Schema         : site_activity

 Target Server Type    : MySQL
 Target Server Version : 80018 (8.0.18)
 File Encoding         : 65001

 Date: 13/02/2026 12:01:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_activity
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity`;
CREATE TABLE `tb_activity`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID自增',
  `sort` int(11) NOT NULL COMMENT '排序',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `name_i18n` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '国际化名称JSON串',
  `display_term` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '展示页签',
  `template_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板代码',
  `template_id` bigint(20) NULL DEFAULT NULL COMMENT '模板ID',
  `template_mode` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模板模式',
  `audience_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '面向会员类型',
  `multiplier` decimal(20, 2) NULL DEFAULT NULL,
  `claim_terminal` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领取终端: WEB,H5,APP 以逗号隔开',
  `status` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态,来自系统字典',
  `time_start` bigint(20) NULL DEFAULT NULL COMMENT '开始时间',
  `time_end` bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
  `display_time_start` bigint(20) NULL DEFAULT NULL COMMENT '显示开始时间',
  `display_time_end` bigint(20) NULL DEFAULT NULL COMMENT '显示结束时间',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `order_lock` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '锁单状态：ON-启用；OFF-关闭',
  `time_long` tinyint(5) NULL DEFAULT NULL COMMENT '活动是否长期',
  `display_time_long` tinyint(5) NULL DEFAULT NULL COMMENT '展示时间是否长期',
  `is_display_time_matched` tinyint(5) NULL DEFAULT NULL COMMENT '展示时间与活动时间一致',
  `audience` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_activity_type`(`template_type` ASC) USING BTREE,
  INDEX `idx_activity_id_status`(`id` ASC, `status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2606 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_activity_category
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity_category`;
CREATE TABLE `tb_activity_category`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID自增',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统默认/用户自定义',
  `icon_active` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '激活状态图标',
  `icon_inactive` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '非激活状态图标',
  `status` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型名称',
  `name_i18n` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '国际化名称',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动类型信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_activity_category_relation
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity_category_relation`;
CREATE TABLE `tb_activity_category_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID自增',
  `category_id` bigint(20) NULL DEFAULT NULL COMMENT '分类ID',
  `activity_id` bigint(20) NULL DEFAULT NULL COMMENT '活动ID',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3052 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分类活动关系表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_activity_config
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity_config`;
CREATE TABLE `tb_activity_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `type` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '本条配置类型',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '具体配置',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uq_type`(`type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动全局配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_activity_member
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity_member`;
CREATE TABLE `tb_activity_member`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '会员uid',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `activity_id` bigint(20) NULL DEFAULT NULL COMMENT '活动id',
  `activity_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '活动金额(定时送红包需要用到)',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间，申请时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1880955 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员申请活动记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_activity_member_point_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity_member_point_record`;
CREATE TABLE `tb_activity_member_point_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL COMMENT '会员id',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '会员账号',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `activity_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `complete_event` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '完成事件，枚举',
  `complete_time` bigint(20) NOT NULL COMMENT '完成时间',
  `lucky_point` int(11) NOT NULL COMMENT '幸运点， 事件是幸运转盘时负值',
  `action` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作行为  plus  minus',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `current_bet_total` decimal(20, 2) NULL DEFAULT NULL COMMENT '当前打码',
  `date_time` date NOT NULL COMMENT '日期:yyyy-MM-dd',
  `available_point` int(11) NOT NULL COMMENT '可用幸运点',
  `current_count_bet` decimal(20, 2) NULL DEFAULT NULL COMMENT '本次计算打码量',
  `task_id` bigint(20) NOT NULL COMMENT '任务id',
  `task_time_cycle` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务时间周期',
  `task_cycle_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务所属周期值',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tb_activity_member_point_record_unique`(`uid` ASC, `activity_id` ASC, `date_time` ASC, `complete_event` ASC, `complete_time` ASC, `task_id` ASC) USING BTREE,
  INDEX `tb_activity_member_point_record_create_time_IDX`(`create_time` DESC, `account` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4245 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '幸运转盘--幸运点记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_activity_member_reward
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity_member_reward`;
CREATE TABLE `tb_activity_member_reward`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_lock` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '锁单状态：OFF-未锁；ON-已锁',
  `uid` bigint(20) NOT NULL COMMENT '会员uid',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '会员账号',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `activity_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动名称',
  `activity_template_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动模板代码',
  `activity_mode` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动模式',
  `apply_reward` decimal(20, 2) NOT NULL COMMENT '申请彩金',
  `multiplier` decimal(20, 2) NULL DEFAULT NULL COMMENT '流水倍数',
  `claim_terminal` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请终端',
  `claim_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申领ip',
  `reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '不符合原因',
  `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动状态，来自系统字典',
  `activity_time_start` bigint(20) NULL DEFAULT NULL COMMENT '活动开始时间',
  `activity_time_end` bigint(20) NULL DEFAULT NULL COMMENT '活动结束时间',
  `auditor` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核人',
  `audit_complete_time` bigint(20) NULL DEFAULT NULL COMMENT '审核完成时间',
  `member_remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核备注（会员）',
  `auditor_remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核备注（后台）',
  `dispatcher` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '派发人',
  `dispatch_complete_time` bigint(20) NULL DEFAULT NULL COMMENT '派发完成时间',
  `dispatch_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '派发类型：MANUAL-手动 AUTO-自动',
  `blocking_agent` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拦截人',
  `blocking_time` bigint(20) NULL DEFAULT NULL COMMENT '拦截时间',
  `blocking_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拦截类型：MANUAL-手动 AUTO-自动',
  `rejector` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '拒绝人',
  `rejection_time` bigint(20) NULL DEFAULT NULL COMMENT '拒绝时间',
  `claim_time` bigint(20) NULL DEFAULT NULL COMMENT '领取时间',
  `claim_expiry_time` bigint(20) NULL DEFAULT NULL COMMENT '领取到期时间',
  `claim_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领取类型：按时领取， 过期领取， 过期作废',
  `revoker` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '撤销人',
  `revoke_reward_time` bigint(20) NULL DEFAULT NULL COMMENT '撤销领奖时间',
  `large_amount` tinyint(1) NULL DEFAULT 0 COMMENT '是否大额',
  `reward_mode_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '奖励模式key. 奖金计算方式+奖励指标组合键',
  `reward_process_status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖励处理状态: W-待处理，P-处理中，S-已处理',
  `activity_template_id` bigint(20) NULL DEFAULT NULL COMMENT '活动模板ID',
  `display_time_start` bigint(20) NULL DEFAULT NULL COMMENT '显示开始时间',
  `display_time_end` bigint(20) NULL DEFAULT NULL COMMENT '显示结束时间',
  `reward_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖励单号',
  `related_order_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联订单单号',
  `audit_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '审核状态：PENDING_AUDIT-待审核；APPROVED-审核通过，REJECTED-审核拒绝',
  `wheel_level` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '转盘等级  WHEEL_BASIC--初级  WHEEL_ADVANCED--高级  WHEEL_PREMIUM--特级',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_activity_start_end`(`activity_time_start` ASC, `activity_time_end` ASC) USING BTREE,
  INDEX `idx_reward_order_no`(`reward_order_no` ASC) USING BTREE,
  INDEX `idx_activityId_status`(`activity_id` ASC, `status` ASC) USING BTREE,
  INDEX `idx_uid`(`uid` ASC) USING BTREE,
  INDEX `idx_activity_id_apply_reward`(`activity_id` ASC, `apply_reward` ASC) USING BTREE,
  INDEX `idx_activity_id`(`activity_id` ASC) USING BTREE,
  INDEX `idx_apply_reward`(`apply_reward` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 999281 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'COLUMNAR=1 会员奖励信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_activity_signin_record
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity_signin_record`;
CREATE TABLE `tb_activity_signin_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `activity_id` bigint(20) NOT NULL COMMENT '活动id',
  `member_uid` bigint(20) NOT NULL COMMENT '会员uid',
  `round` int(11) NULL DEFAULT NULL COMMENT '第几个周期 可空',
  `date` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'yyyyMMdd格式 - 当天日期',
  `day_index` int(4) NULL DEFAULT NULL COMMENT '周期内当天index 从1开始排序 第几天',
  `reward_index` int(4) NULL DEFAULT NULL COMMENT '领取到的对应第几天的奖励',
  `method` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签到的方式 MISS未签到 MANUAL手动签到 AUTO自动签到 AUTO_COMP自动补签 MANUAL_COMP手动补签',
  `target_reached` tinyint(1) NULL DEFAULT NULL COMMENT '打码和存款条件是否满足奖励要求',
  `range` int(11) NULL DEFAULT NULL COMMENT '活动区间长度 - 冗余字段',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_activityid_memberid`(`activity_id` ASC, `member_uid` ASC, `round` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 401 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '签到活动记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_activity_template
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity_template`;
CREATE TABLE `tb_activity_template`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '活动模版id',
  `template_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动模版类型，枚举',
  `template_mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动模式，枚举',
  `template_mode_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '活动模式附加信息',
  `template_mode_extra` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '活动模式额外信息',
  `template_deposit_condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模版勾选的存款方式',
  `template_bet_condition` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '模版勾选的游戏场馆',
  `reward_issue_mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '派发方式',
  `reward_claim_mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领取方式',
  `reward_claim_mode_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '领取方式信息，json结构',
  `reward_claim_mode_extra` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '领取方式限制',
  `reward_claim_condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更多申领条件',
  `reward_scheme_mode` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖金计算方法，枚举',
  `reward_scheme_mode_mix` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖金多项取最高开关，全局',
  `reward_scheme_mode_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '奖金配置',
  `reward_scheme_ceiling` decimal(20, 2) NULL DEFAULT NULL COMMENT '奖金上限，全局',
  `display_reminder` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '展示提醒，是否弹窗',
  `display_mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '展示模式',
  `display_mode_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '展示模式信息',
  `reward_claim_layer` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '领取层级',
  `template_activate_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '加入方式，手动或者自动',
  `template_bet_condition_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模版勾选场馆条件',
  `reward_issue_expiry` bigint(20) NULL DEFAULT NULL COMMENT '奖励有效期',
  `reward_scheme_mode_subtract` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖金扣除优惠开关，全局',
  `reward_claim_repeatable` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '奖金是否可以多笔重复领取，开关',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2792 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动模版配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_activity_template_i18n
-- ----------------------------
DROP TABLE IF EXISTS `tb_activity_template_i18n`;
CREATE TABLE `tb_activity_template_i18n`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `template_id` int(11) NOT NULL COMMENT '关联的活动模版id',
  `lang` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '语言标识（如 zh、en、vi）',
  `display_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主展示内容',
  `display_content_h5` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '主展示内容 H5',
  `display_rule` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '展示规则说明',
  `display_rule_h5` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '展示规则说明 H5',
  `display_detail` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '展示详情说明',
  `display_detail_h5` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '展示详情说明 H5',
  `display_banner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'banner 图路径或资源标识',
  `creator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `create_time` bigint(20) NULL DEFAULT NULL COMMENT '创建时间',
  `updater` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `update_time` bigint(20) NULL DEFAULT NULL COMMENT '更新时间',
  `display_banner_inner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内页banner',
  `display_platform_list` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发布端(JSON格式[\"WEB\",\"H5\"])',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_template_id_lang`(`template_id` ASC, `lang` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14775 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '活动模版国际化信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_images_setting
-- ----------------------------
DROP TABLE IF EXISTS `tb_images_setting`;
CREATE TABLE `tb_images_setting`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` smallint(6) NULL DEFAULT NULL COMMENT '1页面横幅,2注册广告,3侧边栏广告,4进站弹窗广告,5浮动广告6,游戏广告',
  `theme` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主题',
  `show_scene` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '展示场景',
  `show_platform` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '展示端',
  `show_index` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '显示页面',
  `show_position` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '展示位置A(左上),B(右上),C(左下),D(右下)',
  `sort` smallint(6) NULL DEFAULT NULL COMMENT '排序',
  `interaction_setting` smallint(6) NULL DEFAULT NULL COMMENT '交互设定1不支持,2外链,3站内链,4弹窗',
  `open_model` smallint(6) NULL DEFAULT NULL COMMENT '打开模式1跳转页面,2打开新窗口',
  `inner_page_path` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内部指定页面path',
  `out_href_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '外部跳转链接',
  `show_start_time` bigint(20) NULL DEFAULT NULL COMMENT '展示开始时间',
  `show_end_time` bigint(20) NULL DEFAULT NULL COMMENT '展示结束时间',
  `status` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `game_category_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏品类code',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 398 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '图片设置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for tb_images_setting_i18n
-- ----------------------------
DROP TABLE IF EXISTS `tb_images_setting_i18n`;
CREATE TABLE `tb_images_setting_i18n`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ist_id` bigint(20) NULL DEFAULT NULL COMMENT '图片设置id',
  `lang` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '多语言',
  `web_img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'web图片',
  `h5_img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'h5图片',
  `web_prompt_text` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `web_pop_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'web弹窗标题',
  `web_pop_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'web弹窗内容',
  `web_button_text` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'web按钮文案',
  `creator` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` bigint(20) NULL DEFAULT NULL,
  `updater` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` bigint(20) NULL DEFAULT NULL,
  `h5_prompt_text` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `h5_pop_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'h5弹窗标题',
  `h5_pop_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'h5弹窗内容',
  `h5_button_text` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'h5按钮文案',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1054 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '图片设置多语言' ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
