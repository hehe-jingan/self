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


-- 导出  表 education.eva_item 结构
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
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
