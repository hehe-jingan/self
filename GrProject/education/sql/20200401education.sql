-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        10.0.21-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 education 的数据库结构
DROP DATABASE IF EXISTS `education`;
CREATE DATABASE IF NOT EXISTS `education` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `education`;


-- 导出  表 education.admin 结构
DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `indexId` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员Id',
  `name` varchar(50) DEFAULT NULL COMMENT '账号',
  `pass` varchar(50) DEFAULT NULL COMMENT '密码',
  `lastLoginDate` datetime DEFAULT NULL COMMENT '最后登录时间',
  `spare1` varchar(50) DEFAULT NULL COMMENT '备用字段1',
  `spare2` varchar(50) DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`indexId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- 正在导出表  education.admin 的数据：~2 rows (大约)
DELETE FROM `admin`;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`indexId`, `name`, `pass`, `lastLoginDate`, `spare1`, `spare2`) VALUES
	(1, 'admin', 'admin', '2020-04-02 01:02:38', NULL, NULL),
	(2, 'admin2', 'admin', '2020-03-25 15:58:07', NULL, NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


-- 导出  表 education.classes 结构
DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `indexId` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级表主键Id',
  `name` varchar(50) DEFAULT NULL COMMENT '班级名字',
  `isUse` varchar(50) DEFAULT NULL COMMENT '是否使用0 不使用 1使用中',
  `inputDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `inputName` varchar(50) DEFAULT NULL COMMENT '录入者',
  `modifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  `modifyName` varchar(50) DEFAULT NULL COMMENT '修改时间',
  `spare1` datetime DEFAULT NULL COMMENT '备用字段1',
  `spare2` varchar(50) DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`indexId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='班级表';

-- 正在导出表  education.classes 的数据：~3 rows (大约)
DELETE FROM `classes`;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` (`indexId`, `name`, `isUse`, `inputDate`, `inputName`, `modifyDate`, `modifyName`, `spare1`, `spare2`) VALUES
	(1, '软工一班', '1', '2020-03-26 00:29:11', 'admin', '2020-03-26 00:45:14', 'admin', NULL, NULL),
	(2, '软工二班', '1', '2020-03-26 00:45:22', 'admin', NULL, NULL, NULL, NULL),
	(3, '信工一班', '1', '2020-03-26 00:53:07', 'admin', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;


-- 导出  表 education.class_arrange 结构
DROP TABLE IF EXISTS `class_arrange`;
CREATE TABLE IF NOT EXISTS `class_arrange` (
  `indexId` int(11) NOT NULL AUTO_INCREMENT COMMENT '关联表主键',
  `classId` int(11) DEFAULT NULL COMMENT '班级Id',
  `caId` int(11) DEFAULT NULL COMMENT '课程安排Id',
  `inputDate` datetime DEFAULT NULL COMMENT '录入时间',
  `inputName` varchar(50) DEFAULT NULL COMMENT '录入者',
  `isUse` varchar(50) DEFAULT NULL COMMENT '是否使用中0:不使用 1：使用中',
  `modifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  `modifyName` varchar(50) DEFAULT NULL COMMENT '修改者',
  `spare1` varchar(50) DEFAULT NULL COMMENT '备用字段1',
  `spare2` varchar(50) DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`indexId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='班级课程关联表';

-- 正在导出表  education.class_arrange 的数据：~7 rows (大约)
DELETE FROM `class_arrange`;
/*!40000 ALTER TABLE `class_arrange` DISABLE KEYS */;
INSERT INTO `class_arrange` (`indexId`, `classId`, `caId`, `inputDate`, `inputName`, `isUse`, `modifyDate`, `modifyName`, `spare1`, `spare2`) VALUES
	(1, 1, 1, '2020-03-29 01:20:42', 'admin', '1', NULL, NULL, NULL, NULL),
	(9, 3, 1, '2020-03-29 14:50:54', 'admin', '1', NULL, NULL, NULL, NULL),
	(10, 2, 2, '2020-03-29 14:51:26', 'admin', '1', NULL, NULL, NULL, NULL),
	(11, 1, 3, '2020-03-29 14:51:32', 'admin', NULL, NULL, NULL, NULL, NULL),
	(12, 2, 3, '2020-03-29 22:23:35', 'admin', '1', NULL, NULL, NULL, NULL),
	(13, 2, 4, '2020-03-31 22:25:57', 'admin', NULL, NULL, NULL, NULL, NULL),
	(14, 2, 8, '2020-04-01 18:30:37', 'admin', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `class_arrange` ENABLE KEYS */;


-- 导出  表 education.course 结构
DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `indexId` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程表主键Id',
  `name` varchar(50) DEFAULT NULL COMMENT '课程名称',
  `is_use` varchar(50) DEFAULT NULL COMMENT '是否开设0：不开设 1：开设',
  `inputDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `inputName` varchar(50) DEFAULT NULL COMMENT '录入者',
  `modifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  `modifyName` varchar(50) DEFAULT NULL COMMENT '修改者',
  `spare1` varchar(50) DEFAULT NULL COMMENT '备用字段1',
  `spare2` varchar(50) DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`indexId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='课程表';

