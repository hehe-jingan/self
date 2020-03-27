-- --------------------------------------------------------
-- 主机:                           localhost
-- 服务器版本:                        10.1.11-MariaDB - mariadb.org binary distribution
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 education 的数据库结构
CREATE DATABASE IF NOT EXISTS `education` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `education`;


-- 导出  表 education.admin 结构
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
	(1, 'admin', 'admin', '2020-03-27 16:22:10', NULL, NULL),
	(2, 'admin2', 'admin', '2020-03-25 15:58:07', NULL, NULL);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


-- 导出  表 education.classes 结构
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
	(2, '软工二班', NULL, '2020-03-26 00:45:22', 'admin', NULL, NULL, NULL, NULL),
	(3, '信工一班', NULL, '2020-03-26 00:53:07', 'admin', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;


-- 导出  表 education.course 结构
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='课程表';

-- 正在导出表  education.course 的数据：~3 rows (大约)
DELETE FROM `course`;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` (`indexId`, `name`, `is_use`, `inputDate`, `inputName`, `modifyDate`, `modifyName`, `spare1`, `spare2`) VALUES
	(1, '职业生涯规划', '1', '2020-03-27 11:41:54', 'admin', '2020-03-27 12:13:55', 'admin', NULL, NULL),
	(2, '高等数学', '1', '2020-03-27 11:47:19', 'admin', NULL, NULL, NULL, NULL),
	(3, '测试删除', '1', '2020-03-27 11:47:30', 'admin', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;


-- 导出  表 education.course_arrange 结构
CREATE TABLE IF NOT EXISTS `course_arrange` (
  `indexId` int(11) NOT NULL AUTO_INCREMENT COMMENT '课程安排表主键Id',
  `cid` int(11) DEFAULT NULL COMMENT '课程Id',
  `tid` int(11) DEFAULT NULL COMMENT '教师Id',
  `year` varchar(50) DEFAULT NULL COMMENT '学期 年份+01或02',
  `isUse` varchar(50) DEFAULT '1' COMMENT '是否使用 0：不使用 1：使用中',
  `inputDate` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '录入时间',
  `inputName` varchar(50) DEFAULT NULL COMMENT '录入者',
  `modifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  `modifyName` varchar(50) DEFAULT NULL COMMENT '修改者',
  `spare1` varchar(50) DEFAULT NULL COMMENT '备用字段1',
  `spare2` varchar(50) DEFAULT NULL COMMENT '备用字段2',
  PRIMARY KEY (`indexId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='课程安排表';

-- 正在导出表  education.course_arrange 的数据：~0 rows (大约)
DELETE FROM `course_arrange`;
/*!40000 ALTER TABLE `course_arrange` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_arrange` ENABLE KEYS */;


-- 导出  表 education.evaluation 结构
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评价表';

-- 正在导出表  education.evaluation 的数据：~0 rows (大约)
DELETE FROM `evaluation`;
/*!40000 ALTER TABLE `evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluation` ENABLE KEYS */;


-- 导出  表 education.student 结构
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
	(1, '张三', '男', '21', '123', 2, '2020-03-25 23:17:49', 'admin', '2020-03-27 02:23:42', 'admin', NULL, NULL),
	(2, '李四', '女', '19', '123', 0, '2020-03-25 23:39:09', 'admin', '2020-03-27 02:23:53', 'admin', NULL, NULL),
	(3, '王五', '男', '22', '123', 1, '2020-03-26 22:24:57', 'admin', '2020-03-27 02:23:30', 'admin', NULL, NULL),
	(4, '赵六', '男', '21', '123', 1, '2020-03-26 22:27:14', 'admin', '2020-03-27 02:23:30', 'admin', NULL, NULL),
	(5, '赵美丽', '女', '22', '123', 1, '2020-03-26 22:27:35', 'admin', '2020-03-27 02:23:30', 'admin', NULL, NULL),
	(6, '钱七', '男', '18', '123', 0, '2020-03-27 11:32:32', 'admin', NULL, NULL, NULL, NULL),
	(7, '孙八', '女', '19', '123', 0, '2020-03-27 11:59:47', 'admin', NULL, NULL, NULL, NULL),
	(8, '李九', '男', '20', '123', 0, '2020-03-27 12:00:08', 'admin', NULL, NULL, NULL, NULL),
	(9, '齐璐璐', '女', '18', '123', 0, '2020-03-27 12:01:02', 'admin', NULL, NULL, NULL, NULL),
	(10, '刘真真', '男', '19', '123', 0, '2020-03-27 12:01:24', 'admin', NULL, NULL, NULL, NULL),
	(11, '陈美丽', '女', '19', '123', 0, '2020-03-27 12:01:48', 'admin', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


-- 导出  表 education.teacher 结构
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
	(1, '张兰花', '女', '32', '1', '123@qq.com', '123', '2020-03-25 14:56:49', 'admin', NULL, NULL, NULL, NULL),
	(2, '王兰花', '女', '28', '1', '111@qq.com', '123', '2020-03-25 15:21:13', 'admin', NULL, NULL, NULL, NULL),
	(4, '李铁柱', '男', '28', '1', '1231@qq.com', '123', '2020-03-25 15:58:27', 'admin2', NULL, NULL, NULL, NULL),
	(6, '刘富贵', '男', '40', '1', 'liufugui@qq.com', '123', '2020-03-27 11:31:38', 'admin', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
