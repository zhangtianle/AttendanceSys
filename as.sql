/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : as

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2015-06-18 20:06:59
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
-- Table structure for `card`
-- ----------------------------
DROP TABLE IF EXISTS `card`;
CREATE TABLE `card` (
  `cardID` varchar(255) NOT NULL DEFAULT '',
  `check` int(10) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`cardID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of card
-- ----------------------------
INSERT INTO `card` VALUES ('1', '0000000000');
INSERT INTO `card` VALUES ('10', '0000000000');
INSERT INTO `card` VALUES ('2', '0000000000');
INSERT INTO `card` VALUES ('3', '0000000000');
INSERT INTO `card` VALUES ('4', '0000000000');
INSERT INTO `card` VALUES ('4c-60-81-00-14', '0000000000');
INSERT INTO `card` VALUES ('5', '0000000000');
INSERT INTO `card` VALUES ('5c-60-81-00-14', '0000000000');
INSERT INTO `card` VALUES ('6', '0000000000');
INSERT INTO `card` VALUES ('7', '0000000000');
INSERT INTO `card` VALUES ('8', '0000000000');
INSERT INTO `card` VALUES ('9', '0000000000');

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
  UNIQUE KEY `cid` (`cardID`),
  CONSTRAINT `stuinfo_ibfk_1` FOREIGN KEY (`cardID`) REFERENCES `card` (`cardID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stuinfo
-- ----------------------------
INSERT INTO `stuinfo` VALUES ('1', '小明', null, '王大锤', '18888888888', '4c-60-81-00-14');
INSERT INTO `stuinfo` VALUES ('2', '小张', null, '隔壁老王', '13111111111', '5c-60-81-00-14');
INSERT INTO `stuinfo` VALUES ('3', 'z', null, '', '', '1');
INSERT INTO `stuinfo` VALUES ('4', null, null, null, null, '2');
INSERT INTO `stuinfo` VALUES ('5', null, null, null, null, '3');
INSERT INTO `stuinfo` VALUES ('6', null, null, null, null, '4');
INSERT INTO `stuinfo` VALUES ('7', null, null, null, null, '5');
INSERT INTO `stuinfo` VALUES ('8', null, null, null, null, '6');
INSERT INTO `stuinfo` VALUES ('9', null, null, null, null, '7');
INSERT INTO `stuinfo` VALUES ('10', null, null, null, null, '8');
INSERT INTO `stuinfo` VALUES ('11', null, null, null, null, '9');
INSERT INTO `stuinfo` VALUES ('12', null, null, null, null, '10');

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
