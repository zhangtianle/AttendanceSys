/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : as

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2015-06-24 10:21:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `attinfo`
-- ----------------------------
DROP TABLE IF EXISTS `attinfo`;
CREATE TABLE `attinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cardID` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attinfo
-- ----------------------------

-- ----------------------------
-- Table structure for `msg`
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg` (
  `id` int(11) NOT NULL DEFAULT '0',
  `msg` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msg
-- ----------------------------
INSERT INTO `msg` VALUES ('1', '已到达幼儿园');

-- ----------------------------
-- Table structure for `stuinfo`
-- ----------------------------
DROP TABLE IF EXISTS `stuinfo`;
CREATE TABLE `stuinfo` (
  `id` int(7) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL,
  `paname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `cardID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cid` (`cardID`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stuinfo
-- ----------------------------
INSERT INTO `stuinfo` VALUES ('1', '小明', null, '王大锤', '18888888888', '4c-60-81-00-14');
INSERT INTO `stuinfo` VALUES ('2', '小张', null, '隔壁老王', '13111111111', '5c-60-81-00-14');
INSERT INTO `stuinfo` VALUES ('4', null, null, null, null, '2');
INSERT INTO `stuinfo` VALUES ('5', null, null, null, null, '3');
INSERT INTO `stuinfo` VALUES ('6', null, null, null, null, '4');
INSERT INTO `stuinfo` VALUES ('7', null, null, null, null, '5');
INSERT INTO `stuinfo` VALUES ('8', null, null, null, null, '6');
INSERT INTO `stuinfo` VALUES ('9', null, null, null, null, '7');
INSERT INTO `stuinfo` VALUES ('148', '2', null, null, null, '11');
INSERT INTO `stuinfo` VALUES ('149', '3', null, null, null, '12');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', '111');
