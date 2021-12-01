/*
 Navicat Premium Data Transfer

 Source Server         : 1234
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : db_cafeteria

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 01/12/2021 22:27:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `realName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `idCard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `status` int(11) NULL DEFAULT 0 COMMENT '其他',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (3, 'zhaoyun', '12345', '赵云', '230102197112031913', '13341142222', '上海市', 0);
INSERT INTO `account` VALUES (5, 'guanyu', 'zxcv', '关羽', '230105196807080716', '13341142222', '北京市东城区', 0);
INSERT INTO `account` VALUES (6, 'a', '123', '张飞', '123123125678909876', '13342135432', '上海市', 0);
INSERT INTO `account` VALUES (7, 'abcde', '1asdf', '孙艳', NULL, '13343218765', '北京市西城区', 0);
INSERT INTO `account` VALUES (8, 'asdfg', 'asdgfasd', '王美玲', NULL, '13141151234', '北京市西城区', 0);
INSERT INTO `account` VALUES (9, '123', 'rtyer', '赵小', '123123123123123123', '12312312312', '河北市廊坊', 0);
INSERT INTO `account` VALUES (10, 'zhangsan', 'ghgjvbn', '张三', '652834198201119243', '15554326543', '天津市', 1);
INSERT INTO `account` VALUES (11, 'azz', 'gh51548', '爱莲说', NULL, '14545452345', '北京市', 0);
INSERT INTO `account` VALUES (12, 'zxc', 'rdture21', '沈光临', '541215198501112113', '16531062038', '广州市', 1);
INSERT INTO `account` VALUES (13, 'acxvv', 'rugbbncvb', '赵信', NULL, '13274291193', '北京市西城区', 0);
INSERT INTO `account` VALUES (14, 'fgdjhtr', 'yikugyfjm', '王连上', '142625198210230031', '16979323897', NULL, 0);
INSERT INTO `account` VALUES (16, 'ertyu', 'dfsghfgdhj', '王者日', NULL, '15569258489', '北京市西城区', 0);
INSERT INTO `account` VALUES (17, 'ertyhvcb', 'cvbmu', '赵信玩', '411081198202022059', '13952792057', '北京市东城区', 0);
INSERT INTO `account` VALUES (18, 'etryuvbcn', 'c,mkumb', '刘孝心', NULL, '13542726649', '北京市', 0);
INSERT INTO `account` VALUES (19, 'retuvm', 'fghkuk,vb', '梅管', NULL, '17247759353', NULL, 0);
INSERT INTO `account` VALUES (20, 'eruvbm', 'jtyufkluy', '益怀莲', '44148119940422091X', '15837693945', '北京市', 0);
INSERT INTO `account` VALUES (21, 'ytivbjncv', 'loiull,bnm', '漆熹', NULL, '13221227513', '北京市西城区', 0);
INSERT INTO `account` VALUES (22, 'snthtjy', 'olhyyy', '酒倩丽', NULL, '18811162105', '河北市', 0);
INSERT INTO `account` VALUES (23, 'jhgdxc', 'iulmn,b', '皇绮琴', '331023198810205314', '17516194809', NULL, 0);
INSERT INTO `account` VALUES (24, 'rtu456u', 'jki;lo;tr', '沐晶', NULL, '16106129401', '北京市', 0);
INSERT INTO `account` VALUES (25, 'bcvmcm', 'ggreyfh', '可浩广', NULL, '13489662969', '北京市', 1);
INSERT INTO `account` VALUES (26, 'zvvccs', 'yeujtydj', '潮听莲', '420621199407070048', '16079597561', '北京市西城区', 0);
INSERT INTO `account` VALUES (27, 'zbvdhh', 'dghjuykj', '郝忆彤', NULL, '17784630265', '河北市', 0);
INSERT INTO `account` VALUES (28, 'sjtjtjv', 'gik;lmhn', '东方甘雨', NULL, '16374564857', '北京市东城区', 0);
INSERT INTO `account` VALUES (29, 'kukertye', 'kiuty', '孛金玉', '230804198401200010', '13758098425', NULL, 0);
INSERT INTO `account` VALUES (30, 'yhuinj', 'kikgfjk', '席和宜', NULL, '12348033017', NULL, 0);
INSERT INTO `account` VALUES (31, '1234fasd', 'gikui;lnb,', '后惜文', '360721199901010015', '18053065721', NULL, 0);
INSERT INTO `account` VALUES (32, '235gxhgdsgh', 'ghjkli678', '严语晨', NULL, '17643000313', '北京市西城区', 0);
INSERT INTO `account` VALUES (33, 'sjbvcnx', '96kgh', '端木霓', NULL, '14026533881', '河北市', 0);
INSERT INTO `account` VALUES (34, 'sfdhtyjy', 'puyito78956', '文赫', '132129197711040035', '17616468473', '北京市', 0);
INSERT INTO `account` VALUES (35, 'vbmntyhmk', 'gohjlg6', '阚子明', NULL, '18321501177', NULL, 0);
INSERT INTO `account` VALUES (36, 'tyujbvmjc', 'ghjpoyu7', '禹项禹', NULL, '17911435769', '北京市', 0);
INSERT INTO `account` VALUES (37, 'ytdjx', 'loiuyljmb6', '老筠竹', NULL, '19811162167', NULL, 0);
INSERT INTO `account` VALUES (38, 'rtnfxg', 'bjhl78', '孔庄雅', NULL, '17516194871', '北京市', 0);
INSERT INTO `account` VALUES (39, 'trnjyky', 'ol;oiuh6', '束秀妮', NULL, '17106129463', '北京市东城区', 1);
INSERT INTO `account` VALUES (40, 'hhf', '\'\'\'121211', '佘伟毅', '332624198602135411', '13489663031', NULL, 0);
INSERT INTO `account` VALUES (41, 'rjh', '67965rjhgk', '寇浩淼', NULL, '16079597623', '北京市', 0);
INSERT INTO `account` VALUES (42, 'tyuu', 'tyuoty7568', '薛以冬', NULL, '17784630327', '北京市', 0);
INSERT INTO `account` VALUES (43, 'hghg', '987654ghjk', '仉蕴', '450202198609220075', '16374564919', '北京市东城区', 0);
INSERT INTO `account` VALUES (44, 'gdgg', '769490', '施嫣', '340824197512270616', '13758098487', '北京市西城区', 0);
INSERT INTO `account` VALUES (45, 'oonjnc', 'fghj69679', '表晓星', '370481197708145615', '17348033079', '河北市', 0);
INSERT INTO `account` VALUES (46, 'dsgew', 'f;oiu56', '上官童彤', '412823198109182817', '18053065783', NULL, 0);
INSERT INTO `account` VALUES (47, 'hghtw', '76899756jhgk', '翠湛霞', NULL, '16643000375', '北京市', 0);
INSERT INTO `account` VALUES (48, 'cvnym', '7569hgjke', '香思菱', '440921198706294514', '14026533943', '北京市东城区', 0);
INSERT INTO `account` VALUES (49, 'uewes', 'rtugk6', '甘梦之', '350583199508151870', '18616468535', '北京市东城区', 0);
INSERT INTO `account` VALUES (50, 'hgryyuy', '56834ghjj', '集玲琅', '520112197011152830', '18321501239', '北京市东城区', 0);
INSERT INTO `account` VALUES (51, 'dsddfgs', '4568vbbd', '才海凡', '520112197305262816', '16911435831', '河北市', 0);
INSERT INTO `account` VALUES (52, 'sdhrhr', '747456', '首气', NULL, '10134219831', NULL, 0);
INSERT INTO `account` VALUES (53, 'rurustr', '83chcxtr', '萧智渊', '142630196910021515', '18724154423', '北京市', 1);
INSERT INTO `account` VALUES (54, 'sbxcxd', '37345fghj', '蚁盼盼', '371422196603104039', '14429187127', NULL, 0);
INSERT INTO `account` VALUES (55, 'ddbsscv', '45745723fc', '禚忆安', NULL, '13019121719', NULL, 0);
INSERT INTO `account` VALUES (56, 'sdhrew', '437623cvb', '乌孙映波', NULL, '10402655287', '北京市西城区', 0);
INSERT INTO `account` VALUES (57, 'weysxcv', 'mcbghfj534', '仪若兰', '370302197611200015', '18992589879', '河北市', 0);
INSERT INTO `account` VALUES (58, 'dshrewhw', 'fsgj35476', '夙虹雨', NULL, '14697622583', NULL, 0);
INSERT INTO `account` VALUES (59, 'xhrte', '.414415648', '系锟', '520123199312230052', '13287557175', NULL, 0);
INSERT INTO `account` VALUES (60, 'sdhreww', '658653hbbvcjkdkl', '荀玲琳', '522730198712101755', '10671090743', '北京市', 1);
INSERT INTO `account` VALUES (61, 'tjerty', '67847.117547.', '乜琳晨', NULL, '19261025335', '北京市', 0);
INSERT INTO `account` VALUES (62, 'djtjtg', 'ew6ty34jfgc', '那拉珺', '440881198209171477', '14966058039', NULL, 0);
INSERT INTO `account` VALUES (63, 'utrbcv', '3547cvbjdfgh', '暨文曜', NULL, '13555992631', '河北市', 0);
INSERT INTO `account` VALUES (64, 'yjykuy', '54743hbdfj', '危承福', '440881198209171477', '10939526199', NULL, 0);
INSERT INTO `account` VALUES (65, 'ntyiu', '3446fgjsdt', '完秀媛', '120102196202021452', '19529460791', '北京市东城区', 0);
INSERT INTO `account` VALUES (66, 'tryjyjtrd', 'ngcj564vbjh', '卷宏深', NULL, '15234493495', '北京市', 0);
INSERT INTO `account` VALUES (67, 'erstg', '457cvhdk', '晋悌', '460029195109012613', '13824428087', '北京市', 1);
INSERT INTO `account` VALUES (68, 'gsedrt', '457fbgjrty', '北盼晴', NULL, '14207961655', NULL, 0);
INSERT INTO `account` VALUES (69, 'bsterd', 'ityufugf54', '齐华荣', NULL, '19797896247', '北京市', 0);
INSERT INTO `account` VALUES (70, 'rdtybn', 'rtuikgfh5', '舜倩秀', '321183198311154815', '15502928951', '北京市', 0);
INSERT INTO `account` VALUES (71, 'btr', 'ghfkj2220.', '资如冰', NULL, '14092863543', NULL, 0);
INSERT INTO `account` VALUES (72, 'utjky', 'rtu4537vbh', '欧阳寻巧', '142726197009280616', '11476397111', NULL, 0);
INSERT INTO `account` VALUES (73, 'ragew', 'tri456', '夔千凡', '142623196806080853', '18866331703', NULL, 0);
INSERT INTO `account` VALUES (74, 'jtyhd', 'm,thk58435737', '禄依薇', '412728198904064306', '15771364407', '北京市东城区', 0);
INSERT INTO `account` VALUES (75, '144141414', '123123', 'asd', NULL, '12312312312', NULL, 0);
INSERT INTO `account` VALUES (76, 'aaaaaaaaa', 'aaaaaa', 'aa', NULL, '13333333333', NULL, 0);

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `roleId` int(11) NOT NULL COMMENT '角色id',
  `menuId` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  INDEX `menuId`(`menuId`) USING BTREE,
  CONSTRAINT `authority_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `authority_ibfk_2` FOREIGN KEY (`menuId`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 651 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES (569, 1, 1);
INSERT INTO `authority` VALUES (570, 1, 5);
INSERT INTO `authority` VALUES (571, 1, 17);
INSERT INTO `authority` VALUES (572, 1, 18);
INSERT INTO `authority` VALUES (573, 1, 19);
INSERT INTO `authority` VALUES (574, 1, 20);
INSERT INTO `authority` VALUES (575, 1, 13);
INSERT INTO `authority` VALUES (576, 1, 21);
INSERT INTO `authority` VALUES (577, 1, 22);
INSERT INTO `authority` VALUES (578, 1, 23);
INSERT INTO `authority` VALUES (579, 1, 35);
INSERT INTO `authority` VALUES (580, 1, 36);
INSERT INTO `authority` VALUES (581, 1, 14);
INSERT INTO `authority` VALUES (582, 1, 15);
INSERT INTO `authority` VALUES (583, 1, 24);
INSERT INTO `authority` VALUES (584, 1, 25);
INSERT INTO `authority` VALUES (585, 1, 26);
INSERT INTO `authority` VALUES (586, 1, 31);
INSERT INTO `authority` VALUES (587, 1, 32);
INSERT INTO `authority` VALUES (588, 1, 33);
INSERT INTO `authority` VALUES (589, 1, 34);
INSERT INTO `authority` VALUES (590, 1, 37);
INSERT INTO `authority` VALUES (591, 1, 39);
INSERT INTO `authority` VALUES (592, 1, 40);
INSERT INTO `authority` VALUES (593, 1, 41);
INSERT INTO `authority` VALUES (594, 1, 42);
INSERT INTO `authority` VALUES (595, 1, 43);
INSERT INTO `authority` VALUES (596, 1, 44);
INSERT INTO `authority` VALUES (597, 1, 45);
INSERT INTO `authority` VALUES (598, 1, 46);
INSERT INTO `authority` VALUES (599, 1, 47);
INSERT INTO `authority` VALUES (600, 1, 48);
INSERT INTO `authority` VALUES (601, 1, 49);
INSERT INTO `authority` VALUES (602, 1, 50);
INSERT INTO `authority` VALUES (603, 1, 51);
INSERT INTO `authority` VALUES (604, 1, 52);
INSERT INTO `authority` VALUES (605, 1, 53);
INSERT INTO `authority` VALUES (606, 1, 54);
INSERT INTO `authority` VALUES (607, 1, 55);
INSERT INTO `authority` VALUES (608, 1, 56);
INSERT INTO `authority` VALUES (609, 1, 57);
INSERT INTO `authority` VALUES (610, 1, 58);
INSERT INTO `authority` VALUES (611, 1, 59);
INSERT INTO `authority` VALUES (612, 1, 60);
INSERT INTO `authority` VALUES (613, 1, 61);
INSERT INTO `authority` VALUES (614, 1, 76);
INSERT INTO `authority` VALUES (615, 1, 62);
INSERT INTO `authority` VALUES (616, 1, 63);
INSERT INTO `authority` VALUES (617, 1, 64);
INSERT INTO `authority` VALUES (618, 1, 65);
INSERT INTO `authority` VALUES (619, 1, 66);
INSERT INTO `authority` VALUES (620, 1, 67);
INSERT INTO `authority` VALUES (621, 1, 68);
INSERT INTO `authority` VALUES (622, 1, 69);
INSERT INTO `authority` VALUES (623, 1, 70);
INSERT INTO `authority` VALUES (624, 2, 35);
INSERT INTO `authority` VALUES (625, 2, 36);
INSERT INTO `authority` VALUES (626, 2, 48);
INSERT INTO `authority` VALUES (627, 2, 49);
INSERT INTO `authority` VALUES (628, 2, 50);
INSERT INTO `authority` VALUES (629, 2, 51);
INSERT INTO `authority` VALUES (630, 2, 52);
INSERT INTO `authority` VALUES (631, 2, 53);
INSERT INTO `authority` VALUES (632, 2, 54);
INSERT INTO `authority` VALUES (633, 2, 55);
INSERT INTO `authority` VALUES (634, 2, 56);
INSERT INTO `authority` VALUES (635, 2, 57);
INSERT INTO `authority` VALUES (636, 2, 58);
INSERT INTO `authority` VALUES (637, 2, 59);
INSERT INTO `authority` VALUES (638, 2, 60);
INSERT INTO `authority` VALUES (639, 2, 61);
INSERT INTO `authority` VALUES (640, 2, 76);
INSERT INTO `authority` VALUES (641, 2, 62);
INSERT INTO `authority` VALUES (642, 2, 63);
INSERT INTO `authority` VALUES (643, 2, 64);
INSERT INTO `authority` VALUES (644, 2, 65);
INSERT INTO `authority` VALUES (645, 2, 66);
INSERT INTO `authority` VALUES (646, 2, 67);
INSERT INTO `authority` VALUES (647, 2, 68);
INSERT INTO `authority` VALUES (648, 2, 69);
INSERT INTO `authority` VALUES (649, 2, 70);
INSERT INTO `authority` VALUES (650, 2, 1);

-- ----------------------------
-- Table structure for book_order
-- ----------------------------
DROP TABLE IF EXISTS `book_order`;
CREATE TABLE `book_order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `accountId` int(11) NULL DEFAULT NULL COMMENT '客户id',
  `tableTypeId` int(11) NOT NULL COMMENT '餐桌类型id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预定者姓名',
  `useNum` int(11) NULL DEFAULT 0 COMMENT '用餐人数',
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` int(11) NULL DEFAULT 0 COMMENT '状态、0预定中、1使用中、2已结算离店',
  `arriveDate` datetime(0) NULL DEFAULT NULL COMMENT '预定使用时间',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createTime` datetime(0) NOT NULL COMMENT '预定日期',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `accountId`(`accountId`) USING BTREE,
  INDEX `roomTypeId`(`tableTypeId`) USING BTREE,
  CONSTRAINT `book_order_ibfk_1` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `book_order_ibfk_2` FOREIGN KEY (`tableTypeId`) REFERENCES `table_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_order
-- ----------------------------
INSERT INTO `book_order` VALUES (36, NULL, 1, '111', 11, '123', 2, '2021-05-01 20:34:50', '', '2021-05-01 20:34:54');
INSERT INTO `book_order` VALUES (37, 10, 1, '张三', 4, '15554326543', 2, '2021-05-01 21:11:09', '', '2021-05-01 21:11:13');
INSERT INTO `book_order` VALUES (40, NULL, 1, '111', 4, '14467567777', 3, '2021-05-25 21:13:27', '', '2021-05-05 21:13:34');
INSERT INTO `book_order` VALUES (41, 5, 1, '关羽', 4, '13341142222', 3, '2021-05-05 21:15:42', '', '2021-05-05 21:15:46');
INSERT INTO `book_order` VALUES (42, 12, 1, '沈光临', 4, '16531062038', 2, '2021-05-09 19:38:04', '', '2021-05-09 19:38:07');
INSERT INTO `book_order` VALUES (43, 6, 1, 'a', 0, '13342135432', 2, '2021-05-01 00:00:00', '', '2021-05-12 14:13:33');
INSERT INTO `book_order` VALUES (44, 6, 1, 'a', 0, '13342135432', 2, '2021-05-12 00:00:00', '', '2021-05-12 15:09:00');
INSERT INTO `book_order` VALUES (45, 3, 1, '赵云', 4, '13341142222', 2, '2021-05-12 15:22:35', '', '2021-05-12 15:22:39');
INSERT INTO `book_order` VALUES (46, 3, 1, '赵云', 4, '13341142222', 2, '2021-05-12 15:41:14', '', '2021-05-12 15:41:17');
INSERT INTO `book_order` VALUES (47, 6, 1, '张飞', 4, '13342135432', 1, '2021-05-12 15:51:03', '', '2021-05-12 15:51:07');
INSERT INTO `book_order` VALUES (48, NULL, 1, '赵先生', 4, '15565524589', 2, '2021-05-12 15:51:38', '', '2021-05-12 15:51:42');
INSERT INTO `book_order` VALUES (85, NULL, 1, '刘', 4, '15241256321', 1, '2021-05-12 18:24:44', '', '2021-05-12 18:24:48');
INSERT INTO `book_order` VALUES (86, NULL, 1, '测试测试测试', 4, '13354447689', 3, '2021-05-15 18:49:25', '测试测试测试测试测试', '2021-05-15 18:49:30');
INSERT INTO `book_order` VALUES (87, NULL, 5, '测试测试测试测试', 4, '13354447689', 3, '2021-05-15 18:57:18', '测试测试测试', '2021-05-15 18:57:24');
INSERT INTO `book_order` VALUES (88, NULL, 1, '张', 4, '17851115214', 3, '2021-07-14 17:38:09', '', '2021-05-18 14:38:21');
INSERT INTO `book_order` VALUES (89, 14, 1, '王连上', 4, '16979323897', 3, '2021-05-18 17:43:06', '', '2021-05-18 14:43:13');
INSERT INTO `book_order` VALUES (90, NULL, 1, '李2', 4, '13354447689', 3, '2021-05-18 15:31:26', '', '2021-05-18 15:31:30');
INSERT INTO `book_order` VALUES (91, NULL, 1, '多对多', 4, '13354447689', 3, '2021-05-18 15:33:01', '', '2021-05-18 15:33:03');
INSERT INTO `book_order` VALUES (92, 6, 1, 'a', 0, '13342135432', 3, '2021-05-19 16:34:21', '', '2021-05-19 22:03:34');
INSERT INTO `book_order` VALUES (93, 6, 1, 'a', 0, '13342135432', 0, '2021-08-19 00:00:00', '', '2021-08-18 15:03:00');

-- ----------------------------
-- Table structure for checkin
-- ----------------------------
DROP TABLE IF EXISTS `checkin`;
CREATE TABLE `checkin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `tableId` int(11) NOT NULL COMMENT '餐桌id',
  `tableTypeId` int(11) NOT NULL COMMENT '类型id',
  `useNum` int(11) NULL DEFAULT NULL COMMENT '使用人数',
  `checkinPrice` float(8, 2) NOT NULL COMMENT '用餐价格',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `mobile` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `status` int(1) NULL DEFAULT 0 COMMENT '状态：0：使用中，1：已结算离店',
  `arriveDate` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开始时间',
  `leaveDate` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '离店时间',
  `bookOrderId` int(11) NULL DEFAULT NULL COMMENT '预定订单id',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `createTime` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `accountId`(`tableId`) USING BTREE,
  INDEX `tableTypeId`(`tableTypeId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checkin
-- ----------------------------
INSERT INTO `checkin` VALUES (26, 1, 1, 0, 300.00, '赵云', '13341142222', 1, '2021-04-28 20:00:00', '2021-04-28 20:16:34', 26, '', '2021-04-28 20:16:38');
INSERT INTO `checkin` VALUES (27, 21, 1, 3, 150.00, '张飞', '13342135432', 1, '2021-04-29 15:52:11', '2021-04-29 16:00:37', 27, '', '2021-04-29 16:00:39');
INSERT INTO `checkin` VALUES (28, 5, 1, 4, 100.00, 'asdfg', '13141151234', 1, '2021-04-30', '2021-04-30 20:07:38', 28, '', '2021-04-30 20:07:44');
INSERT INTO `checkin` VALUES (29, 1, 1, 4, 160.00, '张三', '13355551234', 1, '2021-05-01 16:48:01', '2021-05-01 16:48:32', NULL, '', '2021-05-01 16:48:40');
INSERT INTO `checkin` VALUES (30, 10, 1, 4, 160.00, '哈哈', '13343218765', 1, '2021-05-01 18:47:11', '2021-05-01 20:50:32', 29, '', '2021-05-01 16:50:53');
INSERT INTO `checkin` VALUES (31, 10, 1, 4, 160.00, '哈哈', '13343218765', 1, '2021-05-01 18:47:11', '2021-05-01 20:50:32', 29, '', '2021-05-01 16:51:07');
INSERT INTO `checkin` VALUES (32, 2, 1, 4, 160.00, '哈哈', '13354444444', 1, '2021-05-01 19:43:38', '2021-05-01 20:50:32', NULL, '', '2021-05-01 19:44:25');
INSERT INTO `checkin` VALUES (33, 3, 1, 4, 160.00, '哈哈', '13351152222', 1, '2021-05-01 19:53:57', '2021-05-01 20:50:32', NULL, '', '2021-05-01 19:54:01');
INSERT INTO `checkin` VALUES (34, 4, 1, 4, 160.00, '哈哈33', '14423455432', 1, '2021-05-01 19:57:23', '2021-05-06 14:23:50.519', NULL, '', '2021-05-01 19:57:26');
INSERT INTO `checkin` VALUES (35, 6, 1, 4, 160.00, '222', '22222222222', 1, '2021-05-01 20:01:56', '2021-05-06 14:23:50.519', NULL, '', '2021-05-01 20:01:59');
INSERT INTO `checkin` VALUES (36, 7, 1, 4, 160.00, '222', '11111111111', 1, '2021-05-01 20:16:44', '2021-05-01 20:17:04.907', NULL, '', '2021-05-01 20:16:48');
INSERT INTO `checkin` VALUES (37, 8, 1, 4, 160.00, '哈哈', '13343218765', 1, '2021-05-01 18:47:11', '2021-05-06 14:23:50.519', 29, '', '2021-05-01 20:23:41');
INSERT INTO `checkin` VALUES (38, 4, 1, 4, 160.00, '张三', '15554326543', 1, '2021-05-01 21:11:09', '2021-05-06 14:23:50.519', 37, '', '2021-05-01 21:11:50');
INSERT INTO `checkin` VALUES (39, 48, 6, 11, 440.00, '111', '13351142413', 1, '2021-05-01 20:34:50', NULL, 36, '', '2021-05-02 16:05:19');
INSERT INTO `checkin` VALUES (40, 23, 1, 4, 160.00, 'z1', '15546645677', 1, '2021-05-06 14:23:32', '2021-05-06 14:23:50.519', NULL, '', '2021-05-06 14:23:37');
INSERT INTO `checkin` VALUES (41, 1, 1, 4, 160.00, '赵信', '15465411785', 1, '2021-05-09 19:23:39', '2021-05-09 19:36:38.495', NULL, '', '2021-05-09 19:24:51');
INSERT INTO `checkin` VALUES (42, 7, 1, 3, 120.00, '沈光临', '16531062038', 1, '2021-05-09 19:38:04', '2021-05-09 19:47:22.687', 42, '', '2021-05-09 19:38:33');
INSERT INTO `checkin` VALUES (43, 11, 2, 2, 80.00, '赵烨', '13341142222', 1, '2021-05-09 19:39:04', '2021-05-09 19:50:03.496', NULL, '', '2021-05-09 19:39:08');
INSERT INTO `checkin` VALUES (44, 9, 1, 4, 160.00, 'a', '13342135432', 1, '2021-05-12 14:16:00', '2021-05-12 15:23:03.629', 43, '', '2021-05-12 14:16:47');
INSERT INTO `checkin` VALUES (45, 12, 2, 2, 80.00, 'a', '13342135432', 1, '2021-05-12 15:09:00', '2021-05-12 15:22:58.904', 44, '', '2021-05-12 15:09:56');
INSERT INTO `checkin` VALUES (46, 11, 2, 2, 80.00, '赵云', '13341142222', 1, '2021-05-12 15:22:35', '2021-05-12 15:22:35', 45, '', '2021-05-12 15:24:49');
INSERT INTO `checkin` VALUES (47, 11, 2, 2, 80.00, '赵云', '13341142222', 1, '2021-05-12 15:22:35', '2021-05-12 15:22:35', 45, '', '2021-05-12 15:25:05');
INSERT INTO `checkin` VALUES (48, 11, 2, 2, 80.00, '赵云', '13341142222', 1, '2021-05-12 15:41:14', '2021-05-12 15:41:14', 46, '', '2021-05-12 15:41:47');
INSERT INTO `checkin` VALUES (49, 8, 1, 4, 160.00, '张飞', '13342135432', 1, '2021-05-12 15:51:03', '2021-05-12 15:51:03', 47, '', '2021-05-12 15:52:05');
INSERT INTO `checkin` VALUES (50, 12, 2, 2, 80.00, '赵先生', '15565524589', 1, '2021-05-12 15:51:38', '2021-05-12 19:03:14.35', 48, '', '2021-05-12 15:53:00');
INSERT INTO `checkin` VALUES (51, 18, 2, 2, 80.00, '刘', '15241256321', 1, '2021-05-12 18:24:44', '2021-05-12 18:24:44', 85, '', '2021-05-12 18:25:44');
INSERT INTO `checkin` VALUES (52, 1, 1, 4, 160.00, 'a', '00000', 1, '2021-05-12 18:26:15', '2021-05-12 18:26:15', NULL, '', '2021-05-12 18:26:20');
INSERT INTO `checkin` VALUES (53, 1, 1, 4, 160.00, 'a', '11111111111', 1, '2021-05-12 18:26:15', '2021-05-12 18:26:15', NULL, '', '2021-05-12 18:26:33');
INSERT INTO `checkin` VALUES (54, 13, 2, 2, 80.00, 'a', '000', 1, '2021-05-12 18:49:44', '2021-05-12 18:49:44', NULL, '', '2021-05-12 18:49:47');
INSERT INTO `checkin` VALUES (55, 13, 2, 2, 80.00, 'a', '000', 1, '2021-05-12 18:49:44', '2021-05-12 18:49:44', NULL, '', '2021-05-12 18:52:59');
INSERT INTO `checkin` VALUES (56, 1, 1, 4, 160.00, 'a', '000', 1, '2021-05-12 19:01:39', '2021-05-12 19:03:04.399', NULL, '', '2021-05-12 19:01:53');
INSERT INTO `checkin` VALUES (57, 2, 1, 4, 160.00, 'a', '000', 1, '2021-05-12 19:02:40', '2021-05-12 19:02:56.704', NULL, '', '2021-05-12 19:02:44');
INSERT INTO `checkin` VALUES (58, 11, 2, 2, 50.00, '测试测试测试测试测试', '13354447689', 1, '2021-05-15 18:56:02', '2021-05-15 18:56:53.451', NULL, '测试测试测试测试测试测试测试测试测试', '2021-05-15 18:56:09');

-- ----------------------------
-- Table structure for floor
-- ----------------------------
DROP TABLE IF EXISTS `floor`;
CREATE TABLE `floor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of floor
-- ----------------------------
INSERT INTO `floor` VALUES (1, '一楼', '正常使用');
INSERT INTO `floor` VALUES (2, '二楼', '正常使用');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志内容',
  `createTime` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 219 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, '????{admin}????{?????}???????!', '2021-04-16 14:20:52');
INSERT INTO `log` VALUES (2, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 14:28:33');
INSERT INTO `log` VALUES (3, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 14:51:04');
INSERT INTO `log` VALUES (4, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 15:01:50');
INSERT INTO `log` VALUES (5, '用户名为admin的用户登录时输入验证码错误!', '2021-04-16 21:01:31');
INSERT INTO `log` VALUES (6, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-16 21:01:38');
INSERT INTO `log` VALUES (7, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 12:27:53');
INSERT INTO `log` VALUES (8, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 12:29:00');
INSERT INTO `log` VALUES (9, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 12:39:00');
INSERT INTO `log` VALUES (10, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 12:44:53');
INSERT INTO `log` VALUES (11, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 12:47:00');
INSERT INTO `log` VALUES (12, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 12:48:39');
INSERT INTO `log` VALUES (13, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 18:49:31');
INSERT INTO `log` VALUES (14, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 18:54:01');
INSERT INTO `log` VALUES (15, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 18:56:44');
INSERT INTO `log` VALUES (16, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 19:01:32');
INSERT INTO `log` VALUES (17, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 19:35:42');
INSERT INTO `log` VALUES (18, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 19:40:57');
INSERT INTO `log` VALUES (19, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 19:42:01');
INSERT INTO `log` VALUES (20, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 20:28:26');
INSERT INTO `log` VALUES (21, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 20:36:56');
INSERT INTO `log` VALUES (22, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 20:39:54');
INSERT INTO `log` VALUES (23, '用户名为admin的用户登录时输入验证码错误!', '2021-04-19 20:58:39');
INSERT INTO `log` VALUES (24, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-19 20:58:48');
INSERT INTO `log` VALUES (25, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-22 18:02:05');
INSERT INTO `log` VALUES (26, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-22 18:31:58');
INSERT INTO `log` VALUES (27, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-22 19:08:41');
INSERT INTO `log` VALUES (28, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-22 19:10:10');
INSERT INTO `log` VALUES (29, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-22 19:36:45');
INSERT INTO `log` VALUES (30, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-22 19:42:34');
INSERT INTO `log` VALUES (31, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-22 19:43:53');
INSERT INTO `log` VALUES (32, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-22 20:15:25');
INSERT INTO `log` VALUES (33, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 14:55:10');
INSERT INTO `log` VALUES (34, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-24 14:55:27');
INSERT INTO `log` VALUES (35, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 11:33:56');
INSERT INTO `log` VALUES (36, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 14:36:38');
INSERT INTO `log` VALUES (37, '用户名为admin的用户登录时输入验证码错误!', '2021-04-25 14:46:49');
INSERT INTO `log` VALUES (38, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 14:46:56');
INSERT INTO `log` VALUES (39, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 14:51:17');
INSERT INTO `log` VALUES (40, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 14:52:37');
INSERT INTO `log` VALUES (41, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 14:59:52');
INSERT INTO `log` VALUES (42, '用户名为admin的用户登录时输入验证码错误!', '2021-04-25 15:01:46');
INSERT INTO `log` VALUES (43, '用户名为admin的用户登录时输入验证码错误!', '2021-04-25 15:01:51');
INSERT INTO `log` VALUES (44, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 15:01:58');
INSERT INTO `log` VALUES (45, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 15:03:11');
INSERT INTO `log` VALUES (46, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 15:10:24');
INSERT INTO `log` VALUES (47, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 15:13:46');
INSERT INTO `log` VALUES (48, '用户名为admin的用户登录时输入验证码错误!', '2021-04-25 15:17:12');
INSERT INTO `log` VALUES (49, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 15:17:18');
INSERT INTO `log` VALUES (50, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 15:22:09');
INSERT INTO `log` VALUES (51, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 15:31:59');
INSERT INTO `log` VALUES (52, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 15:43:37');
INSERT INTO `log` VALUES (53, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 15:46:35');
INSERT INTO `log` VALUES (54, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 15:51:28');
INSERT INTO `log` VALUES (55, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 15:55:25');
INSERT INTO `log` VALUES (56, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 16:03:26');
INSERT INTO `log` VALUES (57, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 16:06:37');
INSERT INTO `log` VALUES (58, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 16:20:13');
INSERT INTO `log` VALUES (59, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 16:20:25');
INSERT INTO `log` VALUES (60, '用户名为admin的用户登录时输入验证码错误!', '2021-04-25 16:21:49');
INSERT INTO `log` VALUES (61, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 16:21:54');
INSERT INTO `log` VALUES (62, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 17:08:00');
INSERT INTO `log` VALUES (63, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 18:14:44');
INSERT INTO `log` VALUES (64, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 18:37:22');
INSERT INTO `log` VALUES (65, '用户名为admin的用户登录时输入验证码错误!', '2021-04-25 18:49:35');
INSERT INTO `log` VALUES (66, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 18:49:42');
INSERT INTO `log` VALUES (67, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-25 18:54:38');
INSERT INTO `log` VALUES (68, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-26 15:38:23');
INSERT INTO `log` VALUES (69, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-26 20:24:09');
INSERT INTO `log` VALUES (70, '用户名为admin的用户登录时输入验证码错误!', '2021-04-27 12:28:07');
INSERT INTO `log` VALUES (71, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-27 12:28:12');
INSERT INTO `log` VALUES (72, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-27 14:58:19');
INSERT INTO `log` VALUES (73, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-27 15:02:16');
INSERT INTO `log` VALUES (74, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-27 15:07:06');
INSERT INTO `log` VALUES (75, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-27 19:51:35');
INSERT INTO `log` VALUES (76, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-27 19:57:21');
INSERT INTO `log` VALUES (77, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-27 19:57:29');
INSERT INTO `log` VALUES (78, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-27 19:58:34');
INSERT INTO `log` VALUES (79, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-27 20:34:27');
INSERT INTO `log` VALUES (80, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-27 20:45:53');
INSERT INTO `log` VALUES (81, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-27 20:53:04');
INSERT INTO `log` VALUES (82, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 13:31:26');
INSERT INTO `log` VALUES (83, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 13:32:49');
INSERT INTO `log` VALUES (84, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 16:36:25');
INSERT INTO `log` VALUES (85, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 16:41:12');
INSERT INTO `log` VALUES (86, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 17:04:58');
INSERT INTO `log` VALUES (87, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 17:10:37');
INSERT INTO `log` VALUES (88, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 17:15:07');
INSERT INTO `log` VALUES (89, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 19:07:14');
INSERT INTO `log` VALUES (90, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 19:16:44');
INSERT INTO `log` VALUES (91, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 19:51:07');
INSERT INTO `log` VALUES (92, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 19:55:52');
INSERT INTO `log` VALUES (93, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 20:12:20');
INSERT INTO `log` VALUES (94, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-28 20:16:22');
INSERT INTO `log` VALUES (95, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-29 15:51:50');
INSERT INTO `log` VALUES (96, '用户名为admin的用户登录时输入密码错误!', '2021-04-30 12:01:05');
INSERT INTO `log` VALUES (97, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-30 12:01:13');
INSERT INTO `log` VALUES (98, '用户名为admin的用户登录时输入验证码错误!', '2021-04-30 13:17:11');
INSERT INTO `log` VALUES (99, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-30 13:17:16');
INSERT INTO `log` VALUES (100, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-30 13:40:42');
INSERT INTO `log` VALUES (101, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-30 19:19:05');
INSERT INTO `log` VALUES (102, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-04-30 20:06:29');
INSERT INTO `log` VALUES (103, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-01 16:45:50');
INSERT INTO `log` VALUES (104, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-01 19:43:03');
INSERT INTO `log` VALUES (105, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-01 19:56:30');
INSERT INTO `log` VALUES (106, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-01 19:59:17');
INSERT INTO `log` VALUES (107, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-01 20:01:38');
INSERT INTO `log` VALUES (108, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-01 20:16:14');
INSERT INTO `log` VALUES (109, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-01 20:16:25');
INSERT INTO `log` VALUES (110, '用户名为admin的用户登录时输入验证码错误!', '2021-05-01 20:34:32');
INSERT INTO `log` VALUES (111, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-01 20:34:36');
INSERT INTO `log` VALUES (112, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-01 21:03:43');
INSERT INTO `log` VALUES (113, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-01 21:04:47');
INSERT INTO `log` VALUES (114, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-02 16:01:38');
INSERT INTO `log` VALUES (115, '用户名为{li}，角色为{普通员工}的用户登录成功!', '2021-05-02 16:03:49');
INSERT INTO `log` VALUES (116, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-02 16:04:26');
INSERT INTO `log` VALUES (117, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-02 16:15:47');
INSERT INTO `log` VALUES (118, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-02 16:15:57');
INSERT INTO `log` VALUES (119, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-02 16:17:46');
INSERT INTO `log` VALUES (120, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-02 16:21:23');
INSERT INTO `log` VALUES (121, '用户名为admin的用户登录时输入验证码错误!', '2021-05-04 20:01:07');
INSERT INTO `log` VALUES (122, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-04 20:01:13');
INSERT INTO `log` VALUES (123, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-05 15:06:26');
INSERT INTO `log` VALUES (124, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-05 15:51:08');
INSERT INTO `log` VALUES (125, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-05 15:55:44');
INSERT INTO `log` VALUES (126, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-05 16:03:20');
INSERT INTO `log` VALUES (127, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-05 16:18:09');
INSERT INTO `log` VALUES (128, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-05 19:47:21');
INSERT INTO `log` VALUES (129, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-05 21:13:03');
INSERT INTO `log` VALUES (130, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-05 21:15:24');
INSERT INTO `log` VALUES (131, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-06 14:14:30');
INSERT INTO `log` VALUES (132, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-06 14:23:03');
INSERT INTO `log` VALUES (133, '用户名为admin的用户登录时输入验证码错误!', '2021-05-06 15:36:08');
INSERT INTO `log` VALUES (134, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-06 15:36:11');
INSERT INTO `log` VALUES (135, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-07 11:02:04');
INSERT INTO `log` VALUES (136, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-09 19:12:36');
INSERT INTO `log` VALUES (137, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-09 19:36:25');
INSERT INTO `log` VALUES (138, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-09 19:49:48');
INSERT INTO `log` VALUES (139, '用户名为admin的用户登录时输入验证码错误!', '2021-05-12 14:11:37');
INSERT INTO `log` VALUES (140, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 14:11:44');
INSERT INTO `log` VALUES (141, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 15:09:21');
INSERT INTO `log` VALUES (142, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 15:22:17');
INSERT INTO `log` VALUES (143, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 15:39:24');
INSERT INTO `log` VALUES (144, '用户名为admin的用户登录时输入验证码错误!', '2021-05-12 15:40:49');
INSERT INTO `log` VALUES (145, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 15:40:54');
INSERT INTO `log` VALUES (146, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 15:47:35');
INSERT INTO `log` VALUES (147, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 16:01:51');
INSERT INTO `log` VALUES (148, '用户名为admin的用户登录时输入验证码错误!', '2021-05-12 16:03:24');
INSERT INTO `log` VALUES (149, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 16:03:31');
INSERT INTO `log` VALUES (150, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 16:06:37');
INSERT INTO `log` VALUES (151, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 16:09:34');
INSERT INTO `log` VALUES (152, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 16:16:20');
INSERT INTO `log` VALUES (153, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 16:22:30');
INSERT INTO `log` VALUES (154, '用户名为admin的用户登录时输入验证码错误!', '2021-05-12 16:44:32');
INSERT INTO `log` VALUES (155, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 16:44:37');
INSERT INTO `log` VALUES (156, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 16:51:09');
INSERT INTO `log` VALUES (157, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 16:56:33');
INSERT INTO `log` VALUES (158, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 17:00:11');
INSERT INTO `log` VALUES (159, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 17:08:45');
INSERT INTO `log` VALUES (160, '用户名为admin的用户登录时输入验证码错误!', '2021-05-12 18:22:57');
INSERT INTO `log` VALUES (161, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 18:23:08');
INSERT INTO `log` VALUES (162, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 18:49:12');
INSERT INTO `log` VALUES (163, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-12 19:01:18');
INSERT INTO `log` VALUES (164, '用户名为admin的用户登录时输入验证码错误!', '2021-05-13 19:35:51');
INSERT INTO `log` VALUES (165, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-13 19:35:56');
INSERT INTO `log` VALUES (166, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-14 14:16:13');
INSERT INTO `log` VALUES (167, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-14 14:25:37');
INSERT INTO `log` VALUES (168, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-14 14:45:25');
INSERT INTO `log` VALUES (169, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-14 15:05:14');
INSERT INTO `log` VALUES (170, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-14 15:09:51');
INSERT INTO `log` VALUES (171, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-14 15:10:32');
INSERT INTO `log` VALUES (172, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-14 15:23:24');
INSERT INTO `log` VALUES (173, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-14 15:27:02');
INSERT INTO `log` VALUES (174, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-14 15:55:16');
INSERT INTO `log` VALUES (175, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-15 17:22:43');
INSERT INTO `log` VALUES (176, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-15 17:26:56');
INSERT INTO `log` VALUES (177, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-15 18:29:05');
INSERT INTO `log` VALUES (178, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-15 18:31:44');
INSERT INTO `log` VALUES (179, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-15 18:32:41');
INSERT INTO `log` VALUES (180, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-15 18:44:10');
INSERT INTO `log` VALUES (181, '用户名为{admin}，的用户成功修改密码!', '2021-05-15 18:45:23');
INSERT INTO `log` VALUES (182, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-15 18:51:19');
INSERT INTO `log` VALUES (183, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-15 18:55:38');
INSERT INTO `log` VALUES (184, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-15 19:03:43');
INSERT INTO `log` VALUES (185, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-15 19:04:23');
INSERT INTO `log` VALUES (186, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-15 22:50:10');
INSERT INTO `log` VALUES (187, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-16 13:37:06');
INSERT INTO `log` VALUES (188, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-16 20:25:54');
INSERT INTO `log` VALUES (189, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-16 20:33:28');
INSERT INTO `log` VALUES (190, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-18 14:37:14');
INSERT INTO `log` VALUES (191, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-18 15:30:53');
INSERT INTO `log` VALUES (192, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-18 15:32:38');
INSERT INTO `log` VALUES (193, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-18 15:55:11');
INSERT INTO `log` VALUES (194, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-19 22:02:33');
INSERT INTO `log` VALUES (195, '用户名为admin的用户登录时输入验证码错误!', '2021-05-19 22:56:12');
INSERT INTO `log` VALUES (196, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-19 22:56:19');
INSERT INTO `log` VALUES (197, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-20 13:05:07');
INSERT INTO `log` VALUES (198, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-20 16:32:04');
INSERT INTO `log` VALUES (199, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-20 16:40:38');
INSERT INTO `log` VALUES (200, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-22 15:57:12');
INSERT INTO `log` VALUES (201, '用户名为admin的用户登录时输入验证码错误!', '2021-05-25 16:13:46');
INSERT INTO `log` VALUES (202, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-05-25 16:13:55');
INSERT INTO `log` VALUES (203, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-06-12 22:13:34');
INSERT INTO `log` VALUES (204, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-06-18 12:58:21');
INSERT INTO `log` VALUES (205, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-06-18 14:36:28');
INSERT INTO `log` VALUES (206, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-08-18 14:57:59');
INSERT INTO `log` VALUES (207, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-08-18 15:06:05');
INSERT INTO `log` VALUES (208, '用户名为admin的用户登录时输入验证码错误!', '2021-08-31 14:39:21');
INSERT INTO `log` VALUES (209, '用户名为admin的用户登录时输入验证码错误!', '2021-08-31 14:40:36');
INSERT INTO `log` VALUES (210, '用户名为admin的用户登录时输入验证码错误!', '2021-08-31 14:40:44');
INSERT INTO `log` VALUES (211, '用户名为admin的用户登录时输入验证码错误!', '2021-08-31 14:44:25');
INSERT INTO `log` VALUES (212, '用户名为admin的用户登录时输入验证码错误!', '2021-08-31 14:46:19');
INSERT INTO `log` VALUES (213, '用户名为admin的用户登录时输入验证码错误!', '2021-08-31 14:46:30');
INSERT INTO `log` VALUES (214, '用户名为admin的用户登录时输入验证码错误!', '2021-08-31 14:46:42');
INSERT INTO `log` VALUES (215, '用户名为admin的用户登录时输入验证码错误!', '2021-08-31 14:47:55');
INSERT INTO `log` VALUES (216, '用户名为admin的用户登录时输入验证码错误!', '2021-08-31 14:48:06');
INSERT INTO `log` VALUES (217, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-08-31 14:48:56');
INSERT INTO `log` VALUES (218, '用户名为{admin}，角色为{超级管理员}的用户登录成功!', '2021-10-14 21:44:09');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `parentId` int(11) NOT NULL DEFAULT -1 COMMENT '父类id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单icon图表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (1, 0, '系统设置', '', 'icon-advancedsettings');
INSERT INTO `menu` VALUES (5, 1, '菜单管理', '../admin/menu/list', 'icon-chart-organisation');
INSERT INTO `menu` VALUES (13, 1, '角色管理', '../admin/role/list', 'icon-group-key');
INSERT INTO `menu` VALUES (14, 0, '员工管理', '', 'icon-group-gear');
INSERT INTO `menu` VALUES (15, 14, '员工列表', '../admin/user/list', 'icon-group');
INSERT INTO `menu` VALUES (17, 5, '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES (18, 5, '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES (19, 5, '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES (20, 5, '添加按钮', 'openAddMenu()', 'icon-add');
INSERT INTO `menu` VALUES (21, 13, '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES (22, 13, '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES (23, 13, '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES (24, 15, '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES (25, 15, '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES (26, 15, '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES (31, 0, '系统日志', '', 'icon-table-cell');
INSERT INTO `menu` VALUES (32, 31, '日志列表', '../admin/log/list', 'icon-page-white-text');
INSERT INTO `menu` VALUES (33, 32, '添加日志', 'openAdd()', 'icon-add1');
INSERT INTO `menu` VALUES (34, 32, '删除', 'remove()', 'icon-cancel');
INSERT INTO `menu` VALUES (35, 1, '修改密码', 'edit_password', 'icon-lock-edit');
INSERT INTO `menu` VALUES (36, 35, '修改密码', 'openAdd()', 'icon-lock-edit');
INSERT INTO `menu` VALUES (37, 0, '区域管理', '', 'icon-computer-start');
INSERT INTO `menu` VALUES (39, 37, '区域列表', '../admin/floor/list', 'icon-script');
INSERT INTO `menu` VALUES (40, 39, '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES (41, 39, '编辑', 'openEdit()', 'icon-paintbrush');
INSERT INTO `menu` VALUES (42, 39, '删除', 'remove()', 'icon-cross-octagon');
INSERT INTO `menu` VALUES (43, 0, '餐桌类型', '', 'icon-box');
INSERT INTO `menu` VALUES (44, 43, '餐桌类型列表', '../admin/table_type/list', 'icon-accept');
INSERT INTO `menu` VALUES (45, 44, '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES (46, 44, '编辑', 'openEdit()', 'icon-bullet-edit');
INSERT INTO `menu` VALUES (47, 44, '删除', 'remove()', 'icon-no');
INSERT INTO `menu` VALUES (48, 0, '餐桌管理', '', 'icon-calendar-select-none');
INSERT INTO `menu` VALUES (49, 48, '餐桌列表', '../admin/table/list', 'icon-application-view-columns');
INSERT INTO `menu` VALUES (50, 49, '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES (51, 49, '编辑', 'openEdit()', 'icon-laptop-edit');
INSERT INTO `menu` VALUES (52, 49, '删除', 'remove()', 'icon-cross');
INSERT INTO `menu` VALUES (53, 0, '会员管理', '', 'icon-finger-point');
INSERT INTO `menu` VALUES (54, 53, '会员列表', '../admin/account/list', 'icon-page');
INSERT INTO `menu` VALUES (55, 54, '添加', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES (56, 54, '编辑', 'openEdit()', 'icon-book-edit');
INSERT INTO `menu` VALUES (57, 54, '删除', 'remove()', 'icon-delete3');
INSERT INTO `menu` VALUES (58, 0, '预定管理', '', 'icon-book');
INSERT INTO `menu` VALUES (59, 58, '预定列表', '../admin/book_order/list', 'icon-calendar-select-none');
INSERT INTO `menu` VALUES (60, 59, '新增预定', 'openAdd()', 'icon-add');
INSERT INTO `menu` VALUES (61, 59, '编辑预定', 'openEdit()', 'icon-bookmark-edit');
INSERT INTO `menu` VALUES (62, 0, '订单管理', '', 'icon-script');
INSERT INTO `menu` VALUES (63, 62, '订单列表', '../admin/checkin/list', 'icon-heart');
INSERT INTO `menu` VALUES (64, 63, '登记开桌', 'openAdd()', 'icon-heart-add');
INSERT INTO `menu` VALUES (65, 63, '编辑开桌', 'openEdit()', 'icon-heart-connect');
INSERT INTO `menu` VALUES (66, 63, '登记结账', 'openCheckOut()', 'icon-heart-delete');
INSERT INTO `menu` VALUES (67, 0, '营业统计', '', 'icon-calculator');
INSERT INTO `menu` VALUES (68, 67, '统计图表', '../admin/stats/stats', 'icon-chart-curve');
INSERT INTO `menu` VALUES (69, 68, '按月统计', 'statsByMonth()', 'icon-chart-bar');
INSERT INTO `menu` VALUES (70, 68, '按日统计', 'statsByDay()', 'icon-chart-bar-edit');
INSERT INTO `menu` VALUES (76, 59, '过期预定', 'remove()', 'icon-cross');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '超级管理员拥有一切权限！');
INSERT INTO `role` VALUES (2, '普通员工', '普通员工');

-- ----------------------------
-- Table structure for table_s
-- ----------------------------
DROP TABLE IF EXISTS `table_s`;
CREATE TABLE `table_s`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sn` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '餐桌编号',
  `tableTypeId` int(11) NOT NULL COMMENT '餐桌类型id',
  `floorId` int(50) NOT NULL COMMENT '所属区域id',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '餐桌状态，0表示可使用，1表示已使用，2表示不可使用',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '餐桌备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tableTypeId`(`tableTypeId`) USING BTREE,
  INDEX `floorId`(`floorId`) USING BTREE,
  CONSTRAINT `table_s_ibfk_1` FOREIGN KEY (`tableTypeId`) REFERENCES `table_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `table_s_ibfk_2` FOREIGN KEY (`floorId`) REFERENCES `floor` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of table_s
-- ----------------------------
INSERT INTO `table_s` VALUES (1, '1001', 1, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (2, '1002', 1, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (3, '1003', 1, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (4, '1004', 1, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (5, '1005', 1, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (6, '1006', 1, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (7, '2007', 1, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (8, '2008', 1, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (9, '2009', 1, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (10, '2010', 1, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (11, '1011', 2, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (12, '1012', 2, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (13, '1013', 2, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (14, '1014', 2, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (15, '1015', 2, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (16, '1016', 2, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (17, '1017', 2, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (18, '2018', 2, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (19, '2019', 2, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (20, '2020', 2, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (21, '1021', 1, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (22, '1022', 1, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (23, '1023', 1, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (24, '1024', 1, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (25, '1025', 1, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (26, '2026', 1, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (28, '2027', 1, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (30, '2028', 1, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (31, '2029', 1, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (32, '2030', 1, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (33, '2031', 1, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (34, '2032', 1, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (35, '2033', 1, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (36, '2034', 1, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (37, '2035', 1, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (38, '1036', 5, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (39, '1037', 5, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (40, '1038', 5, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (41, '1039', 5, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (42, '1040', 5, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (43, '2041', 5, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (44, '2042', 5, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (45, '2043', 5, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (46, '2044', 5, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (47, '2045', 5, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (48, '2046', 6, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (49, '2047', 6, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (50, '2048', 6, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (51, '2049', 6, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (52, '2050', 6, 2, 0, '正常使用中');
INSERT INTO `table_s` VALUES (53, '1051', 7, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (54, '1052', 7, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (55, '1053', 7, 1, 0, '正常使用中');
INSERT INTO `table_s` VALUES (56, '2054', 7, 2, 0, '正常使用中');

-- ----------------------------
-- Table structure for table_type
-- ----------------------------
DROP TABLE IF EXISTS `table_type`;
CREATE TABLE `table_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '照片',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '餐桌类型',
  `useNum` int(11) NULL DEFAULT NULL COMMENT '用餐人数',
  `tableNum` int(11) NULL DEFAULT NULL COMMENT '餐桌数',
  `avilableNum` int(11) NULL DEFAULT NULL COMMENT '可用餐、预定数',
  `bookNum` int(11) NULL DEFAULT NULL COMMENT '预定数',
  `surNum` int(5) NULL DEFAULT 0 COMMENT '正在使用数',
  `status` int(2) NOT NULL COMMENT '0表示桌已满，1表示可预订可用餐',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `price` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of table_type
-- ----------------------------
INSERT INTO `table_type` VALUES (1, '四人类型桌', '/resources/upload/1620979073696.png', '四人类桌', 4, 25, 24, 2, 0, 1, '四个人可以使用', NULL);
INSERT INTO `table_type` VALUES (2, '双人类型桌', '/resources/upload/1620978957634.png', '双人桌', 2, 10, 10, 0, 0, 1, '两人及以下可以使用', NULL);
INSERT INTO `table_type` VALUES (5, '六人类型桌', '/resources/upload/1621168491760.png', '六人桌', 6, 10, 10, 0, 0, 1, '四-六人可以使用', NULL);
INSERT INTO `table_type` VALUES (6, '八人类型桌-十人类型桌', '/resources/upload/1620978991981.png', '多人桌', 10, 5, 5, 0, 0, 1, '六人以上可以使用', NULL);
INSERT INTO `table_type` VALUES (7, '三人类型桌', '/resources/upload/1620979004857.png', '三人桌', 3, 6, 6, 0, 0, 1, '三个人可以使用', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `roleId` int(11) NOT NULL COMMENT '所属角色id',
  `photo` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '头像照片地址',
  `sex` int(1) NOT NULL DEFAULT 0 COMMENT '性别0,代表未知，1代表男，2代表女',
  `age` int(3) NOT NULL DEFAULT 0 COMMENT '年龄',
  `address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '家庭住址',
  `idCard` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '身份证号',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '手机号',
  `realName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '真实姓名',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `roleId`(`roleId`) USING BTREE,
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', 1, '/resources/upload/1621070586170.png', 1, 40, '上海市浦东新区浦东南路1835号', '532128198103120536', '15467866453', '沈成海');
INSERT INTO `user` VALUES (13, 'li', '123456', 2, '/resources/upload/1620979015742.png', 1, 29, '天津市河西区', '370125199206162716', '18765762983', '杨怀旗');
INSERT INTO `user` VALUES (14, 'zhang', 'admin', 2, '/resources/upload/1620979036195.png', 1, 29, '石家庄市', '132127198202120135', '13932016588', '贺志辉');
INSERT INTO `user` VALUES (15, 'wangli', 'wangli123', 2, '/resources/upload/1620979043075.png', 2, 35, '河北省沧州市', '152142198605123221', '18842145555', '王丽');

SET FOREIGN_KEY_CHECKS = 1;
