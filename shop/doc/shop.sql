/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : kv05

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2016-11-24 20:50:34
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `sys_about`
-- ----------------------------
DROP TABLE IF EXISTS `sys_about`;
CREATE TABLE `sys_about` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `key_` varchar(2) DEFAULT NULL,
  `content` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_about
-- ----------------------------
INSERT INTO `sys_about` VALUES ('1', '关于我们', '1', '这是关于我们');
INSERT INTO `sys_about` VALUES ('2', '联系我们', '2', '这是<span style=\"font-family: Arial, sans-serif; line-height: 12px;\">联系我们</span>');
INSERT INTO `sys_about` VALUES ('3', '招贤纳士', '3', '33333');
INSERT INTO `sys_about` VALUES ('4', '法律声明', '4', '444444');
INSERT INTO `sys_about` VALUES ('5', '友情链接', '5', '55555555555');
INSERT INTO `sys_about` VALUES ('6', '支付方式', '6', '66666666666666');
INSERT INTO `sys_about` VALUES ('7', '配送方式', '7', '77777777777777777');
INSERT INTO `sys_about` VALUES ('8', '服务声明', '8', '888888888888888888');
INSERT INTO `sys_about` VALUES ('9', '广告声明', '9', '999999999999999999999');
INSERT INTO `sys_about` VALUES ('10', '购物指南', '10', '10=========购物指南');

-- ----------------------------
-- Table structure for `sys_admin`
-- ----------------------------
DROP TABLE IF EXISTS `sys_admin`;
CREATE TABLE `sys_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_admin
-- ----------------------------
INSERT INTO `sys_admin` VALUES ('1', 'admin', 'admin');

-- ----------------------------
-- Table structure for `sys_category`
-- ----------------------------
DROP TABLE IF EXISTS `sys_category`;
CREATE TABLE `sys_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_category
-- ----------------------------
INSERT INTO `sys_category` VALUES ('2', '女装男装');
INSERT INTO `sys_category` VALUES ('3', '鞋靴箱包');
INSERT INTO `sys_category` VALUES ('4', '运动户外');
INSERT INTO `sys_category` VALUES ('5', '珠宝配饰');
INSERT INTO `sys_category` VALUES ('6', '家电办公');
INSERT INTO `sys_category` VALUES ('7', '护肤彩妆');
INSERT INTO `sys_category` VALUES ('8', '手机数码');

-- ----------------------------
-- Table structure for `sys_category_second`
-- ----------------------------
DROP TABLE IF EXISTS `sys_category_second`;
CREATE TABLE `sys_category_second` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE756563761CB4B7` (`categoryId`),
  CONSTRAINT `FKE756563761CB4B7` FOREIGN KEY (`categoryId`) REFERENCES `sys_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_category_second
-- ----------------------------
INSERT INTO `sys_category_second` VALUES ('2', '潮流女装', '2');
INSERT INTO `sys_category_second` VALUES ('3', '初冬羽绒', '2');
INSERT INTO `sys_category_second` VALUES ('4', '毛呢大衣', '2');
INSERT INTO `sys_category_second` VALUES ('5', '温暖毛衣', '2');
INSERT INTO `sys_category_second` VALUES ('8', '精选男装', '2');
INSERT INTO `sys_category_second` VALUES ('9', '冬季外套', '2');
INSERT INTO `sys_category_second` VALUES ('10', '羽绒服', '2');
INSERT INTO `sys_category_second` VALUES ('13', '女鞋', '3');
INSERT INTO `sys_category_second` VALUES ('14', '短靴', '3');
INSERT INTO `sys_category_second` VALUES ('15', '男鞋', '3');
INSERT INTO `sys_category_second` VALUES ('16', '女包', '3');
INSERT INTO `sys_category_second` VALUES ('17', '男包', '3');
INSERT INTO `sys_category_second` VALUES ('18', '服饰配件', '3');
INSERT INTO `sys_category_second` VALUES ('19', '运动鞋', '4');
INSERT INTO `sys_category_second` VALUES ('20', '运动服', '4');
INSERT INTO `sys_category_second` VALUES ('21', '户外运动', '4');
INSERT INTO `sys_category_second` VALUES ('22', '健身装备', '4');
INSERT INTO `sys_category_second` VALUES ('23', '骑行装备', '4');
INSERT INTO `sys_category_second` VALUES ('24', '珠宝首饰', '5');
INSERT INTO `sys_category_second` VALUES ('25', '时尚饰品', '5');
INSERT INTO `sys_category_second` VALUES ('26', '品质手表', '5');
INSERT INTO `sys_category_second` VALUES ('27', '眼镜配饰', '5');
INSERT INTO `sys_category_second` VALUES ('28', '手机', '8');
INSERT INTO `sys_category_second` VALUES ('29', '平板', '8');
INSERT INTO `sys_category_second` VALUES ('30', '电脑', '8');
INSERT INTO `sys_category_second` VALUES ('31', '相机', '8');
INSERT INTO `sys_category_second` VALUES ('32', '大家电', '6');
INSERT INTO `sys_category_second` VALUES ('33', '厨房电器', '6');
INSERT INTO `sys_category_second` VALUES ('34', '生活电器', '6');
INSERT INTO `sys_category_second` VALUES ('35', '个户电器', '6');
INSERT INTO `sys_category_second` VALUES ('36', '办公耗材', '6');
INSERT INTO `sys_category_second` VALUES ('37', '美容护肤', '7');
INSERT INTO `sys_category_second` VALUES ('38', '强效保养', '7');
INSERT INTO `sys_category_second` VALUES ('39', '超值彩妆', '7');
INSERT INTO `sys_category_second` VALUES ('40', '换季保养', '7');

