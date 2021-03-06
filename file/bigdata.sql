/*
Navicat MySQL Data Transfer

Source Server         : 162.16.4.9
Source Server Version : 50714
Source Host           : 162.16.4.9:3306
Source Database       : bigdata

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-10-11 16:35:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for oozie_task
-- ----------------------------
DROP TABLE IF EXISTS `oozie_task`;
CREATE TABLE `oozie_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) NOT NULL,
  `exec_date` datetime DEFAULT NULL,
  `task_status` int(11) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_oozie_task_name` (`task_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oozie_task
-- ----------------------------
INSERT INTO `oozie_task` VALUES ('1', 'shell-wf', '2018-08-30 09:17:31', '1', 'test', '2018-08-30 10:12:09');
INSERT INTO `oozie_task` VALUES ('2', 'shell-wf2', '2018-08-30 09:17:31', '1', 'test', '2018-08-30 15:43:13');
INSERT INTO `oozie_task` VALUES ('3', 'shell-wf3', '2018-08-30 09:17:31', '0', 'test', '2018-08-30 09:17:35');
INSERT INTO `oozie_task` VALUES ('4', 'shell-wf4', '2018-08-30 09:17:31', '0', 'test', '2018-08-30 09:17:35');

-- ----------------------------
-- Table structure for sys_btn_res
-- ----------------------------
DROP TABLE IF EXISTS `sys_btn_res`;
CREATE TABLE `sys_btn_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '类型',
  `group_code` varchar(50) NOT NULL COMMENT '所属组编码，后续可根据组编码获取类似有权访问的下拉列表',
  `name` varchar(100) NOT NULL COMMENT '显示名称',
  `code` varchar(50) DEFAULT NULL COMMENT '编码',
  `value` varchar(255) DEFAULT NULL COMMENT '对应值',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_btn_res_group_code` (`group_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_btn_res
-- ----------------------------
INSERT INTO `sys_btn_res` VALUES ('1', '1', '1001', '工薪贷', '100101', '1101', '工薪贷产品', '2018-10-11 10:28:58');
INSERT INTO `sys_btn_res` VALUES ('2', '1', '1001', '装修贷', '100102', '3101', '装修贷产品', '2018-10-11 10:28:58');
INSERT INTO `sys_btn_res` VALUES ('3', '1', '1001', '学子贷', '100103', '2101', '学子贷产品', '2018-10-11 10:28:58');
INSERT INTO `sys_btn_res` VALUES ('4', '1', '1002', '长沙银行', '100201', 'BCS', '长沙银行支付渠道', '2018-10-11 10:28:58');
INSERT INTO `sys_btn_res` VALUES ('5', '1', '1002', '农业银行', '100202', 'ABC', '农业银行支付渠道', '2018-10-11 10:28:58');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增ID',
  `par_dept_code` varchar(50) NOT NULL DEFAULT '0' COMMENT '上级部门编码',
  `dept_code` varchar(50) NOT NULL COMMENT '部门编码（按照两位一级部门设置编码，从00-99）',
  `dept_name` varchar(100) NOT NULL COMMENT '部门名称',
  `mark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `mobile_phone` varchar(15) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(255) DEFAULT NULL COMMENT '电子邮箱',
  `leader` varchar(50) DEFAULT NULL COMMENT '负责人',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uni_sys_dept_code` (`dept_code`) USING BTREE COMMENT '系统部门编码唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '0', '01', '科技部', '长银五八信息科技部', '18888888888', '88888888@hncy58.com', '瞿乐湘', null, null);
INSERT INTO `sys_dept` VALUES ('2', '01', '0101', '开发中心', null, '110', '110@hncy58.com', '李妮科', null, null);
INSERT INTO `sys_dept` VALUES ('3', '02', '0102', '运维中心', '', '112', '112@hncy58.com', '鲁健翔', null, null);
INSERT INTO `sys_dept` VALUES ('4', '03', '0104', 'AJAX测试部门', '', '119', '119@hncy58.com', '瞿乐湘', null, null);

-- ----------------------------
-- Table structure for sys_res
-- ----------------------------
DROP TABLE IF EXISTS `sys_res`;
CREATE TABLE `sys_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '-1: 没有父节点',
  `res_type` int(11) NOT NULL DEFAULT '1' COMMENT '资源类型：0：根节点，1：菜单，2: 虚拟菜单，3：接口',
  `res_name` varchar(255) NOT NULL,
  `res_uri` varchar(255) DEFAULT NULL,
  `rank` int(11) NOT NULL DEFAULT '1' COMMENT '资源排序优先级，越低优先级越高',
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `mark` varchar(255) DEFAULT NULL,
  `res_icon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=267 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_res
-- ----------------------------
INSERT INTO `sys_res` VALUES ('1', '0', '0', '根节点', 'overview', '1', '2018-08-23 15:24:49', '2018-08-24 12:03:09', '', 'dashboard');
INSERT INTO `sys_res` VALUES ('2', '1', '1', '今日概览', 'overview', '1', '2018-08-23 15:25:40', '2018-08-24 09:37:37', '实施进件、授信、借款情况', 'dashboard');
INSERT INTO `sys_res` VALUES ('3', '1', '1', '客户中心', 'customer', '2', '2018-08-23 15:26:38', '2018-08-24 09:37:37', '用户模块', 'component');
INSERT INTO `sys_res` VALUES ('4', '1', '1', '报表中心', 'reports', '3', '2018-08-23 15:27:24', '2018-08-28 09:59:21', '报表（T+1）', 'chart');
INSERT INTO `sys_res` VALUES ('5', '1', '1', '系统管理', 'system', '4', '2018-08-23 18:26:19', '2018-08-27 12:48:27', '用户、角色、资源、审计管理 ', 'lock');
INSERT INTO `sys_res` VALUES ('6', '2', '1', '申请环节', 'applyment', '2', '2018-08-23 15:24:46', '2018-08-24 09:37:38', null, 'edit');
INSERT INTO `sys_res` VALUES ('7', '2', '1', '借款环节', 'loan', '3', '2018-08-23 15:24:45', '2018-09-06 11:27:02', '', 'clipboard');
INSERT INTO `sys_res` VALUES ('8', '3', '1', '客户概览', 'fullview', '1', '2018-08-23 15:24:40', '2018-08-28 09:46:21', '', 'example');
INSERT INTO `sys_res` VALUES ('9', '3', '1', '客户查询', 'personas', '2', '2018-08-23 15:24:38', '2018-08-28 09:46:31', '', 'peoples');
INSERT INTO `sys_res` VALUES ('10', '3', '1', '客户画像', 'single', '4', '2018-08-23 15:24:37', '2018-08-24 09:37:38', null, 'people');
INSERT INTO `sys_res` VALUES ('11', '4', '1', '风控报表', 'risk', '2', '2018-08-23 15:43:11', '2018-08-24 09:37:38', null, 'guide');
INSERT INTO `sys_res` VALUES ('12', '4', '1', '运营报表', 'operate', '1', '2018-08-23 15:24:32', '2018-08-28 09:46:47', '', 'drag');
INSERT INTO `sys_res` VALUES ('13', '4', '1', '财务报表', 'profit', '3', '2018-08-23 15:24:31', '2018-08-28 09:47:10', '', 'money');
INSERT INTO `sys_res` VALUES ('14', '4', '1', 'HR报表', 'hr', '4', '2018-08-23 15:24:30', '2018-08-28 09:47:02', '', 'peoples');
INSERT INTO `sys_res` VALUES ('15', '11', '1', '报表概览', 'fullview', '1', '2018-08-23 15:24:28', '2018-08-24 09:37:38', null, 'example');
INSERT INTO `sys_res` VALUES ('16', '11', '1', '风控授信报表', 'table', '2', '2018-08-23 15:24:27', '2018-08-28 09:47:59', '', 'table');
INSERT INTO `sys_res` VALUES ('17', '12', '1', '报表概览', 'fullview', '1', '2018-08-23 15:24:26', '2018-08-24 09:37:38', null, 'example');
INSERT INTO `sys_res` VALUES ('18', '12', '1', '每日新增余额', 'balance', '3', '2018-08-23 15:24:25', '2018-08-28 09:47:48', '', 'money');
INSERT INTO `sys_res` VALUES ('19', '12', '1', '运营报表', 'table', '2', '2018-08-23 15:24:24', '2018-08-28 09:47:39', '', 'table');
INSERT INTO `sys_res` VALUES ('20', '13', '1', '报表概览', 'fullview', '1', '2018-08-23 15:24:22', '2018-08-24 09:37:38', null, 'example');
INSERT INTO `sys_res` VALUES ('21', '13', '1', '创利报表', 'table', '2', '2018-08-23 15:24:20', '2018-08-28 09:47:24', '', 'table');
INSERT INTO `sys_res` VALUES ('22', '13', '1', '基础数据', 'base', '3', '2018-08-23 15:24:19', '2018-08-31 11:03:51', '', 'table');
INSERT INTO `sys_res` VALUES ('24', '14', '1', '报表概览', 'fullview', '1', '2018-08-23 15:24:17', '2018-08-24 09:37:38', null, 'example');
INSERT INTO `sys_res` VALUES ('25', '14', '1', 'HR报表', 'table', '2', '2018-08-23 15:24:16', '2018-08-28 09:48:54', '', 'table');
INSERT INTO `sys_res` VALUES ('26', '5', '1', '用户管理', 'user', '1', '2018-08-23 18:25:35', '2018-08-24 09:37:38', '用户资源管理 ', 'peoples');
INSERT INTO `sys_res` VALUES ('27', '5', '1', '角色管理', 'role', '2', '2018-08-23 15:29:25', '2018-08-24 09:37:38', '角色管理', 'people');
INSERT INTO `sys_res` VALUES ('28', '5', '1', '菜单管理', 'menu', '3', '2018-08-23 15:28:53', '2018-08-24 09:37:38', '菜单资源权限管理', 'list');
INSERT INTO `sys_res` VALUES ('44', '5', '1', '接口管理', 'interface', '4', '2018-08-23 19:24:16', '2018-08-25 10:03:48', '接口资源管理', 'icon');
INSERT INTO `sys_res` VALUES ('45', '5', '1', '审计管理', 'audit', '5', '2018-08-23 19:24:59', '2018-08-24 16:27:59', '审计查看 ', 'edit');
INSERT INTO `sys_res` VALUES ('49', '57', '3', '风控系统接口1', 'www.baidu.com', '0', '2018-08-24 11:43:35', '2018-08-27 14:33:11', '风控接口菜单1', null);
INSERT INTO `sys_res` VALUES ('51', '57', '3', '风控接口2', 'www.sohu.com', '0', '2018-08-24 12:42:54', '2018-08-27 14:33:11', '测试', null);
INSERT INTO `sys_res` VALUES ('58', '9', '3', '客户中心-客户查询-根据关键词查询客户信息', '/backbond/api/v1/personas/getCustomerByKeyword', '0', '2018-08-27 11:11:33', '2018-08-28 09:40:02', 'keyword 关键词\npageSize 页大小\npageNo 页码（从1开始）', null);
INSERT INTO `sys_res` VALUES ('59', '6', '3', '今日进件列表', '/backbond/api/v1/board/applyList', '0', '2018-08-27 11:13:34', '2018-08-28 09:34:30', '', null);
INSERT INTO `sys_res` VALUES ('60', '10', '3', '客户中心-客户画像-根据客户身份证号查询客户信息', '/backbond/api/v1/personas/getCustomerByCertId', '0', '2018-08-27 11:14:45', '2018-08-28 09:41:07', 'cert_id 身份证ID', null);
INSERT INTO `sys_res` VALUES ('61', '6', '3', '今日申请授信列表', '/backbond/api/v1/board/applyAcceptList', '0', '2018-08-27 11:14:56', '2018-08-28 09:34:30', '', null);
INSERT INTO `sys_res` VALUES ('62', '6', '3', '今日申请授信拒绝总数列表', '/backbond/api/v1/board/applyRejectList', '0', '2018-08-27 11:16:10', '2018-08-28 09:34:30', '', null);
INSERT INTO `sys_res` VALUES ('63', '10', '3', '客户中心-客户画像-获取客户关系图谱信息', '/backbond/api/v1/personas/getCustomerRelationShip', '0', '2018-08-27 11:16:35', '2018-08-28 09:41:07', 'param：cert_id', null);
INSERT INTO `sys_res` VALUES ('64', '6', '3', '今日申请授信状态列表', '/backbond/api/v1/board/applyStat', '0', '2018-08-27 11:17:25', '2018-08-28 09:34:30', '', null);
INSERT INTO `sys_res` VALUES ('65', '8', '3', '客户中心-客户概览-地区分布情况', '/backbond/api/v1/personas/getCityCodeStatistical', '0', '2018-08-27 11:17:55', '2018-08-28 09:43:07', '', null);
INSERT INTO `sys_res` VALUES ('66', '8', '3', '客户中心-客户概览-获取客户总数接口 注册客户总数 授信客户总数 贷款客户总数', '/backbond/api/v1/personas/getCustomerCntAllStatistical', '0', '2018-08-27 11:18:47', '2018-08-28 09:43:07', '', null);
INSERT INTO `sys_res` VALUES ('67', '6', '3', '今日概览申请情况概要', '/backbond/api/v1/board/applyOverview', '0', '2018-08-27 11:18:53', '2018-08-28 09:34:30', '', null);
INSERT INTO `sys_res` VALUES ('68', '6', '3', '申请界面实时统计实时进件表前N位', '/backbond/api/v1/board/applyTopN', '0', '2018-08-27 11:19:55', '2018-08-28 09:34:30', '', null);
INSERT INTO `sys_res` VALUES ('69', '8', '3', '客户中心-客户概览-渠道分布情况', '/backbond/api/v1/personas/getChannelCodeStatistical', '0', '2018-08-27 11:20:17', '2018-08-28 09:43:07', '', null);
INSERT INTO `sys_res` VALUES ('70', '8', '3', '客户中心-客户概览-学历分布情况', '/backbond/api/v1/personas/getHighestDegreeStatistical', '0', '2018-08-27 11:21:15', '2018-08-28 09:43:07', '', null);
INSERT INTO `sys_res` VALUES ('71', '8', '3', '客户中心-客户概览-年龄分布情况', '/backbond/api/v1/personas/getAgeSegmentStatistical', '0', '2018-08-27 11:21:55', '2018-08-28 09:43:07', '', null);
INSERT INTO `sys_res` VALUES ('72', '6', '3', '今日概览申请界面进件渠道分布列表', '/backbond/api/v1/board/applyChannelStat', '0', '2018-08-27 11:22:17', '2018-08-28 09:34:30', '', null);
INSERT INTO `sys_res` VALUES ('73', '8', '3', '客户中心-客户概览-所属行业分布情况', '/backbond/api/v1/personas/getIndustryStatistical', '0', '2018-08-27 11:22:37', '2018-08-28 09:43:07', '', null);
INSERT INTO `sys_res` VALUES ('74', '6', '3', '今日概览申请界面客户经理分布列表', '/backbond/api/v1/board/applyIntroducerStat', '0', '2018-08-27 11:23:07', '2018-08-28 09:34:30', '', null);
INSERT INTO `sys_res` VALUES ('75', '8', '3', '客户中心-客户概览-注册客户每月数据统计', '/backbond/api/v1/personas/getCustomerRegisterTotalCntMonthStatistical', '0', '2018-08-27 11:23:54', '2018-08-28 09:43:07', '', null);
INSERT INTO `sys_res` VALUES ('76', '6', '3', '今日概览申请界面地区分布列表Top10', '/backbond/api/v1/board/applyAddrStat', '0', '2018-08-27 11:24:00', '2018-08-28 09:34:30', '', null);
INSERT INTO `sys_res` VALUES ('77', '8', '3', '客户中心-客户概览-授信客户每月数据统计', '/backbond/api/v1/personas/getCustomerCreditCntMonthStatistical', '0', '2018-08-27 11:24:35', '2018-08-28 09:43:07', '', null);
INSERT INTO `sys_res` VALUES ('78', '7', '3', '今日概览借款概要数据', '/backbond/api/v1/board/loanOverview', '0', '2018-08-27 11:25:01', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('79', '8', '3', '客户中心-客户概览-贷款客户每月数据统计', '/backbond/api/v1/personas/getCustomerBorrowCntMonthStatistical', '0', '2018-08-27 11:25:13', '2018-08-28 09:43:07', '', null);
INSERT INTO `sys_res` VALUES ('80', '7', '3', '今日概览借款界面实时曲线（借款笔数、借款金额）', '/backbond/api/v1/board/loanStat', '0', '2018-08-27 11:26:12', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('81', '129', '3', '公共接口-系统展示', '/backbond/api/v1/common/dict/getDict', '0', '2018-08-27 11:26:39', '2018-09-18 19:42:26', '获取字典数据 ', null);
INSERT INTO `sys_res` VALUES ('82', '7', '3', '今日概览借款界面借据表TopN', '/backbond/api/v1/board/loanTopN', '0', '2018-08-27 11:27:08', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('83', '25', '3', '报表中心-HR报表-按业务利率汇总报表', '/backbond/api/v1/rpt/hr/hrStatisticalByIntroducerAndRate', '0', '2018-08-27 11:27:38', '2018-09-04 17:24:44', '', null);
INSERT INTO `sys_res` VALUES ('84', '7', '3', '今日概览借款界面渠道分布数据', '/backbond/api/v1/board/loanChannelStat', '0', '2018-08-27 11:27:58', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('85', '24', '3', '报表中心-HR报表-查询营销人员统计业务汇总，统计到指定日期的业务数据', '/backbond/api/v1/rpt/hr/hrStatisticalOverviewByIntroducer', '0', '2018-08-27 11:28:20', '2018-09-04 17:24:34', '', null);
INSERT INTO `sys_res` VALUES ('86', '7', '3', '今日概览借款界面客户经理分布', '/backbond/api/v1/board/loanIntroducerStat', '0', '2018-08-27 11:28:23', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('87', '24', '3', '报表中心-HR报表-查询按照利率分组统计客户总数和客户授信总额数据', '/backbond/api/v1/rpt/hr/getHRStatisticalOverviewByRate', '0', '2018-08-27 11:28:58', '2018-09-04 17:24:34', '@param startDt 开始日期（参数格式:yyyymmdd) @param endDt 结束日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('88', '7', '3', '今日概览借款界面地区分布', '/backbond/api/v1/board/loanAddrStat', '0', '2018-08-27 11:29:30', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('89', '7', '3', '今日借款一览表', '/backbond/api/v1/board/loanList', '0', '2018-08-27 11:30:05', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('90', '19', '3', '报表中心-运营报表-运营全量授信报表', '/backbond/api/v1/rpt/operate/allCreditReport', '0', '2018-08-27 11:31:20', '2018-08-27 15:08:20', '@param startDt 开始日期（参数格式:yyyymmdd)\n@param endDt 结束日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('91', '18', '3', '报表中心-运营报表-每日新增余额报表', '/backbond/api/v1/rpt/operate/getDailyBalanceReport', '0', '2018-08-27 11:32:10', '2018-08-27 15:08:00', 'param buzDt 开始日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('92', '17', '3', '报表中心-运营报表-报表概览', '/backbond/api/v1/rpt/operate/ccsBizSummaryOverview', '0', '2018-08-27 11:33:27', '2018-08-27 15:07:47', '@param batchDt 批量日期\n@param accuType 累计类型 M|月累计Q|季累计Y|年累计', null);
INSERT INTO `sys_res` VALUES ('93', '7', '3', '今日授信1小时一览表', '/backbond/api/v1/board/loan1HourList', '0', '2018-08-27 11:34:33', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('94', '20', '3', '报表中心-财务报表-报表概览-客户创利TOP10数据', '/backbond/api/v1/rpt/profit/createProfitTopNByCustomer', '0', '2018-08-27 11:34:57', '2018-09-19 09:23:38', '@param startDt 开始日期（参数格式:yyyymmdd)\n @param endDt 结束日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('95', '7', '3', '今日授信4小时一览表', '/backbond/api/v1/board/loan4HourList', '0', '2018-08-27 11:34:57', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('96', '7', '3', '今日授信24小时一览表', '/backbond/api/v1/board/loan24HourList', '0', '2018-08-27 11:35:21', '2018-08-28 09:34:57', '', null);
INSERT INTO `sys_res` VALUES ('97', '20', '3', '报表中心-创利报表-按照营销人员统计利润TOP10', '/backbond/api/v1/rpt/profit/createProfitTopNByIntroducer', '0', '2018-08-27 11:36:17', '2018-09-19 09:23:38', 'param startDt 开始日期（参数格式:yyyymmdd)\n@param endDt 结束日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('99', '21', '3', '报表中心-财务报表-创利报表-创利客户级报表数据', '/backbond/api/v1/rpt/profit/createProfitByCustomer', '0', '2018-08-27 11:38:00', '2018-08-27 15:05:53', 'param startDt 开始日期（参数格式:yyyymmdd) param endDt 结束日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('100', '21', '3', '报表中心-财务报表-创利报表-创利借据级报表数据', '/backbond/api/v1/rpt/profit/createProfitByLoan', '0', '2018-08-27 11:39:12', '2018-08-27 15:05:53', 'param startDt 开始日期（参数格式:yyyymmdd)\nparam endDt 结束日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('101', '22', '3', '报表中心-财务报表-查询客户级基础数据', '/backbond/api/v1/rpt/profit/profitCertId', '0', '2018-08-27 11:40:11', '2018-08-31 11:04:19', 'busiDate 业务日期,（参数格式:yyyyMMdd)\ncertId 身份证号（可选）', null);
INSERT INTO `sys_res` VALUES ('102', '22', '3', '报表中心-财务报表-借据级基础数据', '/backbond/api/v1/rpt/profit/profitBillno', '0', '2018-08-27 11:41:15', '2018-08-31 11:04:19', 'busiDate 业务日期,（参数格式:yyyyMMdd)\ncertId 身份证号（可选）\n billno 借据号（可选）', null);
INSERT INTO `sys_res` VALUES ('120', '21', '3', '报表中心-财务报表-下载客户级创利报表数据', '/backbond/api/v1/rpt/profit/exportCreateProfitByCustomer', '0', '2018-08-27 14:37:34', '2018-08-27 15:05:53', 'param startDt 开始日期（参数格式:yyyymmdd)\n@param endDt 结束日期（参数格式:yyyymmdd)\n@param introducer 营销人员（可选）', null);
INSERT INTO `sys_res` VALUES ('121', '21', '3', '报表中心-财务报表-下载借据级创利报表数据', '/backbond/api/v1/rpt/profit/exportCreateProfitByLoan', '0', '2018-08-27 14:38:54', '2018-08-27 15:05:53', '', null);
INSERT INTO `sys_res` VALUES ('123', '25', '3', '报表中心-HR报表-按照营销人员、利率分组,下载客户总数和授信总额数据', '/backbond/api/v1/rpt/hr/exportHRStatisticalByIntroducerAndRate', '0', '2018-08-27 14:57:30', '2018-09-04 17:24:44', '', null);
INSERT INTO `sys_res` VALUES ('124', '19', '3', '报表中心-运营报表-下载运营全量授信报表', '/backbond/api/v1/rpt/operate/exportAllCreditReport', '0', '2018-08-27 14:58:28', '2018-08-27 15:08:20', '', null);
INSERT INTO `sys_res` VALUES ('126', '57', '1', '测试1', 'user', '100', '2018-08-28 09:26:43', '2018-08-28 09:26:43', '', 'bug');
INSERT INTO `sys_res` VALUES ('127', '9', '3', '客户中心-客户查询-根据客户身份证号查询客户信息', '/backbond/api/v1/personas/getCustomerByCertId', '0', '2018-08-28 09:37:37', '2018-08-28 09:40:02', '', null);
INSERT INTO `sys_res` VALUES ('128', '9', '3', '客户中心-客户查询-获取客户关系图谱信息', '/backbond/api/v1/personas/getCustomerRelationShip', '0', '2018-08-28 09:37:59', '2018-08-28 09:40:02', '', null);
INSERT INTO `sys_res` VALUES ('129', '1', '2', '公共接口', 'null', '100', '2018-08-28 09:44:01', '2018-09-17 17:19:36', '', 'component');
INSERT INTO `sys_res` VALUES ('131', '130', '1', '123', '123', '100', '2018-08-28 10:01:45', '2018-08-28 10:04:01', '', 'chart');
INSERT INTO `sys_res` VALUES ('132', '130', '1', '333', '123', '100', '2018-08-28 10:01:54', '2018-08-28 10:04:51', '', 'chart');
INSERT INTO `sys_res` VALUES ('133', '130', '1', '333', '123', '100', '2018-08-28 10:01:55', '2018-08-28 10:01:55', '', 'chart');
INSERT INTO `sys_res` VALUES ('135', '12', '1', '报表概览2', 'fullview2', '1', '2018-08-28 15:38:26', '2018-08-28 15:38:26', '', 'dashboard');
INSERT INTO `sys_res` VALUES ('137', '2', '1', '首页', 'mainpage', '4', '2018-08-28 16:29:22', '2018-08-28 16:30:41', '新增首页，暂时放这', 'money');
INSERT INTO `sys_res` VALUES ('151', '12', '1', '新增余额表', 'newBalance', '100', '2018-08-29 09:03:20', '2018-08-29 09:03:20', '', 'money');
INSERT INTO `sys_res` VALUES ('152', '11', '1', '风控信贷报表', 'credit', '100', '2018-08-30 10:10:54', '2018-08-30 10:13:55', '', 'table');
INSERT INTO `sys_res` VALUES ('153', '11', '1', '风控逾期报表', 'overdue', '100', '2018-08-30 10:57:48', '2018-08-30 10:57:48', '', 'table');
INSERT INTO `sys_res` VALUES ('154', '129', '3', '公共接口-用户登录', '/local/api/user/getByToken', '0', '2018-08-31 10:16:35', '2018-09-18 19:42:26', '获取用户个人信息', null);
INSERT INTO `sys_res` VALUES ('155', '129', '3', '公共接口-用户登录', '/local/api/user/updatePWDByToken', '0', '2018-08-31 10:17:24', '2018-09-18 19:42:26', '设置个人密码', null);
INSERT INTO `sys_res` VALUES ('156', '26', '3', '系统管理-用户管理', '/local/api/user/select', '0', '2018-08-31 10:24:27', '2018-08-31 10:28:29', '获取用户列表', null);
INSERT INTO `sys_res` VALUES ('157', '26', '3', '系统管理-用户管理', '/local/api/user/getRoleByUserId', '0', '2018-08-31 10:24:53', '2018-08-31 10:28:29', '请求获取用户角色信息', null);
INSERT INTO `sys_res` VALUES ('158', '26', '3', '系统管理-用户管理', '/local/api/user/add', '0', '2018-08-31 10:25:18', '2018-08-31 10:28:29', '创建用户', null);
INSERT INTO `sys_res` VALUES ('159', '26', '3', '系统管理-用户管理', '/local/api/user/update', '0', '2018-08-31 10:25:32', '2018-08-31 10:28:29', '更新用户信息', null);
INSERT INTO `sys_res` VALUES ('160', '26', '3', '系统管理-用户管理', '/local/api/user/delete', '0', '2018-08-31 10:25:53', '2018-08-31 10:28:29', '删除用户', null);
INSERT INTO `sys_res` VALUES ('161', '26', '3', '系统管理-用户管理', '/local/api/role/all', '0', '2018-08-31 10:27:02', '2018-08-31 10:28:29', '获取所有角色列表', null);
INSERT INTO `sys_res` VALUES ('162', '27', '3', '系统管理-角色管理', '/local/api/role/select', '0', '2018-08-31 10:32:04', '2018-08-31 10:39:52', '获取角色列表', null);
INSERT INTO `sys_res` VALUES ('163', '27', '3', '系统管理-角色管理', '/local/api/role/add', '0', '2018-08-31 10:32:48', '2018-08-31 10:39:52', '创建角色', null);
INSERT INTO `sys_res` VALUES ('164', '27', '3', '系统管理-角色管理', '/local/api/role/update', '0', '2018-08-31 10:33:09', '2018-08-31 10:39:52', '更新角色', null);
INSERT INTO `sys_res` VALUES ('165', '27', '3', '系统管理-角色管理', '/local/api/role/delete', '0', '2018-08-31 10:36:27', '2018-08-31 10:39:52', '删除角色', null);
INSERT INTO `sys_res` VALUES ('166', '27', '3', '系统管理-角色管理', '/local/api/role/getResourceByRoleId', '0', '2018-08-31 10:36:58', '2018-08-31 10:39:52', '通过角色获取资源列表', null);
INSERT INTO `sys_res` VALUES ('167', '27', '3', '系统管理-角色管理', '/local/api/role/linkRes', '0', '2018-08-31 10:37:25', '2018-08-31 10:39:52', '关联用户-角色', null);
INSERT INTO `sys_res` VALUES ('168', '27', '3', '系统管理-角色管理', '/local/api/auth/menu/getAll', '0', '2018-08-31 10:38:00', '2018-08-31 10:39:52', '获取菜单树', null);
INSERT INTO `sys_res` VALUES ('169', '13', '1', '资产负债表', 'balanceSheet', '100', '2018-08-31 10:39:29', '2018-08-31 10:45:39', '', 'table');
INSERT INTO `sys_res` VALUES ('170', '13', '1', '利润表', 'profitStatement', '100', '2018-08-31 10:40:38', '2018-08-31 10:45:24', '', 'table');
INSERT INTO `sys_res` VALUES ('171', '28', '3', '系统管理-菜单管理', '/local/api/auth/menu/getAll', '0', '2018-08-31 10:41:48', '2018-08-31 10:45:32', '获取菜单树', null);
INSERT INTO `sys_res` VALUES ('172', '28', '3', '系统管理-菜单管理', '/local/api/res/select', '0', '2018-08-31 10:42:07', '2018-08-31 10:45:32', '获取菜单项（数组）', null);
INSERT INTO `sys_res` VALUES ('173', '28', '3', '系统管理-菜单管理', '/local/api/res/add', '0', '2018-08-31 10:42:31', '2018-08-31 10:45:32', '创建菜单项', null);
INSERT INTO `sys_res` VALUES ('174', '28', '3', '系统管理-菜单管理', '/local/api/res/update', '0', '2018-08-31 10:42:47', '2018-08-31 10:45:32', '更新菜单项', null);
INSERT INTO `sys_res` VALUES ('175', '28', '3', '系统管理-菜单管理', '/local/api/res/deleteMenu', '0', '2018-08-31 10:43:02', '2018-08-31 10:45:32', '删除菜单项', null);
INSERT INTO `sys_res` VALUES ('176', '28', '3', '系统管理-菜单管理', '/local/api/res/unlinkParentRes', '0', '2018-08-31 10:43:45', '2018-08-31 10:45:32', '取消关联菜单与接口资源', null);
INSERT INTO `sys_res` VALUES ('177', '28', '3', '系统管理-菜单管理', '/local/api/res/linkParentRes', '0', '2018-08-31 10:43:56', '2018-08-31 10:45:32', '关联菜单与接口资源', null);
INSERT INTO `sys_res` VALUES ('178', '44', '3', '系统管理-接口管理', '/local/api/res/get', '0', '2018-08-31 10:46:43', '2018-08-31 10:49:24', '通过id获取接口信息', null);
INSERT INTO `sys_res` VALUES ('179', '44', '3', '系统管理-接口管理', '/local/api/res/select', '0', '2018-08-31 10:47:05', '2018-08-31 10:49:24', '获取接口列表', null);
INSERT INTO `sys_res` VALUES ('180', '44', '3', '系统管理-接口管理', '/local/api/res/add', '0', '2018-08-31 10:47:31', '2018-08-31 10:49:24', '创建接口', null);
INSERT INTO `sys_res` VALUES ('181', '44', '3', '系统管理-接口管理', '/local/api/res/update', '0', '2018-08-31 10:47:48', '2018-08-31 10:49:24', '更新接口', null);
INSERT INTO `sys_res` VALUES ('182', '44', '3', '系统管理-接口管理', '/local/api/res/deleteInterface', '0', '2018-08-31 10:48:04', '2018-08-31 10:49:24', '删除接口', null);
INSERT INTO `sys_res` VALUES ('183', '45', '3', '系统管理-审计管理', '/local/api/audit/select', '0', '2018-08-31 10:49:25', '2018-08-31 10:50:36', '查询审计信息', null);
INSERT INTO `sys_res` VALUES ('184', '129', '3', '公共接口-用户登录', '/local/api/login', '0', '2018-08-31 10:57:36', '2018-09-18 19:42:26', '用户登录', null);
INSERT INTO `sys_res` VALUES ('185', '129', '3', '公共接口-用户登录', '/local/api/logout', '0', '2018-08-31 10:57:52', '2018-09-18 19:42:26', '用户登出', null);
INSERT INTO `sys_res` VALUES ('186', '25', '3', 'HR报表-下载按照营销人员、利率分组,下载户数、授信额度、贷款余额数据', '/backbond/api/v1/rpt/hr/exportHRStatisticalByRate', '0', '2018-08-31 15:19:51', '2018-09-04 17:24:44', '@param startDt 开始日期（参数格式:yyyymmdd)\n@param endDt 结束日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('187', '25', '3', 'HR报表-按利率统计报表，可指定营销人员与利率', '/backbond/api/v1/rpt/hr/hrStatisticalByRate', '0', '2018-08-31 15:23:43', '2018-09-04 17:24:44', '@startDt 开始日期（参数格式:yyyymmdd)\n@endDt 结束日期（参数格式:yyyymmdd)\n@introducerName 营销人员姓名[可选]\n@introducerId 营销人员编码[可选]\n@rates 万元日利率(多个之间用半角逗号分隔)[可选]', null);
INSERT INTO `sys_res` VALUES ('188', '24', '3', '报表概览-统计万元日利率对应的户数、授信额度、贷款余额分布情况', '/backbond/api/v1/rpt/hr/hrOverviewByRate', '0', '2018-08-31 15:26:58', '2018-09-04 17:24:34', '@param startDt 开始日期（参数格式:yyyymmdd) @param endDt 结束日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('189', '151', '3', '报表中心-运营报表-查询放款与还款统计数据', '/backbond/api/v1/rpt/operate/getLoanAndRepay', '0', '2018-09-03 16:52:24', '2018-09-04 11:01:42', '@param startDt 开始日期\n@param endDt 结束日期\n@param accuType 类型 :M|月,Q|季,Y|年,A|金额,C|渠道(暂时还没有)', null);
INSERT INTO `sys_res` VALUES ('190', '151', '3', '报表中心-运营报表-下载放款与还款统计数据', '/backbond/api/v1/rpt/operate/exportLoanAndRepay', '0', '2018-09-03 16:58:15', '2018-09-04 11:01:42', '@param startDt 开始日期 @param endDt 结束日期 @param accuType 类型 :M|月,Q|季,Y|年,A|金额,C|渠道(暂时还没有)', null);
INSERT INTO `sys_res` VALUES ('191', '135', '3', '运营报表-报表概览-查询放款情况数据', '/backbond/api/v1/rpt/operate/getLoanAccumOverview', '0', '2018-09-03 17:01:21', '2018-09-11 16:10:20', '@param busiDt 统计时间点(日期:yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('192', '135', '3', '报表中心-运营报表-下载放款与还款统计数据', '/backbond/api/v1/rpt/operate/exportLoanAccumOverview', '0', '2018-09-03 17:02:34', '2018-09-11 16:10:20', '@param busiDt 统计时间点(日期:yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('201', '15', '3', '表概览-查询进件户数、授信户数、授信总额、贷款余额户数、贷款余额统计数据', '/backbond/api/v1/rpt/risk/getCustomerOverview', '0', '2018-09-04 11:06:16', '2018-09-04 17:25:44', '@param startDay 起始时间 (可为空，为空时指查询截止到结束时间那天的累计统计数据)\n@param endDay 结束时间', null);
INSERT INTO `sys_res` VALUES ('202', '15', '3', '风控概览-客户类型分布', '/backbond/api/v1/rpt/risk/getCustomerOverviewByProduct', '0', '2018-09-04 14:58:50', '2018-09-04 17:25:44', '@param startDay 起始时间 (可为空，为空时指查询截止到结束时间那天的累计统计数据) @param endDay 结束时间', null);
INSERT INTO `sys_res` VALUES ('203', '15', '3', '风控概览-授信状态分布', '/backbond/api/v1/rpt/risk/getCustomerOverviewByCreditStatus', '0', '2018-09-04 15:24:15', '2018-09-04 17:25:44', '@param startDay 起始时间 (可为空，为空时指查询截止到结束时间那天的累计统计数据) @param endDay 结束时间', null);
INSERT INTO `sys_res` VALUES ('204', '15', '3', '风控概览-万元日利率分布', '/backbond/api/v1/rpt/risk/getCustomerOverviewByRate', '0', '2018-09-04 15:25:17', '2018-09-04 17:25:44', '@param startDay 起始时间 (可为空，为空时指查询截止到结束时间那天的累计统计数据) @param endDay 结束时间', null);
INSERT INTO `sys_res` VALUES ('205', '15', '3', '风控概览-按统计类型统计营销人员授信TOP10', '/backbond/api/v1/rpt/risk/getCustomerOverviewTopByIntroducer', '0', '2018-09-04 16:53:06', '2018-09-04 17:25:44', '@param startDay 起始时间 (可为空，为空时指查询截止到结束时间那天的累计统计数据) @param endDay 结束时间@param accuType 统计类型 :T|进件户数,C|授信户数,A|授信金额', null);
INSERT INTO `sys_res` VALUES ('206', '15', '3', '风控概览-按统计类型统计营销团队授信TOP6', '/backbond/api/v1/rpt/risk/getCustomerOverviewTopByIntroducerRelat', '0', '2018-09-04 16:55:16', '2018-09-04 17:29:28', '@param startDay 起始时间 (可为空，为空时指查询截止到结束时间那天的累计统计数据) @param endDay 结束时间@param accuType 统计类型 :T|进件户数,C|授信户数,A|授信金额', null);
INSERT INTO `sys_res` VALUES ('207', '16', '3', '风控报表-风控授信报表-查询风控授信全量报表数据', '/backbond/api/v1/rpt/risk/getRiskCreditAll', '0', '2018-09-06 10:13:25', '2018-09-11 11:44:04', '2、可自主搜索：客户姓名、证件号码、产品类型、授信状态、单位名称、审批人、营销人员。\n3、可自主设置申请日期段，如20180601至20180620自行搜索客户信息。', null);
INSERT INTO `sys_res` VALUES ('208', '16', '3', '风控报表-风控授信报表-下载风控授信全量报表数据', '/backbond/api/v1/rpt/risk/exportRiskCreditAll', '0', '2018-09-06 10:17:49', '2018-09-11 11:44:04', '2、可自主搜索：客户姓名、证件号码、产品类型、授信状态、单位名称、审批人、营销人员。 3、可自主设置申请日期段，如20180601至20180620自行搜索客户信息。', null);
INSERT INTO `sys_res` VALUES ('210', '153', '3', '风控报表-风控逾期报表-按页查询借据级全量信息表数据', '/backbond/api/v1/rpt/risk/getOverdueByBillno', '0', '2018-09-06 16:06:46', '2018-09-12 17:04:51', '@param statDt 统计日期（参数格式:yyyymmdd)', null);
INSERT INTO `sys_res` VALUES ('211', '153', '3', '风控报表-风控逾期报表-下载信贷五级分类数据', '/backbond/api/v1/rpt/risk/exportOverdueByCreditRate', '0', '2018-09-06 19:39:34', '2018-09-12 17:04:51', '@param busiDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('212', '153', '3', '风控报表-风控逾期报表-查询信贷五级分类数据', '/backbond/api/v1/rpt/risk/getOverdueByCreditRate', '0', '2018-09-06 19:39:38', '2018-09-12 17:04:51', '@param busiDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('213', '153', '3', '查询风控逾期报表-查询指定借据号从委外日开始的还款记录数据', '/backbond/api/v1/rpt/risk/getOverdueOutsourcingRepayInfoByBillNo', '0', '2018-09-07 12:01:47', '2018-09-12 17:04:51', '@param wwDt 委外日期(yyyyMMdd)\n@param duebillNo 借据号', null);
INSERT INTO `sys_res` VALUES ('214', '153', '3', '查询风控逾期报表-委外收款统计数据', '/backbond/api/v1/rpt/risk/getOverdueOutsourcingInfoByBillNo', '0', '2018-09-07 12:01:51', '2018-09-12 17:04:51', '@param wwDt 委外日期(yyyyyMMdd)\n@param dbDt	 对比日期(yyyyMMdd)\n@param duebillNos 借据号串(空格，换行或者逗号等非数字作为分隔符)', null);
INSERT INTO `sys_res` VALUES ('215', '153', '3', '风控报表-风控逾期报表-下载城市逾期情况明细数据', '/backbond/api/v1/rpt/risk/exportOverdueDetailByCity', '0', '2018-09-08 16:17:10', '2018-09-12 17:04:51', '@param statDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('216', '153', '3', '风控报表-风控逾期报表-下载省份逾期情况明细数据', '/backbond/api/v1/rpt/risk/exportOverdueDetailByProvince', '0', '2018-09-08 16:17:29', '2018-09-12 17:04:51', '@param statDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('217', '153', '3', '风控报表-风控逾期报表-下载年龄逾期情况明细数据', '/backbond/api/v1/rpt/risk/exportOverdueDetailByAge', '0', '2018-09-08 16:17:47', '2018-09-12 17:04:51', '@param statDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('218', '153', '3', '风控报表-风控逾期报表-下载营销人员逾期情况明细数据', '/backbond/api/v1/rpt/risk/exportOverdueDetailByIntroducer', '0', '2018-09-08 16:18:06', '2018-09-12 17:04:51', '@param statDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('219', '153', '3', '风控报表-风控逾期报表-按页查询客户经理逾期情况明细表数据', '/backbond/api/v1/rpt/risk/getOverdueDetailByIntroducer', '0', '2018-09-08 16:18:50', '2018-09-12 17:04:51', '@param statDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('220', '153', '3', '风控报表-风控逾期报表-按页查询省份逾期情况明细表数据', '/backbond/api/v1/rpt/risk/getOverdueDetailByProvince', '0', '2018-09-08 16:19:10', '2018-09-12 17:04:51', '@param statDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('221', '153', '3', '风控报表-风控逾期报表-按页查询城市逾期情况明细表数据', '/backbond/api/v1/rpt/risk/getOverdueDetailByCity', '0', '2018-09-08 16:19:23', '2018-09-12 17:04:51', '@param statDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('222', '153', '3', '风控报表-风控逾期报表-按页查询年龄逾期情况明细表数据', '/backbond/api/v1/rpt/risk/getOverdueDetailByAge', '0', '2018-09-08 16:19:37', '2018-09-12 17:04:51', '@param statDt 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('223', '153', '3', '风控报表-风控概览-查询逾期情况统计数据', '/backbond/api/v1/rpt/risk/getOverdueOverviewByday', '0', '2018-09-08 16:24:32', '2018-09-12 17:04:51', '@param busiDt统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('224', '135', '3', '运营报表-报表概览-查询快乐秒贷数据', '/backbond/api/v1/rpt/operate/getHappyLoanOverviewByDay', '0', '2018-09-11 11:04:40', '2018-09-11 16:10:20', '\n@param busiDt 统计时间点(日期:yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('225', '16', '3', '风控报表-风控授信报表-查询营销业务统计数据', '/backbond/api/v1/rpt/risk/getCreditByIntroducer', '0', '2018-09-11 11:20:13', '2018-09-11 11:44:04', 'startDt	开始日期	integer\nendDt	结束日期	integer\nintroducer	营销人名称 string\nintroducerRelation	营销团队名称 string\npageSize	页大小 integer\npageNo	页码（从1开始）integer', null);
INSERT INTO `sys_res` VALUES ('226', '152', '3', '风控报表-风控信贷报表-风控信贷情况表(按页)', '/backbond/api/v1/rpt/risk/getRiskLoanByProduct', '0', '2018-09-12 09:01:57', '2018-09-12 16:59:06', '@param busiDt	 统计时间点(日期yyyyMMdd)\n@param pageSize	页大小\n@param pageNo	页码(从1开始)', null);
INSERT INTO `sys_res` VALUES ('227', '152', '3', '风控报表-风控信贷报表-风控信贷情况表(下载)', '/backbond/api/v1/rpt/risk/exportRiskLoanByProduct', '0', '2018-09-12 11:08:36', '2018-09-12 16:59:06', '@param busiDt	 统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('228', '152', '3', '风控报表-风控信贷报表-客户经理借款报表(下载)', '/backbond/api/v1/rpt/risk/exportRiskLoanByIntroducer', '0', '2018-09-12 11:09:57', '2018-09-12 16:59:06', '风控报表-风控信贷报表-风控信贷情况表(下载)\n/backbond/api/v1/rpt/risk/exportRiskLoanByProduct\n@param busiDt	统计时间点(日期yyyyMMdd)', null);
INSERT INTO `sys_res` VALUES ('229', '153', '3', '风控报表-风控逾期报表-借据级全量信息表(下载)', '/backbond/api/v1/rpt/risk/exportOverdueByBillno', '0', '2018-09-12 13:04:53', '2018-09-12 17:04:51', 'statDt	(required)统计日期\ndueBillNo	借据号\ncustName	客户姓名\ncertId	身份证号\nstartActiveDt	借款日期范围起始值[yyyyMMdd]\nendActiveDt	借款日期范围结束值[yyyyMMdd]\nbillNoStatus	借据状态(0|正常,1|已结清,2|逾期)\nstartOverdueDays	逾期天数范围最小值\nendOverdueDays	逾期天数范围最大值', null);
INSERT INTO `sys_res` VALUES ('230', '152', '3', '风控报表-风控信贷报表-查询客户经理借款报表数据', '/backbond/api/v1/rpt/risk/getRiskLoanByIntroducer', '0', '2018-09-12 16:59:33', '2018-09-12 16:59:06', '@param busiDt 统计时间点', null);
INSERT INTO `sys_res` VALUES ('231', '153', '3', '风控报表-风控逾期报表-查询逾期时间情况表数据', '/backbond/api/v1/rpt/risk/getOverdueStatisticsByOverdueDays', '0', '2018-09-12 17:02:40', '2018-09-12 17:04:51', 'busiDt:  统计时间点(日期)\nminOverdueDays:  最小逾期天数[可选]\nmaxOverdueDays:  最大逾期天数[可选]', null);
INSERT INTO `sys_res` VALUES ('245', '20', '3', '报表中心-财务报表-查询客户创利等级分布', '/backbond/api/v1/rpt/profit/customerLevelOverview', '0', '2018-09-18 17:23:40', '2018-09-19 09:23:38', 'param: busiDt', null);
INSERT INTO `sys_res` VALUES ('246', '20', '3', '财务报表-报表概览-按照营销人员统计利润TOP10', '/backbond/api/v1/rpt/profit/createProfitAmtTopNByIntroducer', '0', '2018-09-18 17:24:51', '2018-09-19 09:23:38', 'param: startDt \nparam: endDt', null);
INSERT INTO `sys_res` VALUES ('247', '20', '3', '财务报表-报表概览-按照营销人员统计创利客户数TOP10', '/backbond/api/v1/rpt/profit/createProfitCustomerCountTopNByIntroducer', '0', '2018-09-18 17:26:44', '2018-09-19 09:23:38', '', null);
INSERT INTO `sys_res` VALUES ('250', '1', '1', '数据驾驶舱', 'index', '0', '2018-09-21 11:26:58', '2018-09-29 15:37:12', '', 'chart');
INSERT INTO `sys_res` VALUES ('251', '250', '1', '业务情况', 'indexBusiness', '1', '2018-09-21 11:28:09', '2018-09-25 10:26:55', '', 'nested');
INSERT INTO `sys_res` VALUES ('252', '250', '1', '数据透视', 'dataView', '5', '2018-09-21 15:18:47', '2018-09-29 15:56:05', '', 'excel');
INSERT INTO `sys_res` VALUES ('253', '250', '1', '营销情况', 'marketing', '4', '2018-09-25 10:12:43', '2018-09-29 15:38:25', '', 'chart');
INSERT INTO `sys_res` VALUES ('254', '250', '1', '运营情况', 'indexOperate', '2', '2018-09-25 10:27:42', '2018-09-25 10:29:28', '', 'dashboard');
INSERT INTO `sys_res` VALUES ('255', '250', '1', '逾期情况', 'indexOverdue', '3', '2018-09-26 11:12:17', '2018-09-26 11:12:17', '', 'example');
INSERT INTO `sys_res` VALUES ('256', '251', '3', '首页-业务情况-查询截至到某一时间点的业务情况数据', '/backbond/api/v1/personas/home/getBusinessByBusiDt', '0', '2018-09-28 11:30:45', '2018-10-10 16:15:17', '', null);
INSERT INTO `sys_res` VALUES ('257', '251', '3', '首页-业务情况-查询截至到某一时间点的业务情况数据', '/backbond/api/v1/personas/home/getCreditStatusOfBusinessByBusiDt', '0', '2018-10-10 16:13:13', '2018-10-10 16:15:17', '', null);
INSERT INTO `sys_res` VALUES ('258', '251', '3', '首页-业务情况-按指定维度查询指定时间范围内的业务情况数据', '/backbond/api/v1/personas/home/getBusinessByDateDim', '0', '2018-10-10 16:13:52', '2018-10-10 16:15:17', '', null);
INSERT INTO `sys_res` VALUES ('259', '251', '3', '首页-业务情况-查询截至到某一时间点的业务情况数据(各利率下的授信总额度)', '/backbond/api/v1/personas/home/getRateAmtOfBusinessByBusiDt', '0', '2018-10-10 16:14:19', '2018-10-10 16:15:17', '', null);
INSERT INTO `sys_res` VALUES ('260', '254', '3', '首页-运营情况-按指定维度查询指定时间范围内的运营情况数据', '/backbond/api/v1/personas/home/getOperationByDateDim', '0', '2018-10-10 16:14:50', '2018-10-10 16:15:25', '', null);
INSERT INTO `sys_res` VALUES ('261', '254', '3', '首页-运营情况-查询截至到某一时间点的运营情况数据', '/backbond/api/v1/personas/home/getOperationByBusiDt', '0', '2018-10-10 16:15:09', '2018-10-10 16:15:25', '', null);
INSERT INTO `sys_res` VALUES ('262', '255', '3', '首页-逾期情况-逾期情况与不良情况数据表(表格展示)', '/backbond/api/v1/personas/home/getOverdueAndBadByBusiDt', '0', '2018-10-10 16:15:24', '2018-10-10 16:15:31', '', null);
INSERT INTO `sys_res` VALUES ('263', '255', '3', '首页-逾期情况-将到期贷款情况-时间点数据', '/backbond/api/v1/personas/home/getOverdueOfExpiredByBusiDt', '0', '2018-10-10 16:15:39', '2018-10-10 16:15:31', '', null);
INSERT INTO `sys_res` VALUES ('264', '255', '3', '首页-逾期情况-逾期情况与不良情况-时间点数据', '/backbond/api/v1/personas/home/getOverdueVsBadByBusiDt', '0', '2018-10-10 16:15:55', '2018-10-10 16:15:31', '', null);
INSERT INTO `sys_res` VALUES ('265', '255', '3', '首页-逾期情况-逾期率、不良率、首逾率对比情况-维度数据', '/backbond/api/v1/personas/home/getOverdueOfRatioByDateDim', '0', '2018-10-10 16:16:09', '2018-10-10 16:15:31', '', null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_code` varchar(255) DEFAULT NULL,
  `role_type` int(11) NOT NULL DEFAULT '1' COMMENT '1：普通角色，0：超级管理员',
  `role_name` varchar(255) NOT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '', '0', '超级管理员', '', '2018-08-09 09:10:47', '2018-09-17 11:23:32');
INSERT INTO `sys_role` VALUES ('2', '', '1', '开发测试', '', '2018-08-06 23:37:40', '2018-09-18 16:30:51');
INSERT INTO `sys_role` VALUES ('27', '7527da8954f3407b379efe25bf551beb', '1', '普通用户', '', '2018-08-27 11:00:43', '2018-09-18 16:28:20');
INSERT INTO `sys_role` VALUES ('47', '1fa3a89253fcca5c5697baa960e9350f', '1', '测试角色111', '', '2018-09-18 11:11:32', '2018-09-18 17:11:54');
INSERT INTO `sys_role` VALUES ('50', '202cb962ac59075b964b07152d234b70', '1', '123', '123', '2018-09-18 17:01:13', '2018-09-18 17:01:13');

-- ----------------------------
-- Table structure for sys_role_btn_res
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_btn_res`;
CREATE TABLE `sys_role_btn_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `res_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uni_role_res` (`role_id`,`res_id`) USING BTREE COMMENT '用户角色关联关系唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=910 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_btn_res
-- ----------------------------
INSERT INTO `sys_role_btn_res` VALUES ('894', '27', '1', '2018-10-11 10:34:04');
INSERT INTO `sys_role_btn_res` VALUES ('896', '27', '2', '2018-10-11 10:34:04');
INSERT INTO `sys_role_btn_res` VALUES ('897', '27', '3', '2018-10-11 10:34:04');

-- ----------------------------
-- Table structure for sys_role_res
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_res`;
CREATE TABLE `sys_role_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `res_id` int(11) NOT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uni_role_res` (`role_id`,`res_id`) USING BTREE COMMENT '用户角色关联关系唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=894 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_res
-- ----------------------------
INSERT INTO `sys_role_res` VALUES ('115', '2', '2', null, null, null);
INSERT INTO `sys_role_res` VALUES ('116', '2', '6', null, null, null);
INSERT INTO `sys_role_res` VALUES ('119', '2', '7', null, null, null);
INSERT INTO `sys_role_res` VALUES ('120', '2', '3', null, null, null);
INSERT INTO `sys_role_res` VALUES ('121', '2', '9', null, null, null);
INSERT INTO `sys_role_res` VALUES ('122', '2', '8', null, null, null);
INSERT INTO `sys_role_res` VALUES ('123', '2', '10', null, null, null);
INSERT INTO `sys_role_res` VALUES ('124', '2', '5', null, null, null);
INSERT INTO `sys_role_res` VALUES ('125', '2', '26', null, null, null);
INSERT INTO `sys_role_res` VALUES ('126', '2', '27', null, null, null);
INSERT INTO `sys_role_res` VALUES ('127', '2', '28', null, null, null);
INSERT INTO `sys_role_res` VALUES ('128', '2', '44', null, null, null);
INSERT INTO `sys_role_res` VALUES ('129', '2', '45', null, null, null);
INSERT INTO `sys_role_res` VALUES ('154', '27', '2', null, null, null);
INSERT INTO `sys_role_res` VALUES ('155', '27', '6', null, null, null);
INSERT INTO `sys_role_res` VALUES ('156', '27', '7', null, null, null);
INSERT INTO `sys_role_res` VALUES ('157', '27', '3', null, null, null);
INSERT INTO `sys_role_res` VALUES ('158', '27', '8', null, null, null);
INSERT INTO `sys_role_res` VALUES ('159', '27', '9', null, null, null);
INSERT INTO `sys_role_res` VALUES ('160', '27', '10', null, null, null);
INSERT INTO `sys_role_res` VALUES ('177', '27', '129', null, null, null);
INSERT INTO `sys_role_res` VALUES ('178', '1', '2', null, null, null);
INSERT INTO `sys_role_res` VALUES ('179', '1', '6', null, null, null);
INSERT INTO `sys_role_res` VALUES ('180', '1', '7', null, null, null);
INSERT INTO `sys_role_res` VALUES ('181', '1', '3', null, null, null);
INSERT INTO `sys_role_res` VALUES ('182', '1', '8', null, null, null);
INSERT INTO `sys_role_res` VALUES ('183', '1', '9', null, null, null);
INSERT INTO `sys_role_res` VALUES ('184', '1', '10', null, null, null);
INSERT INTO `sys_role_res` VALUES ('185', '1', '4', null, null, null);
INSERT INTO `sys_role_res` VALUES ('186', '1', '12', null, null, null);
INSERT INTO `sys_role_res` VALUES ('187', '1', '17', null, null, null);
INSERT INTO `sys_role_res` VALUES ('188', '1', '19', null, null, null);
INSERT INTO `sys_role_res` VALUES ('189', '1', '18', null, null, null);
INSERT INTO `sys_role_res` VALUES ('190', '1', '11', null, null, null);
INSERT INTO `sys_role_res` VALUES ('191', '1', '15', null, null, null);
INSERT INTO `sys_role_res` VALUES ('192', '1', '16', null, null, null);
INSERT INTO `sys_role_res` VALUES ('193', '1', '13', null, null, null);
INSERT INTO `sys_role_res` VALUES ('194', '1', '20', null, null, null);
INSERT INTO `sys_role_res` VALUES ('195', '1', '21', null, null, null);
INSERT INTO `sys_role_res` VALUES ('196', '1', '22', null, null, null);
INSERT INTO `sys_role_res` VALUES ('198', '1', '14', null, null, null);
INSERT INTO `sys_role_res` VALUES ('199', '1', '24', null, null, null);
INSERT INTO `sys_role_res` VALUES ('200', '1', '25', null, null, null);
INSERT INTO `sys_role_res` VALUES ('201', '1', '5', null, null, null);
INSERT INTO `sys_role_res` VALUES ('202', '1', '26', null, null, null);
INSERT INTO `sys_role_res` VALUES ('203', '1', '27', null, null, null);
INSERT INTO `sys_role_res` VALUES ('204', '1', '28', null, null, null);
INSERT INTO `sys_role_res` VALUES ('205', '1', '44', null, null, null);
INSERT INTO `sys_role_res` VALUES ('206', '1', '45', null, null, null);
INSERT INTO `sys_role_res` VALUES ('207', '1', '129', null, null, null);
INSERT INTO `sys_role_res` VALUES ('208', '27', '137', null, null, null);
INSERT INTO `sys_role_res` VALUES ('213', '27', '58', null, null, null);
INSERT INTO `sys_role_res` VALUES ('214', '27', '59', null, null, null);
INSERT INTO `sys_role_res` VALUES ('215', '27', '60', null, null, null);
INSERT INTO `sys_role_res` VALUES ('216', '27', '61', null, null, null);
INSERT INTO `sys_role_res` VALUES ('217', '27', '62', null, null, null);
INSERT INTO `sys_role_res` VALUES ('218', '27', '63', null, null, null);
INSERT INTO `sys_role_res` VALUES ('219', '27', '64', null, null, null);
INSERT INTO `sys_role_res` VALUES ('220', '27', '65', null, null, null);
INSERT INTO `sys_role_res` VALUES ('221', '27', '66', null, null, null);
INSERT INTO `sys_role_res` VALUES ('222', '27', '67', null, null, null);
INSERT INTO `sys_role_res` VALUES ('223', '27', '68', null, null, null);
INSERT INTO `sys_role_res` VALUES ('224', '27', '69', null, null, null);
INSERT INTO `sys_role_res` VALUES ('225', '27', '70', null, null, null);
INSERT INTO `sys_role_res` VALUES ('226', '27', '71', null, null, null);
INSERT INTO `sys_role_res` VALUES ('227', '27', '72', null, null, null);
INSERT INTO `sys_role_res` VALUES ('228', '27', '73', null, null, null);
INSERT INTO `sys_role_res` VALUES ('229', '27', '74', null, null, null);
INSERT INTO `sys_role_res` VALUES ('230', '27', '75', null, null, null);
INSERT INTO `sys_role_res` VALUES ('231', '27', '76', null, null, null);
INSERT INTO `sys_role_res` VALUES ('232', '27', '77', null, null, null);
INSERT INTO `sys_role_res` VALUES ('233', '27', '78', null, null, null);
INSERT INTO `sys_role_res` VALUES ('234', '27', '79', null, null, null);
INSERT INTO `sys_role_res` VALUES ('235', '27', '80', null, null, null);
INSERT INTO `sys_role_res` VALUES ('237', '27', '82', null, null, null);
INSERT INTO `sys_role_res` VALUES ('239', '27', '84', null, null, null);
INSERT INTO `sys_role_res` VALUES ('241', '27', '86', null, null, null);
INSERT INTO `sys_role_res` VALUES ('243', '27', '88', null, null, null);
INSERT INTO `sys_role_res` VALUES ('244', '27', '89', null, null, null);
INSERT INTO `sys_role_res` VALUES ('248', '27', '93', null, null, null);
INSERT INTO `sys_role_res` VALUES ('250', '27', '95', null, null, null);
INSERT INTO `sys_role_res` VALUES ('251', '27', '96', null, null, null);
INSERT INTO `sys_role_res` VALUES ('278', '27', '127', null, null, null);
INSERT INTO `sys_role_res` VALUES ('279', '27', '128', null, null, null);
INSERT INTO `sys_role_res` VALUES ('290', '27', '12', null, null, null);
INSERT INTO `sys_role_res` VALUES ('291', '27', '17', null, null, null);
INSERT INTO `sys_role_res` VALUES ('292', '27', '135', null, null, null);
INSERT INTO `sys_role_res` VALUES ('293', '27', '19', null, null, null);
INSERT INTO `sys_role_res` VALUES ('294', '27', '18', null, null, null);
INSERT INTO `sys_role_res` VALUES ('295', '27', '151', null, null, null);
INSERT INTO `sys_role_res` VALUES ('296', '27', '90', null, null, null);
INSERT INTO `sys_role_res` VALUES ('297', '27', '91', null, null, null);
INSERT INTO `sys_role_res` VALUES ('298', '27', '92', null, null, null);
INSERT INTO `sys_role_res` VALUES ('299', '27', '124', null, null, null);
INSERT INTO `sys_role_res` VALUES ('300', '27', '11', null, null, null);
INSERT INTO `sys_role_res` VALUES ('301', '27', '15', null, null, null);
INSERT INTO `sys_role_res` VALUES ('302', '27', '16', null, null, null);
INSERT INTO `sys_role_res` VALUES ('303', '27', '152', null, null, null);
INSERT INTO `sys_role_res` VALUES ('304', '27', '153', null, null, null);
INSERT INTO `sys_role_res` VALUES ('321', '27', '13', null, null, null);
INSERT INTO `sys_role_res` VALUES ('322', '27', '20', null, null, null);
INSERT INTO `sys_role_res` VALUES ('323', '27', '21', null, null, null);
INSERT INTO `sys_role_res` VALUES ('324', '27', '22', null, null, null);
INSERT INTO `sys_role_res` VALUES ('329', '27', '99', null, null, null);
INSERT INTO `sys_role_res` VALUES ('330', '27', '100', null, null, null);
INSERT INTO `sys_role_res` VALUES ('332', '27', '102', null, null, null);
INSERT INTO `sys_role_res` VALUES ('333', '27', '120', null, null, null);
INSERT INTO `sys_role_res` VALUES ('334', '27', '121', null, null, null);
INSERT INTO `sys_role_res` VALUES ('335', '27', '4', null, null, null);
INSERT INTO `sys_role_res` VALUES ('336', '27', '14', null, null, null);
INSERT INTO `sys_role_res` VALUES ('337', '27', '24', null, null, null);
INSERT INTO `sys_role_res` VALUES ('338', '27', '25', null, null, null);
INSERT INTO `sys_role_res` VALUES ('339', '27', '83', null, null, null);
INSERT INTO `sys_role_res` VALUES ('340', '27', '85', null, null, null);
INSERT INTO `sys_role_res` VALUES ('341', '27', '87', null, null, null);
INSERT INTO `sys_role_res` VALUES ('342', '27', '123', null, null, null);
INSERT INTO `sys_role_res` VALUES ('502', '27', '170', null, null, null);
INSERT INTO `sys_role_res` VALUES ('503', '27', '169', null, null, null);
INSERT INTO `sys_role_res` VALUES ('558', '27', '101', null, null, null);
INSERT INTO `sys_role_res` VALUES ('559', '27', '186', null, null, null);
INSERT INTO `sys_role_res` VALUES ('560', '27', '187', null, null, null);
INSERT INTO `sys_role_res` VALUES ('561', '27', '188', null, null, null);
INSERT INTO `sys_role_res` VALUES ('562', '27', '189', null, null, null);
INSERT INTO `sys_role_res` VALUES ('563', '27', '190', null, null, null);
INSERT INTO `sys_role_res` VALUES ('564', '27', '191', null, null, null);
INSERT INTO `sys_role_res` VALUES ('565', '27', '192', null, null, null);
INSERT INTO `sys_role_res` VALUES ('566', '27', '201', null, null, null);
INSERT INTO `sys_role_res` VALUES ('567', '27', '202', null, null, null);
INSERT INTO `sys_role_res` VALUES ('568', '27', '203', null, null, null);
INSERT INTO `sys_role_res` VALUES ('569', '27', '204', null, null, null);
INSERT INTO `sys_role_res` VALUES ('570', '27', '205', null, null, null);
INSERT INTO `sys_role_res` VALUES ('571', '27', '206', null, null, null);
INSERT INTO `sys_role_res` VALUES ('572', '27', '207', null, null, null);
INSERT INTO `sys_role_res` VALUES ('573', '27', '208', null, null, null);
INSERT INTO `sys_role_res` VALUES ('574', '27', '210', null, null, null);
INSERT INTO `sys_role_res` VALUES ('575', '27', '211', null, null, null);
INSERT INTO `sys_role_res` VALUES ('576', '27', '212', null, null, null);
INSERT INTO `sys_role_res` VALUES ('577', '27', '213', null, null, null);
INSERT INTO `sys_role_res` VALUES ('578', '27', '214', null, null, null);
INSERT INTO `sys_role_res` VALUES ('579', '27', '215', null, null, null);
INSERT INTO `sys_role_res` VALUES ('580', '27', '216', null, null, null);
INSERT INTO `sys_role_res` VALUES ('581', '27', '217', null, null, null);
INSERT INTO `sys_role_res` VALUES ('582', '27', '218', null, null, null);
INSERT INTO `sys_role_res` VALUES ('583', '27', '219', null, null, null);
INSERT INTO `sys_role_res` VALUES ('584', '27', '220', null, null, null);
INSERT INTO `sys_role_res` VALUES ('585', '27', '221', null, null, null);
INSERT INTO `sys_role_res` VALUES ('586', '27', '222', null, null, null);
INSERT INTO `sys_role_res` VALUES ('587', '27', '223', null, null, null);
INSERT INTO `sys_role_res` VALUES ('588', '27', '224', null, null, null);
INSERT INTO `sys_role_res` VALUES ('589', '27', '225', null, null, null);
INSERT INTO `sys_role_res` VALUES ('590', '27', '226', null, null, null);
INSERT INTO `sys_role_res` VALUES ('591', '27', '227', null, null, null);
INSERT INTO `sys_role_res` VALUES ('592', '27', '228', null, null, null);
INSERT INTO `sys_role_res` VALUES ('593', '27', '229', null, null, null);
INSERT INTO `sys_role_res` VALUES ('594', '27', '230', null, null, null);
INSERT INTO `sys_role_res` VALUES ('595', '27', '231', null, null, null);
INSERT INTO `sys_role_res` VALUES ('604', '47', '14', null, null, null);
INSERT INTO `sys_role_res` VALUES ('605', '47', '24', null, null, null);
INSERT INTO `sys_role_res` VALUES ('606', '47', '25', null, null, null);
INSERT INTO `sys_role_res` VALUES ('607', '47', '4', null, null, null);
INSERT INTO `sys_role_res` VALUES ('608', '47', '83', null, null, null);
INSERT INTO `sys_role_res` VALUES ('609', '47', '85', null, null, null);
INSERT INTO `sys_role_res` VALUES ('610', '47', '87', null, null, null);
INSERT INTO `sys_role_res` VALUES ('611', '47', '123', null, null, null);
INSERT INTO `sys_role_res` VALUES ('612', '47', '186', null, null, null);
INSERT INTO `sys_role_res` VALUES ('613', '47', '187', null, null, null);
INSERT INTO `sys_role_res` VALUES ('614', '47', '188', null, null, null);
INSERT INTO `sys_role_res` VALUES ('615', '2', '137', null, null, null);
INSERT INTO `sys_role_res` VALUES ('617', '2', '58', null, null, null);
INSERT INTO `sys_role_res` VALUES ('618', '2', '59', null, null, null);
INSERT INTO `sys_role_res` VALUES ('619', '2', '60', null, null, null);
INSERT INTO `sys_role_res` VALUES ('620', '2', '61', null, null, null);
INSERT INTO `sys_role_res` VALUES ('621', '2', '62', null, null, null);
INSERT INTO `sys_role_res` VALUES ('622', '2', '63', null, null, null);
INSERT INTO `sys_role_res` VALUES ('623', '2', '64', null, null, null);
INSERT INTO `sys_role_res` VALUES ('624', '2', '65', null, null, null);
INSERT INTO `sys_role_res` VALUES ('625', '2', '66', null, null, null);
INSERT INTO `sys_role_res` VALUES ('626', '2', '67', null, null, null);
INSERT INTO `sys_role_res` VALUES ('627', '2', '68', null, null, null);
INSERT INTO `sys_role_res` VALUES ('628', '2', '69', null, null, null);
INSERT INTO `sys_role_res` VALUES ('629', '2', '70', null, null, null);
INSERT INTO `sys_role_res` VALUES ('630', '2', '71', null, null, null);
INSERT INTO `sys_role_res` VALUES ('631', '2', '72', null, null, null);
INSERT INTO `sys_role_res` VALUES ('632', '2', '73', null, null, null);
INSERT INTO `sys_role_res` VALUES ('633', '2', '74', null, null, null);
INSERT INTO `sys_role_res` VALUES ('634', '2', '75', null, null, null);
INSERT INTO `sys_role_res` VALUES ('635', '2', '76', null, null, null);
INSERT INTO `sys_role_res` VALUES ('636', '2', '77', null, null, null);
INSERT INTO `sys_role_res` VALUES ('637', '2', '78', null, null, null);
INSERT INTO `sys_role_res` VALUES ('638', '2', '79', null, null, null);
INSERT INTO `sys_role_res` VALUES ('639', '2', '80', null, null, null);
INSERT INTO `sys_role_res` VALUES ('640', '2', '82', null, null, null);
INSERT INTO `sys_role_res` VALUES ('641', '2', '84', null, null, null);
INSERT INTO `sys_role_res` VALUES ('642', '2', '86', null, null, null);
INSERT INTO `sys_role_res` VALUES ('643', '2', '88', null, null, null);
INSERT INTO `sys_role_res` VALUES ('644', '2', '89', null, null, null);
INSERT INTO `sys_role_res` VALUES ('645', '2', '93', null, null, null);
INSERT INTO `sys_role_res` VALUES ('646', '2', '95', null, null, null);
INSERT INTO `sys_role_res` VALUES ('647', '2', '96', null, null, null);
INSERT INTO `sys_role_res` VALUES ('648', '2', '127', null, null, null);
INSERT INTO `sys_role_res` VALUES ('649', '2', '128', null, null, null);
INSERT INTO `sys_role_res` VALUES ('650', '2', '156', null, null, null);
INSERT INTO `sys_role_res` VALUES ('651', '2', '157', null, null, null);
INSERT INTO `sys_role_res` VALUES ('652', '2', '158', null, null, null);
INSERT INTO `sys_role_res` VALUES ('653', '2', '159', null, null, null);
INSERT INTO `sys_role_res` VALUES ('654', '2', '160', null, null, null);
INSERT INTO `sys_role_res` VALUES ('655', '2', '161', null, null, null);
INSERT INTO `sys_role_res` VALUES ('656', '2', '162', null, null, null);
INSERT INTO `sys_role_res` VALUES ('657', '2', '163', null, null, null);
INSERT INTO `sys_role_res` VALUES ('658', '2', '164', null, null, null);
INSERT INTO `sys_role_res` VALUES ('659', '2', '165', null, null, null);
INSERT INTO `sys_role_res` VALUES ('660', '2', '166', null, null, null);
INSERT INTO `sys_role_res` VALUES ('661', '2', '167', null, null, null);
INSERT INTO `sys_role_res` VALUES ('662', '2', '168', null, null, null);
INSERT INTO `sys_role_res` VALUES ('663', '2', '171', null, null, null);
INSERT INTO `sys_role_res` VALUES ('664', '2', '172', null, null, null);
INSERT INTO `sys_role_res` VALUES ('665', '2', '173', null, null, null);
INSERT INTO `sys_role_res` VALUES ('666', '2', '174', null, null, null);
INSERT INTO `sys_role_res` VALUES ('667', '2', '175', null, null, null);
INSERT INTO `sys_role_res` VALUES ('668', '2', '176', null, null, null);
INSERT INTO `sys_role_res` VALUES ('669', '2', '177', null, null, null);
INSERT INTO `sys_role_res` VALUES ('670', '2', '178', null, null, null);
INSERT INTO `sys_role_res` VALUES ('671', '2', '179', null, null, null);
INSERT INTO `sys_role_res` VALUES ('672', '2', '180', null, null, null);
INSERT INTO `sys_role_res` VALUES ('673', '2', '181', null, null, null);
INSERT INTO `sys_role_res` VALUES ('674', '2', '182', null, null, null);
INSERT INTO `sys_role_res` VALUES ('675', '2', '183', null, null, null);
INSERT INTO `sys_role_res` VALUES ('676', '50', '4', null, null, null);
INSERT INTO `sys_role_res` VALUES ('677', '50', '12', null, null, null);
INSERT INTO `sys_role_res` VALUES ('678', '50', '17', null, null, null);
INSERT INTO `sys_role_res` VALUES ('679', '50', '135', null, null, null);
INSERT INTO `sys_role_res` VALUES ('680', '50', '19', null, null, null);
INSERT INTO `sys_role_res` VALUES ('681', '50', '18', null, null, null);
INSERT INTO `sys_role_res` VALUES ('682', '50', '151', null, null, null);
INSERT INTO `sys_role_res` VALUES ('683', '50', '11', null, null, null);
INSERT INTO `sys_role_res` VALUES ('684', '50', '15', null, null, null);
INSERT INTO `sys_role_res` VALUES ('685', '50', '16', null, null, null);
INSERT INTO `sys_role_res` VALUES ('686', '50', '152', null, null, null);
INSERT INTO `sys_role_res` VALUES ('687', '50', '153', null, null, null);
INSERT INTO `sys_role_res` VALUES ('688', '50', '13', null, null, null);
INSERT INTO `sys_role_res` VALUES ('689', '50', '20', null, null, null);
INSERT INTO `sys_role_res` VALUES ('690', '50', '21', null, null, null);
INSERT INTO `sys_role_res` VALUES ('691', '50', '22', null, null, null);
INSERT INTO `sys_role_res` VALUES ('692', '50', '170', null, null, null);
INSERT INTO `sys_role_res` VALUES ('693', '50', '169', null, null, null);
INSERT INTO `sys_role_res` VALUES ('694', '50', '14', null, null, null);
INSERT INTO `sys_role_res` VALUES ('695', '50', '24', null, null, null);
INSERT INTO `sys_role_res` VALUES ('696', '50', '25', null, null, null);
INSERT INTO `sys_role_res` VALUES ('697', '50', '83', null, null, null);
INSERT INTO `sys_role_res` VALUES ('698', '50', '85', null, null, null);
INSERT INTO `sys_role_res` VALUES ('699', '50', '87', null, null, null);
INSERT INTO `sys_role_res` VALUES ('700', '50', '90', null, null, null);
INSERT INTO `sys_role_res` VALUES ('701', '50', '91', null, null, null);
INSERT INTO `sys_role_res` VALUES ('702', '50', '92', null, null, null);
INSERT INTO `sys_role_res` VALUES ('706', '50', '99', null, null, null);
INSERT INTO `sys_role_res` VALUES ('707', '50', '100', null, null, null);
INSERT INTO `sys_role_res` VALUES ('708', '50', '101', null, null, null);
INSERT INTO `sys_role_res` VALUES ('709', '50', '102', null, null, null);
INSERT INTO `sys_role_res` VALUES ('710', '50', '120', null, null, null);
INSERT INTO `sys_role_res` VALUES ('711', '50', '121', null, null, null);
INSERT INTO `sys_role_res` VALUES ('712', '50', '123', null, null, null);
INSERT INTO `sys_role_res` VALUES ('713', '50', '124', null, null, null);
INSERT INTO `sys_role_res` VALUES ('714', '50', '186', null, null, null);
INSERT INTO `sys_role_res` VALUES ('715', '50', '187', null, null, null);
INSERT INTO `sys_role_res` VALUES ('716', '50', '188', null, null, null);
INSERT INTO `sys_role_res` VALUES ('717', '50', '189', null, null, null);
INSERT INTO `sys_role_res` VALUES ('718', '50', '190', null, null, null);
INSERT INTO `sys_role_res` VALUES ('719', '50', '191', null, null, null);
INSERT INTO `sys_role_res` VALUES ('720', '50', '192', null, null, null);
INSERT INTO `sys_role_res` VALUES ('721', '50', '201', null, null, null);
INSERT INTO `sys_role_res` VALUES ('722', '50', '202', null, null, null);
INSERT INTO `sys_role_res` VALUES ('723', '50', '203', null, null, null);
INSERT INTO `sys_role_res` VALUES ('724', '50', '204', null, null, null);
INSERT INTO `sys_role_res` VALUES ('725', '50', '205', null, null, null);
INSERT INTO `sys_role_res` VALUES ('726', '50', '206', null, null, null);
INSERT INTO `sys_role_res` VALUES ('727', '50', '207', null, null, null);
INSERT INTO `sys_role_res` VALUES ('728', '50', '208', null, null, null);
INSERT INTO `sys_role_res` VALUES ('729', '50', '210', null, null, null);
INSERT INTO `sys_role_res` VALUES ('730', '50', '211', null, null, null);
INSERT INTO `sys_role_res` VALUES ('731', '50', '212', null, null, null);
INSERT INTO `sys_role_res` VALUES ('732', '50', '213', null, null, null);
INSERT INTO `sys_role_res` VALUES ('733', '50', '214', null, null, null);
INSERT INTO `sys_role_res` VALUES ('734', '50', '215', null, null, null);
INSERT INTO `sys_role_res` VALUES ('735', '50', '216', null, null, null);
INSERT INTO `sys_role_res` VALUES ('736', '50', '217', null, null, null);
INSERT INTO `sys_role_res` VALUES ('737', '50', '218', null, null, null);
INSERT INTO `sys_role_res` VALUES ('738', '50', '219', null, null, null);
INSERT INTO `sys_role_res` VALUES ('739', '50', '220', null, null, null);
INSERT INTO `sys_role_res` VALUES ('740', '50', '221', null, null, null);
INSERT INTO `sys_role_res` VALUES ('741', '50', '222', null, null, null);
INSERT INTO `sys_role_res` VALUES ('742', '50', '223', null, null, null);
INSERT INTO `sys_role_res` VALUES ('743', '50', '224', null, null, null);
INSERT INTO `sys_role_res` VALUES ('744', '50', '225', null, null, null);
INSERT INTO `sys_role_res` VALUES ('745', '50', '226', null, null, null);
INSERT INTO `sys_role_res` VALUES ('746', '50', '227', null, null, null);
INSERT INTO `sys_role_res` VALUES ('747', '50', '228', null, null, null);
INSERT INTO `sys_role_res` VALUES ('748', '50', '229', null, null, null);
INSERT INTO `sys_role_res` VALUES ('749', '50', '230', null, null, null);
INSERT INTO `sys_role_res` VALUES ('750', '50', '231', null, null, null);
INSERT INTO `sys_role_res` VALUES ('863', '27', '81', null, null, null);
INSERT INTO `sys_role_res` VALUES ('864', '27', '154', null, null, null);
INSERT INTO `sys_role_res` VALUES ('865', '27', '155', null, null, null);
INSERT INTO `sys_role_res` VALUES ('866', '27', '184', null, null, null);
INSERT INTO `sys_role_res` VALUES ('867', '27', '185', null, null, null);
INSERT INTO `sys_role_res` VALUES ('882', '27', '94', null, null, null);
INSERT INTO `sys_role_res` VALUES ('883', '27', '97', null, null, null);
INSERT INTO `sys_role_res` VALUES ('885', '27', '245', null, null, null);
INSERT INTO `sys_role_res` VALUES ('886', '27', '246', null, null, null);
INSERT INTO `sys_role_res` VALUES ('887', '27', '247', null, null, null);
INSERT INTO `sys_role_res` VALUES ('888', '50', '94', null, null, null);
INSERT INTO `sys_role_res` VALUES ('889', '50', '97', null, null, null);
INSERT INTO `sys_role_res` VALUES ('891', '50', '245', null, null, null);
INSERT INTO `sys_role_res` VALUES ('892', '50', '246', null, null, null);
INSERT INTO `sys_role_res` VALUES ('893', '50', '247', null, null, null);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增ID',
  `user_code` varchar(50) NOT NULL COMMENT '用户编码',
  `password` varchar(50) NOT NULL COMMENT '用户密码',
  `user_name` varchar(100) NOT NULL COMMENT '用户名',
  `mark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `mobile_phone` varchar(15) DEFAULT NULL COMMENT '手机号码',
  `dept_code` varchar(50) NOT NULL DEFAULT '0' COMMENT '所属部门编码',
  `position` varchar(255) DEFAULT NULL COMMENT '职位',
  `login_status` int(11) DEFAULT '0' COMMENT '登录状态，1：登录，0：未登录',
  `act_status` int(11) DEFAULT '1' COMMENT '账户状态，1：正常（启用），2：锁定（禁用），9：删除（暂未使用，物理删除）',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_unique_sys_user_code` (`user_code`) COMMENT '系统用户表用户编码唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', '696847befefd6e5ce7236b0e00f6b6ba', 'admin', 'administrator', '110@qq.com', '110', '1111', 'none', '1', '1', '2018-08-09 09:03:36', '2018-10-11 10:58:29');
INSERT INTO `sys_user` VALUES ('27', 'xyr', '696847befefd6e5ce7236b0e00f6b6ba', '向艳蓉', '向艳蓉', '1002@hncy58.com', '18888886666', '0101', '主任', '1', '1', '2018-08-23 10:10:04', '2018-10-10 11:05:16');
INSERT INTO `sys_user` VALUES ('28', 'wrx', '696847befefd6e5ce7236b0e00f6b6ba', '王仁兴', '王仁兴', 'wrx@hncy58.com', '18888886666', '0101', 'fasdf', '1', '1', '2018-08-24 10:57:11', '2018-09-27 08:54:00');
INSERT INTO `sys_user` VALUES ('29', 'xuehaiwei', '696847befefd6e5ce7236b0e00f6b6ba', '薛海伟23', 'fasdfasdf', '', '18888888888', '信息科技部', 'asdfasd', '1', '1', '2018-08-25 16:42:16', '2018-10-08 08:59:29');
INSERT INTO `sys_user` VALUES ('61', 'test01', '696847befefd6e5ce7236b0e00f6b6ba', 'test', '', '', '1888888888', 'test', '', '1', '1', '2018-08-28 08:33:01', '2018-09-04 14:44:49');
INSERT INTO `sys_user` VALUES ('71', 'tokings', '696847befefd6e5ce7236b0e00f6b6ba', 'tokings', '', '', '', '0', '', '1', '1', '2018-08-29 11:50:23', '2018-10-11 16:10:20');
INSERT INTO `sys_user` VALUES ('81', 'lds', '696847befefd6e5ce7236b0e00f6b6ba', 'lds', null, null, null, '0', null, '1', '1', '2018-08-29 11:59:50', '2018-10-11 16:17:37');
INSERT INTO `sys_user` VALUES ('82', 'zhuhong', '7ce634a719db7a92ad2dd3d85b307f9f', '朱虹', '', '', '18888888888', '风险合规部', '', '1', '0', '2018-09-10 14:58:46', '2018-09-17 11:23:25');
INSERT INTO `sys_user` VALUES ('107', 'wjl01', '7ce634a719db7a92ad2dd3d85b307f9f', '12', '', '', '12', '12', '', '1', '1', '2018-09-18 09:10:13', '2018-10-11 14:41:05');
INSERT INTO `sys_user` VALUES ('124', 'lzc', '7ce634a719db7a92ad2dd3d85b307f9f', 'lzc', null, null, null, '信息科技部', null, '1', '1', '2018-10-09 08:41:24', '2018-10-09 08:41:24');

-- ----------------------------
-- Table structure for sys_user_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_login_log`;
CREATE TABLE `sys_user_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `login_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `logout_time` timestamp NULL DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_opr_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_opr_log`;
CREATE TABLE `sys_user_opr_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `req_url` varchar(255) DEFAULT NULL,
  `query_str` varchar(2048) DEFAULT NULL,
  `rmt_ip_addr` varchar(255) DEFAULT NULL,
  `local_ip_addr` varchar(255) DEFAULT NULL,
  `req_method` varchar(255) DEFAULT NULL,
  `opr_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `access_ret` char(1) DEFAULT NULL,
  `mark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_opr_log_user_id` (`user_id`) USING HASH,
  KEY `idx_opr_log_token` (`token`),
  KEY `idx_opr_log_opr_time` (`opr_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=682843 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_opr_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `mark` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_uni_user_role` (`user_id`,`role_id`) COMMENT '用户角色关联关系唯一索引'
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1', '1', '超级管理员', null, null);
INSERT INTO `sys_user_role` VALUES ('2', '27', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('101', '28', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('102', '29', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('108', '61', '27', null, null, null);
INSERT INTO `sys_user_role` VALUES ('110', '81', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('111', '82', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('112', '91', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('114', '93', '27', null, null, null);
INSERT INTO `sys_user_role` VALUES ('116', '98', '27', null, null, null);
INSERT INTO `sys_user_role` VALUES ('117', '107', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('119', '109', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('120', '108', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('121', '99', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('122', '99', '2', null, null, null);
INSERT INTO `sys_user_role` VALUES ('134', '71', '27', null, null, null);
INSERT INTO `sys_user_role` VALUES ('137', '71', '1', null, null, null);
INSERT INTO `sys_user_role` VALUES ('138', '124', '1', null, null, null);
