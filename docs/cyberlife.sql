/*
 Navicat Premium Data Transfer

 Source Server         : CyberLife
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:33996
 Source Schema         : cyberlife

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 12/06/2020 08:30:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ghr
-- ----------------------------
DROP TABLE IF EXISTS `ghr`;
CREATE TABLE `ghr`  (
  `ghid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gid` int(0) UNSIGNED NOT NULL,
  `hid` int(0) UNSIGNED NOT NULL,
  `rid` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`ghid`) USING BTREE,
  INDEX `fk_gh_group`(`gid`) USING BTREE,
  INDEX `fk_gh_human`(`hid`) USING BTREE,
  INDEX `fk_gh_role`(`rid`) USING BTREE,
  CONSTRAINT `fk_gh_group` FOREIGN KEY (`gid`) REFERENCES `group` (`gid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_gh_human` FOREIGN KEY (`hid`) REFERENCES `human` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_gh_role` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`  (
  `gid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Group ID',
  `gname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Group Name',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Group Content',
  PRIMARY KEY (`gid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for human
-- ----------------------------
DROP TABLE IF EXISTS `human`;
CREATE TABLE `human`  (
  `hid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'human id',
  `human` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'human name',
  PRIMARY KEY (`hid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mylog
-- ----------------------------
DROP TABLE IF EXISTS `mylog`;
CREATE TABLE `mylog`  (
  `lid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `action` int(0) NOT NULL COMMENT 'Action',
  `aname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Action Name',
  `content` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'content',
  PRIMARY KEY (`lid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `pid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Project ID',
  `pname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Project Name',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Project Content',
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `rid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Role ID',
  `rname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Role Name',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Role Content',
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task`  (
  `tid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Task ID',
  `tname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Task Name',
  `pid` int(0) UNSIGNED NOT NULL COMMENT 'Project ID',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Task Content',
  `ptid` int(0) UNSIGNED NULL DEFAULT 0 COMMENT 'Parent Task ID',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for thr
-- ----------------------------
DROP TABLE IF EXISTS `thr`;
CREATE TABLE `thr`  (
  `thid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tid` int(0) UNSIGNED NOT NULL,
  `hid` int(0) UNSIGNED NOT NULL,
  `rid` int(0) UNSIGNED NOT NULL,
  `gid` int(0) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`thid`) USING BTREE,
  INDEX `fk_th_task`(`tid`) USING BTREE,
  INDEX `fk_th_human`(`hid`) USING BTREE,
  INDEX `fk_th_rid`(`rid`) USING BTREE,
  INDEX `fk_th_gid`(`gid`) USING BTREE,
  CONSTRAINT `fk_th_gid` FOREIGN KEY (`gid`) REFERENCES `group` (`gid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_th_human` FOREIGN KEY (`hid`) REFERENCES `human` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_th_rid` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_th_task` FOREIGN KEY (`tid`) REFERENCES `task` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
