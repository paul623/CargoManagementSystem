/*
 Navicat Premium Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 50519
 Source Host           : localhost:3306
 Source Schema         : ysgl

 Target Server Type    : MySQL
 Target Server Version : 50519
 File Encoding         : 65001

 Date: 27/04/2020 10:27:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for companyacc
-- ----------------------------
DROP TABLE IF EXISTS `companyacc`;
CREATE TABLE `companyacc`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `Phonenumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号（不一定，可以是机构分配的账户）',
  `Password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `RegisterDate` datetime NOT NULL COMMENT '注册日期',
  `PartID` int(11) NOT NULL COMMENT '所属机构ID',
  `LastLoginDate` datetime NOT NULL COMMENT '上次登录时间',
  `RemarkLevel` int(255) NOT NULL COMMENT '公司评价星级',
  `TypeID` int(11) NOT NULL COMMENT '用户类型',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for customeracc
-- ----------------------------
DROP TABLE IF EXISTS `customeracc`;
CREATE TABLE `customeracc`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `Phonenumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `Password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `RegisterDate` datetime NOT NULL COMMENT '注册日期',
  `LastLoginDate` datetime NOT NULL COMMENT '上次登录日期',
  `TypeID` int(11) NOT NULL COMMENT '用户类型',
  `Address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户地址',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for manageracc
-- ----------------------------
DROP TABLE IF EXISTS `manageracc`;
CREATE TABLE `manageracc`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '管理机构名称',
  `Phonenumber` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号',
  `Password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `LastLoginDate` datetime NOT NULL COMMENT '上次登录时间',
  `TypeID` int(11) NOT NULL COMMENT '用户类型',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SenderID` int(11) NOT NULL COMMENT '发货人ID',
  `ReceiveID` int(11) NOT NULL COMMENT '收货人ID',
  `CompanyID` int(11) NOT NULL COMMENT '快递公司ID',
  `SendDate` datetime NOT NULL COMMENT '发货日期',
  `ChargerID` int(11) NOT NULL COMMENT '负责人ID',
  `Content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单名称（内容）',
  `MarkID` int(255) NULL DEFAULT NULL COMMENT '评价',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for orderstatus
-- ----------------------------
DROP TABLE IF EXISTS `orderstatus`;
CREATE TABLE `orderstatus`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Status` int(255) NOT NULL COMMENT '0，未完成，1完成',
  `Content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `OrderID` int(11) NOT NULL COMMENT '订单编号',
  `UpdateDate` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for remarkrule
-- ----------------------------
DROP TABLE IF EXISTS `remarkrule`;
CREATE TABLE `remarkrule`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RemarkLevel` int(255) NOT NULL COMMENT '评价等级',
  `Content` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `Rule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评价标准',
  `AddDate` datetime NOT NULL COMMENT '添加日期',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of remarkrule
-- ----------------------------
INSERT INTO `remarkrule` VALUES (1, 1, '非常差，需要整改', '订单平均星级<=2.0', '2020-04-27 10:06:34');
INSERT INTO `remarkrule` VALUES (2, 2, '较差，警告', '订单平均星级>2.0 <=2.5', '2020-04-27 10:07:14');
INSERT INTO `remarkrule` VALUES (3, 3, '及格', '订单平均星级>2.0<=3.0', '2020-04-27 10:08:06');
INSERT INTO `remarkrule` VALUES (4, 4, '良好', '订单平均星级>3.5<=4.0', '2020-04-27 10:08:44');
INSERT INTO `remarkrule` VALUES (5, 5, '优秀', '订单平均星级>4.0', '2020-04-27 10:09:08');

-- ----------------------------
-- Table structure for senderacc
-- ----------------------------
DROP TABLE IF EXISTS `senderacc`;
CREATE TABLE `senderacc`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `UserName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '快递员姓名',
  `CompanyID` int(11) NOT NULL COMMENT '公司ID',
  `StarLevel` int(255) NOT NULL COMMENT '评级',
  `Workload` int(255) NOT NULL COMMENT '工作量',
  `RegisterDate` datetime NOT NULL COMMENT '注册日期',
  `LastLoginDate` datetime NOT NULL COMMENT '上次登录日期',
  `TypeID` int(11) NOT NULL COMMENT '用户类型',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for starrule
-- ----------------------------
DROP TABLE IF EXISTS `starrule`;
CREATE TABLE `starrule`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StartLevel` int(255) NOT NULL COMMENT '星级',
  `Content` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '星级名称',
  `Rule` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评价标准',
  `AddDate` datetime NOT NULL COMMENT '添加日期',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of starrule
-- ----------------------------
INSERT INTO `starrule` VALUES (1, 1, '非常差', '（接单量有效评价排比*3+用户评级*2）<2.0', '2020-04-27 10:11:55');
INSERT INTO `starrule` VALUES (2, 2, '较差', '（接单量有效评价排比*3+用户评级*2）>=2.0<3.0', '2020-04-27 10:12:52');
INSERT INTO `starrule` VALUES (3, 3, '及格', '（接单量有效评价排比*3+用户评级*2）>=3.0<3.5', '2020-04-27 10:13:29');
INSERT INTO `starrule` VALUES (4, 4, '良好', '（接单量有效评价排比*3+用户评级*2）>=3.5<4.0', '2020-04-27 10:14:16');
INSERT INTO `starrule` VALUES (5, 5, '优秀', '（接单量有效评价排比*3+用户评级*2）>=4.0', '2020-04-27 10:15:03');

-- ----------------------------
-- Table structure for systemlog
-- ----------------------------
DROP TABLE IF EXISTS `systemlog`;
CREATE TABLE `systemlog`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL COMMENT '操作人',
  `UserType` int(255) NOT NULL COMMENT '操作用户类别',
  `AddDate` datetime NOT NULL COMMENT '操作日期',
  `Log` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for usertype
-- ----------------------------
DROP TABLE IF EXISTS `usertype`;
CREATE TABLE `usertype`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TypeID` int(255) NOT NULL COMMENT '用户类别',
  `Permission` int(255) NOT NULL,
  `Content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限说明',
  `AddDate` datetime NOT NULL COMMENT '添加日期',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