-- 正在导出表  education.course 的数据：~3 rows (大约)
DELETE FROM `course`;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` (`indexId`, `name`, `is_use`, `inputDate`, `inputName`, `modifyDate`, `modifyName`, `spare1`, `spare2`) VALUES
	(1, '职业生涯规划', '1', '2020-03-27 11:41:54', 'admin', '2020-03-27 12:13:55', '', NULL, NULL),
	(2, '高等数学', '1', '2020-03-27 11:47:19', 'admin', NULL, NULL, NULL, NULL),
	(5, '大学英语', '1', '2020-03-28 13:40:40', 'admin', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;


-- 导出  表 education.course_arrange 结构
DROP TABLE IF EXISTS `course_arrange`;
CREATE TABLE IF NOT EXISTS `course_arrange` (
  `indexId` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程安排表主键Id',
  `cid` int(11) DEFAULT NULL COMMENT '课程Id',
  `tid` int(11) DEFAULT NULL COMMENT '教师Id',
  `year` varchar(50) DEFAULT NULL COMMENT '学期',
  `isUse` varchar(50) DEFAULT NULL COMMENT '是否使用 0：不使用 1：使用中',
  `inputDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `inputName` varchar(50) DEFAULT NULL COMMENT '录入者',
  `modifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  `modifyName` varchar(50) DEFAULT NULL COMMENT '修改者',
  `spare1` varchar(50) DEFAULT NULL COMMENT '备用字段1',
  `spare2` varchar(50) DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`indexId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='课程安排表';

