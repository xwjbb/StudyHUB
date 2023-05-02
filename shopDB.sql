DROP DATABASE IF EXISTS shopDB;
CREATE DATABASE shopDB;
USE shopDB;
DROP TABLE IF EXISTS `t_item`;
CREATE TABLE `t_item` (
  `id` bigint(20) NOT NULL COMMENT '商品id，同时也是商品编号',
  `brand` varchar(50) DEFAULT NULL COMMENT '品牌',
  `model` varchar(50) DEFAULT NULL COMMENT '型号',
  `title` varchar(100) NOT NULL COMMENT '商品标题',
  `sell_point` varchar(500) DEFAULT NULL COMMENT '商品卖点',
  `price` double NOT NULL COMMENT '商品价格，单位为：分',
  `num` int(10) NOT NULL COMMENT '库存数量',
  `barcode` varchar(30) DEFAULT NULL COMMENT '商品条形码',
  `image` varchar(500) DEFAULT NULL COMMENT '商品图片',
  `cid` bigint(10) NOT NULL COMMENT '所属类目，叶子类目',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商品状态，1-正常，2-下架，3-删除',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP  COMMENT '创建时间',
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `cid` (`cid`),
  KEY `status` (`status`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';


 -- BEGIN;
 -- INSERT INTO `t_item` VALUES ('10000000', '广博', '牛皮纸记事本', '广博(GuangBo)10本装40张A5牛皮纸记事本子日记本办公软抄本GBR0731', '经典回顾！超值特惠！', '23', '99999', null, 'images/item/item1.jpg', '238', '1', '2017-06-18 22:33:17', '2017-01-13 16:16:57'), ('10000001', '广博', '牛皮纸记事本', '广博(GuangBo)10本装40张A5牛皮纸记事本子日记本办公软抄本GBR0731', '经典回顾！超值特惠！', '43', '99999', null, 'images/item/item1.jpg', '238', '1', '2017-06-20 13:03:46', '2017-01-13 16:16:57'), ('10000002', '广博', '皮面日程本', '广博(GuangBo)皮面日程本子 计划记事本效率手册米色FB60322', '经典回顾！超值特惠！', '46', '99999', null, 'images/item/item2.jpg', '238', '1', '2017-06-18 22:32:22', '2017-01-13 16:16:57'), ('10000003', '广博', '记事本日记本笔记本', '广博(GuangBo)16K115页线圈记事本子日记本文具笔记本图案随机', '经典回顾！超值特惠！', '13', '99999', null, 'images/item/item3.jpg', '238', '1', '2017-06-18 22:32:22', '2017-01-13 16:16:57'), ('10000004', '得力', '计算器', '得力（deli）1548A商务办公桌面计算器 太阳能双电源', '经典回顾！超值特惠！', '58', '99999', null, 'images/item/item4.jpg', '241', '1', '2017-06-18 22:32:22', '2017-01-13 16:16:57'), ('10000005', '施耐德', '圆珠笔', '施耐德（Schneider） K15 经典款圆珠笔 (5支混色装)', '经典回顾！超值特惠！', '29', '99999', null, 'images/item/item5.jpg', '241', '1', '2017-06-18 22:32:22', '2017-01-13 16:16:57'), ('10000006', '三木', '票据网格拉链袋', '三木(SUNWOOD) C4523 票据网格拉链袋/文件袋 12个装 颜色随机', '经典回顾！超值特惠！', '28', '99999', null, 'images/item/item6.jpg', '236', '1', '2017-06-18 22:32:22', '2017-01-13 16:16:57'), ('10000007', '戴尔', '燃 7000经典版', '戴尔Dell 燃700金色', '下单赠12000毫安移动电源', '32999', '99999', null, 'images/item/item7.jpg', '163', '1', '2017-06-18 22:32:22', '2017-01-13 16:16:57'), ('10000008', '戴尔', '燃 7000经典版', '戴尔Dell 燃700R1605银色', '仅上海，广州，沈阳仓有货！预购从速！', '4549', '99999', null, 'images/item/item8.jpg', '163', '1', '2017-06-18 22:32:22', '2017-01-13 16:16:57'), ('10000009', '戴尔', '燃 7000学习版', '戴尔Dell 燃700金色', '下单赠12000毫安移动电源', '39929', '99999', null, 'images/item/item9.jpg', '163', '1', '2017-06-18 22:32:22', '2017-01-13 16:16:57'), ('10000010', '戴尔', '燃 7000学习版', '戴尔Dell 燃700R1605银色', '仅上海，广州，沈阳仓有货！预购从速！', '5559', '99999', null, 'images/item/item10.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000011', '戴尔', '燃 7000高配版', '戴尔Dell 燃700金色', '下单赠12000毫安移动电源', '3994', '99999', null, 'images/item/item11.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000012', '戴尔', '燃 7000高配版', '戴尔Dell 燃700R1605银色', '仅上海，广州，沈阳仓有货！预购从速！', '6559', '99999', null, 'images/item/item12.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000013', '齐心', 'A5优品商务笔记本', '齐心（COMIX）C5902 A5优品商务笔记本子记事本日记本122张', '下单即送10400毫安移动电源！再赠手机魔法盒！', '41', '99999', null, 'images/item/item13.jpg', '163', '1', '2017-07-28 17:43:08', '2017-01-13 16:16:57'), ('10000014', '戴尔', 'XPS13-9360', '戴尔(DELL)XPS13-9360-R1609 13.3', '仅上海，广州，沈阳仓有货！预购从速！', '4600', '99999', null, 'images/item/item14.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000015', '戴尔', 'XPS13-9360', '戴尔(DELL)XPS13-9360-R1609 13.3', '仅上海，广州，沈阳仓有货！预购从速！', '4601', '99999', null, 'images/item/item15.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000016', '戴尔', 'XPS13-9360', '戴尔(DELL)XPS13-9360-R1609 13.3', '仅上海，广州，沈阳仓有货！预购从速！', '4602', '99999', null, 'images/item/item16.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000017', '戴尔', 'XPS13-9360', '戴尔(DELL)XPS13-9360-R1609 13.3', '仅上海，广州，沈阳仓有货！预购从速！', '4604', '99999', null, 'images/item/item17.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000018', '戴尔', 'XPS13-9360', '戴尔(DELL)XPS13-9360-R1609 13.3', '仅上海，广州，沈阳仓有货！预购从速！', '4605', '99999', null, 'images/item/item18.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000019', '戴尔', 'XPS13-9360', '戴尔(DELL)XPS13-9360-R1609 13.3', '仅上海，广州，沈阳仓有货！预购从速！', '4899', '99999', null, 'images/item/item19.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000020', '联想', 'IdeaPad310低配版', '联想（Lenovo）IdeaPad310低配版', '清仓！仅北京，武汉仓有货！', '5119', '99999', null, 'images/item/item20.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000021', '联想', 'IdeaPad310低配版', '联想（Lenovo）IdeaPad310低配版', '清仓！仅北京，武汉仓有货！', '5129', '99999', null, 'images/item/item21.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000022', '联想', 'IdeaPad310经典版', '联想（Lenovo）IdeaPad310经典版', '清仓！仅北京，武汉仓有货！', '5119', '99999', null, 'images/item/item22.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000023', '联想', 'IdeaPad310经典版', '联想（Lenovo）IdeaPad310经典版', '清仓！仅北京，武汉仓有货！', '5129', '99999', null, 'images/item/item23.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000024', '联想', 'IdeaPad310高配版', '联想（Lenovo）IdeaPad310高配版', '清仓！仅北京，武汉仓有货！', '5119', '99999', null, 'images/item/item24.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000025', '联想', 'IdeaPad310高配版', '联想（Lenovo）IdeaPad310高配版', '清仓！仅北京，武汉仓有货！', '5129', '99999', null, 'images/item/item25.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000026', '联想', 'YOGA710', '联想（Lenovo）YOGA710 14英寸触控笔记本（i7-7500U 8G 256GSSD 2G独显 全高清IPS 360°翻转 正版office）金', '【0元献礼】好评过万，销量传奇！经典蓝光电视，独有自然光技术专利，过大年带最好的回家！【0元白条试用，1001个拜年计划】', '59999', '99999', null, 'images/item/item26.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000027', '联想', 'YOGA710', '联想（Lenovo）YOGA710 14英寸触控笔记本（i7-7500U 8G 256GSSD 2G独显 全高清IPS 360°翻转 正版office）银', '【0元献礼】好评过万，销量传奇！经典蓝光电视，独有自然光技术专利，过大年带最好的回家！【0元白条试用，1001个拜年计划】', '59999', '99999', null, 'images/item/item27.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000028', '联想', '310低配版', '联想（Lenovo）小新310低配版', '清仓！仅北京，武汉仓有货！', '4939', '99999', null, 'images/item/item28.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000029', '联想', '310低配版', '联想（Lenovo）小新310低配版', '清仓！仅北京，武汉仓有货！', '4839', '99999', null, 'images/item/item29.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000030', '联想', '310经典版', '联想（Lenovo）小新310经典版', '清仓！仅北京，武汉仓有货！', '4739', '99999', null, 'images/item/item30.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000031', '联想', '310经典版', '联想（Lenovo）小新310经典版', '清仓！仅北京，武汉仓有货！', '4639', '99999', null, 'images/item/item31.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000032', '联想', '310高配版', '联想（Lenovo）小新310高配版', '清仓！仅北京，武汉仓有货！', '4539', '99999', null, 'images/item/item32.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000033', '联想', '310高配版', '联想（Lenovo）小新310高配版', '清仓！仅北京，武汉仓有货！', '4439', '99999', null, 'images/item/item33.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000034', '联想', 'YOGA900', '联想（Lenovo）YOGA900绿色', '青春的活力 清新漂亮高端大气上档次', '5200', '99999', null, 'images/item/item34.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000035', '联想', 'YOGA900', '联想（Lenovo）YOGA900粉色', '青春的活力 清新漂亮高端大气上档次', '5200', '99999', null, 'images/item/item35.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000036', '联想', 'YOGA900', '联想（Lenovo）YOGA900红色', '青春的活力 清新漂亮高端大气上档次', '5200', '99999', null, 'images/item/item36.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000037', '联想', '小新13旗舰版', '联想(Lenovo)小新Air13 Pro 13.3英寸14.8mm超轻薄笔记本电脑', '青春的活力 青年专属', '6439', '99999', null, 'images/item/item37.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000038', '联想', '小新13旗舰版', '联想(Lenovo)小新Air13 Pro 13.3英寸14.8mm超轻薄笔记本电脑', '青春的活力 青年专属', '6439', '99999', null, 'images/item/item38.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('10000039', '戴尔', 'XPS15', '戴尔(DELL) XPS15 银色', '限时特价！好评过万条优秀产品！', '3333', '99999', null, 'images/item/item19.jpg', '163', '1', '2017-06-18 22:34:29', '2017-01-13 16:16:57'), ('10000040', '戴尔', 'DELL 15MF Pro', '戴尔(DELL)魔方15MF Pro-R2505TSS灵越', '15.6英寸二合一翻转笔记本电脑 (i5-7200U 8GB 1TB IPS Win10)触控银', '4443', '99999', null, 'images/item/item30.jpg', '163', '1', '2017-06-18 22:34:26', '2017-01-13 16:16:57'), ('10000041', '戴尔', 'DELL XPS15-9550', '戴尔(DELL) XPS15升级版 ', '15.6英寸二合一翻转笔记本电脑 (i5-7200U 8GB 1TGB IPS Win10)触控', '8443', '99999', null, 'images/item/item22.jpg', '163', '1', '2017-06-18 22:34:22', '2017-01-13 16:16:57'), ('10000042', '联想', 'ThinkPad New s1', '联想ThinkPad New S2（01CD） i5 6代 红色', '经典回顾！超值特惠！', '4399', '99999', null, 'images/item/item22.jpg', '163', '1', '2017-06-18 22:34:16', '2017-01-13 16:16:57'), ('10000043', '乐尚', '书包 bag', '乐尚书包 电脑包 bag黑色', '给你满载而归的喜悦！', '89', '99999', null, 'images/item/item33.jpg', '917', '1', '2017-06-18 22:34:11', '2017-01-13 16:16:57'), ('10000044', '乐尚', '书包 bag', '乐尚书包 电脑包 bag粉色', '给你满载而归的喜悦！', '89', '99999', null, 'images/item/item32.jpg', '917', '1', '2017-06-18 22:34:07', '2017-01-13 16:16:57'), ('100000021', '广博', '皮面日程本', '广博(GuangBo)皮面日程本子 计划记事本效率手册蓝色FB60321', '经典回顾！超值特惠！', '22', '99999', null, 'images/item/item32.jpg', '238', '1', '2017-06-18 22:33:57', '2017-01-13 16:16:57'), ('100000391', '戴尔', 'XPS15', '戴尔(DELL) XPS15 金色', '限时特价！好评过万条优秀产品！', '3333', '99999', null, 'images/item/item32.jpg', '163', '1', '2017-06-18 22:33:32', '2017-01-13 16:16:57'), ('100000401', '戴尔', 'DELL 15MF Pro', '戴尔(DELL)魔方15MF Pro-R2505TSS灵越', '15.6英寸二合一翻转笔记本电脑 (i5-7200U 8GB 1TB IPS Win10)触控白', '4443', '99999', null, 'images/item/item01.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('100000402', '戴尔', 'DELL 15MF Pro', '戴尔(DELL)魔方15MF Pro-R2505TSS灵越', '15.6英寸二合一翻转笔记本电脑 (i7-7200U 8GB 512GB IPS Win10)触控银', '6443', '99999', null, 'images/item/item02.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('100000403', '戴尔', 'DELL 15MF Pro', '戴尔(DELL)魔方15MF Pro-R2505TSS灵越', '15.6英寸二合一翻转笔记本电脑 (i7-7200U 8GB 512GB IPS Win10)触控白', '6443', '99999', null, 'images/item/item03.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('100000411', '戴尔', 'DELL XPS15-9550', '戴尔(DELL) XPS15升级版 ', '15.6英寸二合一翻转笔记本电脑 (i5-7200U 8GB 256GB IPS Win10)触控', '8443', '99999', null, 'images/item/item11.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('100000412', '戴尔', 'DELL XPS15-9550', '戴尔(DELL) XPS15升级版 ', '15.6英寸二合一翻转笔记本电脑 (i7-7200U 8GB 1TB IPS Win10)触控', '8443', '99999', null, 'images/item/item12.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('100000413', '戴尔', 'DELL XPS15-9550', '戴尔(DELL) XPS15升级版 ', '15.6英寸二合一翻转笔记本电脑 (i7-7200U 8GB 256GB IPS Win10)触控', '8443', '99999', null, 'images/item/item13.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('100000421', '联想', 'ThinkPad New s1', '联想ThinkPad New S2（01CD） i7 6700 红', '经典回顾！超值特惠！', '6399', '99999', null, 'images/item/item21.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('100000422', '联想', 'ThinkPad New s1', '联想ThinkPad New S2（01CD） i5 6代 黄', '经典回顾！超值特惠！', '4399', '99999', null, 'images/item/item22.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('100000423', '联想', 'ThinkPad New s1', '联想ThinkPad New S2（01CD） i7 6700 黄', '经典回顾！超值特惠！', '6399', '99999', null, 'images/item/item23.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('100000424', '联想', 'ThinkPad New s1', '联想ThinkPad New S2（01CD） i5 6代 蓝', '经典回顾！超值特惠！', '4399', '99999', null, 'images/item/item24.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57'), ('100000425', '联想', 'ThinkPad New s1', '联想ThinkPad New S2（01CD） i7 6700 蓝', '经典回顾！超值特惠！', '6399', '99999', null, 'images/item/item25.jpg', '163', '1', '2017-06-18 22:32:44', '2017-01-13 16:16:57');
 -- COMMIT;


DROP TABLE IF EXISTS `t_item_cart`;
CREATE TABLE `t_item_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '账号id',
  `item_id` bigint(20) DEFAULT NULL COMMENT '商品id',
  `num` int(10) DEFAULT NULL COMMENT '商品数量',
  `status` int(4) DEFAULT NULL COMMENT '状态。1-正常，2-删除',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '密码，加密存储',
  `phone` varchar(20) DEFAULT NULL COMMENT '注册手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '注册邮箱',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';



DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `order_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '订单id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `add_id` bigint(20) DEFAULT NULL COMMENT '地址id',
  `payment` double DEFAULT NULL COMMENT '实付金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `payment_type` int(2) DEFAULT NULL COMMENT '支付类型，1、在线支付，2、货到付款',
  `post_fee` double DEFAULT NULL COMMENT '邮费。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `status` int(10) NOT NULL COMMENT '状态：1、未付款，2、已付款，3、未发货，4、已发货，5、待收货，6、待评价，7、交易成功，8、交易关闭，9、删除',
  

  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '订单创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '订单更新时间',
  `payment_time` timestamp NULL DEFAULT NULL COMMENT '付款时间',

  `consign_time` timestamp NULL DEFAULT NULL COMMENT '发货时间',
  `end_time` timestamp NULL DEFAULT NULL COMMENT '交易完成时间',
  `close_time` timestamp NULL DEFAULT NULL COMMENT '交易关闭时间',

  `shipping_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流名称',
  `shipping_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流单号',
  `buyer_message` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '买家留言',
  `buyer_nick` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '买家昵称',
  `buyer_rate` int(2) DEFAULT NULL COMMENT '买家是否已经评价',
  PRIMARY KEY (`order_id`),
  KEY `create_time` (`create_time`),
  KEY `buyer_nick` (`buyer_nick`),
  KEY `status` (`status`),
  KEY `payment_type` (`payment_type`),
  KEY `user_id` (`user_id`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `t_order_item`;
CREATE TABLE `t_order_item` (
  `id` varchar(20) COLLATE utf8_bin NOT NULL,
  `item_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '商品id',
  `order_id` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '订单id',
  `num` int(10) DEFAULT NULL COMMENT '商品购买数量',
  `title` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品标题',
  `price` double DEFAULT NULL COMMENT '商品单价',
  `total_fee` double DEFAULT NULL COMMENT '商品总金额',
  `pic_path` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '商品图片地址',
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  KEY `order_id` (`order_id`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


DROP TABLE IF EXISTS `t_shipping`;
CREATE TABLE `t_shipping` (
  `add_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '地址编号',
  `user_id` bigint(20) NOT NULL COMMENT '账号ID',
  `receiver_name` varchar(20) DEFAULT NULL COMMENT '收货人全名',
  `receiver_phone` varchar(20) DEFAULT NULL COMMENT '固定电话',
  `receiver_mobile` varchar(30) DEFAULT NULL COMMENT '移动电话',
  `receiver_state` varchar(10) DEFAULT NULL COMMENT '省份',
  `receiver_city` varchar(10) DEFAULT NULL COMMENT '城市',
  `receiver_district` varchar(20) DEFAULT NULL COMMENT '区/县',
  `receiver_address` varchar(200) DEFAULT NULL COMMENT '收货地址，如：xx路xx号',
  `receiver_zip` varchar(6) DEFAULT NULL COMMENT '邮政编码,如：310001',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL COMMENT '地址状态，1-正常，2-删除',
  `is_default` tinyint(1) NOT NULL COMMENT '是否为默认地址，1-true,0-false',
  PRIMARY KEY (`add_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;











