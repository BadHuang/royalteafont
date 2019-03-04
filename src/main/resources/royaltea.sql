/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50560
Source Host           : 127.0.0.1:3306
Source Database       : royaltea

Target Server Type    : MYSQL
Target Server Version : 50560
File Encoding         : 65001

Date: 2018-12-06 15:41:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for emp
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `E_ID` int(10) NOT NULL AUTO_INCREMENT,
  `E_LID` varchar(20) DEFAULT NULL,
  `E_PWD` varchar(20) DEFAULT NULL,
  `R_ID` int(10) DEFAULT NULL,
  `E_NAME` varchar(20) DEFAULT NULL,
  `E_SEX` int(1) DEFAULT NULL,
  `E_SALARY` decimal(8,2) DEFAULT NULL,
  `E_WORKTIME` datetime DEFAULT NULL,
  `E_BIRTHTIME` datetime DEFAULT NULL,
  `E_TEL` int(20) DEFAULT NULL,
  PRIMARY KEY (`E_ID`),
  KEY `FK_Relationship_1` (`R_ID`),
  CONSTRAINT `FK_Relationship_1` FOREIGN KEY (`R_ID`) REFERENCES `role` (`R_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `F_ID` int(10) NOT NULL AUTO_INCREMENT,
  `FT_ID` int(10) DEFAULT NULL,
  `F_NAME` varchar(20) DEFAULT NULL,
  `F_PRICE` decimal(5,2) DEFAULT NULL,
  `F_STATUE` int(1) NOT NULL DEFAULT '0',
  `F_IMAGE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`F_ID`),
  KEY `FK_Relationship_2` (`FT_ID`),
  CONSTRAINT `FK_Relationship_2` FOREIGN KEY (`FT_ID`) REFERENCES `foodtype` (`FT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for foodtype
-- ----------------------------
DROP TABLE IF EXISTS `foodtype`;
CREATE TABLE `foodtype` (
  `FT_ID` int(10) NOT NULL AUTO_INCREMENT,
  `FT_NAME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`FT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `O_ID` int(20) NOT NULL AUTO_INCREMENT,
  `O_DID` int(2) NOT NULL,
  `O_TIME` date DEFAULT NULL,
  `O_STATUE` int(1) NOT NULL DEFAULT '0',
  `O_TOTAL` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`O_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for orders_info
-- ----------------------------
DROP TABLE IF EXISTS `orders_info`;
CREATE TABLE `orders_info` (
  `OI_ID` int(10) NOT NULL AUTO_INCREMENT,
  `O_ID` int(20) DEFAULT NULL,
  `F_ID` int(10) DEFAULT NULL,
  `O_FNUM` int(2) DEFAULT NULL,
  PRIMARY KEY (`OI_ID`),
  KEY `FK_ORDERID` (`O_ID`),
  CONSTRAINT `FK_ORDERID` FOREIGN KEY (`O_ID`) REFERENCES `orders` (`O_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `R_ID` int(10) NOT NULL AUTO_INCREMENT,
  `R_NAME` varchar(20) DEFAULT NULL,
  `R_MINSALARY` decimal(8,2) DEFAULT NULL,
  `R_MAXSALARY` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`R_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