-- ----------------------------
-- Table structure for `sys_order`
-- ----------------------------
DROP TABLE IF EXISTS `sys_order`;
CREATE TABLE `sys_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `type_` varchar(20) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_order
-- ----------------------------
INSERT INTO `sys_order` VALUES ('4', '1474119965326', '收件人1', '电话1', '地址1', 'ICBC-NET-B2C', '18.12', '1', '2016-09-07 22:16:03');
INSERT INTO `sys_order` VALUES ('5', '1474121444520', '收件人1', '电话1', '地址1', 'ICBC-NET-B2C', '3', '1', '2016-09-07 22:16:03');
INSERT INTO `sys_order` VALUES ('6', '1474121454033', '收件人1', '电话1', '地址1', 'ICBC-NET-B2C', '4', '1', '2016-09-07 22:16:03');
INSERT INTO `sys_order` VALUES ('7', '1474121463291', '收件人1', '电话1', '地址1', 'ICBC-NET-B2C', '9', '1', '2016-09-07 22:16:03');
INSERT INTO `sys_order` VALUES ('8', '1474121476360', '收件人1', '电话1', '地址1', 'ICBC-NET-B2C', '333', '1', '2016-09-07 22:16:03');
INSERT INTO `sys_order` VALUES ('9', '1474121484710', '收件人1', '电话1', '地址1', 'ICBC-NET-B2C', '333', '1', '2016-09-07 22:16:03');
INSERT INTO `sys_order` VALUES ('10', '1474121491501', '收件人1', '电话1', '地址1', 'ICBC-NET-B2C', '4', '1', '2016-09-07 22:16:03');
INSERT INTO `sys_order` VALUES ('11', '1474121498984', '收件人1', '电话1', '地址1', 'ICBC-NET-B2C', '3', '1', '2016-09-07 22:16:03');
INSERT INTO `sys_order` VALUES ('12', '1474121507672', '收件人1', '电话1', '地址1', 'ICBC-NET-B2C', '4', '1', '2016-09-07 22:16:03');
INSERT INTO `sys_order` VALUES ('13', '1474121513123', '收件人1', '电话1', '地址1', 'ICBC-NET-B2C', '3', '1', '2016-09-07 22:16:03');
INSERT INTO `sys_order` VALUES ('14', '1474121518771', '收件人1', '电话1', '地址1', 'ICBC-NET-B2C', '4', '1', '2016-09-07 22:16:03');
INSERT INTO `sys_order` VALUES ('15', '1474121524916', '收件人1', '电话1', '地址1', 'ICBC-NET-B2C', '333', '1', '2016-09-07 22:16:03');

-- ----------------------------
-- Table structure for `sys_order_item`
-- ----------------------------
DROP TABLE IF EXISTS `sys_order_item`;
CREATE TABLE `sys_order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK154C521657051F17` (`orderId`),
  CONSTRAINT `FK154C521657051F17` FOREIGN KEY (`orderId`) REFERENCES `sys_order` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_order_item
-- ----------------------------
INSERT INTO `sys_order_item` VALUES ('7', '测试12', 'upload/1474026753094.jpg', '11.12', '1', '4', '5');
INSERT INTO `sys_order_item` VALUES ('8', '测试11', 'upload/1474026760337.jpg', '4', '1', '4', '6');
INSERT INTO `sys_order_item` VALUES ('9', '测试15', 'upload/1474044132725.jpg', '3', '1', '4', '19');
INSERT INTO `sys_order_item` VALUES ('10', '测试15', 'upload/1474044132725.jpg', '3', '1', '5', '19');
INSERT INTO `sys_order_item` VALUES ('11', '测试4', 'upload/1474039689923.jpg', '4', '1', '6', '18');
INSERT INTO `sys_order_item` VALUES ('12', '测试6', 'upload/1474026794874.jpg', '9', '1', '7', '11');
INSERT INTO `sys_order_item` VALUES ('13', '333', 'upload/1474027255546.png', '333', '1', '8', '14');
INSERT INTO `sys_order_item` VALUES ('14', '333', 'upload/1474027255546.png', '333', '1', '9', '14');
INSERT INTO `sys_order_item` VALUES ('15', '测试11', 'upload/1474026760337.jpg', '4', '1', '10', '6');
INSERT INTO `sys_order_item` VALUES ('16', '测试15', 'upload/1474044132725.jpg', '3', '1', '11', '19');
INSERT INTO `sys_order_item` VALUES ('17', '测试11', 'upload/1474026760337.jpg', '4', '1', '12', '6');
INSERT INTO `sys_order_item` VALUES ('18', '测试15', 'upload/1474044132725.jpg', '3', '1', '13', '19');
INSERT INTO `sys_order_item` VALUES ('19', '测试11', 'upload/1474026760337.jpg', '4', '1', '14', '6');
INSERT INTO `sys_order_item` VALUES ('20', '333', 'upload/1474027255546.png', '333', '1', '15', '14');

-- ----------------------------
-- Table structure for `sys_product`
-- ----------------------------
DROP TABLE IF EXISTS `sys_product`;
CREATE TABLE `sys_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) DEFAULT NULL,
  `desc_` varchar(200) DEFAULT NULL,
  `img` varchar(200) DEFAULT NULL,
  `price_market` double DEFAULT NULL,
  `price_shop` double DEFAULT NULL,
  `hot` bit(1) DEFAULT NULL,
  `cs_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6E4E157D38ABA37C` (`cs_id`),
  CONSTRAINT `FK6E4E157D38ABA37C` FOREIGN KEY (`cs_id`) REFERENCES `sys_category_second` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_product
