-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2015 年 12 月 04 日 10:41
-- 服务器版本: 5.5.36
-- PHP 版本: 5.4.26

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `v19`
--

-- --------------------------------------------------------

--
-- 表的结构 `tp_new_chief`
--

CREATE TABLE IF NOT EXISTS `tp_new_chief` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '厨师id',
  `chief_name` varchar(50) DEFAULT NULL COMMENT '厨师姓名',
  `gender` int(10) DEFAULT NULL COMMENT '性别',
  `province` varchar(255) DEFAULT NULL COMMENT '籍贯',
  `experience_time` int(11) DEFAULT NULL COMMENT '厨龄',
  `good_at` varchar(500) DEFAULT NULL COMMENT '拿手菜',
  `service_region` varchar(255) DEFAULT NULL COMMENT '服务范围',
  `image` varchar(255) DEFAULT NULL COMMENT '头像',
  `first_cuisine_img` varchar(255) DEFAULT NULL COMMENT '拿手菜1图片地址',
  `sec_cuisine_img` varchar(255) DEFAULT NULL COMMENT '拿手菜2图片地址',
  `third_cuisine_img` varchar(255) DEFAULT NULL COMMENT '拿手菜3图片地址',
  `forth_cuisine_img` varchar(255) DEFAULT NULL COMMENT '拿手菜4图片地址',
  `id_img` varchar(255) DEFAULT NULL COMMENT '身份证图片地址',
  `health_id_img` varchar(255) DEFAULT NULL COMMENT '健康证图片地址',
  `chief_desc` varchar(500) DEFAULT NULL COMMENT '描述',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `catid` int(11) DEFAULT NULL COMMENT '分类id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `tp_new_chief`
--

INSERT INTO `tp_new_chief` (`id`, `chief_name`, `gender`, `province`, `experience_time`, `good_at`, `service_region`, `image`, `first_cuisine_img`, `sec_cuisine_img`, `third_cuisine_img`, `forth_cuisine_img`, `id_img`, `health_id_img`, `chief_desc`, `sort`, `add_time`, `catid`) VALUES
(1, '张三', 1, '四川', 4, '糖醋里脊,蚂蚁上树,鱼香肉丝', '青羊区,锦江区', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '测试测试测试测试测试测试测试测试测试测试测试', 0, 1443779668, 3),
(2, '李四', 1, '河北', 6, '鱼香肉丝,青椒肉丝,地三鲜', '锦江区', 'http://localhost/uploads/p/pkglfm1441210764/b/c/5/e/thumb_560f56a9079cd.png', 'http://localhost/uploads/p/pkglfm1441210764/c/5/c/1/thumb_560f56b7c8c49.png', 'http://localhost/uploads/p/pkglfm1441210764/c/5/c/1/thumb_560f56b7c8c49.png', '', '', 'http://localhost/uploads/p/pkglfm1441210764/4/9/6/c/thumb_560f573195cdd.png', 'http://localhost/uploads/p/pkglfm1441210764/f/2/5/2/thumb_560f57400a3fb.png', '发撒撒旦飞洒的', 0, 1443871100, 3),
(3, 'ddddd', 1, '四川', 23, '多舒服啊孙大发孙大发', '似的发射点发生', '', '', '', '', '', '', '', '士大夫撒旦发射点发', 0, 1443847603, 3),
(5, '张三1', 0, '四川', 11, '小笼包,肥肠粉', '浦东区,浦西区', 'http://localhost/uploads/p/pkglfm1441210764/b/c/5/e/thumb_560f56a9079cd.png', '', '', '', '', '', '', '撒法士大夫撒旦撒旦法撒旦撒法士大夫撒旦撒旦法撒旦撒法士大夫撒旦撒旦法撒旦撒法士大夫撒旦撒旦法撒旦撒法士大夫撒旦撒旦法撒旦撒法士大夫撒旦撒旦法撒旦撒法士大夫撒旦撒旦法撒旦撒法士大夫撒旦撒旦法撒旦', 0, 1443871652, 4);

-- --------------------------------------------------------

--
-- 表的结构 `tp_new_chief_cat`
--

CREATE TABLE IF NOT EXISTS `tp_new_chief_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '厨师分类id',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `cid` int(11) DEFAULT NULL COMMENT '备用字段1',
  `token` varchar(255) DEFAULT NULL COMMENT '微信接口预留token',
  `name` varchar(255) DEFAULT NULL COMMENT '分类名称',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `parentid` int(11) DEFAULT NULL COMMENT '父id',
  `logourl` varchar(255) DEFAULT NULL COMMENT '图标地址',
  `time` int(10) DEFAULT NULL COMMENT '添加时间',
  `norms` varchar(255) DEFAULT NULL COMMENT '备用字段2',
  `color` varchar(255) DEFAULT NULL COMMENT '备用字段3',
  `isfinal` tinyint(3) DEFAULT NULL COMMENT '是否是终结点',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_new_cuisine`
--

