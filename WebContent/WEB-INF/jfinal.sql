/*
Navicat MySQL Data Transfer

Source Server         : 115.159.151.91 
Source Server Version : 50717
Source Host           : 115.159.151.91 :3306
Source Database       : jfinal

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-09-07 14:03:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `ad`
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `adurl` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `cts` varchar(255) DEFAULT NULL,
  `asort` int(11) NOT NULL DEFAULT '0',
  `adesc` text,
  `adimg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ad
-- ----------------------------
INSERT INTO `ad` VALUES ('3', '#', '1', '2017-09-07 13:24:44', '0', '', '/upload/ad/a7fd53c561d1.jpg');
INSERT INTO `ad` VALUES ('4', '#', '1', '2017-09-07 13:24:51', '0', '', '/upload/ad/6f90b914be84.jpg');

-- ----------------------------
-- Table structure for `cmg`
-- ----------------------------
DROP TABLE IF EXISTS `cmg`;
CREATE TABLE `cmg` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `loginTs` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmg
-- ----------------------------
INSERT INTO `cmg` VALUES ('1', 'admin', 'admin', '2017-09-07 13:46:44');

-- ----------------------------
-- Table structure for `foods`
-- ----------------------------
DROP TABLE IF EXISTS `foods`;
CREATE TABLE `foods` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `putaway` tinyint(4) NOT NULL DEFAULT '0',
  `pts` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `mname` varchar(255) DEFAULT NULL,
  `fsort` int(11) NOT NULL DEFAULT '0',
  `note` varchar(255) DEFAULT NULL,
  `cts` varchar(255) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `foodimg1` varchar(255) DEFAULT NULL,
  `foodimg2` varchar(255) DEFAULT NULL,
  `foodimg3` varchar(255) DEFAULT NULL,
  `foodimg4` varchar(255) DEFAULT NULL,
  `foodimg5` varchar(255) DEFAULT NULL,
  `foodimg6` varchar(255) DEFAULT NULL,
  `foodimg7` varchar(255) DEFAULT NULL,
  `foodimg8` varchar(255) DEFAULT NULL,
  `fdesc` text,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of foods
-- ----------------------------
INSERT INTO `foods` VALUES ('1', '米饭', '1', '1', '2017-09-07 13:39:54', '份', '1', null, '0', '', '2017-09-07 13:39:54', '1', '/upload/foods/fb8cc901b4c7.jpg', '/upload/foods/47c2550297e0.jpg', '', '', '', '', '', '', '&#60;p&#62;&#60;a href=&apos;https://baike.so.com/doc/5682310-5894987.html&apos; target=&apos;_blank&apos;&#62;米饭&#60;/a&#62;，是&#60;a href=&apos;https://baike.so.com/doc/4542215-4752526.html&apos; target=&apos;_blank&apos;&#62;中国人&#60;/a&#62;日常饮食中的主角之一，中国南方&#60;a href=&apos;https://baike.so.com/doc/6652037-6865856.html&apos; target=&apos;_blank&apos;&#62;主食&#60;/a&#62;。米饭可与五味调配，几乎可以供给全身所需营养。大米性平、味甘; 有补中益气、健脾养胃、益精强志、和五脏、通血脉、聪耳明目、止烦、止渴、止泻的功效。留有胚与糊粉层的大米饭含有人体90%的必需&#60;a href=&apos;https://baike.so.com/doc/5913174-6126085.html&apos; target=&apos;_blank&apos;&#62;营养元素&#60;/a&#62;，且各种营养素十分均衡，所以是最佳主食。米饭的面世，可追溯至&#60;a href=&apos;https://baike.so.com/doc/1435581-1517453.html&apos; target=&apos;_blank&apos;&#62;粥&#60;/a&#62;。由于烹煮粥水控制水量的要求比米饭低，上古的华夏民众慢慢掌握不同水量时的烹煮效果，就&#60;a href=&apos;https://baike.so.com/doc/5397508-5634822.html&apos; target=&apos;_blank&apos;&#62;发展&#60;/a&#62;出较饱满的米饭。&#60;br&#62;&#60;/p&#62;&#60;p&#62;&#60;img alt=&apos;6c5b720a284d.jpg&apos; src=&apos;http://localhost:8080/Myjfinal/upload/fdesc/79cc175f2377.jpg&apos; data-image-size=&apos;500,500&apos;&#62;&#60;br&#62;&#60;/p&#62;');
INSERT INTO `foods` VALUES ('2', '宫保鸡丁', '12', '1', '2017-09-07 13:46:00', '份', '1', null, '0', '', '2017-09-07 13:46:00', '3', '/upload/foods/bbec43081f63.png', '/upload/foods/be327eced1a3.jpg', '/upload/foods/a3fdddf65621.jpg', '', '', '', '', '', '&#60;p&#62;宫保鸡丁是川菜中最具代表性的菜品之一，创始人为&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5013053-5238363.html&apos;&#62;贵州&#60;/a&#62;织金人时任四川总督&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/901652.html&apos;&#62;丁宝桢&#60;/a&#62;，在任&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/2871728.html&apos;&#62;四川&#60;/a&#62;总督时创制该菜，流传至今。由于一般认为宫保鸡丁正式创制是&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/901652.html&apos;&#62;丁宝桢&#60;/a&#62;任四川&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/3216284.html&apos;&#62;总督&#60;/a&#62;之时，在蜀地创制并流传开，且其后至今的漫长岁月中，宫保鸡丁主要通过市场巨大的&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5386137-5622587.html&apos;&#62;川菜&#60;/a&#62;馆作为载体走向大江南北及海外，声名远播，因此宫保鸡丁在菜系定位属于川菜系，同时由于丁宝桢为贵州人，所以宫保鸡丁也可被认为是贵州菜系即黔菜系。&apos;nbsp;&#60;br&#62;&#60;/p&#62;&#60;p&#62;&#60;br&#62;&#60;/p&#62;&#60;p&#62;&#60;br&#62;&#60;/p&#62;&#60;h2&#62;营养价值&#60;/h2&#62;&#60;h3&#62;&#60;a href=&apos;https://baike.so.com/doc/5333234-5568668.html#&apos;&#62;折叠&#60;/a&#62;功效&#60;/h3&#62;&#60;p&#62;清热除火，健脑，健脾和胃，强筋，壮骨，养颜护肤，调经，养阴补虚。&#60;/p&#62;&#60;h3&#62;&#60;a href=&apos;https://baike.so.com/doc/5333234-5568668.html#&apos;&#62;折叠&#60;/a&#62;营养情况&#60;/h3&#62;&#60;p&#62;热量(2154.51千卡) ：&#60;/p&#62;&#60;p&#62;&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5403340.html&apos;&#62;维生素B6&#60;/a&#62;(0.15毫克) ·&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/968469.html&apos;&#62;蛋白质&#60;/a&#62;(171.40克) ·&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5349056.html&apos;&#62;脂肪&#60;/a&#62;(146.80克) ·&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5735896.html&apos;&#62;泛酸&#60;/a&#62;(0.07毫&#60;img alt=&apos;宫保鸡丁&apos; src=&apos;https://p1.ssl.qhmsg.com/dr/220__/t01470f3c0aea8366e8.jpg&apos;&#62;克) ·&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5373132.html&apos;&#62;碳水化合物&#60;/a&#62;(55.48克) ·&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5344195.html&apos;&#62;叶酸&#60;/a&#62;(12.20微克) ·&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5411122.html&apos;&#62;膳食纤维&#60;/a&#62;(18.60克) ·&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5373248.html&apos;&#62;胆固醇&#60;/a&#62;(880.00毫克) ·&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5355139.html&apos;&#62;维生素A&#60;/a&#62;(384.50微克) ·&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5411072.html&apos;&#62;胡萝卜素&#60;/a&#62;(3.00微克) ·&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5834200.html&apos;&#62;硫胺素&#60;/a&#62;(0.68毫克) ·核黄素( 0.94毫克) ·尼克酸(45.73毫克) ·&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5355198.html&apos;&#62;维生素C&#60;/a&#62;(0.70毫克) ·维生素E (28.96毫克) ·钙 (117.56毫克) ·&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/4236858.html&apos;&#62;磷&#60;/a&#62;(1484.39毫克) ·钾(2659.15毫克) ·&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5086838.html&apos;&#62;钠&#60;/a&#62;(5544.18毫克) ·&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5184946.html&apos;&#62;镁&#60;/a&#62;(241.73毫克) ·&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5098422.html&apos;&#62;铁&#60;/a&#62;(17.42毫克) ·&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/166873.html&apos;&#62;锌&#60;/a&#62;(12.84毫克) ·硒(97.65微克) ·&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/3817899.html&apos;&#62;铜&#60;/a&#62;(0.98毫克) ·&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/4052075.html&apos;&#62;锰&#60;/a&#62;(5.29毫克)&#60;/p&#62;&#60;p&#62;鸡肉：&#60;/p&#62;&#60;p&#62;&#60;img src=&apos;https://p1.ssl.qhmsg.com/dr/220__/t015ab4edd39ad44ad6.jpg&apos;&#62;鸡肉有温中益气，补精添髓，补虚益智的作用。《神农本草经》上说常吃鸡肉能通神;后世医家大多认为食之令人聪慧。&#60;/p&#62;&#60;p&#62;鸡肉肉质细嫩，滋味鲜美，并富有营养，有滋补养身的作用。鸡肉中蛋白质的含量比例很高，而且消化率高，很容易被人体吸收利用，有增强体力、强壮身体的作用。鸡肉含有对人体生长发育有重要作用的磷脂类，是中国人膳食结构中脂肪和磷脂的重要来源之一。鸡肉对&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5366028.html&apos;&#62;营养不良&#60;/a&#62;、畏寒怕冷、&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5411540.html&apos;&#62;乏力&#60;/a&#62;&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5845361.html&apos;&#62;疲劳&#60;/a&#62;、&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5332742.html&apos;&#62;月经不调&#60;/a&#62;、&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/4366262.html&apos;&#62;贫血&#60;/a&#62;、虚弱等有很好的食疗作用。祖国医学还认为，鸡肉有温中益气、补虚填精、健脾胃、活血脉、强筋骨的功效。&#60;/p&#62;&#60;p&#62;花生仁(炸)：&#60;/p&#62;&#60;p&#62;花生仁含有丰富的蛋白质、不饱和脂肪酸、&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/4682244.html&apos;&#62;维生素E&#60;/a&#62;、&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5373739.html&apos;&#62;钙&#60;/a&#62;、&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5184946.html&apos;&#62;镁&#60;/a&#62;、&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/166873.html&apos;&#62;锌&#60;/a&#62;等营养元素，有增强记忆力、抗老化、止血、预防心脑血管疾病、减少肠癌发生的作用：但其经过油炸后，性质热燥，不宜多食。&#60;/p&#62;');
INSERT INTO `foods` VALUES ('4', '小炒肉', '11', '1', '2017-09-07 13:49:48', '份', '1', null, '0', '', '2017-09-07 13:49:48', '3', '/upload/foods/244054cc9a4a.jpg', '/upload/foods/2d5e580b815e.jpg', '', '', '', '', '', '', '&#60;p&#62;小炒肉是湖南省一道常见的特色传统名菜，属于&#60;a href=&apos;https://baike.so.com/doc/5395544-5632701.html&apos; target=&apos;_blank&apos;&#62;湘菜系&#60;/a&#62;。&#60;a href=&apos;https://baike.so.com/doc/6260790-6474210.html&apos; target=&apos;_blank&apos;&#62;麻辣鲜香&#60;/a&#62;，口味滑嫩。&#60;/p&#62;&#60;p&#62;主要食材是&#60;a href=&apos;https://baike.so.com/doc/5336107-5571546.html&apos; target=&apos;_blank&apos;&#62;五花肉&#60;/a&#62;和&#60;a href=&apos;https://baike.so.com/doc/5423716-10420985.html&apos; target=&apos;_blank&apos;&#62;青椒&#60;/a&#62;、&#60;a href=&apos;https://baike.so.com/doc/6807406-7024357.html&apos; target=&apos;_blank&apos;&#62;红椒&#60;/a&#62;，主要烹饪工艺是&#60;a href=&apos;https://baike.so.com/doc/4926458-5146017.html&apos; target=&apos;_blank&apos;&#62;炒&#60;/a&#62;。将五花肉切成薄片，青红椒切成块备用。坐锅点火倒入油，下花椒、麻椒炸香，加入五花肉&#60;a href=&apos;https://baike.so.com/doc/6260469-6473888.html&apos; target=&apos;_blank&apos;&#62;煸炒&#60;/a&#62;，放入干辣椒继续煸炒，再加入葱、姜、蒜煸炒片刻，加盐、&#60;a href=&apos;https://baike.so.com/doc/3239169-3413254.html&apos; target=&apos;_blank&apos;&#62;料酒&#60;/a&#62;、酱油、高汤精调味，放入青红椒翻炒至熟，出锅前加少许醋即可。&#60;/p&#62;&#60;p&#62;&#60;br&#62;&#60;/p&#62;&#60;h2&#62;营养价值&#60;/h2&#62;&#60;h3&#62;&#60;a href=&apos;https://baike.so.com/doc/6175961-6389202.html#&apos;&#62;折叠&#60;/a&#62;猪肉&#60;/h3&#62;&#60;p&#62;&#60;img alt=&apos;做小炒肉所需的材料&apos; src=&apos;https://p1.ssl.qhmsg.com/dr/220__/t014e5947583f6aea53.jpg&apos;&#62;猪肉又名&#60;a href=&apos;https://baike.so.com/doc/1387061-1466350.html&apos; target=&apos;_blank&apos;&#62;豚肉&#60;/a&#62;，是主要家畜之一、&#60;a href=&apos;https://baike.so.com/doc/5570536-5785745.html&apos; target=&apos;_blank&apos;&#62;猪科&#60;/a&#62;动物家猪的肉。其性味甘咸平，含有丰富的蛋白质及脂肪、碳水化合物、钙、磷、铁等成分。 猪肉是日常生活的主要副食品，具有补虚强身，滋阴润燥、丰肌泽肤的作用。凡病后体弱、产后血虚、面黄赢瘦者，皆可用之作营养滋补之品。&#60;/p&#62;&#60;p&#62;猪肉为人类提供优质蛋白质和必需的脂肪酸。猪肉可提供血红素(有机铁)和促进铁吸收的半胱氨酸，能改善缺铁性贫血。猪肉味甘咸、性平，入脾、胃、肾经;补肾养血，滋阴润燥;主治热病伤津、消渴羸瘦、肾虚体弱、产后血虚、燥咳、便秘、补虚、滋阴、润燥、滋肝阴，润肌肤，利二便和止消渴。&#60;/p&#62;&#60;h3&#62;&#60;a href=&apos;https://baike.so.com/doc/6175961-6389202.html#&apos;&#62;折叠&#60;/a&#62;辣椒&#60;/h3&#62;&#60;p&#62;1.解热、镇痛:辣椒辛温，能够通过发汗而降低体温，并缓解肌肉疼痛，因此具有较强的解热镇痛作用;&#60;/p&#62;&#60;p&#62;2.预防癌种:辣椒的有效成分辣椒素是一种抗氧化物质，它可阻止有关细胞的新陈代谢，从而终止细胞组织的癌变过程，降低癌症细胞的发生率;&#60;/p&#62;&#60;p&#62;3.增加食欲、帮且消化:辣椒强烈的香辣味能刺激唾液和胃液的分泌，增加食欲，促进肠道蠕动，帮助消化;&#60;/p&#62;&#60;p&#62;4.降脂减肥:辣椒所含的&#60;a href=&apos;https://baike.so.com/doc/5945700-6158636.html&apos; target=&apos;_blank&apos;&#62;辣椒素&#60;/a&#62;，能够促进脂肪的新陈代谢，防止体内脂肪积存，有利于降脂减肥防病。&#60;a href=&apos;https://baike.so.com/doc/6175961-6389202.html#refff_6175961-6389202-1&apos;&#62;[1]&#60;/a&#62;&#60;/p&#62;&#60;p&#62;参考资料：&#60;/p&#62;');
INSERT INTO `foods` VALUES ('5', '香菇青菜', '8', '1', '2017-09-07 13:51:26', '份', '1', null, '0', '', '2017-09-07 13:51:26', '3', '/upload/foods/b1ca8d327ae9.jpg', '', '', '', '', '', '', '', '&#60;p&#62;香菇青菜是我国的一道民间著名的家常菜，对青菜和香菇进行翻炒制作。香菇青菜营养丰富，是一道经典的养生菜肴。&#60;br&#62;&#60;/p&#62;&#60;p&#62;&#60;br&#62;&#60;/p&#62;&#60;p&#62;&#60;br&#62;&#60;/p&#62;&#60;h2&#62;原料&#60;/h2&#62;&#60;p&#62;青菜、香菇&#60;/p&#62;&#60;h2&#62;&#60;a href=&apos;https://baike.so.com/doc/1441312-1523603.html#&apos;&#62;折叠&#60;/a&#62;&#60;a href=&apos;https://baike.so.com/create/edit/?eid=1441312&apos;amp;sid=1523603&apos;amp;secid=2&apos;&#62;编辑本段&#60;/a&#62;调料&#60;/h2&#62;&#60;p&#62;油、盐、&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5685184.html&apos;&#62;鸡精&#60;/a&#62;、蒜末、&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5580797.html&apos;&#62;生抽&#60;/a&#62;、上汤（由于没有上汤，俺是用类鸡精水）&#60;/p&#62;&#60;h2&#62;&#60;a href=&apos;https://baike.so.com/doc/1441312-1523603.html#&apos;&#62;折叠&#60;/a&#62;&#60;a href=&apos;https://baike.so.com/create/edit/?eid=1441312&apos;amp;sid=1523603&apos;amp;secid=3&apos;&#62;编辑本段&#60;/a&#62;做法&#60;/h2&#62;&#60;p&#62;锅内放油，油热时放青菜炒制，快熟时加入少许鸡精和盐&#60;/p&#62;&#60;p&#62;加入蒜末翻炒后盛出（有时间的&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5934473.html&apos;&#62;话放&#60;/a&#62;盘中摆一下好看）&#60;/p&#62;&#60;p&#62;锅内放油，将香菇整个放在锅&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/3840150.html&apos;&#62;里略&#60;/a&#62;炒后加盖用小火焖五分钟；开盖，这会你会发现香菇比入锅前要略微变小了，这时加入生抽与盐、鸡精调味，将调料调匀后再加入适量的上汤调匀。&#60;/p&#62;&#60;p&#62;香菇盛出，用筷子整齐地摆放在青菜上，最后将锅内的汁淋在菜上即可。&#60;/p&#62;');
INSERT INTO `foods` VALUES ('6', '咖喱炒饭', '10', '1', '2017-09-07 13:53:27', '份', '1', null, '0', '', '2017-09-07 13:53:27', '6', '/upload/foods/a8e65ea495b6.jpg', '/upload/foods/e5e78c6cc6da.jpg', '', '', '', '', '', '', '&#60;h2&#62;特点&#60;/h2&#62;&#60;p&#62;最奇妙的炒饭，点点&#60;a href=&apos;https://baike.so.com/doc/664042-702946.html&apos; target=&apos;_blank&apos;&#62;咖喱粉&#60;/a&#62;，浓浓异域情。&#60;/p&#62;&#60;h2&#62;&#60;a href=&apos;https://baike.so.com/doc/6392132-6605789.html#&apos;&#62;折叠&#60;/a&#62;&#60;a href=&apos;https://baike.so.com/create/edit/?eid=6392132&apos;amp;sid=6605789&apos;amp;secid=3&apos;&#62;编辑本段&#60;/a&#62;营养价值&#60;/h2&#62;&#60;p&#62;大米 - 大米中的赖氨酸含量极少，如不能从其他食物中得到补充，以在米为主食的人对蛋白质的利用率就会降低，不仅影响儿童长个儿，也对成年人的新陈代谢带&#60;/p&#62;&#60;p&#62;胡萝卜 - 胡萝卜是一种质脆味美、营养丰富的家常蔬菜。据最新一期《&#60;a href=&apos;https://baike.so.com/doc/6511230-6724955.html&apos; target=&apos;_blank&apos;&#62;大众医学&#60;/a&#62;》杂志介绍，美国科学家的最新研究又证实:每天吃两根胡萝卜，可使血中胆固醇降低&#60;/p&#62;&#60;p&#62;青豆 - 青豆为鲜&#60;a href=&apos;https://baike.so.com/doc/136208-143883.html&apos; target=&apos;_blank&apos;&#62;豆类&#60;/a&#62;，蛋白质、钙质丰富;枸杞子清热明目;山药健脾;玉米是杂粮，b族维生素充足，热量高;松仁有补养、滋润脏腑和肌肤的功效。&#60;img alt=&apos;高级咖喱炒饭&apos; src=&apos;https://p1.ssl.qhmsg.com/dr/220__/t011b57fe3692ff5c0d.jpg&apos;&#62;&#60;/p&#62;&#60;p&#62;爱吃&#60;a href=&apos;https://baike.so.com/doc/5569822-5785025.html&apos; target=&apos;_blank&apos;&#62;咖喱饭&#60;/a&#62;，如果有新米饭，就做个&#60;a href=&apos;https://baike.so.com/doc/6392069-6605726.html&apos; target=&apos;_blank&apos;&#62;咖喱汁&#60;/a&#62;浇上。如果是陈米饭，就直接加点蔬菜炒炒，撒一勺&#60;a href=&apos;https://baike.so.com/doc/664042-702946.html&apos; target=&apos;_blank&apos;&#62;咖喱粉&#60;/a&#62;和盐，轻轻松松搞定一餐，&#60;a href=&apos;https://baike.so.com/doc/5569822-5785025.html&apos; target=&apos;_blank&apos;&#62;咖喱饭&#60;/a&#62;的色泽金黄，看着就有食欲。咖喱的味道辛辣香浓，那是相当开胃，满满的异域风情哦!&#60;/p&#62;&#60;p&#62;咖喱发源于印度，风靡日本，泰国，是亚太地区的主流菜肴。&#60;/p&#62;&#60;p&#62;印度民间传说咖喱是佛祖释迦牟尼所创。&apos;咖喱&apos;一词来源于坦米尔语，是&apos;许多香料加在一起煮&apos;的意思。所以它是一味复合型调料，口味，辣度，颜色会很不同。形态也很多，咖喱块，&#60;a href=&apos;https://baike.so.com/doc/664042-702946.html&apos; target=&apos;_blank&apos;&#62;咖喱粉&#60;/a&#62;，咖喱膏，咖喱酱等。多尝试几种，总会找到最爱的那个口味。我不喜辣，所以都买辣度一般的咖喱块和&#60;a href=&apos;https://baike.so.com/doc/664042-702946.html&apos; target=&apos;_blank&apos;&#62;咖喱粉&#60;/a&#62;。没有哪种最好，符合自己口味的才是最好的。&#60;/p&#62;&#60;p&#62;&apos;nbsp;&#60;/p&#62;');
INSERT INTO `foods` VALUES ('7', '麻辣豆腐', '9', '1', '2017-09-07 13:55:43', '份', '1', null, '0', '', '2017-09-07 13:55:43', '3', '/upload/foods/e3196cd52cf1.jpg', '/upload/foods/f7434171befc.jpg', '', '', '', '', '', '', '&#60;p&#62;&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5348343-5583795.html&apos;&#62;麻婆豆腐&#60;/a&#62;是四川省汉族传统名菜之一，属于川菜系。主要原料为配料和豆腐，材料主要有&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5355294-5590760.html&apos;&#62;豆腐&#60;/a&#62;、牛肉末(也可以用&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5409930-5647973.html&apos;&#62;猪肉&#60;/a&#62;)、辣椒和花椒等。麻来自花椒，&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/3726983-3915991.html&apos;&#62;辣&#60;/a&#62;来自辣椒，这道菜突出了川菜&apos;麻辣&apos;的特点。麻婆豆腐在不同的地区有不同的做法，南方做法多数会放些许肉末，而北方就是单纯的放置辣椒和花椒。&#60;/p&#62;&#60;p&#62;此菜大约在清代同治初年(1874年以后)，由&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/2453672-2593720.html&apos;&#62;成都&#60;/a&#62;市北郊万福桥一家名为&apos;陈兴盛饭铺&apos;的小饭店老板娘陈刘氏所创。因为陈刘氏脸上有麻点，人称陈麻婆，她发明的烧豆腐就被称为&apos;陈麻婆豆腐&apos;。&#60;/p&#62;&#60;h2&#62;菜品特色&#60;/h2&#62;&#60;p&#62;菜系分类：&#60;a target=&apos;_blank&apos; href=&apos;https://baike.so.com/doc/5381376-5617700.html&apos;&#62;家常菜&#60;/a&#62;&#60;/p&#62;&#60;p&#62;功效分类：脾调养食谱、补血食谱、便秘食谱、自汗盗汗食谱&#60;img src=&apos;https://p1.ssl.qhmsg.com/dr/220__/t017fc1145b3772c091.jpg&apos;&#62;&#60;/p&#62;&#60;p&#62;准备时间：10-30分钟&#60;/p&#62;&#60;p&#62;口味：麻辣味&#60;/p&#62;&#60;p&#62;工艺：烧&#60;/p&#62;&#60;p&#62;此菜色泽淡黄，豆腐软嫩而有光泽、其味麻、辣、酥、香、嫩、鲜、烫，豆腐表面盖有一层淡红色的辣油，可保持豆腐内的热度不使很快散失，趁热吃滋味更佳，花椒面也扑鼻。在数九寒冬季节食用，更是取暖解寒的美味佳肴。&#60;/p&#62;&#60;p&#62;麻：指豆腐在起锅时，要洒上适量的花椒末。花椒要用汉源进贡朝廷的贡椒，麻味纯正，沁人心脾。如若别地花椒，麻味卡喉，令人气紧，谁还会有食欲，谁敢再夹豆腐？三十年代初，军阀割踞混战，汉源花椒告罄，店铺除向外县重价购买汉椒外，还在铺门贴出告示声明无上好花椒，麻婆豆腐宁停不卖。这一坦白经营作法，在同业中传为美谈。&#60;/p&#62;&#60;p&#62;辣：是选用龙潭寺大红袍油椒制作豆瓣，剁细炼熟，加以少量熟油海椒烹脍豆腐，又辣又香。&#60;/p&#62;&#60;p&#62;烫：豆腐的特质保持了整道菜出锅后的温度，不容易冷却，每下一次筷子，吃到的都是刚出炉的味道。&#60;/p&#62;&#60;p&#62;香：就是起锅立即上桌，闻不到制豆腐石膏味，冷浸豆腐的水锈味，各色佐料原有的难闻气味，只有勾起食欲的香味。&#60;/p&#62;&#60;p&#62;酥：指炼好的牛肉馅子，色泽金黄，红酥不板，一颗颗，一粒粒，入口就酥，沾牙就化。&#60;/p&#62;&#60;p&#62;嫩：指的是豆腐下锅，煎氽得法，色白如玉，有楞有角，一捻即碎，故住宅大多用小勺舀食。&#60;/p&#62;&#60;p&#62;鲜：指全菜原料，俱皆新鲜，鲜嫩翠绿，红白相宜，色味俱鲜，无可挑剔。&#60;/p&#62;&#60;p&#62;活：是陈麻婆豆腐店的一项绝技：豆腐上桌，寸把长的蒜苗，在碗内根根直立，翠绿湛兰，油泽甚艳，仿佛刚从畦地采摘切碎，活灵活现，但夹之入口，俱皆熟透，毫无生涩味道。&#60;/p&#62;&#60;p&#62;抗日战争中，大众饭店普及，不少饭铺都能做出麻婆豆腐;江南内迁成都不少餐馆，也都挂出麻婆豆腐菜名，论手艺、论火工可谓有麻婆豆腐功夫，论原料、论配料自然各有麻辣口味，唯独全市没有一家能把蒜苗显活这一关闯过。南打金街、江南馆街的浙江、江苏馆子，为了做好麻婆豆腐，曾用重金聘请陈麻婆豆腐店当家厨师陈三师去，当了三天提调，传授蒜苗炒活的技巧，还登了报纸。在饮食业中为川菜赢来了声誉。&#60;/p&#62;');
INSERT INTO `foods` VALUES ('8', '蛋炒饭', '9', '1', '2017-09-07 13:56:50', '份', '1', null, '0', '', '2017-09-07 13:56:50', '6', '/upload/foods/11096ab43317.jpg', '/upload/foods/6f1f39f3dd60.jpg', '', '', '', '', '', '', '&#60;p&#62;&#60;a href=&apos;https://baike.so.com/doc/506103-535872.html&apos; target=&apos;_blank&apos;&#62;蛋炒饭&#60;/a&#62;最早的记载见于1972年湖南长沙&#60;a href=&apos;https://baike.so.com/doc/5332414-5567780.html&apos; target=&apos;_blank&apos;&#62;马王堆汉墓&#60;/a&#62;出土的竹简上有关&apos;卵火高&apos;的资料。经&#60;a href=&apos;https://baike.so.com/doc/1432753-1514467.html&apos; target=&apos;_blank&apos;&#62;专家&#60;/a&#62;考证，&apos;卵熇&apos;是一种用黏&#60;a href=&apos;https://baike.so.com/doc/5682310-5894987.html&apos; target=&apos;_blank&apos;&#62;米饭&#60;/a&#62;加鸡蛋制成的食品。有人&#60;a href=&apos;https://baike.so.com/doc/914740-966921.html&apos; target=&apos;_blank&apos;&#62;推断&#60;/a&#62;，这可能就是蛋炒饭的前身。&#60;/p&#62;&#60;p&#62;&#60;/p&#62;&#60;h2&#62;基本信息&#60;/h2&#62;&#60;ul&#62;&#60;li&#62;&#60;p&#62;中文名称&#60;/p&#62;&#60;p&#62;蛋炒饭&#60;/p&#62;&#60;br&#62;&#60;/li&#62;&#60;li&#62;&#60;p&#62;外文名称&#60;/p&#62;&#60;p&#62;Egg fried rice&#60;/p&#62;&#60;br&#62;&#60;/li&#62;&#60;li&#62;&#60;p&#62;雏形&#60;/p&#62;&#60;p&#62;卵火高&#60;/p&#62;&#60;br&#62;&#60;/li&#62;&#60;li&#62;&#60;p&#62;特点&#60;/p&#62;&#60;p&#62;松软，有嚼劲，样式多，淡香味&#60;/p&#62;&#60;br&#62;&#60;/li&#62;&#60;/ul&#62;&#60;p&#62;&apos;nbsp;&#60;/p&#62;&#60;ul&#62;&#60;li&#62;&#60;p&#62;主要食材&#60;/p&#62;&#60;p&#62;鸡蛋，米饭，盐，味精，油，葱&#60;/p&#62;&#60;br&#62;&#60;/li&#62;&#60;li&#62;&#60;p&#62;特殊做法&#60;/p&#62;&#60;p&#62;鸡蛋丝炒饭，火腿蛋炒饭等&#60;/p&#62;&#60;br&#62;&#60;/li&#62;&#60;li&#62;&#60;p&#62;种类&#60;/p&#62;&#60;p&#62;鸡蛋丝炒饭，火腿蛋炒饭&#60;/p&#62;&#60;br&#62;&#60;/li&#62;&#60;/ul&#62;');
INSERT INTO `foods` VALUES ('9', '菠萝炒饭', '12', '1', '2017-09-07 13:58:02', '份', '1', null, '0', '', '2017-09-07 13:58:02', '6', '/upload/foods/4b4209e90160.png', '/upload/foods/e468a7b34cd3.jpg', '', '', '', '', '', '', '&#60;p&#62;菠萝炒饭是将带皮菠萝纵切，用勺子将菠萝肉取出，切成小丁，与米饭、&#60;a href=&apos;https://baike.so.com/doc/7117571-7340679.html&apos; target=&apos;_blank&apos;&#62;火腿&#60;/a&#62;、鸡蛋、新鲜蔬菜等一起在油锅中翻炒，炒好的米饭用菠萝壳装即可食用。该饭具有酸甜可口，营养丰富的特点，特别适合儿童食用。&#60;/p&#62;&#60;p&#62;一、将新鲜菠萝切半，用小刀将其肉挖出，切成1CM大小的丁浸入盐水，保留1/2个菠萝壳做容器&#60;/p&#62;&#60;p&#62;二、青红椒、切1CM大小的丁&#60;/p&#62;&#60;p&#62;三、锅中热油，待六成热时，磕入鸡蛋，炒成鸡蛋碎，盛出备用;虾仁过开水汤熟&#60;/p&#62;&#60;p&#62;四、锅内留底油，待热后依次放入洋葱、青红椒翻炒片刻后，加入香米饭，炒匀&#60;/p&#62;&#60;p&#62;五、往锅中加入鸡蛋碎、菠萝丁、虾仁，放入盐、蚝油、&#60;a href=&apos;https://baike.so.com/doc/5685184-5897869.html&apos; target=&apos;_blank&apos;&#62;鸡精&#60;/a&#62;调味&#60;/p&#62;&#60;p&#62;六、将炒好的菠萝饭盛入菠萝碗中，撒上熟腰果仁即可&#60;/p&#62;&#60;p&#62;&#60;/p&#62;&#60;h2&#62;基本信息&#60;/h2&#62;&#60;ul&#62;&#60;li&#62;&#60;p&#62;中文名称&#60;/p&#62;&#60;p&#62;菠萝炒饭&#60;/p&#62;&#60;br&#62;&#60;/li&#62;&#60;li&#62;&#60;p&#62;主要食材&#60;/p&#62;&#60;p&#62;菠萝，大米，&#60;/p&#62;&#60;br&#62;&#60;/li&#62;&#60;li&#62;&#60;p&#62;口味&#60;/p&#62;&#60;p&#62;甜&#60;/p&#62;&#60;br&#62;&#60;/li&#62;&#60;/ul&#62;&#60;p&#62;&apos;nbsp;&#60;/p&#62;&#60;ul&#62;&#60;li&#62;&#60;p&#62;调味料&#60;/p&#62;&#60;p&#62;蚝油，油、盐、鸡精&#60;/p&#62;&#60;br&#62;&#60;/li&#62;&#60;li&#62;&#60;p&#62;特点&#60;/p&#62;&#60;p&#62;营养丰富&#60;/p&#62;&#60;br&#62;&#60;/li&#62;&#60;li&#62;&#60;p&#62;适合人群&#60;/p&#62;&#60;p&#62;儿童&#60;/p&#62;&#60;br&#62;&#60;/li&#62;&#60;/ul&#62;&#60;table&#62;&#60;colgroup&#62;&#60;col width=&apos;NaN%&apos;&#62;&#60;col width=&apos;NaN%&apos;&#62;&#60;col width=&apos;NaN%&apos;&#62;&#60;col width=&apos;NaN%&apos;&#62;&#60;/colgroup&#62;&#60;tbody&#62;&#60;tr&#62;&#60;td&#62;目录&#60;/td&#62;&#60;td&#62;1&#60;a href=&apos;https://baike.so.com/doc/5900639-6113538.html#5900639-6113538-1&apos;&#62;菜品特色&#60;/a&#62;&#60;br&#62;&#60;/td&#62;&#60;td&#62;2&#60;a href=&apos;https://baike.so.com/doc/5900639-6113538.html#5900639-6113538-2&apos;&#62;做法&#60;/a&#62;&#60;br&#62;&#60;/td&#62;&#60;td&#62;3&#60;a href=&apos;https://baike.so.com/doc/5900639-6113538.html#5900639-6113538-3&apos;&#62;营养价值&#60;/a&#62;&#60;br&#62;&#60;/td&#62;&#60;/tr&#62;&#60;/tbody&#62;&#60;/table&#62;&#60;p&#62;菠萝炒饭是将带皮菠萝纵切，用勺子将菠萝肉取出，切成小丁，与米饭、&#60;a href=&apos;https://baike.so.com/doc/7117571-7340679.html&apos; target=&apos;_blank&apos;&#62;火腿&#60;/a&#62;、鸡蛋、新鲜蔬菜等一起在油锅中翻炒，炒好的米饭用菠萝壳装即可食用。该饭具有酸甜可口，营养丰富的特点，特别适合儿童食用。&#60;/p&#62;&#60;p&#62;一、将新鲜菠萝切半，用小刀将其肉挖出，切成1CM大小的丁浸入盐水，保留1/2个菠萝壳做容器&#60;/p&#62;&#60;p&#62;二、青红椒、切1CM大小的丁&#60;/p&#62;&#60;p&#62;三、锅中热油，待六成热时，磕入鸡蛋，炒成鸡蛋碎，盛出备用;虾仁过开水汤熟&#60;/p&#62;&#60;p&#62;四、锅内留底油，待热后依次放入洋葱、青红椒翻炒片刻后，加入香米饭，炒匀&#60;/p&#62;&#60;p&#62;五、往锅中加入鸡蛋碎、菠萝丁、虾仁，放入盐、蚝油、&#60;a href=&apos;https://baike.so.com/doc/5685184-5897869.html&apos; target=&apos;_blank&apos;&#62;鸡精&#60;/a&#62;调味&#60;/p&#62;&#60;p&#62;六、将炒好的菠萝饭盛入&#60;a href=&apos;https://baike.so.com/doc/5349993-5585449.html&apos; target=&apos;_blank&apos;&#62;菠萝&#60;/a&#62;碗中，撒上熟腰果仁即可&#60;/p&#62;&#60;h2&#62;&#60;a href=&apos;https://baike.so.com/create/edit/?eid=5900639&apos;amp;sid=6113538&apos;amp;secid=1&apos;&#62;&apos;nbsp;&#60;/a&#62;&#60;/h2&#62;');
INSERT INTO `foods` VALUES ('10', '加多宝', '6', '1', '2017-09-07 13:58:49', '瓶', '1', null, '0', '', '2017-09-07 13:58:49', '4', '/upload/foods/d1e40960e514.jpg', '', '', '', '', '', '', '', '');
INSERT INTO `foods` VALUES ('11', '绿茶', '3', '1', '2017-09-07 13:59:12', '瓶', '1', null, '0', '', '2017-09-07 13:59:12', '4', '/upload/foods/8a1963585436.jpg', '', '', '', '', '', '', '', '');
INSERT INTO `foods` VALUES ('12', '果粒橙', '3', '1', '2017-09-07 13:59:35', '瓶', '1', null, '0', '', '2017-09-07 13:59:35', '4', '/upload/foods/886d1efa964a.jpg', '', '', '', '', '', '', '', '');
INSERT INTO `foods` VALUES ('13', '汽水', '2', '1', '2017-09-07 14:00:11', '瓶', '1', null, '0', '', '2017-09-07 14:00:11', '4', '/upload/foods/697f2c9ea507.jpg', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for `menuItems`
-- ----------------------------
DROP TABLE IF EXISTS `menuItems`;
CREATE TABLE `menuItems` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `cts` varchar(255) DEFAULT NULL,
  `msort` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menuItems
-- ----------------------------
INSERT INTO `menuItems` VALUES ('1', '米饭', '/upload/menuItems/357b58e025e9.png', '1', '2017-09-07 13:28:32', '1');
INSERT INTO `menuItems` VALUES ('2', '套餐', '/upload/menuItems/1aada3c89eef.png', '1', '2017-09-07 13:28:48', '9');
INSERT INTO `menuItems` VALUES ('3', '小炒', '/upload/menuItems/6c53f1b2ee65.png', '1', '2017-09-07 13:28:57', '8');
INSERT INTO `menuItems` VALUES ('4', '果汁', '/upload/menuItems/3312ad9c49cd.png', '1', '2017-09-07 13:29:09', '0');
INSERT INTO `menuItems` VALUES ('5', '炒面', '/upload/menuItems/29dcbdb620b0.png', '1', '2017-09-07 13:29:18', '7');
INSERT INTO `menuItems` VALUES ('6', '炒饭', '/upload/menuItems/f43fb967b54c.png', '1', '2017-09-07 13:29:29', '6');

-- ----------------------------
-- Table structure for `unit`
-- ----------------------------
DROP TABLE IF EXISTS `unit`;
CREATE TABLE `unit` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `unit` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `cts` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unit
-- ----------------------------
INSERT INTO `unit` VALUES ('1', '份', '1', '2017-09-07 13:16:27');
INSERT INTO `unit` VALUES ('2', '瓶', '1', '2017-09-07 13:16:35');
INSERT INTO `unit` VALUES ('3', '个', '1', '2017-09-07 13:16:42');
INSERT INTO `unit` VALUES ('4', '盒', '1', '2017-09-07 13:27:54');
INSERT INTO `unit` VALUES ('5', '杯', '1', '2017-09-07 13:28:05');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `cts` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `userfrom` tinyint(4) NOT NULL DEFAULT '1',
  `pwd` varchar(255) DEFAULT NULL,
  `imgface` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '152**********', '15211111111', '2017-09-07 13:18:26', '1', '0', '152111', '/upload/face.png');
INSERT INTO `users` VALUES ('2', '152*****3333', '15266663333', '2017-09-07 13:18:45', '1', '0', '152666', '/upload/face.png');