-- ----------------------------
INSERT INTO `sys_product` VALUES ('4', '测试13', '33333333333333333333333333', 'upload/1474026745495.jpg', '22.1', '11.12', '', '3');
INSERT INTO `sys_product` VALUES ('5', '测试12', '3', 'upload/1474026753094.jpg', '22.22', '11.12', '', '3');
INSERT INTO `sys_product` VALUES ('6', '测试11', '444', 'upload/1474026760337.jpg', '4', '4', '', '3');
INSERT INTO `sys_product` VALUES ('7', '测试10', '5', 'upload/1474026766196.jpg', '5', '5', '', '3');
INSERT INTO `sys_product` VALUES ('8', '测试9', '6', 'upload/1474026773158.jpg', '6', '6', '', '3');
INSERT INTO `sys_product` VALUES ('9', '测试8', '7', 'upload/1474026779240.jpg', '7', '7', '', '3');
INSERT INTO `sys_product` VALUES ('10', '测试7', '8', 'upload/1474026788954.jpg', '8', '8', '', '3');
INSERT INTO `sys_product` VALUES ('11', '测试6', '9', 'upload/1474026794874.jpg', '9', '9', '', '3');
INSERT INTO `sys_product` VALUES ('12', '10', '10', 'upload/1474026800169.jpg', '10', '10', '', '10');
INSERT INTO `sys_product` VALUES ('13', '测试5', '11', 'upload/1474026805394.jpg', '11', '11', '\0', '3');
INSERT INTO `sys_product` VALUES ('14', '333', '33333', 'upload/1474027255546.png', '333', '333', '', '10');
INSERT INTO `sys_product` VALUES ('15', '测试1', '1111', 'upload/1474039632972.jpg', '11', '11', '', '3');
INSERT INTO `sys_product` VALUES ('16', '测试2', '是收拾收拾收拾收拾收拾收拾', 'upload/1474039651052.jpg', '11', '111', '', '3');
INSERT INTO `sys_product` VALUES ('17', '测试3', '111111111111111', 'upload/1474039668692.jpg', '111111', '2222', '', '3');
INSERT INTO `sys_product` VALUES ('18', '测试4', '333333333', 'upload/1474039689923.jpg', '11111.11', '4', '', '3');
INSERT INTO `sys_product` VALUES ('19', '测试15', '2222', 'upload/1474044132725.jpg', '111', '3', '', '13');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', '1', '2016-09-15 19:47:51', '收件人1', '电话1', '地址1');
INSERT INTO `sys_user` VALUES ('2', '2', '2', '2016-09-16 12:26:56', '收件人2', '电话2', '地址2');
INSERT INTO `sys_user` VALUES ('3', '4', '4', '2016-09-16 21:06:22', '111', '222', '333');
INSERT INTO `sys_user` VALUES ('4', '3', '3', '2016-09-17 16:14:22', '111', '222', '333');
INSERT INTO `sys_user` VALUES ('5', '5', '5', '2016-09-17 16:15:46', '55', '66', '收件人');