-- 正在导出表  education.course_arrange 的数据：~4 rows (大约)
DELETE FROM `course_arrange`;
/*!40000 ALTER TABLE `course_arrange` DISABLE KEYS */;
INSERT INTO `course_arrange` (`indexId`, `cid`, `tid`, `year`, `isUse`, `inputDate`, `inputName`, `modifyDate`, `modifyName`, `spare1`, `spare2`) VALUES
	(1, 1, 1, '201801', '1', '2020-03-27 21:58:34', 'admin', '2020-03-28 12:07:50', 'admin', NULL, NULL),
	(2, 1, 6, '201901', '1', '2020-03-27 22:36:09', 'admin', NULL, NULL, NULL, NULL),
	(3, 2, 6, '201902', '1', '2020-03-27 22:36:28', 'admin', NULL, NULL, NULL, NULL),
	(4, 5, 6, '201101', '1', '2020-03-28 12:16:32', 'admin', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `course_arrange` ENABLE KEYS */;


-- 导出  表 education.evaluation 结构
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `indexId` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价表主键Id',
  `sid` int(11) NOT NULL COMMENT '学生Id',
  `caid` int(11) NOT NULL COMMENT '课程安排Id',
  `score` decimal(4,1) DEFAULT NULL COMMENT '评分',
  `content` varchar(50) DEFAULT NULL COMMENT '评价内容',
  `year` varchar(50) DEFAULT NULL COMMENT '评价学期',
  `is_delete` varchar(50) DEFAULT '0' COMMENT '是否删除 1：已删除',
  `inputDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `inputName` varchar(50) DEFAULT NULL COMMENT '录入者',
  `modifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  `modifyName` varchar(50) DEFAULT NULL COMMENT '修改者',
  `spare1` varchar(50) DEFAULT NULL COMMENT '备用字段1',
  `spare2` varchar(50) DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`indexId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='评价表';

-- 正在导出表  education.evaluation 的数据：~4 rows (大约)
DELETE FROM `evaluation`;
/*!40000 ALTER TABLE `evaluation` DISABLE KEYS */;
INSERT INTO `evaluation` (`indexId`, `sid`, `caid`, `score`, `content`, `year`, `is_delete`, `inputDate`, `inputName`, `modifyDate`, `modifyName`, `spare1`, `spare2`) VALUES
	(2, 1, 3, 98.0, '很有意思的一次课程体验！！', '201902', '0', '2020-03-29 23:45:35', '张三', '2020-03-30 23:38:08', 'admin', '0009900000', NULL),
	(3, 1, 2, 100.0, '老师讲得好~生动形象很到位', '201901', '0', '2020-03-30 00:47:18', '张三', NULL, NULL, '0000000000', NULL),
	(4, 3, 1, 100.0, '讲得好！印象深刻！', '201801', '0', '2020-03-30 01:10:07', '王五', NULL, NULL, '0000000000', NULL),
	(5, 1, 4, 98.0, '很好！！！！', '201101', '0', '2020-04-01 18:25:23', '张三', NULL, NULL, '0000000000', NULL);
/*!40000 ALTER TABLE `evaluation` ENABLE KEYS */;


-- 导出  表 education.eva_item 结构
DROP TABLE IF EXISTS `eva_item`;
CREATE TABLE IF NOT EXISTS `eva_item` (
  `indexId` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键Id',
  `iname` varchar(50) DEFAULT NULL COMMENT '分项内容',
  PRIMARY KEY (`indexId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='评价分项';

-- 正在导出表  education.eva_item 的数据：~10 rows (大约)
DELETE FROM `eva_item`;
/*!40000 ALTER TABLE `eva_item` DISABLE KEYS */;
INSERT INTO `eva_item` (`indexId`, `iname`) VALUES
	(1, '教学态度认真，治学严谨，为人师表。。'),
	(2, '注意提示本门课程的学习方法和研究方法。'),
	(3, '讲课思路清晰，表达准确，重点突出，理论联系实际。'),
	(4, '根据课程实际，合理采用现代化教学手段，讲课形象生动，教学效果好。'),
	(5, '能认真布置和批改作业。'),
	(6, '不擅自停、调课，上课不迟到，不早退。'),
	(7, '教学方法灵活多样，能激发对本课程的学习兴趣。'),
	(8, '课件制作精美，教学软件使用恰当。'),
	(9, '注意与学生交流，教学氛围好。'),
	(10, '注重引导学生参加课堂，启发培养学生思维。');
/*!40000 ALTER TABLE `eva_item` ENABLE KEYS */;


-- 导出  表 education.student 结构
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `indexId` int(11) NOT NULL AUTO_INCREMENT COMMENT '学生表主键ID',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(50) DEFAULT NULL COMMENT '性别',
  `age` varchar(50) DEFAULT NULL COMMENT '年龄',
  `pass` varchar(50) DEFAULT NULL COMMENT '密码',
  `classId` int(11) DEFAULT '0' COMMENT '班级Id 没班级则为0',
  `inputDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `inputName` varchar(50) DEFAULT NULL COMMENT '录入者',
  `modifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  `modifyName` varchar(50) DEFAULT NULL COMMENT '修改者',
  `spare1` varchar(50) DEFAULT NULL COMMENT '备用字段1',
  `spare2` varchar(50) DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`indexId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='学生表';

-- 正在导出表  education.student 的数据：~11 rows (大约)
DELETE FROM `student`;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`indexId`, `name`, `sex`, `age`, `pass`, `classId`, `inputDate`, `inputName`, `modifyDate`, `modifyName`, `spare1`, `spare2`) VALUES
	(1, '张三', '男', '21', '123', 2, '2020-03-25 23:17:49', 'admin', '2020-03-29 21:34:58', 'admin', '120032501', NULL),
	(2, '李四', '女', '19', '123', 2, '2020-03-25 23:39:09', 'admin', '2020-04-02 00:33:33', 'admin', '120032502', NULL),
	(3, '王五', '男', '22', '123', 1, '2020-03-26 22:24:57', 'admin', '2020-03-27 02:23:30', 'admin', '120032601', NULL),
	(4, '赵六', '男', '21', '123', 1, '2020-03-26 22:27:14', 'admin', '2020-03-27 02:23:30', 'admin', '120032602', NULL),
	(5, '赵美丽', '女', '22', '123', 1, '2020-03-26 22:27:35', 'admin', '2020-03-27 02:23:30', 'admin', '120032603', NULL),
	(6, '钱七', '男', '18', '123', 0, '2020-03-27 11:32:32', 'admin', NULL, NULL, '120032701', NULL),
	(7, '孙八', '女', '19', '123', 0, '2020-03-27 11:59:47', 'admin', NULL, NULL, '120032702', NULL),
	(8, '李九', '男', '20', '123', 0, '2020-03-27 12:00:08', 'admin', NULL, NULL, '120032703', NULL),
	(9, '齐璐璐', '女', '18', '123', 0, '2020-03-27 12:01:02', 'admin', NULL, NULL, '120032704', NULL),
	(10, '刘真真', '男', '19', '123', 0, '2020-03-27 12:01:24', 'admin', NULL, NULL, '120032705', NULL),
	(11, '陈美丽', '女', '19', '123', 0, '2020-03-27 12:01:48', 'admin', NULL, NULL, '120032706', NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


-- 导出  表 education.supervisor 结构
DROP TABLE IF EXISTS `supervisor`;
CREATE TABLE IF NOT EXISTS `supervisor` (
  `indexId` int(11) NOT NULL AUTO_INCREMENT COMMENT '督导表主键Id',
  `name` varchar(50) DEFAULT NULL COMMENT '督导姓名',
  `pass` varchar(50) DEFAULT NULL COMMENT '登录密码',
  `lastLoginDate` datetime DEFAULT NULL COMMENT '最后登录时间',
  `inputDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `inputName` varchar(50) DEFAULT NULL COMMENT '录入者',
  `modifyDate` datetime DEFAULT NULL COMMENT '最后修改时间',
  `modifyName` varchar(50) DEFAULT NULL COMMENT '最后修改者',
  `spare1` varchar(50) DEFAULT NULL COMMENT '备用字段1',
  `spare2` varchar(50) DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`indexId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='督导表';

-- 正在导出表  education.supervisor 的数据：~1 rows (大约)
DELETE FROM `supervisor`;
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
INSERT INTO `supervisor` (`indexId`, `name`, `pass`, `lastLoginDate`, `inputDate`, `inputName`, `modifyDate`, `modifyName`, `spare1`, `spare2`) VALUES
	(2, 'supervisor', '123', NULL, '2020-03-31 00:41:49', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `supervisor` ENABLE KEYS */;


-- 导出  表 education.teacher 结构
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `indexID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `sex` varchar(50) DEFAULT NULL COMMENT '性别',
  `age` varchar(50) DEFAULT NULL COMMENT '年龄',
  `onjob` varchar(50) DEFAULT NULL COMMENT '是否在职0:离职1:在职',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `pass` varchar(50) DEFAULT NULL COMMENT '密码',
  `inputDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `inputName` varchar(50) DEFAULT NULL COMMENT '录入者',
  `modifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  `modifyName` varchar(50) DEFAULT NULL COMMENT '修改者',
  `spare1` varchar(50) DEFAULT NULL COMMENT '备用字段1',
  `spare2` varchar(50) DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`indexID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='教师表';

-- 正在导出表  education.teacher 的数据：~4 rows (大约)
DELETE FROM `teacher`;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`indexID`, `name`, `sex`, `age`, `onjob`, `email`, `pass`, `inputDate`, `inputName`, `modifyDate`, `modifyName`, `spare1`, `spare2`) VALUES
	(1, '张兰花', '女', '32', '1', '123@qq.com', '123', '2020-03-25 14:56:49', 'admin', NULL, NULL, '220032501', NULL),
	(2, '王兰花', '女', '28', '1', '111@qq.com', '123', '2020-03-25 15:21:13', 'admin', NULL, NULL, '220032502', NULL),
	(4, '李铁柱', '男', '28', '1', '1231@qq.com', '123', '2020-03-25 15:58:27', 'admin2', NULL, NULL, '220032503', NULL),
	(6, '刘富贵', '男', '40', '1', 'liufugui@qq.com', '123', '2020-03-27 11:31:38', 'admin', NULL, NULL, '220032701', NULL);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