CREATE TABLE IF NOT EXISTS `tp_new_cuisine` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜品id',
  `name` varchar(255) DEFAULT NULL COMMENT '菜品名称',
  `logourl` varchar(255) DEFAULT NULL COMMENT '图标地址',
  `intro` varchar(255) DEFAULT NULL COMMENT '介绍',
  `cid` int(11) DEFAULT NULL COMMENT '备用字段1',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `catid` int(11) DEFAULT NULL COMMENT '菜品分类id',
  `vprice` float DEFAULT NULL COMMENT 'vip价格',
  `oprice` float DEFAULT NULL COMMENT '普通价格',
  `token` varchar(255) DEFAULT NULL COMMENT '微信接口预留token',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键字',
  `discount` float DEFAULT NULL COMMENT '折扣',
  `salecount` int(11) DEFAULT NULL COMMENT '销售数量',
  `time` int(11) DEFAULT NULL COMMENT '添加时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `num` int(11) DEFAULT NULL COMMENT '剩余数量',
  `price` float DEFAULT NULL COMMENT '销售价格',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_new_cuisine_cat`
--

CREATE TABLE IF NOT EXISTS `tp_new_cuisine_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜品分类id',
  `name` varchar(255) DEFAULT NULL COMMENT '菜品分类名称',
  `cid` int(11) DEFAULT NULL COMMENT '备用字段1',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `token` varchar(255) DEFAULT NULL COMMENT '微信接口预留token',
  `des` varchar(255) DEFAULT NULL COMMENT '描述',
  `parentid` int(11) DEFAULT NULL COMMENT '父id',
  `logourl` varchar(255) DEFAULT NULL COMMENT '图标地址',
  `time` int(11) DEFAULT NULL COMMENT '添加时间',
  `isfinal` int(11) DEFAULT NULL COMMENT '是否是终结点',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `tp_new_cuisine_cat`
--

