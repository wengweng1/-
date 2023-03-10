/*
Navicat MySQL Data Transfer

Source Server         : 大帅哥
Source Server Version : 80019
Source Host           : localhost:3306
Source Database       : lostandfound

Target Server Type    : MYSQL
Target Server Version : 80019
File Encoding         : 65001

Date: 2022-12-04 01:48:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `a_name` varchar(255) DEFAULT NULL,
  `a_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `a_telephone` varchar(255) DEFAULT NULL,
  `a_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `a_role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '21232f297a57a5a743894ae4a801fc3', '1', '1@qq.com', '超级管理员');
INSERT INTO `admin` VALUES ('10', 'Jokeryao', '6c15387885ea1effbabd305cd8e75388', '17716865215', '1257709806@qq.com', '普通管理员');
INSERT INTO `admin` VALUES ('11', 'JOKER', 'e84a9844f2434b6ae02c4be5be38d76c', '12345678901', '1@qq.com', '普通管理员');
INSERT INTO `admin` VALUES ('12', 'wengweng', 'fcea92f7412b5da7be0cf42b8c93759', '12345678900', '1@qq.com', '普通管理员');

-- ----------------------------
-- Table structure for `found`
-- ----------------------------
DROP TABLE IF EXISTS `found`;
CREATE TABLE `found` (
  `f_id` int NOT NULL AUTO_INCREMENT,
  `f_img` varchar(255) DEFAULT NULL,
  `f_name` varchar(255) DEFAULT NULL,
  `f_sort` varchar(255) DEFAULT NULL,
  `f_feature` int DEFAULT NULL,
  `f_place` varchar(255) DEFAULT NULL,
  `f_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `f_founder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `f_telephone` varchar(255) DEFAULT NULL,
  `f_typename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`f_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of found
-- ----------------------------

-- ----------------------------
-- Table structure for `good`
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `g_id` int NOT NULL AUTO_INCREMENT,
  `g_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`g_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('1', '电子产品');
INSERT INTO `good` VALUES ('3', '服装');
INSERT INTO `good` VALUES ('4', '球类');
INSERT INTO `good` VALUES ('5', '书本');
INSERT INTO `good` VALUES ('6', '生活用品');
INSERT INTO `good` VALUES ('7', '证件');
INSERT INTO `good` VALUES ('9', '饰品');

-- ----------------------------
-- Table structure for `lost`
-- ----------------------------
DROP TABLE IF EXISTS `lost`;
CREATE TABLE `lost` (
  `I_id` int NOT NULL AUTO_INCREMENT,
  `I_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `I_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `I_sort` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `I_feature` int DEFAULT NULL,
  `I_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `I_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `I_loster` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `I_telephone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `I_typename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`I_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of lost
-- ----------------------------
INSERT INTO `lost` VALUES ('12', 'images/0b33b50b-6a3a-4f3c-b41a-be9ffb1d8803.png', '手机', '黑色外壳，吃饭捡到的', '1', '食堂', '2022-11-30', 'Jokeryao', '12345678901', '电子产品');
INSERT INTO `lost` VALUES ('13', 'images/a8e6fa42-ccf5-4be1-97ec-7f37eefed3dc.png', '毛巾', '一个很好看的毛巾', '3', '不知道', '2022-12-03', 'admin', '12345678900', '服装');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `u_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `u_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `u_telephone` varchar(255) DEFAULT NULL,
  `u_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('23', 'wengweng', 'e1adc3949ba59abbe56e057f2f883e', '12345678900', '1@qq.com');
INSERT INTO `user` VALUES ('29', '大西瓜哈哈', 'e1adc3949ba59abbe56e057f2f883e', '12345678900', '1@qq.com');
