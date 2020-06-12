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

 Date: 12/06/2020 20:38:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gh
-- ----------------------------
DROP TABLE IF EXISTS `gh`;
CREATE TABLE `gh`  (
  `ghid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gid` int(0) UNSIGNED NOT NULL,
  `hid` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`ghid`) USING BTREE,
  INDEX `fk_gh_human`(`hid`) USING BTREE,
  UNIQUE INDEX `uq_gh__gid_hid`(`gid`, `hid`) USING BTREE,
  CONSTRAINT `fk_gh_group` FOREIGN KEY (`gid`) REFERENCES `group` (`gid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_gh_human` FOREIGN KEY (`hid`) REFERENCES `human` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gh
-- ----------------------------
INSERT INTO `gh` VALUES (1, 1, 1);
INSERT INTO `gh` VALUES (2, 1, 2);
INSERT INTO `gh` VALUES (3, 2, 2);

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
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES (1, 'Developer', 'Developer');
INSERT INTO `group` VALUES (2, 'Manager', 'Management');

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
-- Records of human
-- ----------------------------
INSERT INTO `human` VALUES (1, 'Stone');
INSERT INTO `human` VALUES (2, 'Star');

-- ----------------------------
-- Table structure for pgr
-- ----------------------------
DROP TABLE IF EXISTS `pgr`;
CREATE TABLE `pgr`  (
  `pgr` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(0) UNSIGNED NOT NULL,
  `gid` int(0) UNSIGNED NOT NULL,
  `rid` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`pgr`) USING BTREE,
  INDEX `fk_pgr_pid`(`pid`) USING BTREE,
  INDEX `fk_pgr_gid`(`gid`) USING BTREE,
  INDEX `fk_pgr_rid`(`rid`) USING BTREE,
  CONSTRAINT `fk_pgr_gid` FOREIGN KEY (`gid`) REFERENCES `group` (`gid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_pgr_pid` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_pgr_rid` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pgr
-- ----------------------------
INSERT INTO `pgr` VALUES (1, 1, 1, 1);
INSERT INTO `pgr` VALUES (2, 2, 1, 1);
INSERT INTO `pgr` VALUES (3, 3, 1, 1);
INSERT INTO `pgr` VALUES (4, 1, 2, 2);

-- ----------------------------
-- Table structure for phr
-- ----------------------------
DROP TABLE IF EXISTS `phr`;
CREATE TABLE `phr`  (
  `phid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(0) UNSIGNED NOT NULL,
  `hid` int(0) UNSIGNED NOT NULL,
  `rid` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`phid`) USING BTREE,
  INDEX `fk_phr_pid`(`pid`) USING BTREE,
  INDEX `fk_phr_hid`(`hid`) USING BTREE,
  INDEX `fk_phr_rid`(`rid`) USING BTREE,
  CONSTRAINT `fk_phr_hid` FOREIGN KEY (`hid`) REFERENCES `human` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_phr_pid` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_phr_rid` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of phr
-- ----------------------------
INSERT INTO `phr` VALUES (1, 1, 1, 1);
INSERT INTO `phr` VALUES (2, 2, 1, 1);
INSERT INTO `phr` VALUES (3, 3, 1, 1);

-- ----------------------------
-- Table structure for plog
-- ----------------------------
DROP TABLE IF EXISTS `plog`;
CREATE TABLE `plog`  (
  `lid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `pid` int(0) UNSIGNED NOT NULL COMMENT 'Project ID',
  `action` int(0) NOT NULL COMMENT 'Action',
  `aname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Action Name',
  `target_id` int(0) UNSIGNED NULL DEFAULT 0 COMMENT 'The Target ID',
  `target_type` int(0) NULL DEFAULT 0 COMMENT 'Target Type',
  `content` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'content',
  `dt` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT 'log time',
  PRIMARY KEY (`lid`) USING BTREE,
  INDEX `fk_log_task`(`pid`) USING BTREE,
  CONSTRAINT `fk_plog_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of plog
-- ----------------------------
INSERT INTO `plog` VALUES (1, 1, 1, 'Created Project', 0, 0, 'Created Project', '2020-06-12 18:44:37');
INSERT INTO `plog` VALUES (2, 2, 1, 'Created Project', 0, 0, 'Created Project', '2020-06-12 18:44:49');
INSERT INTO `plog` VALUES (3, 3, 1, 'Created Project', 0, 0, 'Created Project', '2020-06-12 18:44:59');
INSERT INTO `plog` VALUES (4, 1, 2, 'PGR', 1, 0, 'P1<-G1', '2020-06-12 20:16:54');
INSERT INTO `plog` VALUES (5, 1, 2, 'PGR', 2, 0, 'P1<-G2', '2020-06-12 20:17:20');

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
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (1, 'Eureka', 'Eureka Math Moduling');
INSERT INTO `project` VALUES (2, 'Winning', 'Winning Trade Software');
INSERT INTO `project` VALUES (3, 'SpaceForce', 'SpaceForce IDE (Integrated Development Environment)');

-- ----------------------------
-- Table structure for pschedule
-- ----------------------------
DROP TABLE IF EXISTS `pschedule`;
CREATE TABLE `pschedule`  (
  `sid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'schedule id',
  `pid` int(0) UNSIGNED NOT NULL COMMENT 'project id',
  `stime` datetime(0) NOT NULL COMMENT 'start time',
  `etime` datetime(0) NOT NULL COMMENT 'end time',
  `duration` int(0) NULL DEFAULT NULL COMMENT 'duration',
  `state` int(0) NOT NULL COMMENT 'the status of the schedule',
  `why` int(0) NULL DEFAULT NULL COMMENT 'the reason of change ',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hid` int(0) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `fk_pschedule_project`(`pid`) USING BTREE,
  INDEX `fk_pshedule_human`(`hid`) USING BTREE,
  CONSTRAINT `fk_pschedule_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_pshedule_human` FOREIGN KEY (`hid`) REFERENCES `human` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pschedule
-- ----------------------------

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
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'Developer', 'Developer');
INSERT INTO `role` VALUES (2, 'Manager', 'Management');

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
  PRIMARY KEY (`tid`) USING BTREE,
  INDEX `fk_task_project`(`pid`) USING BTREE,
  INDEX `fk_task_parent_task`(`ptid`) USING BTREE,
  CONSTRAINT `fk_task_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, 'Moduling Eureka', 1, 'Moduling Eureka', 0);
INSERT INTO `task` VALUES (2, 'Moduling Trade', 1, 'Moduling Trade', 0);

-- ----------------------------
-- Table structure for tgr
-- ----------------------------
DROP TABLE IF EXISTS `tgr`;
CREATE TABLE `tgr`  (
  `tgid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tid` int(0) UNSIGNED NOT NULL,
  `gid` int(0) UNSIGNED NOT NULL,
  `rid` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`tgid`) USING BTREE,
  INDEX `fk_thr_group`(`tid`) USING BTREE,
  INDEX `fk_tgr_group`(`gid`) USING BTREE,
  INDEX `fk_tgr_role`(`rid`) USING BTREE,
  CONSTRAINT `fk_thr_task` FOREIGN KEY (`tid`) REFERENCES `task` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tgr_group` FOREIGN KEY (`gid`) REFERENCES `group` (`gid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tgr_role` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tgr
-- ----------------------------
INSERT INTO `tgr` VALUES (1, 1, 1, 1);
INSERT INTO `tgr` VALUES (2, 2, 1, 1);

-- ----------------------------
-- Table structure for thr
-- ----------------------------
DROP TABLE IF EXISTS `thr`;
CREATE TABLE `thr`  (
  `thid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tid` int(0) UNSIGNED NOT NULL,
  `hid` int(0) UNSIGNED NOT NULL,
  `rid` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`thid`) USING BTREE,
  INDEX `fk_th_task`(`tid`) USING BTREE,
  INDEX `fk_th_human`(`hid`) USING BTREE,
  INDEX `fk_th_rid`(`rid`) USING BTREE,
  CONSTRAINT `fk_th_human` FOREIGN KEY (`hid`) REFERENCES `human` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_th_rid` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_th_task` FOREIGN KEY (`tid`) REFERENCES `task` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of thr
-- ----------------------------
INSERT INTO `thr` VALUES (1, 1, 1, 1);
INSERT INTO `thr` VALUES (2, 2, 1, 1);

-- ----------------------------
-- Table structure for tlog
-- ----------------------------
DROP TABLE IF EXISTS `tlog`;
CREATE TABLE `tlog`  (
  `lid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `tid` int(0) UNSIGNED NOT NULL COMMENT 'Task ID',
  `action` int(0) NOT NULL COMMENT 'Action',
  `target_id` int(0) UNSIGNED NULL DEFAULT 0 COMMENT 'Target ID',
  `target_type` int(0) NULL DEFAULT 0 COMMENT 'Target Type',
  `aname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Action Name',
  `content` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'content',
  PRIMARY KEY (`lid`) USING BTREE,
  INDEX `fk_log_task`(`tid`) USING BTREE,
  CONSTRAINT `fk_log_task` FOREIGN KEY (`tid`) REFERENCES `task` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tlog
-- ----------------------------

-- ----------------------------
-- Table structure for tschedule
-- ----------------------------
DROP TABLE IF EXISTS `tschedule`;
CREATE TABLE `tschedule`  (
  `sid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'schedule id',
  `tid` int(0) UNSIGNED NOT NULL COMMENT 'task id',
  `stime` datetime(0) NOT NULL COMMENT 'start time',
  `etime` datetime(0) NOT NULL COMMENT 'end time',
  `duration` int(0) NULL DEFAULT NULL COMMENT 'duration',
  `state` int(0) NOT NULL COMMENT 'the status of the schedule',
  `why` int(0) NULL DEFAULT NULL COMMENT 'the reason of change ',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hid` int(0) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`sid`) USING BTREE,
  INDEX `fk_tschedule_task`(`tid`) USING BTREE,
  INDEX `fk_tschedule_human`(`hid`) USING BTREE,
  CONSTRAINT `fk_tschedule_human` FOREIGN KEY (`hid`) REFERENCES `human` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tschedule_task` FOREIGN KEY (`tid`) REFERENCES `task` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tschedule
-- ----------------------------

-- ----------------------------
-- View structure for v_pghr
-- ----------------------------
DROP VIEW IF EXISTS `v_pghr`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_pghr` AS select `p`.`pid` AS `pid`,`p`.`pname` AS `pname`,`p`.`content` AS `pcontent`,`h`.`human` AS `human`,`r`.`rname` AS `rname`,`r`.`content` AS `rcontent`,`g`.`gname` AS `gname`,`pgr`.`gid` AS `gid`,`pgr`.`rid` AS `rid`,`h`.`hid` AS `hid` from (((((`project` `p` join `pgr` on((`p`.`pid` = `pgr`.`pid`))) join `group` `g` on((`pgr`.`gid` = `g`.`gid`))) join `gh` on((`g`.`gid` = `gh`.`gid`))) join `human` `h` on((`gh`.`hid` = `h`.`hid`))) join `role` `r` on((`pgr`.`rid` = `r`.`rid`)));

-- ----------------------------
-- View structure for v_pgr
-- ----------------------------
DROP VIEW IF EXISTS `v_pgr`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_pgr` AS select `pgr`.`pgr` AS `pgr`,`pgr`.`pid` AS `pid`,`pgr`.`gid` AS `gid`,`pgr`.`rid` AS `rid`,`g`.`gname` AS `gname`,`r`.`rname` AS `rname` from (((`project` `p` join `pgr` on((`p`.`pid` = `pgr`.`pid`))) join `group` `g` on((`pgr`.`gid` = `g`.`gid`))) join `role` `r` on((`pgr`.`rid` = `r`.`rid`)));

-- ----------------------------
-- View structure for v_phr
-- ----------------------------
DROP VIEW IF EXISTS `v_phr`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_phr` AS select `h`.`human` AS `human`,`r`.`rname` AS `rname`,`p`.`pid` AS `pid`,`p`.`pname` AS `pname`,`p`.`content` AS `content`,`phr`.`hid` AS `hid`,`phr`.`rid` AS `rid` from (((`project` `p` join `phr` on((`p`.`pid` = `phr`.`pid`))) join `human` `h` on((`phr`.`hid` = `h`.`hid`))) join `role` `r` on((`phr`.`rid` = `r`.`rid`)));

-- ----------------------------
-- View structure for v_tghr
-- ----------------------------
DROP VIEW IF EXISTS `v_tghr`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_tghr` AS select `tgr`.`tgid` AS `tgid`,`tgr`.`tid` AS `tid`,`tgr`.`gid` AS `gid`,`tgr`.`rid` AS `rid`,`t`.`tname` AS `tname`,`t`.`pid` AS `pid`,`h`.`human` AS `human`,`g`.`gname` AS `gname`,`h`.`hid` AS `hid`,`p`.`pname` AS `pname` from (((((`tgr` join `task` `t` on((`tgr`.`tid` = `t`.`tid`))) join `group` `g` on((`tgr`.`gid` = `g`.`gid`))) join `gh` on((`g`.`gid` = `gh`.`gid`))) join `human` `h` on((`gh`.`hid` = `h`.`hid`))) join `project` `p` on((`t`.`pid` = `p`.`pid`)));

-- ----------------------------
-- View structure for v_tgr
-- ----------------------------
DROP VIEW IF EXISTS `v_tgr`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_tgr` AS select `tgr`.`tgid` AS `tgid`,`tgr`.`tid` AS `tid`,`tgr`.`gid` AS `gid`,`tgr`.`rid` AS `rid`,`t`.`tname` AS `tname`,`t`.`pid` AS `pid`,`g`.`gname` AS `gname`,`r`.`rname` AS `rname` from ((((`tgr` join `task` `t` on((`tgr`.`tid` = `t`.`tid`))) join `group` `g` on((`tgr`.`gid` = `g`.`gid`))) join `role` `r` on((`tgr`.`rid` = `r`.`rid`))) join `project` `p` on((`t`.`pid` = `p`.`pid`)));

-- ----------------------------
-- View structure for v_thr
-- ----------------------------
DROP VIEW IF EXISTS `v_thr`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_thr` AS select `thr`.`thid` AS `thid`,`thr`.`tid` AS `tid`,`thr`.`hid` AS `hid`,`t`.`tname` AS `tname`,`t`.`pid` AS `pid`,`h`.`human` AS `human`,`thr`.`rid` AS `rid`,`r`.`rname` AS `rname`,`p`.`pname` AS `pname` from ((((`thr` join `task` `t` on((`thr`.`tid` = `t`.`tid`))) join `human` `h` on((`thr`.`hid` = `h`.`hid`))) join `role` `r` on((`thr`.`rid` = `r`.`rid`))) join `project` `p` on((`t`.`pid` = `p`.`pid`)));

SET FOREIGN_KEY_CHECKS = 1;
