/*
 Navicat MySQL Data Transfer

 Source Server         : cyberlife
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:33369
 Source Schema         : cyberlife

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 28/06/2020 10:05:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for action
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action`  (
  `aid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Action ID',
  `bid` int(0) UNSIGNED NOT NULL COMMENT 'Behavior',
  `aname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Action Name',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Content',
  `tid` int(0) UNSIGNED NOT NULL COMMENT 'Task ID',
  `percent` double NOT NULL DEFAULT 0 COMMENT 'Complete Percent',
  `stime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT 'Start Time',
  `etime` datetime(0) NULL DEFAULT NULL COMMENT 'EndTime',
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `fk_action_task`(`tid`) USING BTREE,
  INDEX `fk_action_behavior`(`bid`) USING BTREE,
  CONSTRAINT `fk_action_behavior` FOREIGN KEY (`bid`) REFERENCES `behavior` (`bid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_action_task` FOREIGN KEY (`tid`) REFERENCES `task` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of action
-- ----------------------------
INSERT INTO `action` VALUES (1, 2, 'Design Cyberlife database', 'Design Cyberlife database', 5, 10, '2020-06-14 15:30:36', '2020-06-14 16:01:48');
INSERT INTO `action` VALUES (2, 3, 'Find The Data In TBplus And HD', 'Find The Data In TBplus And HD', 4, 0, '2020-06-14 21:51:45', '2020-06-14 22:24:53');
INSERT INTO `action` VALUES (3, 4, 'Debug CloudLab', 'Debug CloudLab', 6, 0, '2020-06-14 15:45:21', '2020-06-14 19:00:30');
INSERT INTO `action` VALUES (4, 5, 'Observe Price Wave', 'Observe Price Wave, re group-5', 14, 10, '2020-06-14 22:45:58', '2020-06-14 22:55:01');
INSERT INTO `action` VALUES (5, 5, 'Observe Price Wave', 'Observe Price Wave re group-5', 14, 20, '2020-06-15 00:53:48', '2020-06-15 01:30:22');

-- ----------------------------
-- Table structure for behavior
-- ----------------------------
DROP TABLE IF EXISTS `behavior`;
CREATE TABLE `behavior`  (
  `bid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of behavior
-- ----------------------------
INSERT INTO `behavior` VALUES (1, 'slow walk', 'normal walk, slow');
INSERT INTO `behavior` VALUES (2, 'Design Ralational Database', 'design database');
INSERT INTO `behavior` VALUES (3, 'Data Mantainance', 'coding, convert, transpot');
INSERT INTO `behavior` VALUES (4, 'Debug', 'Debug, Communication with User Or PM Or PM');
INSERT INTO `behavior` VALUES (5, 'Observe Price Wave', 'Observe Price Wave');

-- ----------------------------
-- Table structure for gh
-- ----------------------------
DROP TABLE IF EXISTS `gh`;
CREATE TABLE `gh`  (
  `ghid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gid` int(0) UNSIGNED NOT NULL,
  `hid` int(0) UNSIGNED NOT NULL,
  PRIMARY KEY (`ghid`) USING BTREE,
  UNIQUE INDEX `uq_gh__gid_hid`(`gid`, `hid`) USING BTREE,
  INDEX `fk_gh_human`(`hid`) USING BTREE,
  CONSTRAINT `fk_gh_group` FOREIGN KEY (`gid`) REFERENCES `group` (`gid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_gh_human` FOREIGN KEY (`hid`) REFERENCES `human` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of human
-- ----------------------------
INSERT INTO `human` VALUES (1, 'Stone');
INSERT INTO `human` VALUES (2, 'Star');

-- ----------------------------
-- Table structure for pdepend
-- ----------------------------
DROP TABLE IF EXISTS `pdepend`;
CREATE TABLE `pdepend`  (
  `pdid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(0) UNSIGNED NOT NULL DEFAULT 0,
  `dpid` int(0) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`pdid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pdepend
-- ----------------------------
INSERT INTO `pdepend` VALUES (1, 1, 5);
INSERT INTO `pdepend` VALUES (2, 2, 5);
INSERT INTO `pdepend` VALUES (3, 3, 5);
INSERT INTO `pdepend` VALUES (4, 2, 1);
INSERT INTO `pdepend` VALUES (5, 3, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
  `hid` int(0) UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`lid`) USING BTREE,
  INDEX `fk_log_task`(`pid`) USING BTREE,
  INDEX `fk_plog_human`(`hid`) USING BTREE,
  CONSTRAINT `fk_plog_human` FOREIGN KEY (`hid`) REFERENCES `human` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_plog_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of plog
-- ----------------------------
INSERT INTO `plog` VALUES (1, 1, 1, 'Created Project', 0, 0, 'Created Project', '2020-06-13 19:56:10', 1);
INSERT INTO `plog` VALUES (2, 2, 1, 'Created Project', 0, 0, 'Created Project', '2020-06-13 19:56:11', 1);
INSERT INTO `plog` VALUES (3, 3, 1, 'Created Project', 0, 0, 'Created Project', '2020-06-13 19:56:11', 1);
INSERT INTO `plog` VALUES (4, 1, 2, 'PGR', 1, 0, 'P1<-G1', '2020-06-13 19:56:12', 1);
INSERT INTO `plog` VALUES (5, 1, 2, 'PGR', 2, 0, 'P1<-G2', '2020-06-13 19:56:15', 1);
INSERT INTO `plog` VALUES (6, 2, 3, 'Change Project Propertis', 0, 0, 'Change Name to Ballet', '2020-06-14 15:30:21', 1);
INSERT INTO `plog` VALUES (7, 10, 1, 'Created Project', 0, 0, 'Create Project Winning', '2020-06-14 15:31:10', 1);
INSERT INTO `plog` VALUES (8, 11, 1, 'Created Project', 0, 0, 'Created Project Cyberlife', '2020-06-14 15:58:41', 1);

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `pid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Project ID',
  `pname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Project Name',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Project Content',
  `pptype` enum('public','private') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'public',
  `repository` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `status` int(0) UNSIGNED NULL DEFAULT 0 COMMENT 'Not Start, In the zone, Fineshed, hang up, etc',
  `uptime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (1, 'Eureka', 'Eureka Math Moduling', 'public', '', 1, '2020-06-14 15:28:38');
INSERT INTO `project` VALUES (2, 'Ballet', 'CTP Interfaces And Utilits', 'public', 'https://gitlab.com/winner_trading/ballet', 1, '2020-06-14 15:29:14');
INSERT INTO `project` VALUES (3, 'SpaceForce', 'SpaceForce IDE (Integrated Development Environment)', 'public', '', 0, '2020-06-13 19:54:50');
INSERT INTO `project` VALUES (4, 'Numen', 'Bodyguard Of The System', 'public', '', 0, '2020-06-13 19:54:50');
INSERT INTO `project` VALUES (5, 'Painting', 'The Visullazation Componets And Framework', 'public', '', 0, '2020-06-13 19:54:50');
INSERT INTO `project` VALUES (6, 'Health', 'The Health', 'private', '', 0, '2020-06-13 20:00:33');
INSERT INTO `project` VALUES (7, 'Family', 'Family', 'private', '', 0, '2020-06-13 20:01:25');
INSERT INTO `project` VALUES (8, 'Social', 'Social', 'private', '', 0, '2020-06-13 20:02:36');
INSERT INTO `project` VALUES (9, 'Study', 'Study', 'private', '', 0, '2020-06-14 12:46:16');
INSERT INTO `project` VALUES (10, 'Winning', 'Winning Trade Software', 'public', '', 0, '2020-06-14 15:29:36');
INSERT INTO `project` VALUES (11, 'CyberLift', 'CyberLife Software', 'public', 'https://github.com/StoneGo/CyberLife', 1, '2020-06-14 15:58:03');
INSERT INTO `project` VALUES (12, 'CloudLab Webapp', 'CloudLab Webapp', 'public', 'https://github.com/CloudLab-BIT/webapp', 1, '2020-06-14 16:53:32');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pschedule
-- ----------------------------

-- ----------------------------
-- Table structure for rateaction
-- ----------------------------
DROP TABLE IF EXISTS `rateaction`;
CREATE TABLE `rateaction`  (
  `raid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `aid` int(0) UNSIGNED NOT NULL COMMENT 'action id',
  `perfomence` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Perfomence',
  `emotion` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Emotion',
  `health` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Health',
  `scheduled` enum('Y','N') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT 'Is scheduled?',
  `whynoplan` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Why do you no schedule?',
  `star` int(0) UNSIGNED NULL DEFAULT 0 COMMENT 'rating for action',
  `starwhy` int(0) NULL DEFAULT 0 COMMENT 'the reason for star',
  `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'the comments ',
  PRIMARY KEY (`raid`) USING BTREE,
  INDEX `fk_rateaction_action`(`aid`) USING BTREE,
  CONSTRAINT `fk_rate_action` FOREIGN KEY (`aid`) REFERENCES `action` (`aid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of rateaction
-- ----------------------------

-- ----------------------------
-- Table structure for rateskill
-- ----------------------------
DROP TABLE IF EXISTS `rateskill`;
CREATE TABLE `rateskill`  (
  `rskid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `skid` int(0) NOT NULL,
  `rate` int(0) UNSIGNED NOT NULL DEFAULT 0,
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `rtime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`rskid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rateskill
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'Developer', 'Developer');
INSERT INTO `role` VALUES (2, 'Manager', 'Management');

-- ----------------------------
-- Table structure for skill
-- ----------------------------
DROP TABLE IF EXISTS `skill`;
CREATE TABLE `skill`  (
  `skid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Skill ID',
  `skill` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Skill Name',
  `level` int(0) NOT NULL DEFAULT 0 COMMENT 'The Skill Level',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`skid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of skill
-- ----------------------------

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
  `iid` int(0) UNSIGNED NULL DEFAULT 0,
  `iuri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`tid`) USING BTREE,
  INDEX `fk_task_project`(`pid`) USING BTREE,
  INDEX `fk_task_parent_task`(`ptid`) USING BTREE,
  CONSTRAINT `fk_task_project` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES (1, 'Moduling Eureka', 1, 'Moduling Eureka', 0, 0, '');
INSERT INTO `task` VALUES (2, 'Moduling Trade', 1, 'Moduling Trade', 0, 0, '');
INSERT INTO `task` VALUES (3, 'Maintenance Data For Ballet', 2, 'Trans Data From TBplus To csv, then covert to tick bin', 0, 0, '');
INSERT INTO `task` VALUES (4, 'The Data From 2019.11 to 2020.6.13', 2, 'The Data From 2019.11 to 2020.6.13', 3, 1, 'https://gitlab.com/winner_trading/ballet/-/issues/1');
INSERT INTO `task` VALUES (5, 'Design CyberLife Database', 11, 'Design CyberLife Database', 0, 0, '');
INSERT INTO `task` VALUES (6, 'Develop CloudLab Webapp', 12, 'Develop CloudLab webapp', 0, 0, '');
INSERT INTO `task` VALUES (7, 'The Data From 2020.5.23-5.31', 2, 'The Data From 2020.5.23-5.31, convert from tb-cvs', 4, 0, 'https://gitlab.com/winner_trading/ballet/-/issues/2');
INSERT INTO `task` VALUES (8, 'The Data From 2020.6.1-now', 2, 'The Data From 2020.6.1-now', 4, 0, '');
INSERT INTO `task` VALUES (9, 'The DataReceiver Did not work', 2, 'The DataReceiver Did not work', 3, 0, 'https://gitlab.com/winner_trading/ballet/-/issues/4');
INSERT INTO `task` VALUES (10, 'The Data 2020.FEB', 2, 'The Data 2020.FEB', 4, 0, 'https://gitlab.com/winner_trading/ballet/-/issues/5');
INSERT INTO `task` VALUES (11, 'The Data 2019.11-2019.12', 2, 'The Data 2019.11-2019.12', 4, 0, 'https://gitlab.com/winner_trading/ballet/-/issues/6');
INSERT INTO `task` VALUES (12, 'The Total Data', 2, 'The Total Data', 4, 0, 'https://gitlab.com/winner_trading/ballet/-/issues/7');
INSERT INTO `task` VALUES (13, 're group-5 branch', 1, 're group-5 branch', 1, 0, '');
INSERT INTO `task` VALUES (14, 'observ group-5', 1, 'observ group-5', 13, 0, '');

-- ----------------------------
-- Table structure for tdepend
-- ----------------------------
DROP TABLE IF EXISTS `tdepend`;
CREATE TABLE `tdepend`  (
  `tdid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tid` int(0) UNSIGNED NOT NULL DEFAULT 0,
  `dtid` int(0) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`tdid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tdepend
-- ----------------------------

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
  CONSTRAINT `fk_tgr_group` FOREIGN KEY (`gid`) REFERENCES `group` (`gid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tgr_role` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_thr_task` FOREIGN KEY (`tid`) REFERENCES `task` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

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
  `tlid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `tid` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Task ID',
  `action` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Action',
  `target_id` int(0) UNSIGNED NULL DEFAULT 0 COMMENT 'Target ID',
  `target_type` int(0) NULL DEFAULT 0 COMMENT 'Target Type',
  `aname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `dtime` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `content` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'content',
  `hid` int(0) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`tlid`) USING BTREE,
  INDEX `fk_log_task`(`tid`) USING BTREE,
  INDEX `fk_tlog_human`(`hid`) USING BTREE,
  CONSTRAINT `fk_tlog_human` FOREIGN KEY (`hid`) REFERENCES `human` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tlog_task` FOREIGN KEY (`tid`) REFERENCES `task` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tlog
-- ----------------------------
INSERT INTO `tlog` VALUES (1, 1, 1, 0, 0, 'Crate Task', '2020-06-14 15:34:27', '', 1);
INSERT INTO `tlog` VALUES (2, 2, 1, 0, 0, 'Crate Task', '2020-06-14 15:34:41', '', 1);

-- ----------------------------
-- Table structure for tomato
-- ----------------------------
DROP TABLE IF EXISTS `tomato`;
CREATE TABLE `tomato`  (
  `tmtid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Tomato Id',
  `stime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `etime` datetime(0) NULL DEFAULT NULL,
  `durantion` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Tomato Time',
  `aid` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Action ID',
  `star` int(0) NULL DEFAULT 0 COMMENT 'Rating Star',
  `reason` int(0) NULL DEFAULT 0 COMMENT 'Reason Why',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'Comment',
  PRIMARY KEY (`tmtid`) USING BTREE,
  INDEX `fk_tomato_action`(`aid`) USING BTREE,
  CONSTRAINT `fk_tomato_action` FOREIGN KEY (`aid`) REFERENCES `action` (`aid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tomato
-- ----------------------------
INSERT INTO `tomato` VALUES (1, '2020-06-14 21:52:27', '2020-06-14 22:24:24', 25, 2, 0, 0, '');

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
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tschedule
-- ----------------------------

-- ----------------------------
-- Table structure for tsk
-- ----------------------------
DROP TABLE IF EXISTS `tsk`;
CREATE TABLE `tsk`  (
  `tskid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tid` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Task ID',
  `skid` int(0) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Skill ID',
  PRIMARY KEY (`tskid`) USING BTREE,
  INDEX `fk_tsk_task`(`tid`) USING BTREE,
  INDEX `fk_tsk_skill`(`skid`) USING BTREE,
  CONSTRAINT `fk_tsk_skill` FOREIGN KEY (`skid`) REFERENCES `skill` (`skid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_tsk_task` FOREIGN KEY (`tid`) REFERENCES `task` (`tid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tsk
-- ----------------------------

-- ----------------------------
-- Table structure for workout
-- ----------------------------
DROP TABLE IF EXISTS `workout`;
CREATE TABLE `workout`  (
  `wid` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bid` int(0) UNSIGNED NOT NULL DEFAULT 0,
  `hid` int(0) UNSIGNED NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `qpg` int(0) UNSIGNED NOT NULL DEFAULT 0,
  `gnumber` int(0) UNSIGNED NOT NULL DEFAULT 0,
  `amount` int(0) UNSIGNED NULL DEFAULT 0,
  `stime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `etime` datetime(0) NULL DEFAULT NULL,
  `duration` int(0) UNSIGNED NULL DEFAULT 0,
  `hb` int(0) UNSIGNED NULL DEFAULT NULL,
  `star` int(0) UNSIGNED NULL DEFAULT 0,
  `reason` int(0) UNSIGNED NULL DEFAULT 0,
  `comments` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  PRIMARY KEY (`wid`) USING BTREE,
  INDEX `fk_workout_behavior`(`bid`) USING BTREE,
  INDEX `fk_workout_human`(`hid`) USING BTREE,
  CONSTRAINT `fk_workout_behavior` FOREIGN KEY (`bid`) REFERENCES `behavior` (`bid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_workout_human` FOREIGN KEY (`hid`) REFERENCES `human` (`hid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workout
-- ----------------------------
INSERT INTO `workout` VALUES (1, 1, 1, 'MtoZtoM', 3, 1, 3, '2020-06-14 08:26:37', '2020-06-14 09:16:42', 50, 80, 3, 3, '3 for no good sleep');

-- ----------------------------
-- View structure for v_action
-- ----------------------------
DROP VIEW IF EXISTS `v_action`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_action` AS select `a`.`aid` AS `aid`,`a`.`bid` AS `bid`,`a`.`aname` AS `aname`,`a`.`content` AS `content`,`a`.`tid` AS `tid`,`a`.`percent` AS `percent`,`a`.`stime` AS `stime`,`a`.`etime` AS `etime`,`b`.`bname` AS `bname`,`h`.`human` AS `human`,`t`.`tname` AS `tname`,`t`.`pid` AS `pid`,`p`.`pname` AS `pname`,`thr`.`hid` AS `hid`,`thr`.`rid` AS `rid`,`r`.`rname` AS `rname` from ((((((`action` `a` join `behavior` `b` on((`a`.`bid` = `b`.`bid`))) join `task` `t` on((`a`.`tid` = `t`.`tid`))) join `project` `p` on((`t`.`pid` = `p`.`pid`))) join `thr` on((`t`.`tid` = `thr`.`tid`))) join `human` `h` on((`thr`.`hid` = `h`.`hid`))) join `role` `r` on((`thr`.`rid` = `r`.`rid`)));

-- ----------------------------
-- View structure for v_pdepend
-- ----------------------------
DROP VIEW IF EXISTS `v_pdepend`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_pdepend` AS select `pd`.`pdid` AS `pdid`,`pd`.`pid` AS `pid`,`pd`.`dpid` AS `dpid`,`p1`.`pname` AS `pname`,`p2`.`pname` AS `dpname` from ((`pdepend` `pd` join `project` `p1` on((`pd`.`pid` = `p1`.`pid`))) join `project` `p2` on((`pd`.`dpid` = `p2`.`pid`)));

-- ----------------------------
-- View structure for v_pghr
-- ----------------------------
DROP VIEW IF EXISTS `v_pghr`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_pghr` AS select `p`.`pid` AS `pid`,`p`.`pname` AS `pname`,`p`.`content` AS `pcontent`,`h`.`human` AS `human`,`r`.`rname` AS `rname`,`r`.`content` AS `rcontent`,`g`.`gname` AS `gname`,`pgr`.`gid` AS `gid`,`pgr`.`rid` AS `rid`,`h`.`hid` AS `hid`,`p`.`repository` AS `repository`,`p`.`pptype` AS `pptype` from (((((`project` `p` join `pgr` on((`p`.`pid` = `pgr`.`pid`))) join `group` `g` on((`pgr`.`gid` = `g`.`gid`))) join `gh` on((`g`.`gid` = `gh`.`gid`))) join `human` `h` on((`gh`.`hid` = `h`.`hid`))) join `role` `r` on((`pgr`.`rid` = `r`.`rid`)));

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
-- View structure for v_tdepend
-- ----------------------------
DROP VIEW IF EXISTS `v_tdepend`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_tdepend` AS select `td`.`tdid` AS `tdid`,`td`.`tid` AS `tid`,`td`.`dtid` AS `dtid`,`t1`.`tname` AS `tname`,`t2`.`tname` AS `tpname` from ((`tdepend` `td` join `task` `t1` on((`td`.`tid` = `t1`.`tid`))) join `task` `t2` on((`td`.`dtid` = `t2`.`tid`)));

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

-- ----------------------------
-- View structure for v_tomato
-- ----------------------------
DROP VIEW IF EXISTS `v_tomato`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_tomato` AS select `tmt`.`tmtid` AS `tmtid`,`tmt`.`stime` AS `stime`,`tmt`.`etime` AS `etime`,`tmt`.`durantion` AS `durantion`,`tmt`.`aid` AS `aid`,`tmt`.`star` AS `star`,`tmt`.`reason` AS `reason`,`tmt`.`comment` AS `comment`,`a`.`aname` AS `aname`,`a`.`bid` AS `bid`,`a`.`tid` AS `tid`,`t`.`tname` AS `tname`,`t`.`pid` AS `pid`,`p`.`pname` AS `pname`,`thr`.`hid` AS `hid`,`thr`.`rid` AS `rid`,`r`.`rname` AS `rname` from ((((((`tomato` `tmt` join `action` `a` on((`tmt`.`aid` = `a`.`aid`))) join `behavior` `b` on((`a`.`bid` = `b`.`bid`))) join `task` `t` on((`a`.`tid` = `t`.`tid`))) join `project` `p` on((`t`.`pid` = `p`.`pid`))) join `thr` on((`t`.`tid` = `thr`.`tid`))) join `role` `r` on((`thr`.`rid` = `r`.`rid`)));

-- ----------------------------
-- View structure for v_workout
-- ----------------------------
DROP VIEW IF EXISTS `v_workout`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_workout` AS select `w`.`wid` AS `wid`,`w`.`bid` AS `bid`,`w`.`hid` AS `hid`,`w`.`content` AS `content`,`w`.`qpg` AS `qpg`,`w`.`gnumber` AS `gnumber`,`w`.`amount` AS `amount`,`w`.`stime` AS `stime`,`w`.`etime` AS `etime`,`w`.`star` AS `star`,`w`.`reason` AS `reason`,`w`.`comments` AS `comments`,`b`.`bname` AS `bname`,`human`.`human` AS `human`,`w`.`duration` AS `duration`,`w`.`hb` AS `hb` from ((`workout` `w` join `behavior` `b` on((`w`.`bid` = `b`.`bid`))) join `human` on((`w`.`hid` = `human`.`hid`)));

SET FOREIGN_KEY_CHECKS = 1;
