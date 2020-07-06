/*
Navicat MySQL Data Transfer

Source Server         : localhost_3323
Source Server Version : 50162
Source Host           : localhost:3323
Source Database       : db_czdq

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2019-04-06 17:44:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `userPw` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'a', 'a');

-- ----------------------------
-- Table structure for `t_catelog`
-- ----------------------------
DROP TABLE IF EXISTS `t_catelog`;
CREATE TABLE `t_catelog` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_catelog
-- ----------------------------
INSERT INTO `t_catelog` VALUES ('1553655671168', '吸尘器', 'no');
INSERT INTO `t_catelog` VALUES ('1553655682143', '车载净化器', 'no');
INSERT INTO `t_catelog` VALUES ('1553655689234', '充电器', 'no');
INSERT INTO `t_catelog` VALUES ('1553655706586', '点烟器', 'no');

-- ----------------------------
-- Table structure for `t_goods`
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` varchar(50) NOT NULL,
  `catelog_id` varchar(50) DEFAULT NULL,
  `mingcheng` varchar(500) DEFAULT NULL,
  `jieshao` varchar(5000) DEFAULT NULL,
  `fujian` varchar(500) DEFAULT NULL,
  `shichangjia` int(11) DEFAULT NULL,
  `shifoutejia` varchar(255) DEFAULT NULL,
  `tejia` int(11) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('1553655789988', '1553655671168', '吸尘器12v', '本产品吸力大,12V车用电,过滤性好，噪声小，JK-009的升级版：可吸尘和吸水（干湿两用），过滤布和无纺布尘袋过滤性好，多层过滤防二次污染，仿卡通设计，多种配置(直管和毛刷)，表面喷漆，红色、银色可选选择。', '/upload/1553655786515.jpg', '50', '否', '50', 'no');
INSERT INTO `t_goods` VALUES ('1553655873901', '1553655671168', '日本SUIDENSOV-S110AL吸尘器', '移动冷风机（移动空调）：SS-22LA-8A，SS-18MU-8A，SS-22CG-8A，移动制冷机：SS-22ED-8A，SS-22DD-8A，SS-40EC-8A，SS-40DC-8A，SS-56EC-8A，<br />\r\n超强吸尘器：SV-2001EG-8A，SPSV-110L-8A，SPSV-110-8A，SAV-110R-8A，SAV-110KP-8A，SAC-100。扫地机：ST-651，SSV-103A，SSV-203A，SSV303A，热风机：SHD-1.3FII，SHD-2FII，SHD-4FII，SHD-6FII，SHD-9FII，SHD-15FII集尘机：SDC-2200CS-A，SDC-3700CS-A，SDC-CS（过滤器），SDC-CS-OP（脚轮）', '/upload/1553655869189.jpg', '300', '否', '300', 'no');
INSERT INTO `t_goods` VALUES ('1553655976085', '1553655682143', '米微车载净化器', '米为车载净化器超大风量超长使用寿命特色风道设计，内部采用德国高品质点击，性能稳定，寿命长，更优的风机设计带来更大的风量，更快速净化空气，CADR值高达30m&sup3;/h。优质负离子发生器300万负离子除粉尘、浮毛，异味、除烟、杀菌活跃空气分子为您的生命保驾护航。智能TVOC传感器空气质量实时监测。<br />\r\n360&deg;无漏洞全方位净化、除甲醛。全国统一售后，48小时免费上门服务，全国78座城市店。淘宝，京东，天猫三大电商平台供货，不费&ldquo;芯&rdquo;烦恼。', '/upload/1553655971897.jpg', '20', '否', '20', 'no');
INSERT INTO `t_goods` VALUES ('1553656053201', '1553655689234', '三星IPHONE手机快充', '产品尺寸:OD62*82.5MM净重:180克优点:多功能车载无线充电器 二合一无线充 精美铝合金外壳,纳米微吸强劲吸附 不伤手机 重复使用<br />\r\n磁吸对手机的危害:磁铁:1.干扰手机的电磁信号和磁化手机内部的含铁部件.2.导致手机导航的失准和失灵,通话音质的失真,运行卡顿,数据丢失,屏幕花屏或者黑屏,间歇性死机,直至报废,以上的现象一般会在1到4个月内相继出现，根据手机的不同也会出', '/upload/1553656051849.jpg', '10', '否', '10', 'no');
INSERT INTO `t_goods` VALUES ('1553656112987', '1553655689234', '充电器安全充高通QC3.0', '出众的外观，更出众的性能，给您带来更完美的功效内置微电脑自动保护芯片，为您的设备在充电时提供完美的保护<br />\r\n1、&ge;4小时老化测试，确保每个产品品质合格。<br />\r\n2、采用航空铝材环保外壳，坚固耐磨，外观时尚大方。<br />\r\n3、最新科技芯片组，高效转换，性能更稳定。', '/upload/1553656111494.jpg', '10', '否', '10', 'no');
INSERT INTO `t_goods` VALUES ('1553656178162', '1553655706586', '一分二点烟器', 'hcws20481947../长期供应点烟器 车载点烟器 一分三点烟器 一分二点烟器 汽车点火器，质量保证，欢迎咨询洽谈。本产品标准价是，供应总量为套，采购量越大，性价比会越高。本公司产品品牌是国产，产地是未知，诚信度高，值得信赖。本产品输出功率是60（W），输入电压是12-24（V），品牌是国产，加工定制是是，输出电流是1.5-15（A），型号是W-DYQ-13，类型是车载点烟器，输出电压是12-24（V），配件编号是W-DYQ-13，了解更多优质点', '/upload/1553656176791.jpg', '10', '否', '10', 'no');

-- ----------------------------
-- Table structure for `t_guanggao`
-- ----------------------------
DROP TABLE IF EXISTS `t_guanggao`;
CREATE TABLE `t_guanggao` (
  `id` varchar(50) NOT NULL,
  `biaoti` varchar(50) DEFAULT NULL,
  `neirong` varchar(8000) DEFAULT NULL,
  `fujian` varchar(50) DEFAULT NULL,
  `shijian` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_guanggao
-- ----------------------------
INSERT INTO `t_guanggao` VALUES ('1439976698760', '本站部分商品清仓大处理了', '明天开始清仓处理部分商品了，绝对的低价，欢迎抢购', '/upload/1439976697345.jpg', '2019-04-03 17:31');
INSERT INTO `t_guanggao` VALUES ('1439976719776', '测试购物指南啊测试购物指南', '测试呢', '/upload/1439976718256.jpg', '2019-04-03 17:31');
INSERT INTO `t_guanggao` VALUES ('1439979558450', 'ddddd', 'ddddddddddddddddd', '/upload/1439976718256.jpg', '2019-04-03 18:19');

-- ----------------------------
-- Table structure for `t_lianjie`
-- ----------------------------
DROP TABLE IF EXISTS `t_lianjie`;
CREATE TABLE `t_lianjie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mingcheng` varchar(255) DEFAULT NULL,
  `www` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_lianjie
-- ----------------------------
INSERT INTO `t_lianjie` VALUES ('2', 'baidu网站', 'http://www.baidu.com');
INSERT INTO `t_lianjie` VALUES ('3', 'sina新浪', 'http://www.sina.com');

-- ----------------------------
-- Table structure for `t_liuyanban`
-- ----------------------------
DROP TABLE IF EXISTS `t_liuyanban`;
CREATE TABLE `t_liuyanban` (
  `id` varchar(55) NOT NULL,
  `neirong` varchar(200) DEFAULT NULL,
  `liuyanshi` varchar(2000) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `huifu` varchar(50) DEFAULT NULL,
  `huifushi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_liuyanban
-- ----------------------------
INSERT INTO `t_liuyanban` VALUES ('1539224972879', '辅导费', '2019-04-03 10:29', '0', '', '');
INSERT INTO `t_liuyanban` VALUES ('1539224981685', '顶顶顶顶顶大大大', '2019-04-03 10:29', '0', '大幅度', '2019-04-03 16:37');
INSERT INTO `t_liuyanban` VALUES ('1554543768271', '辅导费', '2019-04-06 17:42', '0', '', '');

-- ----------------------------
-- Table structure for `t_order`
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` varchar(200) NOT NULL,
  `bianhao` varchar(200) DEFAULT NULL,
  `shijian` varchar(200) DEFAULT NULL,
  `xingming` varchar(255) DEFAULT NULL,
  `dianhua` varchar(255) DEFAULT NULL,
  `songhuodizhi` varchar(200) DEFAULT NULL,
  `fukuanfangshi` varchar(200) DEFAULT NULL,
  `jine` int(11) DEFAULT NULL,
  `zhuangtai` varchar(200) DEFAULT NULL,
  `user_id` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('1554543756938', '20190406054236', '2019-04-06 17:42:36', '刘三', '13512348888', '青岛路', '货到付款', '50', '已受理', '1538133969830');

-- ----------------------------
-- Table structure for `t_orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `t_orderitem`;
CREATE TABLE `t_orderitem` (
  `id` varchar(200) NOT NULL,
  `order_id` varchar(200) DEFAULT NULL,
  `goods_id` varchar(50) DEFAULT NULL,
  `goods_quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_orderitem
-- ----------------------------
INSERT INTO `t_orderitem` VALUES ('1554543756950', '1554543756938', '1553655976085', '1');
INSERT INTO `t_orderitem` VALUES ('1554543756962', '1554543756938', '1553656053201', '1');
INSERT INTO `t_orderitem` VALUES ('1554543756979', '1554543756938', '1553656178162', '2');

-- ----------------------------
-- Table structure for `t_pinglun`
-- ----------------------------
DROP TABLE IF EXISTS `t_pinglun`;
CREATE TABLE `t_pinglun` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `neirong` varchar(50) DEFAULT NULL,
  `shijian` varchar(4000) DEFAULT NULL,
  `goods_id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pinglun
-- ----------------------------

-- ----------------------------
-- Table structure for `t_tupian`
-- ----------------------------
DROP TABLE IF EXISTS `t_tupian`;
CREATE TABLE `t_tupian` (
  `id` varchar(50) NOT NULL,
  `xinwenId` varchar(50) DEFAULT NULL,
  `jieshao` varchar(4000) DEFAULT NULL,
  `fujian` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tupian
-- ----------------------------

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` varchar(50) NOT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `userPw` varchar(50) DEFAULT NULL,
  `userRealname` varchar(50) DEFAULT NULL,
  `userSex` varchar(4000) DEFAULT NULL,
  `userAge` varchar(50) DEFAULT NULL,
  `userAddress` varchar(11) DEFAULT NULL,
  `userTel` varchar(11) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1538133969830', 'liusan', '000000', '刘三', '男', '20', '青岛路', '13512348888', 'no');

-- ----------------------------
-- Table structure for `t_xinwen`
-- ----------------------------
DROP TABLE IF EXISTS `t_xinwen`;
CREATE TABLE `t_xinwen` (
  `id` varchar(50) NOT NULL,
  `biaoti` varchar(50) DEFAULT NULL,
  `jieshao` varchar(4000) DEFAULT NULL,
  `fabushi` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_xinwen
-- ----------------------------
INSERT INTO `t_xinwen` VALUES ('1520993858854', '[网购安全] 如何如识别和防钓鱼网网购技巧', '钓鱼网已经是网购上当受骗的主要根源了，小谓网购4年，小分享下识别和防范钓鱼网的经验心得。钓鱼网主要是高模仿各大购物网页面，直观上看完全一样，但是我们可以重点从几个方面去突 第一，最简单的，也是最实在的，看网址，例淘宝网的，正确的网址是 钓鱼一定要看准 此方法比较简单容易第二、安装安全的浏览器，如360浏览器或者其他浏览器，一般购物网都推出合作浏览器，用专属浏览器购物，在遇到钓鱼网时，会提示不安全等。<br />第三、不乱点连接，尤其是陌生人发的。重点是特别长的链接，链接里特殊字符特别多这类字符很多。', '2019-04-03 10:17');
INSERT INTO `t_xinwen` VALUES ('1520993917080', '[经验分享] 屌丝们必看的省钱网购经验', '再物价飞涨的今天，什么都涨就工资不涨，月收入2000的屌丝们，都成了月光族。省钱成为了重中之重，本屌给你们分享吧一篇网购省钱经验。在淘宝上买东西，可以节省4成，主要推荐方式，用淘宝金币兑换，或者淘宝金币+部分人民币。另外可以到聚划算上买爆款，一般多是些薄利多销的产品。提醒大家网购便宜，但是不要大量购买东西，不要网购成瘾了。那样就起不到省钱作用了。买书籍到当当网或者卓越亚马逊网，可省钱3成，当当网和卓越亚马逊网是专业网上卖书的商城，全网图书均为正版图书，价格为定价的50%到80%左右，有的图书甚至还有1折的优惠，而且书籍均配有读者的点评，非常的人性化。全场免运费的政策则更是吸引了众多的图书购买者。<br />;买手机数码产品，可选京东商城或淘宝电器城，可省钱指2成。京东商城是专门手机、电脑等数码产品的网上商城，淘包电器城凭借其庞大的淘宝用户也随后壮大起来，目前这两家电器商城几乎80%以上的商品均支持货到在款政策，并完全保证是正品，平均价格为实体价的70%-80%左右，享受与实体购买完全一样的售后服务哦，同时能够开具正规的票据。', '2019-04-03 10:18');
INSERT INTO `t_xinwen` VALUES ('1520993993090', '网购快递延误损坏 消费者维权难待解', '随着网购的普及，收发快递成为很多人生活的一部分。不过，不少消费者都遇到过快递、快递公司违规收费等问题，同时还面临维权困难。在9日举行的第七届中国消费者保护法论坛上，中国法学会消费者权益保护法学研究会的专家认为，当前消费者反映的网购快递问题主要是投递服务延误、丢失短少、损毁等，这些问题影响了消费者的快递服务体验。北京市第三中级人民法院民事审判第三庭副庭长刘建刚分析，在司法实践中，由于网购时快递公司和消费者没有合同关系，消费者申诉比较困难。如果快递货物损坏，消费者就要举证货物的损坏是快递企业在运输过程产生的，但这个举证是十分困难的。消费者如果向网购平台申诉，则会被告知责任不在平台，而是快递公司。', '2019-04-03 10:19');
INSERT INTO `t_xinwen` VALUES ('1520994065465', '购物新体验：网购有了新体验 实体店逆袭有高招', '如今，居民的物质生活水平不断提高，消费从简单购物转向了享受生活，集合化、便捷化、多元化的综合型购物中心正发挥出实体商业的最大优势，成为居民休闲度假的好去处。品种更多，品质提升，网购有了新体验足不出户，动动手指在网上一键式购物，近几年来也成了不少人的福音。平时工作太忙，少有机会逛街的天津河西区的初中老师王文静就成了网购的忠实粉丝。国庆假期到了，很多电商平台又推出了&ldquo;国庆促销&rdquo;活动，她又趁此机会囤了一堆的日用品和小零食，还入手了几件早就放进购物车的衣服。近几年，我国网购用户规模持续增长，其中手机网络购物用户规模增长迅速。网络成了越来越多人购物的首选，让生活越来越便捷。商务部数据显示，2017年上半年，全国网络零售交易额达3.1万亿元人民币，同比增长33.4%。在网购用户不断增加的同时，网购的品质、体验也成了更多人关注的重点，消费者网购的品类也越来越丰富。2013年到2017年，从服装鞋帽、日用百货到珠宝配饰，这些品类在用户购买中的比例显著提升。消费者网购商品从低价的日用品向价格较高的通信数码产品及配件、家用电器扩散，从服装鞋帽扩展到生鲜食品。', '2019-04-03 10:21');
INSERT INTO `t_xinwen` VALUES ('1520994096971', '外媒称瑞士人爱从中国网购：商品丰富 价格实惠', '据瑞士德语广播电视公司网站报道，瑞士电商行业协会对来自中国的包裹洪流忧心忡忡。协会主席帕特里克&middot;凯斯勒对瑞士零售商面临的竞争劣势提出批评：中国零售商向瑞士寄送一个2公斤以下包裹价格仅为1.7瑞郎(1瑞士法郎约合7元人民币)。&ldquo;而瑞士企业在国内寄送相同包裹的价格是5瑞郎到7瑞郎。&rdquo;原因是中国在邮政系统被定级为新兴国家，享受低费率优惠。此外，中国电商还充分利用关税和增值税免税上限：价值62瑞郎以下的商品既不用缴纳增值税，也不用缴纳关税。报道称，不过，与中国的零售巨头相比，瑞士电商在退换货服务方面具备优势。Brack.ch网站首席执行官马库斯-马勒说，出于这个原因，他并不惧怕中国电商。此外，自2019年起，来自中国的外国电商或亚马逊网站也必须在瑞士缴纳增值税。起征点是1瑞郎只要该电商在瑞士的销售额达到10万瑞郎。不过，即便如此，全球速卖通等网站大概依旧能保持极低售价。', '2019-04-03 10:21');
INSERT INTO `t_xinwen` VALUES ('1520994133815', '90后网购最热情：哪里价格低就去哪里', '如今，中国早已超越美国成为全球最大、发展最大快的电子商务市场。一年一度的&ldquo;双11已经成为全民的购物狂欢节，而推动中国快速进入电商时代的除了阿里和京东等电商企业外，众多消费都是&ldquo;无名英雄<br />著名咨询公司麦肯锡去年发布的报告指出，未来15年，中国将贡献全球消费增量的30%。而阿里研究院则认为，未来5年，网络购物将贡献私人消费的42%，年轻一代的消费能力更强，在众多品类上的消费高出上一代40%。今年&ldquo;618&rdquo;前后，《每日经济新闻》记者采访了多位&ldquo;90后&rdquo;、&ldquo;80后&rdquo;和&ldquo;70后&rdquo;，期望了解他们眼中的电商购物节，以及他们的消费理念。', '2019-04-03 10:22');
