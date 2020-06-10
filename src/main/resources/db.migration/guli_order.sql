/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.21-log : Database - guli_order
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `order_order` */

DROP TABLE IF EXISTS `order_order`;

CREATE TABLE `order_order` (
  `id` char(19) NOT NULL DEFAULT '',
  `order_no` varchar(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `course_id` varchar(19) NOT NULL DEFAULT '' COMMENT '课程id',
  `course_title` varchar(100) DEFAULT NULL COMMENT '课程名称',
  `course_cover` varchar(255) DEFAULT NULL COMMENT '课程封面',
  `teacher_name` varchar(20) DEFAULT NULL COMMENT '讲师名称',
  `member_id` varchar(19) NOT NULL DEFAULT '' COMMENT '会员id',
  `nickname` varchar(50) DEFAULT NULL COMMENT '会员昵称',
  `mobile` varchar(11) DEFAULT NULL COMMENT '会员手机',
  `total_fee` decimal(20,2) DEFAULT NULL COMMENT '订单金额（分）',
  `pay_type` tinyint(3) DEFAULT NULL COMMENT '支付类型（1：微信 2：支付宝）',
  `status` tinyint(3) DEFAULT NULL COMMENT '订单状态（0：未支付 1：已支付）',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ux_order_no` (`order_no`),
  KEY `idx_course_id` (`course_id`),
  KEY `idx_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='订单';

/*Data for the table `order_order` */

insert  into `order_order`(`id`,`order_no`,`course_id`,`course_title`,`course_cover`,`teacher_name`,`member_id`,`nickname`,`mobile`,`total_fee`,`pay_type`,`status`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1204465287341072385','20191211021757803','18','Java精品课程','https://online-teach-file-helen.oss-cn-beijing.aliyuncs.com/cover/2019/11/27/20fdc382-914b-4390-b9cc-2ba08b50b381.jpg','周润发','1203065189981810689','helen','13766816630','0.01',1,1,0,'2019-12-11 02:17:57','2019-12-11 02:18:55'),('1204497926215229441','20191211042738236','18','Java精品课程','https://online-teach-file-helen.oss-cn-beijing.aliyuncs.com/cover/2019/11/27/20fdc382-914b-4390-b9cc-2ba08b50b381.jpg','周润发','1203065189981810689','helen','13766816630','0.01',1,1,0,'2019-12-11 04:27:39','2019-12-11 04:28:17');

/*Table structure for table `order_pay_log` */

DROP TABLE IF EXISTS `order_pay_log`;

CREATE TABLE `order_pay_log` (
  `id` char(19) NOT NULL DEFAULT '',
  `order_no` varchar(20) NOT NULL DEFAULT '' COMMENT '订单号',
  `pay_time` datetime DEFAULT NULL COMMENT '支付完成时间',
  `total_fee` bigint(20) DEFAULT NULL COMMENT '支付金额（分）',
  `transaction_id` varchar(30) DEFAULT NULL COMMENT '交易流水号',
  `trade_state` char(20) DEFAULT NULL COMMENT '交易状态',
  `pay_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '支付类型（1：微信 2：支付宝）',
  `attr` text COMMENT '其他属性',
  `is_deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_order_no` (`order_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付日志表';

/*Data for the table `order_pay_log` */

insert  into `order_pay_log`(`id`,`order_no`,`pay_time`,`total_fee`,`transaction_id`,`trade_state`,`pay_type`,`attr`,`is_deleted`,`gmt_create`,`gmt_modified`) values ('1204465528459026433','20191211021757803','2019-12-11 02:18:55',0,'4200000465201912116600096946','SUCCESS',1,'{\"transaction_id\":\"4200000465201912116600096946\",\"nonce_str\":\"Lrk8iJi6jxa5B4FR\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"OTHERS\",\"openid\":\"oHwsHuEpuA7tEM4GPGtBiKpjAcqM\",\"sign\":\"651397AAB8DC780447D07F26E6BE7A19\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20191211021757803\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20191211021853\",\"is_subscribe\":\"Y\",\"return_code\":\"SUCCESS\"}',0,'2019-12-11 02:18:55','2019-12-11 02:18:55'),('1204498084600537090','20191211042738236','2019-12-11 04:28:17',0,'4200000458201912112226033077','SUCCESS',1,'{\"transaction_id\":\"4200000458201912112226033077\",\"nonce_str\":\"sFD3pDZW9ksb5tqa\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"OTHERS\",\"openid\":\"oHwsHuEpuA7tEM4GPGtBiKpjAcqM\",\"sign\":\"153905A71098ACA37C767C4196BC7C71\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20191211042738236\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20191211042814\",\"is_subscribe\":\"Y\",\"return_code\":\"SUCCESS\"}',0,'2019-12-11 04:28:17','2019-12-11 04:28:17');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