INSERT INTO `tp_new_cuisine_cat` (`id`, `name`, `cid`, `sort`, `token`, `des`, `parentid`, `logourl`, `time`, `isfinal`) VALUES
(1, '1', 3, 0, 'pkglfm1441210764', '21323', 0, 'http://localhost/tpl/static/attachment/focus/default/../canyin/7.jpg', 1444149943, 2),
(2, '12', 3, 0, 'pkglfm1441210764', '12', 1, '', 1444150016, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tp_new_cuisine_image`
--

CREATE TABLE IF NOT EXISTS `tp_new_cuisine_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '菜品id',
  `image` varchar(255) DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_new_party`
--

CREATE TABLE IF NOT EXISTS `tp_new_party` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'party名称',
  `people_number` int(11) DEFAULT NULL COMMENT '人数',
  `logourl` varchar(255) DEFAULT NULL COMMENT '图标地址',
  `intro` varchar(255) DEFAULT NULL COMMENT '介绍',
  `cuisine_number` int(11) DEFAULT NULL COMMENT '菜品数量',
  `cuisine_intro` varchar(255) DEFAULT NULL COMMENT '菜品介绍',
  `price` float DEFAULT NULL COMMENT '销售价格',
  `vprice` float DEFAULT NULL COMMENT 'vip价格',
  `oprice` float DEFAULT NULL COMMENT '原始价格',
  `discount` float DEFAULT NULL COMMENT '折扣',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `cid` int(11) DEFAULT NULL COMMENT '备用字段1',
  `catid` int(11) DEFAULT NULL COMMENT '分类id',
  `token` varchar(255) DEFAULT NULL COMMENT '微信接口预留token',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键字',
  `salecount` int(11) DEFAULT NULL COMMENT '销量',
  `time` int(11) DEFAULT NULL COMMENT '添加时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_new_party_cat`
--

CREATE TABLE IF NOT EXISTS `tp_new_party_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `cid` int(11) DEFAULT NULL COMMENT '备用字段1',
  `token` varchar(255) DEFAULT NULL COMMENT '微信预留token',
  `name` varchar(255) DEFAULT NULL COMMENT 'party分类名称',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  `parentid` int(11) DEFAULT NULL COMMENT '父id',
  `logourl` varchar(255) DEFAULT NULL COMMENT '图标地址',
  `time` int(11) DEFAULT NULL COMMENT '添加时间',
  `isfinal` tinyint(3) DEFAULT NULL COMMENT '是否是终结点',
  `norms` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_new_party_image`
--

CREATE TABLE IF NOT EXISTS `tp_new_party_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT 'partyid',
  `image` varchar(255) DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `tp_new_setmeal`
--

CREATE TABLE IF NOT EXISTS `tp_new_setmeal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '套餐名称',
  `people_number` int(11) DEFAULT NULL COMMENT '人数',
  `logourl` varchar(500) DEFAULT NULL COMMENT '图标地址',
  `intro` varchar(1000) DEFAULT NULL COMMENT '介绍',
  `ingredient_source` varchar(255) DEFAULT NULL COMMENT '食材来源',
  `ingredient_dispatch_way` varchar(255) DEFAULT NULL COMMENT '食材配送方式',
  `cuisine_number` int(11) DEFAULT NULL COMMENT '菜品数量',
  `ingredient_dispatch_time` int(11) DEFAULT NULL COMMENT '食材配送时间',
  `dispatch_region` varchar(255) DEFAULT NULL COMMENT '食材配送区域',
  `cuisine_intro` varchar(500) DEFAULT NULL COMMENT '菜品介绍',
  `ingredient_seller_intro` varchar(500) DEFAULT NULL COMMENT '食材供应商介绍',
  `price` float DEFAULT NULL COMMENT '销售价格',
  `cid` int(11) DEFAULT NULL COMMENT '备用字段1',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `catid` int(11) DEFAULT NULL COMMENT '种类id',
  `vprice` float DEFAULT NULL COMMENT 'vip价格',
  `oprice` float DEFAULT NULL COMMENT '原始价格',
  `discount` float DEFAULT NULL COMMENT '折扣',
  `token` varchar(255) DEFAULT NULL COMMENT '微信接口预留token',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键字',
  `salecount` int(11) DEFAULT NULL COMMENT '销量',
  `endtime` int(11) DEFAULT NULL COMMENT '结束时间',
  `time` int(11) DEFAULT NULL COMMENT '添加时间',
  `num` int(11) DEFAULT NULL COMMENT '可供应数量',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `tp_new_setmeal`
--

INSERT INTO `tp_new_setmeal` (`id`, `name`, `people_number`, `logourl`, `intro`, `ingredient_source`, `ingredient_dispatch_way`, `cuisine_number`, `ingredient_dispatch_time`, `dispatch_region`, `cuisine_intro`, `ingredient_seller_intro`, `price`, `cid`, `sort`, `catid`, `vprice`, `oprice`, `discount`, `token`, `keyword`, `salecount`, `endtime`, `time`, `num`, `status`) VALUES
(1, '298阖家欢乐套餐', 4, NULL, '123232法撒旦飞洒地方撒旦发射点发生和', '京东', '京东配送', 4, 1444034593, '锦江区,金牛区', '菜品介绍1，23，3，，4，4，4，4，，3，43，3，4，', '京东介绍', 298, 3, 0, 2, 298, NULL, NULL, 'pkglfm1441210764', '家庭套餐', 0, NULL, 1444034593, 100, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tp_new_setmeal_cat`
--

CREATE TABLE IF NOT EXISTS `tp_new_setmeal_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `des` varchar(500) DEFAULT NULL COMMENT '描述',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `time` int(11) DEFAULT NULL COMMENT '添加时间',
  `parentid` int(11) DEFAULT NULL COMMENT '父id',
  `cid` int(11) DEFAULT NULL COMMENT '备用字段1',
  `token` varchar(255) DEFAULT NULL COMMENT '微信预留token',
  `logourl` varchar(255) DEFAULT NULL COMMENT '图标地址',
  `norms` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `isfinal` tinyint(1) unsigned DEFAULT NULL COMMENT '是否是终结点',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `tp_new_setmeal_cat`
--

INSERT INTO `tp_new_setmeal_cat` (`id`, `name`, `des`, `sort`, `time`, `parentid`, `cid`, `token`, `logourl`, `norms`, `color`, `isfinal`) VALUES
(1, '四菜一汤', '23', 0, 1443871652, 0, 3, 'pkglfm1441210764', NULL, NULL, NULL, 2),
(2, '112', '1111', 1, 1444030273, 0, 3, 'pkglfm1441210764', 'http://localhost/tpl/static/attachment/focus/default/../canyin/7.jpg', NULL, NULL, 1),
(3, '333333', '333333', 3, 1444034372, 0, 3, 'pkglfm1441210764', 'http://localhost/uploads/p/pkglfm1441210764/b/f/5/b/thumb_560e54e051029.png', NULL, NULL, 0),
(4, '198', '198', 0, 1444034593, 1, 3, 'pkglfm1441210764', 'http://localhost/tpl/static/attachment/focus/default/../canyin/7.jpg', NULL, NULL, 0),
(5, '298', '298', 0, 1444034626, 1, 3, 'pkglfm1441210764', 'http://localhost/tpl/static/attachment/focus/default/../canyin/7.jpg', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `tp_new_setmeal_image`
--

CREATE TABLE IF NOT EXISTS `tp_new_setmeal_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '套餐id',
  `image` varchar(255) DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `tp_new_setmeal_image`
--

INSERT INTO `tp_new_setmeal_image` (`id`, `pid`, `image`) VALUES
(1, 2, 'http://localhost/uploads/p/pkglfm1441210764/d/6/d/4/56129e06c2b7b.png'),
(2, 2, 'http://localhost/uploads/p/pkglfm1441210764/4/9/6/c/thumb_560f573195cdd.png'),
(3, 3, 'http://localhost/tpl/static/attachment/focus/default/../canyin/7.jpg'),
(4, 3, 'http://localhost/tpl/static/attachment/focus/default/../canyin/7.jpg'),
(5, 3, 'http://localhost/tpl/static/attachment/focus/default/../canyin/7.jpg'),
(6, 3, 'http://localhost/tpl/static/attachment/focus/default/../canyin/7.jpg');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
