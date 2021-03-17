/*
 Navicat MySQL Data Transfer

 Source Server         : 192.168.151.2-MYSQL
 Source Server Type    : MySQL
 Source Server Version : 50729
 Source Host           : localhost:3306
 Source Schema         : messageBoard

 Target Server Type    : MySQL
 Target Server Version : 50729
 File Encoding         : 65001

 Date: 17/03/2021 14:10:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_message
-- ----------------------------
DROP TABLE IF EXISTS `tbl_message`;
CREATE TABLE `tbl_message` (
  `id` char(32) NOT NULL COMMENT '32位UUID',
  `userId` varchar(255) DEFAULT NULL COMMENT '外键关联user表',
  `message` varchar(255) DEFAULT NULL COMMENT '留言信息',
  `createTime` char(19) DEFAULT NULL COMMENT '发表时间',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `userName` varchar(255) DEFAULT NULL COMMENT '发表人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_message
-- ----------------------------
BEGIN;
INSERT INTO `tbl_message` VALUES ('17090736f1ac42e986240b6db4468816', 'bd8ed029b0ab4462bd322f7be672eba2', '我摊牌了 我是奥特曼转世！', '2020-12-29 17:54:09', '没办法了', '张三');
INSERT INTO `tbl_message` VALUES ('2a2cab29dbaf42c096a2bcf7ad9d975a', '06f5fc056eac41558a964f96daa7f27c', '听说java程序员已经饱和了，有人知道现在java的行情吗', '2020-12-29 20:22:13', '关于java', '李四');
INSERT INTO `tbl_message` VALUES ('41771a8877ba41d3a08866f786fc95eb', 'bd8ed029b0ab4462bd322f7be672eba2', '售新版iphone12 有意者+v xxxxxxxxxx', '2020-12-29 17:53:41', '出售', '张三');
INSERT INTO `tbl_message` VALUES ('457059be27144c4cb98eb4d93cdf4363', '06f5fc056eac41558a964f96daa7f27c', '有一起开黑的吗', '2020-12-29 20:30:16', '好无聊', '李四');
INSERT INTO `tbl_message` VALUES ('54db872ca8194d08948e265ae7996b1c', 'bd8ed029b0ab4462bd322f7be672eba2', '最近课设太多了。忙都忙不过来', '2020-12-29 17:55:05', '难受', '张三');
INSERT INTO `tbl_message` VALUES ('660f501943734cca9774576f1ac120ee', 'bd8ed029b0ab4462bd322f7be672eccc', '123', '2020-12-31 15:27:22', '下午', '管理员');
INSERT INTO `tbl_message` VALUES ('6f768b23bba245898dbe12bfebf06d38', 'bd8ed029b0ab4462bd322f7be672eccc', '设计结果展示', '2021-01-13 11:15:22', '设计结果展示', '管理员');
INSERT INTO `tbl_message` VALUES ('837adfcc446240d1989a1699f3729156', 'bd8ed029b0ab4462bd322f7be672eba2', '食堂看见一个人的背影，很像我小时候的发小', '2020-12-29 17:52:33', '有意思的一件事情', '张三');
INSERT INTO `tbl_message` VALUES ('9305b1a8d3504436b2ed5dda869c2373', 'bd8ed029b0ab4462bd322f7be672eba2', '有谁知道这次模电考试的题型吗，难度大不大？', '2020-12-29 17:53:03', '考试', '张三');
INSERT INTO `tbl_message` VALUES ('a94ef9ea0adc4e9482d67700325f9158', 'bd8ed029b0ab4462bd322f7be672eccc', '我是管理员～', '2020-12-31 09:34:04', '你好', '管理员');
INSERT INTO `tbl_message` VALUES ('bd8ed029b0ab4462bd322f7be672ecc0', '06f5fc056eac41558a964f96daa7f27c', '本人在学校丢失校卡，麻烦捡到的同学联系下xxxxxxxx', '2020-11-27 21:50:05', '求助贴', '李四');
INSERT INTO `tbl_message` VALUES ('bd8ed029b0ab4462bd322f7be672ecc2', 'bd8ed029b0ab4462bd322f7be672eba2', '呵呵呵', '2020-11-27 21:50:06', '嗯嗯', '张三');
INSERT INTO `tbl_message` VALUES ('c7af2fe146f24e5691f0265d6e3adbe0', 'bd8ed029b0ab4462bd322f7be672eccc', '这里是一个轻松的分享平台，希望大家踊跃分享生活，传达积极的态度，如有不当言论将被管理员删除～', '2020-12-29 20:33:59', '关于留言薄的注意事项', '管理员');
COMMIT;

-- ----------------------------
-- Table structure for tbl_reply
-- ----------------------------
DROP TABLE IF EXISTS `tbl_reply`;
CREATE TABLE `tbl_reply` (
  `id` char(32) NOT NULL COMMENT '32位UUID',
  `reply` char(19) DEFAULT NULL COMMENT '回复信息',
  `messageId` varchar(255) DEFAULT NULL COMMENT '外键，关联留言表',
  `createTime` varchar(19) DEFAULT NULL COMMENT '回复时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_reply
-- ----------------------------
BEGIN;
INSERT INTO `tbl_reply` VALUES ('0528840a675d44b2a5c95fe349e331a2', '老妈我发短信了！！！', '17090736f1ac42e986240b6db4468816', '2021-01-16 21:13:45');
INSERT INTO `tbl_reply` VALUES ('1b0e26a2f47a4d3386211b071200823e', '记得课设验收，下午去～', '54db872ca8194d08948e265ae7996b1c', '2020-12-31 09:36:44');
INSERT INTO `tbl_reply` VALUES ('299d0bba439f4acaa6765e99e747c2c7', '123', 'a94ef9ea0adc4e9482d67700325f9158', '2020-12-31 09:35:25');
INSERT INTO `tbl_reply` VALUES ('57db32681f014686ac5ebc16871c00a6', '今天我无敌了～', '457059be27144c4cb98eb4d93cdf4363', '2020-12-30 18:55:30');
INSERT INTO `tbl_reply` VALUES ('7ba7d50a63414338a8041b053ae98a01', '下午3:28', '457059be27144c4cb98eb4d93cdf4363', '2020-12-31 15:28:20');
INSERT INTO `tbl_reply` VALUES ('81bbaa4c790d4043b0f3db9393ab6b56', '别忘了', '54db872ca8194d08948e265ae7996b1c', '2020-12-31 09:38:54');
INSERT INTO `tbl_reply` VALUES ('b843f53b00714626996e1ff9cd0ccad0', '好的明白了～', '16f4ee835fc3464291012a59a86623e1', '2020-12-30 18:52:10');
INSERT INTO `tbl_reply` VALUES ('bd39371ae08c40988829b450dadea6ce', '下午好！', '660f501943734cca9774576f1ac120ee', '2021-01-13 11:14:51');
INSERT INTO `tbl_reply` VALUES ('c012ccc41464413da159641494416c9c', '阿时间到啦设计扣篮大赛', '17090736f1ac42e986240b6db4468816', '2021-01-16 21:14:13');
INSERT INTO `tbl_reply` VALUES ('f17ef000596547139986de5ecfb79b8f', '我是管理员~', 'a94ef9ea0adc4e9482d67700325f9158', '2020-12-31 14:58:49');
INSERT INTO `tbl_reply` VALUES ('f657cbd7608042a5b73473ce36f3c09e', '我来惹～', '457059be27144c4cb98eb4d93cdf4363', '2020-12-30 18:44:14');
COMMIT;

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` char(32) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `loginAct` varchar(255) DEFAULT NULL,
  `loginPwd` varchar(255) DEFAULT NULL,
  `lockState` char(1) DEFAULT NULL,
  `createTime` char(19) DEFAULT NULL,
  `expireTime` char(19) DEFAULT NULL,
  `type` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
BEGIN;
INSERT INTO `tbl_user` VALUES ('06f5fc056eac41558a964f96daa7f27c', '李四', '1543322523@qq.com', 'ls', '202cb962ac59075b964b07152d234b70', '1', '2022-11-27 21:50:05', '2022-11-27 21:50:05', '1');
INSERT INTO `tbl_user` VALUES ('bd8ed029b0ab4462bd322f7be672eba2', '张三', '785141653@qq.com', 'zs', '202cb962ac59075b964b07152d234b70', '1', '2020-12-28 19:49:21', '2022-11-27 21:50:05', '1');
INSERT INTO `tbl_user` VALUES ('bd8ed029b0ab4462bd322f7be672eccc', '管理员', '775829060@qq.com', 'admin', '202cb962ac59075b964b07152d234b70', '1', '2020-12-28 19:49:21', '2099-12-12 12:00:00', '0');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
