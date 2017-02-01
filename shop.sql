-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 02 月 01 日 16:15
-- 服务器版本: 5.5.40
-- PHP 版本: 5.3.29

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `shop`
--

-- --------------------------------------------------------

--
-- 表的结构 `adminvam`
--

CREATE TABLE IF NOT EXISTS `adminvam` (
  `user_id` int(10) NOT NULL,
  `username` varchar(10) CHARACTER SET utf8 NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 NOT NULL,
  `email` varchar(30) CHARACTER SET utf8 NOT NULL,
  `regtime` int(10) NOT NULL,
  `lastlogin` int(10) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `user_id_2` (`user_id`),
  KEY `user_id_3` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=gbk;

--
-- 转存表中的数据 `adminvam`
--

INSERT INTO `adminvam` (`user_id`, `username`, `password`, `email`, `regtime`, `lastlogin`) VALUES
(1000, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin@wobushi.cn', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `cate`
--

CREATE TABLE IF NOT EXISTS `cate` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `catename` varchar(200) DEFAULT NULL,
  `intro` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `cate`
--

INSERT INTO `cate` (`Id`, `catename`, `intro`) VALUES
(1, 'test', 'test'),
(2, 'test', 'test');

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(20) NOT NULL DEFAULT '',
  `intro` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cat_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`, `intro`, `parent_id`) VALUES
(1, '男士正装', '男士正装', 0),
(2, '西装', '西装', 1),
(3, '衬衫', '衬衫', 1),
(4, '女士正装', '女士正装', 0),
(5, '套装', '套装', 4),
(6, '衬衫', '衬衫', 4),
(7, '正装鞋', '正装鞋', 0),
(8, '男士皮鞋', '男士皮鞋', 7),
(9, '女士皮鞋', '女士皮鞋', 7),
(10, '配饰', '配饰', 0),
(11, '领带', '领带', 10),
(12, '皮带', '皮带', 10),
(13, 'dfsdfsd''f''''sf''''''''\\', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `goods`
--

CREATE TABLE IF NOT EXISTS `goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_sn` char(15) NOT NULL DEFAULT '',
  `cat_id` smallint(6) NOT NULL DEFAULT '0',
  `brand_id` smallint(6) NOT NULL DEFAULT '0',
  `goods_name` varchar(60) NOT NULL DEFAULT '',
  `shop_price` decimal(9,2) NOT NULL DEFAULT '0.00',
  `market_price` decimal(9,2) NOT NULL DEFAULT '0.00',
  `goods_number` smallint(6) NOT NULL DEFAULT '1',
  `click_count` mediumint(9) NOT NULL DEFAULT '0',
  `goods_weight` decimal(6,3) NOT NULL DEFAULT '0.000',
  `goods_brief` varchar(100) NOT NULL DEFAULT '',
  `goods_desc` text NOT NULL,
  `thumb_img` varchar(50) NOT NULL DEFAULT '',
  `goods_img` varchar(50) NOT NULL DEFAULT '',
  `ori_img` varchar(50) NOT NULL DEFAULT '',
  `is_on_sale` tinyint(4) NOT NULL DEFAULT '1',
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `is_best` tinyint(4) NOT NULL DEFAULT '0',
  `is_new` tinyint(4) NOT NULL DEFAULT '0',
  `is_hot` tinyint(4) NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `last_update` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`goods_id`),
  UNIQUE KEY `goods_sn` (`goods_sn`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- 转存表中的数据 `goods`
--

INSERT INTO `goods` (`goods_id`, `goods_sn`, `cat_id`, `brand_id`, `goods_name`, `shop_price`, `market_price`, `goods_number`, `click_count`, `goods_weight`, `goods_brief`, `goods_desc`, `thumb_img`, `goods_img`, `ori_img`, `is_on_sale`, `is_delete`, `is_best`, `is_new`, `is_hot`, `add_time`, `last_update`) VALUES
(1, 'BL2012121939587', 2, 0, '11两扣双开衩平驳头斜兜男士西服套装3312/纯藏青色人字纹/羊毛+涤纶', '799.00', '1598.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_aifwnt.JPG', 'data/images/201212/19/goods_aifwnt.JPG', 'data/images/201212/19/aifwnt.JPG', 1, 0, 0, 1, 0, 1355915283, 0),
(2, 'BL2012121913673', 2, 0, '纯羊毛一粒扣枪驳领纯黑西服套装', '999.00', '1325.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_z2gd86.JPG', 'data/images/201212/19/goods_z2gd86.JPG', 'data/images/201212/19/z2gd86.JPG', 1, 0, 0, 1, 0, 1355915493, 0),
(3, 'BL2012121919874', 2, 0, '两扣平驳领棕色格纹男士休闲单西D6959', '1490.00', '1643.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_dx9ghq.JPG', 'data/images/201212/19/goods_dx9ghq.JPG', 'data/images/201212/19/dx9ghq.JPG', 1, 0, 0, 1, 0, 1355915572, 0),
(4, 'BL2012121970923', 3, 0, '蓝黑竖条纹男士休闲衬衫', '199.00', '238.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_juir8s.JPG', 'data/images/201212/19/goods_juir8s.JPG', 'data/images/201212/19/juir8s.JPG', 1, 0, 0, 1, 0, 1355915656, 0),
(5, 'BL2012121980647', 3, 0, '蓝底提花咖色竖条纹修身正装衬衫', '199.00', '234.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_rad3wq.JPG', 'data/images/201212/19/goods_rad3wq.JPG', 'data/images/201212/19/rad3wq.JPG', 1, 0, 0, 1, 0, 1355915689, 0),
(6, 'BL2012121956217', 3, 0, '男士短袖衬衫A52D/纯白暗竖纹/莫代尔棉', '45.00', '54.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_3fckzt.jpg', 'data/images/201212/19/goods_3fckzt.jpg', 'data/images/201212/19/3fckzt.jpg', 1, 0, 0, 0, 0, 1355915726, 0),
(7, 'BL2012121936338', 5, 0, '枪驳大领面后开叉短款两扣女士正装', '567.00', '1324.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_wcri9z.JPG', 'data/images/201212/19/goods_wcri9z.JPG', 'data/images/201212/19/wcri9z.JPG', 1, 0, 0, 0, 0, 1355915834, 0),
(8, 'BL2012121994403', 5, 0, '泡泡袖后领色丁拼接平驳领一扣女士正装套裤/黑色', '482.00', '897.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_5tsyhu.JPG', 'data/images/201212/19/goods_5tsyhu.JPG', 'data/images/201212/19/5tsyhu.JPG', 1, 0, 0, 0, 0, 1355915895, 0),
(9, 'BL2012121977239', 5, 0, '本白压褶下摆短袖套裙', '318.00', '564.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_ay86zh.JPG', 'data/images/201212/19/goods_ay86zh.JPG', 'data/images/201212/19/ay86zh.JPG', 1, 0, 0, 0, 0, 1355915936, 0),
(10, 'BL2012121941490', 5, 0, '枪驳大领面1扣女士正装/亮咖色', '499.00', '675.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_n29dmp.JPG', 'data/images/201212/19/goods_n29dmp.JPG', 'data/images/201212/19/n29dmp.JPG', 1, 0, 0, 0, 0, 1355915993, 0),
(11, 'BL2012121985783', 6, 0, '纯白斜条棉涤女士衬衫', '42.00', '67.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_byadc8.JPG', 'data/images/201212/19/goods_byadc8.JPG', 'data/images/201212/19/byadc8.JPG', 1, 0, 0, 0, 0, 1355916069, 0),
(12, 'BL2012121952838', 6, 0, '女士长袖衬衫165/蓝条纹/莫代尔棉V领花边', '99.00', '134.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_2mhjt4.JPG', 'data/images/201212/19/goods_2mhjt4.JPG', 'data/images/201212/19/2mhjt4.JPG', 1, 0, 0, 0, 0, 1355916106, 0),
(13, 'BL2012121982746', 6, 0, '白色暗竖纹V领莫代尔棉衬衫', '89.00', '156.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_fys85v.JPG', 'data/images/201212/19/goods_fys85v.JPG', 'data/images/201212/19/fys85v.JPG', 1, 0, 0, 1, 0, 1355916157, 0),
(14, 'BL2012121992429', 8, 0, '男士系带正装鞋/黑色/牛皮', '150.00', '250.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_yvwnc9.JPG', 'data/images/201212/19/goods_yvwnc9.JPG', 'data/images/201212/19/yvwnc9.JPG', 1, 0, 0, 0, 0, 1355916281, 0),
(15, 'BL2012121971035', 8, 0, '滑轮添奴男士系带正装鞋/牛皮', '150.00', '250.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_dh2yxm.JPG', 'data/images/201212/19/goods_dh2yxm.JPG', 'data/images/201212/19/dh2yxm.JPG', 1, 0, 0, 1, 0, 1355916549, 0),
(16, 'BL2012121977793', 8, 0, '全牛皮小圆头正装鞋', '199.00', '234.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_iu5xgq.JPG', 'data/images/201212/19/goods_iu5xgq.JPG', 'data/images/201212/19/iu5xgq.JPG', 1, 0, 0, 0, 0, 1355916612, 0),
(17, 'BL2012121952414', 0, 0, '鞋面三扣装饰胎牛皮带绒中跟踝靴/黑色', '299.00', '399.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_i7pqy8.JPG', 'data/images/201212/19/goods_i7pqy8.JPG', 'data/images/201212/19/i7pqy8.JPG', 1, 0, 0, 1, 0, 1355916746, 0),
(18, 'BL2012121957666', 9, 0, '简约中跟女士正装鞋黑色', '199.00', '399.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_fsuh7j.JPG', 'data/images/201212/19/goods_fsuh7j.JPG', 'data/images/201212/19/fsuh7j.JPG', 1, 0, 0, 0, 0, 1355916792, 0),
(19, 'BL2012121917277', 9, 0, '单侧镶钻漆皮中跟正装鞋/黑色', '145.00', '234.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_uigxw5.JPG', 'data/images/201212/19/goods_uigxw5.JPG', 'data/images/201212/19/uigxw5.JPG', 1, 0, 0, 0, 0, 1355916829, 0),
(20, 'BL2012121993042', 11, 0, '深蓝纯色领带', '89.00', '139.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_cbnrqe.JPG', 'data/images/201212/19/goods_cbnrqe.JPG', 'data/images/201212/19/cbnrqe.JPG', 1, 0, 0, 0, 0, 1355916948, 0),
(21, 'BL2012121965862', 11, 0, '100%桑蚕丝天蓝底黑斜纹领带', '128.00', '234.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_uc9n7f.JPG', 'data/images/201212/19/goods_uc9n7f.JPG', 'data/images/201212/19/uc9n7f.JPG', 1, 0, 0, 0, 0, 1355916979, 0),
(22, 'BL2012121940360', 11, 0, '100%桑蚕丝灰黑斜条纹领带', '128.00', '234.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_m5qd2j.JPG', 'data/images/201212/19/goods_m5qd2j.JPG', 'data/images/201212/19/m5qd2j.JPG', 1, 0, 0, 1, 0, 1355917010, 0),
(23, 'BL2012121939272', 12, 0, '不锈钢自动扣荔枝纹牛皮正装腰带', '69.00', '129.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_kixvwy.JPG', 'data/images/201212/19/goods_kixvwy.JPG', 'data/images/201212/19/kixvwy.JPG', 1, 0, 0, 0, 0, 1355917090, 0),
(24, 'BL2012121926113', 12, 0, '黑色烤漆不锈钢自动扣细纹牛皮正装腰带', '89.00', '169.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_avkfd4.JPG', 'data/images/201212/19/goods_avkfd4.JPG', 'data/images/201212/19/avkfd4.JPG', 1, 0, 0, 0, 0, 1355917125, 0),
(25, 'BL2012121943041', 12, 0, '银色不锈钢针扣头层小牛皮二层同色皮底正装腰带', '99.00', '169.00', 1, 0, '0.000', '', '', 'data/images/201212/19/thumb_nv7cas.JPG', 'data/images/201212/19/goods_nv7cas.JPG', 'data/images/201212/19/nv7cas.JPG', 1, 0, 0, 0, 0, 1355917162, 0),
(26, 'BL2016113016232', 0, 0, '这是媳妇', '0.00', '0.00', 1, 0, '0.000', '', '<p>\r\n    <img title="1480498207325492.jpg" alt="QQ图片20161012195212.jpg" src="/ueditor/php/upload/image/20161130/1480498207325492.jpg"/>\r\n</p>', '', '', '', 1, 0, 0, 1, 0, 1480498311, 0),
(27, 'BL2016113039798', 2, 0, '这是媳妇', '0.00', '0.00', 1, 0, '0.000', '', '<p><img alt="1480498207325492.jpg" src="/ueditor/php/upload/image/20161130/1480498207325492.jpg"/></p>', '', '', '', 1, 0, 0, 1, 0, 1480498406, 0),
(28, 'SP2016120122888', 0, 0, '11', '0.00', '0.00', 1, 0, '0.000', '', '<p>11</p>', '', '', '', 1, 0, 0, 0, 0, 1480602426, 0),
(29, 'SP2016120115472', 0, 0, '11', '44.00', '44.00', 1, 0, '0.000', '11124234gdfdfgdfgwerwer', '<p>114234234</p>', 'data/images/201612/01/thumb_rvs2nd.png', 'data/images/201612/01/goods_rvs2nd.png', 'data/images/201612/01/rvs2nd.png', 1, 0, 0, 0, 0, 1480604106, 0);

-- --------------------------------------------------------

--
-- 表的结构 `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `t1` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `test`
--

INSERT INTO `test` (`t1`) VALUES
('aa'),
('aa'),
('aa'),
(''),
(''),
('thisist1'),
('thisist1'''''),
('thisist1'''''),
('aa'),
('admin'),
('vam'),
('vam'),
(''),
(''),
(''),
('');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(16) NOT NULL DEFAULT '',
  `email` varchar(30) NOT NULL DEFAULT '',
  `passwd` char(32) NOT NULL DEFAULT '',
  `regtime` int(10) unsigned NOT NULL DEFAULT '0',
  `lastlogin` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`user_id`, `username`, `email`, `passwd`, `regtime`, `lastlogin`) VALUES
(1, '啊啊啊', '啊啊啊', '091da9bb52681ed043d257d665e0e5bf', 0, 0),
(2, '啊啊啊', '啊啊啊', '091da9bb52681ed043d257d665e0e5bf', 0, 0),
(3, '啊啊啊', '啊啊啊', '091da9bb52681ed043d257d665e0e5bf', 0, 0),
(4, '啊啊啊', '啊啊啊', '091da9bb52681ed043d257d665e0e5bf', 0, 0),
(5, '啊啊啊', '啊啊啊', '091da9bb52681ed043d257d665e0e5bf', 0, 0),
(6, '1111', '全球', '698d51a19d8a121ce581499d7b701668', 0, 0),
(7, '1111', '全球', '698d51a19d8a121ce581499d7b701668', 0, 0),
(8, 'test', 'Test@yeah.net', '098f6bcd4621d373cade4e832627b4f6', 0, 0),
(9, '11111', 'vam@Qq.com', 'b0baee9d279d34fa1dfd71aadb908c3f', 0, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
