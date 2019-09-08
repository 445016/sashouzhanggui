-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2019-09-08 14:22:49
-- 服务器版本： 5.7.14
-- PHP Version: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `we7`
--

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_action_log`
--

CREATE TABLE `hjmall_action_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(45) NOT NULL DEFAULT '' COMMENT '操作记录描述',
  `addtime` int(11) NOT NULL COMMENT '记录时间',
  `admin_name` varchar(45) NOT NULL DEFAULT '' COMMENT '操作人姓名',
  `admin_id` int(11) NOT NULL COMMENT '操作人ID',
  `admin_ip` varchar(255) DEFAULT NULL COMMENT '操作人IP地址',
  `route` varchar(255) NOT NULL DEFAULT '' COMMENT '操作路由',
  `action_type` varchar(45) NOT NULL DEFAULT '' COMMENT '操作类型',
  `obj_id` int(11) NOT NULL COMMENT '操作数据ID',
  `result` longtext,
  `store_id` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '日志类型:1.操作日志 2.定时任务日志'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `hjmall_action_log`
--

INSERT INTO `hjmall_action_log` (`id`, `title`, `addtime`, `admin_name`, `admin_id`, `admin_ip`, `route`, `action_type`, `obj_id`, `result`, `store_id`, `is_delete`, `type`) VALUES
(1, 'admin执行了mch/passport/login添加', 1567497020, 'admin', 1, '::1', 'mch/passport/login', 'INSERT', 1, '"{\\"id\\":1,\\"acid\\":\\"2\\",\\"user_id\\":1,\\"name\\":\\"\\\\u6d4b\\\\u8bd5\\",\\"app_id\\":\\"0\\",\\"app_secret\\":\\"0\\",\\"desc\\":null,\\"mch_id\\":null,\\"key\\":null,\\"cert_pem\\":null,\\"key_pem\\":null,\\"addtime\\":null,\\"is_delete\\":null}"', 0, 0, 0),
(2, 'admin执行了mch/passport/login添加', 1567497020, 'admin', 1, '::1', 'mch/passport/login', 'INSERT', 1, '"{\\"id\\":1,\\"admin_id\\":null,\\"is_delete\\":null,\\"is_recycle\\":null,\\"acid\\":\\"2\\",\\"user_id\\":1,\\"wechat_platform_id\\":null,\\"wechat_app_id\\":1,\\"name\\":\\"\\\\u6d4b\\\\u8bd5\\",\\"order_send_tpl\\":null,\\"contact_tel\\":null,\\"show_customer_service\\":null,\\"copyright\\":null,\\"copyright_pic_url\\":null,\\"copyright_url\\":null,\\"delivery_time\\":null,\\"after_sale_time\\":null,\\"use_wechat_platform_pay\\":null,\\"kdniao_mch_id\\":null,\\"kdniao_api_key\\":null,\\"cat_style\\":null,\\"home_page_module\\":null,\\"address\\":null,\\"cat_goods_cols\\":null,\\"over_day\\":0,\\"is_offline\\":null,\\"is_coupon\\":null,\\"cat_goods_count\\":null,\\"send_type\\":null,\\"member_content\\":null,\\"nav_count\\":null,\\"integral\\":null,\\"integration\\":null,\\"cut_thread\\":null,\\"dial\\":null,\\"dial_pic\\":null,\\"purchase_frame\\":null,\\"is_recommend\\":null,\\"recommend_count\\":null,\\"status\\":null,\\"is_comment\\":null,\\"is_sales\\":null,\\"good_negotiable\\":null,\\"buy_member\\":null,\\"logo\\":null,\\"is_member_price\\":null,\\"is_share_price\\":null,\\"is_member\\":null,\\"is_official_account\\":null}"', 0, 0, 0),
(3, 'admin登录了系统', 1567497020, 'admin', 1, '::1', 'mch/passport/login', 'LOGIN', 1, '[]', 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_ad`
--

CREATE TABLE `hjmall_ad` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0关闭 1开启',
  `unit_id` varchar(255) NOT NULL DEFAULT '' COMMENT '广告id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1抽奖首页'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_address`
--

CREATE TABLE `hjmall_address` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `mobile` varchar(255) NOT NULL COMMENT '手机号',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `province` varchar(255) NOT NULL COMMENT '省份名称',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `city` varchar(255) NOT NULL COMMENT '城市名称',
  `district_id` int(11) NOT NULL DEFAULT '0',
  `district` varchar(255) NOT NULL COMMENT '县区名称',
  `detail` varchar(1000) NOT NULL COMMENT '详细地址',
  `is_default` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否是默认地址：0=否，1=是',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收货地址';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_admin`
--

CREATE TABLE `hjmall_admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_key` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `app_max_count` int(11) NOT NULL DEFAULT '0',
  `permission` longtext,
  `remark` varchar(255) NOT NULL DEFAULT '',
  `expire_time` int(11) NOT NULL DEFAULT '0' COMMENT '账户有效期至，0表示永久',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '手机号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_admin_permission`
--

CREATE TABLE `hjmall_admin_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `display_name` varchar(255) NOT NULL,
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '1000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `hjmall_admin_permission`
--

INSERT INTO `hjmall_admin_permission` (`id`, `name`, `display_name`, `is_delete`, `sort`) VALUES
(1, 'coupon', '优惠券', 0, 1000),
(2, 'share', '分销', 0, 1000),
(3, 'topic', '专题', 0, 1000),
(4, 'video', '视频专区', 0, 1000),
(5, 'copyright', '版权设置', 0, 1000);

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_admin_register`
--

CREATE TABLE `hjmall_admin_register` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL COMMENT '帐户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `mobile` varchar(15) NOT NULL COMMENT '手机号',
  `name` varchar(255) NOT NULL COMMENT '姓名/企业名',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '申请原因',
  `addtime` int(11) NOT NULL,
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '审核状态：0=待审核，1=通过，2=不通过',
  `is_delete` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_article`
--

CREATE TABLE `hjmall_article` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `article_cat_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类id：1=关于我们，2=服务中心',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `content` longtext COMMENT '内容',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序：升序',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统文章';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_attr`
--

CREATE TABLE `hjmall_attr` (
  `id` int(11) NOT NULL,
  `attr_group_id` int(11) NOT NULL,
  `attr_name` varchar(255) NOT NULL,
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `is_default` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否是默认属性'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规格';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_attr_group`
--

CREATE TABLE `hjmall_attr_group` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `attr_group_name` varchar(255) NOT NULL,
  `is_delete` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品规格组';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_auth_role`
--

CREATE TABLE `hjmall_auth_role` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `creator_id` int(11) NOT NULL DEFAULT '0' COMMENT '创建者ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_auth_role_permission`
--

CREATE TABLE `hjmall_auth_role_permission` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_auth_role_user`
--

CREATE TABLE `hjmall_auth_role_user` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_banner`
--

CREATE TABLE `hjmall_banner` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL COMMENT '商城id',
  `pic_url` varchar(2048) DEFAULT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `page_url` varchar(2048) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序，升序',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_delete` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否删除：0=未删除，1=已删除',
  `type` smallint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '类型 【1=> 商城，2=> 拼团】',
  `open_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商店幻灯片';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_bargain_goods`
--

CREATE TABLE `hjmall_bargain_goods` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `min_price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '最低价',
  `begin_time` int(11) NOT NULL DEFAULT '0' COMMENT '活动开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '砍价小时数',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '砍价方式 0--按人数 1--按价格',
  `status_data` varchar(255) NOT NULL DEFAULT '' COMMENT '砍价方式数据',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_bargain_order`
--

CREATE TABLE `hjmall_bargain_order` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `order_no` varchar(255) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品售价',
  `min_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商品最低价',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '砍价时间',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '状态 0--进行中 1--成功 2--失败',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `attr` varchar(255) NOT NULL DEFAULT '',
  `status_data` varchar(255) NOT NULL DEFAULT '' COMMENT '砍价方式数据'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发起砍价订单表';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_bargain_setting`
--

CREATE TABLE `hjmall_bargain_setting` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `is_print` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否打印 0--否 1--是',
  `is_share` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否参与分销 0--不参与 1--参与',
  `is_sms` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否发送短信 0--否 1--是',
  `is_mail` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否发送邮件 0--否 1--是',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '活动规则',
  `share_title` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_bargain_user_order`
--

CREATE TABLE `hjmall_bargain_user_order` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='砍价插件用户砍价情况；';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_card`
--

CREATE TABLE `hjmall_card` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '卡券名称',
  `pic_url` varchar(2048) DEFAULT NULL,
  `content` longtext COMMENT '卡券描述',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_cart`
--

CREATE TABLE `hjmall_cart` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `attr` longtext NOT NULL COMMENT '规格',
  `mch_id` int(11) NOT NULL DEFAULT '0' COMMENT '入驻商id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='购物车';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_cash`
--

CREATE TABLE `hjmall_cash` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '申请状态 0--申请中 1--确认申请 2--已打款 3--驳回  5--余额通过',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `pay_time` int(11) NOT NULL COMMENT '付款',
  `type` smallint(1) NOT NULL DEFAULT '0' COMMENT '支付方式 0--微信支付  1--支付宝  2--银行卡  3--余额',
  `mobile` varchar(255) DEFAULT NULL COMMENT '支付宝账号',
  `name` varchar(255) DEFAULT NULL COMMENT '支付宝姓名',
  `bank_name` varchar(30) DEFAULT NULL COMMENT '开户行名称',
  `pay_type` int(11) DEFAULT '0' COMMENT '打款方式 0--之前未统计的 1--微信自动打款 2--手动打款',
  `order_no` varchar(255) DEFAULT NULL COMMENT '微信自动打款订单号',
  `service_charge` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '提现手续费'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='提现表';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_cat`
--

CREATE TABLE `hjmall_cat` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL COMMENT '商城id',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类id',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `pic_url` varchar(2048) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序，升序',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `big_pic_url` varchar(2048) DEFAULT NULL,
  `advert_pic` longtext COMMENT '广告图片',
  `advert_url` varchar(2048) DEFAULT NULL,
  `is_show` smallint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否显示【1=> 显示，2=> 隐藏】'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_color`
--

CREATE TABLE `hjmall_color` (
  `id` int(11) NOT NULL,
  `rgb` varchar(255) NOT NULL COMMENT 'rgb颜色码 例如："0，0，0"',
  `color` varchar(255) NOT NULL COMMENT '16进制颜色码例如：#ffffff',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='颜色库';

--
-- 转存表中的数据 `hjmall_color`
--

INSERT INTO `hjmall_color` (`id`, `rgb`, `color`, `is_delete`, `addtime`) VALUES
(1, '{"r":"51","g":"51","b":"51"}', '#333333', 0, 0),
(2, '{"r":"255","g":"69","b":"68"}', '#ff4544', 0, 0),
(3, '{"r":"255","g":"255","b":"255"}', '#ffffff', 0, 0),
(4, '{"r":"239","g":"174","b":"57"}', '#EFAE39', 0, 0),
(6, '{"r":"88","g":"228","b":"88"}', '#58E458', 0, 0),
(7, '{"r":"9","g":"122","b":"220"}', '#097ADC', 0, 0),
(8, '{"r":"164","g":"62","b":"228"}', '#A43EE4', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_coupon`
--

CREATE TABLE `hjmall_coupon` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '优惠券名称',
  `desc` varchar(2000) NOT NULL DEFAULT '',
  `pic_url` varchar(2048) DEFAULT NULL,
  `discount_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '优惠券类型：1=折扣，2=满减',
  `min_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '最低消费金额',
  `sub_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠金额',
  `discount` decimal(3,1) NOT NULL DEFAULT '10.0' COMMENT '折扣率',
  `expire_type` smallint(1) NOT NULL DEFAULT '1' COMMENT '到期类型：1=领取后N天过期，2=指定有效期',
  `expire_day` int(11) NOT NULL DEFAULT '0' COMMENT '有效天数，expire_type=1时',
  `begin_time` int(11) NOT NULL DEFAULT '0' COMMENT '有效期开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '有效期结束时间',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `total_count` int(11) NOT NULL DEFAULT '-1' COMMENT '发放总数量',
  `is_join` smallint(6) NOT NULL DEFAULT '1' COMMENT '是否加入领券中心 1--不加入领券中心 2--加入领券中心',
  `sort` int(11) DEFAULT '100' COMMENT '排序按升序排列',
  `cat_id_list` varchar(255) DEFAULT NULL,
  `appoint_type` tinyint(1) DEFAULT NULL,
  `is_integral` smallint(6) NOT NULL DEFAULT '1' COMMENT '是否加入积分商城 1--不加入 2--加入',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT '兑换需要积分数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售价',
  `total_num` int(11) NOT NULL DEFAULT '0' COMMENT '积分商城发放总数',
  `user_num` int(11) NOT NULL DEFAULT '0' COMMENT '每人限制兑换数量',
  `rule` varchar(1000) DEFAULT '' COMMENT '使用说明',
  `goods_id_list` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_coupon_auto_send`
--

CREATE TABLE `hjmall_coupon_auto_send` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `event` int(11) NOT NULL DEFAULT '1' COMMENT '触发事件：1=分享，2=购买并付款',
  `send_times` int(11) NOT NULL DEFAULT '1' COMMENT '最多发放次数，0表示不限制',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='优惠券自动发放';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_delivery`
--

CREATE TABLE `hjmall_delivery` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `express_id` int(11) DEFAULT NULL COMMENT '快递公司id',
  `customer_name` varchar(255) DEFAULT NULL COMMENT '电子面单客户账号',
  `customer_pwd` varchar(255) DEFAULT NULL COMMENT '电子面单密码',
  `month_code` varchar(255) DEFAULT NULL COMMENT '月结编码',
  `send_site` varchar(255) DEFAULT NULL COMMENT '网点编码',
  `send_name` varchar(255) DEFAULT NULL COMMENT '网点名称',
  `is_delete` smallint(2) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `template_size` varchar(255) DEFAULT NULL COMMENT '快递鸟电子面单模板规格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_diy_page`
--

CREATE TABLE `hjmall_diy_page` (
  `id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `title` varchar(45) NOT NULL DEFAULT '' COMMENT '页面标题',
  `template_id` int(11) NOT NULL COMMENT '模板ID',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0--禁用 1--启用',
  `is_index` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否覆盖首页 0--不覆盖 1--覆盖'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_diy_template`
--

CREATE TABLE `hjmall_diy_template` (
  `id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL DEFAULT '' COMMENT '模板名称',
  `template` longtext NOT NULL COMMENT '模板数据',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_express`
--

CREATE TABLE `hjmall_express` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `code` varchar(255) NOT NULL DEFAULT '',
  `sort` int(11) NOT NULL DEFAULT '100',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '数据类型：kdniao=快递鸟',
  `is_delete` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='快递公司';

--
-- 转存表中的数据 `hjmall_express`
--

INSERT INTO `hjmall_express` (`id`, `name`, `code`, `sort`, `type`, `is_delete`) VALUES
(1, '顺丰快递', 'SF', 1, 'kdniao', 0),
(2, '申通快递', 'STO', 1, 'kdniao', 0),
(3, '韵达快递', 'YD', 1, 'kdniao', 0),
(4, '圆通速递', 'YTO', 1, 'kdniao', 0),
(5, '中通速递', 'ZTO', 1, 'kdniao', 0),
(6, '百世快递', 'HTKY', 1, 'kdniao', 0),
(7, 'EMS', 'EMS', 2, 'kdniao', 0),
(8, '天天快递', 'HHTT', 2, 'kdniao', 0),
(9, '邮政平邮/小包', 'YZPY', 2, 'kdniao', 0),
(10, '宅急送', 'ZJS', 2, 'kdniao', 0),
(11, '国通快递', 'GTO', 5, 'kdniao', 0),
(12, '全峰快递', 'QFKD', 5, 'kdniao', 0),
(13, '优速快递', 'UC', 5, 'kdniao', 0),
(14, '中铁快运', 'ZTKY', 5, 'kdniao', 0),
(15, '中铁物流', 'ZTWL', 5, 'kdniao', 0),
(16, '亚马逊物流', 'AMAZON', 5, 'kdniao', 0),
(17, '城际快递', 'CJKD', 5, 'kdniao', 0),
(18, '德邦', 'DBL', 5, 'kdniao', 0),
(19, '汇丰物流', 'HFWL', 5, 'kdniao', 0),
(20, '百世快运', 'BTWL', 100, 'kdniao', 0),
(21, '安捷快递', 'AJ', 100, 'kdniao', 0),
(22, '安能物流', 'ANE', 100, 'kdniao', 0),
(23, '安信达快递', 'AXD', 100, 'kdniao', 0),
(24, '北青小红帽', 'BQXHM', 100, 'kdniao', 0),
(25, '百福东方', 'BFDF', 100, 'kdniao', 0),
(26, 'CCES快递', 'CCES', 100, 'kdniao', 0),
(27, '城市100', 'CITY100', 100, 'kdniao', 0),
(28, 'COE东方快递', 'COE', 100, 'kdniao', 0),
(29, '长沙创一', 'CSCY', 100, 'kdniao', 0),
(30, '成都善途速运', 'CDSTKY', 100, 'kdniao', 0),
(31, 'D速物流', 'DSWL', 100, 'kdniao', 0),
(32, '大田物流', 'DTWL', 100, 'kdniao', 0),
(33, '快捷速递', 'FAST', 100, 'kdniao', 0),
(34, 'FEDEX联邦(国内件）', 'FEDEX', 100, 'kdniao', 0),
(35, 'FEDEX联邦(国际件）', 'FEDEX_GJ', 100, 'kdniao', 0),
(36, '飞康达', 'FKD', 100, 'kdniao', 0),
(37, '广东邮政', 'GDEMS', 100, 'kdniao', 0),
(38, '共速达', 'GSD', 100, 'kdniao', 0),
(39, '高铁速递', 'GTSD', 100, 'kdniao', 0),
(40, '恒路物流', 'HLWL', 100, 'kdniao', 0),
(41, '天地华宇', 'HOAU', 100, 'kdniao', 0),
(42, '华强物流', 'hq568', 100, 'kdniao', 0),
(43, '华夏龙物流', 'HXLWL', 100, 'kdniao', 0),
(44, '好来运快递', 'HYLSD', 100, 'kdniao', 0),
(45, '京广速递', 'JGSD', 100, 'kdniao', 0),
(46, '九曳供应链', 'JIUYE', 100, 'kdniao', 0),
(47, '佳吉快运', 'JJKY', 100, 'kdniao', 0),
(48, '嘉里物流', 'JLDT', 100, 'kdniao', 0),
(49, '捷特快递', 'JTKD', 100, 'kdniao', 0),
(50, '急先达', 'JXD', 100, 'kdniao', 0),
(51, '晋越快递', 'JYKD', 100, 'kdniao', 0),
(52, '加运美', 'JYM', 100, 'kdniao', 0),
(53, '佳怡物流', 'JYWL', 100, 'kdniao', 0),
(54, '跨越物流', 'KYWL', 100, 'kdniao', 0),
(55, '龙邦快递', 'LB', 100, 'kdniao', 0),
(56, '联昊通速递', 'LHT', 100, 'kdniao', 0),
(57, '民航快递', 'MHKD', 100, 'kdniao', 0),
(58, '明亮物流', 'MLWL', 100, 'kdniao', 0),
(59, '能达速递', 'NEDA', 100, 'kdniao', 0),
(60, '平安达腾飞快递', 'PADTF', 100, 'kdniao', 0),
(61, '全晨快递', 'QCKD', 100, 'kdniao', 0),
(62, '全日通快递', 'QRT', 100, 'kdniao', 0),
(63, '如风达', 'RFD', 100, 'kdniao', 0),
(64, '赛澳递', 'SAD', 100, 'kdniao', 0),
(65, '圣安物流', 'SAWL', 100, 'kdniao', 0),
(66, '盛邦物流', 'SBWL', 100, 'kdniao', 0),
(67, '上大物流', 'SDWL', 100, 'kdniao', 0),
(68, '盛丰物流', 'SFWL', 100, 'kdniao', 0),
(69, '盛辉物流', 'SHWL', 100, 'kdniao', 0),
(70, '速通物流', 'ST', 100, 'kdniao', 0),
(71, '速腾快递', 'STWL', 100, 'kdniao', 0),
(72, '速尔快递', 'SURE', 100, 'kdniao', 0),
(73, '唐山申通', 'TSSTO', 100, 'kdniao', 0),
(74, '全一快递', 'UAPEX', 100, 'kdniao', 0),
(75, '万家物流', 'WJWL', 100, 'kdniao', 0),
(76, '万象物流', 'WXWL', 100, 'kdniao', 0),
(77, '新邦物流', 'XBWL', 100, 'kdniao', 0),
(78, '信丰快递', 'XFEX', 100, 'kdniao', 0),
(79, '希优特', 'XYT', 100, 'kdniao', 0),
(80, '新杰物流', 'XJ', 100, 'kdniao', 0),
(81, '源安达快递', 'YADEX', 100, 'kdniao', 0),
(82, '远成物流', 'YCWL', 100, 'kdniao', 0),
(83, '义达国际物流', 'YDH', 100, 'kdniao', 0),
(84, '越丰物流', 'YFEX', 100, 'kdniao', 0),
(85, '原飞航物流', 'YFHEX', 100, 'kdniao', 0),
(86, '亚风快递', 'YFSD', 100, 'kdniao', 0),
(87, '运通快递', 'YTKD', 100, 'kdniao', 0),
(88, '亿翔快递', 'YXKD', 100, 'kdniao', 0),
(89, '增益快递', 'ZENY', 100, 'kdniao', 0),
(90, '汇强快递', 'ZHQKD', 100, 'kdniao', 0),
(91, '众通快递', 'ZTE', 100, 'kdniao', 0),
(92, '中邮物流', 'ZYWL', 100, 'kdniao', 0),
(93, '速必达物流', 'SUBIDA', 100, 'kdniao', 0),
(94, '瑞丰速递', 'RFEX', 100, 'kdniao', 0),
(95, '快客快递', 'QUICK', 100, 'kdniao', 0),
(96, 'CNPEX中邮快递', 'CNPEX', 100, 'kdniao', 0),
(97, '鸿桥供应链', 'HOTSCM', 100, 'kdniao', 0),
(98, '海派通物流公司', 'HPTEX', 100, 'kdniao', 0),
(99, '澳邮专线', 'AYCA', 100, 'kdniao', 0),
(100, '泛捷快递', 'PANEX', 100, 'kdniao', 0),
(101, 'PCA Express', 'PCA', 100, 'kdniao', 0),
(102, 'UEQ Express', 'UEQ', 100, 'kdniao', 0);

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_favorite`
--

CREATE TABLE `hjmall_favorite` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `addtime` int(11) NOT NULL,
  `is_delete` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='我喜欢的商品';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_file_group`
--

CREATE TABLE `hjmall_file_group` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `is_default` int(11) DEFAULT '0' COMMENT '是否可编辑',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图片库分组';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_form`
--

CREATE TABLE `hjmall_form` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `required` int(11) DEFAULT NULL COMMENT '必填项',
  `default` varchar(255) DEFAULT NULL COMMENT '默认值',
  `tip` varchar(255) DEFAULT NULL COMMENT '提示语',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_form_id`
--

CREATE TABLE `hjmall_form_id` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `wechat_open_id` varchar(255) NOT NULL DEFAULT '' COMMENT '微信openid',
  `form_id` varchar(255) NOT NULL DEFAULT '',
  `order_no` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '可选值：form_id或prepay_id',
  `send_count` int(11) NOT NULL DEFAULT '0' COMMENT '使用次数',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_usable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用于判断 prepay_id 是否有效'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小程序form_id和prepay_id记录';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_free_delivery_rules`
--

CREATE TABLE `hjmall_free_delivery_rules` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `city` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_fxhb_hongbao`
--

CREATE TABLE `hjmall_fxhb_hongbao` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_num` int(11) NOT NULL COMMENT '拆红包所需用户数,最少2人',
  `coupon_total_money` decimal(10,2) NOT NULL COMMENT '红包总金额',
  `coupon_money` decimal(10,2) NOT NULL COMMENT '分到的红包金额',
  `coupon_use_minimum` decimal(10,2) NOT NULL COMMENT '红包使用最低消费金额',
  `coupon_expire` int(11) NOT NULL DEFAULT '30' COMMENT '优惠券有效期，天',
  `distribute_type` tinyint(1) NOT NULL COMMENT '红包分配类型：0=随机，1=平分',
  `is_expire` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否已过期',
  `expire_time` int(11) NOT NULL COMMENT '到期时间',
  `is_finish` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已完成',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `form_id` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序form_id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_fxhb_setting`
--

CREATE TABLE `hjmall_fxhb_setting` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_num` int(11) NOT NULL DEFAULT '2' COMMENT '拆红包所需用户数,最少2人',
  `coupon_total_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '红包总金额',
  `coupon_use_minimum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '赠送的优惠券最低消费金额',
  `coupon_expire` int(11) NOT NULL DEFAULT '30' COMMENT '红包优惠券有效期',
  `distribute_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '红包分配类型：0=随机，1=平分',
  `tpl_msg_id` varchar(255) NOT NULL DEFAULT '' COMMENT '红包到账通知模板消息id',
  `game_time` int(11) NOT NULL DEFAULT '24' COMMENT '每个红包有效期,单位：小时',
  `game_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启活动，0=不开启，1=开启',
  `rule` longtext COMMENT '规则',
  `share_pic` longtext,
  `share_title` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_goods`
--

CREATE TABLE `hjmall_goods` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售价',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '原价（只做显示用）',
  `detail` longtext NOT NULL COMMENT '商品详情，图文',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品类别',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '上架状态：0=下架，1=上架',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `attr` longtext NOT NULL COMMENT '规格的库存及价格',
  `service` varchar(2000) NOT NULL DEFAULT '' COMMENT '商品服务选项',
  `sort` int(11) NOT NULL DEFAULT '1000' COMMENT '排序  升序',
  `virtual_sales` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟销量',
  `cover_pic` longtext COMMENT '商品缩略图',
  `video_url` varchar(2048) DEFAULT NULL,
  `unit` varchar(255) NOT NULL DEFAULT '件' COMMENT '单位',
  `individual_share` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否单独分销设置：0=否，1=是',
  `share_commission_first` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '一级分销佣金比例',
  `share_commission_second` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '二级分销佣金比例',
  `share_commission_third` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '三级分销佣金比例',
  `weight` double(10,2) UNSIGNED DEFAULT '0.00' COMMENT '重量',
  `freight` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  `full_cut` longtext COMMENT '满减',
  `integral` text COMMENT '积分设置',
  `use_attr` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否使用规格：0=不使用，1=使用',
  `share_type` int(11) DEFAULT '0' COMMENT '佣金配比 0--百分比 1--固定金额',
  `quick_purchase` smallint(1) DEFAULT NULL COMMENT '是否加入快速购买  0--关闭   1--开启',
  `hot_cakes` smallint(1) DEFAULT NULL COMMENT '是否加入热销  0--关闭   1--开启',
  `cost_price` decimal(10,2) DEFAULT '0.00',
  `member_discount` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否参与会员折扣  0=参与   1=不参与',
  `rebate` decimal(10,2) DEFAULT '0.00' COMMENT '自购返利',
  `mch_id` int(11) NOT NULL DEFAULT '0' COMMENT '入驻商户的id',
  `goods_num` int(11) NOT NULL DEFAULT '0' COMMENT '商品总库存',
  `mch_sort` int(11) NOT NULL DEFAULT '1000' COMMENT '多商户自己的排序',
  `confine_count` int(11) NOT NULL DEFAULT '0' COMMENT '购买限制:0.不限制|大于0等于限购数量',
  `is_level` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否享受会员折扣 0-不享受 1--享受',
  `type` smallint(1) NOT NULL DEFAULT '0' COMMENT '类型 0--商城或多商户 2--砍价商品',
  `is_negotiable` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否面议 0 不面议 1面议',
  `attr_setting_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分销设置类型 0.普通设置|1.详细设置'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_goods_card`
--

CREATE TABLE `hjmall_goods_card` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL COMMENT '卡券id',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_goods_cat`
--

CREATE TABLE `hjmall_goods_cat` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `cat_id` int(11) DEFAULT NULL COMMENT '分类id',
  `addtime` int(11) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_goods_pic`
--

CREATE TABLE `hjmall_goods_pic` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `pic_url` varchar(2048) DEFAULT NULL,
  `is_delete` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_goods_share`
--

CREATE TABLE `hjmall_goods_share` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT '0' COMMENT '商品类型 0--拼团',
  `goods_id` int(11) DEFAULT NULL COMMENT '商品id',
  `individual_share` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否单独分销设置：0=否，1=是',
  `share_commission_first` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '一级分销佣金比例',
  `share_commission_second` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '二级分销佣金比例',
  `share_commission_third` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '三级分销佣金比例',
  `share_type` int(11) DEFAULT '0' COMMENT '佣金配比 0--百分比 1--固定金额',
  `rebate` decimal(10,2) DEFAULT '0.00' COMMENT '自购返利',
  `attr_setting_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分销设置类型 0.普通设置|1.详细设置',
  `relation_id` int(11) NOT NULL DEFAULT '0' COMMENT '关联临时分销佣金ID，秒杀商品设置|拼团阶梯团'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分销设置；';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_gwd_buy_list`
--

CREATE TABLE `hjmall_gwd_buy_list` (
  `id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `addtime` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL COMMENT '0.商城|1.秒杀|2.拼团'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_gwd_like_list`
--

CREATE TABLE `hjmall_gwd_like_list` (
  `id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT '0',
  `addtime` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL COMMENT '0.商城|1.秒杀|2.拼团'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_gwd_like_user`
--

CREATE TABLE `hjmall_gwd_like_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `like_id` int(11) NOT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_gwd_setting`
--

CREATE TABLE `hjmall_gwd_setting` (
  `id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_home_block`
--

CREATE TABLE `hjmall_home_block` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `data` longtext,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `style` int(11) DEFAULT '0' COMMENT '板块样式 0--默认样式 1--样式一 2--样式二 。。。'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页自定义版块';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_home_nav`
--

CREATE TABLE `hjmall_home_nav` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '图标名称',
  `url` varchar(2048) DEFAULT NULL,
  `open_type` varchar(255) NOT NULL DEFAULT '' COMMENT '打开方式',
  `pic_url` varchar(2048) DEFAULT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序，升序',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `is_hide` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏 0 显示 1隐藏 '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页导航图标';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_integral_cat`
--

CREATE TABLE `hjmall_integral_cat` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `is_delete` int(11) NOT NULL,
  `addtime` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '商品名称',
  `pic_url` longtext NOT NULL COMMENT '分类图片url',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序，升序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_integral_coupon_order`
--

CREATE TABLE `hjmall_integral_coupon_order` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `coupon_id` int(11) NOT NULL COMMENT '优惠券ID',
  `order_no` varchar(255) NOT NULL COMMENT '订单号',
  `is_pay` int(11) NOT NULL COMMENT '是否支付  0-未支付   1-支付 纯积分兑换',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT '积分数量',
  `addtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_integral_goods`
--

CREATE TABLE `hjmall_integral_goods` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '售价',
  `original_price` decimal(10,2) NOT NULL COMMENT '原价（只做显示用）',
  `detail` longtext NOT NULL COMMENT '商品详情，图文',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品类别',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '上架状态：0=下架，1=上架',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `attr` longtext NOT NULL COMMENT '规格的库存及价格',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序  升序',
  `virtual_sales` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟销量',
  `cover_pic` longtext COMMENT '商品缩略图',
  `unit` varchar(255) NOT NULL DEFAULT '件' COMMENT '单位',
  `weight` double(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '重量',
  `freight` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  `use_attr` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否使用规格：0=不使用，1=使用',
  `goods_num` int(11) NOT NULL DEFAULT '0' COMMENT '商品总库存',
  `integral` int(11) NOT NULL COMMENT '所需积分',
  `service` varchar(2000) NOT NULL DEFAULT '' COMMENT '商品服务选项',
  `cost_price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `goods_pic_list` longtext,
  `is_index` smallint(1) NOT NULL DEFAULT '0' COMMENT '放置首页：0=不放，1=放',
  `user_num` int(11) NOT NULL COMMENT '每人限制兑换数量'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_integral_log`
--

CREATE TABLE `hjmall_integral_log` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `content` longtext NOT NULL COMMENT '描述',
  `integral` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '积分',
  `addtime` int(11) UNSIGNED NOT NULL COMMENT '添加时间',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `operator` varchar(255) NOT NULL COMMENT '操作者',
  `store_id` int(11) UNSIGNED NOT NULL,
  `operator_id` int(11) UNSIGNED NOT NULL COMMENT '分销商id',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '数据类型 0--积分修改 1--余额修改',
  `pic_url` varchar(255) NOT NULL DEFAULT '',
  `explain` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_integral_order`
--

CREATE TABLE `hjmall_integral_order` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `order_no` varchar(255) NOT NULL COMMENT '订单号',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总费用(包含运费）',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付总费用(含运费）',
  `express_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `name` varchar(255) NOT NULL DEFAULT '0' COMMENT '收货人姓名',
  `mobile` varchar(255) NOT NULL DEFAULT '0' COMMENT '收货人手机',
  `address` varchar(1000) NOT NULL DEFAULT '0' COMMENT '收货地址',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '订单备注',
  `is_pay` smallint(6) NOT NULL DEFAULT '0' COMMENT '支付状态：0=未支付，1=已支付',
  `pay_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '支付方式：0--在线支付未支付 1=支付 ',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `is_send` smallint(1) NOT NULL DEFAULT '0' COMMENT '发货状态：0=未发货，1=已发货',
  `send_time` int(11) NOT NULL DEFAULT '0' COMMENT '发货时间',
  `express` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司',
  `express_no` varchar(255) NOT NULL DEFAULT '',
  `is_confirm` smallint(1) NOT NULL DEFAULT '0' COMMENT '确认收货状态：0=未确认，1=已确认收货',
  `confirm_time` int(11) NOT NULL DEFAULT '0' COMMENT '确认收货时间',
  `is_comment` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已评价：0=未评价，1=已评价',
  `apply_delete` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否申请取消订单：0=否，1=申请取消订单',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `address_data` longtext COMMENT '收货地址信息，json格式',
  `is_offline` int(11) NOT NULL DEFAULT '0' COMMENT '是否到店自提 1--否 2--是',
  `clerk_id` int(11) NOT NULL DEFAULT '-1' COMMENT '核销员user_id',
  `is_cancel` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否取消',
  `offline_qrcode` longtext COMMENT '核销码',
  `shop_id` int(11) NOT NULL DEFAULT '-1' COMMENT '自提门店ID',
  `is_sale` int(11) NOT NULL DEFAULT '0' COMMENT '是否超过售后时间',
  `version` varchar(255) NOT NULL DEFAULT '0' COMMENT '版本',
  `mch_id` int(11) NOT NULL DEFAULT '0' COMMENT '入驻商户id',
  `integral` int(11) NOT NULL COMMENT '花费的积分',
  `goods_id` int(11) NOT NULL,
  `words` longtext COMMENT '商家留言',
  `is_recycle` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否加入回收站 0--不加入 1--加入',
  `is_show` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否显示 0--不显示 1--显示（软删除）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_integral_order_detail`
--

CREATE TABLE `hjmall_integral_order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '此商品的总价',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `attr` longtext NOT NULL COMMENT '商品规格',
  `pic` varchar(255) NOT NULL COMMENT '商品规格图片',
  `pay_integral` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '积分花费',
  `goods_name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_integral_setting`
--

CREATE TABLE `hjmall_integral_setting` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `integral_shuoming` longtext NOT NULL COMMENT '积分说明',
  `register_rule` longtext NOT NULL COMMENT '签到规则',
  `register_integral` int(11) NOT NULL COMMENT '每日签到获得分数',
  `register_continuation` int(11) NOT NULL COMMENT '连续签到天数',
  `register_reward` varchar(255) NOT NULL COMMENT '连续签到奖励'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_in_order_comment`
--

CREATE TABLE `hjmall_in_order_comment` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` decimal(10,1) NOT NULL COMMENT '评分：1=差评，2=中评，3=好',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '评价内容',
  `pic_list` longtext COMMENT '图片',
  `is_hide` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否隐藏：0=不隐藏，1=隐藏',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `reply_content` varchar(255) NOT NULL DEFAULT '0',
  `is_virtual` smallint(6) NOT NULL DEFAULT '0',
  `virtual_user` varchar(255) NOT NULL DEFAULT '0',
  `virtual_avatar` varchar(255) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_level`
--

CREATE TABLE `hjmall_level` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '等级名称',
  `money` decimal(10,2) DEFAULT NULL COMMENT '会员完成订单金额满足则升级',
  `discount` decimal(10,1) DEFAULT NULL COMMENT '折扣',
  `status` int(11) DEFAULT NULL COMMENT '状态 0--禁用 1--启用',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `image` longtext COMMENT '会员图片',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '会员价格',
  `detail` varchar(255) DEFAULT '' COMMENT '会员介绍',
  `buy_prompt` varchar(255) DEFAULT '' COMMENT '购买之前提示',
  `synopsis` longtext COMMENT '会员权益(禁用)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员等级';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_level_order`
--

CREATE TABLE `hjmall_level_order` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL COMMENT '订单号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `pay_price` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `pay_type` int(11) DEFAULT '0' COMMENT '支付方式 1--微信支付',
  `is_pay` int(11) DEFAULT '0' COMMENT '是否支付 0--未支付 1--支付',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `current_level` int(11) DEFAULT NULL,
  `after_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_lottery_goods`
--

CREATE TABLE `hjmall_lottery_goods` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `attr` longtext NOT NULL COMMENT '规格',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '是否关闭',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0未完成 1已完成'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_lottery_log`
--

CREATE TABLE `hjmall_lottery_log` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `lottery_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0待开奖 1未中奖 2中奖3已领取',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `attr` longtext NOT NULL,
  `raffle_time` int(11) NOT NULL DEFAULT '0' COMMENT '领取时间',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `obtain_time` int(11) DEFAULT '0',
  `form_id` varchar(255) NOT NULL DEFAULT '',
  `child_id` int(11) NOT NULL DEFAULT '0' COMMENT '下级用户',
  `lucky_code` varchar(255) NOT NULL DEFAULT '' COMMENT '幸运码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_lottery_reserve`
--

CREATE TABLE `hjmall_lottery_reserve` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `lottery_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_lottery_setting`
--

CREATE TABLE `hjmall_lottery_setting` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `rule` varchar(2000) NOT NULL DEFAULT '' COMMENT '规则',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '小程序标题',
  `type` int(10) DEFAULT '0' COMMENT '0不强制 1强制'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_mail_setting`
--

CREATE TABLE `hjmall_mail_setting` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `send_mail` longtext COMMENT '发件人邮箱',
  `send_pwd` varchar(255) DEFAULT NULL COMMENT '授权码',
  `send_name` varchar(255) DEFAULT NULL COMMENT '发件人名称',
  `receive_mail` longtext COMMENT '收件人邮箱 多个用英文逗号隔开',
  `status` int(11) DEFAULT NULL COMMENT '是否开启邮件通知 0--关闭 1--开启',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_mch`
--

CREATE TABLE `hjmall_mch` (
  `id` int(10) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `is_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否营业：0=否，1=是',
  `is_lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被系统关闭：0=否，1=是',
  `review_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态：0=待审核，1=审核通过，2=审核不通过',
  `review_result` longtext COMMENT '审核结果',
  `review_time` int(11) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `realname` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `province_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `address` varchar(1000) NOT NULL,
  `mch_common_cat_id` int(11) NOT NULL COMMENT '所售类目',
  `service_tel` varchar(1000) NOT NULL COMMENT '客服电话',
  `logo` longtext COMMENT 'logo',
  `header_bg` longtext COMMENT '背景图',
  `transfer_rate` int(11) NOT NULL DEFAULT '0' COMMENT '商户手续费',
  `account_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '商户余额',
  `sort` int(11) NOT NULL DEFAULT '1000' COMMENT '排序：升序',
  `wechat_name` varchar(255) DEFAULT '' COMMENT '微信号',
  `is_recommend` int(11) NOT NULL DEFAULT '1' COMMENT '好店推荐：0.不推荐|1.推荐',
  `longitude` varchar(255) NOT NULL DEFAULT '0' COMMENT '经度',
  `latitude` varchar(255) NOT NULL DEFAULT '0' COMMENT '纬度',
  `main_content` varchar(255) NOT NULL DEFAULT '' COMMENT '主营范围',
  `summary` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_mch_account_log`
--

CREATE TABLE `hjmall_mch_account_log` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL COMMENT '金额',
  `type` smallint(6) NOT NULL COMMENT '类型：1=收入，2=支出',
  `desc` longtext,
  `addtime` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入驻商户账户收支记录';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_mch_cash`
--

CREATE TABLE `hjmall_mch_cash` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `money` decimal(10,2) NOT NULL,
  `order_no` varchar(255) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '提现状态：0=待处理，1=已转账，2=已拒绝',
  `addtime` int(11) NOT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0' COMMENT '提现类型 0--微信自动打款 1--微信线下打款 2--支付宝线下打款 3--银行卡线下打款 4--充值到余额',
  `type_data` varchar(255) NOT NULL DEFAULT '' COMMENT '不同提现类型，提交的数据',
  `virtual_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '实际上打款方式'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户提现记录';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_mch_cat`
--

CREATE TABLE `hjmall_mch_cat` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  `icon` longtext COMMENT '分类图标',
  `sort` int(11) NOT NULL DEFAULT '1000',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入驻商商品分类';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_mch_common_cat`
--

CREATE TABLE `hjmall_mch_common_cat` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort` int(11) NOT NULL DEFAULT '1000' COMMENT '排序，升序',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入驻商类目';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_mch_goods_cat`
--

CREATE TABLE `hjmall_mch_goods_cat` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入驻商商品分类关系';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_mch_option`
--

CREATE TABLE `hjmall_mch_option` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_mch_plugin`
--

CREATE TABLE `hjmall_mch_plugin` (
  `id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `is_share` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否开启分销 0--不开启 1--开启'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户权限表';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_mch_postage_rules`
--

CREATE TABLE `hjmall_mch_postage_rules` (
  `id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `express_id` int(11) NOT NULL COMMENT '物流公司',
  `detail` longtext NOT NULL COMMENT '规则详细',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_enable` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否启用：0=否，1=是',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `express` varchar(255) NOT NULL DEFAULT '' COMMENT '快递公司',
  `type` smallint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '计费方式【1=>按重计费、2=>按件计费】'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入驻商运费规则';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_mch_setting`
--

CREATE TABLE `hjmall_mch_setting` (
  `id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL DEFAULT '0',
  `is_share` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否开启分销 0--不开启 1--开启'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商户设置';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_mch_visit_log`
--

CREATE TABLE `hjmall_mch_visit_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `mch_id` int(11) NOT NULL,
  `addtime` int(11) NOT NULL,
  `visit_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺浏览记录';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_miaosha`
--

CREATE TABLE `hjmall_miaosha` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `open_time` longtext COMMENT '开放时间，JSON格式'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_miaosha_goods`
--

CREATE TABLE `hjmall_miaosha_goods` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `start_time` smallint(6) NOT NULL COMMENT '开始时间：0~23',
  `open_date` date NOT NULL COMMENT '开放日期，例：2017-08-21',
  `attr` longtext NOT NULL COMMENT '规格秒杀价数量',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `buy_max` int(11) NOT NULL DEFAULT '0' COMMENT '限购数量，0=不限购',
  `buy_limit` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '限单',
  `is_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否享受会员折扣 0-不享受 1--享受'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_ms_goods`
--

CREATE TABLE `hjmall_ms_goods` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `original_price` decimal(10,2) UNSIGNED NOT NULL COMMENT '原价',
  `detail` longtext NOT NULL COMMENT '商品详情，图文',
  `status` smallint(6) UNSIGNED NOT NULL DEFAULT '2' COMMENT '上架状态【1=> 上架，2=> 下架】',
  `service` varchar(2000) DEFAULT NULL COMMENT '服务选项',
  `sort` int(11) UNSIGNED DEFAULT '0' COMMENT '商品排序 升序',
  `virtual_sales` int(11) UNSIGNED DEFAULT '0' COMMENT '虚拟销量',
  `cover_pic` longtext COMMENT '商品缩略图',
  `addtime` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_delete` smallint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否删除',
  `sales` int(11) UNSIGNED DEFAULT NULL COMMENT '实际销量',
  `store_id` int(11) UNSIGNED NOT NULL,
  `video_url` varchar(2048) DEFAULT NULL,
  `unit` varchar(255) NOT NULL DEFAULT '件' COMMENT '单位',
  `weight` double(10,2) UNSIGNED DEFAULT '0.00' COMMENT '重量',
  `freight` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  `full_cut` longtext COMMENT '满减',
  `integral` text COMMENT '积分设置',
  `use_attr` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否使用规格：0=不使用，1=使用',
  `attr` longtext NOT NULL COMMENT '规格的库存及价格',
  `is_discount` smallint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否支持会员折扣',
  `coupon` smallint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否支持优惠劵',
  `payment` varchar(255) DEFAULT '' COMMENT '支付方式',
  `individual_share` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否单独分销设置：0=否，1=是',
  `share_commission_first` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '一级分销佣金比例',
  `share_commission_second` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '二级分销佣金比例',
  `share_commission_third` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '三级分销佣金比例',
  `share_type` int(11) DEFAULT '0' COMMENT '佣金配比 0--百分比 1--固定金额',
  `rebate` decimal(10,2) DEFAULT '0.00' COMMENT '自购返利',
  `attr_setting_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '分销设置类型 0.普通设置|1.详细设置'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_ms_goods_pic`
--

CREATE TABLE `hjmall_ms_goods_pic` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `pic_url` varchar(2048) DEFAULT NULL,
  `is_delete` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_ms_order`
--

CREATE TABLE `hjmall_ms_order` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `order_no` varchar(255) NOT NULL COMMENT '订单号',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总费用(包含运费）',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付总费用(含运费）',
  `express_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `name` varchar(255) DEFAULT NULL COMMENT '收货人姓名',
  `mobile` varchar(255) DEFAULT NULL COMMENT '收货人手机',
  `address` varchar(1000) DEFAULT NULL COMMENT '收货地址',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '订单备注',
  `is_pay` smallint(6) NOT NULL DEFAULT '0' COMMENT '支付状态：0=未支付，1=已支付',
  `pay_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '支付方式：1=微信支付 2--货到付款',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `is_send` smallint(1) NOT NULL DEFAULT '0' COMMENT '发货状态：0=未发货，1=已发货',
  `send_time` int(11) NOT NULL DEFAULT '0' COMMENT '发货时间',
  `express` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司',
  `express_no` varchar(255) NOT NULL DEFAULT '',
  `is_confirm` smallint(1) NOT NULL DEFAULT '0' COMMENT '确认收货状态：0=未确认，1=已确认收货',
  `confirm_time` int(11) NOT NULL DEFAULT '0' COMMENT '确认收货时间',
  `is_comment` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已评价：0=未评价，1=已评价',
  `apply_delete` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否申请取消订单：0=否，1=申请取消订单',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `is_price` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否发放佣金',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户上级ID',
  `first_price` decimal(10,2) NOT NULL COMMENT '一级佣金',
  `second_price` decimal(10,2) NOT NULL COMMENT '二级佣金',
  `third_price` decimal(10,2) NOT NULL COMMENT '三级佣金',
  `coupon_sub_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券抵消金额',
  `address_data` longtext COMMENT '收货地址信息，json格式',
  `content` longtext,
  `is_offline` int(11) NOT NULL DEFAULT '0' COMMENT '是否到店自提 0--否 1--是',
  `clerk_id` int(11) DEFAULT NULL COMMENT '核销员user_id',
  `is_cancel` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否取消',
  `offline_qrcode` longtext COMMENT '核销码',
  `before_update_price` decimal(10,2) DEFAULT NULL COMMENT '修改前的价格',
  `shop_id` int(11) DEFAULT NULL COMMENT '自提门店ID',
  `discount` decimal(11,2) DEFAULT NULL COMMENT '会员折扣',
  `user_coupon_id` int(11) DEFAULT NULL COMMENT '使用的优惠券ID',
  `integral` longtext COMMENT '积分使用',
  `give_integral` smallint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否发放积分【1=> 已发放 ， 0=> 未发放】',
  `parent_id_1` int(11) DEFAULT NULL COMMENT '用户上二级ID',
  `parent_id_2` int(11) DEFAULT NULL COMMENT '用户上三级ID',
  `is_sale` int(11) DEFAULT '0' COMMENT '是否超过售后时间',
  `words` longtext COMMENT '商家留言',
  `express_price_1` decimal(10,2) DEFAULT NULL COMMENT '减免的运费',
  `goods_id` int(11) NOT NULL,
  `attr` longtext NOT NULL COMMENT '商品规格',
  `pic` varchar(255) NOT NULL COMMENT '商品规格图片',
  `integral_amount` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '单品积分获得',
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `limit_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '可支付截止时间',
  `is_sum` smallint(1) DEFAULT '0' COMMENT '是否计算分销 0--不计算 1--计算',
  `rebate` decimal(10,2) DEFAULT '0.00' COMMENT '自购返利',
  `before_update_express` decimal(10,2) DEFAULT '0.00' COMMENT '价格修改前的运费',
  `is_recycle` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否在回收站 0--不在回收站 1--在回收站',
  `is_show` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否显示 0--不显示 1--显示（软删除用）',
  `seller_comments` mediumtext COMMENT '商家备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_ms_order_comment`
--

CREATE TABLE `hjmall_ms_order_comment` (
  `id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` decimal(10,1) NOT NULL COMMENT '评分：1=差评，2=中评，3=好',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '评价内容',
  `pic_list` longtext COMMENT '图片',
  `is_hide` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否隐藏：0=不隐藏，1=隐藏',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='秒杀订单评价表';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_ms_order_refund`
--

CREATE TABLE `hjmall_ms_order_refund` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_refund_no` varchar(255) NOT NULL DEFAULT '' COMMENT '退款单号',
  `type` smallint(6) NOT NULL DEFAULT '1' COMMENT '售后类型：1=退货退款，2=换货',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '退款说明',
  `pic_list` longtext COMMENT '凭证图片列表：json格式',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '状态：0=待商家处理，1=同意并已退款，2=已同意换货，3=已拒绝退换货',
  `refuse_desc` varchar(500) NOT NULL DEFAULT '' COMMENT '拒绝退换货原因',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `response_time` int(11) NOT NULL DEFAULT '0' COMMENT '商家处理时间',
  `is_agree` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已同意退、换货：0=待处理，1=已同意，2=已拒绝',
  `is_user_send` smallint(1) NOT NULL DEFAULT '0' COMMENT '用户已发货：0=未发货，1=已发货',
  `user_send_express` varchar(32) NOT NULL DEFAULT '' COMMENT '用户发货快递公司',
  `user_send_express_no` varchar(32) NOT NULL DEFAULT '' COMMENT '用户发货快递单号',
  `address_id` int(11) DEFAULT '0' COMMENT '退货 换货地址id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_ms_setting`
--

CREATE TABLE `hjmall_ms_setting` (
  `store_id` int(11) UNSIGNED NOT NULL,
  `unpaid` int(2) UNSIGNED NOT NULL DEFAULT '1' COMMENT '未付款自动取消时间',
  `is_share` int(11) DEFAULT '0' COMMENT '是否开启分销 0--关闭 1--开启',
  `is_sms` int(11) DEFAULT '0' COMMENT '是否开启短信通知',
  `is_print` int(11) DEFAULT '0' COMMENT '是否开启订单打印',
  `is_mail` int(11) DEFAULT '0' COMMENT '是否开启邮件通知',
  `is_area` tinyint(1) DEFAULT NULL COMMENT '区域限制  1-开启 0-关闭'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_option`
--

CREATE TABLE `hjmall_option` (
  `id` bigint(20) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `hjmall_option`
--

INSERT INTO `hjmall_option` (`id`, `store_id`, `group`, `name`, `value`) VALUES
(1, 0, '', 'VERSION', '版本号');

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_order`
--

CREATE TABLE `hjmall_order` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `order_no` varchar(255) NOT NULL COMMENT '订单号',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总费用(包含运费）',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付总费用(含运费）',
  `express_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `name` varchar(255) DEFAULT NULL COMMENT '收货人姓名',
  `mobile` varchar(255) DEFAULT NULL COMMENT '收货人手机',
  `address` varchar(1000) DEFAULT NULL COMMENT '收货地址',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '订单备注',
  `is_pay` smallint(6) NOT NULL DEFAULT '0' COMMENT '支付状态：0=未支付，1=已支付',
  `pay_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '支付方式：1=微信支付',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `is_send` smallint(1) NOT NULL DEFAULT '0' COMMENT '发货状态：0=未发货，1=已发货',
  `send_time` int(11) NOT NULL DEFAULT '0' COMMENT '发货时间',
  `express` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司',
  `express_no` varchar(255) NOT NULL DEFAULT '',
  `is_confirm` smallint(1) NOT NULL DEFAULT '0' COMMENT '确认收货状态：0=未确认，1=已确认收货',
  `confirm_time` int(11) NOT NULL DEFAULT '0' COMMENT '确认收货时间',
  `is_comment` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已评价：0=未评价，1=已评价',
  `apply_delete` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否申请取消订单：0=否，1=申请取消订单',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `is_price` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否发放佣金',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户上级ID',
  `first_price` decimal(10,2) NOT NULL COMMENT '一级佣金',
  `second_price` decimal(10,2) NOT NULL COMMENT '二级佣金',
  `third_price` decimal(10,2) NOT NULL COMMENT '三级佣金',
  `coupon_sub_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠券抵消金额',
  `content` longtext,
  `is_offline` int(11) NOT NULL DEFAULT '0' COMMENT '是否到店自提 0--否 1--是',
  `clerk_id` int(11) DEFAULT NULL COMMENT '核销员user_id',
  `address_data` longtext COMMENT '收货地址信息，json格式',
  `is_cancel` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否取消',
  `offline_qrcode` longtext COMMENT '核销码',
  `before_update_price` decimal(10,2) DEFAULT NULL COMMENT '修改前的价格',
  `shop_id` int(11) DEFAULT NULL COMMENT '自提门店ID',
  `discount` decimal(11,2) DEFAULT NULL COMMENT '会员折扣',
  `user_coupon_id` int(11) DEFAULT NULL COMMENT '使用的优惠券ID',
  `integral` longtext COMMENT '积分使用',
  `give_integral` smallint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否发放积分【1=> 已发放 ， 0=> 未发放】',
  `parent_id_1` int(11) DEFAULT '0' COMMENT '用户上二级ID',
  `parent_id_2` int(11) DEFAULT '0' COMMENT '用户上三级ID',
  `is_sale` int(11) DEFAULT '0' COMMENT '是否超过售后时间',
  `words` longtext COMMENT '商家留言',
  `version` varchar(255) DEFAULT NULL COMMENT '版本',
  `express_price_1` decimal(10,2) DEFAULT NULL COMMENT '减免的运费',
  `is_recycle` smallint(1) DEFAULT '0',
  `rebate` decimal(10,2) DEFAULT '0.00' COMMENT '自购返利',
  `before_update_express` decimal(10,2) DEFAULT '0.00' COMMENT '价格修改前的运费',
  `seller_comments` text COMMENT '商家备注',
  `mch_id` int(11) NOT NULL DEFAULT '0' COMMENT '入驻商户id',
  `order_union_id` int(11) NOT NULL DEFAULT '0' COMMENT '合并订单的id',
  `is_transfer` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已转入商户账户：0=否，1=是',
  `type` int(11) DEFAULT '0' COMMENT '0:普通订单 1大转盘订单',
  `share_price` decimal(11,2) DEFAULT '0.00' COMMENT '发放佣金的金额',
  `is_show` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否显示 0--不显示 1--显示',
  `currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '货币：活力币'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_order_comment`
--

CREATE TABLE `hjmall_order_comment` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` decimal(10,1) NOT NULL COMMENT '评分：1=差评，2=中评，3=好',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '评价内容',
  `pic_list` longtext COMMENT '图片',
  `is_hide` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否隐藏：0=不隐藏，1=隐藏',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `reply_content` varchar(255) DEFAULT NULL,
  `is_virtual` smallint(6) DEFAULT NULL,
  `virtual_user` varchar(255) DEFAULT NULL,
  `virtual_avatar` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单评价';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_order_detail`
--

CREATE TABLE `hjmall_order_detail` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '此商品的总价',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `attr` longtext NOT NULL COMMENT '商品规格',
  `pic` varchar(255) NOT NULL COMMENT '商品规格图片',
  `integral` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '单品积分获得',
  `is_level` smallint(6) NOT NULL DEFAULT '1' COMMENT '是否使用会员折扣 0--不适用 1--使用'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单明细';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_order_express`
--

CREATE TABLE `hjmall_order_express` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `order_type` int(11) DEFAULT NULL COMMENT '订单类型 0--商城订单 1--秒杀订单 2--拼团订单 ',
  `express_code` varchar(255) DEFAULT NULL COMMENT '快递公司编码',
  `EBusinessID` varchar(255) DEFAULT NULL COMMENT '快递鸟id',
  `order` longtext,
  `printTeplate` longtext,
  `is_delete` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单电子面单记录';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_order_form`
--

CREATE TABLE `hjmall_order_form` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL COMMENT '表单key',
  `value` varchar(255) DEFAULT NULL COMMENT '表单value',
  `is_delete` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '表单信息类型'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单自定义表单信息';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_order_message`
--

CREATE TABLE `hjmall_order_message` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL COMMENT '类型id 系统消息时为0',
  `is_read` int(11) DEFAULT NULL COMMENT '消息是否已读 0--未读 1--已读',
  `is_sound` int(11) DEFAULT NULL COMMENT '是否提示 0--未提示  1--已提示',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `type` smallint(1) DEFAULT '0' COMMENT '订单类型  0--已下订单   1--售后订单',
  `order_type` int(11) DEFAULT '0' COMMENT '订单类型 0--商城订单 1--秒杀订单 2--拼团订单 3--预约订单'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_order_refund`
--

CREATE TABLE `hjmall_order_refund` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `order_refund_no` varchar(255) NOT NULL DEFAULT '' COMMENT '退款单号',
  `type` smallint(6) NOT NULL DEFAULT '1' COMMENT '售后类型：1=退货退款，2=换货',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '退款说明',
  `pic_list` longtext COMMENT '凭证图片列表：json格式',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '状态：0=待商家处理，1=同意并已退款，2=已同意换货，3=已拒绝退换货',
  `refuse_desc` varchar(500) NOT NULL DEFAULT '' COMMENT '拒绝退换货原因',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `response_time` int(11) NOT NULL DEFAULT '0' COMMENT '商家处理时间',
  `is_agree` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已同意退、换货：0=待处理，1=已同意，2=已拒绝',
  `is_user_send` smallint(1) NOT NULL DEFAULT '0' COMMENT '用户已发货：0=未发货，1=已发货',
  `user_send_express` varchar(32) NOT NULL DEFAULT '' COMMENT '用户发货快递公司',
  `user_send_express_no` varchar(32) NOT NULL DEFAULT '' COMMENT '用户发货快递单号',
  `address_id` int(11) DEFAULT '0' COMMENT '退货 换货地址id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='售后订单';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_order_share`
--

CREATE TABLE `hjmall_order_share` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT '0' COMMENT '类型 0--拼团 1--预约',
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `parent_id_1` int(11) DEFAULT '0' COMMENT '一级分销商id',
  `parent_id_2` int(11) DEFAULT '0' COMMENT '二级分销商id',
  `parent_id_3` int(11) DEFAULT '0' COMMENT '三级分销商id',
  `first_price` decimal(10,2) DEFAULT '0.00' COMMENT '一级分销佣金',
  `second_price` decimal(10,2) DEFAULT '0.00' COMMENT '二级分销佣金',
  `third_price` decimal(10,2) DEFAULT '0.00' COMMENT '三级分销佣金',
  `is_delete` int(11) DEFAULT '0',
  `version` varchar(255) DEFAULT '0',
  `rebate` decimal(10,2) DEFAULT '0.00' COMMENT '自购返利',
  `user_id` int(11) DEFAULT '0' COMMENT '下单用户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单分销数据';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_order_union`
--

CREATE TABLE `hjmall_order_union` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_no` varchar(255) NOT NULL COMMENT '支付单号',
  `order_id_list` longtext NOT NULL COMMENT '订单id列表',
  `price` decimal(10,2) NOT NULL COMMENT '支付金额',
  `is_pay` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已付款0=未付款，1=已付款',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单合并支付';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_pic`
--

CREATE TABLE `hjmall_pic` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '0 步数海报',
  `type` int(11) NOT NULL,
  `pic_url` varchar(2048) DEFAULT '',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_plugin`
--

CREATE TABLE `hjmall_plugin` (
  `id` int(11) NOT NULL,
  `data` longtext NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `display_name` varchar(255) NOT NULL DEFAULT '',
  `route` varchar(255) NOT NULL DEFAULT '',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_pond`
--

CREATE TABLE `hjmall_pond` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1.红包2.优惠卷3.积分4.实物.5.无',
  `num` int(11) DEFAULT '0' COMMENT '积分数量',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '红包价格',
  `image_url` varchar(255) DEFAULT '' COMMENT '图片',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `orderby` int(11) DEFAULT '0' COMMENT '排序',
  `coupon_id` int(11) DEFAULT '0' COMMENT '优惠卷',
  `gift_id` int(11) DEFAULT '0' COMMENT '赠品',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `attr` varchar(255) DEFAULT '' COMMENT '规格',
  `name` varchar(255) DEFAULT '' COMMENT '别名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_pond_log`
--

CREATE TABLE `hjmall_pond_log` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `pond_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT ' 0未领取1 已领取',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `raffle_time` int(11) DEFAULT '0' COMMENT '领取时间',
  `type` int(11) NOT NULL DEFAULT '0',
  `num` int(11) DEFAULT '0',
  `gift_id` int(11) DEFAULT '0',
  `coupon_id` int(11) DEFAULT '0',
  `price` decimal(10,2) DEFAULT '0.00',
  `attr` varchar(255) DEFAULT '',
  `order_id` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_pond_setting`
--

CREATE TABLE `hjmall_pond_setting` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `probability` int(11) NOT NULL DEFAULT '0' COMMENT '概率',
  `oppty` int(11) NOT NULL DEFAULT '0' COMMENT '抽奖次数',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1.天 2 用户',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `title` varchar(255) DEFAULT '' COMMENT '小程序标题',
  `rule` varchar(1000) DEFAULT '' COMMENT '规则',
  `deplete_register` int(11) DEFAULT '0' COMMENT '消耗积分'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_postage_rules`
--

CREATE TABLE `hjmall_postage_rules` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `express_id` int(11) NOT NULL COMMENT '物流公司',
  `detail` longtext NOT NULL COMMENT '规则详细',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_enable` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否启用：0=否，1=是',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `express` varchar(255) NOT NULL DEFAULT '' COMMENT '快递公司',
  `type` smallint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '计费方式【1=>按重计费、2=>按件计费】'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运费规则';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_printer`
--

CREATE TABLE `hjmall_printer` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '打印机名称',
  `printer_type` varchar(255) DEFAULT NULL COMMENT '打印机类型',
  `printer_setting` longtext COMMENT '打印机设置',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小票打印机';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_printer_setting`
--

CREATE TABLE `hjmall_printer_setting` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `printer_id` int(11) DEFAULT NULL COMMENT '打印机ID',
  `block_id` int(11) DEFAULT NULL COMMENT '打印模板ID',
  `type` longtext COMMENT '打印方式 ',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `is_attr` int(11) DEFAULT '0' COMMENT '是否打印规格 0--不打印 1--打印',
  `big` int(11) DEFAULT '1' COMMENT '发大倍数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='打印设置';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_pt_cat`
--

CREATE TABLE `hjmall_pt_cat` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '标题名称',
  `store_id` int(11) UNSIGNED NOT NULL COMMENT '商城ID',
  `pic_url` varchar(2048) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序 升序',
  `addtime` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `is_delete` smallint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_pt_goods`
--

CREATE TABLE `hjmall_pt_goods` (
  `id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `original_price` decimal(10,2) UNSIGNED NOT NULL COMMENT '商品原价',
  `price` decimal(10,2) UNSIGNED NOT NULL COMMENT '团购价',
  `detail` longtext NOT NULL COMMENT '商品详情，图文',
  `cat_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品分类',
  `status` smallint(6) UNSIGNED NOT NULL DEFAULT '2' COMMENT '上架状态【1=> 上架，2=> 下架】',
  `grouptime` int(11) NOT NULL DEFAULT '0' COMMENT '拼团时间/小时',
  `attr` longtext NOT NULL COMMENT '规格的库存及价格',
  `service` varchar(2000) DEFAULT '' COMMENT '服务选项',
  `sort` int(11) UNSIGNED DEFAULT '0' COMMENT '商品排序 升序',
  `virtual_sales` int(11) UNSIGNED DEFAULT '0' COMMENT '虚拟销量',
  `cover_pic` longtext COMMENT '商品缩略图',
  `weight` int(11) UNSIGNED DEFAULT '0' COMMENT '重量',
  `freight` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '运费模板ID',
  `unit` varchar(255) NOT NULL DEFAULT '件' COMMENT '单位',
  `addtime` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_delete` smallint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否删除',
  `group_num` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '商品成团数',
  `is_hot` smallint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否热卖【0=>热卖1=>不是】',
  `limit_time` int(11) UNSIGNED DEFAULT NULL COMMENT '拼团限时',
  `is_only` smallint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否允许单独购买',
  `is_more` smallint(1) UNSIGNED DEFAULT '1' COMMENT '是否允许多件购买',
  `colonel` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '团长优惠',
  `buy_limit` int(11) UNSIGNED DEFAULT '0' COMMENT '限购数量',
  `type` int(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '商品类型【1=> 送货上门，2=> 到店自提，3=> 全部支持】',
  `use_attr` smallint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否使用规格：0=不使用，1=使用',
  `one_buy_limit` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '单次限购数量',
  `payment` varchar(255) DEFAULT '' COMMENT '支付方式',
  `is_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否享受会员折扣 0-不享受 1--享受',
  `video_url` varchar(255) DEFAULT NULL COMMENT '视频url'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_pt_goods_detail`
--

CREATE TABLE `hjmall_pt_goods_detail` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `colonel` decimal(10,2) UNSIGNED DEFAULT '0.00' COMMENT '团长优惠',
  `group_num` int(11) UNSIGNED DEFAULT '0' COMMENT '商品成团数',
  `group_time` int(11) DEFAULT NULL COMMENT '拼团时间/小时',
  `attr` longtext COMMENT '规格的库存及价格',
  `is_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否享受会员折扣 0-不享受 1--享受'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_pt_goods_pic`
--

CREATE TABLE `hjmall_pt_goods_pic` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `pic_url` varchar(2048) DEFAULT NULL,
  `is_delete` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_pt_order`
--

CREATE TABLE `hjmall_pt_order` (
  `id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `order_no` varchar(255) NOT NULL COMMENT '订单号',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总费用(包含运费）',
  `pay_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '实际支付总费用(含运费）',
  `express_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '运费',
  `name` varchar(255) DEFAULT NULL COMMENT '收货人姓名',
  `mobile` varchar(255) DEFAULT NULL COMMENT '收货人手机',
  `address` varchar(1000) DEFAULT NULL COMMENT '收货地址',
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '订单备注',
  `is_pay` smallint(6) NOT NULL DEFAULT '0' COMMENT '支付状态：0=未支付，1=已支付',
  `pay_type` smallint(6) NOT NULL DEFAULT '0' COMMENT '支付方式：1=微信支付',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `is_send` smallint(1) NOT NULL DEFAULT '0' COMMENT '发货状态：0=未发货，1=已发货',
  `send_time` int(11) NOT NULL DEFAULT '0' COMMENT '发货时间',
  `express` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司',
  `express_no` varchar(255) NOT NULL DEFAULT '',
  `is_confirm` smallint(1) NOT NULL DEFAULT '0' COMMENT '确认收货状态：0=未确认，1=已确认收货',
  `confirm_time` int(11) NOT NULL DEFAULT '0' COMMENT '确认收货时间',
  `is_comment` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已评价：0=未评价，1=已评价',
  `apply_delete` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否申请取消订单：0=否，1=申请取消订单',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `address_data` longtext COMMENT '收货地址信息，json格式',
  `is_group` smallint(1) UNSIGNED NOT NULL COMMENT '是否团购',
  `parent_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '团ID【0=> 团长ID】',
  `colonel` decimal(10,2) DEFAULT '0.00' COMMENT '团长优惠',
  `is_success` smallint(1) UNSIGNED DEFAULT '0' COMMENT '是否成团',
  `success_time` int(11) UNSIGNED DEFAULT NULL COMMENT '成团时间',
  `status` smallint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '拼团状态【1=> 待付款，2= 拼团中，3=拼团成功，4=拼团失败】',
  `is_returnd` smallint(1) UNSIGNED DEFAULT '0' COMMENT '是否退款',
  `is_cancel` smallint(1) DEFAULT '0' COMMENT '是否取消',
  `limit_time` int(1) UNSIGNED DEFAULT NULL COMMENT '拼团限时',
  `content` longtext COMMENT '备注',
  `words` longtext COMMENT '商家留言',
  `shop_id` int(11) UNSIGNED DEFAULT '0' COMMENT '自提店铺',
  `offline` smallint(1) UNSIGNED DEFAULT '1' COMMENT '拿货方式',
  `clerk_id` int(11) UNSIGNED DEFAULT '0' COMMENT '核销员ID',
  `is_price` smallint(1) DEFAULT '0' COMMENT '是否发放佣金',
  `express_price_1` decimal(10,2) DEFAULT NULL COMMENT '减免的运费',
  `class_group` int(11) DEFAULT '0' COMMENT '阶级团',
  `is_recycle` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否加入回收站 0--不加入 1--加入',
  `is_show` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否显示 0--不显示 1--显示（软删除）',
  `seller_comments` mediumtext COMMENT '商家备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_pt_order_comment`
--

CREATE TABLE `hjmall_pt_order_comment` (
  `id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` decimal(10,1) NOT NULL COMMENT '评分：1=差评，2=中评，3=好',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '评价内容',
  `pic_list` longtext COMMENT '图片',
  `is_hide` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否隐藏：0=不隐藏，1=隐藏',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_virtual` smallint(6) DEFAULT '0',
  `virtual_user` varchar(255) DEFAULT '',
  `virtual_avatar` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_pt_order_detail`
--

CREATE TABLE `hjmall_pt_order_detail` (
  `id` int(11) UNSIGNED NOT NULL,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `num` int(11) NOT NULL DEFAULT '1' COMMENT '商品数量',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '此商品的总价',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `attr` longtext NOT NULL COMMENT '商品规格',
  `pic` varchar(255) NOT NULL COMMENT '商品规格图片'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_pt_order_refund`
--

CREATE TABLE `hjmall_pt_order_refund` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_detail_id` int(11) NOT NULL,
  `order_refund_no` varchar(255) NOT NULL DEFAULT '' COMMENT '退款单号',
  `type` smallint(6) NOT NULL DEFAULT '1' COMMENT '售后类型：1=退货退款，2=换货',
  `refund_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '退款金额',
  `desc` varchar(500) NOT NULL DEFAULT '' COMMENT '退款说明',
  `pic_list` longtext COMMENT '凭证图片列表：json格式',
  `status` smallint(1) NOT NULL DEFAULT '0' COMMENT '状态：0=待商家处理，1=同意并已退款，2=已同意换货，3=已拒绝退换货',
  `refuse_desc` varchar(500) NOT NULL DEFAULT '' COMMENT '拒绝退换货原因',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `response_time` int(11) NOT NULL DEFAULT '0' COMMENT '商家处理时间',
  `is_agree` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已同意退、换货：0=待处理，1=已同意，2=已拒绝',
  `is_user_send` smallint(1) NOT NULL DEFAULT '0' COMMENT '用户已发货：0=未发货，1=已发货',
  `user_send_express` varchar(32) NOT NULL DEFAULT '' COMMENT '用户发货快递公司',
  `user_send_express_no` varchar(32) NOT NULL DEFAULT '' COMMENT '用户发货快递单号',
  `address_id` int(11) DEFAULT '0' COMMENT '退货 换货地址id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='拼团订单售后表';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_pt_robot`
--

CREATE TABLE `hjmall_pt_robot` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '机器人名',
  `pic` varchar(255) NOT NULL COMMENT '头像',
  `is_delete` smallint(1) UNSIGNED DEFAULT NULL COMMENT '是否删除',
  `addtime` int(11) UNSIGNED DEFAULT NULL COMMENT '添加时间',
  `store_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='拼团机器人表';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_pt_setting`
--

CREATE TABLE `hjmall_pt_setting` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `is_share` int(11) DEFAULT '0' COMMENT '是否开启分销 0--关闭 1--开启',
  `is_sms` int(11) DEFAULT '0' COMMENT '是否开启短信通知',
  `is_print` int(11) DEFAULT '0' COMMENT '是否开启订单打印',
  `is_mail` int(11) DEFAULT '0' COMMENT '是否开启邮件通知',
  `is_area` tinyint(1) DEFAULT NULL COMMENT '区域限制  0--关闭 1--开启'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='拼团设置';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_qrcode`
--

CREATE TABLE `hjmall_qrcode` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `qrcode_bg` longtext NOT NULL COMMENT '背景图片',
  `avatar_size` varchar(255) NOT NULL COMMENT '头像大小{"w":"","h":""}',
  `avatar_position` varchar(255) NOT NULL COMMENT '头像坐标{"x":"","y":""}',
  `qrcode_size` varchar(255) NOT NULL COMMENT '二维码宽度',
  `qrcode_position` varchar(255) NOT NULL COMMENT '二维码坐标{"x":"","y":""}',
  `font_position` varchar(255) NOT NULL COMMENT '字体坐标{"x":"","y":""}',
  `font` longtext NOT NULL COMMENT '字体设置\r\n{\r\n  "size":大小,\r\n  "color":"r,g,b"\r\n}',
  `preview` longtext NOT NULL COMMENT '预览图',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='海报图的设置';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_recharge`
--

CREATE TABLE `hjmall_recharge` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `pay_price` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `send_price` decimal(10,2) DEFAULT '0.00' COMMENT '赠送金额',
  `name` varchar(255) DEFAULT NULL COMMENT '充值名称',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值管理';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_refund_address`
--

CREATE TABLE `hjmall_refund_address` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人地址',
  `mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人电话',
  `is_delete` smallint(6) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_register`
--

CREATE TABLE `hjmall_register` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `register_time` varchar(25) NOT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `continuation` int(11) NOT NULL COMMENT '连续签到天数',
  `integral` int(11) NOT NULL COMMENT '获得积分',
  `type` tinyint(1) NOT NULL DEFAULT '2' COMMENT '1--签到',
  `order_id` int(11) NOT NULL DEFAULT '-1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_re_order`
--

CREATE TABLE `hjmall_re_order` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `order_no` varchar(255) DEFAULT NULL COMMENT '订单号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户',
  `pay_price` decimal(10,2) DEFAULT NULL COMMENT '支付金额',
  `send_price` decimal(10,2) DEFAULT NULL COMMENT '赠送金额',
  `pay_type` int(11) DEFAULT '0' COMMENT '支付方式 1--微信支付',
  `is_pay` int(11) DEFAULT '0' COMMENT '是否支付 0--未支付 1--支付',
  `pay_time` int(11) DEFAULT NULL COMMENT '支付时间',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='充值记录';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_scratch`
--

CREATE TABLE `hjmall_scratch` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1.红包2.优惠卷3.积分4.实物',
  `num` int(11) DEFAULT '0' COMMENT '积分数量',
  `price` decimal(10,2) DEFAULT '0.00' COMMENT '红包价格',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存',
  `coupon_id` int(11) DEFAULT '0' COMMENT '优惠卷',
  `gift_id` int(11) DEFAULT '0' COMMENT '赠品',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `attr` varchar(255) DEFAULT '' COMMENT '规格',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0关闭 1开启',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '1删除'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_scratch_log`
--

CREATE TABLE `hjmall_scratch_log` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `pond_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT ' 0预领取 1 未领取 2 已领取',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `raffle_time` int(11) DEFAULT '0' COMMENT '领取时间',
  `type` int(11) NOT NULL DEFAULT '0',
  `num` int(11) DEFAULT '0',
  `gift_id` int(11) DEFAULT '0',
  `coupon_id` int(11) DEFAULT '0',
  `price` decimal(10,2) DEFAULT '0.00',
  `attr` varchar(255) DEFAULT '' COMMENT '规格',
  `order_id` int(11) DEFAULT '0' COMMENT '订单号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_scratch_setting`
--

CREATE TABLE `hjmall_scratch_setting` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `probability` int(11) NOT NULL DEFAULT '0' COMMENT '概率',
  `oppty` int(11) NOT NULL DEFAULT '0' COMMENT '抽奖次数',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '1.天 2 用户',
  `start_time` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `title` varchar(255) DEFAULT '' COMMENT '小程序标题',
  `rule` varchar(1000) DEFAULT '' COMMENT '规则说明',
  `deplete_register` int(11) DEFAULT '0' COMMENT '消耗积分'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_sender`
--

CREATE TABLE `hjmall_sender` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `post_code` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `exp_area` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `is_delete` smallint(2) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `delivery_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_session`
--

CREATE TABLE `hjmall_session` (
  `id` varchar(32) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` varchar(10240) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `hjmall_session`
--

INSERT INTO `hjmall_session` (`id`, `expire`, `data`) VALUES
('gfunv6n9e6u7l0hm0nvlmn57b7', 1567684078, '__flash|a:0:{}we7_user|a:3:{s:3:"uid";s:1:"1";s:4:"name";s:5:"admin";s:8:"username";s:5:"admin";}we7_account|a:2:{s:4:"acid";s:1:"2";s:4:"name";s:6:"测试";}__id|i:1;store_id|i:1;__is_admin|b:1;');

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_setting`
--

CREATE TABLE `hjmall_setting` (
  `id` int(11) NOT NULL,
  `first` decimal(10,2) NOT NULL DEFAULT '0.00',
  `second` decimal(10,2) NOT NULL DEFAULT '0.00',
  `third` decimal(10,2) NOT NULL DEFAULT '0.00',
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '商城id',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT '分销层级 0--不开启 1--一级分销 2--二级分销 3--三级分销',
  `condition` int(11) NOT NULL DEFAULT '0' COMMENT '成为下线条件 0--首次点击分享链接 1--首次下单 2--首次付款',
  `share_condition` int(11) NOT NULL DEFAULT '0' COMMENT '成为分销商的条件 \r\n0--无条件\r\n1--申请',
  `content` longtext COMMENT '分销佣金 的 用户须知',
  `pay_type` smallint(1) NOT NULL DEFAULT '0' COMMENT '提现方式 0--支付宝转账  1--微信企业支付',
  `min_money` decimal(10,2) NOT NULL DEFAULT '1.00' COMMENT '最小提现额度',
  `agree` longtext COMMENT '分销协议',
  `first_name` varchar(255) DEFAULT NULL,
  `second_name` varchar(255) DEFAULT NULL,
  `third_name` varchar(255) DEFAULT NULL,
  `pic_url_1` longtext,
  `pic_url_2` longtext,
  `price_type` int(11) DEFAULT '0' COMMENT '分销金额 0--百分比金额  1--固定金额',
  `bank` tinyint(4) DEFAULT NULL COMMENT '银行卡支付  0 --不使用  1--使用',
  `remaining_sum` tinyint(1) DEFAULT '0' COMMENT '余额提现 0=关闭 1=开启',
  `rebate` decimal(10,2) DEFAULT '0.00' COMMENT '自购返利',
  `is_rebate` int(11) DEFAULT '0' COMMENT '是否开启自购返利',
  `share_good_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '购买商品自动成为分销商：0.关闭 1.任意商品 2.指定商品',
  `share_good_id` int(11) NOT NULL DEFAULT '0' COMMENT '购买指定分销商品Id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分销商佣金设置';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_share`
--

CREATE TABLE `hjmall_share` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL COMMENT '审核状态 0--未审核 1--审核通过 2--审核不通过',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `store_id` int(11) NOT NULL,
  `seller_comments` text COMMENT '商家备注'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分销商';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_shop`
--

CREATE TABLE `hjmall_shop` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `is_delete` smallint(6) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `longitude` longtext,
  `latitude` longtext,
  `score` int(11) DEFAULT '5' COMMENT '评分 1~5',
  `cover_url` varchar(2048) DEFAULT NULL,
  `pic_url` varchar(2048) DEFAULT NULL,
  `shop_time` varchar(255) DEFAULT NULL COMMENT '营业时间',
  `content` longtext COMMENT '门店介绍',
  `is_default` int(11) DEFAULT '0' COMMENT '是否设为默认 0--否 1--是 （只能设置一个门店为默认门店）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店设置';

--
-- 转存表中的数据 `hjmall_shop`
--

INSERT INTO `hjmall_shop` (`id`, `store_id`, `name`, `mobile`, `address`, `is_delete`, `addtime`, `longitude`, `latitude`, `score`, `cover_url`, `pic_url`, `shop_time`, `content`, `is_default`) VALUES
(1, 1, 'cesss', '18910271624', '测试', 0, 1567563422, '3', '3', 5, '', '', '', '', 1);

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_shop_pic`
--

CREATE TABLE `hjmall_shop_pic` (
  `id` int(11) NOT NULL,
  `shop_id` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `pic_url` varchar(2048) DEFAULT NULL,
  `is_delete` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `hjmall_shop_pic`
--

INSERT INTO `hjmall_shop_pic` (`id`, `shop_id`, `store_id`, `pic_url`, `is_delete`) VALUES
(1, 1, 1, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_sms_record`
--

CREATE TABLE `hjmall_sms_record` (
  `id` int(11) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `tpl` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信发送记录';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_sms_setting`
--

CREATE TABLE `hjmall_sms_setting` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `AccessKeyId` varchar(255) DEFAULT NULL COMMENT '阿里云AccessKeyId',
  `AccessKeySecret` varchar(255) DEFAULT NULL COMMENT '阿里云AccessKeySecret',
  `name` varchar(255) DEFAULT NULL COMMENT '短信模板名称',
  `sign` varchar(255) DEFAULT NULL COMMENT '短信模板签名',
  `tpl` varchar(255) DEFAULT NULL COMMENT '短信模板code',
  `msg` varchar(255) DEFAULT NULL COMMENT '短信模板参数',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT '开启状态 0--关闭 1--开启',
  `mobile` varchar(255) DEFAULT NULL,
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `tpl_refund` longtext COMMENT '退款模板参数',
  `tpl_code` longtext COMMENT '验证码模板参数'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信设置';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_step_activity`
--

CREATE TABLE `hjmall_step_activity` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '活动标题',
  `currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '奖金池',
  `bail_currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '保证金',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0关闭 1开启',
  `step_num` int(11) NOT NULL DEFAULT '0' COMMENT '挑战布数',
  `open_date` date NOT NULL COMMENT '开放日期，例：2017-08-21',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0进行中 1 已完成',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_step_log`
--

CREATE TABLE `hjmall_step_log` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `step_id` int(11) NOT NULL DEFAULT '0' COMMENT 'stepID',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '兑换布数',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '1收入 2支出 ',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '0 布数兑换 1商品兑换 2 布数挑战',
  `step_currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活力币',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '订单/活动',
  `raffle_time` int(11) NOT NULL DEFAULT '0' COMMENT '领取时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_step_remind`
--

CREATE TABLE `hjmall_step_remind` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `date` date NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_step_setting`
--

CREATE TABLE `hjmall_step_setting` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `rule` varchar(2000) DEFAULT '' COMMENT '规则',
  `title` varchar(255) DEFAULT '' COMMENT '小程序标题',
  `convert_max` int(11) DEFAULT '0' COMMENT '最大步数兑换限制',
  `convert_ratio` int(11) DEFAULT '0' COMMENT '兑换比率',
  `invite_ratio` int(11) DEFAULT '0' COMMENT '邀请比率',
  `remind_time` varchar(255) DEFAULT '8' COMMENT '0-24',
  `activity_rule` varchar(2000) DEFAULT '' COMMENT '活动规则',
  `share_title` varchar(2000) DEFAULT '' COMMENT '转发标题',
  `ranking_num` int(11) DEFAULT '0' COMMENT '全国排行限制',
  `qrcode_title` varchar(255) DEFAULT '' COMMENT '海报文字'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_step_user`
--

CREATE TABLE `hjmall_step_user` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `step_currency` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '活力币 ',
  `user_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `ratio` int(11) NOT NULL DEFAULT '0' COMMENT '概率加成',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '邀请ID',
  `invite_ratio` int(11) NOT NULL DEFAULT '0' COMMENT '邀请好友加成',
  `is_delete` int(11) NOT NULL DEFAULT '0',
  `remind` int(11) NOT NULL DEFAULT '0' COMMENT '0提醒 1开启'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_store`
--

CREATE TABLE `hjmall_store` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `is_recycle` smallint(1) NOT NULL DEFAULT '0' COMMENT '回收站：0=否，1=是',
  `acid` int(11) NOT NULL DEFAULT '0' COMMENT '微擎公众号id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `wechat_platform_id` int(11) NOT NULL DEFAULT '0' COMMENT '微信公众号id',
  `wechat_app_id` int(11) NOT NULL DEFAULT '0' COMMENT '微信小程序id',
  `name` varchar(255) NOT NULL COMMENT '店铺名称',
  `order_send_tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '发货通知模板消息id',
  `contact_tel` varchar(255) NOT NULL DEFAULT '' COMMENT '联系电话',
  `show_customer_service` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否显示在线客服：0=否，1=是',
  `copyright` varchar(255) NOT NULL DEFAULT '',
  `copyright_pic_url` varchar(2048) DEFAULT NULL,
  `copyright_url` varchar(2048) DEFAULT NULL,
  `delivery_time` int(11) NOT NULL DEFAULT '10' COMMENT '收货时间',
  `after_sale_time` int(11) NOT NULL DEFAULT '7' COMMENT '售后时间',
  `use_wechat_platform_pay` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否使用公众号支付：0=否，1=是',
  `kdniao_mch_id` varchar(255) NOT NULL DEFAULT '' COMMENT '快递鸟商户号',
  `kdniao_api_key` varchar(255) NOT NULL DEFAULT '' COMMENT '快递鸟api key',
  `cat_style` smallint(6) NOT NULL DEFAULT '1' COMMENT '分类页面样式：1=无侧栏，2=有侧栏',
  `home_page_module` longtext COMMENT '首页模块布局',
  `address` longtext COMMENT '店铺地址',
  `cat_goods_cols` int(11) NOT NULL DEFAULT '3' COMMENT '首页分类商品列数',
  `over_day` int(11) NOT NULL DEFAULT '0' COMMENT '未支付订单超时时间',
  `is_offline` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否开启自提',
  `is_coupon` smallint(6) DEFAULT '0' COMMENT '是否开启优惠券',
  `cat_goods_count` int(11) NOT NULL DEFAULT '6' COMMENT '首页分类的商品个数',
  `send_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '发货方式：0=快递或自提，1=仅快递，2=仅自提',
  `member_content` longtext COMMENT '会员等级说明',
  `nav_count` int(11) DEFAULT '0' COMMENT '首页导航栏个数 0--4个 1--5个',
  `integral` int(11) UNSIGNED NOT NULL DEFAULT '10' COMMENT '一元抵多少积分',
  `integration` longtext COMMENT '积分使用说明',
  `cut_thread` smallint(1) DEFAULT NULL COMMENT '分类分割线   0关闭   1开启',
  `dial` smallint(1) DEFAULT NULL COMMENT '一键拨号开关  0关闭  1开启',
  `dial_pic` tinytext COMMENT '拨号图标',
  `purchase_frame` smallint(1) DEFAULT '0',
  `is_recommend` int(10) NOT NULL DEFAULT '0' COMMENT '推荐商品状态 1：开启 0 ：关闭',
  `recommend_count` int(10) NOT NULL DEFAULT '0' COMMENT '推荐商品数量',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '禁用状态：0.未禁用|1.禁用',
  `is_comment` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商城评价开关：0.关闭 1.开启',
  `is_sales` tinyint(4) NOT NULL DEFAULT '1' COMMENT '商城商品销量开关：0.关闭 1.开启',
  `good_negotiable` varchar(255) DEFAULT '' COMMENT '1 电话 2 客服',
  `buy_member` smallint(1) DEFAULT '0' COMMENT '是否购买会员 0不支持 1支持',
  `logo` varchar(255) DEFAULT NULL COMMENT '商城logo',
  `is_member_price` tinyint(1) NOT NULL DEFAULT '1' COMMENT '会员价是否显示 0.不显示|1.显示',
  `is_share_price` tinyint(1) NOT NULL DEFAULT '1' COMMENT '分销价是否显示 0.不显示|1.显示',
  `is_member` smallint(1) DEFAULT '0' COMMENT '是否购买会员 0不支持 1支持',
  `is_official_account` tinyint(1) NOT NULL DEFAULT '0' COMMENT '公众号关注组件 0.否 | 1.是'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城';

--
-- 转存表中的数据 `hjmall_store`
--

INSERT INTO `hjmall_store` (`id`, `admin_id`, `is_delete`, `is_recycle`, `acid`, `user_id`, `wechat_platform_id`, `wechat_app_id`, `name`, `order_send_tpl`, `contact_tel`, `show_customer_service`, `copyright`, `copyright_pic_url`, `copyright_url`, `delivery_time`, `after_sale_time`, `use_wechat_platform_pay`, `kdniao_mch_id`, `kdniao_api_key`, `cat_style`, `home_page_module`, `address`, `cat_goods_cols`, `over_day`, `is_offline`, `is_coupon`, `cat_goods_count`, `send_type`, `member_content`, `nav_count`, `integral`, `integration`, `cut_thread`, `dial`, `dial_pic`, `purchase_frame`, `is_recommend`, `recommend_count`, `status`, `is_comment`, `is_sales`, `good_negotiable`, `buy_member`, `logo`, `is_member_price`, `is_share_price`, `is_member`, `is_official_account`) VALUES
(1, 0, 0, 0, 2, 1, 0, 1, '测试', '', '', 1, '', NULL, NULL, 10, 7, 0, '', '', 1, NULL, NULL, 3, 0, 0, 0, 6, 1, NULL, 0, 10, NULL, NULL, NULL, NULL, 0, 0, 0, 0, 1, 1, '', 0, NULL, 1, 1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_task`
--

CREATE TABLE `hjmall_task` (
  `id` int(10) UNSIGNED NOT NULL,
  `token` varchar(128) NOT NULL,
  `delay_seconds` int(11) NOT NULL COMMENT '多少秒后执行',
  `is_executed` int(1) NOT NULL DEFAULT '0' COMMENT '是否已执行：0=未执行，1=已执行',
  `class` varchar(255) NOT NULL,
  `params` longtext,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` int(1) NOT NULL DEFAULT '0',
  `content` longtext NOT NULL COMMENT '任务说明'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_template_msg`
--

CREATE TABLE `hjmall_template_msg` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `tpl_name` varchar(32) NOT NULL COMMENT '模版名称',
  `tpl_id` varchar(64) NOT NULL COMMENT '模版ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_territorial_limitation`
--

CREATE TABLE `hjmall_territorial_limitation` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `detail` longtext NOT NULL COMMENT '规则详细',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_enable` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否启用：0=否，1=是',
  `is_delete` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_topic`
--

CREATE TABLE `hjmall_topic` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `sub_title` varchar(255) NOT NULL DEFAULT '' COMMENT '副标题',
  `cover_pic` longtext COMMENT '封面图片',
  `content` longtext COMMENT '专题内容',
  `read_count` int(11) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `virtual_read_count` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟阅读量',
  `layout` smallint(6) NOT NULL DEFAULT '0' COMMENT '布局方式：0=小图，1=大图模式',
  `sort` int(11) NOT NULL DEFAULT '1000' COMMENT '排序：升序',
  `agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `virtual_agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟点赞数',
  `virtual_favorite_count` int(11) NOT NULL DEFAULT '0' COMMENT '虚拟收藏量',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `is_chosen` smallint(6) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `qrcode_pic` longtext COMMENT '海报分享图'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_topic_favorite`
--

CREATE TABLE `hjmall_topic_favorite` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户收藏的专题';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_topic_type`
--

CREATE TABLE `hjmall_topic_type` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_delete` smallint(6) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_upload_config`
--

CREATE TABLE `hjmall_upload_config` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `storage_type` varchar(255) NOT NULL DEFAULT '' COMMENT '存储类型：留空=本地，aliyun=阿里云oss，qcloud=腾讯云cos，qiniu=七牛云存储',
  `aliyun` longtext COMMENT '阿里云oss配置，json格式',
  `qcloud` longtext COMMENT '腾讯云cos配置，json格式',
  `qiniu` longtext COMMENT '七牛云存储配置，json格式',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传方式配置';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_upload_file`
--

CREATE TABLE `hjmall_upload_file` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `file_url` varchar(2048) DEFAULT NULL,
  `extension` varchar(255) NOT NULL DEFAULT '' COMMENT '文件扩展名',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '文件类型：',
  `size` int(11) NOT NULL DEFAULT '0' COMMENT '文件大小，字节',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `group_id` int(11) DEFAULT '0' COMMENT '分组id',
  `mch_id` int(11) DEFAULT '0' COMMENT '商户id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户上传的文件';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_user`
--

CREATE TABLE `hjmall_user` (
  `id` int(11) NOT NULL,
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '用户类型：0=管理员，1=普通用户',
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_key` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `wechat_open_id` varchar(255) NOT NULL DEFAULT '' COMMENT '微信openid',
  `wechat_union_id` varchar(255) NOT NULL DEFAULT '' COMMENT '微信用户union id',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '昵称',
  `avatar_url` varchar(2048) DEFAULT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0' COMMENT '商城id',
  `is_distributor` int(11) NOT NULL DEFAULT '0' COMMENT '是否是分销商 0--不是 1--是 2--申请中',
  `parent_id` int(11) NOT NULL DEFAULT '0' COMMENT '父级ID',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '成为分销商的时间',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '累计佣金',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可提现佣金',
  `is_clerk` int(11) NOT NULL DEFAULT '0' COMMENT '是否是核销员 0--不是 1--是',
  `we7_uid` int(11) NOT NULL DEFAULT '0' COMMENT '微擎账户id',
  `shop_id` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT '-1' COMMENT '会员等级',
  `integral` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户当前积分',
  `total_integral` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户总获得积分',
  `money` decimal(10,2) DEFAULT '0.00' COMMENT '余额',
  `contact_way` varchar(255) DEFAULT NULL COMMENT '联系方式',
  `comments` varchar(255) DEFAULT NULL COMMENT '备注',
  `binding` char(11) DEFAULT NULL COMMENT '授权手机号',
  `wechat_platform_open_id` varchar(64) NOT NULL DEFAULT '' COMMENT '微信公众号openid',
  `platform` tinyint(4) NOT NULL DEFAULT '0' COMMENT '小程序平台 0 => 微信, 1 => 支付宝',
  `blacklist` tinyint(1) NOT NULL DEFAULT '0' COMMENT '黑名单 0.否 | 1.是',
  `parent_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '可能成为上级的ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

--
-- 转存表中的数据 `hjmall_user`
--

INSERT INTO `hjmall_user` (`id`, `type`, `username`, `password`, `auth_key`, `access_token`, `addtime`, `is_delete`, `wechat_open_id`, `wechat_union_id`, `nickname`, `avatar_url`, `store_id`, `is_distributor`, `parent_id`, `time`, `total_price`, `price`, `is_clerk`, `we7_uid`, `shop_id`, `level`, `integral`, `total_integral`, `money`, `contact_way`, `comments`, `binding`, `wechat_platform_open_id`, `platform`, `blacklist`, `parent_user_id`) VALUES
(1, 0, 'admin', '$2y$13$Uy5lAFxxNobE08i1e5t.EelkqFdAbegXIMZLud7BaaeFlWQP0wnn6', 'yC8uQ0KUPtnw0uqnJVEaLARiwgeGt8nZ', 'GkSTcq8Xm95m8SPI5nqTdFuzyCbKqss2', 1567497020, 0, '', '', 'admin', '0', 0, 0, 0, 0, '0.00', '0.00', 0, 1, NULL, -1, 0, 0, '0.00', NULL, NULL, NULL, '', 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_user_account_log`
--

CREATE TABLE `hjmall_user_account_log` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` smallint(6) NOT NULL COMMENT '类型：1=收入，2=支出',
  `price` decimal(10,2) NOT NULL COMMENT '变动金额',
  `desc` longtext NOT NULL COMMENT '变动说明',
  `addtime` int(11) NOT NULL,
  `order_type` int(11) NOT NULL DEFAULT '0' COMMENT '订单类型 0--充值 1--商城订单 2--秒杀订单 3--拼团订单 4--商城订单退款 5--秒杀订单退款 6--拼团订单退款',
  `order_id` int(11) DEFAULT '0' COMMENT '订单ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户账户余额变动记录';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_user_auth_login`
--

CREATE TABLE `hjmall_user_auth_login` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(225) NOT NULL,
  `is_pass` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已确认登录：0=未扫码，1=已确认登录',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户授权登录';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_user_card`
--

CREATE TABLE `hjmall_user_card` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `card_id` int(11) DEFAULT NULL COMMENT '卡券ID',
  `card_name` varchar(255) DEFAULT NULL COMMENT '卡券名称',
  `card_pic_url` varchar(2048) DEFAULT NULL,
  `card_content` longtext COMMENT '卡券描述',
  `is_use` int(11) DEFAULT NULL COMMENT '是否使用 0--未使用 1--已使用',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `clerk_id` int(11) DEFAULT NULL COMMENT '核销人id',
  `shop_id` int(11) DEFAULT NULL COMMENT '店铺ID',
  `clerk_time` int(11) DEFAULT NULL COMMENT ' 核销时间',
  `order_id` int(11) NOT NULL DEFAULT '0' COMMENT '发放卡券的订单id',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_user_coupon`
--

CREATE TABLE `hjmall_user_coupon` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `coupon_auto_send_id` int(11) NOT NULL DEFAULT '0' COMMENT '自动发放id',
  `begin_time` int(11) NOT NULL DEFAULT '0' COMMENT '有效期开始时间',
  `end_time` int(11) NOT NULL DEFAULT '0' COMMENT '有效期结束时间',
  `is_expire` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已过期：0=未过期，1=已过期',
  `is_use` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否已使用：0=未使用，1=已使用',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `type` smallint(6) DEFAULT '0' COMMENT '领取类型 0--平台发放 1--自动发放 2--领券中心领取',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT '兑换支付积分数量',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '兑换支付价格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-优惠券关系';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_user_form_id`
--

CREATE TABLE `hjmall_user_form_id` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `form_id` varchar(255) NOT NULL,
  `times` int(11) NOT NULL DEFAULT '1' COMMENT '剩余使用次数',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户FormId记录';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_user_log`
--

CREATE TABLE `hjmall_user_log` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '改变的字段',
  `before_change` varchar(255) NOT NULL DEFAULT '' COMMENT '改变前字段的值',
  `after_change` varchar(255) NOT NULL DEFAULT '' COMMENT '改变后字段的值',
  `is_delete` smallint(6) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_user_share_money`
--

CREATE TABLE `hjmall_user_share_money` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL COMMENT '订单ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `type` int(11) DEFAULT NULL COMMENT '类型 0--佣金 1--提现',
  `source` int(11) DEFAULT '1' COMMENT '佣金来源 1--一级分销 2--二级分销 3--三级分销',
  `money` decimal(10,2) DEFAULT NULL COMMENT '金额',
  `is_delete` int(11) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `order_type` int(11) DEFAULT '0' COMMENT '订单类型 0--商城订单 1--秒杀订单 2--拼团订单 3--预约订单',
  `version` varchar(255) DEFAULT '0' COMMENT '版本'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户佣金明细表';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_video`
--

CREATE TABLE `hjmall_video` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `url` varchar(2048) DEFAULT NULL,
  `sort` varchar(255) DEFAULT NULL COMMENT '排序  升序',
  `is_delete` smallint(6) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL COMMENT '商城id',
  `pic_url` varchar(2048) DEFAULT NULL,
  `content` longtext COMMENT '详情介绍',
  `type` int(11) DEFAULT '0' COMMENT '视频来源 0--源地址 1--腾讯视频'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_we7_user_auth`
--

CREATE TABLE `hjmall_we7_user_auth` (
  `id` int(10) UNSIGNED NOT NULL,
  `we7_user_id` int(11) NOT NULL,
  `auth` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_wechat_app`
--

CREATE TABLE `hjmall_wechat_app` (
  `id` int(11) NOT NULL,
  `acid` int(11) NOT NULL DEFAULT '0' COMMENT '微擎公众号id',
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `app_id` varchar(255) NOT NULL,
  `app_secret` varchar(255) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `mch_id` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `cert_pem` longtext,
  `key_pem` longtext,
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信小程序';

--
-- 转存表中的数据 `hjmall_wechat_app`
--

INSERT INTO `hjmall_wechat_app` (`id`, `acid`, `user_id`, `name`, `app_id`, `app_secret`, `desc`, `mch_id`, `key`, `cert_pem`, `key_pem`, `addtime`, `is_delete`) VALUES
(1, 2, 1, '测试', '0', '0', NULL, NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_wechat_platform`
--

CREATE TABLE `hjmall_wechat_platform` (
  `id` int(11) NOT NULL,
  `acid` int(11) NOT NULL DEFAULT '0' COMMENT '微擎公众号id',
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '公众号名称',
  `app_id` varchar(255) NOT NULL COMMENT '公众号appid',
  `app_secret` varchar(255) NOT NULL COMMENT '公众号appsecret',
  `desc` varchar(255) DEFAULT NULL COMMENT '公共号说明、备注',
  `mch_id` varchar(255) DEFAULT NULL COMMENT '微信支付商户号',
  `key` varchar(255) DEFAULT NULL COMMENT '微信支付key',
  `cert_pem` longtext COMMENT '微信支付cert文件内容',
  `key_pem` longtext COMMENT '微信支付key文件内容',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信公众号';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_wechat_template_message`
--

CREATE TABLE `hjmall_wechat_template_message` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `pay_tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '支付通知模板消息id',
  `send_tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '发货通知模板消息id',
  `refund_tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '退款通知模板消息id',
  `not_pay_tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '订单未支付通知模板消息id',
  `revoke_tpl` varchar(255) NOT NULL DEFAULT '' COMMENT '订单取消通知模板消息id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `hjmall_wechat_template_message`
--

INSERT INTO `hjmall_wechat_template_message` (`id`, `store_id`, `pay_tpl`, `send_tpl`, `refund_tpl`, `not_pay_tpl`, `revoke_tpl`) VALUES
(1, 1, '', '', '', '', ''),
(2, 1, '', '', '', '', ''),
(3, 1, '', '', '', '', ''),
(4, 1, '', '', '', '', ''),
(5, 1, '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_wx_title`
--

CREATE TABLE `hjmall_wx_title` (
  `id` int(11) UNSIGNED NOT NULL,
  `url` varchar(45) NOT NULL DEFAULT '' COMMENT '小程序页面路径',
  `store_id` int(11) DEFAULT NULL COMMENT '商城ID',
  `title` varchar(45) NOT NULL DEFAULT '默认标题' COMMENT '小程序页面标题',
  `addtime` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_yy_cat`
--

CREATE TABLE `hjmall_yy_cat` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '标题名称',
  `store_id` int(11) UNSIGNED NOT NULL COMMENT '商城ID',
  `pic_url` varchar(2048) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序 升序',
  `addtime` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `is_delete` smallint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商城预约';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_yy_form`
--

CREATE TABLE `hjmall_yy_form` (
  `id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL COMMENT '字段名称',
  `type` varchar(255) DEFAULT NULL COMMENT '字段类型',
  `required` int(1) UNSIGNED DEFAULT NULL COMMENT '是否必填',
  `default` varchar(255) DEFAULT NULL COMMENT '默认值',
  `tip` varchar(255) DEFAULT NULL COMMENT '提示语',
  `sort` int(11) DEFAULT NULL,
  `is_delete` int(1) DEFAULT NULL,
  `addtime` int(11) DEFAULT NULL,
  `option` longtext COMMENT '单选、复选项 值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约自定义表单';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_yy_form_id`
--

CREATE TABLE `hjmall_yy_form_id` (
  `id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL COMMENT '店铺id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `wechat_open_id` varchar(255) NOT NULL DEFAULT '' COMMENT '微信openid',
  `form_id` varchar(255) NOT NULL DEFAULT '',
  `order_no` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '可选值：form_id或prepay_id',
  `send_count` int(11) NOT NULL DEFAULT '0' COMMENT '使用次数',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_yy_goods`
--

CREATE TABLE `hjmall_yy_goods` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '商品名称',
  `price` decimal(10,2) UNSIGNED NOT NULL COMMENT '预约金额',
  `original_price` decimal(10,2) UNSIGNED NOT NULL COMMENT '原价',
  `detail` longtext NOT NULL COMMENT '商品详情，图文',
  `cat_id` int(11) UNSIGNED DEFAULT '0' COMMENT '商品分类',
  `status` smallint(6) UNSIGNED NOT NULL DEFAULT '2' COMMENT '上架状态【1=> 上架，2=> 下架】',
  `service` varchar(2000) NOT NULL COMMENT '服务选项',
  `sort` int(11) UNSIGNED DEFAULT '0' COMMENT '商品排序 升序',
  `virtual_sales` int(11) UNSIGNED DEFAULT '0' COMMENT '虚拟销量',
  `cover_pic` longtext COMMENT '商品缩略图',
  `addtime` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_delete` smallint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否删除',
  `sales` int(11) UNSIGNED NOT NULL COMMENT '实际销量',
  `shop_id` varchar(255) DEFAULT '0' COMMENT '门店id',
  `store_id` int(11) UNSIGNED NOT NULL,
  `buy_limit` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '限购次数',
  `stock` int(11) UNSIGNED DEFAULT '0' COMMENT '库存',
  `attr` longtext COMMENT '规格',
  `use_attr` smallint(1) DEFAULT '0' COMMENT '是否启用规格',
  `is_level` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否享受会员折扣 0-不享受 1--享受',
  `video_url` varchar(255) DEFAULT NULL COMMENT '视频url'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_yy_goods_pic`
--

CREATE TABLE `hjmall_yy_goods_pic` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL DEFAULT '0',
  `pic_url` varchar(2048) DEFAULT NULL,
  `is_delete` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_yy_order`
--

CREATE TABLE `hjmall_yy_order` (
  `id` int(11) UNSIGNED NOT NULL,
  `goods_id` int(11) UNSIGNED NOT NULL COMMENT '商品id',
  `user_id` int(11) UNSIGNED NOT NULL COMMENT '用户id',
  `order_no` varchar(255) NOT NULL COMMENT '订单号',
  `total_price` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '订单总费用',
  `pay_price` decimal(10,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '实际支付总费用',
  `is_pay` smallint(6) UNSIGNED NOT NULL DEFAULT '0' COMMENT '支付状态：0=未支付，1=已支付',
  `pay_type` smallint(6) UNSIGNED DEFAULT '0' COMMENT '支付方式：1=微信支付',
  `pay_time` int(11) UNSIGNED DEFAULT '0' COMMENT '支付时间',
  `is_use` smallint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否使用',
  `is_comment` int(1) UNSIGNED DEFAULT '0' COMMENT '是否评论',
  `apply_delete` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否申请取消订单：0=否，1=申请取消订单',
  `addtime` int(11) NOT NULL DEFAULT '0',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `offline_qrcode` longtext COMMENT '核销码',
  `is_cancel` smallint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否取消',
  `store_id` int(11) UNSIGNED NOT NULL,
  `use_time` int(11) UNSIGNED DEFAULT NULL COMMENT '核销时间',
  `clerk_id` int(11) UNSIGNED DEFAULT NULL COMMENT '核销员user_id',
  `shop_id` int(11) UNSIGNED DEFAULT NULL COMMENT '自提门店ID',
  `is_refund` smallint(1) UNSIGNED DEFAULT '0' COMMENT '是否取消',
  `form_id` varchar(255) NOT NULL DEFAULT '0' COMMENT '表单ID',
  `refund_time` int(11) DEFAULT '0' COMMENT '取消时间',
  `is_recycle` smallint(1) NOT NULL DEFAULT '0' COMMENT '是否加入回收站 0--不加入 1--加入',
  `is_show` smallint(1) NOT NULL DEFAULT '1' COMMENT '是否显示 0--不显示 1--显示（软删除）',
  `seller_comments` mediumtext COMMENT '商家备注',
  `attr` longtext COMMENT '规格'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约订单表';

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_yy_order_comment`
--

CREATE TABLE `hjmall_yy_order_comment` (
  `id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `score` decimal(10,1) NOT NULL COMMENT '评分：1=差评，2=中评，3=好',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '评价内容',
  `pic_list` longtext COMMENT '图片',
  `is_hide` smallint(6) NOT NULL DEFAULT '0' COMMENT '是否隐藏：0=不隐藏，1=隐藏',
  `is_delete` smallint(1) NOT NULL DEFAULT '0',
  `addtime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_yy_order_form`
--

CREATE TABLE `hjmall_yy_order_form` (
  `id` int(11) UNSIGNED NOT NULL,
  `store_id` int(11) UNSIGNED DEFAULT NULL,
  `goods_id` int(11) UNSIGNED DEFAULT NULL,
  `user_id` int(11) UNSIGNED DEFAULT NULL,
  `order_id` int(11) UNSIGNED DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `is_delete` int(11) UNSIGNED DEFAULT NULL,
  `addtime` int(11) UNSIGNED DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `hjmall_yy_setting`
--

CREATE TABLE `hjmall_yy_setting` (
  `store_id` int(11) UNSIGNED NOT NULL DEFAULT '1' COMMENT '是否显示分类',
  `cat` smallint(1) NOT NULL COMMENT '参数',
  `success_notice` longtext COMMENT '预约成功模板通知',
  `refund_notice` longtext COMMENT '退款模板id',
  `is_share` int(11) DEFAULT '0' COMMENT '是否开启分销 0--关闭 1--开启',
  `is_sms` int(11) DEFAULT '0' COMMENT '是否开启短信通知',
  `is_print` int(11) DEFAULT '0' COMMENT '是否开启订单打印',
  `is_mail` int(11) DEFAULT '0' COMMENT '是否开启邮件通知'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_account`
--

CREATE TABLE `ims_account` (
  `acid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `hash` varchar(8) NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `isconnect` tinyint(4) NOT NULL,
  `isdeleted` tinyint(3) UNSIGNED NOT NULL,
  `endtime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_account`
--

INSERT INTO `ims_account` (`acid`, `uniacid`, `hash`, `type`, `isconnect`, `isdeleted`, `endtime`) VALUES
(1, 1, 'uRr8qvQV', 1, 0, 0, 0),
(2, 2, 'UL9Hl66I', 4, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_aliapp`
--

CREATE TABLE `ims_account_aliapp` (
  `acid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `level` tinyint(4) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(255) NOT NULL,
  `key` varchar(16) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_baiduapp`
--

CREATE TABLE `ims_account_baiduapp` (
  `acid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `appid` varchar(32) NOT NULL,
  `key` varchar(32) NOT NULL,
  `secret` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_phoneapp`
--

CREATE TABLE `ims_account_phoneapp` (
  `acid` int(11) NOT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_toutiaoapp`
--

CREATE TABLE `ims_account_toutiaoapp` (
  `acid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `appid` varchar(32) NOT NULL,
  `key` varchar(32) NOT NULL,
  `secret` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_webapp`
--

CREATE TABLE `ims_account_webapp` (
  `acid` int(11) NOT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_wechats`
--

CREATE TABLE `ims_account_wechats` (
  `acid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `token` varchar(32) NOT NULL,
  `encodingaeskey` varchar(255) NOT NULL,
  `level` tinyint(4) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `account` varchar(30) NOT NULL,
  `original` varchar(50) NOT NULL,
  `signature` varchar(100) NOT NULL,
  `country` varchar(10) NOT NULL,
  `province` varchar(3) NOT NULL,
  `city` varchar(15) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `lastupdate` int(10) UNSIGNED NOT NULL,
  `key` varchar(50) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `styleid` int(10) UNSIGNED NOT NULL,
  `subscribeurl` varchar(120) NOT NULL,
  `auth_refresh_token` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_account_wechats`
--

INSERT INTO `ims_account_wechats` (`acid`, `uniacid`, `token`, `encodingaeskey`, `level`, `name`, `account`, `original`, `signature`, `country`, `province`, `city`, `username`, `password`, `lastupdate`, `key`, `secret`, `styleid`, `subscribeurl`, `auth_refresh_token`) VALUES
(1, 1, 'omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP', '', 1, 'efwww', '', '', '', '', '', '', '', '', 0, '', '', 1, '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_wxapp`
--

CREATE TABLE `ims_account_wxapp` (
  `acid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) NOT NULL,
  `token` varchar(32) NOT NULL,
  `encodingaeskey` varchar(43) NOT NULL,
  `level` tinyint(4) NOT NULL,
  `account` varchar(30) NOT NULL,
  `original` varchar(50) NOT NULL,
  `key` varchar(50) NOT NULL,
  `secret` varchar(50) NOT NULL,
  `name` varchar(30) NOT NULL,
  `appdomain` varchar(255) NOT NULL,
  `auth_refresh_token` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_account_wxapp`
--

INSERT INTO `ims_account_wxapp` (`acid`, `uniacid`, `token`, `encodingaeskey`, `level`, `account`, `original`, `key`, `secret`, `name`, `appdomain`, `auth_refresh_token`) VALUES
(2, 2, 'QAiyWWYewyi5f77vUsSC5vtsOeymAAMv', 'iXdoxUd1oeU1jvmmUd3DvhXm2Fo32UFmj32Fd1EJJo2', 1, '', 'gh_c28c6c46e215', 'wx7cb43fef88e9cf20', '5957d7ee03125af7a929e83db44fe71e', '测试', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_account_xzapp`
--

CREATE TABLE `ims_account_xzapp` (
  `acid` int(11) NOT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `original` varchar(50) NOT NULL,
  `lastupdate` int(10) NOT NULL,
  `styleid` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  `token` varchar(32) NOT NULL,
  `encodingaeskey` varchar(255) NOT NULL,
  `xzapp_id` varchar(30) NOT NULL,
  `level` tinyint(4) UNSIGNED NOT NULL,
  `key` varchar(80) NOT NULL,
  `secret` varchar(80) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_clerks`
--

CREATE TABLE `ims_activity_clerks` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `storeid` int(10) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_clerk_menu`
--

CREATE TABLE `ims_activity_clerk_menu` (
  `id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `displayorder` int(4) NOT NULL,
  `pid` int(6) NOT NULL,
  `group_name` varchar(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `permission` varchar(50) NOT NULL,
  `system` int(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_coupon_allocation`
--

CREATE TABLE `ims_activity_coupon_allocation` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `couponid` int(10) UNSIGNED NOT NULL,
  `groupid` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_coupon_modules`
--

CREATE TABLE `ims_activity_coupon_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `couponid` int(10) UNSIGNED NOT NULL,
  `module` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_exchange`
--

CREATE TABLE `ims_activity_exchange` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `thumb` varchar(500) NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL,
  `extra` varchar(3000) NOT NULL,
  `credit` int(10) UNSIGNED NOT NULL,
  `credittype` varchar(10) NOT NULL,
  `pretotal` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `total` int(10) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `starttime` int(10) UNSIGNED NOT NULL,
  `endtime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_exchange_trades`
--

CREATE TABLE `ims_activity_exchange_trades` (
  `tid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `exid` int(10) UNSIGNED NOT NULL,
  `type` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_exchange_trades_shipping`
--

CREATE TABLE `ims_activity_exchange_trades_shipping` (
  `tid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `exid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `province` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `district` varchar(30) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_modules`
--

CREATE TABLE `ims_activity_modules` (
  `mid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `exid` int(10) UNSIGNED NOT NULL,
  `module` varchar(50) NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `available` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_modules_record`
--

CREATE TABLE `ims_activity_modules_record` (
  `id` int(10) UNSIGNED NOT NULL,
  `mid` int(10) UNSIGNED NOT NULL,
  `num` tinyint(3) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_activity_stores`
--

CREATE TABLE `ims_activity_stores` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `category` varchar(255) NOT NULL,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `district` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `photo_list` varchar(10000) NOT NULL,
  `avg_price` int(10) UNSIGNED NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `source` tinyint(3) UNSIGNED NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_category`
--

CREATE TABLE `ims_article_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `type` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_comment`
--

CREATE TABLE `ims_article_comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `articleid` int(10) UNSIGNED NOT NULL,
  `parentid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `content` varchar(500) DEFAULT NULL,
  `is_like` tinyint(1) NOT NULL,
  `is_reply` tinyint(1) NOT NULL,
  `like_num` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_news`
--

CREATE TABLE `ims_article_news` (
  `id` int(10) UNSIGNED NOT NULL,
  `cateid` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `is_display` tinyint(3) UNSIGNED NOT NULL,
  `is_show_home` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `click` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_notice`
--

CREATE TABLE `ims_article_notice` (
  `id` int(10) UNSIGNED NOT NULL,
  `cateid` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `is_display` tinyint(3) UNSIGNED NOT NULL,
  `is_show_home` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `click` int(10) UNSIGNED NOT NULL,
  `style` varchar(200) NOT NULL,
  `group` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_article_unread_notice`
--

CREATE TABLE `ims_article_unread_notice` (
  `id` int(10) UNSIGNED NOT NULL,
  `notice_id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `is_new` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_attachment_group`
--

CREATE TABLE `ims_attachment_group` (
  `id` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `uniacid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_basic_reply`
--

CREATE TABLE `ims_basic_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `content` varchar(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_business`
--

CREATE TABLE `ims_business` (
  `id` int(10) UNSIGNED NOT NULL,
  `weid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `province` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `dist` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `lng` varchar(10) NOT NULL,
  `lat` varchar(10) NOT NULL,
  `industry1` varchar(10) NOT NULL,
  `industry2` varchar(10) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_attachment`
--

CREATE TABLE `ims_core_attachment` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `module_upload_dir` varchar(100) NOT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_cache`
--

CREATE TABLE `ims_core_cache` (
  `key` varchar(100) NOT NULL,
  `value` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_cache`
--

INSERT INTO `ims_core_cache` (`key`, `value`) VALUES
('we7:account_ticket', 's:0:"";'),
('we7:setting', 'a:6:{s:9:"copyright";a:1:{s:6:"slides";a:3:{i:0;s:58:"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg";i:1;s:58:"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg";i:2;s:58:"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg";}}s:8:"authmode";i:1;s:5:"close";a:2:{s:6:"status";s:1:"0";s:6:"reason";s:0:"";}s:8:"register";a:4:{s:4:"open";i:1;s:6:"verify";i:0;s:4:"code";i:1;s:7:"groupid";i:1;}s:10:"thirdlogin";a:4:{s:6:"system";a:3:{s:5:"appid";s:0:"";s:9:"appsecret";s:0:"";s:9:"authstate";s:0:"";}s:2:"qq";a:3:{s:5:"appid";s:0:"";s:9:"appsecret";s:0:"";s:9:"authstate";i:0;}s:6:"wechat";a:3:{s:5:"appid";s:0:"";s:9:"appsecret";s:0:"";s:9:"authstate";s:0:"";}s:6:"mobile";a:3:{s:5:"appid";s:0:"";s:9:"appsecret";s:0:"";s:9:"authstate";s:0:"";}}s:7:"cloudip";a:0:{}}'),
('we7:userbasefields', 'a:46:{s:7:"uniacid";s:17:"同一公众号id";s:7:"groupid";s:8:"分组id";s:7:"credit1";s:6:"积分";s:7:"credit2";s:6:"余额";s:7:"credit3";s:19:"预留积分类型3";s:7:"credit4";s:19:"预留积分类型4";s:7:"credit5";s:19:"预留积分类型5";s:7:"credit6";s:19:"预留积分类型6";s:10:"createtime";s:12:"加入时间";s:6:"mobile";s:12:"手机号码";s:5:"email";s:12:"电子邮箱";s:8:"realname";s:12:"真实姓名";s:8:"nickname";s:6:"昵称";s:6:"avatar";s:6:"头像";s:2:"qq";s:5:"QQ号";s:6:"gender";s:6:"性别";s:5:"birth";s:6:"生日";s:13:"constellation";s:6:"星座";s:6:"zodiac";s:6:"生肖";s:9:"telephone";s:12:"固定电话";s:6:"idcard";s:12:"证件号码";s:9:"studentid";s:6:"学号";s:5:"grade";s:6:"班级";s:7:"address";s:6:"地址";s:7:"zipcode";s:6:"邮编";s:11:"nationality";s:6:"国籍";s:6:"reside";s:9:"居住地";s:14:"graduateschool";s:12:"毕业学校";s:7:"company";s:6:"公司";s:9:"education";s:6:"学历";s:10:"occupation";s:6:"职业";s:8:"position";s:6:"职位";s:7:"revenue";s:9:"年收入";s:15:"affectivestatus";s:12:"情感状态";s:10:"lookingfor";s:13:" 交友目的";s:9:"bloodtype";s:6:"血型";s:6:"height";s:6:"身高";s:6:"weight";s:6:"体重";s:6:"alipay";s:15:"支付宝帐号";s:3:"msn";s:3:"MSN";s:6:"taobao";s:12:"阿里旺旺";s:4:"site";s:6:"主页";s:3:"bio";s:12:"自我介绍";s:8:"interest";s:12:"兴趣爱好";s:8:"password";s:6:"密码";s:12:"pay_password";s:12:"支付密码";}'),
('we7:usersfields', 'a:49:{s:8:"realname";s:12:"真实姓名";s:8:"nickname";s:6:"昵称";s:6:"avatar";s:6:"头像";s:2:"qq";s:5:"QQ号";s:6:"mobile";s:12:"手机号码";s:3:"vip";s:9:"VIP级别";s:6:"gender";s:6:"性别";s:9:"birthyear";s:12:"出生生日";s:13:"constellation";s:6:"星座";s:6:"zodiac";s:6:"生肖";s:9:"telephone";s:12:"固定电话";s:6:"idcard";s:12:"证件号码";s:9:"studentid";s:6:"学号";s:5:"grade";s:6:"班级";s:7:"address";s:12:"邮寄地址";s:7:"zipcode";s:6:"邮编";s:11:"nationality";s:6:"国籍";s:14:"resideprovince";s:12:"居住地址";s:14:"graduateschool";s:12:"毕业学校";s:7:"company";s:6:"公司";s:9:"education";s:6:"学历";s:10:"occupation";s:6:"职业";s:8:"position";s:6:"职位";s:7:"revenue";s:9:"年收入";s:15:"affectivestatus";s:12:"情感状态";s:10:"lookingfor";s:13:" 交友目的";s:9:"bloodtype";s:6:"血型";s:6:"height";s:6:"身高";s:6:"weight";s:6:"体重";s:6:"alipay";s:15:"支付宝帐号";s:3:"msn";s:3:"MSN";s:5:"email";s:12:"电子邮箱";s:6:"taobao";s:12:"阿里旺旺";s:4:"site";s:6:"主页";s:3:"bio";s:12:"自我介绍";s:8:"interest";s:12:"兴趣爱好";s:10:"birthmonth";s:12:"出生月份";s:8:"birthday";s:12:"出生日期";s:7:"credit1";s:6:"积分";s:7:"credit2";s:6:"余额";s:7:"uniacid";s:17:"同一公众号id";s:7:"groupid";s:8:"分组id";s:7:"credit3";s:19:"预留积分类型3";s:7:"credit4";s:19:"预留积分类型4";s:7:"credit5";s:19:"预留积分类型5";s:7:"credit6";s:19:"预留积分类型6";s:10:"createtime";s:12:"加入时间";s:8:"password";s:12:"用户密码";s:12:"pay_password";s:12:"支付密码";}'),
('we7:module_receive_enable', 'a:0:{}');
INSERT INTO `ims_core_cache` (`key`, `value`) VALUES
('we7:system_frame:0', 'a:21:{s:8:"phoneapp";a:7:{s:5:"title";s:3:"APP";s:4:"icon";s:18:"wi wi-white-collar";s:3:"url";s:41:"./index.php?c=phoneapp&a=display&do=home&";s:7:"section";a:2:{s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:16:"phoneapp_profile";a:4:{s:5:"title";s:6:"配置";s:4:"menu";a:2:{s:28:"profile_phoneapp_module_link";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:1:{i:0;i:6;}s:10:"is_display";i:0;s:5:"title";s:12:"数据同步";s:3:"url";s:42:"./index.php?c=wxapp&a=module-link-uniacid&";s:15:"permission_name";s:28:"profile_phoneapp_module_link";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:14:"front_download";a:10:{s:9:"is_system";i:1;s:18:"permission_display";b:1;s:10:"is_display";i:1;s:5:"title";s:9:"下载APP";s:3:"url";s:40:"./index.php?c=phoneapp&a=front-download&";s:15:"permission_name";s:23:"phoneapp_front_download";s:4:"icon";s:13:"wi wi-examine";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:10:"is_display";b:1;s:18:"permission_display";a:1:{i:0;i:6;}}}s:9:"is_system";b:1;s:10:"is_display";b:0;s:12:"displayorder";i:0;}s:7:"welcome";a:7:{s:5:"title";s:6:"首页";s:4:"icon";s:10:"wi wi-home";s:3:"url";s:48:"./index.php?c=home&a=welcome&do=system&page=home";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:2;}s:8:"platform";a:8:{s:5:"title";s:12:"平台入口";s:4:"icon";s:14:"wi wi-platform";s:9:"dimension";i:2;s:3:"url";s:44:"./index.php?c=account&a=display&do=platform&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:3;}s:6:"module";a:8:{s:5:"title";s:12:"应用入口";s:4:"icon";s:11:"wi wi-apply";s:9:"dimension";i:2;s:3:"url";s:53:"./index.php?c=module&a=display&do=switch_last_module&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:4;}s:14:"account_manage";a:8:{s:5:"title";s:12:"平台管理";s:4:"icon";s:21:"wi wi-platform-manage";s:9:"dimension";i:2;s:3:"url";s:31:"./index.php?c=account&a=manage&";s:7:"section";a:1:{s:14:"account_manage";a:2:{s:5:"title";s:12:"平台管理";s:4:"menu";a:4:{s:22:"account_manage_display";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"平台列表";s:3:"url";s:31:"./index.php?c=account&a=manage&";s:15:"permission_name";s:22:"account_manage_display";s:4:"icon";N;s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";a:1:{i:0;a:2:{s:5:"title";s:12:"帐号停用";s:15:"permission_name";s:19:"account_manage_stop";}}}s:22:"account_manage_recycle";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:9:"回收站";s:3:"url";s:32:"./index.php?c=account&a=recycle&";s:15:"permission_name";s:22:"account_manage_recycle";s:4:"icon";N;s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:2:{i:0;a:2:{s:5:"title";s:12:"帐号删除";s:15:"permission_name";s:21:"account_manage_delete";}i:1;a:2:{s:5:"title";s:12:"帐号恢复";s:15:"permission_name";s:22:"account_manage_recover";}}}s:30:"account_manage_system_platform";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:19:" 微信开放平台";s:3:"url";s:32:"./index.php?c=system&a=platform&";s:15:"permission_name";s:30:"account_manage_system_platform";s:4:"icon";N;s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:30:"account_manage_expired_message";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:22:" 自定义到期提示";s:3:"url";s:40:"./index.php?c=account&a=expired-message&";s:15:"permission_name";s:30:"account_manage_expired_message";s:4:"icon";N;s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:5;}s:13:"module_manage";a:8:{s:5:"title";s:12:"应用管理";s:4:"icon";s:19:"wi wi-module-manage";s:9:"dimension";i:2;s:3:"url";s:50:"./index.php?c=module&a=manage-system&do=installed&";s:7:"section";a:1:{s:13:"module_manage";a:2:{s:5:"title";s:12:"应用管理";s:4:"menu";a:5:{s:23:"module_manage_installed";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"已安装列表";s:3:"url";s:50:"./index.php?c=module&a=manage-system&do=installed&";s:15:"permission_name";s:23:"module_manage_installed";s:4:"icon";N;s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:20:"module_manage_stoped";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"已停用列表";s:3:"url";s:54:"./index.php?c=module&a=manage-system&do=recycle&type=1";s:15:"permission_name";s:20:"module_manage_stoped";s:4:"icon";N;s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:27:"module_manage_not_installed";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"未安装列表";s:3:"url";s:54:"./index.php?c=module&a=manage-system&do=not_installed&";s:15:"permission_name";s:27:"module_manage_not_installed";s:4:"icon";N;s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:21:"module_manage_recycle";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:9:"回收站";s:3:"url";s:54:"./index.php?c=module&a=manage-system&do=recycle&type=2";s:15:"permission_name";s:21:"module_manage_recycle";s:4:"icon";N;s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:23:"module_manage_subscribe";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"订阅管理";s:3:"url";s:50:"./index.php?c=module&a=manage-system&do=subscribe&";s:15:"permission_name";s:23:"module_manage_subscribe";s:4:"icon";N;s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:0:{}}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:6;}s:11:"user_manage";a:8:{s:5:"title";s:12:"用户管理";s:4:"icon";s:16:"wi wi-user-group";s:9:"dimension";i:2;s:3:"url";s:29:"./index.php?c=user&a=display&";s:7:"section";a:1:{s:11:"user_manage";a:2:{s:5:"title";s:12:"用户管理";s:4:"menu";a:7:{s:19:"user_manage_display";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"普通用户";s:3:"url";s:29:"./index.php?c=user&a=display&";s:15:"permission_name";s:19:"user_manage_display";s:4:"icon";N;s:12:"displayorder";i:7;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:19:"user_manage_founder";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:9:"副站长";s:3:"url";s:32:"./index.php?c=founder&a=display&";s:15:"permission_name";s:19:"user_manage_founder";s:4:"icon";N;s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:17:"user_manage_clerk";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"店员管理";s:3:"url";s:39:"./index.php?c=user&a=display&type=clerk";s:15:"permission_name";s:17:"user_manage_clerk";s:4:"icon";N;s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:17:"user_manage_check";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"审核用户";s:3:"url";s:39:"./index.php?c=user&a=display&type=check";s:15:"permission_name";s:17:"user_manage_check";s:4:"icon";N;s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:19:"user_manage_recycle";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:9:"回收站";s:3:"url";s:41:"./index.php?c=user&a=display&type=recycle";s:15:"permission_name";s:19:"user_manage_recycle";s:4:"icon";N;s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:18:"user_manage_fields";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"用户属性设置";s:3:"url";s:39:"./index.php?c=user&a=fields&do=display&";s:15:"permission_name";s:18:"user_manage_fields";s:4:"icon";N;s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:18:"user_manage_expire";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"用户过期设置";s:3:"url";s:28:"./index.php?c=user&a=expire&";s:15:"permission_name";s:18:"user_manage_expire";s:4:"icon";N;s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:0:{}}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:7;}s:10:"permission";a:8:{s:5:"title";s:9:"权限组";s:4:"icon";s:22:"wi wi-userjurisdiction";s:9:"dimension";i:2;s:3:"url";s:29:"./index.php?c=module&a=group&";s:7:"section";a:1:{s:10:"permission";a:2:{s:5:"title";s:9:"权限组";s:4:"menu";a:4:{s:23:"permission_module_group";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"应用权限组";s:3:"url";s:29:"./index.php?c=module&a=group&";s:15:"permission_name";s:23:"permission_module_group";s:4:"icon";N;s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:31:"permission_create_account_group";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"账号权限组";s:3:"url";s:34:"./index.php?c=user&a=create-group&";s:15:"permission_name";s:31:"permission_create_account_group";s:4:"icon";N;s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:21:"permission_user_group";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"用户权限组合";s:3:"url";s:27:"./index.php?c=user&a=group&";s:15:"permission_name";s:21:"permission_user_group";s:4:"icon";N;s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:24:"permission_founder_group";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:21:"副站长权限组合";s:3:"url";s:30:"./index.php?c=founder&a=group&";s:15:"permission_name";s:24:"permission_founder_group";s:4:"icon";N;s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:0:{}}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:8;}s:6:"system";a:8:{s:5:"title";s:12:"系统功能";s:4:"icon";s:13:"wi wi-setting";s:9:"dimension";i:3;s:3:"url";s:31:"./index.php?c=article&a=notice&";s:7:"section";a:5:{s:7:"article";a:3:{s:5:"title";s:12:"站内公告";s:4:"menu";a:1:{s:14:"system_article";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"站内公告";s:3:"url";s:31:"./index.php?c=article&a=notice&";s:15:"permission_name";s:14:"system_article";s:4:"icon";s:13:"wi wi-article";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:2:{i:0;a:2:{s:5:"title";s:12:"公告列表";s:15:"permission_name";s:26:"system_article_notice_list";}i:1;a:2:{s:5:"title";s:12:"公告分类";s:15:"permission_name";s:30:"system_article_notice_category";}}}}s:7:"founder";b:1;}s:15:"system_template";a:3:{s:5:"title";s:6:"模板";s:4:"menu";a:1:{s:15:"system_template";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"微官网模板";s:3:"url";s:32:"./index.php?c=system&a=template&";s:15:"permission_name";s:15:"system_template";s:4:"icon";s:17:"wi wi-wx-template";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:7:"founder";b:1;}s:14:"system_welcome";a:3:{s:5:"title";s:12:"系统首页";s:4:"menu";a:2:{s:14:"system_welcome";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"系统首页应用";s:3:"url";s:60:"./index.php?c=module&a=manage-system&support=welcome_support";s:15:"permission_name";s:14:"system_welcome";s:4:"icon";s:20:"wi wi-system-welcome";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:11:"system_news";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"系统新闻";s:3:"url";s:29:"./index.php?c=article&a=news&";s:15:"permission_name";s:11:"system_news";s:4:"icon";s:13:"wi wi-article";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:2:{i:0;a:2:{s:5:"title";s:13:"新闻列表 ";s:15:"permission_name";s:24:"system_article_news_list";}i:1;a:2:{s:5:"title";s:13:"新闻分类 ";s:15:"permission_name";s:28:"system_article_news_category";}}}}s:7:"founder";b:1;}s:17:"system_statistics";a:3:{s:5:"title";s:6:"统计";s:4:"menu";a:1:{s:23:"system_account_analysis";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"访问统计";s:3:"url";s:35:"./index.php?c=statistics&a=account&";s:15:"permission_name";s:23:"system_account_analysis";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:7:"founder";b:1;}s:5:"cache";a:2:{s:5:"title";s:6:"缓存";s:4:"menu";a:1:{s:26:"system_setting_updatecache";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"更新缓存";s:3:"url";s:35:"./index.php?c=system&a=updatecache&";s:15:"permission_name";s:26:"system_setting_updatecache";s:4:"icon";s:12:"wi wi-update";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:9;}s:4:"site";a:9:{s:5:"title";s:12:"站点设置";s:4:"icon";s:17:"wi wi-system-site";s:9:"dimension";i:3;s:3:"url";s:28:"./index.php?c=system&a=site&";s:7:"section";a:4:{s:5:"cloud";a:2:{s:5:"title";s:9:"云服务";s:4:"menu";a:3:{s:14:"system_profile";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"系统升级";s:3:"url";s:30:"./index.php?c=cloud&a=upgrade&";s:15:"permission_name";s:20:"system_cloud_upgrade";s:4:"icon";s:11:"wi wi-cache";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:21:"system_cloud_register";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"注册站点";s:3:"url";s:30:"./index.php?c=cloud&a=profile&";s:15:"permission_name";s:21:"system_cloud_register";s:4:"icon";s:18:"wi wi-registersite";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:21:"system_cloud_diagnose";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"云服务诊断";s:3:"url";s:31:"./index.php?c=cloud&a=diagnose&";s:15:"permission_name";s:21:"system_cloud_diagnose";s:4:"icon";s:14:"wi wi-diagnose";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"setting";a:2:{s:5:"title";s:6:"设置";s:4:"menu";a:9:{s:19:"system_setting_site";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"站点设置";s:3:"url";s:28:"./index.php?c=system&a=site&";s:15:"permission_name";s:19:"system_setting_site";s:4:"icon";s:18:"wi wi-site-setting";s:12:"displayorder";i:9;s:2:"id";N;s:14:"sub_permission";N;}s:19:"system_setting_menu";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"菜单设置";s:3:"url";s:28:"./index.php?c=system&a=menu&";s:15:"permission_name";s:19:"system_setting_menu";s:4:"icon";s:18:"wi wi-menu-setting";s:12:"displayorder";i:8;s:2:"id";N;s:14:"sub_permission";N;}s:25:"system_setting_attachment";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"附件设置";s:3:"url";s:34:"./index.php?c=system&a=attachment&";s:15:"permission_name";s:25:"system_setting_attachment";s:4:"icon";s:16:"wi wi-attachment";s:12:"displayorder";i:7;s:2:"id";N;s:14:"sub_permission";N;}s:25:"system_setting_systeminfo";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"系统信息";s:3:"url";s:34:"./index.php?c=system&a=systeminfo&";s:15:"permission_name";s:25:"system_setting_systeminfo";s:4:"icon";s:17:"wi wi-system-info";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";N;}s:19:"system_setting_logs";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"查看日志";s:3:"url";s:28:"./index.php?c=system&a=logs&";s:15:"permission_name";s:19:"system_setting_logs";s:4:"icon";s:9:"wi wi-log";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:26:"system_setting_ipwhitelist";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:11:"IP白名单";s:3:"url";s:35:"./index.php?c=system&a=ipwhitelist&";s:15:"permission_name";s:26:"system_setting_ipwhitelist";s:4:"icon";s:8:"wi wi-ip";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:28:"system_setting_sensitiveword";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"过滤敏感词";s:3:"url";s:37:"./index.php?c=system&a=sensitiveword&";s:15:"permission_name";s:28:"system_setting_sensitiveword";s:4:"icon";s:15:"wi wi-sensitive";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:25:"system_setting_thirdlogin";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:25:"用户登录/注册设置";s:3:"url";s:33:"./index.php?c=user&a=registerset&";s:15:"permission_name";s:25:"system_setting_thirdlogin";s:4:"icon";s:10:"wi wi-user";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:20:"system_setting_oauth";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"全局借用权限";s:3:"url";s:29:"./index.php?c=system&a=oauth&";s:15:"permission_name";s:20:"system_setting_oauth";s:4:"icon";s:11:"wi wi-oauth";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"utility";a:2:{s:5:"title";s:12:"常用工具";s:4:"menu";a:6:{s:24:"system_utility_filecheck";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"系统文件校验";s:3:"url";s:33:"./index.php?c=system&a=filecheck&";s:15:"permission_name";s:24:"system_utility_filecheck";s:4:"icon";s:10:"wi wi-file";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";N;}s:23:"system_utility_optimize";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"性能优化";s:3:"url";s:32:"./index.php?c=system&a=optimize&";s:15:"permission_name";s:23:"system_utility_optimize";s:4:"icon";s:14:"wi wi-optimize";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:23:"system_utility_database";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:9:"数据库";s:3:"url";s:32:"./index.php?c=system&a=database&";s:15:"permission_name";s:23:"system_utility_database";s:4:"icon";s:9:"wi wi-sql";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:19:"system_utility_scan";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"木马查杀";s:3:"url";s:28:"./index.php?c=system&a=scan&";s:15:"permission_name";s:19:"system_utility_scan";s:4:"icon";s:12:"wi wi-safety";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:18:"system_utility_bom";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"检测文件BOM";s:3:"url";s:27:"./index.php?c=system&a=bom&";s:15:"permission_name";s:18:"system_utility_bom";s:4:"icon";s:9:"wi wi-bom";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:20:"system_utility_check";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"系统常规检测";s:3:"url";s:29:"./index.php?c=system&a=check&";s:15:"permission_name";s:20:"system_utility_check";s:4:"icon";s:9:"wi wi-bom";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"backjob";a:2:{s:5:"title";s:12:"后台任务";s:4:"menu";a:1:{s:10:"system_job";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"后台任务";s:3:"url";s:38:"./index.php?c=system&a=job&do=display&";s:15:"permission_name";s:10:"system_job";s:4:"icon";s:9:"wi wi-job";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:7:"founder";b:1;s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:10;}s:6:"myself";a:8:{s:5:"title";s:12:"我的账户";s:4:"icon";s:10:"wi wi-bell";s:9:"dimension";i:2;s:3:"url";s:29:"./index.php?c=user&a=profile&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:11;}s:7:"message";a:8:{s:5:"title";s:12:"消息管理";s:4:"icon";s:10:"wi wi-bell";s:9:"dimension";i:2;s:3:"url";s:31:"./index.php?c=message&a=notice&";s:7:"section";a:1:{s:7:"message";a:2:{s:5:"title";s:12:"消息管理";s:4:"menu";a:3:{s:14:"message_notice";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"消息提醒";s:3:"url";s:31:"./index.php?c=message&a=notice&";s:15:"permission_name";s:14:"message_notice";s:4:"icon";N;s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:15:"message_setting";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"消息设置";s:3:"url";s:42:"./index.php?c=message&a=notice&do=setting&";s:15:"permission_name";s:15:"message_setting";s:4:"icon";N;s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:22:"message_wechat_setting";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"微信提醒设置";s:3:"url";s:49:"./index.php?c=message&a=notice&do=wechat_setting&";s:15:"permission_name";s:22:"message_wechat_setting";s:4:"icon";N;s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:12;}s:7:"account";a:8:{s:5:"title";s:9:"公众号";s:4:"icon";s:18:"wi wi-white-collar";s:9:"dimension";i:3;s:3:"url";s:41:"./index.php?c=home&a=welcome&do=platform&";s:7:"section";a:5:{s:8:"platform";a:4:{s:5:"title";s:12:"增强功能";s:4:"menu";a:6:{s:14:"platform_reply";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;s:5:"title";s:12:"自动回复";s:3:"url";s:31:"./index.php?c=platform&a=reply&";s:15:"permission_name";s:14:"platform_reply";s:4:"icon";s:11:"wi wi-reply";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";a:7:{s:22:"platform_reply_keyword";a:4:{s:5:"title";s:21:"关键字自动回复";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=keyword";s:15:"permission_name";s:22:"platform_reply_keyword";s:6:"active";s:7:"keyword";}s:22:"platform_reply_special";a:4:{s:5:"title";s:24:"非关键字自动回复";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=special";s:15:"permission_name";s:22:"platform_reply_special";s:6:"active";s:7:"special";}s:22:"platform_reply_welcome";a:4:{s:5:"title";s:24:"首次访问自动回复";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=welcome";s:15:"permission_name";s:22:"platform_reply_welcome";s:6:"active";s:7:"welcome";}s:22:"platform_reply_default";a:4:{s:5:"title";s:12:"默认回复";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=default";s:15:"permission_name";s:22:"platform_reply_default";s:6:"active";s:7:"default";}s:22:"platform_reply_service";a:4:{s:5:"title";s:12:"常用服务";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=service";s:15:"permission_name";s:22:"platform_reply_service";s:6:"active";s:7:"service";}s:22:"platform_reply_userapi";a:5:{s:5:"title";s:21:"自定义接口回复";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=userapi";s:15:"permission_name";s:22:"platform_reply_userapi";s:6:"active";s:7:"userapi";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:22:"platform_reply_setting";a:4:{s:5:"title";s:12:"回复设置";s:3:"url";s:38:"./index.php?c=profile&a=reply-setting&";s:15:"permission_name";s:22:"platform_reply_setting";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}}}s:13:"platform_menu";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;s:5:"title";s:15:"自定义菜单";s:3:"url";s:38:"./index.php?c=platform&a=menu&do=post&";s:15:"permission_name";s:13:"platform_menu";s:4:"icon";s:16:"wi wi-custommenu";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";a:2:{s:21:"platform_menu_default";a:4:{s:5:"title";s:12:"默认菜单";s:3:"url";s:38:"./index.php?c=platform&a=menu&do=post&";s:15:"permission_name";s:21:"platform_menu_default";s:6:"active";s:4:"post";}s:25:"platform_menu_conditional";a:5:{s:5:"title";s:15:"个性化菜单";s:3:"url";s:47:"./index.php?c=platform&a=menu&do=display&type=3";s:15:"permission_name";s:25:"platform_menu_conditional";s:6:"active";s:7:"display";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}}}s:11:"platform_qr";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:2:{i:0;i:1;i:1;i:3;}s:10:"is_display";i:0;s:5:"title";s:22:"二维码/转化链接";s:3:"url";s:28:"./index.php?c=platform&a=qr&";s:15:"permission_name";s:11:"platform_qr";s:4:"icon";s:12:"wi wi-qrcode";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";a:2:{s:14:"platform_qr_qr";a:4:{s:5:"title";s:9:"二维码";s:3:"url";s:36:"./index.php?c=platform&a=qr&do=list&";s:15:"permission_name";s:14:"platform_qr_qr";s:6:"active";s:4:"list";}s:22:"platform_qr_statistics";a:4:{s:5:"title";s:21:"二维码扫描统计";s:3:"url";s:39:"./index.php?c=platform&a=qr&do=display&";s:15:"permission_name";s:22:"platform_qr_statistics";s:6:"active";s:7:"display";}}}s:17:"platform_masstask";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;s:5:"title";s:12:"定时群发";s:3:"url";s:30:"./index.php?c=platform&a=mass&";s:15:"permission_name";s:17:"platform_masstask";s:4:"icon";s:13:"wi wi-crontab";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:2:{s:22:"platform_masstask_post";a:4:{s:5:"title";s:12:"定时群发";s:3:"url";s:38:"./index.php?c=platform&a=mass&do=post&";s:15:"permission_name";s:22:"platform_masstask_post";s:6:"active";s:4:"post";}s:22:"platform_masstask_send";a:4:{s:5:"title";s:12:"群发记录";s:3:"url";s:38:"./index.php?c=platform&a=mass&do=send&";s:15:"permission_name";s:22:"platform_masstask_send";s:6:"active";s:4:"send";}}}s:17:"platform_material";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;s:5:"title";s:16:"素材/编辑器";s:3:"url";s:34:"./index.php?c=platform&a=material&";s:15:"permission_name";s:17:"platform_material";s:4:"icon";s:12:"wi wi-redact";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:5:{s:22:"platform_material_news";a:4:{s:5:"title";s:6:"图文";s:3:"url";s:43:"./index.php?c=platform&a=material&type=news";s:15:"permission_name";s:22:"platform_material_news";s:6:"active";s:4:"news";}s:23:"platform_material_image";a:4:{s:5:"title";s:6:"图片";s:3:"url";s:44:"./index.php?c=platform&a=material&type=image";s:15:"permission_name";s:23:"platform_material_image";s:6:"active";s:5:"image";}s:23:"platform_material_voice";a:4:{s:5:"title";s:6:"语音";s:3:"url";s:44:"./index.php?c=platform&a=material&type=voice";s:15:"permission_name";s:23:"platform_material_voice";s:6:"active";s:5:"voice";}s:23:"platform_material_video";a:5:{s:5:"title";s:6:"视频";s:3:"url";s:44:"./index.php?c=platform&a=material&type=video";s:15:"permission_name";s:23:"platform_material_video";s:6:"active";s:5:"video";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:24:"platform_material_delete";a:3:{s:5:"title";s:6:"删除";s:15:"permission_name";s:24:"platform_material_delete";s:10:"is_display";b:0;}}}s:13:"platform_site";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:2:{i:0;i:1;i:1;i:3;}s:10:"is_display";i:0;s:5:"title";s:16:"微官网-文章";s:3:"url";s:27:"./index.php?c=site&a=multi&";s:15:"permission_name";s:13:"platform_site";s:4:"icon";s:10:"wi wi-home";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:4:{s:19:"platform_site_multi";a:4:{s:5:"title";s:9:"微官网";s:3:"url";s:38:"./index.php?c=site&a=multi&do=display&";s:15:"permission_name";s:19:"platform_site_multi";s:6:"active";s:5:"multi";}s:19:"platform_site_style";a:4:{s:5:"title";s:15:"微官网模板";s:3:"url";s:39:"./index.php?c=site&a=style&do=template&";s:15:"permission_name";s:19:"platform_site_style";s:6:"active";s:5:"style";}s:21:"platform_site_article";a:4:{s:5:"title";s:12:"文章管理";s:3:"url";s:40:"./index.php?c=site&a=article&do=display&";s:15:"permission_name";s:21:"platform_site_article";s:6:"active";s:7:"article";}s:22:"platform_site_category";a:4:{s:5:"title";s:18:"文章分类管理";s:3:"url";s:41:"./index.php?c=site&a=category&do=display&";s:15:"permission_name";s:22:"platform_site_category";s:6:"active";s:8:"category";}}}}s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;}s:15:"platform_module";a:3:{s:5:"title";s:12:"应用模块";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:2:"mc";a:4:{s:5:"title";s:6:"粉丝";s:4:"menu";a:3:{s:7:"mc_fans";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;s:5:"title";s:12:"粉丝管理";s:3:"url";s:24:"./index.php?c=mc&a=fans&";s:15:"permission_name";s:7:"mc_fans";s:4:"icon";s:16:"wi wi-fansmanage";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:2:{s:15:"mc_fans_display";a:4:{s:5:"title";s:12:"全部粉丝";s:3:"url";s:35:"./index.php?c=mc&a=fans&do=display&";s:15:"permission_name";s:15:"mc_fans_display";s:6:"active";s:7:"display";}s:21:"mc_fans_fans_sync_set";a:4:{s:5:"title";s:18:"粉丝同步设置";s:3:"url";s:41:"./index.php?c=mc&a=fans&do=fans_sync_set&";s:15:"permission_name";s:21:"mc_fans_fans_sync_set";s:6:"active";s:13:"fans_sync_set";}}}s:9:"mc_member";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}s:10:"is_display";i:0;s:5:"title";s:12:"会员管理";s:3:"url";s:26:"./index.php?c=mc&a=member&";s:15:"permission_name";s:9:"mc_member";s:4:"icon";s:10:"wi wi-fans";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:7:{s:17:"mc_member_diaplsy";a:4:{s:5:"title";s:12:"会员管理";s:3:"url";s:37:"./index.php?c=mc&a=member&do=display&";s:15:"permission_name";s:17:"mc_member_diaplsy";s:6:"active";s:7:"display";}s:15:"mc_member_group";a:4:{s:5:"title";s:9:"会员组";s:3:"url";s:36:"./index.php?c=mc&a=group&do=display&";s:15:"permission_name";s:15:"mc_member_group";s:6:"active";s:7:"display";}s:12:"mc_member_uc";a:5:{s:5:"title";s:12:"会员中心";s:3:"url";s:34:"./index.php?c=site&a=editor&do=uc&";s:15:"permission_name";s:12:"mc_member_uc";s:6:"active";s:2:"uc";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:19:"mc_member_quickmenu";a:5:{s:5:"title";s:12:"快捷菜单";s:3:"url";s:41:"./index.php?c=site&a=editor&do=quickmenu&";s:15:"permission_name";s:19:"mc_member_quickmenu";s:6:"active";s:9:"quickmenu";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:25:"mc_member_register_seting";a:5:{s:5:"title";s:12:"注册设置";s:3:"url";s:46:"./index.php?c=mc&a=member&do=register_setting&";s:15:"permission_name";s:25:"mc_member_register_seting";s:6:"active";s:16:"register_setting";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:24:"mc_member_credit_setting";a:4:{s:5:"title";s:12:"积分设置";s:3:"url";s:44:"./index.php?c=mc&a=member&do=credit_setting&";s:15:"permission_name";s:24:"mc_member_credit_setting";s:6:"active";s:14:"credit_setting";}s:16:"mc_member_fields";a:4:{s:5:"title";s:18:"会员字段管理";s:3:"url";s:34:"./index.php?c=mc&a=fields&do=list&";s:15:"permission_name";s:16:"mc_member_fields";s:6:"active";s:4:"list";}}}s:10:"mc_message";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;s:5:"title";s:12:"留言管理";s:3:"url";s:27:"./index.php?c=mc&a=message&";s:15:"permission_name";s:10:"mc_message";s:4:"icon";s:13:"wi wi-message";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:18:"permission_display";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}s:10:"is_display";i:0;}s:7:"profile";a:4:{s:5:"title";s:6:"配置";s:4:"menu";a:7:{s:15:"profile_setting";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}s:10:"is_display";i:0;s:5:"title";s:12:"参数配置";s:3:"url";s:31:"./index.php?c=profile&a=remote&";s:15:"permission_name";s:15:"profile_setting";s:4:"icon";s:23:"wi wi-parameter-setting";s:12:"displayorder";i:7;s:2:"id";N;s:14:"sub_permission";a:6:{s:22:"profile_setting_remote";a:4:{s:5:"title";s:12:"远程附件";s:3:"url";s:42:"./index.php?c=profile&a=remote&do=display&";s:15:"permission_name";s:22:"profile_setting_remote";s:6:"active";s:7:"display";}s:24:"profile_setting_passport";a:5:{s:5:"title";s:12:"借用权限";s:3:"url";s:42:"./index.php?c=profile&a=passport&do=oauth&";s:15:"permission_name";s:24:"profile_setting_passport";s:6:"active";s:5:"oauth";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:25:"profile_setting_tplnotice";a:5:{s:5:"title";s:18:"微信通知设置";s:3:"url";s:42:"./index.php?c=profile&a=tplnotice&do=list&";s:15:"permission_name";s:25:"profile_setting_tplnotice";s:6:"active";s:4:"list";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:22:"profile_setting_notify";a:5:{s:5:"title";s:18:"邮件通知参数";s:3:"url";s:39:"./index.php?c=profile&a=notify&do=mail&";s:15:"permission_name";s:22:"profile_setting_notify";s:6:"active";s:4:"mail";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:26:"profile_setting_uc_setting";a:5:{s:5:"title";s:14:"UC站点整合";s:3:"url";s:45:"./index.php?c=profile&a=common&do=uc_setting&";s:15:"permission_name";s:26:"profile_setting_uc_setting";s:6:"active";s:10:"uc_setting";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:27:"profile_setting_upload_file";a:5:{s:5:"title";s:20:"上传JS接口文件";s:3:"url";s:46:"./index.php?c=profile&a=common&do=upload_file&";s:15:"permission_name";s:27:"profile_setting_upload_file";s:6:"active";s:11:"upload_file";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}}}s:15:"profile_payment";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:2:{i:0;i:1;i:1;i:3;}s:10:"is_display";i:0;s:5:"title";s:12:"支付参数";s:3:"url";s:32:"./index.php?c=profile&a=payment&";s:15:"permission_name";s:15:"profile_payment";s:4:"icon";s:17:"wi wi-pay-setting";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";a:2:{s:19:"profile_payment_pay";a:4:{s:5:"title";s:12:"支付配置";s:3:"url";s:32:"./index.php?c=profile&a=payment&";s:15:"permission_name";s:19:"profile_payment_pay";s:6:"active";s:7:"payment";}s:22:"profile_payment_refund";a:4:{s:5:"title";s:12:"退款配置";s:3:"url";s:42:"./index.php?c=profile&a=refund&do=display&";s:15:"permission_name";s:22:"profile_payment_refund";s:6:"active";s:6:"refund";}}}s:23:"profile_app_module_link";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;s:5:"title";s:12:"数据同步";s:3:"url";s:44:"./index.php?c=profile&a=module-link-uniacid&";s:15:"permission_name";s:31:"profile_app_module_link_uniacid";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:19:"profile_bind_domain";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;s:5:"title";s:12:"域名绑定";s:3:"url";s:36:"./index.php?c=profile&a=bind-domain&";s:15:"permission_name";s:19:"profile_bind_domain";s:4:"icon";s:17:"wi wi-bind-domain";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:18:"webapp_module_link";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:1:{i:0;i:5;}s:10:"is_display";i:0;s:5:"title";s:12:"数据同步";s:3:"url";s:44:"./index.php?c=profile&a=module-link-uniacid&";s:15:"permission_name";s:18:"webapp_module_link";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:14:"webapp_rewrite";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:1:{i:0;i:5;}s:10:"is_display";i:0;s:5:"title";s:9:"伪静态";s:3:"url";s:31:"./index.php?c=webapp&a=rewrite&";s:15:"permission_name";s:14:"webapp_rewrite";s:4:"icon";s:13:"wi wi-rewrite";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:18:"webapp_bind_domain";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:1:{i:0;i:5;}s:10:"is_display";i:0;s:5:"title";s:18:"域名访问设置";s:3:"url";s:35:"./index.php?c=webapp&a=bind-domain&";s:15:"permission_name";s:18:"webapp_bind_domain";s:4:"icon";s:17:"wi wi-bind-domain";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:18:"permission_display";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}s:10:"is_display";i:0;}s:10:"statistics";a:4:{s:5:"title";s:6:"统计";s:4:"menu";a:2:{s:16:"statistics_visit";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}s:10:"is_display";i:0;s:5:"title";s:12:"访问统计";s:3:"url";s:31:"./index.php?c=statistics&a=app&";s:15:"permission_name";s:16:"statistics_visit";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:3:{s:20:"statistics_visit_app";a:4:{s:5:"title";s:24:"app端访问统计信息";s:3:"url";s:42:"./index.php?c=statistics&a=app&do=display&";s:15:"permission_name";s:20:"statistics_visit_app";s:6:"active";s:3:"app";}s:21:"statistics_visit_site";a:4:{s:5:"title";s:24:"所有用户访问统计";s:3:"url";s:51:"./index.php?c=statistics&a=site&do=current_account&";s:15:"permission_name";s:21:"statistics_visit_site";s:6:"active";s:4:"site";}s:24:"statistics_visit_setting";a:4:{s:5:"title";s:18:"访问统计设置";s:3:"url";s:46:"./index.php?c=statistics&a=setting&do=display&";s:15:"permission_name";s:24:"statistics_visit_setting";s:6:"active";s:7:"setting";}}}s:15:"statistics_fans";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;s:5:"title";s:12:"用户统计";s:3:"url";s:32:"./index.php?c=statistics&a=fans&";s:15:"permission_name";s:15:"statistics_fans";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:18:"permission_display";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}s:10:"is_display";i:0;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:13;}s:5:"wxapp";a:8:{s:5:"title";s:15:"微信小程序";s:4:"icon";s:19:"wi wi-small-routine";s:9:"dimension";i:3;s:3:"url";s:38:"./index.php?c=wxapp&a=display&do=home&";s:7:"section";a:5:{s:14:"wxapp_entrance";a:4:{s:5:"title";s:15:"小程序入口";s:4:"menu";a:1:{s:20:"module_entrance_link";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:"is_display";i:0;s:5:"title";s:12:"入口页面";s:3:"url";s:36:"./index.php?c=wxapp&a=entrance-link&";s:15:"permission_name";s:19:"wxapp_entrance_link";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:18:"permission_display";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:"is_display";i:0;}s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:2:"mc";a:4:{s:5:"title";s:6:"粉丝";s:4:"menu";a:1:{s:9:"mc_member";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:"is_display";i:0;s:5:"title";s:6:"会员";s:3:"url";s:26:"./index.php?c=mc&a=member&";s:15:"permission_name";s:15:"mc_wxapp_member";s:4:"icon";s:10:"wi wi-fans";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:4:{s:17:"mc_member_diaplsy";a:4:{s:5:"title";s:12:"会员管理";s:3:"url";s:37:"./index.php?c=mc&a=member&do=display&";s:15:"permission_name";s:17:"mc_member_diaplsy";s:6:"active";s:7:"display";}s:15:"mc_member_group";a:4:{s:5:"title";s:9:"会员组";s:3:"url";s:36:"./index.php?c=mc&a=group&do=display&";s:15:"permission_name";s:15:"mc_member_group";s:6:"active";s:7:"display";}s:24:"mc_member_credit_setting";a:4:{s:5:"title";s:12:"积分设置";s:3:"url";s:44:"./index.php?c=mc&a=member&do=credit_setting&";s:15:"permission_name";s:24:"mc_member_credit_setting";s:6:"active";s:14:"credit_setting";}s:16:"mc_member_fields";a:4:{s:5:"title";s:18:"会员字段管理";s:3:"url";s:34:"./index.php?c=mc&a=fields&do=list&";s:15:"permission_name";s:16:"mc_member_fields";s:6:"active";s:4:"list";}}}}s:18:"permission_display";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:"is_display";i:0;}s:13:"wxapp_profile";a:3:{s:5:"title";s:6:"配置";s:4:"menu";a:5:{s:33:"wxapp_profile_module_link_uniacid";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:"is_display";i:0;s:5:"title";s:12:"数据同步";s:3:"url";s:42:"./index.php?c=wxapp&a=module-link-uniacid&";s:15:"permission_name";s:33:"wxapp_profile_module_link_uniacid";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";N;}s:21:"wxapp_profile_payment";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:"is_display";i:0;s:5:"title";s:12:"支付参数";s:3:"url";s:30:"./index.php?c=wxapp&a=payment&";s:15:"permission_name";s:21:"wxapp_profile_payment";s:4:"icon";s:16:"wi wi-appsetting";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";a:2:{s:17:"wxapp_payment_pay";a:4:{s:5:"title";s:12:"支付参数";s:3:"url";s:41:"./index.php?c=wxapp&a=payment&do=display&";s:15:"permission_name";s:17:"wxapp_payment_pay";s:6:"active";s:7:"payment";}s:20:"wxapp_payment_refund";a:4:{s:5:"title";s:12:"退款配置";s:3:"url";s:40:"./index.php?c=wxapp&a=refund&do=display&";s:15:"permission_name";s:20:"wxapp_payment_refund";s:6:"active";s:6:"refund";}}}s:28:"wxapp_profile_front_download";a:10:{s:9:"is_system";i:1;s:18:"permission_display";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"下载程序包";s:3:"url";s:37:"./index.php?c=wxapp&a=front-download&";s:15:"permission_name";s:28:"wxapp_profile_front_download";s:4:"icon";s:13:"wi wi-examine";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:23:"wxapp_profile_domainset";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:"is_display";i:0;s:5:"title";s:12:"域名设置";s:3:"url";s:32:"./index.php?c=wxapp&a=domainset&";s:15:"permission_name";s:23:"wxapp_profile_domainset";s:4:"icon";s:13:"wi wi-examine";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:22:"profile_setting_remote";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:"is_display";i:0;s:5:"title";s:12:"参数配置";s:3:"url";s:31:"./index.php?c=profile&a=remote&";s:15:"permission_name";s:22:"profile_setting_remote";s:4:"icon";s:23:"wi wi-parameter-setting";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}}s:18:"permission_display";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}}s:10:"statistics";a:4:{s:5:"title";s:6:"统计";s:4:"menu";a:1:{s:16:"statistics_visit";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:"is_display";i:0;s:5:"title";s:12:"访问统计";s:3:"url";s:31:"./index.php?c=statistics&a=app&";s:15:"permission_name";s:22:"statistics_visit_wxapp";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:3:{s:20:"statistics_visit_app";a:4:{s:5:"title";s:24:"app端访问统计信息";s:3:"url";s:42:"./index.php?c=statistics&a=app&do=display&";s:15:"permission_name";s:20:"statistics_visit_app";s:6:"active";s:3:"app";}s:21:"statistics_visit_site";a:4:{s:5:"title";s:24:"所有用户访问统计";s:3:"url";s:51:"./index.php?c=statistics&a=site&do=current_account&";s:15:"permission_name";s:21:"statistics_visit_site";s:6:"active";s:4:"site";}s:24:"statistics_visit_setting";a:4:{s:5:"title";s:18:"访问统计设置";s:3:"url";s:46:"./index.php?c=statistics&a=setting&do=display&";s:15:"permission_name";s:24:"statistics_visit_setting";s:6:"active";s:7:"setting";}}}}s:18:"permission_display";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:"is_display";i:0;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:14;}s:6:"webapp";a:7:{s:5:"title";s:2:"PC";s:4:"icon";s:8:"wi wi-pc";s:3:"url";s:39:"./index.php?c=webapp&a=home&do=display&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:15;}s:5:"xzapp";a:7:{s:5:"title";s:9:"熊掌号";s:4:"icon";s:11:"wi wi-xzapp";s:3:"url";s:38:"./index.php?c=xzapp&a=home&do=display&";s:7:"section";a:1:{s:15:"platform_module";a:3:{s:5:"title";s:12:"应用模块";s:4:"menu";a:0:{}s:10:"is_display";b:1;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:16;}s:6:"aliapp";a:7:{s:5:"title";s:18:"支付宝小程序";s:4:"icon";s:12:"wi wi-aliapp";s:3:"url";s:40:"./index.php?c=miniapp&a=display&do=home&";s:7:"section";a:1:{s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:17;}s:8:"baiduapp";a:7:{s:5:"title";s:15:"百度小程序";s:4:"icon";s:14:"wi wi-baiduapp";s:3:"url";s:40:"./index.php?c=miniapp&a=display&do=home&";s:7:"section";a:1:{s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:18;}s:10:"toutiaoapp";a:7:{s:5:"title";s:15:"头条小程序";s:4:"icon";s:16:"wi wi-toutiaoapp";s:3:"url";s:40:"./index.php?c=miniapp&a=display&do=home&";s:7:"section";a:1:{s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:19;}s:5:"store";a:7:{s:5:"title";s:6:"商城";s:4:"icon";s:11:"wi wi-store";s:3:"url";s:43:"./index.php?c=home&a=welcome&do=ext&m=store";s:7:"section";a:7:{s:11:"store_goods";a:2:{s:5:"title";s:12:"商品分类";s:4:"menu";a:6:{s:18:"store_goods_module";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"应用模块";s:3:"url";s:69:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=module";s:15:"permission_name";s:18:"store_goods_module";s:4:"icon";s:11:"wi wi-apply";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";N;}s:19:"store_goods_account";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"平台个数";s:3:"url";s:74:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=account_num";s:15:"permission_name";s:19:"store_goods_account";s:4:"icon";s:13:"wi wi-account";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:25:"store_goods_account_renew";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"平台续费";s:3:"url";s:68:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=renew";s:15:"permission_name";s:25:"store_goods_account_renew";s:4:"icon";s:21:"wi wi-appjurisdiction";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:19:"store_goods_package";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"应用权限组";s:3:"url";s:64:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=5";s:15:"permission_name";s:19:"store_goods_package";s:4:"icon";s:21:"wi wi-appjurisdiction";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:25:"store_goods_users_package";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"用户权限组";s:3:"url";s:64:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=9";s:15:"permission_name";s:25:"store_goods_users_package";s:4:"icon";s:22:"wi wi-userjurisdiction";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:15:"store_goods_api";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:23:"应用访问流量(API)";s:3:"url";s:64:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=6";s:15:"permission_name";s:15:"store_goods_api";s:4:"icon";s:9:"wi wi-api";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:16:"store_wish_goods";a:2:{s:5:"title";s:12:"预购应用";s:4:"menu";a:2:{s:21:"store_wish_goods_list";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"应用列表";s:3:"url";s:84:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=module_wish&is_wish=1";s:15:"permission_name";s:21:"store_wish_goods_list";s:4:"icon";s:11:"wi wi-apply";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:21:"store_wish_goods_edit";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:19:"添加/设置应用";s:3:"url";s:82:"./index.php?c=site&a=entry&do=wishgoodsEdit&m=store&direct=1&op=wishgoods&status=1";s:15:"permission_name";s:21:"store_wish_goods_edit";s:4:"icon";s:15:"wi wi-goods-add";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:12:"store_manage";a:3:{s:5:"title";s:12:"商城管理";s:7:"founder";b:1;s:4:"menu";a:4:{s:18:"store_manage_goods";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"添加商品";s:3:"url";s:58:"./index.php?c=site&a=entry&do=goodsSeller&m=store&direct=1";s:15:"permission_name";s:18:"store_manage_goods";s:4:"icon";s:15:"wi wi-goods-add";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:20:"store_manage_setting";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"商城设置";s:3:"url";s:54:"./index.php?c=site&a=entry&do=setting&m=store&direct=1";s:15:"permission_name";s:20:"store_manage_setting";s:4:"icon";s:11:"wi wi-store";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:19:"store_manage_payset";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"支付设置";s:3:"url";s:57:"./index.php?c=site&a=entry&do=paySetting&m=store&direct=1";s:15:"permission_name";s:19:"store_manage_payset";s:4:"icon";s:11:"wi wi-money";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:23:"store_manage_permission";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"商城访问权限";s:3:"url";s:57:"./index.php?c=site&a=entry&do=permission&m=store&direct=1";s:15:"permission_name";s:23:"store_manage_permission";s:4:"icon";s:15:"wi wi-blacklist";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:12:"store_orders";a:2:{s:5:"title";s:12:"订单管理";s:4:"menu";a:2:{s:15:"store_orders_my";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"我的订单";s:3:"url";s:53:"./index.php?c=site&a=entry&do=orders&m=store&direct=1";s:15:"permission_name";s:15:"store_orders_my";s:4:"icon";s:17:"wi wi-sale-record";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:17:"store_cash_orders";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"分销订单";s:3:"url";s:71:"./index.php?c=site&a=entry&do=cash&m=store&operate=cash_orders&direct=1";s:15:"permission_name";s:17:"store_cash_orders";s:4:"icon";s:11:"wi wi-order";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:14:"store_payments";a:2:{s:5:"title";s:12:"收入明细";s:4:"menu";a:1:{s:8:"payments";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"收入明细";s:3:"url";s:55:"./index.php?c=site&a=entry&do=payments&m=store&direct=1";s:15:"permission_name";s:8:"payments";s:4:"icon";s:17:"wi wi-sale-record";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:17:"store_cash_manage";a:2:{s:5:"title";s:12:"分销管理";s:4:"menu";a:2:{s:25:"store_manage_cash_setting";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"分销设置";s:3:"url";s:58:"./index.php?c=site&a=entry&do=cashsetting&m=store&direct=1";s:15:"permission_name";s:25:"store_manage_cash_setting";s:4:"icon";s:18:"wi wi-site-setting";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:16:"store_check_cash";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"提现审核";s:3:"url";s:73:"./index.php?c=site&a=entry&do=cash&m=store&operate=consume_order&direct=1";s:15:"permission_name";s:16:"store_check_cash";s:4:"icon";s:18:"wi wi-check-select";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:10:"store_cash";a:2:{s:5:"title";s:12:"佣金管理";s:4:"menu";a:1:{s:8:"payments";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"我的佣金";s:3:"url";s:66:"./index.php?c=site&a=entry&do=cash&m=store&operate=mycash&direct=1";s:15:"permission_name";s:8:"payments";s:4:"icon";s:10:"wi wi-list";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:20;}s:11:"custom_help";a:7:{s:5:"title";s:12:"本站帮助";s:4:"icon";s:12:"wi wi-market";s:3:"url";s:39:"./index.php?c=help&a=display&do=custom&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:21;}}');
INSERT INTO `ims_core_cache` (`key`, `value`) VALUES
('we7:user_accounts:wechats:3', 'a:0:{}'),
('we7:user_accounts:wechats:2', 'a:0:{}'),
('we7:user_accounts:wxapp:2', 'a:0:{}'),
('we7:user_accounts:webapp:2', 'a:0:{}'),
('we7:user_accounts:phoneapp:2', 'a:0:{}'),
('we7:user_accounts:xzapp:2', 'a:0:{}'),
('we7:user_accounts:aliapp:2', 'a:0:{}'),
('we7:user_accounts:baiduapp:2', 'a:0:{}'),
('we7:user_accounts:toutiaoapp:2', 'a:0:{}'),
('we7:module_setting:zjhj_mall:2', 'a:1:{s:6:"module";s:9:"zjhj_mall";}'),
('we7:site_store_buy:6:2', 'i:0;'),
('we7:module_info:zjhj_mall', 'a:36:{s:3:"mid";s:2:"15";s:4:"name";s:9:"zjhj_mall";s:4:"type";s:8:"business";s:5:"title";s:14:"禾匠商城V4";s:7:"version";s:6:"4.0.10";s:7:"ability";s:14:"禾匠商城V4";s:11:"description";s:14:"禾匠商城V4";s:6:"author";s:12:"懒人源码";s:3:"url";s:28:"https://www.lanrenzhijia.com";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:0:{}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";s:13:"title_initial";s:1:"H";s:13:"wxapp_support";s:1:"2";s:11:"app_support";s:1:"0";s:14:"webapp_support";s:1:"1";s:15:"welcome_support";s:1:"1";s:10:"oauth_type";s:1:"1";s:16:"phoneapp_support";s:1:"1";s:15:"account_support";s:1:"1";s:13:"xzapp_support";s:1:"1";s:14:"aliapp_support";s:1:"1";s:4:"logo";s:54:"http://localhost/xiaochengxu/addons/zjhj_mall/icon.jpg";s:16:"baiduapp_support";s:1:"1";s:18:"toutiaoapp_support";s:1:"1";s:4:"from";s:5:"local";s:9:"isdisplay";i:1;s:7:"preview";s:70:"http://localhost/xiaochengxu/addons/zjhj_mall/preview.jpg?v=1567496128";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}s:12:"recycle_info";a:0:{}}'),
('upgrade', 'a:3:{s:7:"upgrade";b:0;s:4:"data";a:5:{s:5:"errno";N;s:7:"message";s:14:"发生错误: ";s:5:"files";a:0:{}s:7:"schemas";a:0:{}s:7:"upgrade";b:0;}s:10:"lastupdate";i:1567493193;}'),
('cloud:transtoken', 's:39:"353dM1AaMtL57GCwq6HbxQ4syASbBR7cdvC2ceo";'),
('we7:uniaccount:1', 'a:21:{s:4:"acid";s:1:"1";s:7:"uniacid";s:1:"1";s:5:"token";s:32:"omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP";s:14:"encodingaeskey";s:0:"";s:5:"level";s:1:"1";s:4:"name";s:5:"efwww";s:7:"account";s:0:"";s:8:"original";s:0:"";s:9:"signature";s:0:"";s:7:"country";s:0:"";s:8:"province";s:0:"";s:4:"city";s:0:"";s:8:"username";s:0:"";s:8:"password";s:0:"";s:10:"lastupdate";s:1:"0";s:3:"key";s:0:"";s:6:"secret";s:0:"";s:7:"styleid";s:1:"1";s:12:"subscribeurl";s:0:"";s:18:"auth_refresh_token";s:0:"";s:11:"encrypt_key";s:0:"";}'),
('we7:unisetting:1', 'a:31:{s:7:"uniacid";s:1:"1";s:8:"passport";a:3:{s:8:"focusreg";i:0;s:4:"item";s:5:"email";s:4:"type";s:8:"password";}s:5:"oauth";s:0:"";s:11:"jsauth_acid";s:1:"0";s:2:"uc";a:1:{s:6:"status";i:0;}s:6:"notify";a:1:{s:3:"sms";a:2:{s:7:"balance";i:0;s:9:"signature";s:0:"";}}s:11:"creditnames";a:5:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}s:7:"credit3";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit4";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit5";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}}s:15:"creditbehaviors";a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}s:7:"welcome";s:0:"";s:7:"default";s:0:"";s:15:"default_message";s:0:"";s:7:"payment";a:4:{s:6:"credit";a:3:{s:6:"switch";b:0;s:15:"recharge_switch";b:0;s:10:"pay_switch";b:0;}s:6:"alipay";a:6:{s:6:"switch";b:0;s:7:"account";s:0:"";s:7:"partner";s:0:"";s:6:"secret";s:0:"";s:15:"recharge_switch";b:0;s:10:"pay_switch";b:0;}s:6:"wechat";a:7:{s:6:"switch";b:0;s:7:"account";b:0;s:7:"signkey";s:0:"";s:7:"partner";s:0:"";s:3:"key";s:0:"";s:15:"recharge_switch";b:0;s:10:"pay_switch";b:0;}s:8:"delivery";a:3:{s:6:"switch";b:0;s:15:"recharge_switch";b:0;s:10:"pay_switch";b:0;}}s:4:"stat";s:0:"";s:12:"default_site";s:1:"1";s:4:"sync";s:1:"0";s:8:"recharge";s:0:"";s:9:"tplnotice";s:0:"";s:10:"grouplevel";s:1:"0";s:8:"mcplugin";s:0:"";s:15:"exchange_enable";s:1:"0";s:11:"coupon_type";s:1:"0";s:7:"menuset";s:0:"";s:10:"statistics";s:0:"";s:11:"bind_domain";s:0:"";s:14:"comment_status";s:1:"0";s:13:"reply_setting";s:1:"0";s:14:"default_module";s:0:"";s:16:"attachment_limit";N;s:15:"attachment_size";N;s:11:"sync_member";s:1:"0";s:6:"remote";s:0:"";}');
INSERT INTO `ims_core_cache` (`key`, `value`) VALUES
('we7:system_frame:1', 'a:21:{s:8:"phoneapp";a:7:{s:5:"title";s:3:"APP";s:4:"icon";s:18:"wi wi-white-collar";s:3:"url";s:41:"./index.php?c=phoneapp&a=display&do=home&";s:7:"section";a:2:{s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:16:"phoneapp_profile";a:4:{s:5:"title";s:6:"配置";s:4:"menu";a:2:{s:28:"profile_phoneapp_module_link";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:1:{i:0;i:6;}s:10:"is_display";i:0;s:5:"title";s:12:"数据同步";s:3:"url";s:42:"./index.php?c=wxapp&a=module-link-uniacid&";s:15:"permission_name";s:28:"profile_phoneapp_module_link";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:14:"front_download";a:10:{s:9:"is_system";i:1;s:18:"permission_display";b:1;s:10:"is_display";i:1;s:5:"title";s:9:"下载APP";s:3:"url";s:40:"./index.php?c=phoneapp&a=front-download&";s:15:"permission_name";s:23:"phoneapp_front_download";s:4:"icon";s:13:"wi wi-examine";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:10:"is_display";b:1;s:18:"permission_display";a:1:{i:0;i:6;}}}s:9:"is_system";b:1;s:10:"is_display";b:0;s:12:"displayorder";i:0;}s:7:"welcome";a:7:{s:5:"title";s:6:"首页";s:4:"icon";s:10:"wi wi-home";s:3:"url";s:48:"./index.php?c=home&a=welcome&do=system&page=home";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:2;}s:8:"platform";a:8:{s:5:"title";s:12:"平台入口";s:4:"icon";s:14:"wi wi-platform";s:9:"dimension";i:2;s:3:"url";s:44:"./index.php?c=account&a=display&do=platform&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:3;}s:6:"module";a:8:{s:5:"title";s:12:"应用入口";s:4:"icon";s:11:"wi wi-apply";s:9:"dimension";i:2;s:3:"url";s:53:"./index.php?c=module&a=display&do=switch_last_module&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:4;}s:14:"account_manage";a:8:{s:5:"title";s:12:"平台管理";s:4:"icon";s:21:"wi wi-platform-manage";s:9:"dimension";i:2;s:3:"url";s:31:"./index.php?c=account&a=manage&";s:7:"section";a:1:{s:14:"account_manage";a:2:{s:5:"title";s:12:"平台管理";s:4:"menu";a:4:{s:22:"account_manage_display";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"平台列表";s:3:"url";s:31:"./index.php?c=account&a=manage&";s:15:"permission_name";s:22:"account_manage_display";s:4:"icon";N;s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";a:1:{i:0;a:2:{s:5:"title";s:12:"帐号停用";s:15:"permission_name";s:19:"account_manage_stop";}}}s:22:"account_manage_recycle";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:9:"回收站";s:3:"url";s:32:"./index.php?c=account&a=recycle&";s:15:"permission_name";s:22:"account_manage_recycle";s:4:"icon";N;s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:2:{i:0;a:2:{s:5:"title";s:12:"帐号删除";s:15:"permission_name";s:21:"account_manage_delete";}i:1;a:2:{s:5:"title";s:12:"帐号恢复";s:15:"permission_name";s:22:"account_manage_recover";}}}s:30:"account_manage_system_platform";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:19:" 微信开放平台";s:3:"url";s:32:"./index.php?c=system&a=platform&";s:15:"permission_name";s:30:"account_manage_system_platform";s:4:"icon";N;s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:30:"account_manage_expired_message";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:22:" 自定义到期提示";s:3:"url";s:40:"./index.php?c=account&a=expired-message&";s:15:"permission_name";s:30:"account_manage_expired_message";s:4:"icon";N;s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:5;}s:13:"module_manage";a:8:{s:5:"title";s:12:"应用管理";s:4:"icon";s:19:"wi wi-module-manage";s:9:"dimension";i:2;s:3:"url";s:50:"./index.php?c=module&a=manage-system&do=installed&";s:7:"section";a:1:{s:13:"module_manage";a:2:{s:5:"title";s:12:"应用管理";s:4:"menu";a:5:{s:23:"module_manage_installed";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"已安装列表";s:3:"url";s:50:"./index.php?c=module&a=manage-system&do=installed&";s:15:"permission_name";s:23:"module_manage_installed";s:4:"icon";N;s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:20:"module_manage_stoped";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"已停用列表";s:3:"url";s:54:"./index.php?c=module&a=manage-system&do=recycle&type=1";s:15:"permission_name";s:20:"module_manage_stoped";s:4:"icon";N;s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:27:"module_manage_not_installed";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"未安装列表";s:3:"url";s:54:"./index.php?c=module&a=manage-system&do=not_installed&";s:15:"permission_name";s:27:"module_manage_not_installed";s:4:"icon";N;s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:21:"module_manage_recycle";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:9:"回收站";s:3:"url";s:54:"./index.php?c=module&a=manage-system&do=recycle&type=2";s:15:"permission_name";s:21:"module_manage_recycle";s:4:"icon";N;s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:23:"module_manage_subscribe";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"订阅管理";s:3:"url";s:50:"./index.php?c=module&a=manage-system&do=subscribe&";s:15:"permission_name";s:23:"module_manage_subscribe";s:4:"icon";N;s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:0:{}}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:6;}s:11:"user_manage";a:8:{s:5:"title";s:12:"用户管理";s:4:"icon";s:16:"wi wi-user-group";s:9:"dimension";i:2;s:3:"url";s:29:"./index.php?c=user&a=display&";s:7:"section";a:1:{s:11:"user_manage";a:2:{s:5:"title";s:12:"用户管理";s:4:"menu";a:7:{s:19:"user_manage_display";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"普通用户";s:3:"url";s:29:"./index.php?c=user&a=display&";s:15:"permission_name";s:19:"user_manage_display";s:4:"icon";N;s:12:"displayorder";i:7;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:19:"user_manage_founder";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:9:"副站长";s:3:"url";s:32:"./index.php?c=founder&a=display&";s:15:"permission_name";s:19:"user_manage_founder";s:4:"icon";N;s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:17:"user_manage_clerk";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"店员管理";s:3:"url";s:39:"./index.php?c=user&a=display&type=clerk";s:15:"permission_name";s:17:"user_manage_clerk";s:4:"icon";N;s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:17:"user_manage_check";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"审核用户";s:3:"url";s:39:"./index.php?c=user&a=display&type=check";s:15:"permission_name";s:17:"user_manage_check";s:4:"icon";N;s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:19:"user_manage_recycle";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:9:"回收站";s:3:"url";s:41:"./index.php?c=user&a=display&type=recycle";s:15:"permission_name";s:19:"user_manage_recycle";s:4:"icon";N;s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:18:"user_manage_fields";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"用户属性设置";s:3:"url";s:39:"./index.php?c=user&a=fields&do=display&";s:15:"permission_name";s:18:"user_manage_fields";s:4:"icon";N;s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:18:"user_manage_expire";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"用户过期设置";s:3:"url";s:28:"./index.php?c=user&a=expire&";s:15:"permission_name";s:18:"user_manage_expire";s:4:"icon";N;s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:0:{}}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:7;}s:10:"permission";a:8:{s:5:"title";s:9:"权限组";s:4:"icon";s:22:"wi wi-userjurisdiction";s:9:"dimension";i:2;s:3:"url";s:29:"./index.php?c=module&a=group&";s:7:"section";a:1:{s:10:"permission";a:2:{s:5:"title";s:9:"权限组";s:4:"menu";a:4:{s:23:"permission_module_group";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"应用权限组";s:3:"url";s:29:"./index.php?c=module&a=group&";s:15:"permission_name";s:23:"permission_module_group";s:4:"icon";N;s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:31:"permission_create_account_group";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"账号权限组";s:3:"url";s:34:"./index.php?c=user&a=create-group&";s:15:"permission_name";s:31:"permission_create_account_group";s:4:"icon";N;s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:21:"permission_user_group";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"用户权限组合";s:3:"url";s:27:"./index.php?c=user&a=group&";s:15:"permission_name";s:21:"permission_user_group";s:4:"icon";N;s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:24:"permission_founder_group";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:21:"副站长权限组合";s:3:"url";s:30:"./index.php?c=founder&a=group&";s:15:"permission_name";s:24:"permission_founder_group";s:4:"icon";N;s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:0:{}}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:8;}s:6:"system";a:8:{s:5:"title";s:12:"系统功能";s:4:"icon";s:13:"wi wi-setting";s:9:"dimension";i:3;s:3:"url";s:31:"./index.php?c=article&a=notice&";s:7:"section";a:5:{s:7:"article";a:3:{s:5:"title";s:12:"站内公告";s:4:"menu";a:1:{s:14:"system_article";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"站内公告";s:3:"url";s:31:"./index.php?c=article&a=notice&";s:15:"permission_name";s:14:"system_article";s:4:"icon";s:13:"wi wi-article";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:2:{i:0;a:2:{s:5:"title";s:12:"公告列表";s:15:"permission_name";s:26:"system_article_notice_list";}i:1;a:2:{s:5:"title";s:12:"公告分类";s:15:"permission_name";s:30:"system_article_notice_category";}}}}s:7:"founder";b:1;}s:15:"system_template";a:3:{s:5:"title";s:6:"模板";s:4:"menu";a:1:{s:15:"system_template";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"微官网模板";s:3:"url";s:32:"./index.php?c=system&a=template&";s:15:"permission_name";s:15:"system_template";s:4:"icon";s:17:"wi wi-wx-template";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:7:"founder";b:1;}s:14:"system_welcome";a:3:{s:5:"title";s:12:"系统首页";s:4:"menu";a:2:{s:14:"system_welcome";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"系统首页应用";s:3:"url";s:60:"./index.php?c=module&a=manage-system&support=welcome_support";s:15:"permission_name";s:14:"system_welcome";s:4:"icon";s:20:"wi wi-system-welcome";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:11:"system_news";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"系统新闻";s:3:"url";s:29:"./index.php?c=article&a=news&";s:15:"permission_name";s:11:"system_news";s:4:"icon";s:13:"wi wi-article";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:2:{i:0;a:2:{s:5:"title";s:13:"新闻列表 ";s:15:"permission_name";s:24:"system_article_news_list";}i:1;a:2:{s:5:"title";s:13:"新闻分类 ";s:15:"permission_name";s:28:"system_article_news_category";}}}}s:7:"founder";b:1;}s:17:"system_statistics";a:3:{s:5:"title";s:6:"统计";s:4:"menu";a:1:{s:23:"system_account_analysis";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"访问统计";s:3:"url";s:35:"./index.php?c=statistics&a=account&";s:15:"permission_name";s:23:"system_account_analysis";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:7:"founder";b:1;}s:5:"cache";a:2:{s:5:"title";s:6:"缓存";s:4:"menu";a:1:{s:26:"system_setting_updatecache";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"更新缓存";s:3:"url";s:35:"./index.php?c=system&a=updatecache&";s:15:"permission_name";s:26:"system_setting_updatecache";s:4:"icon";s:12:"wi wi-update";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:9;}s:4:"site";a:9:{s:5:"title";s:12:"站点设置";s:4:"icon";s:17:"wi wi-system-site";s:9:"dimension";i:3;s:3:"url";s:28:"./index.php?c=system&a=site&";s:7:"section";a:4:{s:5:"cloud";a:2:{s:5:"title";s:9:"云服务";s:4:"menu";a:3:{s:14:"system_profile";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"系统升级";s:3:"url";s:30:"./index.php?c=cloud&a=upgrade&";s:15:"permission_name";s:20:"system_cloud_upgrade";s:4:"icon";s:11:"wi wi-cache";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:21:"system_cloud_register";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"注册站点";s:3:"url";s:30:"./index.php?c=cloud&a=profile&";s:15:"permission_name";s:21:"system_cloud_register";s:4:"icon";s:18:"wi wi-registersite";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:21:"system_cloud_diagnose";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"云服务诊断";s:3:"url";s:31:"./index.php?c=cloud&a=diagnose&";s:15:"permission_name";s:21:"system_cloud_diagnose";s:4:"icon";s:14:"wi wi-diagnose";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"setting";a:2:{s:5:"title";s:6:"设置";s:4:"menu";a:9:{s:19:"system_setting_site";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"站点设置";s:3:"url";s:28:"./index.php?c=system&a=site&";s:15:"permission_name";s:19:"system_setting_site";s:4:"icon";s:18:"wi wi-site-setting";s:12:"displayorder";i:9;s:2:"id";N;s:14:"sub_permission";N;}s:19:"system_setting_menu";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"菜单设置";s:3:"url";s:28:"./index.php?c=system&a=menu&";s:15:"permission_name";s:19:"system_setting_menu";s:4:"icon";s:18:"wi wi-menu-setting";s:12:"displayorder";i:8;s:2:"id";N;s:14:"sub_permission";N;}s:25:"system_setting_attachment";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"附件设置";s:3:"url";s:34:"./index.php?c=system&a=attachment&";s:15:"permission_name";s:25:"system_setting_attachment";s:4:"icon";s:16:"wi wi-attachment";s:12:"displayorder";i:7;s:2:"id";N;s:14:"sub_permission";N;}s:25:"system_setting_systeminfo";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"系统信息";s:3:"url";s:34:"./index.php?c=system&a=systeminfo&";s:15:"permission_name";s:25:"system_setting_systeminfo";s:4:"icon";s:17:"wi wi-system-info";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";N;}s:19:"system_setting_logs";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"查看日志";s:3:"url";s:28:"./index.php?c=system&a=logs&";s:15:"permission_name";s:19:"system_setting_logs";s:4:"icon";s:9:"wi wi-log";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:26:"system_setting_ipwhitelist";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:11:"IP白名单";s:3:"url";s:35:"./index.php?c=system&a=ipwhitelist&";s:15:"permission_name";s:26:"system_setting_ipwhitelist";s:4:"icon";s:8:"wi wi-ip";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:28:"system_setting_sensitiveword";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"过滤敏感词";s:3:"url";s:37:"./index.php?c=system&a=sensitiveword&";s:15:"permission_name";s:28:"system_setting_sensitiveword";s:4:"icon";s:15:"wi wi-sensitive";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:25:"system_setting_thirdlogin";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:25:"用户登录/注册设置";s:3:"url";s:33:"./index.php?c=user&a=registerset&";s:15:"permission_name";s:25:"system_setting_thirdlogin";s:4:"icon";s:10:"wi wi-user";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:20:"system_setting_oauth";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"全局借用权限";s:3:"url";s:29:"./index.php?c=system&a=oauth&";s:15:"permission_name";s:20:"system_setting_oauth";s:4:"icon";s:11:"wi wi-oauth";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"utility";a:2:{s:5:"title";s:12:"常用工具";s:4:"menu";a:6:{s:24:"system_utility_filecheck";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"系统文件校验";s:3:"url";s:33:"./index.php?c=system&a=filecheck&";s:15:"permission_name";s:24:"system_utility_filecheck";s:4:"icon";s:10:"wi wi-file";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";N;}s:23:"system_utility_optimize";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"性能优化";s:3:"url";s:32:"./index.php?c=system&a=optimize&";s:15:"permission_name";s:23:"system_utility_optimize";s:4:"icon";s:14:"wi wi-optimize";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:23:"system_utility_database";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:9:"数据库";s:3:"url";s:32:"./index.php?c=system&a=database&";s:15:"permission_name";s:23:"system_utility_database";s:4:"icon";s:9:"wi wi-sql";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:19:"system_utility_scan";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"木马查杀";s:3:"url";s:28:"./index.php?c=system&a=scan&";s:15:"permission_name";s:19:"system_utility_scan";s:4:"icon";s:12:"wi wi-safety";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:18:"system_utility_bom";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"检测文件BOM";s:3:"url";s:27:"./index.php?c=system&a=bom&";s:15:"permission_name";s:18:"system_utility_bom";s:4:"icon";s:9:"wi wi-bom";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:20:"system_utility_check";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"系统常规检测";s:3:"url";s:29:"./index.php?c=system&a=check&";s:15:"permission_name";s:20:"system_utility_check";s:4:"icon";s:9:"wi wi-bom";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"backjob";a:2:{s:5:"title";s:12:"后台任务";s:4:"menu";a:1:{s:10:"system_job";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"后台任务";s:3:"url";s:38:"./index.php?c=system&a=job&do=display&";s:15:"permission_name";s:10:"system_job";s:4:"icon";s:9:"wi wi-job";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:7:"founder";b:1;s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:10;}s:6:"myself";a:8:{s:5:"title";s:12:"我的账户";s:4:"icon";s:10:"wi wi-bell";s:9:"dimension";i:2;s:3:"url";s:29:"./index.php?c=user&a=profile&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:11;}s:7:"message";a:8:{s:5:"title";s:12:"消息管理";s:4:"icon";s:10:"wi wi-bell";s:9:"dimension";i:2;s:3:"url";s:31:"./index.php?c=message&a=notice&";s:7:"section";a:1:{s:7:"message";a:2:{s:5:"title";s:12:"消息管理";s:4:"menu";a:3:{s:14:"message_notice";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"消息提醒";s:3:"url";s:31:"./index.php?c=message&a=notice&";s:15:"permission_name";s:14:"message_notice";s:4:"icon";N;s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:15:"message_setting";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"消息设置";s:3:"url";s:42:"./index.php?c=message&a=notice&do=setting&";s:15:"permission_name";s:15:"message_setting";s:4:"icon";N;s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:22:"message_wechat_setting";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"微信提醒设置";s:3:"url";s:49:"./index.php?c=message&a=notice&do=wechat_setting&";s:15:"permission_name";s:22:"message_wechat_setting";s:4:"icon";N;s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:12;}s:7:"account";a:8:{s:5:"title";s:9:"公众号";s:4:"icon";s:18:"wi wi-white-collar";s:9:"dimension";i:3;s:3:"url";s:41:"./index.php?c=home&a=welcome&do=platform&";s:7:"section";a:5:{s:8:"platform";a:3:{s:5:"title";s:12:"增强功能";s:4:"menu";a:6:{s:14:"platform_reply";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:1;s:5:"title";s:12:"自动回复";s:3:"url";s:31:"./index.php?c=platform&a=reply&";s:15:"permission_name";s:14:"platform_reply";s:4:"icon";s:11:"wi wi-reply";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";a:7:{s:22:"platform_reply_keyword";a:4:{s:5:"title";s:21:"关键字自动回复";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=keyword";s:15:"permission_name";s:22:"platform_reply_keyword";s:6:"active";s:7:"keyword";}s:22:"platform_reply_special";a:4:{s:5:"title";s:24:"非关键字自动回复";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=special";s:15:"permission_name";s:22:"platform_reply_special";s:6:"active";s:7:"special";}s:22:"platform_reply_welcome";a:4:{s:5:"title";s:24:"首次访问自动回复";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=welcome";s:15:"permission_name";s:22:"platform_reply_welcome";s:6:"active";s:7:"welcome";}s:22:"platform_reply_default";a:4:{s:5:"title";s:12:"默认回复";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=default";s:15:"permission_name";s:22:"platform_reply_default";s:6:"active";s:7:"default";}s:22:"platform_reply_service";a:4:{s:5:"title";s:12:"常用服务";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=service";s:15:"permission_name";s:22:"platform_reply_service";s:6:"active";s:7:"service";}s:22:"platform_reply_userapi";a:5:{s:5:"title";s:21:"自定义接口回复";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=userapi";s:15:"permission_name";s:22:"platform_reply_userapi";s:6:"active";s:7:"userapi";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:22:"platform_reply_setting";a:4:{s:5:"title";s:12:"回复设置";s:3:"url";s:38:"./index.php?c=profile&a=reply-setting&";s:15:"permission_name";s:22:"platform_reply_setting";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}}}s:13:"platform_menu";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:1;s:5:"title";s:15:"自定义菜单";s:3:"url";s:38:"./index.php?c=platform&a=menu&do=post&";s:15:"permission_name";s:13:"platform_menu";s:4:"icon";s:16:"wi wi-custommenu";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";a:2:{s:21:"platform_menu_default";a:4:{s:5:"title";s:12:"默认菜单";s:3:"url";s:38:"./index.php?c=platform&a=menu&do=post&";s:15:"permission_name";s:21:"platform_menu_default";s:6:"active";s:4:"post";}s:25:"platform_menu_conditional";a:5:{s:5:"title";s:15:"个性化菜单";s:3:"url";s:47:"./index.php?c=platform&a=menu&do=display&type=3";s:15:"permission_name";s:25:"platform_menu_conditional";s:6:"active";s:7:"display";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}}}s:11:"platform_qr";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:2:{i:0;i:1;i:1;i:3;}s:10:"is_display";i:1;s:5:"title";s:22:"二维码/转化链接";s:3:"url";s:28:"./index.php?c=platform&a=qr&";s:15:"permission_name";s:11:"platform_qr";s:4:"icon";s:12:"wi wi-qrcode";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";a:2:{s:14:"platform_qr_qr";a:4:{s:5:"title";s:9:"二维码";s:3:"url";s:36:"./index.php?c=platform&a=qr&do=list&";s:15:"permission_name";s:14:"platform_qr_qr";s:6:"active";s:4:"list";}s:22:"platform_qr_statistics";a:4:{s:5:"title";s:21:"二维码扫描统计";s:3:"url";s:39:"./index.php?c=platform&a=qr&do=display&";s:15:"permission_name";s:22:"platform_qr_statistics";s:6:"active";s:7:"display";}}}s:17:"platform_masstask";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:1;s:5:"title";s:12:"定时群发";s:3:"url";s:30:"./index.php?c=platform&a=mass&";s:15:"permission_name";s:17:"platform_masstask";s:4:"icon";s:13:"wi wi-crontab";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:2:{s:22:"platform_masstask_post";a:4:{s:5:"title";s:12:"定时群发";s:3:"url";s:38:"./index.php?c=platform&a=mass&do=post&";s:15:"permission_name";s:22:"platform_masstask_post";s:6:"active";s:4:"post";}s:22:"platform_masstask_send";a:4:{s:5:"title";s:12:"群发记录";s:3:"url";s:38:"./index.php?c=platform&a=mass&do=send&";s:15:"permission_name";s:22:"platform_masstask_send";s:6:"active";s:4:"send";}}}s:17:"platform_material";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:1;s:5:"title";s:16:"素材/编辑器";s:3:"url";s:34:"./index.php?c=platform&a=material&";s:15:"permission_name";s:17:"platform_material";s:4:"icon";s:12:"wi wi-redact";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:5:{s:22:"platform_material_news";a:4:{s:5:"title";s:6:"图文";s:3:"url";s:43:"./index.php?c=platform&a=material&type=news";s:15:"permission_name";s:22:"platform_material_news";s:6:"active";s:4:"news";}s:23:"platform_material_image";a:4:{s:5:"title";s:6:"图片";s:3:"url";s:44:"./index.php?c=platform&a=material&type=image";s:15:"permission_name";s:23:"platform_material_image";s:6:"active";s:5:"image";}s:23:"platform_material_voice";a:4:{s:5:"title";s:6:"语音";s:3:"url";s:44:"./index.php?c=platform&a=material&type=voice";s:15:"permission_name";s:23:"platform_material_voice";s:6:"active";s:5:"voice";}s:23:"platform_material_video";a:5:{s:5:"title";s:6:"视频";s:3:"url";s:44:"./index.php?c=platform&a=material&type=video";s:15:"permission_name";s:23:"platform_material_video";s:6:"active";s:5:"video";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:24:"platform_material_delete";a:3:{s:5:"title";s:6:"删除";s:15:"permission_name";s:24:"platform_material_delete";s:10:"is_display";b:0;}}}s:13:"platform_site";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:2:{i:0;i:1;i:1;i:3;}s:10:"is_display";i:1;s:5:"title";s:16:"微官网-文章";s:3:"url";s:27:"./index.php?c=site&a=multi&";s:15:"permission_name";s:13:"platform_site";s:4:"icon";s:10:"wi wi-home";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:4:{s:19:"platform_site_multi";a:4:{s:5:"title";s:9:"微官网";s:3:"url";s:38:"./index.php?c=site&a=multi&do=display&";s:15:"permission_name";s:19:"platform_site_multi";s:6:"active";s:5:"multi";}s:19:"platform_site_style";a:4:{s:5:"title";s:15:"微官网模板";s:3:"url";s:39:"./index.php?c=site&a=style&do=template&";s:15:"permission_name";s:19:"platform_site_style";s:6:"active";s:5:"style";}s:21:"platform_site_article";a:4:{s:5:"title";s:12:"文章管理";s:3:"url";s:40:"./index.php?c=site&a=article&do=display&";s:15:"permission_name";s:21:"platform_site_article";s:6:"active";s:7:"article";}s:22:"platform_site_category";a:4:{s:5:"title";s:18:"文章分类管理";s:3:"url";s:41:"./index.php?c=site&a=category&do=display&";s:15:"permission_name";s:22:"platform_site_category";s:6:"active";s:8:"category";}}}}s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}}s:15:"platform_module";a:3:{s:5:"title";s:12:"应用模块";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:2:"mc";a:3:{s:5:"title";s:6:"粉丝";s:4:"menu";a:3:{s:7:"mc_fans";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:1;s:5:"title";s:12:"粉丝管理";s:3:"url";s:24:"./index.php?c=mc&a=fans&";s:15:"permission_name";s:7:"mc_fans";s:4:"icon";s:16:"wi wi-fansmanage";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:2:{s:15:"mc_fans_display";a:4:{s:5:"title";s:12:"全部粉丝";s:3:"url";s:35:"./index.php?c=mc&a=fans&do=display&";s:15:"permission_name";s:15:"mc_fans_display";s:6:"active";s:7:"display";}s:21:"mc_fans_fans_sync_set";a:4:{s:5:"title";s:18:"粉丝同步设置";s:3:"url";s:41:"./index.php?c=mc&a=fans&do=fans_sync_set&";s:15:"permission_name";s:21:"mc_fans_fans_sync_set";s:6:"active";s:13:"fans_sync_set";}}}s:9:"mc_member";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}s:10:"is_display";i:1;s:5:"title";s:12:"会员管理";s:3:"url";s:26:"./index.php?c=mc&a=member&";s:15:"permission_name";s:9:"mc_member";s:4:"icon";s:10:"wi wi-fans";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:7:{s:17:"mc_member_diaplsy";a:4:{s:5:"title";s:12:"会员管理";s:3:"url";s:37:"./index.php?c=mc&a=member&do=display&";s:15:"permission_name";s:17:"mc_member_diaplsy";s:6:"active";s:7:"display";}s:15:"mc_member_group";a:4:{s:5:"title";s:9:"会员组";s:3:"url";s:36:"./index.php?c=mc&a=group&do=display&";s:15:"permission_name";s:15:"mc_member_group";s:6:"active";s:7:"display";}s:12:"mc_member_uc";a:5:{s:5:"title";s:12:"会员中心";s:3:"url";s:34:"./index.php?c=site&a=editor&do=uc&";s:15:"permission_name";s:12:"mc_member_uc";s:6:"active";s:2:"uc";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:19:"mc_member_quickmenu";a:5:{s:5:"title";s:12:"快捷菜单";s:3:"url";s:41:"./index.php?c=site&a=editor&do=quickmenu&";s:15:"permission_name";s:19:"mc_member_quickmenu";s:6:"active";s:9:"quickmenu";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:25:"mc_member_register_seting";a:5:{s:5:"title";s:12:"注册设置";s:3:"url";s:46:"./index.php?c=mc&a=member&do=register_setting&";s:15:"permission_name";s:25:"mc_member_register_seting";s:6:"active";s:16:"register_setting";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:24:"mc_member_credit_setting";a:4:{s:5:"title";s:12:"积分设置";s:3:"url";s:44:"./index.php?c=mc&a=member&do=credit_setting&";s:15:"permission_name";s:24:"mc_member_credit_setting";s:6:"active";s:14:"credit_setting";}s:16:"mc_member_fields";a:4:{s:5:"title";s:18:"会员字段管理";s:3:"url";s:34:"./index.php?c=mc&a=fields&do=list&";s:15:"permission_name";s:16:"mc_member_fields";s:6:"active";s:4:"list";}}}s:10:"mc_message";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:1;s:5:"title";s:12:"留言管理";s:3:"url";s:27:"./index.php?c=mc&a=message&";s:15:"permission_name";s:10:"mc_message";s:4:"icon";s:13:"wi wi-message";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:18:"permission_display";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}}s:7:"profile";a:3:{s:5:"title";s:6:"配置";s:4:"menu";a:7:{s:15:"profile_setting";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}s:10:"is_display";i:1;s:5:"title";s:12:"参数配置";s:3:"url";s:31:"./index.php?c=profile&a=remote&";s:15:"permission_name";s:15:"profile_setting";s:4:"icon";s:23:"wi wi-parameter-setting";s:12:"displayorder";i:7;s:2:"id";N;s:14:"sub_permission";a:6:{s:22:"profile_setting_remote";a:4:{s:5:"title";s:12:"远程附件";s:3:"url";s:42:"./index.php?c=profile&a=remote&do=display&";s:15:"permission_name";s:22:"profile_setting_remote";s:6:"active";s:7:"display";}s:24:"profile_setting_passport";a:5:{s:5:"title";s:12:"借用权限";s:3:"url";s:42:"./index.php?c=profile&a=passport&do=oauth&";s:15:"permission_name";s:24:"profile_setting_passport";s:6:"active";s:5:"oauth";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:25:"profile_setting_tplnotice";a:5:{s:5:"title";s:18:"微信通知设置";s:3:"url";s:42:"./index.php?c=profile&a=tplnotice&do=list&";s:15:"permission_name";s:25:"profile_setting_tplnotice";s:6:"active";s:4:"list";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:22:"profile_setting_notify";a:5:{s:5:"title";s:18:"邮件通知参数";s:3:"url";s:39:"./index.php?c=profile&a=notify&do=mail&";s:15:"permission_name";s:22:"profile_setting_notify";s:6:"active";s:4:"mail";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:26:"profile_setting_uc_setting";a:5:{s:5:"title";s:14:"UC站点整合";s:3:"url";s:45:"./index.php?c=profile&a=common&do=uc_setting&";s:15:"permission_name";s:26:"profile_setting_uc_setting";s:6:"active";s:10:"uc_setting";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:27:"profile_setting_upload_file";a:5:{s:5:"title";s:20:"上传JS接口文件";s:3:"url";s:46:"./index.php?c=profile&a=common&do=upload_file&";s:15:"permission_name";s:27:"profile_setting_upload_file";s:6:"active";s:11:"upload_file";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}}}s:15:"profile_payment";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:2:{i:0;i:1;i:1;i:3;}s:10:"is_display";i:1;s:5:"title";s:12:"支付参数";s:3:"url";s:32:"./index.php?c=profile&a=payment&";s:15:"permission_name";s:15:"profile_payment";s:4:"icon";s:17:"wi wi-pay-setting";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";a:2:{s:19:"profile_payment_pay";a:4:{s:5:"title";s:12:"支付配置";s:3:"url";s:32:"./index.php?c=profile&a=payment&";s:15:"permission_name";s:19:"profile_payment_pay";s:6:"active";s:7:"payment";}s:22:"profile_payment_refund";a:4:{s:5:"title";s:12:"退款配置";s:3:"url";s:42:"./index.php?c=profile&a=refund&do=display&";s:15:"permission_name";s:22:"profile_payment_refund";s:6:"active";s:6:"refund";}}}s:23:"profile_app_module_link";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:1;s:5:"title";s:12:"数据同步";s:3:"url";s:44:"./index.php?c=profile&a=module-link-uniacid&";s:15:"permission_name";s:31:"profile_app_module_link_uniacid";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:19:"profile_bind_domain";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:1;s:5:"title";s:12:"域名绑定";s:3:"url";s:36:"./index.php?c=profile&a=bind-domain&";s:15:"permission_name";s:19:"profile_bind_domain";s:4:"icon";s:17:"wi wi-bind-domain";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:18:"webapp_module_link";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:1:{i:0;i:5;}s:10:"is_display";i:0;s:5:"title";s:12:"数据同步";s:3:"url";s:44:"./index.php?c=profile&a=module-link-uniacid&";s:15:"permission_name";s:18:"webapp_module_link";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:14:"webapp_rewrite";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:1:{i:0;i:5;}s:10:"is_display";i:0;s:5:"title";s:9:"伪静态";s:3:"url";s:31:"./index.php?c=webapp&a=rewrite&";s:15:"permission_name";s:14:"webapp_rewrite";s:4:"icon";s:13:"wi wi-rewrite";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:18:"webapp_bind_domain";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:1:{i:0;i:5;}s:10:"is_display";i:0;s:5:"title";s:18:"域名访问设置";s:3:"url";s:35:"./index.php?c=webapp&a=bind-domain&";s:15:"permission_name";s:18:"webapp_bind_domain";s:4:"icon";s:17:"wi wi-bind-domain";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:18:"permission_display";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}}s:10:"statistics";a:3:{s:5:"title";s:6:"统计";s:4:"menu";a:2:{s:16:"statistics_visit";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}s:10:"is_display";i:1;s:5:"title";s:12:"访问统计";s:3:"url";s:31:"./index.php?c=statistics&a=app&";s:15:"permission_name";s:16:"statistics_visit";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:3:{s:20:"statistics_visit_app";a:4:{s:5:"title";s:24:"app端访问统计信息";s:3:"url";s:42:"./index.php?c=statistics&a=app&do=display&";s:15:"permission_name";s:20:"statistics_visit_app";s:6:"active";s:3:"app";}s:21:"statistics_visit_site";a:4:{s:5:"title";s:24:"所有用户访问统计";s:3:"url";s:51:"./index.php?c=statistics&a=site&do=current_account&";s:15:"permission_name";s:21:"statistics_visit_site";s:6:"active";s:4:"site";}s:24:"statistics_visit_setting";a:4:{s:5:"title";s:18:"访问统计设置";s:3:"url";s:46:"./index.php?c=statistics&a=setting&do=display&";s:15:"permission_name";s:24:"statistics_visit_setting";s:6:"active";s:7:"setting";}}}s:15:"statistics_fans";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:1;s:5:"title";s:12:"用户统计";s:3:"url";s:32:"./index.php?c=statistics&a=fans&";s:15:"permission_name";s:15:"statistics_fans";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:18:"permission_display";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:13;}s:5:"wxapp";a:8:{s:5:"title";s:15:"微信小程序";s:4:"icon";s:19:"wi wi-small-routine";s:9:"dimension";i:3;s:3:"url";s:38:"./index.php?c=wxapp&a=display&do=home&";s:7:"section";a:5:{s:14:"wxapp_entrance";a:4:{s:5:"title";s:15:"小程序入口";s:4:"menu";a:1:{s:20:"module_entrance_link";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:"is_display";i:0;s:5:"title";s:12:"入口页面";s:3:"url";s:36:"./index.php?c=wxapp&a=entrance-link&";s:15:"permission_name";s:19:"wxapp_entrance_link";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:18:"permission_display";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:"is_display";i:0;}s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:2:"mc";a:4:{s:5:"title";s:6:"粉丝";s:4:"menu";a:1:{s:9:"mc_member";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:"is_display";i:0;s:5:"title";s:6:"会员";s:3:"url";s:26:"./index.php?c=mc&a=member&";s:15:"permission_name";s:15:"mc_wxapp_member";s:4:"icon";s:10:"wi wi-fans";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:4:{s:17:"mc_member_diaplsy";a:4:{s:5:"title";s:12:"会员管理";s:3:"url";s:37:"./index.php?c=mc&a=member&do=display&";s:15:"permission_name";s:17:"mc_member_diaplsy";s:6:"active";s:7:"display";}s:15:"mc_member_group";a:4:{s:5:"title";s:9:"会员组";s:3:"url";s:36:"./index.php?c=mc&a=group&do=display&";s:15:"permission_name";s:15:"mc_member_group";s:6:"active";s:7:"display";}s:24:"mc_member_credit_setting";a:4:{s:5:"title";s:12:"积分设置";s:3:"url";s:44:"./index.php?c=mc&a=member&do=credit_setting&";s:15:"permission_name";s:24:"mc_member_credit_setting";s:6:"active";s:14:"credit_setting";}s:16:"mc_member_fields";a:4:{s:5:"title";s:18:"会员字段管理";s:3:"url";s:34:"./index.php?c=mc&a=fields&do=list&";s:15:"permission_name";s:16:"mc_member_fields";s:6:"active";s:4:"list";}}}}s:18:"permission_display";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:"is_display";i:0;}s:13:"wxapp_profile";a:3:{s:5:"title";s:6:"配置";s:4:"menu";a:5:{s:33:"wxapp_profile_module_link_uniacid";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:"is_display";i:0;s:5:"title";s:12:"数据同步";s:3:"url";s:42:"./index.php?c=wxapp&a=module-link-uniacid&";s:15:"permission_name";s:33:"wxapp_profile_module_link_uniacid";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";N;}s:21:"wxapp_profile_payment";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:"is_display";i:0;s:5:"title";s:12:"支付参数";s:3:"url";s:30:"./index.php?c=wxapp&a=payment&";s:15:"permission_name";s:21:"wxapp_profile_payment";s:4:"icon";s:16:"wi wi-appsetting";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";a:2:{s:17:"wxapp_payment_pay";a:4:{s:5:"title";s:12:"支付参数";s:3:"url";s:41:"./index.php?c=wxapp&a=payment&do=display&";s:15:"permission_name";s:17:"wxapp_payment_pay";s:6:"active";s:7:"payment";}s:20:"wxapp_payment_refund";a:4:{s:5:"title";s:12:"退款配置";s:3:"url";s:40:"./index.php?c=wxapp&a=refund&do=display&";s:15:"permission_name";s:20:"wxapp_payment_refund";s:6:"active";s:6:"refund";}}}s:28:"wxapp_profile_front_download";a:10:{s:9:"is_system";i:1;s:18:"permission_display";i:1;s:10:"is_display";i:1;s:5:"title";s:15:"下载程序包";s:3:"url";s:37:"./index.php?c=wxapp&a=front-download&";s:15:"permission_name";s:28:"wxapp_profile_front_download";s:4:"icon";s:13:"wi wi-examine";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:23:"wxapp_profile_domainset";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:"is_display";i:0;s:5:"title";s:12:"域名设置";s:3:"url";s:32:"./index.php?c=wxapp&a=domainset&";s:15:"permission_name";s:23:"wxapp_profile_domainset";s:4:"icon";s:13:"wi wi-examine";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:22:"profile_setting_remote";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:"is_display";i:0;s:5:"title";s:12:"参数配置";s:3:"url";s:31:"./index.php?c=profile&a=remote&";s:15:"permission_name";s:22:"profile_setting_remote";s:4:"icon";s:23:"wi wi-parameter-setting";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}}s:18:"permission_display";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}}s:10:"statistics";a:4:{s:5:"title";s:6:"统计";s:4:"menu";a:1:{s:16:"statistics_visit";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:"is_display";i:0;s:5:"title";s:12:"访问统计";s:3:"url";s:31:"./index.php?c=statistics&a=app&";s:15:"permission_name";s:22:"statistics_visit_wxapp";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:3:{s:20:"statistics_visit_app";a:4:{s:5:"title";s:24:"app端访问统计信息";s:3:"url";s:42:"./index.php?c=statistics&a=app&do=display&";s:15:"permission_name";s:20:"statistics_visit_app";s:6:"active";s:3:"app";}s:21:"statistics_visit_site";a:4:{s:5:"title";s:24:"所有用户访问统计";s:3:"url";s:51:"./index.php?c=statistics&a=site&do=current_account&";s:15:"permission_name";s:21:"statistics_visit_site";s:6:"active";s:4:"site";}s:24:"statistics_visit_setting";a:4:{s:5:"title";s:18:"访问统计设置";s:3:"url";s:46:"./index.php?c=statistics&a=setting&do=display&";s:15:"permission_name";s:24:"statistics_visit_setting";s:6:"active";s:7:"setting";}}}}s:18:"permission_display";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:"is_display";i:0;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:14;}s:6:"webapp";a:7:{s:5:"title";s:2:"PC";s:4:"icon";s:8:"wi wi-pc";s:3:"url";s:39:"./index.php?c=webapp&a=home&do=display&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:15;}s:5:"xzapp";a:7:{s:5:"title";s:9:"熊掌号";s:4:"icon";s:11:"wi wi-xzapp";s:3:"url";s:38:"./index.php?c=xzapp&a=home&do=display&";s:7:"section";a:1:{s:15:"platform_module";a:3:{s:5:"title";s:12:"应用模块";s:4:"menu";a:0:{}s:10:"is_display";b:1;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:16;}s:6:"aliapp";a:7:{s:5:"title";s:18:"支付宝小程序";s:4:"icon";s:12:"wi wi-aliapp";s:3:"url";s:40:"./index.php?c=miniapp&a=display&do=home&";s:7:"section";a:1:{s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:17;}s:8:"baiduapp";a:7:{s:5:"title";s:15:"百度小程序";s:4:"icon";s:14:"wi wi-baiduapp";s:3:"url";s:40:"./index.php?c=miniapp&a=display&do=home&";s:7:"section";a:1:{s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:18;}s:10:"toutiaoapp";a:7:{s:5:"title";s:15:"头条小程序";s:4:"icon";s:16:"wi wi-toutiaoapp";s:3:"url";s:40:"./index.php?c=miniapp&a=display&do=home&";s:7:"section";a:1:{s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:19;}s:5:"store";a:7:{s:5:"title";s:6:"商城";s:4:"icon";s:11:"wi wi-store";s:3:"url";s:43:"./index.php?c=home&a=welcome&do=ext&m=store";s:7:"section";a:7:{s:11:"store_goods";a:2:{s:5:"title";s:12:"商品分类";s:4:"menu";a:6:{s:18:"store_goods_module";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"应用模块";s:3:"url";s:69:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=module";s:15:"permission_name";s:18:"store_goods_module";s:4:"icon";s:11:"wi wi-apply";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";N;}s:19:"store_goods_account";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"平台个数";s:3:"url";s:74:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=account_num";s:15:"permission_name";s:19:"store_goods_account";s:4:"icon";s:13:"wi wi-account";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:25:"store_goods_account_renew";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"平台续费";s:3:"url";s:68:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=renew";s:15:"permission_name";s:25:"store_goods_account_renew";s:4:"icon";s:21:"wi wi-appjurisdiction";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:19:"store_goods_package";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"应用权限组";s:3:"url";s:64:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=5";s:15:"permission_name";s:19:"store_goods_package";s:4:"icon";s:21:"wi wi-appjurisdiction";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:25:"store_goods_users_package";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"用户权限组";s:3:"url";s:64:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=9";s:15:"permission_name";s:25:"store_goods_users_package";s:4:"icon";s:22:"wi wi-userjurisdiction";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:15:"store_goods_api";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:23:"应用访问流量(API)";s:3:"url";s:64:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=6";s:15:"permission_name";s:15:"store_goods_api";s:4:"icon";s:9:"wi wi-api";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:16:"store_wish_goods";a:2:{s:5:"title";s:12:"预购应用";s:4:"menu";a:2:{s:21:"store_wish_goods_list";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"应用列表";s:3:"url";s:84:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=module_wish&is_wish=1";s:15:"permission_name";s:21:"store_wish_goods_list";s:4:"icon";s:11:"wi wi-apply";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:21:"store_wish_goods_edit";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:19:"添加/设置应用";s:3:"url";s:82:"./index.php?c=site&a=entry&do=wishgoodsEdit&m=store&direct=1&op=wishgoods&status=1";s:15:"permission_name";s:21:"store_wish_goods_edit";s:4:"icon";s:15:"wi wi-goods-add";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:12:"store_manage";a:3:{s:5:"title";s:12:"商城管理";s:7:"founder";b:1;s:4:"menu";a:4:{s:18:"store_manage_goods";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"添加商品";s:3:"url";s:58:"./index.php?c=site&a=entry&do=goodsSeller&m=store&direct=1";s:15:"permission_name";s:18:"store_manage_goods";s:4:"icon";s:15:"wi wi-goods-add";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:20:"store_manage_setting";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"商城设置";s:3:"url";s:54:"./index.php?c=site&a=entry&do=setting&m=store&direct=1";s:15:"permission_name";s:20:"store_manage_setting";s:4:"icon";s:11:"wi wi-store";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:19:"store_manage_payset";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"支付设置";s:3:"url";s:57:"./index.php?c=site&a=entry&do=paySetting&m=store&direct=1";s:15:"permission_name";s:19:"store_manage_payset";s:4:"icon";s:11:"wi wi-money";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:23:"store_manage_permission";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"商城访问权限";s:3:"url";s:57:"./index.php?c=site&a=entry&do=permission&m=store&direct=1";s:15:"permission_name";s:23:"store_manage_permission";s:4:"icon";s:15:"wi wi-blacklist";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:12:"store_orders";a:2:{s:5:"title";s:12:"订单管理";s:4:"menu";a:2:{s:15:"store_orders_my";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"我的订单";s:3:"url";s:53:"./index.php?c=site&a=entry&do=orders&m=store&direct=1";s:15:"permission_name";s:15:"store_orders_my";s:4:"icon";s:17:"wi wi-sale-record";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:17:"store_cash_orders";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"分销订单";s:3:"url";s:71:"./index.php?c=site&a=entry&do=cash&m=store&operate=cash_orders&direct=1";s:15:"permission_name";s:17:"store_cash_orders";s:4:"icon";s:11:"wi wi-order";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:14:"store_payments";a:2:{s:5:"title";s:12:"收入明细";s:4:"menu";a:1:{s:8:"payments";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"收入明细";s:3:"url";s:55:"./index.php?c=site&a=entry&do=payments&m=store&direct=1";s:15:"permission_name";s:8:"payments";s:4:"icon";s:17:"wi wi-sale-record";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:17:"store_cash_manage";a:2:{s:5:"title";s:12:"分销管理";s:4:"menu";a:2:{s:25:"store_manage_cash_setting";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"分销设置";s:3:"url";s:58:"./index.php?c=site&a=entry&do=cashsetting&m=store&direct=1";s:15:"permission_name";s:25:"store_manage_cash_setting";s:4:"icon";s:18:"wi wi-site-setting";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:16:"store_check_cash";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"提现审核";s:3:"url";s:73:"./index.php?c=site&a=entry&do=cash&m=store&operate=consume_order&direct=1";s:15:"permission_name";s:16:"store_check_cash";s:4:"icon";s:18:"wi wi-check-select";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:10:"store_cash";a:2:{s:5:"title";s:12:"佣金管理";s:4:"menu";a:1:{s:8:"payments";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"我的佣金";s:3:"url";s:66:"./index.php?c=site&a=entry&do=cash&m=store&operate=mycash&direct=1";s:15:"permission_name";s:8:"payments";s:4:"icon";s:10:"wi wi-list";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:20;}s:11:"custom_help";a:7:{s:5:"title";s:12:"本站帮助";s:4:"icon";s:12:"wi wi-market";s:3:"url";s:39:"./index.php?c=help&a=display&do=custom&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:21;}}');
INSERT INTO `ims_core_cache` (`key`, `value`) VALUES
('we7:module_setting:zjhj_mall:1', 'a:1:{s:6:"module";s:9:"zjhj_mall";}'),
('we7:stat_todaylock:1', 'a:1:{s:6:"expire";i:1567499424;}'),
('we7:module_info:basic', 'a:36:{s:3:"mid";s:1:"1";s:4:"name";s:5:"basic";s:4:"type";s:6:"system";s:5:"title";s:18:"基本文字回复";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"和您进行简单对话";s:11:"description";s:201:"一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的回复内容.";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:11:"app_support";s:1:"2";s:14:"webapp_support";s:1:"1";s:15:"welcome_support";s:1:"0";s:10:"oauth_type";s:1:"0";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:4:"logo";s:0:"";s:16:"baiduapp_support";s:1:"0";s:18:"toutiaoapp_support";s:1:"0";s:4:"from";s:0:"";s:9:"isdisplay";i:1;s:7:"preview";s:66:"http://localhost/xiaochengxu/addons/basic/preview.jpg?v=1567492224";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}s:12:"recycle_info";a:0:{}}'),
('we7:module_setting:basic:1', 'a:1:{s:6:"module";s:5:"basic";}'),
('we7:module_info:news', 'a:36:{s:3:"mid";s:1:"2";s:4:"name";s:4:"news";s:4:"type";s:6:"system";s:5:"title";s:24:"基本混合图文回复";s:7:"version";s:3:"1.0";s:7:"ability";s:33:"为你提供生动的图文资讯";s:11:"description";s:272:"一问一答得简单对话, 但是回复内容包括图片文字等更生动的媒体内容. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的图文回复内容.";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:11:"app_support";s:1:"2";s:14:"webapp_support";s:1:"1";s:15:"welcome_support";s:1:"0";s:10:"oauth_type";s:1:"0";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:4:"logo";s:0:"";s:16:"baiduapp_support";s:1:"0";s:18:"toutiaoapp_support";s:1:"0";s:4:"from";s:0:"";s:9:"isdisplay";i:1;s:7:"preview";s:65:"http://localhost/xiaochengxu/addons/news/preview.jpg?v=1567492224";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}s:12:"recycle_info";a:0:{}}'),
('we7:module_setting:news:1', 'a:1:{s:6:"module";s:4:"news";}'),
('we7:module_info:music', 'a:36:{s:3:"mid";s:1:"3";s:4:"name";s:5:"music";s:4:"type";s:6:"system";s:5:"title";s:18:"基本音乐回复";s:7:"version";s:3:"1.0";s:7:"ability";s:39:"提供语音、音乐等音频类回复";s:11:"description";s:183:"在回复规则中可选择具有语音、音乐等音频类的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝，实现一问一答得简单对话。";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:11:"app_support";s:1:"2";s:14:"webapp_support";s:1:"1";s:15:"welcome_support";s:1:"0";s:10:"oauth_type";s:1:"0";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:4:"logo";s:0:"";s:16:"baiduapp_support";s:1:"0";s:18:"toutiaoapp_support";s:1:"0";s:4:"from";s:0:"";s:9:"isdisplay";i:1;s:7:"preview";s:66:"http://localhost/xiaochengxu/addons/music/preview.jpg?v=1567492224";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}s:12:"recycle_info";a:0:{}}'),
('we7:module_setting:music:1', 'a:1:{s:6:"module";s:5:"music";}'),
('we7:module_info:userapi', 'a:36:{s:3:"mid";s:1:"4";s:4:"name";s:7:"userapi";s:4:"type";s:6:"system";s:5:"title";s:21:"自定义接口回复";s:7:"version";s:3:"1.1";s:7:"ability";s:33:"更方便的第三方接口设置";s:11:"description";s:141:"自定义接口又称第三方接口，可以让开发者更方便的接入微擎系统，高效的与微信公众平台进行对接整合。";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:11:"app_support";s:1:"2";s:14:"webapp_support";s:1:"1";s:15:"welcome_support";s:1:"0";s:10:"oauth_type";s:1:"0";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:4:"logo";s:0:"";s:16:"baiduapp_support";s:1:"0";s:18:"toutiaoapp_support";s:1:"0";s:4:"from";s:0:"";s:9:"isdisplay";i:1;s:7:"preview";s:68:"http://localhost/xiaochengxu/addons/userapi/preview.jpg?v=1567492224";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}s:12:"recycle_info";a:0:{}}'),
('we7:module_setting:userapi:1', 'a:1:{s:6:"module";s:7:"userapi";}'),
('we7:module_info:recharge', 'a:36:{s:3:"mid";s:1:"5";s:4:"name";s:8:"recharge";s:4:"type";s:6:"system";s:5:"title";s:24:"会员中心充值模块";s:7:"version";s:3:"1.0";s:7:"ability";s:24:"提供会员充值功能";s:11:"description";s:0:"";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:11:"app_support";s:1:"2";s:14:"webapp_support";s:1:"1";s:15:"welcome_support";s:1:"0";s:10:"oauth_type";s:1:"0";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:4:"logo";s:0:"";s:16:"baiduapp_support";s:1:"0";s:18:"toutiaoapp_support";s:1:"0";s:4:"from";s:0:"";s:9:"isdisplay";i:1;s:7:"preview";s:69:"http://localhost/xiaochengxu/addons/recharge/preview.jpg?v=1567492224";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}s:12:"recycle_info";a:0:{}}'),
('we7:module_setting:recharge:1', 'a:1:{s:6:"module";s:8:"recharge";}'),
('we7:module_info:images', 'a:36:{s:3:"mid";s:1:"7";s:4:"name";s:6:"images";s:4:"type";s:6:"system";s:5:"title";s:18:"基本图片回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:11:"description";s:132:"在回复规则中可选择具有图片的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝图片。";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:11:"app_support";s:1:"2";s:14:"webapp_support";s:1:"1";s:15:"welcome_support";s:1:"0";s:10:"oauth_type";s:1:"0";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:4:"logo";s:0:"";s:16:"baiduapp_support";s:1:"0";s:18:"toutiaoapp_support";s:1:"0";s:4:"from";s:0:"";s:9:"isdisplay";i:1;s:7:"preview";s:67:"http://localhost/xiaochengxu/addons/images/preview.jpg?v=1567492224";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}s:12:"recycle_info";a:0:{}}'),
('we7:module_setting:images:1', 'a:1:{s:6:"module";s:6:"images";}'),
('we7:module_info:video', 'a:36:{s:3:"mid";s:1:"8";s:4:"name";s:5:"video";s:4:"type";s:6:"system";s:5:"title";s:18:"基本视频回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供图片回复";s:11:"description";s:132:"在回复规则中可选择具有视频的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝视频。";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:11:"app_support";s:1:"2";s:14:"webapp_support";s:1:"1";s:15:"welcome_support";s:1:"0";s:10:"oauth_type";s:1:"0";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:4:"logo";s:0:"";s:16:"baiduapp_support";s:1:"0";s:18:"toutiaoapp_support";s:1:"0";s:4:"from";s:0:"";s:9:"isdisplay";i:1;s:7:"preview";s:66:"http://localhost/xiaochengxu/addons/video/preview.jpg?v=1567492224";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}s:12:"recycle_info";a:0:{}}'),
('we7:module_setting:video:1', 'a:1:{s:6:"module";s:5:"video";}'),
('we7:module_info:voice', 'a:36:{s:3:"mid";s:1:"9";s:4:"name";s:5:"voice";s:4:"type";s:6:"system";s:5:"title";s:18:"基本语音回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"提供语音回复";s:11:"description";s:132:"在回复规则中可选择具有语音的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝语音。";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:18:"http://www.we7.cc/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:11:"app_support";s:1:"2";s:14:"webapp_support";s:1:"1";s:15:"welcome_support";s:1:"0";s:10:"oauth_type";s:1:"0";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:4:"logo";s:0:"";s:16:"baiduapp_support";s:1:"0";s:18:"toutiaoapp_support";s:1:"0";s:4:"from";s:0:"";s:9:"isdisplay";i:1;s:7:"preview";s:66:"http://localhost/xiaochengxu/addons/voice/preview.jpg?v=1567492224";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}s:12:"recycle_info";a:0:{}}'),
('we7:module_setting:voice:1', 'a:1:{s:6:"module";s:5:"voice";}'),
('we7:module_info:wxcard', 'a:36:{s:3:"mid";s:2:"11";s:4:"name";s:6:"wxcard";s:4:"type";s:6:"system";s:5:"title";s:18:"微信卡券回复";s:7:"version";s:3:"1.0";s:7:"ability";s:18:"微信卡券回复";s:11:"description";s:18:"微信卡券回复";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:20:"http://www.efwww.com";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:11:"app_support";s:1:"2";s:14:"webapp_support";s:1:"1";s:15:"welcome_support";s:1:"0";s:10:"oauth_type";s:1:"0";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:4:"logo";s:0:"";s:16:"baiduapp_support";s:1:"0";s:18:"toutiaoapp_support";s:1:"0";s:4:"from";s:0:"";s:9:"isdisplay";i:1;s:7:"preview";s:67:"http://localhost/xiaochengxu/addons/wxcard/preview.jpg?v=1567492224";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}s:12:"recycle_info";a:0:{}}'),
('we7:module_setting:wxcard:1', 'a:1:{s:6:"module";s:6:"wxcard";}'),
('we7:module_info:custom', 'a:36:{s:3:"mid";s:1:"6";s:4:"name";s:6:"custom";s:4:"type";s:6:"system";s:5:"title";s:15:"多客服转接";s:7:"version";s:5:"1.0.0";s:7:"ability";s:36:"用来接入腾讯的多客服系统";s:11:"description";s:0:"";s:6:"author";s:13:"WeEngine Team";s:3:"url";s:17:"http://bbs.we7.cc";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}s:12:"isrulefields";s:1:"1";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:11:"app_support";s:1:"2";s:14:"webapp_support";s:1:"1";s:15:"welcome_support";s:1:"0";s:10:"oauth_type";s:1:"0";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:4:"logo";s:0:"";s:16:"baiduapp_support";s:1:"0";s:18:"toutiaoapp_support";s:1:"0";s:4:"from";s:0:"";s:9:"isdisplay";i:1;s:7:"preview";s:67:"http://localhost/xiaochengxu/addons/custom/preview.jpg?v=1567492224";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}s:12:"recycle_info";a:0:{}}'),
('we7:module_setting:custom:1', 'a:1:{s:6:"module";s:6:"custom";}'),
('we7:module_info:chats', 'a:36:{s:3:"mid";s:2:"10";s:4:"name";s:5:"chats";s:4:"type";s:6:"system";s:5:"title";s:18:"发送客服消息";s:7:"version";s:3:"1.0";s:7:"ability";s:77:"公众号可以在粉丝最后发送消息的48小时内无限制发送消息";s:11:"description";s:0:"";s:6:"author";s:9:"易福网";s:3:"url";s:21:"http://www.efwww.com/";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:0:"";s:13:"wxapp_support";s:1:"1";s:11:"app_support";s:1:"2";s:14:"webapp_support";s:1:"1";s:15:"welcome_support";s:1:"0";s:10:"oauth_type";s:1:"0";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:4:"logo";s:0:"";s:16:"baiduapp_support";s:1:"0";s:18:"toutiaoapp_support";s:1:"0";s:4:"from";s:0:"";s:9:"isdisplay";i:1;s:7:"preview";s:66:"http://localhost/xiaochengxu/addons/chats/preview.jpg?v=1567492224";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}s:12:"recycle_info";a:0:{}}'),
('we7:module_setting:chats:1', 'a:1:{s:6:"module";s:5:"chats";}'),
('we7:module_info:store', 'a:36:{s:3:"mid";s:2:"12";s:4:"name";s:5:"store";s:4:"type";s:8:"business";s:5:"title";s:12:"站内商城";s:7:"version";s:3:"1.0";s:7:"ability";s:12:"站内商城";s:11:"description";s:12:"站内商城";s:6:"author";s:3:"we7";s:3:"url";s:0:"";s:8:"settings";s:1:"0";s:10:"subscribes";s:0:"";s:7:"handles";s:0:"";s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"1";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:0:"";s:13:"title_initial";s:1:"Z";s:13:"wxapp_support";s:1:"1";s:11:"app_support";s:1:"2";s:14:"webapp_support";s:1:"1";s:15:"welcome_support";s:1:"0";s:10:"oauth_type";s:1:"0";s:16:"phoneapp_support";s:1:"0";s:15:"account_support";s:1:"2";s:13:"xzapp_support";s:1:"0";s:14:"aliapp_support";s:1:"0";s:4:"logo";s:0:"";s:16:"baiduapp_support";s:1:"0";s:18:"toutiaoapp_support";s:1:"0";s:4:"from";s:0:"";s:9:"isdisplay";i:1;s:7:"preview";s:66:"http://localhost/xiaochengxu/addons/store/preview.jpg?v=1567492224";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}s:12:"recycle_info";a:0:{}}'),
('we7:module_setting:store:1', 'a:1:{s:6:"module";s:5:"store";}'),
('we7:user_accounts:wechats:1', 'a:1:{i:1;a:8:{s:4:"acid";s:1:"1";s:7:"uniacid";s:1:"1";s:4:"name";s:5:"efwww";s:4:"type";s:1:"1";s:5:"level";s:1:"1";s:3:"key";s:0:"";s:6:"secret";s:0:"";s:5:"token";s:32:"omJNpZEhZeHj1ZxFECKkP48B5VFbk1HP";}}'),
('we7:user_accounts:wxapp:1', 'a:0:{}'),
('we7:user_accounts:webapp:1', 'a:0:{}'),
('we7:user_accounts:phoneapp:1', 'a:0:{}'),
('we7:user_accounts:xzapp:1', 'a:0:{}'),
('we7:user_accounts:aliapp:1', 'a:0:{}'),
('we7:user_accounts:baiduapp:1', 'a:0:{}'),
('we7:user_accounts:toutiaoapp:1', 'a:0:{}'),
('we7:uni_groups:0', 'a:1:{i:1;a:9:{s:2:"id";s:1:"1";s:9:"owner_uid";s:1:"0";s:4:"name";s:18:"体验套餐服务";s:7:"modules";s:44:"a:1:{s:5:"wxapp";a:1:{i:0;s:9:"zjhj_mall";}}";s:9:"templates";a:0:{}s:7:"uniacid";s:1:"0";s:3:"uid";s:1:"0";s:11:"modules_all";a:1:{i:0;s:9:"zjhj_mall";}s:5:"wxapp";a:1:{i:0;s:9:"zjhj_mall";}}}'),
('we7:defaultgroupid:1', 's:1:"1";'),
('we7:unicount:1', 's:1:"1";'),
('we7:uniaccount:', 'a:1:{s:11:"encrypt_key";N;}'),
('we7:site_store_buy:6:1', 'i:0;'),
('we7:site_store_buy:1:1', 'a:0:{}'),
('we7:site_store_buy:5:1', 'a:0:{}'),
('we7:uni_groups:01', 'a:1:{i:1;a:9:{s:2:"id";s:1:"1";s:9:"owner_uid";s:1:"0";s:4:"name";s:18:"体验套餐服务";s:7:"modules";s:44:"a:1:{s:5:"wxapp";a:1:{i:0;s:9:"zjhj_mall";}}";s:9:"templates";a:0:{}s:7:"uniacid";s:1:"0";s:3:"uid";s:1:"0";s:11:"modules_all";a:1:{i:0;s:9:"zjhj_mall";}s:5:"wxapp";a:1:{i:0;s:9:"zjhj_mall";}}}'),
('we7:uniaccount:2', 'a:13:{s:4:"acid";s:1:"2";s:7:"uniacid";s:1:"2";s:5:"token";s:32:"QAiyWWYewyi5f77vUsSC5vtsOeymAAMv";s:14:"encodingaeskey";s:43:"iXdoxUd1oeU1jvmmUd3DvhXm2Fo32UFmj32Fd1EJJo2";s:5:"level";s:1:"1";s:7:"account";s:0:"";s:8:"original";s:15:"gh_c28c6c46e215";s:3:"key";s:18:"wx7cb43fef88e9cf20";s:6:"secret";s:32:"5957d7ee03125af7a929e83db44fe71e";s:4:"name";s:6:"测试";s:9:"appdomain";s:0:"";s:18:"auth_refresh_token";s:0:"";s:11:"encrypt_key";s:18:"wx7cb43fef88e9cf20";}'),
('we7:unisetting:2', 'a:31:{s:7:"uniacid";s:1:"2";s:8:"passport";s:0:"";s:5:"oauth";s:0:"";s:11:"jsauth_acid";s:1:"0";s:2:"uc";s:0:"";s:6:"notify";s:0:"";s:11:"creditnames";a:2:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}}s:15:"creditbehaviors";a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}s:7:"welcome";s:0:"";s:7:"default";s:0:"";s:15:"default_message";s:0:"";s:7:"payment";s:0:"";s:4:"stat";s:0:"";s:12:"default_site";N;s:4:"sync";s:1:"0";s:8:"recharge";s:0:"";s:9:"tplnotice";s:0:"";s:10:"grouplevel";s:1:"0";s:8:"mcplugin";s:0:"";s:15:"exchange_enable";s:1:"0";s:11:"coupon_type";s:1:"0";s:7:"menuset";s:0:"";s:10:"statistics";s:0:"";s:11:"bind_domain";s:0:"";s:14:"comment_status";s:1:"0";s:13:"reply_setting";s:1:"0";s:14:"default_module";s:0:"";s:16:"attachment_limit";N;s:15:"attachment_size";N;s:11:"sync_member";s:1:"0";s:6:"remote";s:0:"";}'),
('we7:site_store_buy:4:2', 'a:0:{}'),
('we7:module_setting:basic:2', 'a:1:{s:6:"module";s:5:"basic";}'),
('we7:module_setting:news:2', 'a:1:{s:6:"module";s:4:"news";}'),
('we7:module_setting:music:2', 'a:1:{s:6:"module";s:5:"music";}'),
('we7:module_setting:userapi:2', 'a:1:{s:6:"module";s:7:"userapi";}'),
('we7:module_setting:recharge:2', 'a:1:{s:6:"module";s:8:"recharge";}'),
('we7:module_setting:images:2', 'a:1:{s:6:"module";s:6:"images";}'),
('we7:module_setting:video:2', 'a:1:{s:6:"module";s:5:"video";}'),
('we7:module_setting:voice:2', 'a:1:{s:6:"module";s:5:"voice";}'),
('we7:module_setting:wxcard:2', 'a:1:{s:6:"module";s:6:"wxcard";}'),
('we7:module_setting:custom:2', 'a:1:{s:6:"module";s:6:"custom";}'),
('we7:module_setting:chats:2', 'a:1:{s:6:"module";s:5:"chats";}'),
('we7:module_setting:store:2', 'a:1:{s:6:"module";s:5:"store";}'),
('we7:miniapp_version:1', 'a:21:{s:2:"id";s:1:"1";s:7:"uniacid";s:1:"2";s:7:"multiid";s:1:"0";s:7:"version";s:3:"0.1";s:11:"description";s:2:"11";s:7:"modules";a:1:{s:9:"zjhj_mall";a:44:{s:3:"mid";s:2:"13";s:4:"name";s:9:"zjhj_mall";s:4:"type";s:8:"business";s:5:"title";s:14:"禾匠商城V4";s:7:"version";s:6:"4.0.10";s:7:"ability";s:14:"禾匠商城V4";s:11:"description";s:14:"禾匠商城V4";s:6:"author";s:12:"懒人源码";s:3:"url";s:28:"https://www.lanrenzhijia.com";s:8:"settings";s:1:"0";s:10:"subscribes";a:0:{}s:7:"handles";a:0:{}s:12:"isrulefields";s:1:"0";s:8:"issystem";s:1:"0";s:6:"target";s:1:"0";s:6:"iscard";s:1:"0";s:11:"permissions";s:6:"a:0:{}";s:13:"title_initial";s:1:"H";s:13:"wxapp_support";s:1:"2";s:11:"app_support";s:1:"0";s:14:"webapp_support";s:1:"1";s:15:"welcome_support";s:1:"1";s:10:"oauth_type";s:1:"1";s:16:"phoneapp_support";s:1:"1";s:15:"account_support";s:1:"1";s:13:"xzapp_support";s:1:"1";s:14:"aliapp_support";s:1:"1";s:4:"logo";s:54:"http://localhost/xiaochengxu/addons/zjhj_mall/icon.jpg";s:16:"baiduapp_support";s:1:"1";s:18:"toutiaoapp_support";s:1:"1";s:4:"from";s:5:"local";s:9:"isdisplay";i:1;s:7:"preview";s:70:"http://localhost/xiaochengxu/addons/zjhj_mall/preview.jpg?v=1567492169";s:11:"main_module";b:0;s:11:"plugin_list";a:0:{}s:12:"recycle_info";a:0:{}s:6:"config";a:0:{}s:7:"enabled";i:1;s:12:"displayorder";N;s:8:"shortcut";N;s:15:"module_shortcut";N;s:12:"cover_entrys";a:0:{}s:12:"defaultentry";N;s:7:"newicon";N;}}s:13:"design_method";s:1:"3";s:8:"template";s:1:"0";s:9:"quickmenu";s:0:"";s:10:"createtime";s:10:"1567492852";s:4:"type";s:1:"0";s:8:"entry_id";s:1:"0";s:7:"appjson";s:0:"";s:15:"default_appjson";s:0:"";s:11:"use_default";s:1:"1";s:8:"redirect";s:0:"";s:10:"connection";s:0:"";s:12:"last_modules";a:0:{}s:13:"tominiprogram";a:0:{}s:11:"upload_time";s:1:"0";s:12:"cover_entrys";a:0:{}}');
INSERT INTO `ims_core_cache` (`key`, `value`) VALUES
('we7:system_frame:2', 'a:21:{s:8:"phoneapp";a:7:{s:5:"title";s:3:"APP";s:4:"icon";s:18:"wi wi-white-collar";s:3:"url";s:41:"./index.php?c=phoneapp&a=display&do=home&";s:7:"section";a:2:{s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:16:"phoneapp_profile";a:4:{s:5:"title";s:6:"配置";s:4:"menu";a:2:{s:28:"profile_phoneapp_module_link";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:1:{i:0;i:6;}s:10:"is_display";i:0;s:5:"title";s:12:"数据同步";s:3:"url";s:42:"./index.php?c=wxapp&a=module-link-uniacid&";s:15:"permission_name";s:28:"profile_phoneapp_module_link";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:14:"front_download";a:10:{s:9:"is_system";i:1;s:18:"permission_display";b:1;s:10:"is_display";i:1;s:5:"title";s:9:"下载APP";s:3:"url";s:40:"./index.php?c=phoneapp&a=front-download&";s:15:"permission_name";s:23:"phoneapp_front_download";s:4:"icon";s:13:"wi wi-examine";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:10:"is_display";b:1;s:18:"permission_display";a:1:{i:0;i:6;}}}s:9:"is_system";b:1;s:10:"is_display";b:0;s:12:"displayorder";i:0;}s:7:"welcome";a:7:{s:5:"title";s:6:"首页";s:4:"icon";s:10:"wi wi-home";s:3:"url";s:48:"./index.php?c=home&a=welcome&do=system&page=home";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:2;}s:8:"platform";a:8:{s:5:"title";s:12:"平台入口";s:4:"icon";s:14:"wi wi-platform";s:9:"dimension";i:2;s:3:"url";s:44:"./index.php?c=account&a=display&do=platform&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:3;}s:6:"module";a:8:{s:5:"title";s:12:"应用入口";s:4:"icon";s:11:"wi wi-apply";s:9:"dimension";i:2;s:3:"url";s:53:"./index.php?c=module&a=display&do=switch_last_module&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:4;}s:14:"account_manage";a:8:{s:5:"title";s:12:"平台管理";s:4:"icon";s:21:"wi wi-platform-manage";s:9:"dimension";i:2;s:3:"url";s:31:"./index.php?c=account&a=manage&";s:7:"section";a:1:{s:14:"account_manage";a:2:{s:5:"title";s:12:"平台管理";s:4:"menu";a:4:{s:22:"account_manage_display";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"平台列表";s:3:"url";s:31:"./index.php?c=account&a=manage&";s:15:"permission_name";s:22:"account_manage_display";s:4:"icon";N;s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";a:1:{i:0;a:2:{s:5:"title";s:12:"帐号停用";s:15:"permission_name";s:19:"account_manage_stop";}}}s:22:"account_manage_recycle";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:9:"回收站";s:3:"url";s:32:"./index.php?c=account&a=recycle&";s:15:"permission_name";s:22:"account_manage_recycle";s:4:"icon";N;s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:2:{i:0;a:2:{s:5:"title";s:12:"帐号删除";s:15:"permission_name";s:21:"account_manage_delete";}i:1;a:2:{s:5:"title";s:12:"帐号恢复";s:15:"permission_name";s:22:"account_manage_recover";}}}s:30:"account_manage_system_platform";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:19:" 微信开放平台";s:3:"url";s:32:"./index.php?c=system&a=platform&";s:15:"permission_name";s:30:"account_manage_system_platform";s:4:"icon";N;s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:30:"account_manage_expired_message";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:22:" 自定义到期提示";s:3:"url";s:40:"./index.php?c=account&a=expired-message&";s:15:"permission_name";s:30:"account_manage_expired_message";s:4:"icon";N;s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:5;}s:13:"module_manage";a:8:{s:5:"title";s:12:"应用管理";s:4:"icon";s:19:"wi wi-module-manage";s:9:"dimension";i:2;s:3:"url";s:50:"./index.php?c=module&a=manage-system&do=installed&";s:7:"section";a:1:{s:13:"module_manage";a:2:{s:5:"title";s:12:"应用管理";s:4:"menu";a:5:{s:23:"module_manage_installed";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"已安装列表";s:3:"url";s:50:"./index.php?c=module&a=manage-system&do=installed&";s:15:"permission_name";s:23:"module_manage_installed";s:4:"icon";N;s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:20:"module_manage_stoped";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"已停用列表";s:3:"url";s:54:"./index.php?c=module&a=manage-system&do=recycle&type=1";s:15:"permission_name";s:20:"module_manage_stoped";s:4:"icon";N;s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:27:"module_manage_not_installed";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"未安装列表";s:3:"url";s:54:"./index.php?c=module&a=manage-system&do=not_installed&";s:15:"permission_name";s:27:"module_manage_not_installed";s:4:"icon";N;s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:21:"module_manage_recycle";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:9:"回收站";s:3:"url";s:54:"./index.php?c=module&a=manage-system&do=recycle&type=2";s:15:"permission_name";s:21:"module_manage_recycle";s:4:"icon";N;s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:23:"module_manage_subscribe";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"订阅管理";s:3:"url";s:50:"./index.php?c=module&a=manage-system&do=subscribe&";s:15:"permission_name";s:23:"module_manage_subscribe";s:4:"icon";N;s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:0:{}}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:6;}s:11:"user_manage";a:8:{s:5:"title";s:12:"用户管理";s:4:"icon";s:16:"wi wi-user-group";s:9:"dimension";i:2;s:3:"url";s:29:"./index.php?c=user&a=display&";s:7:"section";a:1:{s:11:"user_manage";a:2:{s:5:"title";s:12:"用户管理";s:4:"menu";a:7:{s:19:"user_manage_display";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"普通用户";s:3:"url";s:29:"./index.php?c=user&a=display&";s:15:"permission_name";s:19:"user_manage_display";s:4:"icon";N;s:12:"displayorder";i:7;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:19:"user_manage_founder";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:9:"副站长";s:3:"url";s:32:"./index.php?c=founder&a=display&";s:15:"permission_name";s:19:"user_manage_founder";s:4:"icon";N;s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:17:"user_manage_clerk";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"店员管理";s:3:"url";s:39:"./index.php?c=user&a=display&type=clerk";s:15:"permission_name";s:17:"user_manage_clerk";s:4:"icon";N;s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:17:"user_manage_check";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"审核用户";s:3:"url";s:39:"./index.php?c=user&a=display&type=check";s:15:"permission_name";s:17:"user_manage_check";s:4:"icon";N;s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:19:"user_manage_recycle";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:9:"回收站";s:3:"url";s:41:"./index.php?c=user&a=display&type=recycle";s:15:"permission_name";s:19:"user_manage_recycle";s:4:"icon";N;s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:18:"user_manage_fields";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"用户属性设置";s:3:"url";s:39:"./index.php?c=user&a=fields&do=display&";s:15:"permission_name";s:18:"user_manage_fields";s:4:"icon";N;s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:18:"user_manage_expire";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"用户过期设置";s:3:"url";s:28:"./index.php?c=user&a=expire&";s:15:"permission_name";s:18:"user_manage_expire";s:4:"icon";N;s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:0:{}}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:7;}s:10:"permission";a:8:{s:5:"title";s:9:"权限组";s:4:"icon";s:22:"wi wi-userjurisdiction";s:9:"dimension";i:2;s:3:"url";s:29:"./index.php?c=module&a=group&";s:7:"section";a:1:{s:10:"permission";a:2:{s:5:"title";s:9:"权限组";s:4:"menu";a:4:{s:23:"permission_module_group";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"应用权限组";s:3:"url";s:29:"./index.php?c=module&a=group&";s:15:"permission_name";s:23:"permission_module_group";s:4:"icon";N;s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:31:"permission_create_account_group";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"账号权限组";s:3:"url";s:34:"./index.php?c=user&a=create-group&";s:15:"permission_name";s:31:"permission_create_account_group";s:4:"icon";N;s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:21:"permission_user_group";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"用户权限组合";s:3:"url";s:27:"./index.php?c=user&a=group&";s:15:"permission_name";s:21:"permission_user_group";s:4:"icon";N;s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:0:{}}s:24:"permission_founder_group";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:21:"副站长权限组合";s:3:"url";s:30:"./index.php?c=founder&a=group&";s:15:"permission_name";s:24:"permission_founder_group";s:4:"icon";N;s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:0:{}}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:8;}s:6:"system";a:8:{s:5:"title";s:12:"系统功能";s:4:"icon";s:13:"wi wi-setting";s:9:"dimension";i:3;s:3:"url";s:31:"./index.php?c=article&a=notice&";s:7:"section";a:5:{s:7:"article";a:3:{s:5:"title";s:12:"站内公告";s:4:"menu";a:1:{s:14:"system_article";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"站内公告";s:3:"url";s:31:"./index.php?c=article&a=notice&";s:15:"permission_name";s:14:"system_article";s:4:"icon";s:13:"wi wi-article";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:2:{i:0;a:2:{s:5:"title";s:12:"公告列表";s:15:"permission_name";s:26:"system_article_notice_list";}i:1;a:2:{s:5:"title";s:12:"公告分类";s:15:"permission_name";s:30:"system_article_notice_category";}}}}s:7:"founder";b:1;}s:15:"system_template";a:3:{s:5:"title";s:6:"模板";s:4:"menu";a:1:{s:15:"system_template";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"微官网模板";s:3:"url";s:32:"./index.php?c=system&a=template&";s:15:"permission_name";s:15:"system_template";s:4:"icon";s:17:"wi wi-wx-template";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:7:"founder";b:1;}s:14:"system_welcome";a:3:{s:5:"title";s:12:"系统首页";s:4:"menu";a:2:{s:14:"system_welcome";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"系统首页应用";s:3:"url";s:60:"./index.php?c=module&a=manage-system&support=welcome_support";s:15:"permission_name";s:14:"system_welcome";s:4:"icon";s:20:"wi wi-system-welcome";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:11:"system_news";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"系统新闻";s:3:"url";s:29:"./index.php?c=article&a=news&";s:15:"permission_name";s:11:"system_news";s:4:"icon";s:13:"wi wi-article";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:2:{i:0;a:2:{s:5:"title";s:13:"新闻列表 ";s:15:"permission_name";s:24:"system_article_news_list";}i:1;a:2:{s:5:"title";s:13:"新闻分类 ";s:15:"permission_name";s:28:"system_article_news_category";}}}}s:7:"founder";b:1;}s:17:"system_statistics";a:3:{s:5:"title";s:6:"统计";s:4:"menu";a:1:{s:23:"system_account_analysis";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"访问统计";s:3:"url";s:35:"./index.php?c=statistics&a=account&";s:15:"permission_name";s:23:"system_account_analysis";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:7:"founder";b:1;}s:5:"cache";a:2:{s:5:"title";s:6:"缓存";s:4:"menu";a:1:{s:26:"system_setting_updatecache";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"更新缓存";s:3:"url";s:35:"./index.php?c=system&a=updatecache&";s:15:"permission_name";s:26:"system_setting_updatecache";s:4:"icon";s:12:"wi wi-update";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:9;}s:4:"site";a:9:{s:5:"title";s:12:"站点设置";s:4:"icon";s:17:"wi wi-system-site";s:9:"dimension";i:3;s:3:"url";s:28:"./index.php?c=system&a=site&";s:7:"section";a:4:{s:5:"cloud";a:2:{s:5:"title";s:9:"云服务";s:4:"menu";a:3:{s:14:"system_profile";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"系统升级";s:3:"url";s:30:"./index.php?c=cloud&a=upgrade&";s:15:"permission_name";s:20:"system_cloud_upgrade";s:4:"icon";s:11:"wi wi-cache";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:21:"system_cloud_register";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"注册站点";s:3:"url";s:30:"./index.php?c=cloud&a=profile&";s:15:"permission_name";s:21:"system_cloud_register";s:4:"icon";s:18:"wi wi-registersite";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:21:"system_cloud_diagnose";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"云服务诊断";s:3:"url";s:31:"./index.php?c=cloud&a=diagnose&";s:15:"permission_name";s:21:"system_cloud_diagnose";s:4:"icon";s:14:"wi wi-diagnose";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"setting";a:2:{s:5:"title";s:6:"设置";s:4:"menu";a:9:{s:19:"system_setting_site";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"站点设置";s:3:"url";s:28:"./index.php?c=system&a=site&";s:15:"permission_name";s:19:"system_setting_site";s:4:"icon";s:18:"wi wi-site-setting";s:12:"displayorder";i:9;s:2:"id";N;s:14:"sub_permission";N;}s:19:"system_setting_menu";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"菜单设置";s:3:"url";s:28:"./index.php?c=system&a=menu&";s:15:"permission_name";s:19:"system_setting_menu";s:4:"icon";s:18:"wi wi-menu-setting";s:12:"displayorder";i:8;s:2:"id";N;s:14:"sub_permission";N;}s:25:"system_setting_attachment";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"附件设置";s:3:"url";s:34:"./index.php?c=system&a=attachment&";s:15:"permission_name";s:25:"system_setting_attachment";s:4:"icon";s:16:"wi wi-attachment";s:12:"displayorder";i:7;s:2:"id";N;s:14:"sub_permission";N;}s:25:"system_setting_systeminfo";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"系统信息";s:3:"url";s:34:"./index.php?c=system&a=systeminfo&";s:15:"permission_name";s:25:"system_setting_systeminfo";s:4:"icon";s:17:"wi wi-system-info";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";N;}s:19:"system_setting_logs";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"查看日志";s:3:"url";s:28:"./index.php?c=system&a=logs&";s:15:"permission_name";s:19:"system_setting_logs";s:4:"icon";s:9:"wi wi-log";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:26:"system_setting_ipwhitelist";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:11:"IP白名单";s:3:"url";s:35:"./index.php?c=system&a=ipwhitelist&";s:15:"permission_name";s:26:"system_setting_ipwhitelist";s:4:"icon";s:8:"wi wi-ip";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:28:"system_setting_sensitiveword";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"过滤敏感词";s:3:"url";s:37:"./index.php?c=system&a=sensitiveword&";s:15:"permission_name";s:28:"system_setting_sensitiveword";s:4:"icon";s:15:"wi wi-sensitive";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:25:"system_setting_thirdlogin";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:25:"用户登录/注册设置";s:3:"url";s:33:"./index.php?c=user&a=registerset&";s:15:"permission_name";s:25:"system_setting_thirdlogin";s:4:"icon";s:10:"wi wi-user";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:20:"system_setting_oauth";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"全局借用权限";s:3:"url";s:29:"./index.php?c=system&a=oauth&";s:15:"permission_name";s:20:"system_setting_oauth";s:4:"icon";s:11:"wi wi-oauth";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"utility";a:2:{s:5:"title";s:12:"常用工具";s:4:"menu";a:6:{s:24:"system_utility_filecheck";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"系统文件校验";s:3:"url";s:33:"./index.php?c=system&a=filecheck&";s:15:"permission_name";s:24:"system_utility_filecheck";s:4:"icon";s:10:"wi wi-file";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";N;}s:23:"system_utility_optimize";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"性能优化";s:3:"url";s:32:"./index.php?c=system&a=optimize&";s:15:"permission_name";s:23:"system_utility_optimize";s:4:"icon";s:14:"wi wi-optimize";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:23:"system_utility_database";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:9:"数据库";s:3:"url";s:32:"./index.php?c=system&a=database&";s:15:"permission_name";s:23:"system_utility_database";s:4:"icon";s:9:"wi wi-sql";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:19:"system_utility_scan";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"木马查杀";s:3:"url";s:28:"./index.php?c=system&a=scan&";s:15:"permission_name";s:19:"system_utility_scan";s:4:"icon";s:12:"wi wi-safety";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:18:"system_utility_bom";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"检测文件BOM";s:3:"url";s:27:"./index.php?c=system&a=bom&";s:15:"permission_name";s:18:"system_utility_bom";s:4:"icon";s:9:"wi wi-bom";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:20:"system_utility_check";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"系统常规检测";s:3:"url";s:29:"./index.php?c=system&a=check&";s:15:"permission_name";s:20:"system_utility_check";s:4:"icon";s:9:"wi wi-bom";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:7:"backjob";a:2:{s:5:"title";s:12:"后台任务";s:4:"menu";a:1:{s:10:"system_job";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"后台任务";s:3:"url";s:38:"./index.php?c=system&a=job&do=display&";s:15:"permission_name";s:10:"system_job";s:4:"icon";s:9:"wi wi-job";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:7:"founder";b:1;s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:10;}s:6:"myself";a:8:{s:5:"title";s:12:"我的账户";s:4:"icon";s:10:"wi wi-bell";s:9:"dimension";i:2;s:3:"url";s:29:"./index.php?c=user&a=profile&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:11;}s:7:"message";a:8:{s:5:"title";s:12:"消息管理";s:4:"icon";s:10:"wi wi-bell";s:9:"dimension";i:2;s:3:"url";s:31:"./index.php?c=message&a=notice&";s:7:"section";a:1:{s:7:"message";a:2:{s:5:"title";s:12:"消息管理";s:4:"menu";a:3:{s:14:"message_notice";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"消息提醒";s:3:"url";s:31:"./index.php?c=message&a=notice&";s:15:"permission_name";s:14:"message_notice";s:4:"icon";N;s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:15:"message_setting";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"消息设置";s:3:"url";s:42:"./index.php?c=message&a=notice&do=setting&";s:15:"permission_name";s:15:"message_setting";s:4:"icon";N;s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:22:"message_wechat_setting";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"微信提醒设置";s:3:"url";s:49:"./index.php?c=message&a=notice&do=wechat_setting&";s:15:"permission_name";s:22:"message_wechat_setting";s:4:"icon";N;s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:12;}s:7:"account";a:8:{s:5:"title";s:9:"公众号";s:4:"icon";s:18:"wi wi-white-collar";s:9:"dimension";i:3;s:3:"url";s:41:"./index.php?c=home&a=welcome&do=platform&";s:7:"section";a:5:{s:8:"platform";a:4:{s:5:"title";s:12:"增强功能";s:4:"menu";a:6:{s:14:"platform_reply";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;s:5:"title";s:12:"自动回复";s:3:"url";s:31:"./index.php?c=platform&a=reply&";s:15:"permission_name";s:14:"platform_reply";s:4:"icon";s:11:"wi wi-reply";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";a:7:{s:22:"platform_reply_keyword";a:4:{s:5:"title";s:21:"关键字自动回复";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=keyword";s:15:"permission_name";s:22:"platform_reply_keyword";s:6:"active";s:7:"keyword";}s:22:"platform_reply_special";a:4:{s:5:"title";s:24:"非关键字自动回复";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=special";s:15:"permission_name";s:22:"platform_reply_special";s:6:"active";s:7:"special";}s:22:"platform_reply_welcome";a:4:{s:5:"title";s:24:"首次访问自动回复";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=welcome";s:15:"permission_name";s:22:"platform_reply_welcome";s:6:"active";s:7:"welcome";}s:22:"platform_reply_default";a:4:{s:5:"title";s:12:"默认回复";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=default";s:15:"permission_name";s:22:"platform_reply_default";s:6:"active";s:7:"default";}s:22:"platform_reply_service";a:4:{s:5:"title";s:12:"常用服务";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=service";s:15:"permission_name";s:22:"platform_reply_service";s:6:"active";s:7:"service";}s:22:"platform_reply_userapi";a:5:{s:5:"title";s:21:"自定义接口回复";s:3:"url";s:40:"./index.php?c=platform&a=reply&m=userapi";s:15:"permission_name";s:22:"platform_reply_userapi";s:6:"active";s:7:"userapi";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:22:"platform_reply_setting";a:4:{s:5:"title";s:12:"回复设置";s:3:"url";s:38:"./index.php?c=profile&a=reply-setting&";s:15:"permission_name";s:22:"platform_reply_setting";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}}}s:13:"platform_menu";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;s:5:"title";s:15:"自定义菜单";s:3:"url";s:38:"./index.php?c=platform&a=menu&do=post&";s:15:"permission_name";s:13:"platform_menu";s:4:"icon";s:16:"wi wi-custommenu";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";a:2:{s:21:"platform_menu_default";a:4:{s:5:"title";s:12:"默认菜单";s:3:"url";s:38:"./index.php?c=platform&a=menu&do=post&";s:15:"permission_name";s:21:"platform_menu_default";s:6:"active";s:4:"post";}s:25:"platform_menu_conditional";a:5:{s:5:"title";s:15:"个性化菜单";s:3:"url";s:47:"./index.php?c=platform&a=menu&do=display&type=3";s:15:"permission_name";s:25:"platform_menu_conditional";s:6:"active";s:7:"display";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}}}s:11:"platform_qr";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:2:{i:0;i:1;i:1;i:3;}s:10:"is_display";i:0;s:5:"title";s:22:"二维码/转化链接";s:3:"url";s:28:"./index.php?c=platform&a=qr&";s:15:"permission_name";s:11:"platform_qr";s:4:"icon";s:12:"wi wi-qrcode";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";a:2:{s:14:"platform_qr_qr";a:4:{s:5:"title";s:9:"二维码";s:3:"url";s:36:"./index.php?c=platform&a=qr&do=list&";s:15:"permission_name";s:14:"platform_qr_qr";s:6:"active";s:4:"list";}s:22:"platform_qr_statistics";a:4:{s:5:"title";s:21:"二维码扫描统计";s:3:"url";s:39:"./index.php?c=platform&a=qr&do=display&";s:15:"permission_name";s:22:"platform_qr_statistics";s:6:"active";s:7:"display";}}}s:17:"platform_masstask";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;s:5:"title";s:12:"定时群发";s:3:"url";s:30:"./index.php?c=platform&a=mass&";s:15:"permission_name";s:17:"platform_masstask";s:4:"icon";s:13:"wi wi-crontab";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:2:{s:22:"platform_masstask_post";a:4:{s:5:"title";s:12:"定时群发";s:3:"url";s:38:"./index.php?c=platform&a=mass&do=post&";s:15:"permission_name";s:22:"platform_masstask_post";s:6:"active";s:4:"post";}s:22:"platform_masstask_send";a:4:{s:5:"title";s:12:"群发记录";s:3:"url";s:38:"./index.php?c=platform&a=mass&do=send&";s:15:"permission_name";s:22:"platform_masstask_send";s:6:"active";s:4:"send";}}}s:17:"platform_material";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;s:5:"title";s:16:"素材/编辑器";s:3:"url";s:34:"./index.php?c=platform&a=material&";s:15:"permission_name";s:17:"platform_material";s:4:"icon";s:12:"wi wi-redact";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:5:{s:22:"platform_material_news";a:4:{s:5:"title";s:6:"图文";s:3:"url";s:43:"./index.php?c=platform&a=material&type=news";s:15:"permission_name";s:22:"platform_material_news";s:6:"active";s:4:"news";}s:23:"platform_material_image";a:4:{s:5:"title";s:6:"图片";s:3:"url";s:44:"./index.php?c=platform&a=material&type=image";s:15:"permission_name";s:23:"platform_material_image";s:6:"active";s:5:"image";}s:23:"platform_material_voice";a:4:{s:5:"title";s:6:"语音";s:3:"url";s:44:"./index.php?c=platform&a=material&type=voice";s:15:"permission_name";s:23:"platform_material_voice";s:6:"active";s:5:"voice";}s:23:"platform_material_video";a:5:{s:5:"title";s:6:"视频";s:3:"url";s:44:"./index.php?c=platform&a=material&type=video";s:15:"permission_name";s:23:"platform_material_video";s:6:"active";s:5:"video";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:24:"platform_material_delete";a:3:{s:5:"title";s:6:"删除";s:15:"permission_name";s:24:"platform_material_delete";s:10:"is_display";b:0;}}}s:13:"platform_site";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:2:{i:0;i:1;i:1;i:3;}s:10:"is_display";i:0;s:5:"title";s:16:"微官网-文章";s:3:"url";s:27:"./index.php?c=site&a=multi&";s:15:"permission_name";s:13:"platform_site";s:4:"icon";s:10:"wi wi-home";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:4:{s:19:"platform_site_multi";a:4:{s:5:"title";s:9:"微官网";s:3:"url";s:38:"./index.php?c=site&a=multi&do=display&";s:15:"permission_name";s:19:"platform_site_multi";s:6:"active";s:5:"multi";}s:19:"platform_site_style";a:4:{s:5:"title";s:15:"微官网模板";s:3:"url";s:39:"./index.php?c=site&a=style&do=template&";s:15:"permission_name";s:19:"platform_site_style";s:6:"active";s:5:"style";}s:21:"platform_site_article";a:4:{s:5:"title";s:12:"文章管理";s:3:"url";s:40:"./index.php?c=site&a=article&do=display&";s:15:"permission_name";s:21:"platform_site_article";s:6:"active";s:7:"article";}s:22:"platform_site_category";a:4:{s:5:"title";s:18:"文章分类管理";s:3:"url";s:41:"./index.php?c=site&a=category&do=display&";s:15:"permission_name";s:22:"platform_site_category";s:6:"active";s:8:"category";}}}}s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;}s:15:"platform_module";a:3:{s:5:"title";s:12:"应用模块";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:2:"mc";a:4:{s:5:"title";s:6:"粉丝";s:4:"menu";a:3:{s:7:"mc_fans";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;s:5:"title";s:12:"粉丝管理";s:3:"url";s:24:"./index.php?c=mc&a=fans&";s:15:"permission_name";s:7:"mc_fans";s:4:"icon";s:16:"wi wi-fansmanage";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";a:2:{s:15:"mc_fans_display";a:4:{s:5:"title";s:12:"全部粉丝";s:3:"url";s:35:"./index.php?c=mc&a=fans&do=display&";s:15:"permission_name";s:15:"mc_fans_display";s:6:"active";s:7:"display";}s:21:"mc_fans_fans_sync_set";a:4:{s:5:"title";s:18:"粉丝同步设置";s:3:"url";s:41:"./index.php?c=mc&a=fans&do=fans_sync_set&";s:15:"permission_name";s:21:"mc_fans_fans_sync_set";s:6:"active";s:13:"fans_sync_set";}}}s:9:"mc_member";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}s:10:"is_display";i:0;s:5:"title";s:12:"会员管理";s:3:"url";s:26:"./index.php?c=mc&a=member&";s:15:"permission_name";s:9:"mc_member";s:4:"icon";s:10:"wi wi-fans";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:7:{s:17:"mc_member_diaplsy";a:4:{s:5:"title";s:12:"会员管理";s:3:"url";s:37:"./index.php?c=mc&a=member&do=display&";s:15:"permission_name";s:17:"mc_member_diaplsy";s:6:"active";s:7:"display";}s:15:"mc_member_group";a:4:{s:5:"title";s:9:"会员组";s:3:"url";s:36:"./index.php?c=mc&a=group&do=display&";s:15:"permission_name";s:15:"mc_member_group";s:6:"active";s:7:"display";}s:12:"mc_member_uc";a:5:{s:5:"title";s:12:"会员中心";s:3:"url";s:34:"./index.php?c=site&a=editor&do=uc&";s:15:"permission_name";s:12:"mc_member_uc";s:6:"active";s:2:"uc";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:19:"mc_member_quickmenu";a:5:{s:5:"title";s:12:"快捷菜单";s:3:"url";s:41:"./index.php?c=site&a=editor&do=quickmenu&";s:15:"permission_name";s:19:"mc_member_quickmenu";s:6:"active";s:9:"quickmenu";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:25:"mc_member_register_seting";a:5:{s:5:"title";s:12:"注册设置";s:3:"url";s:46:"./index.php?c=mc&a=member&do=register_setting&";s:15:"permission_name";s:25:"mc_member_register_seting";s:6:"active";s:16:"register_setting";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:24:"mc_member_credit_setting";a:4:{s:5:"title";s:12:"积分设置";s:3:"url";s:44:"./index.php?c=mc&a=member&do=credit_setting&";s:15:"permission_name";s:24:"mc_member_credit_setting";s:6:"active";s:14:"credit_setting";}s:16:"mc_member_fields";a:4:{s:5:"title";s:18:"会员字段管理";s:3:"url";s:34:"./index.php?c=mc&a=fields&do=list&";s:15:"permission_name";s:16:"mc_member_fields";s:6:"active";s:4:"list";}}}s:10:"mc_message";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;s:5:"title";s:12:"留言管理";s:3:"url";s:27:"./index.php?c=mc&a=message&";s:15:"permission_name";s:10:"mc_message";s:4:"icon";s:13:"wi wi-message";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:18:"permission_display";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}s:10:"is_display";i:0;}s:7:"profile";a:4:{s:5:"title";s:6:"配置";s:4:"menu";a:7:{s:15:"profile_setting";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}s:10:"is_display";i:0;s:5:"title";s:12:"参数配置";s:3:"url";s:31:"./index.php?c=profile&a=remote&";s:15:"permission_name";s:15:"profile_setting";s:4:"icon";s:23:"wi wi-parameter-setting";s:12:"displayorder";i:7;s:2:"id";N;s:14:"sub_permission";a:6:{s:22:"profile_setting_remote";a:4:{s:5:"title";s:12:"远程附件";s:3:"url";s:42:"./index.php?c=profile&a=remote&do=display&";s:15:"permission_name";s:22:"profile_setting_remote";s:6:"active";s:7:"display";}s:24:"profile_setting_passport";a:5:{s:5:"title";s:12:"借用权限";s:3:"url";s:42:"./index.php?c=profile&a=passport&do=oauth&";s:15:"permission_name";s:24:"profile_setting_passport";s:6:"active";s:5:"oauth";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:25:"profile_setting_tplnotice";a:5:{s:5:"title";s:18:"微信通知设置";s:3:"url";s:42:"./index.php?c=profile&a=tplnotice&do=list&";s:15:"permission_name";s:25:"profile_setting_tplnotice";s:6:"active";s:4:"list";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:22:"profile_setting_notify";a:5:{s:5:"title";s:18:"邮件通知参数";s:3:"url";s:39:"./index.php?c=profile&a=notify&do=mail&";s:15:"permission_name";s:22:"profile_setting_notify";s:6:"active";s:4:"mail";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:26:"profile_setting_uc_setting";a:5:{s:5:"title";s:14:"UC站点整合";s:3:"url";s:45:"./index.php?c=profile&a=common&do=uc_setting&";s:15:"permission_name";s:26:"profile_setting_uc_setting";s:6:"active";s:10:"uc_setting";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}s:27:"profile_setting_upload_file";a:5:{s:5:"title";s:20:"上传JS接口文件";s:3:"url";s:46:"./index.php?c=profile&a=common&do=upload_file&";s:15:"permission_name";s:27:"profile_setting_upload_file";s:6:"active";s:11:"upload_file";s:10:"is_display";a:2:{i:0;i:1;i:1;i:3;}}}}s:15:"profile_payment";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:2:{i:0;i:1;i:1;i:3;}s:10:"is_display";i:0;s:5:"title";s:12:"支付参数";s:3:"url";s:32:"./index.php?c=profile&a=payment&";s:15:"permission_name";s:15:"profile_payment";s:4:"icon";s:17:"wi wi-pay-setting";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";a:2:{s:19:"profile_payment_pay";a:4:{s:5:"title";s:12:"支付配置";s:3:"url";s:32:"./index.php?c=profile&a=payment&";s:15:"permission_name";s:19:"profile_payment_pay";s:6:"active";s:7:"payment";}s:22:"profile_payment_refund";a:4:{s:5:"title";s:12:"退款配置";s:3:"url";s:42:"./index.php?c=profile&a=refund&do=display&";s:15:"permission_name";s:22:"profile_payment_refund";s:6:"active";s:6:"refund";}}}s:23:"profile_app_module_link";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;s:5:"title";s:12:"数据同步";s:3:"url";s:44:"./index.php?c=profile&a=module-link-uniacid&";s:15:"permission_name";s:31:"profile_app_module_link_uniacid";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:19:"profile_bind_domain";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;s:5:"title";s:12:"域名绑定";s:3:"url";s:36:"./index.php?c=profile&a=bind-domain&";s:15:"permission_name";s:19:"profile_bind_domain";s:4:"icon";s:17:"wi wi-bind-domain";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:18:"webapp_module_link";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:1:{i:0;i:5;}s:10:"is_display";i:0;s:5:"title";s:12:"数据同步";s:3:"url";s:44:"./index.php?c=profile&a=module-link-uniacid&";s:15:"permission_name";s:18:"webapp_module_link";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:14:"webapp_rewrite";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:1:{i:0;i:5;}s:10:"is_display";i:0;s:5:"title";s:9:"伪静态";s:3:"url";s:31:"./index.php?c=webapp&a=rewrite&";s:15:"permission_name";s:14:"webapp_rewrite";s:4:"icon";s:13:"wi wi-rewrite";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:18:"webapp_bind_domain";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:1:{i:0;i:5;}s:10:"is_display";i:0;s:5:"title";s:18:"域名访问设置";s:3:"url";s:35:"./index.php?c=webapp&a=bind-domain&";s:15:"permission_name";s:18:"webapp_bind_domain";s:4:"icon";s:17:"wi wi-bind-domain";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:18:"permission_display";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}s:10:"is_display";i:0;}s:10:"statistics";a:4:{s:5:"title";s:6:"统计";s:4:"menu";a:2:{s:16:"statistics_visit";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}s:10:"is_display";i:0;s:5:"title";s:12:"访问统计";s:3:"url";s:31:"./index.php?c=statistics&a=app&";s:15:"permission_name";s:16:"statistics_visit";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";a:3:{s:20:"statistics_visit_app";a:4:{s:5:"title";s:24:"app端访问统计信息";s:3:"url";s:42:"./index.php?c=statistics&a=app&do=display&";s:15:"permission_name";s:20:"statistics_visit_app";s:6:"active";s:3:"app";}s:21:"statistics_visit_site";a:4:{s:5:"title";s:24:"所有用户访问统计";s:3:"url";s:51:"./index.php?c=statistics&a=site&do=current_account&";s:15:"permission_name";s:21:"statistics_visit_site";s:6:"active";s:4:"site";}s:24:"statistics_visit_setting";a:4:{s:5:"title";s:18:"访问统计设置";s:3:"url";s:46:"./index.php?c=statistics&a=setting&do=display&";s:15:"permission_name";s:24:"statistics_visit_setting";s:6:"active";s:7:"setting";}}}s:15:"statistics_fans";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:4:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;}s:10:"is_display";i:0;s:5:"title";s:12:"用户统计";s:3:"url";s:32:"./index.php?c=statistics&a=fans&";s:15:"permission_name";s:15:"statistics_fans";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:18:"permission_display";a:5:{i:0;i:1;i:1;i:3;i:2;i:9;i:3;i:10;i:4;i:5;}s:10:"is_display";i:0;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:13;}s:5:"wxapp";a:8:{s:5:"title";s:15:"微信小程序";s:4:"icon";s:19:"wi wi-small-routine";s:9:"dimension";i:3;s:3:"url";s:38:"./index.php?c=wxapp&a=display&do=home&";s:7:"section";a:5:{s:14:"wxapp_entrance";a:3:{s:5:"title";s:15:"小程序入口";s:4:"menu";a:1:{s:20:"module_entrance_link";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:"is_display";i:1;s:5:"title";s:12:"入口页面";s:3:"url";s:36:"./index.php?c=wxapp&a=entrance-link&";s:15:"permission_name";s:19:"wxapp_entrance_link";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}s:18:"permission_display";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}}s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}s:2:"mc";a:3:{s:5:"title";s:6:"粉丝";s:4:"menu";a:1:{s:9:"mc_member";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:"is_display";i:1;s:5:"title";s:6:"会员";s:3:"url";s:26:"./index.php?c=mc&a=member&";s:15:"permission_name";s:15:"mc_wxapp_member";s:4:"icon";s:10:"wi wi-fans";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:4:{s:17:"mc_member_diaplsy";a:4:{s:5:"title";s:12:"会员管理";s:3:"url";s:37:"./index.php?c=mc&a=member&do=display&";s:15:"permission_name";s:17:"mc_member_diaplsy";s:6:"active";s:7:"display";}s:15:"mc_member_group";a:4:{s:5:"title";s:9:"会员组";s:3:"url";s:36:"./index.php?c=mc&a=group&do=display&";s:15:"permission_name";s:15:"mc_member_group";s:6:"active";s:7:"display";}s:24:"mc_member_credit_setting";a:4:{s:5:"title";s:12:"积分设置";s:3:"url";s:44:"./index.php?c=mc&a=member&do=credit_setting&";s:15:"permission_name";s:24:"mc_member_credit_setting";s:6:"active";s:14:"credit_setting";}s:16:"mc_member_fields";a:4:{s:5:"title";s:18:"会员字段管理";s:3:"url";s:34:"./index.php?c=mc&a=fields&do=list&";s:15:"permission_name";s:16:"mc_member_fields";s:6:"active";s:4:"list";}}}}s:18:"permission_display";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}}s:13:"wxapp_profile";a:3:{s:5:"title";s:6:"配置";s:4:"menu";a:5:{s:33:"wxapp_profile_module_link_uniacid";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:"is_display";i:1;s:5:"title";s:12:"数据同步";s:3:"url";s:42:"./index.php?c=wxapp&a=module-link-uniacid&";s:15:"permission_name";s:33:"wxapp_profile_module_link_uniacid";s:4:"icon";s:18:"wi wi-data-synchro";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";N;}s:21:"wxapp_profile_payment";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:"is_display";i:1;s:5:"title";s:12:"支付参数";s:3:"url";s:30:"./index.php?c=wxapp&a=payment&";s:15:"permission_name";s:21:"wxapp_profile_payment";s:4:"icon";s:16:"wi wi-appsetting";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";a:2:{s:17:"wxapp_payment_pay";a:4:{s:5:"title";s:12:"支付参数";s:3:"url";s:41:"./index.php?c=wxapp&a=payment&do=display&";s:15:"permission_name";s:17:"wxapp_payment_pay";s:6:"active";s:7:"payment";}s:20:"wxapp_payment_refund";a:4:{s:5:"title";s:12:"退款配置";s:3:"url";s:40:"./index.php?c=wxapp&a=refund&do=display&";s:15:"permission_name";s:20:"wxapp_payment_refund";s:6:"active";s:6:"refund";}}}s:28:"wxapp_profile_front_download";a:10:{s:9:"is_system";i:1;s:18:"permission_display";i:1;s:10:"is_display";i:1;s:5:"title";s:18:"上传微信审核";s:3:"url";s:37:"./index.php?c=wxapp&a=front-download&";s:15:"permission_name";s:28:"wxapp_profile_front_download";s:4:"icon";s:13:"wi wi-examine";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:23:"wxapp_profile_domainset";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:3:{i:0;i:4;i:1;i:7;i:2;i:8;}s:10:"is_display";i:1;s:5:"title";s:12:"域名设置";s:3:"url";s:32:"./index.php?c=wxapp&a=domainset&";s:15:"permission_name";s:23:"wxapp_profile_domainset";s:4:"icon";s:13:"wi wi-examine";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:22:"profile_setting_remote";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:"is_display";i:1;s:5:"title";s:12:"参数配置";s:3:"url";s:31:"./index.php?c=profile&a=remote&";s:15:"permission_name";s:22:"profile_setting_remote";s:4:"icon";s:23:"wi wi-parameter-setting";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}}s:18:"permission_display";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}}s:10:"statistics";a:3:{s:5:"title";s:6:"统计";s:4:"menu";a:1:{s:16:"statistics_visit";a:10:{s:9:"is_system";i:1;s:18:"permission_display";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}s:10:"is_display";i:1;s:5:"title";s:12:"访问统计";s:3:"url";s:33:"./index.php?c=wxapp&a=statistics&";s:15:"permission_name";s:22:"statistics_visit_wxapp";s:4:"icon";s:17:"wi wi-statistical";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";a:3:{s:20:"statistics_visit_app";a:4:{s:5:"title";s:24:"app端访问统计信息";s:3:"url";s:42:"./index.php?c=statistics&a=app&do=display&";s:15:"permission_name";s:20:"statistics_visit_app";s:6:"active";s:3:"app";}s:21:"statistics_visit_site";a:4:{s:5:"title";s:24:"所有用户访问统计";s:3:"url";s:51:"./index.php?c=statistics&a=site&do=current_account&";s:15:"permission_name";s:21:"statistics_visit_site";s:6:"active";s:4:"site";}s:24:"statistics_visit_setting";a:4:{s:5:"title";s:18:"访问统计设置";s:3:"url";s:46:"./index.php?c=statistics&a=setting&do=display&";s:15:"permission_name";s:24:"statistics_visit_setting";s:6:"active";s:7:"setting";}}}}s:18:"permission_display";a:7:{i:0;i:4;i:1;i:7;i:2;i:8;i:3;i:6;i:4;i:11;i:5;i:12;i:6;i:13;}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:14;}s:6:"webapp";a:7:{s:5:"title";s:2:"PC";s:4:"icon";s:8:"wi wi-pc";s:3:"url";s:39:"./index.php?c=webapp&a=home&do=display&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:15;}s:5:"xzapp";a:7:{s:5:"title";s:9:"熊掌号";s:4:"icon";s:11:"wi wi-xzapp";s:3:"url";s:38:"./index.php?c=xzapp&a=home&do=display&";s:7:"section";a:1:{s:15:"platform_module";a:3:{s:5:"title";s:12:"应用模块";s:4:"menu";a:0:{}s:10:"is_display";b:1;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:16;}s:6:"aliapp";a:7:{s:5:"title";s:18:"支付宝小程序";s:4:"icon";s:12:"wi wi-aliapp";s:3:"url";s:40:"./index.php?c=miniapp&a=display&do=home&";s:7:"section";a:1:{s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:17;}s:8:"baiduapp";a:7:{s:5:"title";s:15:"百度小程序";s:4:"icon";s:14:"wi wi-baiduapp";s:3:"url";s:40:"./index.php?c=miniapp&a=display&do=home&";s:7:"section";a:1:{s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:18;}s:10:"toutiaoapp";a:7:{s:5:"title";s:15:"头条小程序";s:4:"icon";s:16:"wi wi-toutiaoapp";s:3:"url";s:40:"./index.php?c=miniapp&a=display&do=home&";s:7:"section";a:1:{s:15:"platform_module";a:3:{s:5:"title";s:6:"应用";s:4:"menu";a:0:{}s:10:"is_display";b:1;}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:19;}s:5:"store";a:7:{s:5:"title";s:6:"商城";s:4:"icon";s:11:"wi wi-store";s:3:"url";s:43:"./index.php?c=home&a=welcome&do=ext&m=store";s:7:"section";a:7:{s:11:"store_goods";a:2:{s:5:"title";s:12:"商品分类";s:4:"menu";a:6:{s:18:"store_goods_module";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"应用模块";s:3:"url";s:69:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=module";s:15:"permission_name";s:18:"store_goods_module";s:4:"icon";s:11:"wi wi-apply";s:12:"displayorder";i:6;s:2:"id";N;s:14:"sub_permission";N;}s:19:"store_goods_account";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"平台个数";s:3:"url";s:74:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=account_num";s:15:"permission_name";s:19:"store_goods_account";s:4:"icon";s:13:"wi wi-account";s:12:"displayorder";i:5;s:2:"id";N;s:14:"sub_permission";N;}s:25:"store_goods_account_renew";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"平台续费";s:3:"url";s:68:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=renew";s:15:"permission_name";s:25:"store_goods_account_renew";s:4:"icon";s:21:"wi wi-appjurisdiction";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:19:"store_goods_package";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"应用权限组";s:3:"url";s:64:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=5";s:15:"permission_name";s:19:"store_goods_package";s:4:"icon";s:21:"wi wi-appjurisdiction";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:25:"store_goods_users_package";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:15:"用户权限组";s:3:"url";s:64:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=9";s:15:"permission_name";s:25:"store_goods_users_package";s:4:"icon";s:22:"wi wi-userjurisdiction";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:15:"store_goods_api";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:23:"应用访问流量(API)";s:3:"url";s:64:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=6";s:15:"permission_name";s:15:"store_goods_api";s:4:"icon";s:9:"wi wi-api";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:16:"store_wish_goods";a:2:{s:5:"title";s:12:"预购应用";s:4:"menu";a:2:{s:21:"store_wish_goods_list";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"应用列表";s:3:"url";s:84:"./index.php?c=site&a=entry&do=goodsbuyer&m=store&direct=1&type=module_wish&is_wish=1";s:15:"permission_name";s:21:"store_wish_goods_list";s:4:"icon";s:11:"wi wi-apply";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:21:"store_wish_goods_edit";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:19:"添加/设置应用";s:3:"url";s:82:"./index.php?c=site&a=entry&do=wishgoodsEdit&m=store&direct=1&op=wishgoods&status=1";s:15:"permission_name";s:21:"store_wish_goods_edit";s:4:"icon";s:15:"wi wi-goods-add";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:12:"store_manage";a:3:{s:5:"title";s:12:"商城管理";s:7:"founder";b:1;s:4:"menu";a:4:{s:18:"store_manage_goods";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"添加商品";s:3:"url";s:58:"./index.php?c=site&a=entry&do=goodsSeller&m=store&direct=1";s:15:"permission_name";s:18:"store_manage_goods";s:4:"icon";s:15:"wi wi-goods-add";s:12:"displayorder";i:4;s:2:"id";N;s:14:"sub_permission";N;}s:20:"store_manage_setting";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"商城设置";s:3:"url";s:54:"./index.php?c=site&a=entry&do=setting&m=store&direct=1";s:15:"permission_name";s:20:"store_manage_setting";s:4:"icon";s:11:"wi wi-store";s:12:"displayorder";i:3;s:2:"id";N;s:14:"sub_permission";N;}s:19:"store_manage_payset";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"支付设置";s:3:"url";s:57:"./index.php?c=site&a=entry&do=paySetting&m=store&direct=1";s:15:"permission_name";s:19:"store_manage_payset";s:4:"icon";s:11:"wi wi-money";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:23:"store_manage_permission";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:18:"商城访问权限";s:3:"url";s:57:"./index.php?c=site&a=entry&do=permission&m=store&direct=1";s:15:"permission_name";s:23:"store_manage_permission";s:4:"icon";s:15:"wi wi-blacklist";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:12:"store_orders";a:2:{s:5:"title";s:12:"订单管理";s:4:"menu";a:2:{s:15:"store_orders_my";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"我的订单";s:3:"url";s:53:"./index.php?c=site&a=entry&do=orders&m=store&direct=1";s:15:"permission_name";s:15:"store_orders_my";s:4:"icon";s:17:"wi wi-sale-record";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:17:"store_cash_orders";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"分销订单";s:3:"url";s:71:"./index.php?c=site&a=entry&do=cash&m=store&operate=cash_orders&direct=1";s:15:"permission_name";s:17:"store_cash_orders";s:4:"icon";s:11:"wi wi-order";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:14:"store_payments";a:2:{s:5:"title";s:12:"收入明细";s:4:"menu";a:1:{s:8:"payments";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"收入明细";s:3:"url";s:55:"./index.php?c=site&a=entry&do=payments&m=store&direct=1";s:15:"permission_name";s:8:"payments";s:4:"icon";s:17:"wi wi-sale-record";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:17:"store_cash_manage";a:2:{s:5:"title";s:12:"分销管理";s:4:"menu";a:2:{s:25:"store_manage_cash_setting";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"分销设置";s:3:"url";s:58:"./index.php?c=site&a=entry&do=cashsetting&m=store&direct=1";s:15:"permission_name";s:25:"store_manage_cash_setting";s:4:"icon";s:18:"wi wi-site-setting";s:12:"displayorder";i:2;s:2:"id";N;s:14:"sub_permission";N;}s:16:"store_check_cash";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"提现审核";s:3:"url";s:73:"./index.php?c=site&a=entry&do=cash&m=store&operate=consume_order&direct=1";s:15:"permission_name";s:16:"store_check_cash";s:4:"icon";s:18:"wi wi-check-select";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}s:10:"store_cash";a:2:{s:5:"title";s:12:"佣金管理";s:4:"menu";a:1:{s:8:"payments";a:10:{s:9:"is_system";i:1;s:18:"permission_display";N;s:10:"is_display";i:1;s:5:"title";s:12:"我的佣金";s:3:"url";s:66:"./index.php?c=site&a=entry&do=cash&m=store&operate=mycash&direct=1";s:15:"permission_name";s:8:"payments";s:4:"icon";s:10:"wi wi-list";s:12:"displayorder";i:1;s:2:"id";N;s:14:"sub_permission";N;}}}}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:20;}s:11:"custom_help";a:7:{s:5:"title";s:12:"本站帮助";s:4:"icon";s:12:"wi wi-market";s:3:"url";s:39:"./index.php?c=help&a=display&do=custom&";s:7:"section";a:0:{}s:9:"is_system";b:1;s:10:"is_display";b:1;s:12:"displayorder";i:21;}}');

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_cron`
--

CREATE TABLE `ims_core_cron` (
  `id` int(10) UNSIGNED NOT NULL,
  `cloudid` int(10) UNSIGNED NOT NULL,
  `module` varchar(50) NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `filename` varchar(50) NOT NULL,
  `lastruntime` int(10) UNSIGNED NOT NULL,
  `nextruntime` int(10) UNSIGNED NOT NULL,
  `weekday` tinyint(3) NOT NULL,
  `day` tinyint(3) NOT NULL,
  `hour` tinyint(3) NOT NULL,
  `minute` varchar(255) NOT NULL,
  `extra` varchar(5000) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_cron_record`
--

CREATE TABLE `ims_core_cron_record` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `tid` int(10) UNSIGNED NOT NULL,
  `note` varchar(500) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_job`
--

CREATE TABLE `ims_core_job` (
  `id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `payload` varchar(255) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `title` varchar(22) NOT NULL,
  `handled` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  `updatetime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `isdeleted` tinyint(1) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_menu`
--

CREATE TABLE `ims_core_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL,
  `title` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(255) NOT NULL,
  `append_title` varchar(30) NOT NULL,
  `append_url` varchar(255) NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `type` varchar(15) NOT NULL,
  `is_display` tinyint(3) UNSIGNED NOT NULL,
  `is_system` tinyint(3) UNSIGNED NOT NULL,
  `permission_name` varchar(50) NOT NULL,
  `group_name` varchar(30) NOT NULL,
  `icon` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_menu`
--

INSERT INTO `ims_core_menu` (`id`, `pid`, `title`, `name`, `url`, `append_title`, `append_url`, `displayorder`, `type`, `is_display`, `is_system`, `permission_name`, `group_name`, `icon`) VALUES
(1, 0, '', '', '', '', '', 0, '', 0, 1, 'phoneapp', 'frame', '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_menu_shortcut`
--

CREATE TABLE `ims_core_menu_shortcut` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `modulename` varchar(100) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `position` varchar(100) NOT NULL,
  `updatetime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_paylog`
--

CREATE TABLE `ims_core_paylog` (
  `plid` bigint(11) UNSIGNED NOT NULL,
  `type` varchar(20) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `acid` int(10) NOT NULL,
  `openid` varchar(40) NOT NULL,
  `uniontid` varchar(64) NOT NULL,
  `tid` varchar(128) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `tag` varchar(2000) NOT NULL,
  `is_usecard` tinyint(3) UNSIGNED NOT NULL,
  `card_type` tinyint(3) UNSIGNED NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `card_fee` decimal(10,2) UNSIGNED NOT NULL,
  `encrypt_code` varchar(100) NOT NULL,
  `is_wish` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_performance`
--

CREATE TABLE `ims_core_performance` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL,
  `runtime` varchar(10) NOT NULL,
  `runurl` varchar(512) NOT NULL,
  `runsql` varchar(512) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_queue`
--

CREATE TABLE `ims_core_queue` (
  `qid` bigint(20) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `message` varchar(2000) NOT NULL,
  `params` varchar(1000) NOT NULL,
  `keyword` varchar(1000) NOT NULL,
  `response` varchar(2000) NOT NULL,
  `module` varchar(50) NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `dateline` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_refundlog`
--

CREATE TABLE `ims_core_refundlog` (
  `id` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `refund_uniontid` varchar(64) NOT NULL,
  `reason` varchar(80) NOT NULL,
  `uniontid` varchar(64) NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `status` int(2) NOT NULL,
  `is_wish` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_resource`
--

CREATE TABLE `ims_core_resource` (
  `mid` int(11) NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `trunk` int(10) UNSIGNED NOT NULL,
  `type` varchar(10) NOT NULL,
  `dateline` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_sendsms_log`
--

CREATE TABLE `ims_core_sendsms_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `result` varchar(255) NOT NULL,
  `createtime` int(11) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_sessions`
--

CREATE TABLE `ims_core_sessions` (
  `sid` char(32) NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(50) NOT NULL,
  `data` varchar(5000) NOT NULL,
  `expiretime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_sessions`
--

INSERT INTO `ims_core_sessions` (`sid`, `uniacid`, `openid`, `data`, `expiretime`) VALUES
('1807565db9e49598d48f0f52d0d80cbc', 1, 'fromUser', 'openid|s:8:"fromUser";__reply_times|a:3:{s:7:"content";s:12:"测试内容";s:4:"date";s:10:"2019-09-03";s:5:"times";i:1;}', 1567496011);

-- --------------------------------------------------------

--
-- 表的结构 `ims_core_settings`
--

CREATE TABLE `ims_core_settings` (
  `key` varchar(200) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_core_settings`
--

INSERT INTO `ims_core_settings` (`key`, `value`) VALUES
('copyright', 'a:1:{s:6:"slides";a:3:{i:0;s:58:"https://img.alicdn.com/tps/TB1pfG4IFXXXXc6XXXXXXXXXXXX.jpg";i:1;s:58:"https://img.alicdn.com/tps/TB1sXGYIFXXXXc5XpXXXXXXXXXX.jpg";i:2;s:58:"https://img.alicdn.com/tps/TB1h9xxIFXXXXbKXXXXXXXXXXXX.jpg";}}'),
('authmode', 'i:1;'),
('close', 'a:2:{s:6:"status";s:1:"0";s:6:"reason";s:0:"";}'),
('register', 'a:4:{s:4:"open";i:1;s:6:"verify";i:0;s:4:"code";i:1;s:7:"groupid";i:1;}'),
('thirdlogin', 'a:4:{s:6:"system";a:3:{s:5:"appid";s:0:"";s:9:"appsecret";s:0:"";s:9:"authstate";s:0:"";}s:2:"qq";a:3:{s:5:"appid";s:0:"";s:9:"appsecret";s:0:"";s:9:"authstate";i:0;}s:6:"wechat";a:3:{s:5:"appid";s:0:"";s:9:"appsecret";s:0:"";s:9:"authstate";s:0:"";}s:6:"mobile";a:3:{s:5:"appid";s:0:"";s:9:"appsecret";s:0:"";s:9:"authstate";s:0:"";}}'),
('cloudip', 'a:0:{}');

-- --------------------------------------------------------

--
-- 表的结构 `ims_coupon_location`
--

CREATE TABLE `ims_coupon_location` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `sid` int(10) UNSIGNED NOT NULL,
  `location_id` int(10) UNSIGNED NOT NULL,
  `business_name` varchar(50) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `category` varchar(255) NOT NULL,
  `province` varchar(15) NOT NULL,
  `city` varchar(15) NOT NULL,
  `district` varchar(15) NOT NULL,
  `address` varchar(50) NOT NULL,
  `longitude` varchar(15) NOT NULL,
  `latitude` varchar(15) NOT NULL,
  `telephone` varchar(20) NOT NULL,
  `photo_list` varchar(10000) NOT NULL,
  `avg_price` int(10) UNSIGNED NOT NULL,
  `open_time` varchar(50) NOT NULL,
  `recommend` varchar(255) NOT NULL,
  `special` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `offset_type` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `message` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_cover_reply`
--

CREATE TABLE `ims_cover_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `multiid` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `module` varchar(30) NOT NULL,
  `do` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_cover_reply`
--

INSERT INTO `ims_cover_reply` (`id`, `uniacid`, `multiid`, `rid`, `module`, `do`, `title`, `description`, `thumb`, `url`) VALUES
(1, 1, 0, 7, 'mc', '', '进入个人中心', '', '', './index.php?c=mc&a=home&i=1'),
(2, 1, 1, 8, 'site', '', '进入首页', '', '', './index.php?c=home&i=1&t=1');

-- --------------------------------------------------------

--
-- 表的结构 `ims_custom_reply`
--

CREATE TABLE `ims_custom_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `start1` int(10) NOT NULL,
  `end1` int(10) NOT NULL,
  `start2` int(10) NOT NULL,
  `end2` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_images_reply`
--

CREATE TABLE `ims_images_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_job`
--

CREATE TABLE `ims_job` (
  `id` int(11) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `payload` varchar(255) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `title` varchar(22) NOT NULL,
  `handled` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `createtime` int(11) NOT NULL,
  `updatetime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `isdeleted` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card`
--

CREATE TABLE `ims_mc_card` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) NOT NULL,
  `color` varchar(255) NOT NULL,
  `background` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `format_type` tinyint(3) UNSIGNED NOT NULL,
  `format` varchar(50) NOT NULL,
  `description` varchar(512) NOT NULL,
  `fields` varchar(1000) NOT NULL,
  `snpos` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `business` text NOT NULL,
  `discount_type` tinyint(3) UNSIGNED NOT NULL,
  `discount` varchar(3000) NOT NULL,
  `grant` varchar(3000) NOT NULL,
  `grant_rate` varchar(20) NOT NULL,
  `offset_rate` int(10) UNSIGNED NOT NULL,
  `offset_max` int(10) NOT NULL,
  `nums_status` tinyint(3) UNSIGNED NOT NULL,
  `nums_text` varchar(15) NOT NULL,
  `nums` varchar(1000) NOT NULL,
  `times_status` tinyint(3) UNSIGNED NOT NULL,
  `times_text` varchar(15) NOT NULL,
  `times` varchar(1000) NOT NULL,
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `recommend_status` tinyint(3) UNSIGNED NOT NULL,
  `sign_status` tinyint(3) UNSIGNED NOT NULL,
  `brand_name` varchar(128) NOT NULL DEFAULT '',
  `quantity` int(10) NOT NULL DEFAULT '0',
  `notice` varchar(48) NOT NULL DEFAULT '',
  `max_increase_bonus` int(10) NOT NULL DEFAULT '0',
  `least_money_to_use_bonus` int(10) NOT NULL DEFAULT '0',
  `source` int(1) NOT NULL DEFAULT '1',
  `card_id` varchar(250) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_care`
--

CREATE TABLE `ims_mc_card_care` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `groupid` int(10) UNSIGNED NOT NULL,
  `credit1` int(10) UNSIGNED NOT NULL,
  `credit2` int(10) UNSIGNED NOT NULL,
  `couponid` int(10) UNSIGNED NOT NULL,
  `granttime` int(10) UNSIGNED NOT NULL,
  `days` int(10) UNSIGNED NOT NULL,
  `time` tinyint(3) UNSIGNED NOT NULL,
  `show_in_card` tinyint(3) UNSIGNED NOT NULL,
  `content` varchar(1000) NOT NULL,
  `sms_notice` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_credit_set`
--

CREATE TABLE `ims_mc_card_credit_set` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `sign` varchar(1000) NOT NULL,
  `share` varchar(500) NOT NULL,
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_members`
--

CREATE TABLE `ims_mc_card_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) DEFAULT NULL,
  `openid` varchar(50) NOT NULL,
  `cid` int(10) NOT NULL,
  `cardsn` varchar(20) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `nums` int(10) UNSIGNED NOT NULL,
  `endtime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_notices`
--

CREATE TABLE `ims_mc_card_notices` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `groupid` int(10) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `addtime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_notices_unread`
--

CREATE TABLE `ims_mc_card_notices_unread` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `notice_id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `is_new` tinyint(3) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_recommend`
--

CREATE TABLE `ims_mc_card_recommend` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `url` varchar(100) NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `addtime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_record`
--

CREATE TABLE `ims_mc_card_record` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `type` varchar(15) NOT NULL,
  `model` tinyint(3) UNSIGNED NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `note` varchar(255) NOT NULL,
  `remark` varchar(200) NOT NULL,
  `addtime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_card_sign_record`
--

CREATE TABLE `ims_mc_card_sign_record` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `credit` int(10) UNSIGNED NOT NULL,
  `is_grant` tinyint(3) UNSIGNED NOT NULL,
  `addtime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_cash_record`
--

CREATE TABLE `ims_mc_cash_record` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `clerk_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `clerk_type` tinyint(3) UNSIGNED NOT NULL,
  `fee` decimal(10,2) UNSIGNED NOT NULL,
  `final_fee` decimal(10,2) UNSIGNED NOT NULL,
  `credit1` int(10) UNSIGNED NOT NULL,
  `credit1_fee` decimal(10,2) UNSIGNED NOT NULL,
  `credit2` decimal(10,2) UNSIGNED NOT NULL,
  `cash` decimal(10,2) UNSIGNED NOT NULL,
  `return_cash` decimal(10,2) UNSIGNED NOT NULL,
  `final_cash` decimal(10,2) UNSIGNED NOT NULL,
  `remark` varchar(255) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `trade_type` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_chats_record`
--

CREATE TABLE `ims_mc_chats_record` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `flag` tinyint(3) UNSIGNED NOT NULL,
  `openid` varchar(32) NOT NULL,
  `msgtype` varchar(15) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_credits_recharge`
--

CREATE TABLE `ims_mc_credits_recharge` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(50) NOT NULL,
  `tid` varchar(64) NOT NULL,
  `transid` varchar(30) NOT NULL,
  `fee` varchar(10) NOT NULL,
  `type` varchar(15) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `backtype` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_credits_record`
--

CREATE TABLE `ims_mc_credits_record` (
  `id` int(11) NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(11) NOT NULL,
  `credittype` varchar(10) NOT NULL,
  `num` decimal(10,2) NOT NULL,
  `operator` int(10) UNSIGNED NOT NULL,
  `module` varchar(30) NOT NULL,
  `clerk_id` int(10) UNSIGNED NOT NULL,
  `store_id` int(10) UNSIGNED NOT NULL,
  `clerk_type` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `remark` varchar(200) NOT NULL,
  `real_uniacid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_fans_groups`
--

CREATE TABLE `ims_mc_fans_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `groups` varchar(10000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_fans_tag`
--

CREATE TABLE `ims_mc_fans_tag` (
  `id` int(11) UNSIGNED NOT NULL,
  `uniacid` int(11) DEFAULT '0',
  `fanid` int(11) NOT NULL DEFAULT '0',
  `openid` varchar(50) NOT NULL,
  `subscribe` int(11) DEFAULT '0',
  `nickname` varchar(100) DEFAULT NULL,
  `sex` int(11) DEFAULT '0',
  `language` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `province` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `headimgurl` varchar(150) DEFAULT NULL,
  `subscribe_time` int(11) NOT NULL DEFAULT '0',
  `unionid` varchar(100) DEFAULT NULL,
  `remark` varchar(250) DEFAULT NULL,
  `groupid` varchar(100) DEFAULT NULL,
  `tagid_list` varchar(250) DEFAULT NULL,
  `subscribe_scene` varchar(100) DEFAULT NULL,
  `qr_scene_str` varchar(250) DEFAULT NULL,
  `qr_scene` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_fans_tag_mapping`
--

CREATE TABLE `ims_mc_fans_tag_mapping` (
  `id` int(11) UNSIGNED NOT NULL,
  `fanid` int(11) UNSIGNED NOT NULL,
  `tagid` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_groups`
--

CREATE TABLE `ims_mc_groups` (
  `groupid` int(11) NOT NULL,
  `uniacid` int(11) NOT NULL,
  `title` varchar(20) NOT NULL,
  `credit` int(10) UNSIGNED NOT NULL,
  `isdefault` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_mc_groups`
--

INSERT INTO `ims_mc_groups` (`groupid`, `uniacid`, `title`, `credit`, `isdefault`) VALUES
(1, 1, '默认会员组', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_handsel`
--

CREATE TABLE `ims_mc_handsel` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) NOT NULL,
  `touid` int(10) UNSIGNED NOT NULL,
  `fromuid` varchar(32) NOT NULL,
  `module` varchar(30) NOT NULL,
  `sign` varchar(100) NOT NULL,
  `action` varchar(20) NOT NULL,
  `credit_value` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_mapping_fans`
--

CREATE TABLE `ims_mc_mapping_fans` (
  `fanid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `groupid` varchar(60) NOT NULL,
  `salt` char(8) NOT NULL,
  `follow` tinyint(1) UNSIGNED NOT NULL,
  `followtime` int(10) UNSIGNED NOT NULL,
  `unfollowtime` int(10) UNSIGNED NOT NULL,
  `tag` varchar(1000) NOT NULL,
  `updatetime` int(10) UNSIGNED DEFAULT NULL,
  `unionid` varchar(64) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_mapping_ucenter`
--

CREATE TABLE `ims_mc_mapping_ucenter` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `centeruid` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_mass_record`
--

CREATE TABLE `ims_mc_mass_record` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `groupname` varchar(50) NOT NULL,
  `fansnum` int(10) UNSIGNED NOT NULL,
  `msgtype` varchar(10) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `group` int(10) NOT NULL,
  `attach_id` int(10) UNSIGNED NOT NULL,
  `media_id` varchar(100) NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `cron_id` int(10) UNSIGNED NOT NULL,
  `sendtime` int(10) UNSIGNED NOT NULL,
  `finalsendtime` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `msg_id` varchar(50) NOT NULL,
  `msg_data_id` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_members`
--

CREATE TABLE `ims_mc_members` (
  `uid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `mobile` varchar(18) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(8) NOT NULL,
  `groupid` int(11) NOT NULL,
  `credit1` decimal(10,2) UNSIGNED NOT NULL,
  `credit2` decimal(10,2) UNSIGNED NOT NULL,
  `credit3` decimal(10,2) UNSIGNED NOT NULL,
  `credit4` decimal(10,2) UNSIGNED NOT NULL,
  `credit5` decimal(10,2) UNSIGNED NOT NULL,
  `credit6` decimal(10,2) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `vip` tinyint(3) UNSIGNED NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) UNSIGNED NOT NULL,
  `birthmonth` tinyint(3) UNSIGNED NOT NULL,
  `birthday` tinyint(3) UNSIGNED NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `pay_password` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_member_address`
--

CREATE TABLE `ims_mc_member_address` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(50) UNSIGNED NOT NULL,
  `username` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `province` varchar(32) NOT NULL,
  `city` varchar(32) NOT NULL,
  `district` varchar(32) NOT NULL,
  `address` varchar(512) NOT NULL,
  `isdefault` tinyint(1) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_member_fields`
--

CREATE TABLE `ims_mc_member_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) NOT NULL,
  `fieldid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `displayorder` smallint(6) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_member_property`
--

CREATE TABLE `ims_mc_member_property` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(11) NOT NULL,
  `property` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_mc_oauth_fans`
--

CREATE TABLE `ims_mc_oauth_fans` (
  `id` int(10) UNSIGNED NOT NULL,
  `oauth_openid` varchar(50) NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_menu_event`
--

CREATE TABLE `ims_menu_event` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  `picmd5` varchar(32) NOT NULL,
  `openid` varchar(128) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_message_notice_log`
--

CREATE TABLE `ims_message_notice_log` (
  `id` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `is_read` tinyint(3) NOT NULL,
  `uid` int(11) NOT NULL,
  `sign` varchar(22) NOT NULL,
  `type` tinyint(3) NOT NULL,
  `status` tinyint(3) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `end_time` int(11) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_message_notice_log`
--

INSERT INTO `ims_message_notice_log` (`id`, `message`, `is_read`, `uid`, `sign`, `type`, `status`, `create_time`, `end_time`, `url`) VALUES
(1, 'xiaochengxu-普通用户 2019-09-03 14:27:17注册成功--admin', 1, 1, '2', 4, 2, 1567492037, 0, ''),
(2, 'test01-普通用户 2019-09-03 14:37:33注册成功--admin', 1, 1, '3', 4, 2, 1567492653, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_mobilenumber`
--

CREATE TABLE `ims_mobilenumber` (
  `id` int(11) NOT NULL,
  `rid` int(10) NOT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL,
  `dateline` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules`
--

CREATE TABLE `ims_modules` (
  `mid` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `version` varchar(15) NOT NULL,
  `ability` varchar(500) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `settings` tinyint(1) NOT NULL,
  `subscribes` varchar(500) NOT NULL,
  `handles` varchar(500) NOT NULL,
  `isrulefields` tinyint(1) NOT NULL,
  `issystem` tinyint(1) UNSIGNED NOT NULL,
  `target` int(10) UNSIGNED NOT NULL,
  `iscard` tinyint(3) UNSIGNED NOT NULL,
  `permissions` varchar(5000) NOT NULL,
  `title_initial` varchar(1) NOT NULL,
  `wxapp_support` tinyint(1) NOT NULL,
  `app_support` tinyint(1) NOT NULL,
  `webapp_support` tinyint(1) NOT NULL DEFAULT '1',
  `welcome_support` int(2) NOT NULL,
  `oauth_type` tinyint(1) NOT NULL,
  `phoneapp_support` tinyint(1) NOT NULL,
  `account_support` tinyint(1) NOT NULL,
  `xzapp_support` tinyint(1) NOT NULL,
  `aliapp_support` tinyint(1) NOT NULL,
  `logo` varchar(250) NOT NULL,
  `baiduapp_support` tinyint(1) NOT NULL,
  `toutiaoapp_support` tinyint(1) NOT NULL,
  `from` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_modules`
--

INSERT INTO `ims_modules` (`mid`, `name`, `type`, `title`, `version`, `ability`, `description`, `author`, `url`, `settings`, `subscribes`, `handles`, `isrulefields`, `issystem`, `target`, `iscard`, `permissions`, `title_initial`, `wxapp_support`, `app_support`, `webapp_support`, `welcome_support`, `oauth_type`, `phoneapp_support`, `account_support`, `xzapp_support`, `aliapp_support`, `logo`, `baiduapp_support`, `toutiaoapp_support`, `from`) VALUES
(1, 'basic', 'system', '基本文字回复', '1.0', '和您进行简单对话', '一问一答得简单对话. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的回复内容.', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 2, 1, 0, 0, 0, 2, 0, 0, '', 0, 0, ''),
(2, 'news', 'system', '基本混合图文回复', '1.0', '为你提供生动的图文资讯', '一问一答得简单对话, 但是回复内容包括图片文字等更生动的媒体内容. 当访客的对话语句中包含指定关键字, 或对话语句完全等于特定关键字, 或符合某些特定的格式时. 系统自动应答设定好的图文回复内容.', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 2, 1, 0, 0, 0, 2, 0, 0, '', 0, 0, ''),
(3, 'music', 'system', '基本音乐回复', '1.0', '提供语音、音乐等音频类回复', '在回复规则中可选择具有语音、音乐等音频类的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝，实现一问一答得简单对话。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 2, 1, 0, 0, 0, 2, 0, 0, '', 0, 0, ''),
(4, 'userapi', 'system', '自定义接口回复', '1.1', '更方便的第三方接口设置', '自定义接口又称第三方接口，可以让开发者更方便的接入微擎系统，高效的与微信公众平台进行对接整合。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 2, 1, 0, 0, 0, 2, 0, 0, '', 0, 0, ''),
(5, 'recharge', 'system', '会员中心充值模块', '1.0', '提供会员充值功能', '', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 0, 1, 0, 0, '', '', 1, 2, 1, 0, 0, 0, 2, 0, 0, '', 0, 0, ''),
(6, 'custom', 'system', '多客服转接', '1.0.0', '用来接入腾讯的多客服系统', '', 'WeEngine Team', 'http://bbs.we7.cc', 0, 'a:0:{}', 'a:6:{i:0;s:5:"image";i:1;s:5:"voice";i:2;s:5:"video";i:3;s:8:"location";i:4;s:4:"link";i:5;s:4:"text";}', 1, 1, 0, 0, '', '', 1, 2, 1, 0, 0, 0, 2, 0, 0, '', 0, 0, ''),
(7, 'images', 'system', '基本图片回复', '1.0', '提供图片回复', '在回复规则中可选择具有图片的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝图片。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 2, 1, 0, 0, 0, 2, 0, 0, '', 0, 0, ''),
(8, 'video', 'system', '基本视频回复', '1.0', '提供图片回复', '在回复规则中可选择具有视频的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝视频。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 2, 1, 0, 0, 0, 2, 0, 0, '', 0, 0, ''),
(9, 'voice', 'system', '基本语音回复', '1.0', '提供语音回复', '在回复规则中可选择具有语音的回复内容，并根据用户所设置的特定关键字精准的返回给粉丝语音。', 'WeEngine Team', 'http://www.we7.cc/', 0, '', '', 1, 1, 0, 0, '', '', 1, 2, 1, 0, 0, 0, 2, 0, 0, '', 0, 0, ''),
(10, 'chats', 'system', '发送客服消息', '1.0', '公众号可以在粉丝最后发送消息的48小时内无限制发送消息', '', '易福网', 'http://www.efwww.com/', 0, '', '', 0, 1, 0, 0, '', '', 1, 2, 1, 0, 0, 0, 2, 0, 0, '', 0, 0, ''),
(11, 'wxcard', 'system', '微信卡券回复', '1.0', '微信卡券回复', '微信卡券回复', 'WeEngine Team', 'http://www.efwww.com', 0, '', '', 1, 1, 0, 0, '', '', 1, 2, 1, 0, 0, 0, 2, 0, 0, '', 0, 0, ''),
(12, 'store', 'business', '站内商城', '1.0', '站内商城', '站内商城', 'we7', '', 0, '', '', 0, 1, 0, 0, '', 'Z', 1, 2, 1, 0, 0, 0, 2, 0, 0, '', 0, 0, ''),
(15, 'zjhj_mall', 'business', '禾匠商城V4', '4.0.10', '禾匠商城V4', '禾匠商城V4', '懒人源码', 'https://www.lanrenzhijia.com', 0, 'a:0:{}', 'a:0:{}', 0, 0, 0, 0, 'a:0:{}', 'H', 2, 0, 1, 1, 1, 1, 1, 1, 1, 'addons/zjhj_mall/icon.jpg', 1, 1, 'local');

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_bindings`
--

CREATE TABLE `ims_modules_bindings` (
  `eid` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `entry` varchar(30) NOT NULL,
  `call` varchar(50) NOT NULL,
  `title` varchar(50) NOT NULL,
  `do` varchar(200) NOT NULL,
  `state` varchar(200) NOT NULL,
  `direct` int(11) NOT NULL,
  `url` varchar(100) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `displayorder` tinyint(255) UNSIGNED NOT NULL,
  `multilevel` tinyint(1) NOT NULL,
  `parent` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_modules_bindings`
--

INSERT INTO `ims_modules_bindings` (`eid`, `module`, `entry`, `call`, `title`, `do`, `state`, `direct`, `url`, `icon`, `displayorder`, `multilevel`, `parent`) VALUES
(3, 'zjhj_mall', 'page', '', '主页', '/pages/index/index', '', 0, '', '', 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_cloud`
--

CREATE TABLE `ims_modules_cloud` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `title_initial` varchar(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `version` varchar(10) NOT NULL,
  `install_status` tinyint(4) NOT NULL,
  `account_support` tinyint(4) NOT NULL,
  `wxapp_support` tinyint(4) NOT NULL,
  `webapp_support` tinyint(4) NOT NULL,
  `phoneapp_support` tinyint(4) NOT NULL,
  `welcome_support` tinyint(4) NOT NULL,
  `main_module_name` varchar(50) NOT NULL,
  `main_module_logo` varchar(100) NOT NULL,
  `has_new_version` tinyint(1) NOT NULL,
  `has_new_branch` tinyint(1) NOT NULL,
  `is_ban` tinyint(4) NOT NULL,
  `lastupdatetime` int(11) NOT NULL,
  `xzapp_support` tinyint(1) NOT NULL,
  `cloud_id` int(11) NOT NULL,
  `aliapp_support` tinyint(1) NOT NULL,
  `baiduapp_support` tinyint(1) NOT NULL,
  `toutiaoapp_support` tinyint(1) NOT NULL,
  `buytime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_ignore`
--

CREATE TABLE `ims_modules_ignore` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `version` varchar(15) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_plugin`
--

CREATE TABLE `ims_modules_plugin` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `main_module` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_plugin_rank`
--

CREATE TABLE `ims_modules_plugin_rank` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `rank` int(10) UNSIGNED NOT NULL,
  `plugin_name` varchar(200) NOT NULL,
  `main_module_name` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_rank`
--

CREATE TABLE `ims_modules_rank` (
  `id` int(10) UNSIGNED NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `uid` int(10) NOT NULL,
  `rank` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_modules_rank`
--

INSERT INTO `ims_modules_rank` (`id`, `module_name`, `uid`, `rank`, `uniacid`) VALUES
(1, 'zjhj_mall', 3, 0, 2);

-- --------------------------------------------------------

--
-- 表的结构 `ims_modules_recycle`
--

CREATE TABLE `ims_modules_recycle` (
  `id` int(10) NOT NULL,
  `modulename` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `account_support` tinyint(1) NOT NULL,
  `wxapp_support` tinyint(1) NOT NULL,
  `welcome_support` tinyint(1) NOT NULL,
  `webapp_support` tinyint(1) NOT NULL,
  `phoneapp_support` tinyint(1) NOT NULL,
  `xzapp_support` tinyint(1) NOT NULL,
  `aliapp_support` tinyint(1) NOT NULL,
  `baiduapp_support` tinyint(1) NOT NULL,
  `toutiaoapp_support` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_music_reply`
--

CREATE TABLE `ims_music_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `url` varchar(300) NOT NULL,
  `hqurl` varchar(300) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_news_reply`
--

CREATE TABLE `ims_news_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `thumb` varchar(500) NOT NULL,
  `content` mediumtext NOT NULL,
  `url` varchar(255) NOT NULL,
  `displayorder` int(10) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  `media_id` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_phoneapp_versions`
--

CREATE TABLE `ims_phoneapp_versions` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `version` varchar(20) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `modules` text,
  `createtime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_profile_fields`
--

CREATE TABLE `ims_profile_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `displayorder` smallint(6) NOT NULL,
  `required` tinyint(1) NOT NULL,
  `unchangeable` tinyint(1) NOT NULL,
  `showinregister` tinyint(1) NOT NULL,
  `field_length` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_profile_fields`
--

INSERT INTO `ims_profile_fields` (`id`, `field`, `available`, `title`, `description`, `displayorder`, `required`, `unchangeable`, `showinregister`, `field_length`) VALUES
(1, 'realname', 1, '真实姓名', '', 0, 1, 1, 1, 0),
(2, 'nickname', 1, '昵称', '', 1, 1, 0, 1, 0),
(3, 'avatar', 1, '头像', '', 1, 0, 0, 0, 0),
(4, 'qq', 1, 'QQ号', '', 0, 0, 0, 1, 0),
(5, 'mobile', 1, '手机号码', '', 0, 0, 0, 0, 0),
(6, 'vip', 1, 'VIP级别', '', 0, 0, 0, 0, 0),
(7, 'gender', 1, '性别', '', 0, 0, 0, 0, 0),
(8, 'birthyear', 1, '出生生日', '', 0, 0, 0, 0, 0),
(9, 'constellation', 1, '星座', '', 0, 0, 0, 0, 0),
(10, 'zodiac', 1, '生肖', '', 0, 0, 0, 0, 0),
(11, 'telephone', 1, '固定电话', '', 0, 0, 0, 0, 0),
(12, 'idcard', 1, '证件号码', '', 0, 0, 0, 0, 0),
(13, 'studentid', 1, '学号', '', 0, 0, 0, 0, 0),
(14, 'grade', 1, '班级', '', 0, 0, 0, 0, 0),
(15, 'address', 1, '邮寄地址', '', 0, 0, 0, 0, 0),
(16, 'zipcode', 1, '邮编', '', 0, 0, 0, 0, 0),
(17, 'nationality', 1, '国籍', '', 0, 0, 0, 0, 0),
(18, 'resideprovince', 1, '居住地址', '', 0, 0, 0, 0, 0),
(19, 'graduateschool', 1, '毕业学校', '', 0, 0, 0, 0, 0),
(20, 'company', 1, '公司', '', 0, 0, 0, 0, 0),
(21, 'education', 1, '学历', '', 0, 0, 0, 0, 0),
(22, 'occupation', 1, '职业', '', 0, 0, 0, 0, 0),
(23, 'position', 1, '职位', '', 0, 0, 0, 0, 0),
(24, 'revenue', 1, '年收入', '', 0, 0, 0, 0, 0),
(25, 'affectivestatus', 1, '情感状态', '', 0, 0, 0, 0, 0),
(26, 'lookingfor', 1, ' 交友目的', '', 0, 0, 0, 0, 0),
(27, 'bloodtype', 1, '血型', '', 0, 0, 0, 0, 0),
(28, 'height', 1, '身高', '', 0, 0, 0, 0, 0),
(29, 'weight', 1, '体重', '', 0, 0, 0, 0, 0),
(30, 'alipay', 1, '支付宝帐号', '', 0, 0, 0, 0, 0),
(31, 'msn', 1, 'MSN', '', 0, 0, 0, 0, 0),
(32, 'email', 1, '电子邮箱', '', 0, 0, 0, 0, 0),
(33, 'taobao', 1, '阿里旺旺', '', 0, 0, 0, 0, 0),
(34, 'site', 1, '主页', '', 0, 0, 0, 0, 0),
(35, 'bio', 1, '自我介绍', '', 0, 0, 0, 0, 0),
(36, 'interest', 1, '兴趣爱好', '', 0, 0, 0, 0, 0),
(37, 'birthmonth', 0, '出生月份', '出生月份', 0, 0, 0, 0, 0),
(38, 'birthday', 0, '出生日期', '出生日期', 0, 0, 0, 0, 0),
(39, 'credit1', 0, '积分', '积分', 0, 0, 0, 0, 0),
(40, 'credit2', 0, '余额', '余额', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_qrcode`
--

CREATE TABLE `ims_qrcode` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `type` varchar(10) NOT NULL,
  `extra` int(10) UNSIGNED NOT NULL,
  `qrcid` bigint(20) NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `model` tinyint(1) UNSIGNED NOT NULL,
  `ticket` varchar(250) NOT NULL,
  `url` varchar(256) NOT NULL,
  `expire` int(10) UNSIGNED NOT NULL,
  `subnum` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_qrcode_stat`
--

CREATE TABLE `ims_qrcode_stat` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `qid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(50) NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL,
  `qrcid` bigint(20) UNSIGNED NOT NULL,
  `scene_str` varchar(64) NOT NULL,
  `name` varchar(50) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_rule`
--

CREATE TABLE `ims_rule` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` int(10) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `containtype` varchar(100) NOT NULL,
  `reply_type` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_rule`
--

INSERT INTO `ims_rule` (`id`, `uniacid`, `name`, `module`, `displayorder`, `status`, `containtype`, `reply_type`) VALUES
(1, 0, '城市天气', 'userapi', 255, 1, '', 0),
(2, 0, '百度百科', 'userapi', 255, 1, '', 0),
(3, 0, '即时翻译', 'userapi', 255, 1, '', 0),
(4, 0, '今日老黄历', 'userapi', 255, 1, '', 0),
(5, 0, '看新闻', 'userapi', 255, 1, '', 0),
(6, 0, '快递查询', 'userapi', 255, 1, '', 0),
(7, 1, '个人中心入口设置', 'cover', 0, 1, '', 0),
(8, 1, '微擎团队入口设置', 'cover', 0, 1, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_rule_keyword`
--

CREATE TABLE `ims_rule_keyword` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `module` varchar(50) NOT NULL,
  `content` varchar(255) NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_rule_keyword`
--

INSERT INTO `ims_rule_keyword` (`id`, `rid`, `uniacid`, `module`, `content`, `type`, `displayorder`, `status`) VALUES
(1, 1, 0, 'userapi', '^.+天气$', 3, 255, 1),
(2, 2, 0, 'userapi', '^百科.+$', 3, 255, 1),
(3, 2, 0, 'userapi', '^定义.+$', 3, 255, 1),
(4, 3, 0, 'userapi', '^@.+$', 3, 255, 1),
(5, 4, 0, 'userapi', '日历', 1, 255, 1),
(6, 4, 0, 'userapi', '万年历', 1, 255, 1),
(7, 4, 0, 'userapi', '黄历', 1, 255, 1),
(8, 4, 0, 'userapi', '几号', 1, 255, 1),
(9, 5, 0, 'userapi', '新闻', 1, 255, 1),
(10, 6, 0, 'userapi', '^(申通|圆通|中通|汇通|韵达|顺丰|EMS) *[a-z0-9]{1,}$', 3, 255, 1),
(11, 7, 1, 'cover', '个人中心', 1, 0, 1),
(12, 8, 1, 'cover', '首页', 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_article`
--

CREATE TABLE `ims_site_article` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `kid` int(10) UNSIGNED NOT NULL,
  `iscommend` tinyint(1) NOT NULL,
  `ishot` tinyint(1) UNSIGNED NOT NULL,
  `pcate` int(10) UNSIGNED NOT NULL,
  `ccate` int(10) UNSIGNED NOT NULL,
  `template` varchar(300) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `content` mediumtext NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `incontent` tinyint(1) NOT NULL,
  `source` varchar(255) NOT NULL,
  `author` varchar(50) NOT NULL,
  `displayorder` int(10) UNSIGNED NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `edittime` int(10) NOT NULL,
  `click` int(10) UNSIGNED NOT NULL,
  `type` varchar(10) NOT NULL,
  `credit` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_article_comment`
--

CREATE TABLE `ims_site_article_comment` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `articleid` int(10) UNSIGNED NOT NULL,
  `parentid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `openid` varchar(50) NOT NULL,
  `content` text,
  `is_read` tinyint(1) NOT NULL,
  `iscomment` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_category`
--

CREATE TABLE `ims_site_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `nid` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `parentid` int(10) UNSIGNED NOT NULL,
  `displayorder` tinyint(3) UNSIGNED NOT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL,
  `icon` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `styleid` int(10) UNSIGNED NOT NULL,
  `linkurl` varchar(500) NOT NULL,
  `ishomepage` tinyint(1) NOT NULL,
  `icontype` tinyint(1) UNSIGNED NOT NULL,
  `css` varchar(500) NOT NULL,
  `multiid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_multi`
--

CREATE TABLE `ims_site_multi` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `styleid` int(10) UNSIGNED NOT NULL,
  `site_info` text NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `bindhost` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_site_multi`
--

INSERT INTO `ims_site_multi` (`id`, `uniacid`, `title`, `styleid`, `site_info`, `status`, `bindhost`) VALUES
(1, 1, '微擎团队', 1, '', 1, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_nav`
--

CREATE TABLE `ims_site_nav` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `multiid` int(10) UNSIGNED NOT NULL,
  `section` tinyint(4) NOT NULL,
  `module` varchar(50) NOT NULL,
  `displayorder` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `position` tinyint(4) NOT NULL,
  `url` varchar(255) NOT NULL,
  `icon` varchar(500) NOT NULL,
  `css` varchar(1000) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `categoryid` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_page`
--

CREATE TABLE `ims_site_page` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `multiid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `params` longtext NOT NULL,
  `html` longtext NOT NULL,
  `multipage` longtext NOT NULL,
  `type` tinyint(1) UNSIGNED NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `goodnum` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_slide`
--

CREATE TABLE `ims_site_slide` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `multiid` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `thumb` varchar(255) NOT NULL,
  `displayorder` tinyint(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_store_cash_log`
--

CREATE TABLE `ims_site_store_cash_log` (
  `id` int(10) UNSIGNED NOT NULL,
  `founder_uid` int(10) NOT NULL,
  `number` char(30) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `create_time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_store_cash_order`
--

CREATE TABLE `ims_site_store_cash_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `number` char(30) NOT NULL,
  `founder_uid` int(10) NOT NULL,
  `order_id` int(10) NOT NULL,
  `goods_id` int(10) NOT NULL,
  `order_amount` decimal(10,2) NOT NULL,
  `cash_log_id` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `create_time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_store_create_account`
--

CREATE TABLE `ims_site_store_create_account` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `type` tinyint(4) NOT NULL,
  `endtime` int(12) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_store_goods`
--

CREATE TABLE `ims_site_store_goods` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` tinyint(1) NOT NULL,
  `title` varchar(100) NOT NULL,
  `module` varchar(50) NOT NULL,
  `account_num` int(10) NOT NULL,
  `wxapp_num` int(10) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `unit` varchar(15) NOT NULL,
  `slide` varchar(1000) NOT NULL,
  `category_id` int(10) NOT NULL,
  `title_initial` varchar(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  `synopsis` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `module_group` int(10) NOT NULL,
  `api_num` int(10) NOT NULL,
  `user_group` int(10) NOT NULL,
  `user_group_price` varchar(1000) DEFAULT NULL,
  `account_group` int(10) NOT NULL,
  `is_wish` tinyint(1) NOT NULL,
  `logo` varchar(300) NOT NULL,
  `platform_num` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_store_goods_cloud`
--

CREATE TABLE `ims_site_store_goods_cloud` (
  `id` int(10) UNSIGNED NOT NULL,
  `cloud_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `logo` varchar(300) NOT NULL,
  `wish_branch` int(10) NOT NULL,
  `is_edited` tinyint(1) NOT NULL,
  `isdeleted` tinyint(1) NOT NULL,
  `branchs` varchar(6000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_store_order`
--

CREATE TABLE `ims_site_store_order` (
  `id` int(10) UNSIGNED NOT NULL,
  `orderid` varchar(28) NOT NULL,
  `goodsid` int(10) NOT NULL,
  `duration` int(10) NOT NULL,
  `buyer` varchar(50) NOT NULL,
  `buyerid` int(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `changeprice` tinyint(1) NOT NULL,
  `createtime` int(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `endtime` int(15) NOT NULL,
  `wxapp` int(15) NOT NULL,
  `is_wish` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_styles`
--

CREATE TABLE `ims_site_styles` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `templateid` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_site_styles`
--

INSERT INTO `ims_site_styles` (`id`, `uniacid`, `templateid`, `name`) VALUES
(1, 1, 1, '微站默认模板_gC5C');

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_styles_vars`
--

CREATE TABLE `ims_site_styles_vars` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `templateid` int(10) UNSIGNED NOT NULL,
  `styleid` int(10) UNSIGNED NOT NULL,
  `variable` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `description` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_site_templates`
--

CREATE TABLE `ims_site_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `version` varchar(64) NOT NULL,
  `description` varchar(500) NOT NULL,
  `author` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `sections` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_site_templates`
--

INSERT INTO `ims_site_templates` (`id`, `name`, `title`, `version`, `description`, `author`, `url`, `type`, `sections`) VALUES
(1, 'default', '微站默认模板', '', '由微擎提供默认微站模板套系', '易福团队', 'http://www.efwww.com', '1', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_fans`
--

CREATE TABLE `ims_stat_fans` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `new` int(10) UNSIGNED NOT NULL,
  `cancel` int(10) UNSIGNED NOT NULL,
  `cumulate` int(10) NOT NULL,
  `date` varchar(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_stat_fans`
--

INSERT INTO `ims_stat_fans` (`id`, `uniacid`, `new`, `cancel`, `cumulate`, `date`) VALUES
(1, 1, 0, 0, 0, '20190902'),
(2, 1, 0, 0, 0, '20190901'),
(3, 1, 0, 0, 0, '20190831'),
(4, 1, 0, 0, 0, '20190830'),
(5, 1, 0, 0, 0, '20190829'),
(6, 1, 0, 0, 0, '20190828'),
(7, 1, 0, 0, 0, '20190827');

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_keyword`
--

CREATE TABLE `ims_stat_keyword` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `rid` varchar(10) NOT NULL,
  `kid` int(10) UNSIGNED NOT NULL,
  `hit` int(10) UNSIGNED NOT NULL,
  `lastupdate` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_msg_history`
--

CREATE TABLE `ims_stat_msg_history` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `kid` int(10) UNSIGNED NOT NULL,
  `from_user` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL,
  `message` varchar(1000) NOT NULL,
  `type` varchar(10) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_rule`
--

CREATE TABLE `ims_stat_rule` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `hit` int(10) UNSIGNED NOT NULL,
  `lastupdate` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_visit`
--

CREATE TABLE `ims_stat_visit` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) NOT NULL,
  `module` varchar(100) NOT NULL,
  `count` int(10) UNSIGNED NOT NULL,
  `date` int(10) UNSIGNED NOT NULL,
  `type` varchar(10) NOT NULL,
  `ip_count` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_stat_visit`
--

INSERT INTO `ims_stat_visit` (`id`, `uniacid`, `module`, `count`, `date`, `type`, `ip_count`) VALUES
(1, 0, '', 67, 20190903, 'web', 1),
(2, 1, 'we7_account', 3, 20190903, 'web', 0),
(3, 1, '', 60, 20190903, 'web', 0),
(4, 1, 'we7_api', 2, 20190903, 'app', 0),
(5, 2, '', 37, 20190903, 'web', 0),
(6, 2, 'we7_account', 2, 20190903, 'web', 0),
(7, 2, '', 6, 20190904, 'web', 1),
(8, 2, 'we7_api', 2, 20190904, 'app', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_stat_visit_ip`
--

CREATE TABLE `ims_stat_visit_ip` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` bigint(10) NOT NULL,
  `uniacid` int(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `module` varchar(100) NOT NULL,
  `date` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_stat_visit_ip`
--

INSERT INTO `ims_stat_visit_ip` (`id`, `ip`, `uniacid`, `type`, `module`, `date`) VALUES
(1, 2130706433, 0, 'web', '', 20190903),
(2, 2130706433, 2, 'web', '', 20190904);

-- --------------------------------------------------------

--
-- 表的结构 `ims_system_stat_visit`
--

CREATE TABLE `ims_system_stat_visit` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `modulename` varchar(100) NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `displayorder` int(10) NOT NULL,
  `createtime` int(10) NOT NULL,
  `updatetime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account`
--

CREATE TABLE `ims_uni_account` (
  `uniacid` int(10) UNSIGNED NOT NULL,
  `groupid` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `default_acid` int(10) UNSIGNED NOT NULL,
  `rank` int(10) DEFAULT NULL,
  `title_initial` varchar(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_uni_account`
--

INSERT INTO `ims_uni_account` (`uniacid`, `groupid`, `name`, `description`, `default_acid`, `rank`, `title_initial`) VALUES
(1, -1, '易福团队', '一个朝气蓬勃的团队', 1, NULL, 'W'),
(2, 0, '测试', '啊基金啊就是', 2, NULL, 'C');

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_group`
--

CREATE TABLE `ims_uni_account_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `groupid` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_uni_account_group`
--

INSERT INTO `ims_uni_account_group` (`id`, `uniacid`, `groupid`) VALUES
(1, 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_menus`
--

CREATE TABLE `ims_uni_account_menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `menuid` int(10) UNSIGNED NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `sex` tinyint(3) UNSIGNED NOT NULL,
  `group_id` int(10) NOT NULL,
  `client_platform_type` tinyint(3) UNSIGNED NOT NULL,
  `area` varchar(50) NOT NULL,
  `data` text NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `isdeleted` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_modules`
--

CREATE TABLE `ims_uni_account_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `module` varchar(50) NOT NULL,
  `enabled` tinyint(1) UNSIGNED NOT NULL,
  `settings` text NOT NULL,
  `shortcut` tinyint(1) UNSIGNED NOT NULL,
  `displayorder` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_modules_shortcut`
--

CREATE TABLE `ims_uni_account_modules_shortcut` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(200) NOT NULL,
  `url` varchar(250) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `version_id` int(10) UNSIGNED NOT NULL,
  `module_name` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_account_users`
--

CREATE TABLE `ims_uni_account_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `role` varchar(255) NOT NULL,
  `rank` tinyint(3) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_uni_account_users`
--

INSERT INTO `ims_uni_account_users` (`id`, `uniacid`, `uid`, `role`, `rank`) VALUES
(1, 2, 3, 'owner', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_group`
--

CREATE TABLE `ims_uni_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner_uid` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `modules` text NOT NULL,
  `templates` varchar(5000) NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_uni_group`
--

INSERT INTO `ims_uni_group` (`id`, `owner_uid`, `name`, `modules`, `templates`, `uniacid`, `uid`) VALUES
(1, 0, '体验套餐服务', 'a:1:{s:5:"wxapp";a:1:{i:0;s:9:"zjhj_mall";}}', 'N;', 0, 0),
(2, 0, '', 'a:5:{s:7:"modules";a:0:{}s:5:"wxapp";a:0:{}s:6:"webapp";a:0:{}s:5:"xzapp";a:0:{}s:8:"phoneapp";a:0:{}}', 'a:0:{}', 2, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_link_uniacid`
--

CREATE TABLE `ims_uni_link_uniacid` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) NOT NULL,
  `link_uniacid` int(10) NOT NULL,
  `version_id` int(10) NOT NULL,
  `module_name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_modules`
--

CREATE TABLE `ims_uni_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) NOT NULL,
  `module_name` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_uni_modules`
--

INSERT INTO `ims_uni_modules` (`id`, `uniacid`, `module_name`) VALUES
(3, 2, 'zjhj_mall');

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_settings`
--

CREATE TABLE `ims_uni_settings` (
  `uniacid` int(10) UNSIGNED NOT NULL,
  `passport` varchar(200) NOT NULL,
  `oauth` varchar(100) NOT NULL,
  `jsauth_acid` int(10) UNSIGNED NOT NULL,
  `uc` varchar(700) NOT NULL,
  `notify` varchar(2000) NOT NULL,
  `creditnames` varchar(500) NOT NULL,
  `creditbehaviors` varchar(500) NOT NULL,
  `welcome` varchar(60) NOT NULL,
  `default` varchar(60) NOT NULL,
  `default_message` varchar(2000) NOT NULL,
  `payment` text NOT NULL,
  `stat` varchar(300) NOT NULL,
  `default_site` int(10) UNSIGNED DEFAULT NULL,
  `sync` tinyint(3) UNSIGNED NOT NULL,
  `recharge` varchar(500) NOT NULL,
  `tplnotice` varchar(2000) NOT NULL,
  `grouplevel` tinyint(3) UNSIGNED NOT NULL,
  `mcplugin` varchar(500) NOT NULL,
  `exchange_enable` tinyint(3) UNSIGNED NOT NULL,
  `coupon_type` tinyint(3) UNSIGNED NOT NULL,
  `menuset` text NOT NULL,
  `statistics` varchar(100) NOT NULL,
  `bind_domain` varchar(200) NOT NULL,
  `comment_status` tinyint(1) NOT NULL,
  `reply_setting` tinyint(4) NOT NULL,
  `default_module` varchar(100) NOT NULL,
  `attachment_limit` int(11) DEFAULT NULL,
  `attachment_size` varchar(20) DEFAULT NULL,
  `sync_member` tinyint(1) NOT NULL,
  `remote` varchar(2000) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_uni_settings`
--

INSERT INTO `ims_uni_settings` (`uniacid`, `passport`, `oauth`, `jsauth_acid`, `uc`, `notify`, `creditnames`, `creditbehaviors`, `welcome`, `default`, `default_message`, `payment`, `stat`, `default_site`, `sync`, `recharge`, `tplnotice`, `grouplevel`, `mcplugin`, `exchange_enable`, `coupon_type`, `menuset`, `statistics`, `bind_domain`, `comment_status`, `reply_setting`, `default_module`, `attachment_limit`, `attachment_size`, `sync_member`, `remote`) VALUES
(1, 'a:3:{s:8:"focusreg";i:0;s:4:"item";s:5:"email";s:4:"type";s:8:"password";}', '', 0, 'a:1:{s:6:"status";i:0;}', 'a:1:{s:3:"sms";a:2:{s:7:"balance";i:0;s:9:"signature";s:0:"";}}', 'a:5:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}s:7:"credit3";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit4";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}s:7:"credit5";a:2:{s:5:"title";s:0:"";s:7:"enabled";i:0;}}', 'a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}', '', '', '', 'a:4:{s:6:"credit";a:3:{s:6:"switch";b:0;s:15:"recharge_switch";b:0;s:10:"pay_switch";b:0;}s:6:"alipay";a:6:{s:6:"switch";b:0;s:7:"account";s:0:"";s:7:"partner";s:0:"";s:6:"secret";s:0:"";s:15:"recharge_switch";b:0;s:10:"pay_switch";b:0;}s:6:"wechat";a:7:{s:6:"switch";b:0;s:7:"account";b:0;s:7:"signkey";s:0:"";s:7:"partner";s:0:"";s:3:"key";s:0:"";s:15:"recharge_switch";b:0;s:10:"pay_switch";b:0;}s:8:"delivery";a:3:{s:6:"switch";b:0;s:15:"recharge_switch";b:0;s:10:"pay_switch";b:0;}}', '', 1, 0, '', '', 0, '', 0, 0, '', '', '', 0, 0, '', NULL, NULL, 0, ''),
(2, '', '', 0, '', '', 'a:2:{s:7:"credit1";a:2:{s:5:"title";s:6:"积分";s:7:"enabled";i:1;}s:7:"credit2";a:2:{s:5:"title";s:6:"余额";s:7:"enabled";i:1;}}', 'a:2:{s:8:"activity";s:7:"credit1";s:8:"currency";s:7:"credit2";}', '', '', '', '', '', NULL, 0, '', '', 0, '', 0, 0, '', '', '', 0, 0, '', NULL, NULL, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_uni_verifycode`
--

CREATE TABLE `ims_uni_verifycode` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `verifycode` varchar(6) NOT NULL,
  `total` tinyint(3) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `failed_count` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_userapi_cache`
--

CREATE TABLE `ims_userapi_cache` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(32) NOT NULL,
  `content` text NOT NULL,
  `lastupdate` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_userapi_reply`
--

CREATE TABLE `ims_userapi_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `description` varchar(300) NOT NULL,
  `apiurl` varchar(300) NOT NULL,
  `token` varchar(32) NOT NULL,
  `default_text` varchar(100) NOT NULL,
  `cachetime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_userapi_reply`
--

INSERT INTO `ims_userapi_reply` (`id`, `rid`, `description`, `apiurl`, `token`, `default_text`, `cachetime`) VALUES
(1, 1, '"城市名+天气", 如: "北京天气"', 'weather.php', '', '', 0),
(2, 2, '"百科+查询内容" 或 "定义+查询内容", 如: "百科姚明", "定义自行车"', 'baike.php', '', '', 0),
(3, 3, '"@查询内容(中文或英文)"', 'translate.php', '', '', 0),
(4, 4, '"日历", "万年历", "黄历"或"几号"', 'calendar.php', '', '', 0),
(5, 5, '"新闻"', 'news.php', '', '', 0),
(6, 6, '"快递+单号", 如: "申通1200041125"', 'express.php', '', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_users`
--

CREATE TABLE `ims_users` (
  `uid` int(10) UNSIGNED NOT NULL,
  `owner_uid` int(10) NOT NULL,
  `groupid` int(10) UNSIGNED NOT NULL,
  `founder_groupid` tinyint(4) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(200) NOT NULL,
  `salt` varchar(10) NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL,
  `joindate` int(10) UNSIGNED NOT NULL,
  `joinip` varchar(15) NOT NULL,
  `lastvisit` int(10) UNSIGNED NOT NULL,
  `lastip` varchar(15) NOT NULL,
  `remark` varchar(500) NOT NULL,
  `starttime` int(10) UNSIGNED NOT NULL,
  `endtime` int(10) UNSIGNED NOT NULL,
  `register_type` tinyint(3) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `welcome_link` tinyint(4) NOT NULL,
  `is_bind` tinyint(1) NOT NULL,
  `notice_setting` varchar(5000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_users`
--

INSERT INTO `ims_users` (`uid`, `owner_uid`, `groupid`, `founder_groupid`, `username`, `password`, `salt`, `type`, `status`, `joindate`, `joinip`, `lastvisit`, `lastip`, `remark`, `starttime`, `endtime`, `register_type`, `openid`, `welcome_link`, `is_bind`, `notice_setting`) VALUES
(1, 0, 1, 0, 'admin', 'a8a5665757618c70b2ea59b2b82752e59368584c', 'ffae43bb', 0, 0, 1567491817, '', 1567492345, '127.0.0.1', '', 0, 0, 0, '', 0, 0, ''),
(2, 0, 0, 0, 'xiaochengxu', 'cd9775a266c1ca3defee5bc1bd795ff5ac00667a', 'G4Z44e15', 1, 2, 1567492037, '127.0.0.1', 1567492063, '127.0.0.1', '', 1567492037, 0, 0, '', 0, 0, ''),
(3, 0, 1, 0, 'test01', '30f6f83a072c33cf63228cc47ccfeaebec25745f', 'BDE0angp', 1, 2, 1567492653, '127.0.0.1', 1567492653, '127.0.0.1', 'test01', 1567492653, 2, 0, '', 0, 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_bind`
--

CREATE TABLE `ims_users_bind` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `bind_sign` varchar(50) NOT NULL,
  `third_type` tinyint(4) NOT NULL,
  `third_nickname` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_create_group`
--

CREATE TABLE `ims_users_create_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_name` varchar(50) NOT NULL,
  `maxaccount` int(10) UNSIGNED NOT NULL,
  `maxwxapp` int(10) UNSIGNED NOT NULL,
  `maxwebapp` int(10) UNSIGNED NOT NULL,
  `maxphoneapp` int(10) UNSIGNED NOT NULL,
  `maxxzapp` int(10) UNSIGNED NOT NULL,
  `maxaliapp` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `maxbaiduapp` int(10) NOT NULL,
  `maxtoutiaoapp` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_extra_group`
--

CREATE TABLE `ims_users_extra_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `uni_group_id` int(10) UNSIGNED NOT NULL,
  `create_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_users_extra_group`
--

INSERT INTO `ims_users_extra_group` (`id`, `uid`, `uni_group_id`, `create_group_id`) VALUES
(1, 3, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_extra_limit`
--

CREATE TABLE `ims_users_extra_limit` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `maxaccount` int(10) UNSIGNED NOT NULL,
  `maxwxapp` int(10) UNSIGNED NOT NULL,
  `maxwebapp` int(10) UNSIGNED NOT NULL,
  `maxphoneapp` int(10) UNSIGNED NOT NULL,
  `maxxzapp` int(10) UNSIGNED NOT NULL,
  `maxaliapp` int(10) UNSIGNED NOT NULL,
  `timelimit` int(10) UNSIGNED NOT NULL,
  `maxbaiduapp` int(10) NOT NULL,
  `maxtoutiaoapp` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_extra_modules`
--

CREATE TABLE `ims_users_extra_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `module_name` varchar(100) NOT NULL,
  `support` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_users_extra_modules`
--

INSERT INTO `ims_users_extra_modules` (`id`, `uid`, `module_name`, `support`) VALUES
(1, 3, 'zjhj_mall', 'wxapp_support');

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_extra_templates`
--

CREATE TABLE `ims_users_extra_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `template_id` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_failed_login`
--

CREATE TABLE `ims_users_failed_login` (
  `id` int(10) UNSIGNED NOT NULL,
  `ip` varchar(15) NOT NULL,
  `username` varchar(32) NOT NULL,
  `count` tinyint(1) UNSIGNED NOT NULL,
  `lastupdate` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_founder_group`
--

CREATE TABLE `ims_users_founder_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `package` varchar(5000) NOT NULL,
  `maxaccount` int(10) UNSIGNED NOT NULL,
  `maxsubaccount` int(10) UNSIGNED NOT NULL,
  `timelimit` int(10) UNSIGNED NOT NULL,
  `maxwxapp` int(10) UNSIGNED NOT NULL,
  `maxwebapp` int(10) NOT NULL DEFAULT '0',
  `maxphoneapp` int(10) NOT NULL,
  `maxxzapp` int(10) NOT NULL,
  `maxaliapp` int(10) NOT NULL,
  `maxbaiduapp` int(10) NOT NULL,
  `maxtoutiaoapp` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_founder_own_create_groups`
--

CREATE TABLE `ims_users_founder_own_create_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `founder_uid` int(10) UNSIGNED NOT NULL,
  `create_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_founder_own_uni_groups`
--

CREATE TABLE `ims_users_founder_own_uni_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `founder_uid` int(10) UNSIGNED NOT NULL,
  `uni_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_founder_own_users`
--

CREATE TABLE `ims_users_founder_own_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `founder_uid` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_founder_own_users_groups`
--

CREATE TABLE `ims_users_founder_own_users_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `founder_uid` int(10) UNSIGNED NOT NULL,
  `users_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_group`
--

CREATE TABLE `ims_users_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner_uid` int(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `package` varchar(5000) NOT NULL,
  `maxaccount` int(10) UNSIGNED NOT NULL,
  `maxsubaccount` int(10) UNSIGNED NOT NULL,
  `timelimit` int(10) UNSIGNED NOT NULL,
  `maxwxapp` int(10) UNSIGNED NOT NULL,
  `maxwebapp` int(10) NOT NULL DEFAULT '0',
  `maxphoneapp` int(10) NOT NULL,
  `maxxzapp` int(10) NOT NULL,
  `maxaliapp` int(10) NOT NULL,
  `maxbaiduapp` int(10) NOT NULL,
  `maxtoutiaoapp` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_users_group`
--

INSERT INTO `ims_users_group` (`id`, `owner_uid`, `name`, `package`, `maxaccount`, `maxsubaccount`, `timelimit`, `maxwxapp`, `maxwebapp`, `maxphoneapp`, `maxxzapp`, `maxaliapp`, `maxbaiduapp`, `maxtoutiaoapp`) VALUES
(1, 0, 'ces', 'a:1:{i:0;i:1;}', 10, 0, 0, 10, 10, 10, 10, 10, 10, 10);

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_invitation`
--

CREATE TABLE `ims_users_invitation` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(64) NOT NULL,
  `fromuid` int(10) UNSIGNED NOT NULL,
  `inviteuid` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_lastuse`
--

CREATE TABLE `ims_users_lastuse` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) NOT NULL,
  `uniacid` int(10) DEFAULT NULL,
  `modulename` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_users_lastuse`
--

INSERT INTO `ims_users_lastuse` (`id`, `uid`, `uniacid`, `modulename`, `type`) VALUES
(1, 1, 2, '', 'account_display');

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_permission`
--

CREATE TABLE `ims_users_permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `type` varchar(100) NOT NULL,
  `permission` varchar(10000) NOT NULL,
  `url` varchar(255) NOT NULL,
  `modules` text NOT NULL,
  `templates` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_users_profile`
--

CREATE TABLE `ims_users_profile` (
  `id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `edittime` int(10) NOT NULL,
  `realname` varchar(10) NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `qq` varchar(15) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `fakeid` varchar(30) NOT NULL,
  `vip` tinyint(3) UNSIGNED NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `birthyear` smallint(6) UNSIGNED NOT NULL,
  `birthmonth` tinyint(3) UNSIGNED NOT NULL,
  `birthday` tinyint(3) UNSIGNED NOT NULL,
  `constellation` varchar(10) NOT NULL,
  `zodiac` varchar(5) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `idcard` varchar(30) NOT NULL,
  `studentid` varchar(50) NOT NULL,
  `grade` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipcode` varchar(10) NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `resideprovince` varchar(30) NOT NULL,
  `residecity` varchar(30) NOT NULL,
  `residedist` varchar(30) NOT NULL,
  `graduateschool` varchar(50) NOT NULL,
  `company` varchar(50) NOT NULL,
  `education` varchar(10) NOT NULL,
  `occupation` varchar(30) NOT NULL,
  `position` varchar(30) NOT NULL,
  `revenue` varchar(10) NOT NULL,
  `affectivestatus` varchar(30) NOT NULL,
  `lookingfor` varchar(255) NOT NULL,
  `bloodtype` varchar(5) NOT NULL,
  `height` varchar(5) NOT NULL,
  `weight` varchar(5) NOT NULL,
  `alipay` varchar(30) NOT NULL,
  `msn` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `taobao` varchar(30) NOT NULL,
  `site` varchar(30) NOT NULL,
  `bio` text NOT NULL,
  `interest` text NOT NULL,
  `workerid` varchar(64) NOT NULL,
  `is_send_mobile_status` tinyint(3) NOT NULL,
  `send_expire_status` tinyint(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_video_reply`
--

CREATE TABLE `ims_video_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_voice_reply`
--

CREATE TABLE `ims_voice_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `title` varchar(50) NOT NULL,
  `mediaid` varchar(255) NOT NULL,
  `createtime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wechat_attachment`
--

CREATE TABLE `ims_wechat_attachment` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `acid` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `filename` varchar(255) NOT NULL,
  `attachment` varchar(255) NOT NULL,
  `media_id` varchar(255) NOT NULL,
  `width` int(10) UNSIGNED NOT NULL,
  `height` int(10) UNSIGNED NOT NULL,
  `type` varchar(15) NOT NULL,
  `model` varchar(25) NOT NULL,
  `tag` varchar(5000) NOT NULL,
  `createtime` int(10) UNSIGNED NOT NULL,
  `module_upload_dir` varchar(100) NOT NULL,
  `group_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wechat_news`
--

CREATE TABLE `ims_wechat_news` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED DEFAULT NULL,
  `attach_id` int(10) UNSIGNED NOT NULL,
  `thumb_media_id` varchar(60) NOT NULL,
  `thumb_url` varchar(255) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(30) NOT NULL,
  `digest` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `content_source_url` varchar(200) NOT NULL,
  `show_cover_pic` tinyint(3) UNSIGNED NOT NULL,
  `url` varchar(200) NOT NULL,
  `displayorder` int(2) NOT NULL,
  `need_open_comment` tinyint(1) NOT NULL,
  `only_fans_can_comment` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxapp_general_analysis`
--

CREATE TABLE `ims_wxapp_general_analysis` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) NOT NULL,
  `session_cnt` int(10) NOT NULL,
  `visit_pv` int(10) NOT NULL,
  `visit_uv` int(10) NOT NULL,
  `visit_uv_new` int(10) NOT NULL,
  `type` tinyint(2) NOT NULL,
  `stay_time_uv` varchar(10) NOT NULL,
  `stay_time_session` varchar(10) NOT NULL,
  `visit_depth` varchar(10) NOT NULL,
  `ref_date` varchar(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxapp_versions`
--

CREATE TABLE `ims_wxapp_versions` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniacid` int(10) UNSIGNED NOT NULL,
  `multiid` int(10) UNSIGNED NOT NULL,
  `version` varchar(10) NOT NULL,
  `description` varchar(255) NOT NULL,
  `modules` varchar(1000) NOT NULL,
  `design_method` tinyint(1) NOT NULL,
  `template` int(10) NOT NULL,
  `quickmenu` varchar(2500) NOT NULL,
  `createtime` int(10) NOT NULL,
  `type` int(2) NOT NULL DEFAULT '0',
  `entry_id` int(11) NOT NULL DEFAULT '0',
  `appjson` text NOT NULL,
  `default_appjson` text NOT NULL,
  `use_default` tinyint(1) NOT NULL DEFAULT '1',
  `redirect` varchar(300) NOT NULL,
  `connection` varchar(1000) NOT NULL,
  `last_modules` varchar(1000) DEFAULT NULL,
  `tominiprogram` varchar(1000) NOT NULL,
  `upload_time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `ims_wxapp_versions`
--

INSERT INTO `ims_wxapp_versions` (`id`, `uniacid`, `multiid`, `version`, `description`, `modules`, `design_method`, `template`, `quickmenu`, `createtime`, `type`, `entry_id`, `appjson`, `default_appjson`, `use_default`, `redirect`, `connection`, `last_modules`, `tominiprogram`, `upload_time`) VALUES
(1, 2, 0, '0.1', '11', 'a:1:{s:9:"zjhj_mall";a:2:{s:4:"name";s:9:"zjhj_mall";s:7:"version";s:6:"4.0.10";}}', 3, 0, '', 1567492852, 0, 0, '', '', 1, '', '', NULL, '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `ims_wxcard_reply`
--

CREATE TABLE `ims_wxcard_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `rid` int(10) UNSIGNED NOT NULL,
  `title` varchar(30) NOT NULL,
  `card_id` varchar(50) NOT NULL,
  `cid` int(10) UNSIGNED NOT NULL,
  `brand_name` varchar(30) NOT NULL,
  `logo_url` varchar(255) NOT NULL,
  `success` varchar(255) NOT NULL,
  `error` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hjmall_action_log`
--
ALTER TABLE `hjmall_action_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_ad`
--
ALTER TABLE `hjmall_ad`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_address`
--
ALTER TABLE `hjmall_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_default` (`is_default`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_admin`
--
ALTER TABLE `hjmall_admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `hjmall_admin_permission`
--
ALTER TABLE `hjmall_admin_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `hjmall_admin_register`
--
ALTER TABLE `hjmall_admin_register`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `hjmall_article`
--
ALTER TABLE `hjmall_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_attr`
--
ALTER TABLE `hjmall_attr`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_default` (`is_default`);

--
-- Indexes for table `hjmall_attr_group`
--
ALTER TABLE `hjmall_attr_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_auth_role`
--
ALTER TABLE `hjmall_auth_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_auth_role_permission`
--
ALTER TABLE `hjmall_auth_role_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_banner`
--
ALTER TABLE `hjmall_banner`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_bargain_goods`
--
ALTER TABLE `hjmall_bargain_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_id` (`goods_id`) USING BTREE,
  ADD KEY `store_id` (`store_id`) USING BTREE;

--
-- Indexes for table `hjmall_bargain_order`
--
ALTER TABLE `hjmall_bargain_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE;

--
-- Indexes for table `hjmall_bargain_setting`
--
ALTER TABLE `hjmall_bargain_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_bargain_user_order`
--
ALTER TABLE `hjmall_bargain_user_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`) USING BTREE,
  ADD KEY `user_id` (`user_id`) USING BTREE,
  ADD KEY `order_id` (`order_id`) USING BTREE;

--
-- Indexes for table `hjmall_card`
--
ALTER TABLE `hjmall_card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_cart`
--
ALTER TABLE `hjmall_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_cash`
--
ALTER TABLE `hjmall_cash`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_cat`
--
ALTER TABLE `hjmall_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_show` (`is_show`);

--
-- Indexes for table `hjmall_color`
--
ALTER TABLE `hjmall_color`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `hjmall_coupon`
--
ALTER TABLE `hjmall_coupon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_join` (`is_join`);

--
-- Indexes for table `hjmall_coupon_auto_send`
--
ALTER TABLE `hjmall_coupon_auto_send`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_delivery`
--
ALTER TABLE `hjmall_delivery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_diy_page`
--
ALTER TABLE `hjmall_diy_page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_diy_template`
--
ALTER TABLE `hjmall_diy_template`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_express`
--
ALTER TABLE `hjmall_express`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `hjmall_favorite`
--
ALTER TABLE `hjmall_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_file_group`
--
ALTER TABLE `hjmall_file_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_default` (`is_default`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_form`
--
ALTER TABLE `hjmall_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_form_id`
--
ALTER TABLE `hjmall_form_id`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_no` (`order_no`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_free_delivery_rules`
--
ALTER TABLE `hjmall_free_delivery_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_fxhb_hongbao`
--
ALTER TABLE `hjmall_fxhb_hongbao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_expire` (`is_expire`),
  ADD KEY `is_finish` (`is_finish`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_fxhb_setting`
--
ALTER TABLE `hjmall_fxhb_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_goods`
--
ALTER TABLE `hjmall_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `hjmall_goods_card`
--
ALTER TABLE `hjmall_goods_card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `hjmall_goods_cat`
--
ALTER TABLE `hjmall_goods_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_id` (`goods_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `hjmall_goods_pic`
--
ALTER TABLE `hjmall_goods_pic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_id` (`goods_id`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `hjmall_goods_share`
--
ALTER TABLE `hjmall_goods_share`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_gwd_buy_list`
--
ALTER TABLE `hjmall_gwd_buy_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_gwd_like_list`
--
ALTER TABLE `hjmall_gwd_like_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_gwd_like_user`
--
ALTER TABLE `hjmall_gwd_like_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_gwd_setting`
--
ALTER TABLE `hjmall_gwd_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_home_block`
--
ALTER TABLE `hjmall_home_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_home_nav`
--
ALTER TABLE `hjmall_home_nav`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_integral_cat`
--
ALTER TABLE `hjmall_integral_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_integral_coupon_order`
--
ALTER TABLE `hjmall_integral_coupon_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_integral_goods`
--
ALTER TABLE `hjmall_integral_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_integral_log`
--
ALTER TABLE `hjmall_integral_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_integral_order`
--
ALTER TABLE `hjmall_integral_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_integral_order_detail`
--
ALTER TABLE `hjmall_integral_order_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_integral_setting`
--
ALTER TABLE `hjmall_integral_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_in_order_comment`
--
ALTER TABLE `hjmall_in_order_comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_level`
--
ALTER TABLE `hjmall_level`
  ADD PRIMARY KEY (`id`),
  ADD KEY `level` (`level`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_level_order`
--
ALTER TABLE `hjmall_level_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_pay` (`is_pay`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_lottery_goods`
--
ALTER TABLE `hjmall_lottery_goods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_lottery_log`
--
ALTER TABLE `hjmall_lottery_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lottery_id` (`lottery_id`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE;

--
-- Indexes for table `hjmall_lottery_reserve`
--
ALTER TABLE `hjmall_lottery_reserve`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_lottery_setting`
--
ALTER TABLE `hjmall_lottery_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_mail_setting`
--
ALTER TABLE `hjmall_mail_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_mch`
--
ALTER TABLE `hjmall_mch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_open` (`is_open`),
  ADD KEY `is_lock` (`is_lock`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_mch_account_log`
--
ALTER TABLE `hjmall_mch_account_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_mch_cash`
--
ALTER TABLE `hjmall_mch_cash`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_mch_cat`
--
ALTER TABLE `hjmall_mch_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `hjmall_mch_common_cat`
--
ALTER TABLE `hjmall_mch_common_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_mch_goods_cat`
--
ALTER TABLE `hjmall_mch_goods_cat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_mch_option`
--
ALTER TABLE `hjmall_mch_option`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_mch_plugin`
--
ALTER TABLE `hjmall_mch_plugin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_mch_postage_rules`
--
ALTER TABLE `hjmall_mch_postage_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_enable` (`is_enable`);

--
-- Indexes for table `hjmall_mch_setting`
--
ALTER TABLE `hjmall_mch_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_mch_visit_log`
--
ALTER TABLE `hjmall_mch_visit_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `hjmall_miaosha`
--
ALTER TABLE `hjmall_miaosha`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_miaosha_goods`
--
ALTER TABLE `hjmall_miaosha_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `goods_id` (`goods_id`),
  ADD KEY `start_time` (`start_time`),
  ADD KEY `open_date` (`open_date`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `hjmall_ms_goods`
--
ALTER TABLE `hjmall_ms_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_discount` (`is_discount`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_ms_goods_pic`
--
ALTER TABLE `hjmall_ms_goods_pic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `hjmall_ms_order`
--
ALTER TABLE `hjmall_ms_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_pay` (`is_pay`),
  ADD KEY `is_send` (`is_send`),
  ADD KEY `is_confirm` (`is_confirm`),
  ADD KEY `is_comment` (`is_comment`),
  ADD KEY `is_price` (`is_price`),
  ADD KEY `is_offline` (`is_offline`),
  ADD KEY `is_cancel` (`is_cancel`),
  ADD KEY `is_sale` (`is_sale`),
  ADD KEY `is_sum` (`is_sum`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_ms_order_comment`
--
ALTER TABLE `hjmall_ms_order_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_hide` (`is_hide`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_ms_order_refund`
--
ALTER TABLE `hjmall_ms_order_refund`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_ms_setting`
--
ALTER TABLE `hjmall_ms_setting`
  ADD PRIMARY KEY (`store_id`),
  ADD KEY `is_share` (`is_share`),
  ADD KEY `is_sms` (`is_sms`),
  ADD KEY `is_print` (`is_print`),
  ADD KEY `is_mail` (`is_mail`),
  ADD KEY `is_area` (`is_area`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_option`
--
ALTER TABLE `hjmall_option`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `group` (`group`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `hjmall_order`
--
ALTER TABLE `hjmall_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addtime` (`addtime`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `order_no` (`order_no`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_pay` (`is_pay`),
  ADD KEY `is_send` (`is_send`),
  ADD KEY `is_confirm` (`is_confirm`),
  ADD KEY `is_comment` (`is_comment`),
  ADD KEY `is_price` (`is_price`),
  ADD KEY `is_offline` (`is_offline`),
  ADD KEY `is_cancel` (`is_cancel`),
  ADD KEY `is_sale` (`is_sale`),
  ADD KEY `is_recycle` (`is_recycle`),
  ADD KEY `is_transfer` (`is_transfer`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_order_comment`
--
ALTER TABLE `hjmall_order_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_hide` (`is_hide`),
  ADD KEY `is_virtual` (`is_virtual`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_order_detail`
--
ALTER TABLE `hjmall_order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `goods_id` (`goods_id`),
  ADD KEY `addtime` (`addtime`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `hjmall_order_express`
--
ALTER TABLE `hjmall_order_express`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_order_form`
--
ALTER TABLE `hjmall_order_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_order_message`
--
ALTER TABLE `hjmall_order_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_read` (`is_read`),
  ADD KEY `is_sound` (`is_sound`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_order_refund`
--
ALTER TABLE `hjmall_order_refund`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_order_share`
--
ALTER TABLE `hjmall_order_share`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_order_union`
--
ALTER TABLE `hjmall_order_union`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_pay` (`is_pay`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_pic`
--
ALTER TABLE `hjmall_pic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_plugin`
--
ALTER TABLE `hjmall_plugin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_pond`
--
ALTER TABLE `hjmall_pond`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_pond_log`
--
ALTER TABLE `hjmall_pond_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_pond_setting`
--
ALTER TABLE `hjmall_pond_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_postage_rules`
--
ALTER TABLE `hjmall_postage_rules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_enable` (`is_enable`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_printer`
--
ALTER TABLE `hjmall_printer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_printer_setting`
--
ALTER TABLE `hjmall_printer_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_attr` (`is_attr`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_pt_cat`
--
ALTER TABLE `hjmall_pt_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_pt_goods`
--
ALTER TABLE `hjmall_pt_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_hot` (`is_hot`),
  ADD KEY `is_only` (`is_only`),
  ADD KEY `is_more` (`is_more`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_pt_goods_detail`
--
ALTER TABLE `hjmall_pt_goods_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_pt_goods_pic`
--
ALTER TABLE `hjmall_pt_goods_pic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `hjmall_pt_order`
--
ALTER TABLE `hjmall_pt_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_pay` (`is_pay`),
  ADD KEY `is_send` (`is_send`),
  ADD KEY `is_confirm` (`is_confirm`),
  ADD KEY `is_comment` (`is_comment`),
  ADD KEY `is_group` (`is_group`),
  ADD KEY `is_success` (`is_success`),
  ADD KEY `is_returnd` (`is_returnd`),
  ADD KEY `is_cancel` (`is_cancel`),
  ADD KEY `is_price` (`is_price`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_pt_order_comment`
--
ALTER TABLE `hjmall_pt_order_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_hide` (`is_hide`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_pt_order_detail`
--
ALTER TABLE `hjmall_pt_order_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `hjmall_pt_order_refund`
--
ALTER TABLE `hjmall_pt_order_refund`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_pt_robot`
--
ALTER TABLE `hjmall_pt_robot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_pt_setting`
--
ALTER TABLE `hjmall_pt_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_share` (`is_share`),
  ADD KEY `is_sms` (`is_sms`),
  ADD KEY `is_print` (`is_print`),
  ADD KEY `is_mail` (`is_mail`),
  ADD KEY `is_area` (`is_area`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_qrcode`
--
ALTER TABLE `hjmall_qrcode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_recharge`
--
ALTER TABLE `hjmall_recharge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_refund_address`
--
ALTER TABLE `hjmall_refund_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_register`
--
ALTER TABLE `hjmall_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_re_order`
--
ALTER TABLE `hjmall_re_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_pay` (`is_pay`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_scratch`
--
ALTER TABLE `hjmall_scratch`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_scratch_log`
--
ALTER TABLE `hjmall_scratch_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_scratch_setting`
--
ALTER TABLE `hjmall_scratch_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_sender`
--
ALTER TABLE `hjmall_sender`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_session`
--
ALTER TABLE `hjmall_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_setting`
--
ALTER TABLE `hjmall_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_rebate` (`is_rebate`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_share`
--
ALTER TABLE `hjmall_share`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_shop`
--
ALTER TABLE `hjmall_shop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_default` (`is_default`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_shop_pic`
--
ALTER TABLE `hjmall_shop_pic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_sms_record`
--
ALTER TABLE `hjmall_sms_record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_sms_setting`
--
ALTER TABLE `hjmall_sms_setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_step_activity`
--
ALTER TABLE `hjmall_step_activity`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_step_log`
--
ALTER TABLE `hjmall_step_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `step_currency` (`step_currency`) USING BTREE,
  ADD KEY `num` (`num`) USING BTREE,
  ADD KEY `type` (`type`) USING BTREE,
  ADD KEY `status` (`status`) USING BTREE;

--
-- Indexes for table `hjmall_step_remind`
--
ALTER TABLE `hjmall_step_remind`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_step_setting`
--
ALTER TABLE `hjmall_step_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_step_user`
--
ALTER TABLE `hjmall_step_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `step_currency` (`step_currency`) USING BTREE;

--
-- Indexes for table `hjmall_store`
--
ALTER TABLE `hjmall_store`
  ADD PRIMARY KEY (`id`),
  ADD KEY `acid` (`acid`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_offline` (`is_offline`),
  ADD KEY `is_coupon` (`is_coupon`);

--
-- Indexes for table `hjmall_task`
--
ALTER TABLE `hjmall_task`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `hjmall_template_msg`
--
ALTER TABLE `hjmall_template_msg`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `store_id_tpl_name` (`store_id`,`tpl_name`);

--
-- Indexes for table `hjmall_territorial_limitation`
--
ALTER TABLE `hjmall_territorial_limitation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_enable` (`is_enable`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_topic`
--
ALTER TABLE `hjmall_topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_chosen` (`is_chosen`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_topic_favorite`
--
ALTER TABLE `hjmall_topic_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_topic_type`
--
ALTER TABLE `hjmall_topic_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_upload_config`
--
ALTER TABLE `hjmall_upload_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_upload_file`
--
ALTER TABLE `hjmall_upload_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `hjmall_user`
--
ALTER TABLE `hjmall_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `access_token` (`access_token`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `level` (`level`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_distributor` (`is_distributor`),
  ADD KEY `is_clerk` (`is_clerk`);

--
-- Indexes for table `hjmall_user_account_log`
--
ALTER TABLE `hjmall_user_account_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `hjmall_user_auth_login`
--
ALTER TABLE `hjmall_user_auth_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `token` (`token`(191)),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_pass` (`is_pass`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_user_card`
--
ALTER TABLE `hjmall_user_card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_use` (`is_use`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_user_coupon`
--
ALTER TABLE `hjmall_user_coupon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `coupon_id` (`coupon_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_expire` (`is_expire`),
  ADD KEY `is_use` (`is_use`);

--
-- Indexes for table `hjmall_user_form_id`
--
ALTER TABLE `hjmall_user_form_id`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `hjmall_user_log`
--
ALTER TABLE `hjmall_user_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_user_share_money`
--
ALTER TABLE `hjmall_user_share_money`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_video`
--
ALTER TABLE `hjmall_video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_we7_user_auth`
--
ALTER TABLE `hjmall_we7_user_auth`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_wechat_app`
--
ALTER TABLE `hjmall_wechat_app`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `hjmall_wechat_platform`
--
ALTER TABLE `hjmall_wechat_platform`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `hjmall_wechat_template_message`
--
ALTER TABLE `hjmall_wechat_template_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_wx_title`
--
ALTER TABLE `hjmall_wx_title`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hjmall_yy_cat`
--
ALTER TABLE `hjmall_yy_cat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_yy_form`
--
ALTER TABLE `hjmall_yy_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_yy_form_id`
--
ALTER TABLE `hjmall_yy_form_id`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_yy_goods`
--
ALTER TABLE `hjmall_yy_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_yy_goods_pic`
--
ALTER TABLE `hjmall_yy_goods_pic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_delete` (`is_delete`);

--
-- Indexes for table `hjmall_yy_order`
--
ALTER TABLE `hjmall_yy_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_pay` (`is_pay`),
  ADD KEY `is_use` (`is_use`),
  ADD KEY `is_comment` (`is_comment`),
  ADD KEY `is_cancel` (`is_cancel`),
  ADD KEY `is_refund` (`is_refund`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_yy_order_comment`
--
ALTER TABLE `hjmall_yy_order_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `is_hide` (`is_hide`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_yy_order_form`
--
ALTER TABLE `hjmall_yy_order_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `is_delete` (`is_delete`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `hjmall_yy_setting`
--
ALTER TABLE `hjmall_yy_setting`
  ADD PRIMARY KEY (`store_id`),
  ADD KEY `is_share` (`is_share`),
  ADD KEY `is_sms` (`is_sms`),
  ADD KEY `is_print` (`is_print`),
  ADD KEY `is_mail` (`is_mail`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `ims_account`
--
ALTER TABLE `ims_account`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `idx_uniacid` (`uniacid`);

--
-- Indexes for table `ims_account_aliapp`
--
ALTER TABLE `ims_account_aliapp`
  ADD PRIMARY KEY (`acid`);

--
-- Indexes for table `ims_account_baiduapp`
--
ALTER TABLE `ims_account_baiduapp`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_account_phoneapp`
--
ALTER TABLE `ims_account_phoneapp`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_account_toutiaoapp`
--
ALTER TABLE `ims_account_toutiaoapp`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_account_webapp`
--
ALTER TABLE `ims_account_webapp`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_account_wechats`
--
ALTER TABLE `ims_account_wechats`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `idx_key` (`key`);

--
-- Indexes for table `ims_account_wxapp`
--
ALTER TABLE `ims_account_wxapp`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_account_xzapp`
--
ALTER TABLE `ims_account_xzapp`
  ADD PRIMARY KEY (`acid`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_activity_clerks`
--
ALTER TABLE `ims_activity_clerks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `password` (`password`),
  ADD KEY `openid` (`openid`);

--
-- Indexes for table `ims_activity_clerk_menu`
--
ALTER TABLE `ims_activity_clerk_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_activity_coupon_allocation`
--
ALTER TABLE `ims_activity_coupon_allocation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`,`couponid`,`groupid`);

--
-- Indexes for table `ims_activity_coupon_modules`
--
ALTER TABLE `ims_activity_coupon_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `couponid` (`couponid`);

--
-- Indexes for table `ims_activity_exchange`
--
ALTER TABLE `ims_activity_exchange`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extra` (`extra`(333));

--
-- Indexes for table `ims_activity_exchange_trades`
--
ALTER TABLE `ims_activity_exchange_trades`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `uniacid` (`uniacid`,`uid`,`exid`);

--
-- Indexes for table `ims_activity_exchange_trades_shipping`
--
ALTER TABLE `ims_activity_exchange_trades_shipping`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ims_activity_modules`
--
ALTER TABLE `ims_activity_modules`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `module` (`module`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ims_activity_modules_record`
--
ALTER TABLE `ims_activity_modules_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`mid`);

--
-- Indexes for table `ims_activity_stores`
--
ALTER TABLE `ims_activity_stores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `ims_article_category`
--
ALTER TABLE `ims_article_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ims_article_comment`
--
ALTER TABLE `ims_article_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `articleid` (`articleid`);

--
-- Indexes for table `ims_article_news`
--
ALTER TABLE `ims_article_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `cateid` (`cateid`);

--
-- Indexes for table `ims_article_notice`
--
ALTER TABLE `ims_article_notice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `cateid` (`cateid`);

--
-- Indexes for table `ims_article_unread_notice`
--
ALTER TABLE `ims_article_unread_notice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `notice_id` (`notice_id`);

--
-- Indexes for table `ims_attachment_group`
--
ALTER TABLE `ims_attachment_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_basic_reply`
--
ALTER TABLE `ims_basic_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_business`
--
ALTER TABLE `ims_business`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_lat_lng` (`lng`,`lat`);

--
-- Indexes for table `ims_core_attachment`
--
ALTER TABLE `ims_core_attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_core_cache`
--
ALTER TABLE `ims_core_cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `ims_core_cron`
--
ALTER TABLE `ims_core_cron`
  ADD PRIMARY KEY (`id`),
  ADD KEY `createtime` (`createtime`),
  ADD KEY `nextruntime` (`nextruntime`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `cloudid` (`cloudid`);

--
-- Indexes for table `ims_core_cron_record`
--
ALTER TABLE `ims_core_cron_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `module` (`module`);

--
-- Indexes for table `ims_core_job`
--
ALTER TABLE `ims_core_job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_core_menu`
--
ALTER TABLE `ims_core_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_core_menu_shortcut`
--
ALTER TABLE `ims_core_menu_shortcut`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ims_core_paylog`
--
ALTER TABLE `ims_core_paylog`
  ADD PRIMARY KEY (`plid`),
  ADD KEY `idx_openid` (`openid`),
  ADD KEY `idx_tid` (`tid`),
  ADD KEY `idx_uniacid` (`uniacid`),
  ADD KEY `uniontid` (`uniontid`);

--
-- Indexes for table `ims_core_performance`
--
ALTER TABLE `ims_core_performance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_core_queue`
--
ALTER TABLE `ims_core_queue`
  ADD PRIMARY KEY (`qid`),
  ADD KEY `uniacid` (`uniacid`,`acid`),
  ADD KEY `module` (`module`),
  ADD KEY `dateline` (`dateline`);

--
-- Indexes for table `ims_core_refundlog`
--
ALTER TABLE `ims_core_refundlog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refund_uniontid` (`refund_uniontid`),
  ADD KEY `uniontid` (`uniontid`);

--
-- Indexes for table `ims_core_resource`
--
ALTER TABLE `ims_core_resource`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `acid` (`uniacid`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `ims_core_sendsms_log`
--
ALTER TABLE `ims_core_sendsms_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_core_sessions`
--
ALTER TABLE `ims_core_sessions`
  ADD PRIMARY KEY (`sid`);

--
-- Indexes for table `ims_core_settings`
--
ALTER TABLE `ims_core_settings`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `ims_coupon_location`
--
ALTER TABLE `ims_coupon_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`,`acid`);

--
-- Indexes for table `ims_cover_reply`
--
ALTER TABLE `ims_cover_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_custom_reply`
--
ALTER TABLE `ims_custom_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_images_reply`
--
ALTER TABLE `ims_images_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_job`
--
ALTER TABLE `ims_job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_mc_card`
--
ALTER TABLE `ims_mc_card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_mc_card_care`
--
ALTER TABLE `ims_mc_card_care`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_mc_card_credit_set`
--
ALTER TABLE `ims_mc_card_credit_set`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_mc_card_members`
--
ALTER TABLE `ims_mc_card_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_mc_card_notices`
--
ALTER TABLE `ims_mc_card_notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ims_mc_card_notices_unread`
--
ALTER TABLE `ims_mc_card_notices_unread`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `notice_id` (`notice_id`);

--
-- Indexes for table `ims_mc_card_recommend`
--
ALTER TABLE `ims_mc_card_recommend`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_mc_card_record`
--
ALTER TABLE `ims_mc_card_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `addtime` (`addtime`);

--
-- Indexes for table `ims_mc_card_sign_record`
--
ALTER TABLE `ims_mc_card_sign_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ims_mc_cash_record`
--
ALTER TABLE `ims_mc_cash_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ims_mc_chats_record`
--
ALTER TABLE `ims_mc_chats_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`,`acid`),
  ADD KEY `openid` (`openid`),
  ADD KEY `createtime` (`createtime`);

--
-- Indexes for table `ims_mc_credits_recharge`
--
ALTER TABLE `ims_mc_credits_recharge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uniacid_uid` (`uniacid`,`uid`),
  ADD KEY `idx_tid` (`tid`);

--
-- Indexes for table `ims_mc_credits_record`
--
ALTER TABLE `ims_mc_credits_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ims_mc_fans_groups`
--
ALTER TABLE `ims_mc_fans_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_mc_fans_tag`
--
ALTER TABLE `ims_mc_fans_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fanid` (`fanid`),
  ADD KEY `openid` (`openid`);

--
-- Indexes for table `ims_mc_fans_tag_mapping`
--
ALTER TABLE `ims_mc_fans_tag_mapping`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `mapping` (`fanid`,`tagid`),
  ADD KEY `fanid_index` (`fanid`),
  ADD KEY `tagid_index` (`tagid`);

--
-- Indexes for table `ims_mc_groups`
--
ALTER TABLE `ims_mc_groups`
  ADD PRIMARY KEY (`groupid`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_mc_handsel`
--
ALTER TABLE `ims_mc_handsel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`touid`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_mc_mapping_fans`
--
ALTER TABLE `ims_mc_mapping_fans`
  ADD PRIMARY KEY (`fanid`),
  ADD UNIQUE KEY `openid_2` (`openid`),
  ADD KEY `acid` (`acid`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `nickname` (`nickname`),
  ADD KEY `updatetime` (`updatetime`),
  ADD KEY `uid` (`uid`),
  ADD KEY `openid` (`openid`);

--
-- Indexes for table `ims_mc_mapping_ucenter`
--
ALTER TABLE `ims_mc_mapping_ucenter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_mc_mass_record`
--
ALTER TABLE `ims_mc_mass_record`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`,`acid`);

--
-- Indexes for table `ims_mc_members`
--
ALTER TABLE `ims_mc_members`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `groupid` (`groupid`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `email` (`email`),
  ADD KEY `mobile` (`mobile`),
  ADD KEY `createtime` (`createtime`);

--
-- Indexes for table `ims_mc_member_address`
--
ALTER TABLE `ims_mc_member_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uinacid` (`uniacid`),
  ADD KEY `idx_uid` (`uid`);

--
-- Indexes for table `ims_mc_member_fields`
--
ALTER TABLE `ims_mc_member_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_uniacid` (`uniacid`),
  ADD KEY `idx_fieldid` (`fieldid`);

--
-- Indexes for table `ims_mc_member_property`
--
ALTER TABLE `ims_mc_member_property`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_mc_oauth_fans`
--
ALTER TABLE `ims_mc_oauth_fans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_oauthopenid_acid` (`oauth_openid`,`acid`);

--
-- Indexes for table `ims_menu_event`
--
ALTER TABLE `ims_menu_event`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `picmd5` (`picmd5`);

--
-- Indexes for table `ims_message_notice_log`
--
ALTER TABLE `ims_message_notice_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_mobilenumber`
--
ALTER TABLE `ims_mobilenumber`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_modules`
--
ALTER TABLE `ims_modules`
  ADD PRIMARY KEY (`mid`),
  ADD KEY `idx_name` (`name`);

--
-- Indexes for table `ims_modules_bindings`
--
ALTER TABLE `ims_modules_bindings`
  ADD PRIMARY KEY (`eid`),
  ADD KEY `idx_module` (`module`);

--
-- Indexes for table `ims_modules_cloud`
--
ALTER TABLE `ims_modules_cloud`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `lastupdatetime` (`lastupdatetime`);

--
-- Indexes for table `ims_modules_ignore`
--
ALTER TABLE `ims_modules_ignore`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `ims_modules_plugin`
--
ALTER TABLE `ims_modules_plugin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `main_module` (`main_module`);

--
-- Indexes for table `ims_modules_plugin_rank`
--
ALTER TABLE `ims_modules_plugin_rank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_modules_rank`
--
ALTER TABLE `ims_modules_rank`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_name` (`module_name`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ims_modules_recycle`
--
ALTER TABLE `ims_modules_recycle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `modulename` (`name`);

--
-- Indexes for table `ims_music_reply`
--
ALTER TABLE `ims_music_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_news_reply`
--
ALTER TABLE `ims_news_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_phoneapp_versions`
--
ALTER TABLE `ims_phoneapp_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `version` (`version`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_profile_fields`
--
ALTER TABLE `ims_profile_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_qrcode`
--
ALTER TABLE `ims_qrcode`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_qrcid` (`qrcid`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `ticket` (`ticket`);

--
-- Indexes for table `ims_qrcode_stat`
--
ALTER TABLE `ims_qrcode_stat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_rule`
--
ALTER TABLE `ims_rule`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_rule_keyword`
--
ALTER TABLE `ims_rule_keyword`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_content` (`content`),
  ADD KEY `rid` (`rid`),
  ADD KEY `idx_rid` (`rid`),
  ADD KEY `idx_uniacid_type_content` (`uniacid`,`type`,`content`);

--
-- Indexes for table `ims_site_article`
--
ALTER TABLE `ims_site_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_iscommend` (`iscommend`),
  ADD KEY `idx_ishot` (`ishot`);

--
-- Indexes for table `ims_site_article_comment`
--
ALTER TABLE `ims_site_article_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `articleid` (`articleid`);

--
-- Indexes for table `ims_site_category`
--
ALTER TABLE `ims_site_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_site_multi`
--
ALTER TABLE `ims_site_multi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `bindhost` (`bindhost`);

--
-- Indexes for table `ims_site_nav`
--
ALTER TABLE `ims_site_nav`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `multiid` (`multiid`);

--
-- Indexes for table `ims_site_page`
--
ALTER TABLE `ims_site_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `multiid` (`multiid`);

--
-- Indexes for table `ims_site_slide`
--
ALTER TABLE `ims_site_slide`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `multiid` (`multiid`);

--
-- Indexes for table `ims_site_store_cash_log`
--
ALTER TABLE `ims_site_store_cash_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `founder_uid` (`founder_uid`);

--
-- Indexes for table `ims_site_store_cash_order`
--
ALTER TABLE `ims_site_store_cash_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `founder_uid` (`founder_uid`);

--
-- Indexes for table `ims_site_store_create_account`
--
ALTER TABLE `ims_site_store_create_account`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_site_store_goods`
--
ALTER TABLE `ims_site_store_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module` (`module`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `price` (`price`);

--
-- Indexes for table `ims_site_store_goods_cloud`
--
ALTER TABLE `ims_site_store_goods_cloud`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cloud_id` (`cloud_id`);

--
-- Indexes for table `ims_site_store_order`
--
ALTER TABLE `ims_site_store_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goodid` (`goodsid`),
  ADD KEY `buyerid` (`buyerid`);

--
-- Indexes for table `ims_site_styles`
--
ALTER TABLE `ims_site_styles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_site_styles_vars`
--
ALTER TABLE `ims_site_styles_vars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_site_templates`
--
ALTER TABLE `ims_site_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_stat_fans`
--
ALTER TABLE `ims_stat_fans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`,`date`);

--
-- Indexes for table `ims_stat_keyword`
--
ALTER TABLE `ims_stat_keyword`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_createtime` (`createtime`);

--
-- Indexes for table `ims_stat_msg_history`
--
ALTER TABLE `ims_stat_msg_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_createtime` (`createtime`);

--
-- Indexes for table `ims_stat_rule`
--
ALTER TABLE `ims_stat_rule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_createtime` (`createtime`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_stat_visit`
--
ALTER TABLE `ims_stat_visit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `date` (`date`),
  ADD KEY `module` (`module`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_stat_visit_ip`
--
ALTER TABLE `ims_stat_visit_ip`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip_date_module_uniacid` (`ip`,`date`,`module`,`uniacid`);

--
-- Indexes for table `ims_system_stat_visit`
--
ALTER TABLE `ims_system_stat_visit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ims_uni_account`
--
ALTER TABLE `ims_uni_account`
  ADD PRIMARY KEY (`uniacid`);

--
-- Indexes for table `ims_uni_account_group`
--
ALTER TABLE `ims_uni_account_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_uni_account_menus`
--
ALTER TABLE `ims_uni_account_menus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `menuid` (`menuid`);

--
-- Indexes for table `ims_uni_account_modules`
--
ALTER TABLE `ims_uni_account_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_module` (`module`),
  ADD KEY `idx_uniacid` (`uniacid`);

--
-- Indexes for table `ims_uni_account_modules_shortcut`
--
ALTER TABLE `ims_uni_account_modules_shortcut`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_uni_account_users`
--
ALTER TABLE `ims_uni_account_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_memberid` (`uid`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ims_uni_group`
--
ALTER TABLE `ims_uni_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_uni_link_uniacid`
--
ALTER TABLE `ims_uni_link_uniacid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_uni_modules`
--
ALTER TABLE `ims_uni_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_uni_settings`
--
ALTER TABLE `ims_uni_settings`
  ADD PRIMARY KEY (`uniacid`);

--
-- Indexes for table `ims_uni_verifycode`
--
ALTER TABLE `ims_uni_verifycode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_userapi_cache`
--
ALTER TABLE `ims_userapi_cache`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_userapi_reply`
--
ALTER TABLE `ims_userapi_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_users`
--
ALTER TABLE `ims_users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `ims_users_bind`
--
ALTER TABLE `ims_users_bind`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `bind_sign` (`bind_sign`);

--
-- Indexes for table `ims_users_create_group`
--
ALTER TABLE `ims_users_create_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_users_extra_group`
--
ALTER TABLE `ims_users_extra_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `uni_group_id` (`uni_group_id`),
  ADD KEY `create_group_id` (`create_group_id`);

--
-- Indexes for table `ims_users_extra_limit`
--
ALTER TABLE `ims_users_extra_limit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `ims_users_extra_modules`
--
ALTER TABLE `ims_users_extra_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `module_name` (`module_name`);

--
-- Indexes for table `ims_users_extra_templates`
--
ALTER TABLE `ims_users_extra_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `template_id` (`template_id`);

--
-- Indexes for table `ims_users_failed_login`
--
ALTER TABLE `ims_users_failed_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip_username` (`ip`,`username`);

--
-- Indexes for table `ims_users_founder_group`
--
ALTER TABLE `ims_users_founder_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_users_founder_own_create_groups`
--
ALTER TABLE `ims_users_founder_own_create_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `founder_uid` (`founder_uid`),
  ADD KEY `create_group_id` (`create_group_id`);

--
-- Indexes for table `ims_users_founder_own_uni_groups`
--
ALTER TABLE `ims_users_founder_own_uni_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `founder_uid` (`founder_uid`),
  ADD KEY `uni_group_id` (`uni_group_id`);

--
-- Indexes for table `ims_users_founder_own_users`
--
ALTER TABLE `ims_users_founder_own_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `founder_uid` (`founder_uid`);

--
-- Indexes for table `ims_users_founder_own_users_groups`
--
ALTER TABLE `ims_users_founder_own_users_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `founder_uid` (`founder_uid`),
  ADD KEY `users_group_id` (`users_group_id`);

--
-- Indexes for table `ims_users_group`
--
ALTER TABLE `ims_users_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_users_invitation`
--
ALTER TABLE `ims_users_invitation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_code` (`code`);

--
-- Indexes for table `ims_users_lastuse`
--
ALTER TABLE `ims_users_lastuse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_users_permission`
--
ALTER TABLE `ims_users_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_users_profile`
--
ALTER TABLE `ims_users_profile`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ims_video_reply`
--
ALTER TABLE `ims_video_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_voice_reply`
--
ALTER TABLE `ims_voice_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- Indexes for table `ims_wechat_attachment`
--
ALTER TABLE `ims_wechat_attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `media_id` (`media_id`),
  ADD KEY `acid` (`acid`);

--
-- Indexes for table `ims_wechat_news`
--
ALTER TABLE `ims_wechat_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `attach_id` (`attach_id`);

--
-- Indexes for table `ims_wxapp_general_analysis`
--
ALTER TABLE `ims_wxapp_general_analysis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uniacid` (`uniacid`),
  ADD KEY `ref_date` (`ref_date`);

--
-- Indexes for table `ims_wxapp_versions`
--
ALTER TABLE `ims_wxapp_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `version` (`version`),
  ADD KEY `uniacid` (`uniacid`);

--
-- Indexes for table `ims_wxcard_reply`
--
ALTER TABLE `ims_wxcard_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rid` (`rid`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `hjmall_action_log`
--
ALTER TABLE `hjmall_action_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `hjmall_ad`
--
ALTER TABLE `hjmall_ad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_address`
--
ALTER TABLE `hjmall_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_admin`
--
ALTER TABLE `hjmall_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_admin_permission`
--
ALTER TABLE `hjmall_admin_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `hjmall_admin_register`
--
ALTER TABLE `hjmall_admin_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_article`
--
ALTER TABLE `hjmall_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_attr`
--
ALTER TABLE `hjmall_attr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_attr_group`
--
ALTER TABLE `hjmall_attr_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_auth_role`
--
ALTER TABLE `hjmall_auth_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_auth_role_permission`
--
ALTER TABLE `hjmall_auth_role_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_banner`
--
ALTER TABLE `hjmall_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_bargain_goods`
--
ALTER TABLE `hjmall_bargain_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_bargain_order`
--
ALTER TABLE `hjmall_bargain_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_bargain_setting`
--
ALTER TABLE `hjmall_bargain_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_bargain_user_order`
--
ALTER TABLE `hjmall_bargain_user_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_card`
--
ALTER TABLE `hjmall_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_cart`
--
ALTER TABLE `hjmall_cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_cash`
--
ALTER TABLE `hjmall_cash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_cat`
--
ALTER TABLE `hjmall_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_color`
--
ALTER TABLE `hjmall_color`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `hjmall_coupon`
--
ALTER TABLE `hjmall_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_coupon_auto_send`
--
ALTER TABLE `hjmall_coupon_auto_send`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_delivery`
--
ALTER TABLE `hjmall_delivery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_diy_page`
--
ALTER TABLE `hjmall_diy_page`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_diy_template`
--
ALTER TABLE `hjmall_diy_template`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_express`
--
ALTER TABLE `hjmall_express`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- 使用表AUTO_INCREMENT `hjmall_favorite`
--
ALTER TABLE `hjmall_favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_file_group`
--
ALTER TABLE `hjmall_file_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_form`
--
ALTER TABLE `hjmall_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_form_id`
--
ALTER TABLE `hjmall_form_id`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_free_delivery_rules`
--
ALTER TABLE `hjmall_free_delivery_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_fxhb_hongbao`
--
ALTER TABLE `hjmall_fxhb_hongbao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_fxhb_setting`
--
ALTER TABLE `hjmall_fxhb_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_goods`
--
ALTER TABLE `hjmall_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_goods_card`
--
ALTER TABLE `hjmall_goods_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_goods_cat`
--
ALTER TABLE `hjmall_goods_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_goods_pic`
--
ALTER TABLE `hjmall_goods_pic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_goods_share`
--
ALTER TABLE `hjmall_goods_share`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_gwd_buy_list`
--
ALTER TABLE `hjmall_gwd_buy_list`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_gwd_like_list`
--
ALTER TABLE `hjmall_gwd_like_list`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_gwd_like_user`
--
ALTER TABLE `hjmall_gwd_like_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_gwd_setting`
--
ALTER TABLE `hjmall_gwd_setting`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_home_block`
--
ALTER TABLE `hjmall_home_block`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_home_nav`
--
ALTER TABLE `hjmall_home_nav`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_integral_cat`
--
ALTER TABLE `hjmall_integral_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_integral_coupon_order`
--
ALTER TABLE `hjmall_integral_coupon_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_integral_goods`
--
ALTER TABLE `hjmall_integral_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_integral_log`
--
ALTER TABLE `hjmall_integral_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_integral_order`
--
ALTER TABLE `hjmall_integral_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_integral_order_detail`
--
ALTER TABLE `hjmall_integral_order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_integral_setting`
--
ALTER TABLE `hjmall_integral_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_in_order_comment`
--
ALTER TABLE `hjmall_in_order_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_level`
--
ALTER TABLE `hjmall_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_level_order`
--
ALTER TABLE `hjmall_level_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_lottery_goods`
--
ALTER TABLE `hjmall_lottery_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_lottery_log`
--
ALTER TABLE `hjmall_lottery_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_lottery_reserve`
--
ALTER TABLE `hjmall_lottery_reserve`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_lottery_setting`
--
ALTER TABLE `hjmall_lottery_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_mail_setting`
--
ALTER TABLE `hjmall_mail_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_mch`
--
ALTER TABLE `hjmall_mch`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_mch_account_log`
--
ALTER TABLE `hjmall_mch_account_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_mch_cash`
--
ALTER TABLE `hjmall_mch_cash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_mch_cat`
--
ALTER TABLE `hjmall_mch_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_mch_common_cat`
--
ALTER TABLE `hjmall_mch_common_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_mch_goods_cat`
--
ALTER TABLE `hjmall_mch_goods_cat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_mch_option`
--
ALTER TABLE `hjmall_mch_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_mch_plugin`
--
ALTER TABLE `hjmall_mch_plugin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_mch_postage_rules`
--
ALTER TABLE `hjmall_mch_postage_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_mch_setting`
--
ALTER TABLE `hjmall_mch_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_mch_visit_log`
--
ALTER TABLE `hjmall_mch_visit_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_miaosha`
--
ALTER TABLE `hjmall_miaosha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_miaosha_goods`
--
ALTER TABLE `hjmall_miaosha_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_ms_goods`
--
ALTER TABLE `hjmall_ms_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_ms_goods_pic`
--
ALTER TABLE `hjmall_ms_goods_pic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_ms_order`
--
ALTER TABLE `hjmall_ms_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_ms_order_comment`
--
ALTER TABLE `hjmall_ms_order_comment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_ms_order_refund`
--
ALTER TABLE `hjmall_ms_order_refund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_option`
--
ALTER TABLE `hjmall_option`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `hjmall_order`
--
ALTER TABLE `hjmall_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_order_comment`
--
ALTER TABLE `hjmall_order_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_order_detail`
--
ALTER TABLE `hjmall_order_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_order_express`
--
ALTER TABLE `hjmall_order_express`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_order_form`
--
ALTER TABLE `hjmall_order_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_order_message`
--
ALTER TABLE `hjmall_order_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_order_refund`
--
ALTER TABLE `hjmall_order_refund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_order_share`
--
ALTER TABLE `hjmall_order_share`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_order_union`
--
ALTER TABLE `hjmall_order_union`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_pic`
--
ALTER TABLE `hjmall_pic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_plugin`
--
ALTER TABLE `hjmall_plugin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_pond`
--
ALTER TABLE `hjmall_pond`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_pond_log`
--
ALTER TABLE `hjmall_pond_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_pond_setting`
--
ALTER TABLE `hjmall_pond_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_postage_rules`
--
ALTER TABLE `hjmall_postage_rules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_printer`
--
ALTER TABLE `hjmall_printer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_printer_setting`
--
ALTER TABLE `hjmall_printer_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_pt_cat`
--
ALTER TABLE `hjmall_pt_cat`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_pt_goods`
--
ALTER TABLE `hjmall_pt_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_pt_goods_detail`
--
ALTER TABLE `hjmall_pt_goods_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_pt_goods_pic`
--
ALTER TABLE `hjmall_pt_goods_pic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_pt_order`
--
ALTER TABLE `hjmall_pt_order`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_pt_order_comment`
--
ALTER TABLE `hjmall_pt_order_comment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_pt_order_detail`
--
ALTER TABLE `hjmall_pt_order_detail`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_pt_order_refund`
--
ALTER TABLE `hjmall_pt_order_refund`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_pt_robot`
--
ALTER TABLE `hjmall_pt_robot`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_pt_setting`
--
ALTER TABLE `hjmall_pt_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_qrcode`
--
ALTER TABLE `hjmall_qrcode`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_recharge`
--
ALTER TABLE `hjmall_recharge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_refund_address`
--
ALTER TABLE `hjmall_refund_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_register`
--
ALTER TABLE `hjmall_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_re_order`
--
ALTER TABLE `hjmall_re_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_scratch`
--
ALTER TABLE `hjmall_scratch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_scratch_log`
--
ALTER TABLE `hjmall_scratch_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_scratch_setting`
--
ALTER TABLE `hjmall_scratch_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_sender`
--
ALTER TABLE `hjmall_sender`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_setting`
--
ALTER TABLE `hjmall_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_share`
--
ALTER TABLE `hjmall_share`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_shop`
--
ALTER TABLE `hjmall_shop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `hjmall_shop_pic`
--
ALTER TABLE `hjmall_shop_pic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `hjmall_sms_record`
--
ALTER TABLE `hjmall_sms_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_sms_setting`
--
ALTER TABLE `hjmall_sms_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_step_activity`
--
ALTER TABLE `hjmall_step_activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_step_log`
--
ALTER TABLE `hjmall_step_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_step_remind`
--
ALTER TABLE `hjmall_step_remind`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_step_setting`
--
ALTER TABLE `hjmall_step_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_step_user`
--
ALTER TABLE `hjmall_step_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_store`
--
ALTER TABLE `hjmall_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `hjmall_task`
--
ALTER TABLE `hjmall_task`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_template_msg`
--
ALTER TABLE `hjmall_template_msg`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_territorial_limitation`
--
ALTER TABLE `hjmall_territorial_limitation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_topic`
--
ALTER TABLE `hjmall_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_topic_favorite`
--
ALTER TABLE `hjmall_topic_favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_topic_type`
--
ALTER TABLE `hjmall_topic_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_upload_config`
--
ALTER TABLE `hjmall_upload_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_upload_file`
--
ALTER TABLE `hjmall_upload_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_user`
--
ALTER TABLE `hjmall_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `hjmall_user_account_log`
--
ALTER TABLE `hjmall_user_account_log`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_user_auth_login`
--
ALTER TABLE `hjmall_user_auth_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_user_card`
--
ALTER TABLE `hjmall_user_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_user_coupon`
--
ALTER TABLE `hjmall_user_coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_user_form_id`
--
ALTER TABLE `hjmall_user_form_id`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_user_log`
--
ALTER TABLE `hjmall_user_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_user_share_money`
--
ALTER TABLE `hjmall_user_share_money`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_video`
--
ALTER TABLE `hjmall_video`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_we7_user_auth`
--
ALTER TABLE `hjmall_we7_user_auth`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_wechat_app`
--
ALTER TABLE `hjmall_wechat_app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `hjmall_wechat_platform`
--
ALTER TABLE `hjmall_wechat_platform`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_wechat_template_message`
--
ALTER TABLE `hjmall_wechat_template_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `hjmall_wx_title`
--
ALTER TABLE `hjmall_wx_title`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_yy_cat`
--
ALTER TABLE `hjmall_yy_cat`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_yy_form`
--
ALTER TABLE `hjmall_yy_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_yy_form_id`
--
ALTER TABLE `hjmall_yy_form_id`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_yy_goods`
--
ALTER TABLE `hjmall_yy_goods`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_yy_goods_pic`
--
ALTER TABLE `hjmall_yy_goods_pic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_yy_order`
--
ALTER TABLE `hjmall_yy_order`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_yy_order_comment`
--
ALTER TABLE `hjmall_yy_order_comment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `hjmall_yy_order_form`
--
ALTER TABLE `hjmall_yy_order_form`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_account`
--
ALTER TABLE `ims_account`
  MODIFY `acid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `ims_account_wxapp`
--
ALTER TABLE `ims_account_wxapp`
  MODIFY `acid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `ims_activity_clerks`
--
ALTER TABLE `ims_activity_clerks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_activity_clerk_menu`
--
ALTER TABLE `ims_activity_clerk_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_activity_coupon_allocation`
--
ALTER TABLE `ims_activity_coupon_allocation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_activity_coupon_modules`
--
ALTER TABLE `ims_activity_coupon_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_activity_exchange`
--
ALTER TABLE `ims_activity_exchange`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_activity_exchange_trades`
--
ALTER TABLE `ims_activity_exchange_trades`
  MODIFY `tid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_activity_exchange_trades_shipping`
--
ALTER TABLE `ims_activity_exchange_trades_shipping`
  MODIFY `tid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_activity_modules`
--
ALTER TABLE `ims_activity_modules`
  MODIFY `mid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_activity_modules_record`
--
ALTER TABLE `ims_activity_modules_record`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_activity_stores`
--
ALTER TABLE `ims_activity_stores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_article_category`
--
ALTER TABLE `ims_article_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_article_comment`
--
ALTER TABLE `ims_article_comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_article_news`
--
ALTER TABLE `ims_article_news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_article_notice`
--
ALTER TABLE `ims_article_notice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_article_unread_notice`
--
ALTER TABLE `ims_article_unread_notice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_attachment_group`
--
ALTER TABLE `ims_attachment_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_basic_reply`
--
ALTER TABLE `ims_basic_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_business`
--
ALTER TABLE `ims_business`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_core_attachment`
--
ALTER TABLE `ims_core_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_core_cron`
--
ALTER TABLE `ims_core_cron`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_core_cron_record`
--
ALTER TABLE `ims_core_cron_record`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_core_job`
--
ALTER TABLE `ims_core_job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_core_menu`
--
ALTER TABLE `ims_core_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `ims_core_menu_shortcut`
--
ALTER TABLE `ims_core_menu_shortcut`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_core_paylog`
--
ALTER TABLE `ims_core_paylog`
  MODIFY `plid` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_core_performance`
--
ALTER TABLE `ims_core_performance`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_core_queue`
--
ALTER TABLE `ims_core_queue`
  MODIFY `qid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_core_refundlog`
--
ALTER TABLE `ims_core_refundlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_core_resource`
--
ALTER TABLE `ims_core_resource`
  MODIFY `mid` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_core_sendsms_log`
--
ALTER TABLE `ims_core_sendsms_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_coupon_location`
--
ALTER TABLE `ims_coupon_location`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_cover_reply`
--
ALTER TABLE `ims_cover_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `ims_custom_reply`
--
ALTER TABLE `ims_custom_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_images_reply`
--
ALTER TABLE `ims_images_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_job`
--
ALTER TABLE `ims_job`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_card`
--
ALTER TABLE `ims_mc_card`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_card_care`
--
ALTER TABLE `ims_mc_card_care`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_card_credit_set`
--
ALTER TABLE `ims_mc_card_credit_set`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_card_members`
--
ALTER TABLE `ims_mc_card_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_card_notices`
--
ALTER TABLE `ims_mc_card_notices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_card_notices_unread`
--
ALTER TABLE `ims_mc_card_notices_unread`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_card_recommend`
--
ALTER TABLE `ims_mc_card_recommend`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_card_record`
--
ALTER TABLE `ims_mc_card_record`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_card_sign_record`
--
ALTER TABLE `ims_mc_card_sign_record`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_cash_record`
--
ALTER TABLE `ims_mc_cash_record`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_chats_record`
--
ALTER TABLE `ims_mc_chats_record`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_credits_recharge`
--
ALTER TABLE `ims_mc_credits_recharge`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_credits_record`
--
ALTER TABLE `ims_mc_credits_record`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_fans_groups`
--
ALTER TABLE `ims_mc_fans_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_fans_tag`
--
ALTER TABLE `ims_mc_fans_tag`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_fans_tag_mapping`
--
ALTER TABLE `ims_mc_fans_tag_mapping`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_groups`
--
ALTER TABLE `ims_mc_groups`
  MODIFY `groupid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `ims_mc_handsel`
--
ALTER TABLE `ims_mc_handsel`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_mapping_fans`
--
ALTER TABLE `ims_mc_mapping_fans`
  MODIFY `fanid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_mapping_ucenter`
--
ALTER TABLE `ims_mc_mapping_ucenter`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_mass_record`
--
ALTER TABLE `ims_mc_mass_record`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_members`
--
ALTER TABLE `ims_mc_members`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_member_address`
--
ALTER TABLE `ims_mc_member_address`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_member_fields`
--
ALTER TABLE `ims_mc_member_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_member_property`
--
ALTER TABLE `ims_mc_member_property`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_mc_oauth_fans`
--
ALTER TABLE `ims_mc_oauth_fans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_menu_event`
--
ALTER TABLE `ims_menu_event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_message_notice_log`
--
ALTER TABLE `ims_message_notice_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `ims_mobilenumber`
--
ALTER TABLE `ims_mobilenumber`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_modules`
--
ALTER TABLE `ims_modules`
  MODIFY `mid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- 使用表AUTO_INCREMENT `ims_modules_bindings`
--
ALTER TABLE `ims_modules_bindings`
  MODIFY `eid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `ims_modules_cloud`
--
ALTER TABLE `ims_modules_cloud`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `ims_modules_ignore`
--
ALTER TABLE `ims_modules_ignore`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_modules_plugin`
--
ALTER TABLE `ims_modules_plugin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_modules_plugin_rank`
--
ALTER TABLE `ims_modules_plugin_rank`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_modules_rank`
--
ALTER TABLE `ims_modules_rank`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `ims_modules_recycle`
--
ALTER TABLE `ims_modules_recycle`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `ims_music_reply`
--
ALTER TABLE `ims_music_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_news_reply`
--
ALTER TABLE `ims_news_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_phoneapp_versions`
--
ALTER TABLE `ims_phoneapp_versions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_profile_fields`
--
ALTER TABLE `ims_profile_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- 使用表AUTO_INCREMENT `ims_qrcode`
--
ALTER TABLE `ims_qrcode`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_qrcode_stat`
--
ALTER TABLE `ims_qrcode_stat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_rule`
--
ALTER TABLE `ims_rule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `ims_rule_keyword`
--
ALTER TABLE `ims_rule_keyword`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- 使用表AUTO_INCREMENT `ims_site_article`
--
ALTER TABLE `ims_site_article`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_site_article_comment`
--
ALTER TABLE `ims_site_article_comment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_site_category`
--
ALTER TABLE `ims_site_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_site_multi`
--
ALTER TABLE `ims_site_multi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `ims_site_nav`
--
ALTER TABLE `ims_site_nav`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_site_page`
--
ALTER TABLE `ims_site_page`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_site_slide`
--
ALTER TABLE `ims_site_slide`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_site_store_cash_log`
--
ALTER TABLE `ims_site_store_cash_log`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_site_store_cash_order`
--
ALTER TABLE `ims_site_store_cash_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_site_store_create_account`
--
ALTER TABLE `ims_site_store_create_account`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_site_store_goods`
--
ALTER TABLE `ims_site_store_goods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_site_store_goods_cloud`
--
ALTER TABLE `ims_site_store_goods_cloud`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_site_store_order`
--
ALTER TABLE `ims_site_store_order`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_site_styles`
--
ALTER TABLE `ims_site_styles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `ims_site_styles_vars`
--
ALTER TABLE `ims_site_styles_vars`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_site_templates`
--
ALTER TABLE `ims_site_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `ims_stat_fans`
--
ALTER TABLE `ims_stat_fans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `ims_stat_keyword`
--
ALTER TABLE `ims_stat_keyword`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_stat_msg_history`
--
ALTER TABLE `ims_stat_msg_history`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_stat_rule`
--
ALTER TABLE `ims_stat_rule`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_stat_visit`
--
ALTER TABLE `ims_stat_visit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `ims_stat_visit_ip`
--
ALTER TABLE `ims_stat_visit_ip`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `ims_system_stat_visit`
--
ALTER TABLE `ims_system_stat_visit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_uni_account`
--
ALTER TABLE `ims_uni_account`
  MODIFY `uniacid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `ims_uni_account_group`
--
ALTER TABLE `ims_uni_account_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `ims_uni_account_menus`
--
ALTER TABLE `ims_uni_account_menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_uni_account_modules`
--
ALTER TABLE `ims_uni_account_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_uni_account_modules_shortcut`
--
ALTER TABLE `ims_uni_account_modules_shortcut`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_uni_account_users`
--
ALTER TABLE `ims_uni_account_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `ims_uni_group`
--
ALTER TABLE `ims_uni_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `ims_uni_link_uniacid`
--
ALTER TABLE `ims_uni_link_uniacid`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_uni_modules`
--
ALTER TABLE `ims_uni_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `ims_uni_verifycode`
--
ALTER TABLE `ims_uni_verifycode`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_userapi_cache`
--
ALTER TABLE `ims_userapi_cache`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_userapi_reply`
--
ALTER TABLE `ims_userapi_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用表AUTO_INCREMENT `ims_users`
--
ALTER TABLE `ims_users`
  MODIFY `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `ims_users_bind`
--
ALTER TABLE `ims_users_bind`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_users_create_group`
--
ALTER TABLE `ims_users_create_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_users_extra_group`
--
ALTER TABLE `ims_users_extra_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `ims_users_extra_limit`
--
ALTER TABLE `ims_users_extra_limit`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_users_extra_modules`
--
ALTER TABLE `ims_users_extra_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `ims_users_extra_templates`
--
ALTER TABLE `ims_users_extra_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_users_failed_login`
--
ALTER TABLE `ims_users_failed_login`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `ims_users_founder_group`
--
ALTER TABLE `ims_users_founder_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_users_founder_own_create_groups`
--
ALTER TABLE `ims_users_founder_own_create_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_users_founder_own_uni_groups`
--
ALTER TABLE `ims_users_founder_own_uni_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_users_founder_own_users`
--
ALTER TABLE `ims_users_founder_own_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_users_founder_own_users_groups`
--
ALTER TABLE `ims_users_founder_own_users_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_users_group`
--
ALTER TABLE `ims_users_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `ims_users_invitation`
--
ALTER TABLE `ims_users_invitation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_users_lastuse`
--
ALTER TABLE `ims_users_lastuse`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `ims_users_permission`
--
ALTER TABLE `ims_users_permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_users_profile`
--
ALTER TABLE `ims_users_profile`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_video_reply`
--
ALTER TABLE `ims_video_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_voice_reply`
--
ALTER TABLE `ims_voice_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_wechat_attachment`
--
ALTER TABLE `ims_wechat_attachment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_wechat_news`
--
ALTER TABLE `ims_wechat_news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_wxapp_general_analysis`
--
ALTER TABLE `ims_wxapp_general_analysis`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `ims_wxapp_versions`
--
ALTER TABLE `ims_wxapp_versions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `ims_wxcard_reply`
--
ALTER TABLE `ims_wxcard_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
