/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost:3306
 Source Schema         : zongheng-demo

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 09/10/2021 17:12:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for es_exam_paper
-- ----------------------------
DROP TABLE IF EXISTS `es_exam_paper`;
CREATE TABLE `es_exam_paper`  (
  `id` bigint(19) NOT NULL COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试卷名称',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '类型',
  `subject` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学科',
  `grade` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年级',
  `duration` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '考试时长(分)',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '试卷类型type:\n1：期中、2：期末、3、模拟考\n学科subject：\n1：Jav' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of es_exam_paper
-- ----------------------------
INSERT INTO `es_exam_paper` VALUES (1445246900775878657, '大二《数据库原理》期中卷', '1', '2', '2', '150', '');
INSERT INTO `es_exam_paper` VALUES (1445248611494031361, '大一《Java》期末卷', '2', '1', '1', '150', '');
INSERT INTO `es_exam_paper` VALUES (1445249496441843713, '大一《C语言》模拟卷', '3', '3', '1', '150', '模拟测试');

-- ----------------------------
-- Table structure for es_question
-- ----------------------------
DROP TABLE IF EXISTS `es_question`;
CREATE TABLE `es_question`  (
  `id` bigint(19) NOT NULL COMMENT '试题/选项id',
  `exam_paper_id` bigint(19) NULL DEFAULT NULL COMMENT '试卷id',
  `title_flag` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '题目类型',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题/选项内容',
  `parent_id` bigint(19) NULL DEFAULT NULL COMMENT '父级试题',
  `correct_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '正确标识',
  `point` int(11) NULL DEFAULT NULL COMMENT '分值',
  `order_no` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `resolution` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '解析',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '题目类型\n选择、对错、填空\n题目标识：1：题干 2：选项\n题目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of es_question
-- ----------------------------
INSERT INTO `es_question` VALUES (1445285792967184385, 1445246900775878657, '1', '2', '文件系统管理数据阶段，数据有了内部结构。', NULL, '1', 10, 1, '');
INSERT INTO `es_question` VALUES (1445295665113124866, 1445246900775878657, '0', '2', '正确', 1445285792967184385, '1', NULL, 1, NULL);
INSERT INTO `es_question` VALUES (1445296836804530177, 1445246900775878657, '0', '2', '错误', 1445285792967184385, '0', NULL, 2, NULL);
INSERT INTO `es_question` VALUES (1445300667177160706, 1445246900775878657, '1', '2', 'E-R方法是描述信息模型最常用的方法。', NULL, '1', 10, 2, '');
INSERT INTO `es_question` VALUES (1445306190685458434, 1445246900775878657, '0', '2', '正确', 1445300667177160706, '1', NULL, 1, NULL);
INSERT INTO `es_question` VALUES (1445306329286234114, 1445246900775878657, '0', '2', '错误', 1445300667177160706, '0', NULL, 2, NULL);
INSERT INTO `es_question` VALUES (1445306833865199617, 1445246900775878657, '1', '2', '比较运算符是用来辅助专门的关系运算符进行操作。', NULL, '1', 10, 3, '');
INSERT INTO `es_question` VALUES (1445306876550631425, 1445246900775878657, '0', '2', '正确', 1445306833865199617, '1', NULL, 1, NULL);
INSERT INTO `es_question` VALUES (1445306944041177089, 1445246900775878657, '0', '2', '错误', 1445306833865199617, '0', NULL, 2, NULL);
INSERT INTO `es_question` VALUES (1446762383870205954, 1445248611494031361, '1', '1', '下面关于java.lang.Exception类的说法正确的是（）。', NULL, '1', 10, 1, NULL);
INSERT INTO `es_question` VALUES (1446762417764376577, 1445248611494031361, '0', '1', '继承自Throwable', 1446762383870205954, NULL, NULL, 1, NULL);
INSERT INTO `es_question` VALUES (1446762498865438722, 1445248611494031361, '0', '1', '继承自Serialable', 1446762383870205954, NULL, NULL, 2, NULL);
INSERT INTO `es_question` VALUES (1446763272643223554, 1445249496441843713, '1', '2', '传递引用给函数与传递指针的效果是一样的。', NULL, '1', 10, 1, NULL);
INSERT INTO `es_question` VALUES (1446763304368939010, 1445249496441843713, '0', '2', '正确', 1446763272643223554, NULL, NULL, 1, NULL);
INSERT INTO `es_question` VALUES (1446763324749062145, 1445249496441843713, '0', '2', '错误', 1446763272643223554, NULL, NULL, 2, NULL);

-- ----------------------------
-- Table structure for es_user_exam
-- ----------------------------
DROP TABLE IF EXISTS `es_user_exam`;
CREATE TABLE `es_user_exam`  (
  `id` bigint(19) NOT NULL,
  `user_id` bigint(19) NULL DEFAULT NULL,
  `question_id` bigint(19) NULL DEFAULT NULL,
  `user_option` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `correct_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `point` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `begin_time` datetime(0) NULL DEFAULT NULL COMMENT '考试开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '考试结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of es_user_exam
-- ----------------------------
INSERT INTO `es_user_exam` VALUES (1446765182603436034, 10086, 1446762383870205954, '1', NULL, 10, '2021-10-09 17:11:14', '2021-10-09 17:11:14', '2021-10-09 17:11:17');

-- ----------------------------
-- Table structure for es_user_exam_his
-- ----------------------------
DROP TABLE IF EXISTS `es_user_exam_his`;
CREATE TABLE `es_user_exam_his`  (
  `id` bigint(19) NOT NULL COMMENT '考生试卷id',
  `total_point` int(11) NULL DEFAULT NULL COMMENT '总分',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试卷名+姓名+考试序号(时间戳)',
  `exam_paper_id` bigint(19) NULL DEFAULT NULL COMMENT '试卷id',
  `user_id` bigint(19) NULL DEFAULT NULL COMMENT '考生id',
  `question_id` bigint(19) NULL DEFAULT NULL COMMENT '试题id',
  `user_option` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生答案',
  `correct_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否正确',
  `point` int(11) NULL DEFAULT NULL COMMENT '真实得分',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `begin_time` datetime(0) NULL DEFAULT NULL COMMENT '考试开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '考试结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '考生试卷记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of es_user_exam_his
-- ----------------------------
INSERT INTO `es_user_exam_his` VALUES (1446760780060631042, 0, '系统管理员-大二《数据库原理》期中卷-1633769624', 1445246900775878657, 10086, 1445285792967184385, '2', NULL, 0, '2021-10-09 16:48:39', '2021-10-09 16:48:39', '2021-10-09 16:48:44');
INSERT INTO `es_user_exam_his` VALUES (1446760780060631043, 0, '系统管理员-大二《数据库原理》期中卷-1633769624', 1445246900775878657, 10086, 1445300667177160706, '2', NULL, 0, '2021-10-09 16:48:39', '2021-10-09 16:48:39', '2021-10-09 16:48:44');
INSERT INTO `es_user_exam_his` VALUES (1446760780127739905, 0, '系统管理员-大二《数据库原理》期中卷-1633769624', 1445246900775878657, 10086, 1445306833865199617, '2', NULL, 0, '2021-10-09 16:48:39', '2021-10-09 16:48:39', '2021-10-09 16:48:44');
INSERT INTO `es_user_exam_his` VALUES (1446760890215636993, 20, '系统管理员-大二《数据库原理》期中卷-1633769650', 1445248611494031361, 10086, 1445285792967184385, '2', NULL, 0, '2021-10-09 16:53:44', '2021-10-09 16:53:44', '2021-10-09 16:53:50');
INSERT INTO `es_user_exam_his` VALUES (1446760890215636994, 20, '系统管理员-大二《数据库原理》期中卷-1633769650', 1445248611494031361, 10086, 1445300667177160706, '1', NULL, 10, '2021-10-09 16:53:44', '2021-10-09 16:53:44', '2021-10-09 16:53:50');
INSERT INTO `es_user_exam_his` VALUES (1446760890215636995, 20, '系统管理员-大二《数据库原理》期中卷-1633769650', 1445248611494031361, 10086, 1445306833865199617, '1', NULL, 10, '2021-10-09 16:53:44', '2021-10-09 16:53:44', '2021-10-09 16:53:50');
INSERT INTO `es_user_exam_his` VALUES (1446761630707425282, 10, '系统管理员-大二《数据库原理》期中卷-2021-10-09 16:57:06', 1445249496441843713, 10086, 1445285792967184385, '1', NULL, 10, '2021-10-09 16:56:12', '2021-10-09 16:56:12', '2021-10-09 16:56:18');
INSERT INTO `es_user_exam_his` VALUES (1446761630707425283, 10, '系统管理员-大二《数据库原理》期中卷-2021-10-09 16:57:06', 1445249496441843713, 10086, 1445300667177160706, '2', NULL, 0, '2021-10-09 16:56:12', '2021-10-09 16:56:12', '2021-10-09 16:56:18');
INSERT INTO `es_user_exam_his` VALUES (1446761630770339842, 10, '系统管理员-大二《数据库原理》期中卷-2021-10-09 16:57:06', 1445249496441843713, 10086, 1445306833865199617, '2', NULL, 0, '2021-10-09 16:56:12', '2021-10-09 16:56:12', '2021-10-09 16:56:18');
INSERT INTO `es_user_exam_his` VALUES (1446765073970962434, 10, '系统管理员-大一《C语言》模拟卷-2021-10-09 17:10:47', 1445249496441843713, 10086, 1446763272643223554, '1', NULL, 10, '2021-10-09 17:10:40', '2021-10-09 17:10:40', '2021-10-09 17:10:45');
INSERT INTO `es_user_exam_his` VALUES (1446765182603436033, 10, '系统管理员-大一《C语言》模拟卷-2021-10-09 17:11:13', 1445248611494031361, 10086, 1446763272643223554, '1', NULL, 10, '2021-10-09 17:10:48', '2021-10-09 17:10:48', '2021-10-09 17:10:53');

-- ----------------------------
-- Table structure for file_content
-- ----------------------------
DROP TABLE IF EXISTS `file_content`;
CREATE TABLE `file_content`  (
  `lngfilecontentid` bigint(19) NOT NULL,
  `imgfilecount` longblob NOT NULL,
  `dtmcreatetime` datetime(0) NOT NULL,
  PRIMARY KEY (`lngfilecontentid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for file_storage
-- ----------------------------
DROP TABLE IF EXISTS `file_storage`;
CREATE TABLE `file_storage`  (
  `lngfileid` bigint(19) NOT NULL,
  `chrfilename` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `chrfiletype` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `chrfilemd5` char(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `lngfilesize` bigint(20) NOT NULL,
  `chrfilebucketname` varchar(1000) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `chrfilesystemname` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `chrfilepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `chrfileurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `chrfilestatus` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `dtmcreatetime` datetime(0) NOT NULL,
  `lngfilecontentid` bigint(19) NULL DEFAULT NULL,
  PRIMARY KEY (`lngfileid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_storage
-- ----------------------------
INSERT INTO `file_storage` VALUES (1425072896323682305, '5.png', 'image/png', 'cb10766f4d6c449a3bec0eae6b7b0258', 152775, 'ykz-app', 'ykz-app', 'ykz-app/2021/08/10/cb10766f4d6c449a3bec0eae6b7b0258.png', NULL, '0', '2021-08-10 20:33:50', NULL);

-- ----------------------------
-- Table structure for message_error_send_info
-- ----------------------------
DROP TABLE IF EXISTS `message_error_send_info`;
CREATE TABLE `message_error_send_info`  (
  `id` bigint(19) NOT NULL COMMENT '消息发送失败详情id',
  `other_id` bigint(19) NOT NULL COMMENT '三方消息id',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息发送地址',
  `http_method` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息发送请求方式\r\n            post\r\n            get',
  `response_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息发送响应码',
  `response_data` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息发送响应数据',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息发送失败详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for message_info
-- ----------------------------
DROP TABLE IF EXISTS `message_info`;
CREATE TABLE `message_info`  (
  `id` bigint(19) NOT NULL COMMENT '消息详情id',
  `is_push_dingtalk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '消息是否推送钉钉\r\n            1：是\r\n            0：否',
  `is_send_msg` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '消息是否发送短信\r\n            1：是\r\n            0：否',
  `content_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息内容分类\r\n            1：text     纯文本消息\r\n            2：link     链接消息\r\n            3：action_card    卡片消息\r\n            4：oa  oa消息',
  `msg` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息内容 json',
  `source_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息来源\r\n            1：应用\r\n            2：平台',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息标题',
  `details` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息详情',
  `source_app_id` bigint(19) NOT NULL COMMENT '消息来源应用id\r\n            当message_source_type为2时值默认为0',
  `source_app_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息来源应用名称\r\n            当message_source_type为2时值默认为平台',
  `send_user_id` bigint(19) NULL DEFAULT NULL COMMENT '消息发送者id',
  `send_user_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息发送者姓名',
  `send_unit_id` bigint(19) NULL DEFAULT NULL COMMENT '消息发送者单位id',
  `send_unit_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息发送者单位名称',
  `template_id` bigint(19) NULL DEFAULT NULL COMMENT '消息模板id\r\n            当message_is_template为1时值有效',
  `template_fill_value` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息模板填充值\r\n            当message_is_template为1时值有效，json数据',
  `send_people_number` int(5) NULL DEFAULT NULL COMMENT '消息发送人数',
  `create_time` datetime(0) NOT NULL COMMENT '消息创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for message_receive
-- ----------------------------
DROP TABLE IF EXISTS `message_receive`;
CREATE TABLE `message_receive`  (
  `id` bigint(19) NOT NULL COMMENT '消息接收者关系表id',
  `msg_id` bigint(19) NOT NULL COMMENT '消息详情id',
  `receive_id` bigint(19) NOT NULL COMMENT '消息接收者id',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息接收者类型\r\n            1：人员\r\n            2：机构\r\n            3：应用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '消息接收者关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for message_send_inside
-- ----------------------------
DROP TABLE IF EXISTS `message_send_inside`;
CREATE TABLE `message_send_inside`  (
  `id` bigint(19) NOT NULL COMMENT '站内消息id',
  `msg_id` bigint(19) NOT NULL COMMENT '消息详情id',
  `receive_id` bigint(19) NOT NULL COMMENT '消息接收者关系表id',
  `receive_user_id` bigint(19) NULL DEFAULT NULL COMMENT '消息接收者id',
  `receive_user_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息接收者姓名',
  `receive_unit_id` bigint(19) NULL DEFAULT NULL COMMENT '消息接收者单位id',
  `receive_unit_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息接收者单位名称',
  `read_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息状态\r\n            1：已读\r\n            2：未读',
  `is_del` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否删除\r\n            1：是\r\n            0：否',
  `msg` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息实际内容',
  `read_time` datetime(0) NULL DEFAULT NULL COMMENT '消息阅读时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '站内消息发送表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for message_send_other
-- ----------------------------
DROP TABLE IF EXISTS `message_send_other`;
CREATE TABLE `message_send_other`  (
  `id` bigint(19) NOT NULL COMMENT '三方消息id',
  `msg_id` bigint(19) NOT NULL COMMENT '消息详情id',
  `receive_id` bigint(19) NOT NULL COMMENT '消息接收者关系表id',
  `receive_user_id` bigint(19) NULL DEFAULT NULL COMMENT '消息接收者id',
  `receive_user_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息接收者姓名',
  `receive_unit_id` bigint(19) NULL DEFAULT NULL COMMENT '消息接收者单位id',
  `receive_unit_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息接收者单位名称',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息类型\r\n            1：钉钉消息\r\n            2：短信消息',
  `receive_media` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息接收者标识:\r\n            message_type=1为钉钉id\r\n            message_type=2为手机号码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息状态\r\n            1：待发送\r\n            2：已发送\r\n            3：发送失败',
  `msg` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息实际内容',
  `count` int(5) NULL DEFAULT 0 COMMENT '消息发送次数',
  `fail_count` int(5) NULL DEFAULT 0 COMMENT '消息发送失败次数',
  `response_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息发送响应码',
  `response_data` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息发送响应数据',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `send_time` datetime(0) NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '三方消息发送表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for show_data
-- ----------------------------
DROP TABLE IF EXISTS `show_data`;
CREATE TABLE `show_data`  (
  `id` bigint(20) NOT NULL,
  `unit_total` int(255) NULL DEFAULT NULL COMMENT '单位总数',
  `municipal_total` int(255) NULL DEFAULT NULL COMMENT '市级部门数量',
  `municipal_unit` int(255) NULL DEFAULT NULL COMMENT '市级单位数量',
  `district_total` int(255) NULL DEFAULT NULL COMMENT '区县总数',
  `district_unit` int(255) NULL DEFAULT NULL COMMENT '区县单位数量',
  `enterprise_total` int(255) NULL DEFAULT NULL COMMENT '企事业总数',
  `enterprise_unit` int(255) NULL DEFAULT NULL COMMENT '企事业单位数',
  `reg_total` int(255) NULL DEFAULT NULL COMMENT '注册用户数',
  `active_total` int(255) NULL DEFAULT NULL COMMENT '活跃用户数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '展示数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_announcement
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement`;
CREATE TABLE `sys_announcement`  (
  `id` bigint(19) NOT NULL COMMENT 'id',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '0：单位公告（默认） 1：系统公告（admin发布）',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `subtitle` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` longblob NULL COMMENT '内容',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `unit_user_id` bigint(19) NOT NULL COMMENT '发布人id',
  `unit_id` bigint(19) NULL DEFAULT NULL,
  `user_name` varchar(54) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `img` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `dict_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典表code',
  `dict_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典表名称',
  `data_uuid` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告openapi业务id,用于第三方信息删除和修改',
  `app_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用code',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公告信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_announcement_unit
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement_unit`;
CREATE TABLE `sys_announcement_unit`  (
  `id` bigint(20) NOT NULL,
  `announcement_id` bigint(20) NOT NULL COMMENT '公告id',
  `unit_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `unit_id` bigint(20) NOT NULL COMMENT '机构id',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间/查阅时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_announcement_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_announcement_user`;
CREATE TABLE `sys_announcement_user`  (
  `id` bigint(19) NOT NULL COMMENT 'id',
  `announcement_id` bigint(19) NOT NULL COMMENT '公告信息id',
  `unit_user_id` bigint(19) NOT NULL COMMENT '机构人员id',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '阅读状态 0：未读 （默认）1：已读',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间/查阅时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '记录公告信息的用户状态，用户统计和条件查询（已读/未读）' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_app_chaetosema
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_chaetosema`;
CREATE TABLE `sys_app_chaetosema`  (
  `id` bigint(19) NOT NULL,
  `app_id` bigint(19) NOT NULL,
  `app_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `num` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  `state` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '1 有效 0 失效 控制角标是否显示',
  `user_open_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit_open_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门户应用角标' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_app_portal_clicknum
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_portal_clicknum`;
CREATE TABLE `sys_app_portal_clicknum`  (
  `id` bigint(19) NOT NULL,
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '1:快捷菜单 2:统计数量菜单 3 应用系统',
  `menu_id` bigint(19) NOT NULL COMMENT '当type=1,为快捷菜单id，type=2,为统计数量菜单id type=3 为应用id',
  `num` bigint(19) NOT NULL DEFAULT 0,
  `user_id` bigint(19) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '点击菜单次数统计' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_app_shortcut
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_shortcut`;
CREATE TABLE `sys_app_shortcut`  (
  `id` bigint(19) NOT NULL,
  `app_id` bigint(19) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '跳转url',
  `img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `order_no` int(11) NULL DEFAULT NULL,
  `remark` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `category` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '1:pc;2:移动端',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '第三方应用系统快捷方式菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_app_stat
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_stat`;
CREATE TABLE `sys_app_stat`  (
  `id` bigint(19) NOT NULL,
  `app_id` bigint(19) NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '跳转url',
  `img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  `api_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口url',
  `order_no` int(11) NULL DEFAULT NULL,
  `remark` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门户统计数量菜单，第三方系统按照ykz标准开发统计数量接口\r\n接入方式：将当前用信息以token 形式传递到第' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_application
-- ----------------------------
DROP TABLE IF EXISTS `sys_application`;
CREATE TABLE `sys_application`  (
  `id` bigint(19) NOT NULL,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统唯一码',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统名称（简称）',
  `full_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统全称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '服务端地址',
  `remark` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_no` int(11) NOT NULL COMMENT '新增的时候自动产生一个排序号（跳5号）',
  `logo` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存相对路径，前面的路径取配置表中属性',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '系统启用状态 1-启用 0-停用',
  `mssotype` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '1-令牌 2：模拟登录（预留）',
  `unit_sync_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '只记录相对地址，与系统地址一起组合为完整地址',
  `user_sync_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '只记录相对地址，与系统地址一起组合为完整地址',
  `sso_login_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '只记录相对地址，与系统地址一起组合为完整地址',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统类型 1：普通 2：钉钉（如果系统类型为政务钉，apsk不需要输入，调取封装的钉钉服务）',
  `app_key` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'appkey',
  `app_secret` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'appsecret',
  `encrypt_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '同步加密方式 1:明文 2：国密sm2 3：其他',
  `safe_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '同步接口安全策略 1：无 2：basic 3：oauth2',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  `target_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单点登录传输url用于告知第三方系统',
  `is_delete` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '是否删除 0：未删 1：删除',
  `developer` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开发商',
  `category` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分类 1：本系统 2：第三发应用',
  `pc_enable` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT ' 1 是 0 否 是否接入pc',
  `mobile_enable` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT ' 1 是 0 否 是否接入移动端',
  `mobile_target_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT ' 移动端跳转地址',
  `mobile_login_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT ' 移动端单点登录接口',
  `basic_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'basic用户名',
  `basic_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'basic密码',
  `is_data_sync` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '数据同步： 1 是 0 否 ',
  `sync_key` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公钥',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '第三方接入系统表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_application
-- ----------------------------
INSERT INTO `sys_application` VALUES (0, '1', '待办任务', '待办任务', '11', '重庆协同办公平台', 1, 'http://localhost:8088/ykz/storage/download/1425072896323682305', '1', '1', '/sync/unit', '/sync/user', '/sys/sso/login', '2', '456', '123', '1', '2', '2021-03-11 14:03:25', '2021-08-10 20:33:52', '/task/tasktodolist', '0', '', '1', '1', '1', '/task', '/task/sendlist', '', '', '0', '');

-- ----------------------------
-- Table structure for sys_application_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_application_api`;
CREATE TABLE `sys_application_api`  (
  `id` bigint(19) NOT NULL,
  `application_id` bigint(19) NOT NULL COMMENT '第三方接入系统id',
  `open_api_id` bigint(19) NOT NULL COMMENT '接口id',
  `create_time` datetime(0) NOT NULL,
  `strategy` bigint(11) NULL DEFAULT NULL COMMENT '调用接口策略，如每日限制调用频率3000次，备用（暂保留）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '第三方接入系统授权接口关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_application_apitype
-- ----------------------------
DROP TABLE IF EXISTS `sys_application_apitype`;
CREATE TABLE `sys_application_apitype`  (
  `id` bigint(19) NOT NULL COMMENT '接口分类id',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `create_time` date NOT NULL COMMENT '创建时间',
  `update_time` date NOT NULL COMMENT '修改时间',
  `remake` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '接口分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_application_unit
-- ----------------------------
DROP TABLE IF EXISTS `sys_application_unit`;
CREATE TABLE `sys_application_unit`  (
  `id` bigint(19) NOT NULL COMMENT '系统与组织机构权限关联表id',
  `application_id` bigint(19) NOT NULL COMMENT '接入系统id',
  `unit_id` bigint(19) NOT NULL COMMENT '组织机构id',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_data_extend
-- ----------------------------
DROP TABLE IF EXISTS `sys_data_extend`;
CREATE TABLE `sys_data_extend`  (
  `id` bigint(19) NOT NULL COMMENT '数据字典id',
  `columns_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段名称',
  `columns_value` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段值',
  `columns_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段类型1：文本框 2：下拉列表 3：单选框4：时间组件',
  `is_null` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否必填1：是  0：否 ',
  `is_update` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否可修改1：是  0：否 ',
  `is_unique` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否唯一1：是  0：否 ',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源 下拉框、单选框等选项复制 例如   {1:男;2:女}',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '状态1：启用0：禁用',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织机构扩展属性基础表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` bigint(19) NOT NULL,
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '参数名称',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '1：系统参数 2：业务参数',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'code编码',
  `dict_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'code key',
  `dict_value` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'code value',
  `order_no` int(11) NULL DEFAULT NULL COMMENT '排序号',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统数据字典表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES (1111, '接口分类', '1', 'JKFL', '1', '基础接口', 999999999, '32111', '2021-04-07 23:58:20', '2021-04-16 11:34:25');
INSERT INTO `sys_dict` VALUES (2222, '接口分类12341111', '2', 'JKFL', '2', '业务接口', 20, '22', '2021-04-07 23:58:20', '2021-04-13 18:06:55');
INSERT INTO `sys_dict` VALUES (1386565175309144066, '门户主题', '1', 'THEME', '1', '科技风', 1, NULL, '2021-04-26 14:17:54', '2021-04-26 14:17:54');
INSERT INTO `sys_dict` VALUES (1386565308436353025, '门户主题', '1', 'THEME', '2', '国风', 2, NULL, '2021-04-26 14:18:25', '2021-04-26 14:18:25');
INSERT INTO `sys_dict` VALUES (1386962488860180481, '用户信息_状态', '1', 'USER_STATUS', '1', '启用', 1, '启用', '2021-04-27 16:36:41', '2021-04-27 16:39:29');
INSERT INTO `sys_dict` VALUES (1386962629981732865, '用户信息_状态', '1', 'USER_STATUS', '2', '停用', 2, '停用', '2021-04-27 16:37:14', '2021-04-27 16:39:34');
INSERT INTO `sys_dict` VALUES (1386962629981732868, 'YKZ_服务URL_移动', '1', 'AN_URL', 'MOBILESERVER', 'http://chavez.vaiwan.com/login.html', 2, '停用', '2021-04-27 16:37:14', '2021-04-27 16:39:34');
INSERT INTO `sys_dict` VALUES (1386962629981732869, 'YKZ_服务URL_PC', '1', 'AN_URL', 'PCSERVER', 'http://chavez1.vaiwan.com/transfer', 1, '停用', '2021-04-27 16:37:14', '2021-04-27 16:39:34');
INSERT INTO `sys_dict` VALUES (1410156172176646145, '同步开关', '2', 'syncEnable', '1', '是否启用', 1, '1启用0停用', '2021-06-30 16:40:06', '2021-06-30 16:40:06');
INSERT INTO `sys_dict` VALUES (1412327028171071490, '消息类型', '1', 'msgType', '1', '业务消息', 1, NULL, '2021-07-06 16:26:18', '2021-07-06 16:26:18');
INSERT INTO `sys_dict` VALUES (1412327122098315266, '消息类型', '1', 'msgType', '2', '系统消息', 2, NULL, '2021-07-06 16:26:40', '2021-07-06 16:26:40');
INSERT INTO `sys_dict` VALUES (1415852352813428737, '公告管理分类', '1', 'ANOUNCEMENT_TYPE', '1', '系统公告', 1, NULL, '2021-07-16 09:54:41', '2021-07-16 09:54:41');
INSERT INTO `sys_dict` VALUES (1415852551879290881, '公告管理分类', '1', 'ANOUNCEMENT_TYPE', '2', '单位公告', 2, NULL, '2021-07-16 09:55:28', '2021-07-16 09:55:28');
INSERT INTO `sys_dict` VALUES (1422483688639758338, '是否推送数字重庆', '2', 'ISPUSHDCQC', '0', '是', 21, '1是0否', '2021-08-03 17:05:14', '2021-08-10 16:15:13');
INSERT INTO `sys_dict` VALUES (1445220643833053185, '试卷类型', '1', 'ExamType', '1', '期中卷', 1, '', '2021-10-05 10:53:47', '2021-10-05 11:36:31');
INSERT INTO `sys_dict` VALUES (1445220782937145345, '试卷类型', '1', 'ExamType', '2', '期末卷', 2, '', '2021-10-05 10:54:20', '2021-10-05 11:36:36');
INSERT INTO `sys_dict` VALUES (1445220885659844609, '试卷类型', '1', 'ExamType', '3', '模拟卷', 3, '', '2021-10-05 10:54:45', '2021-10-05 11:36:46');
INSERT INTO `sys_dict` VALUES (1445222938612269058, '试卷学科', '1', 'ExamSubject', '1', 'Java', 1, NULL, '2021-10-05 11:02:54', '2021-10-05 11:02:54');
INSERT INTO `sys_dict` VALUES (1445223085123502082, '试卷学科', '1', 'ExamSubject', '2', '数据库原理', 2, NULL, '2021-10-05 11:03:29', '2021-10-05 11:03:29');
INSERT INTO `sys_dict` VALUES (1445223398115049474, '试卷学科', '1', 'ExamSubject', '3', 'C语言', 3, NULL, '2021-10-05 11:04:44', '2021-10-05 11:04:44');
INSERT INTO `sys_dict` VALUES (1445229872140713985, '年级', '1', 'ExamGrade', '1', '大一', 1, NULL, '2021-10-05 11:30:27', '2021-10-05 11:30:27');
INSERT INTO `sys_dict` VALUES (1445230037819916289, '年级', '1', 'ExamGrade', '2', '大二', 2, NULL, '2021-10-05 11:31:07', '2021-10-05 11:31:07');
INSERT INTO `sys_dict` VALUES (1445270383048192002, '试题类型', '1', 'QuestionType', '1', '选择题', 1, NULL, '2021-10-05 14:11:26', '2021-10-05 14:11:26');
INSERT INTO `sys_dict` VALUES (1445270497175203841, '试题类型', '1', 'QuestionType', '2', '判断题', 2, NULL, '2021-10-05 14:11:53', '2021-10-05 14:11:53');

-- ----------------------------
-- Table structure for sys_file_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_file_relation`;
CREATE TABLE `sys_file_relation`  (
  `relationship_id` bigint(19) NOT NULL COMMENT '附件关系id',
  `file_id` bigint(19) NULL DEFAULT NULL COMMENT '附件id',
  `business_id` bigint(19) NULL DEFAULT NULL COMMENT '业务id',
  `file_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件名称',
  `business_type` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务类型',
  `file_type` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '附件类型',
  `create_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '入库时间',
  PRIMARY KEY (`relationship_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_fileconfig
-- ----------------------------
DROP TABLE IF EXISTS `sys_fileconfig`;
CREATE TABLE `sys_fileconfig`  (
  `file_config_id` bigint(19) NOT NULL,
  `unit_id` bigint(19) NOT NULL,
  `config_group` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分组',
  `config_group_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分组名称',
  `config_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置名称',
  `config_value` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置值',
  `config_value_min` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置最小值',
  `config_value_max` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置最大值',
  `config_value_desc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置描述',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `create_user_id` bigint(19) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `update_user_id` bigint(19) NULL DEFAULT NULL,
  PRIMARY KEY (`file_config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_holidays
-- ----------------------------
DROP TABLE IF EXISTS `sys_holidays`;
CREATE TABLE `sys_holidays`  (
  `id` bigint(20) NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `day` date NOT NULL COMMENT '节假日时间',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '节假日表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(19) NOT NULL,
  `type` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '1:普通日志 2：埋点日志',
  `subject` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title` varchar(4000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '成功',
  `module` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '如：公文模块',
  `remarks` varchar(750) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新增“xxxxx”',
  `params` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `client_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `server_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `source` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '1-pc端、2-手机端、3-平板',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `user_id` bigint(19) NULL DEFAULT NULL,
  `username` varchar(54) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit_id` bigint(19) NULL DEFAULT NULL,
  `dept_id` bigint(19) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(19) NOT NULL COMMENT '功能菜单id',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `http_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求方式',
  `uri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单类型 1：菜单（必须有链接地址）2：功能权限(菜单的数据权限和按钮级别的权限控制) 分类下可以挂分类和菜单、菜单只能为叶子节点',
  `code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单code编码   如：oa系统收文管理收文登记\n                    oa-swgl-swdj\n             存储方式为大写且唯一',
  `level_code` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '菜单层次编码  四位一级，每次新增时取本级最大号+1',
  `target` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '菜单目标窗体  1-本应用，2-内嵌，3-新窗口',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `parent_id` bigint(19) UNSIGNED NOT NULL COMMENT '菜单父节点id',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单说明',
  `order_no` int(11) NOT NULL COMMENT '排序号 隔5个号进行分配',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '修改时间',
  `keep_alive` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态保持 1:保持 0:不保持',
  `hidden` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '是否显示到菜单中 1:显示 0:不显示',
  `is_delete` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `category` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '分类 1：管理端 2：用户端',
  `api_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接口地址',
  `hide_children` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '隐藏下级   0：不隐藏 1：隐藏',
  `is_micro_app` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '是否微应用   0：不是 1：是',
  `redirect` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '重定向地址',
  `component` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'vue组件名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '功能菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', NULL, '', '1', 'system', '1000', '1', 'appstore', 0, '系统管理描述', 1, '1', '2021-03-15 12:00:00', '2021-06-11 14:05:31', '0', '0', '0', '1', NULL, '0', '0', '', 'RouteView');
INSERT INTO `sys_menu` VALUES (2, '机构管理', NULL, '', '2', 'unit', '10001000', '1', '', 1, '机构管理描述', 5, '1', '2021-03-15 12:00:00', '2021-07-13 10:57:04', '0', '0', '0', '1', NULL, '1', '0', '/system/unit/list', 'RouteView');
INSERT INTO `sys_menu` VALUES (3, '用户管理', NULL, '', '2', 'user', '10001001', '1', '', 1, '用户管理描述', 1, '1', '2021-03-15 12:00:00', '2021-08-10 09:46:08', '0', '0', '0', '1', NULL, '1', '0', '/system/user/list', 'RouteView');
INSERT INTO `sys_menu` VALUES (4, '菜单管理', NULL, '', '2', 'menu', '10001002', '1', '', 1, '菜单管理描述', 15, '1', '2021-03-15 12:00:00', '2021-06-10 16:47:07', '0', '0', '0', '1', NULL, '1', '0', '/system/menu/list', 'RouteView');
INSERT INTO `sys_menu` VALUES (5, '角色管理', NULL, '', '2', 'role', '10001003', '1', '', 1, '角色管理描述', 20, '1', '2021-03-15 12:00:00', '2021-06-10 16:55:33', '0', '0', '0', '1', NULL, '1', '0', '/system/role/list', 'RouteView');
INSERT INTO `sys_menu` VALUES (6, '新增', 'post', '', '3', 'add', '100010021001', '1', NULL, 4, '', 5, '1', '2021-03-15 12:00:00', '2021-06-10 16:45:42', '0', '0', '0', '1', '/system/menu/save', '0', '0', '', '');
INSERT INTO `sys_menu` VALUES (7, '修改', 'post', '', '3', 'edit', '100010021002', '1', NULL, 4, '', 10, '1', '2021-03-15 12:00:00', '2021-06-11 09:37:16', '0', '1', '0', '1', '', '0', '0', '', 'MenuEdit');
INSERT INTO `sys_menu` VALUES (8, '删除', 'delete', '', '3', 'delete', '100010021003', '1', NULL, 4, '', 15, '1', '2021-03-15 12:00:00', '2021-06-10 16:41:21', '0', '0', '0', '1', '/system/menu/delete', '0', '0', '', '');
INSERT INTO `sys_menu` VALUES (123124141241421, '试卷管理', NULL, '', '2', 'exampaper', '10041005', '1', '', 0, '', 145, '1', '2021-04-07 22:24:05', '2021-10-04 10:43:57', '0', '0', '0', '1', NULL, '1', '0', '/exampaper/list', 'RouteView');
INSERT INTO `sys_menu` VALUES (123124141241422, '查看', NULL, '', '3', 'list', '100410051000', '1', NULL, 123124141241421, '', 150, '1', '2021-04-07 22:24:29', '2021-10-04 10:45:27', '1', '0', '0', '1', NULL, '0', '0', '', '/exampaper/ExamPaperList');
INSERT INTO `sys_menu` VALUES (123124141241423, '新增', NULL, '', '3', 'add', '100410051001', '1', NULL, 123124141241421, '', 155, '1', '2021-04-07 22:24:49', '2021-10-04 10:45:34', '0', '1', '0', '1', NULL, '0', '0', '', '/exampaper/ExamPaperSave');
INSERT INTO `sys_menu` VALUES (123124141241424, '修改', NULL, '', '3', 'edit', '100410051002', '1', NULL, 123124141241421, '', 160, '1', '2021-04-07 22:25:08', '2021-10-04 10:45:45', '0', '0', '0', '1', NULL, '0', '0', '', '/exampaper/ExamPaperUpdate');
INSERT INTO `sys_menu` VALUES (123124141241425, '删除', NULL, '', '3', 'delete', '100410051003', '1', NULL, 123124141241421, '', 165, '1', '2021-04-07 22:25:27', '2021-10-04 10:45:50', '1', '1', '0', '1', NULL, '0', '0', '', '');
INSERT INTO `sys_menu` VALUES (123124141241431, '试题管理', NULL, '', '2', 'question', '10041007', '1', '', 0, '', 145, '1', '2021-04-07 22:24:05', '2021-06-10 16:58:44', '0', '0', '0', '1', NULL, '1', '0', '/question/list', 'RouteView');
INSERT INTO `sys_menu` VALUES (123124141241432, '查看', NULL, '', '3', 'list', '100410071000', '1', NULL, 123124141241431, '', 150, '1', '2021-04-07 22:24:29', '2021-06-25 14:44:25', '1', '0', '0', '1', NULL, '0', '0', '', '/question/QuestionList');
INSERT INTO `sys_menu` VALUES (123124141241433, '新增', NULL, '', '3', 'add', '100410071001', '1', NULL, 123124141241431, '', 155, '1', '2021-04-07 22:24:49', '2021-06-10 16:59:35', '0', '1', '0', '1', NULL, '0', '0', '', '/question/QuestionSave');
INSERT INTO `sys_menu` VALUES (123124141241434, '修改', NULL, '', '3', 'edit', '100410071002', '1', NULL, 123124141241431, '', 160, '1', '2021-04-07 22:25:08', '2021-06-30 17:42:25', '0', '0', '0', '1', NULL, '0', '0', '', '/question/QuestionUpdate');
INSERT INTO `sys_menu` VALUES (123124141241435, '删除', NULL, NULL, '3', 'delete', '100410071003', '1', NULL, 123124141241431, NULL, 165, '1', '2021-04-07 22:25:27', '2021-04-07 22:25:27', '1', '1', '0', '1', NULL, '0', '0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (123124141241441, '在线考试', NULL, '', '2', 'userexam', '10041008', '1', '', 0, '', 145, '1', '2021-04-07 22:24:05', '2021-10-09 15:17:44', '0', '0', '0', '1', NULL, '1', '0', '/userexam/exam', 'RouteView');
INSERT INTO `sys_menu` VALUES (123124141241442, '查看', NULL, '', '3', 'exam', '100410081000', '3', NULL, 123124141241441, '', 150, '1', '2021-04-07 22:24:29', '2021-10-09 15:17:11', '1', '0', '0', '1', NULL, '0', '0', '', '/userexam/UserExam');
INSERT INTO `sys_menu` VALUES (123124141241443, '提交', NULL, NULL, '3', 'submit', '100410081003', '1', NULL, 123124141241441, NULL, 165, '1', '2021-04-07 22:25:27', '2021-10-05 17:20:56', '1', '1', '0', '1', NULL, '0', '0', NULL, '');
INSERT INTO `sys_menu` VALUES (1373981050003832833, '查看', NULL, '', '3', 'list', '100010021000', '1', NULL, 4, '', 20, '1', '2021-03-22 20:53:04', '2021-06-11 09:37:11', '1', '0', '0', '1', NULL, '0', '0', '', 'MenuList');
INSERT INTO `sys_menu` VALUES (1377868267380543489, '查看', NULL, '', '3', 'list', '100010031000', '1', NULL, 5, '', 25, '1', '2021-04-02 14:19:29', '2021-06-11 09:37:28', '1', '0', '0', '1', NULL, '0', '0', '', 'RoleList');
INSERT INTO `sys_menu` VALUES (1377875396803956738, '新增', NULL, '', '3', 'add', '100010031001', '1', NULL, 5, '', 30, '1', '2021-04-02 14:47:49', '2021-06-10 16:56:41', '0', '0', '0', '1', NULL, '0', '0', '', '');
INSERT INTO `sys_menu` VALUES (1377875480836837378, '修改', NULL, '', '3', 'edit', '100010031002', '1', NULL, 5, '', 35, '1', '2021-04-02 14:48:09', '2021-06-11 09:37:34', '0', '0', '0', '1', NULL, '0', '0', '', 'RoleEdit');
INSERT INTO `sys_menu` VALUES (1377875566643908610, '删除', NULL, '', '3', 'delete', '100010031003', '1', NULL, 5, '', 40, '1', '2021-04-02 14:48:29', '2021-06-10 16:57:10', '0', '0', '0', '1', NULL, '0', '0', '', '');
INSERT INTO `sys_menu` VALUES (1377875934970908673, '查看', NULL, '', '3', 'list', '100010011000', '1', NULL, 3, '', 45, '1', '2021-04-02 14:49:57', '2021-06-11 09:36:41', '1', '0', '0', '1', NULL, '0', '0', '', 'UserList');
INSERT INTO `sys_menu` VALUES (1377876011701506049, '新增', NULL, '', '3', 'add', '100010011001', '1', NULL, 3, '', 50, '1', '2021-04-02 14:50:16', '2021-06-10 16:50:59', '0', '0', '0', '1', NULL, '0', '0', '', '');
INSERT INTO `sys_menu` VALUES (1377894516937199618, '修改', NULL, '/system/user/edit/:orgid/:id', '3', 'edit', '100010011002', '1', NULL, 3, '', 55, '1', '2021-04-02 16:03:48', '2021-06-11 09:36:51', '0', '0', '0', '1', NULL, '0', '0', '', 'UserEdit');
INSERT INTO `sys_menu` VALUES (1377894777160208386, '删除', NULL, '', '3', 'delete', '100010011003', '1', NULL, 3, '', 60, '1', '2021-04-02 16:04:50', '2021-06-10 16:52:08', '0', '0', '0', '1', NULL, '0', '0', '', '');
INSERT INTO `sys_menu` VALUES (1377895123689410561, '转岗', NULL, '/system/user/change/:id/:type', '3', 'transfer', '100010011004', '1', NULL, 3, '', 65, '1', '2021-04-02 16:06:12', '2021-06-11 09:36:58', '0', '0', '0', '1', NULL, '0', '0', '', 'UserUnitChange');
INSERT INTO `sys_menu` VALUES (1377895354153832450, '兼职', NULL, '/system/user/change/:id/:type', '3', 'add-job', '100010011005', '1', NULL, 3, '', 70, '1', '2021-04-02 16:07:07', '2021-06-11 09:37:02', '0', '0', '0', '1', NULL, '0', '0', '', 'UserUnitChange');
INSERT INTO `sys_menu` VALUES (1377908094608084994, '系统设置', NULL, '/system/setting', '2', 'setting', '10001005', '1', '', 1, '', 105, '1', '2021-04-02 16:57:45', '2021-06-11 10:53:39', '0', '0', '0', '1', NULL, '1', '0', '', 'SettingEdit');
INSERT INTO `sys_menu` VALUES (1377908217002070017, '查看', NULL, '', '3', 'view', '100010051000', '1', NULL, 1377908094608084994, '', 110, '1', '2021-04-02 16:58:14', '2021-06-10 16:58:15', '0', '0', '0', '1', NULL, '0', '0', '', '');
INSERT INTO `sys_menu` VALUES (1377908286199697409, '修改', NULL, '', '3', 'edit', '100010051001', '1', NULL, 1377908094608084994, '', 115, '1', '2021-04-02 16:58:30', '2021-06-10 16:58:22', '0', '0', '0', '1', NULL, '0', '0', '', '');
INSERT INTO `sys_menu` VALUES (1379410849659117570, '新增', NULL, '/system/unit/add/:topId', '3', 'add', '100010001000', '1', NULL, 2, '', 125, '1', '2021-04-06 20:29:09', '2021-06-11 09:36:22', '0', '0', '0', '1', NULL, '0', '0', '', 'UnitAdd');
INSERT INTO `sys_menu` VALUES (1379410941933805569, '修改', NULL, '/system/unit/edit/:id', '3', 'edit', '100010001001', '1', NULL, 2, '', 130, '1', '2021-04-06 20:29:31', '2021-06-11 09:36:29', '0', '0', '0', '1', NULL, '0', '0', '', 'UnitEdit');
INSERT INTO `sys_menu` VALUES (1379411028663623681, '删除', NULL, '', '3', 'delete', '100010001002', '1', NULL, 2, '', 135, '1', '2021-04-06 20:29:52', '2021-06-16 11:10:17', '0', '0', '0', '1', NULL, '0', '0', '', '');
INSERT INTO `sys_menu` VALUES (1379448537200300034, '停用', NULL, '', '3', 'stop', '100010001003', '1', NULL, 2, '', 140, '1', '2021-04-06 22:58:55', '2021-06-10 16:48:57', '0', '0', '0', '1', NULL, '0', '0', '', '');
INSERT INTO `sys_menu` VALUES (1381615299408711682, '字典管理', NULL, '', '2', 'dictionary', '10001009', '1', '', 1, '', 220, '1', '2021-04-12 22:28:51', '2021-06-10 17:03:50', '0', '0', '0', '1', NULL, '1', '0', '/system/dictionary/list', 'RouteView');
INSERT INTO `sys_menu` VALUES (1381616119764242433, '查看', NULL, '', '3', 'list', '100010091000', '1', NULL, 1381615299408711682, '', 225, '1', '2021-04-12 22:32:07', '2021-06-11 09:44:41', '1', '0', '0', '1', NULL, '0', '0', '', 'DictionaryList');
INSERT INTO `sys_menu` VALUES (1381616325402578946, '新增', NULL, '', '3', 'add', '100010091001', '1', NULL, 1381615299408711682, '', 230, '1', '2021-04-12 22:32:56', '2021-06-10 17:04:20', '0', '0', '0', '1', NULL, '0', '0', '', '');
INSERT INTO `sys_menu` VALUES (1381616408537878529, '修改', NULL, '', '3', 'edit', '100010091002', '1', NULL, 1381615299408711682, '', 235, '1', '2021-04-12 22:33:16', '2021-06-11 09:44:46', '0', '0', '0', '1', NULL, '0', '0', '', 'DictionaryEdit');
INSERT INTO `sys_menu` VALUES (1381616685169004545, '字典删除', NULL, '', '3', 'delete', '100010091003', '1', NULL, 1381615299408711682, '', 240, '1', '2021-04-12 22:34:22', '2021-06-10 17:05:20', '0', '0', '0', '1', NULL, '0', '0', '', '');
INSERT INTO `sys_menu` VALUES (1391663714586914818, '公告管理', NULL, '', '2', 'announcement', '1005', '1', 'notification', 0, '', 20, '1', '2021-05-10 15:57:40', '2021-07-29 14:14:36', '0', '0', '0', '2', '', '1', '0', '/announcement/list', 'RouteView');
INSERT INTO `sys_menu` VALUES (1391665214562299906, '查看', NULL, '', '3', 'list', '10051000', '1', NULL, 1391663714586914818, '', 335, '1', '2021-05-10 16:03:38', '2021-06-11 09:47:47', '1', '0', '0', '2', NULL, '0', '0', '', 'AnnouncementList');
INSERT INTO `sys_menu` VALUES (1391665461795549186, '新增', NULL, '', '3', 'add', '10051001', '1', NULL, 1391663714586914818, '', 340, '1', '2021-05-10 16:04:37', '2021-06-11 09:48:10', '0', '0', '0', '2', NULL, '0', '0', '', '');
INSERT INTO `sys_menu` VALUES (1391665597112184834, '修改', NULL, '', '3', 'edit', '10051002', '1', NULL, 1391663714586914818, '', 345, '1', '2021-05-10 16:05:09', '2021-06-11 09:48:20', '0', '0', '0', '2', NULL, '0', '0', '', 'AnnouncementEdit');
INSERT INTO `sys_menu` VALUES (1391665770961891330, '删除', NULL, '', '3', 'delete', '10051003', '1', NULL, 1391663714586914818, '', 350, '1', '2021-05-10 16:05:50', '2021-06-11 09:48:27', '0', '0', '0', '2', NULL, '0', '0', '', '');
INSERT INTO `sys_menu` VALUES (1401834283554869249, '查看', NULL, '', '3', 'list', '100010001000', '1', NULL, 2, '', 1, '1', '2021-06-07 17:31:53', '2021-07-13 10:57:10', '1', '0', '0', '1', NULL, '0', '0', '', 'UnitList');
INSERT INTO `sys_menu` VALUES (1404996436055068673, '机构扩展管理', NULL, '', '2', 'extend', '10001010', '1', '', 1, '机构扩展属性字段管理', 225, '1', '2021-06-16 10:57:09', '2021-07-13 09:18:57', '0', '0', '0', '1', NULL, '1', '0', '/system/extend/list', 'RouteView');
INSERT INTO `sys_menu` VALUES (1404996882056384514, '查看', NULL, NULL, '3', 'list', '100010101000', '1', NULL, 1404996436055068673, NULL, 1, '1', '2021-06-16 10:58:55', '2021-06-16 10:58:55', '1', '0', '0', '1', NULL, '0', '0', NULL, 'ExtendList');
INSERT INTO `sys_menu` VALUES (1404997238895185922, '新增', NULL, '', '3', 'add', '100010101001', '1', NULL, 1404996436055068673, '', 6, '1', '2021-06-16 11:00:20', '2021-06-17 10:02:34', '0', '0', '0', '1', NULL, '0', '0', '', 'ExtendEdit');
INSERT INTO `sys_menu` VALUES (1404997413227237378, '修改', NULL, '', '3', 'edit', '100010101002', '1', NULL, 1404996436055068673, '', 11, '1', '2021-06-16 11:01:02', '2021-06-17 10:03:28', '0', '0', '0', '1', NULL, '0', '0', '', 'ExtendEdit');
INSERT INTO `sys_menu` VALUES (1405001042277470210, '删除', NULL, NULL, '3', 'delete', '100010101003', '1', NULL, 1404996436055068673, NULL, 16, '1', '2021-06-16 11:15:27', '2021-06-16 11:15:27', '0', '0', '0', '1', NULL, '0', '0', NULL, NULL);
INSERT INTO `sys_menu` VALUES (1406941855442046978, '详情', NULL, NULL, '3', 'detail', '10051004', '1', NULL, 1391663714586914818, NULL, 355, '1', '2021-06-21 19:47:33', '2021-06-21 19:47:33', '0', '0', '0', '2', NULL, '0', '0', NULL, 'AnnouncementDetails');
INSERT INTO `sys_menu` VALUES (1407527378398031873, '节假日管理', NULL, '', '2', 'holidays', '10001011', '1', '', 1, '工作日', 230, '1', '2021-06-23 10:34:12', '2021-06-23 17:48:32', '0', '0', '0', '1', NULL, '0', '0', '', 'HolidaysList');
INSERT INTO `sys_menu` VALUES (1410122470005977090, '同步记录', NULL, '/system/unit/sync/log', '3', 'synclog', '100010001005', '1', NULL, 2, NULL, 150, '1', '2021-06-30 14:26:10', '2021-06-30 14:44:29', '1', '0', '0', '1', NULL, '0', '0', NULL, '/sync-log/SyncLogOne');
INSERT INTO `sys_menu` VALUES (1410127445598257153, '同步记录', NULL, '/system/unit/sync/log', '3', 'synclog', '100010011006', '1', NULL, 3, NULL, 75, '1', '2021-06-30 14:45:57', '2021-06-30 14:45:57', '1', '0', '0', '1', NULL, '0', '0', NULL, '/sync-log/SyncLogOne');
INSERT INTO `sys_menu` VALUES (1414756833072533506, '用户扩展管理', NULL, '', '2', 'extend-user', '10001021', '1', '', 1, '用户扩展属性字段管理', 235, '1', '2021-07-13 09:21:29', '2021-07-13 09:34:38', '0', '0', '0', '1', NULL, '1', '0', '/system/extend-user/list', 'RouteView');
INSERT INTO `sys_menu` VALUES (1414757134630408194, '查看', NULL, NULL, '3', 'list', '100010211000', '1', NULL, 1414756833072533506, NULL, 1, '1', '2021-07-13 09:22:40', '2021-07-13 09:22:40', '1', '0', '0', '1', NULL, '0', '0', NULL, 'ExtendUserList');
INSERT INTO `sys_menu` VALUES (1414757271779954689, '新增', NULL, NULL, '3', 'add', '100010211001', '1', NULL, 1414756833072533506, NULL, 6, '1', '2021-07-13 09:23:13', '2021-07-13 09:23:13', '0', '0', '0', '1', NULL, '0', '0', NULL, 'ExtendUserEdit');
INSERT INTO `sys_menu` VALUES (1414757383625265154, '修改', NULL, '', '3', 'edit', '100010211002', '1', NULL, 1414756833072533506, '', 11, '1', '2021-07-13 09:23:40', '2021-07-13 09:24:09', '0', '0', '0', '1', NULL, '0', '0', '', 'ExtendUserEdit');
INSERT INTO `sys_menu` VALUES (1414757468085964801, '删除', NULL, NULL, '3', 'delete', '100010211003', '1', NULL, 1414756833072533506, NULL, 16, '1', '2021-07-13 09:24:00', '2021-07-13 09:24:00', '0', '0', '0', '1', NULL, '0', '0', NULL, NULL);

-- ----------------------------
-- Table structure for sys_menurole
-- ----------------------------
DROP TABLE IF EXISTS `sys_menurole`;
CREATE TABLE `sys_menurole`  (
  `id` bigint(19) NOT NULL COMMENT '角色功能id',
  `menu_id` bigint(19) NOT NULL COMMENT '功能菜单id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  `checked` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '选择   0：半选 1：选择',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '功能角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menurole
-- ----------------------------
INSERT INTO `sys_menurole` VALUES (1445716409160695809, 123124141241441, 1445716409093586945, '1');
INSERT INTO `sys_menurole` VALUES (1445716409160695810, 123124141241442, 1445716409093586945, '1');
INSERT INTO `sys_menurole` VALUES (1445716409160695811, 123124141241443, 1445716409093586945, '1');
INSERT INTO `sys_menurole` VALUES (1445716486008733697, 1, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486008733698, 3, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486008733699, 1377875934970908673, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486008733700, 1377876011701506049, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486008733701, 1377894516937199618, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486008733702, 1377894777160208386, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486008733703, 1377895123689410561, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486008733704, 1377895354153832450, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486008733705, 1410127445598257153, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486008733706, 2, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486008733707, 1401834283554869249, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648257, 1379410849659117570, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648258, 1379410941933805569, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648259, 1379411028663623681, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648260, 1379448537200300034, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648261, 1410122470005977090, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648262, 4, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648263, 6, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648264, 7, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648265, 8, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648266, 1373981050003832833, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648267, 5, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648268, 1377868267380543489, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648269, 1377875396803956738, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648270, 1377875480836837378, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648271, 1377875566643908610, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648272, 1377908094608084994, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648273, 1377908217002070017, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648274, 1377908286199697409, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648275, 1381615299408711682, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648276, 1381616119764242433, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648277, 1381616325402578946, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648278, 1381616408537878529, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648279, 1381616685169004545, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648280, 1404996436055068673, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648281, 1404996882056384514, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648282, 1404997238895185922, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648283, 1404997413227237378, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648284, 1405001042277470210, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648285, 1407527378398031873, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648286, 1414756833072533506, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648287, 1414757134630408194, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648288, 1414757271779954689, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648289, 1414757383625265154, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648290, 1414757468085964801, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648291, 123124141241421, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648292, 123124141241422, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648293, 123124141241423, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648294, 123124141241424, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648295, 123124141241425, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648296, 123124141241431, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648297, 123124141241432, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648298, 123124141241433, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648299, 123124141241434, 1442688963272794113, '1');
INSERT INTO `sys_menurole` VALUES (1445716486071648300, 123124141241435, 1442688963272794113, '1');

-- ----------------------------
-- Table structure for sys_open_api
-- ----------------------------
DROP TABLE IF EXISTS `sys_open_api`;
CREATE TABLE `sys_open_api`  (
  `id` bigint(19) NOT NULL COMMENT '接口分类id',
  `api_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接口名称',
  `api_address` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接口地址',
  `api_type_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '接口分类id',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '1:启用（默认）0:停用',
  `remake` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_open_api
-- ----------------------------
INSERT INTO `sys_open_api` VALUES (1384401917542662145, '消息发送', '/openapi/message/sendMsg', '1', '2021-04-20 15:01:53', '2021-05-08 16:04:09', '1', NULL);
INSERT INTO `sys_open_api` VALUES (1394550284731592705, '创建待办', '/openapi/task/create.json', '2', '2021-05-18 15:07:52', '2021-05-18 15:07:52', '1', NULL);
INSERT INTO `sys_open_api` VALUES (1394550340901711873, '完成待办', '/openapi/task/finish.json', '2', '2021-05-18 15:08:05', '2021-05-18 15:08:05', '1', NULL);
INSERT INTO `sys_open_api` VALUES (1394550400968339458, '取消待办', '/openapi/task/cancel.json', '2', '2021-05-18 15:08:20', '2021-05-18 15:08:20', '1', NULL);
INSERT INTO `sys_open_api` VALUES (1394550460904943618, '催办', '/openapi/task/urgel.json', '2', '2021-05-18 15:08:34', '2021-05-18 15:08:34', '1', NULL);
INSERT INTO `sys_open_api` VALUES (1394550545684410369, '我的已办列表', '/openapi/task/getDoneList', '2', '2021-05-18 15:08:54', '2021-05-18 15:08:54', '1', NULL);
INSERT INTO `sys_open_api` VALUES (1394550626173104129, '我的任务列表', '/openapi/task/getList', '2', '2021-05-18 15:09:13', '2021-05-18 15:09:13', '1', NULL);
INSERT INTO `sys_open_api` VALUES (1394550696423501826, '我的进行中的待办', '/openapi/task/getTodoList', '2', '2021-05-18 15:09:30', '2021-05-18 15:09:30', '1', NULL);
INSERT INTO `sys_open_api` VALUES (1394550753411510274, '我的催办列表', '/openapi/task/getUrgelList', '2', '2021-05-18 15:09:44', '2021-05-18 15:27:35', '1', '2');
INSERT INTO `sys_open_api` VALUES (1398203998859796481, '解析jwtTokenjh', '/openapi/v1.0/getUserByToken', '2', '2021-05-28 17:06:25', '2021-06-01 18:09:33', '1', '');

-- ----------------------------
-- Table structure for sys_portal_app_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_portal_app_order`;
CREATE TABLE `sys_portal_app_order`  (
  `id` bigint(19) NOT NULL,
  `app_id` bigint(19) NOT NULL,
  `app_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `unit_user_id` bigint(19) NOT NULL,
  `order_no` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门户应用排序' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_portal_app_theme
-- ----------------------------
DROP TABLE IF EXISTS `sys_portal_app_theme`;
CREATE TABLE `sys_portal_app_theme`  (
  `id` bigint(19) NOT NULL,
  `theme_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `app_id` bigint(19) NULL DEFAULT NULL,
  `img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门户应用 对应风格类型 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_portal_shortcut_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_portal_shortcut_order`;
CREATE TABLE `sys_portal_shortcut_order`  (
  `id` bigint(19) NOT NULL,
  `shortcut_id` bigint(19) NOT NULL,
  `shortcut_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `unit_user_id` bigint(19) NOT NULL,
  `order_no` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门户快捷方式排序' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_portal_shortcut_theme
-- ----------------------------
DROP TABLE IF EXISTS `sys_portal_shortcut_theme`;
CREATE TABLE `sys_portal_shortcut_theme`  (
  `id` bigint(19) NOT NULL,
  `theme_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `shortcut_id` bigint(19) NULL DEFAULT NULL,
  `img` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门户快捷方式对应风格类型 ' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_portal_stat_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_portal_stat_order`;
CREATE TABLE `sys_portal_stat_order`  (
  `id` bigint(19) NOT NULL,
  `stat_id` bigint(19) NOT NULL,
  `stat_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `unit_user_id` bigint(19) NOT NULL,
  `order_no` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '门户统计排序' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(19) NOT NULL COMMENT '角色id',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `remark` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `order_no` int(11) NOT NULL COMMENT '排序号',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  `dept_id` bigint(19) NULL DEFAULT 0 COMMENT '部门id，默认0表示全局公共角色，不能删除',
  `unit_id` bigint(19) NULL DEFAULT NULL COMMENT '单位（企业）id，默认0表示全局公共角色，不能删除',
  `is_delete` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `is_unitadmin` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '是否单位管理员角色 1：是 0：不是',
  `create_user_id` bigint(19) NULL DEFAULT NULL COMMENT '创建角色的用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1442688963272794113, '教师角色', '', 1, '1', '2021-09-28 11:13:47', '2021-10-06 19:44:05', 1425076084770668546, 1425076084770668546, '0', '1', 10086);
INSERT INTO `sys_role` VALUES (1445716409093586945, '学生角色', NULL, 6, '1', '2021-10-06 19:43:47', '2021-10-06 19:43:47', 1425076084770668546, 1425076084770668546, '0', '1', 10086);

-- ----------------------------
-- Table structure for sys_sync_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_sync_log`;
CREATE TABLE `sys_sync_log`  (
  `id` bigint(19) NOT NULL COMMENT '主键id',
  `system_id` bigint(19) NOT NULL COMMENT '系统id',
  `system_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统名称',
  `media_id` bigint(19) NOT NULL COMMENT '机构/用户id',
  `media_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '机构/用户名称',
  `media_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型：1机构 2用户',
  `sync_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '同步类型 1新增2修改3删除',
  `result_code` int(10) NULL DEFAULT NULL COMMENT '同步结果 0成功',
  `result_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '同步结果message',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步日志记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_sync_log_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_sync_log_info`;
CREATE TABLE `sys_sync_log_info`  (
  `id` bigint(19) NOT NULL COMMENT '主键id',
  `sync_log_id` bigint(19) NOT NULL COMMENT '同步日志id',
  `sync_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '同步类型 1新增2修改3删除4',
  `request_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求地址',
  `request_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求数据',
  `result_code` int(10) NULL DEFAULT NULL COMMENT '同步结果 0成功',
  `result_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '同步结果message',
  `sync_time` datetime(0) NULL DEFAULT NULL COMMENT '同步时间',
  `batch_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '批量类型1机构2用户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步日志详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_system_setting
-- ----------------------------
DROP TABLE IF EXISTS `sys_system_setting`;
CREATE TABLE `sys_system_setting`  (
  `id` bigint(19) NOT NULL,
  `logo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统logo',
  `sys_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '系统名称',
  `sms` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录增加短信验证 0：不启用 1：启用',
  `user_lock` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户登录失败次数触发用户锁定 0：不启用 1：启用',
  `user_lock_num` int(5) NULL DEFAULT NULL COMMENT '锁定次数',
  `allow_phone_sign` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '允许手机号作为用户名登录系统 0：不允许 1：允许',
  `user_lifetime` datetime(0) NULL DEFAULT NULL COMMENT '超过有效期用户状态变更为过期，默认2099年12月31日23:59:59',
  `pass_tactics` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '启用密码策略，如果启用联动显示其他配置选项 0：不启用 1：启用',
  `pass_rule` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '0：无 1：字母+数字 2：字母+数字+字符',
  `pass_min_length` int(2) NULL DEFAULT NULL COMMENT '密码最小长度要求，最小长度不超过20',
  `changepass_bytime` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '启用定期改密策略 0：不启用 1：启用',
  `changepass_date` int(5) NULL DEFAULT NULL COMMENT '配置定期改密的时间，精确到天，如：配置5天，表示密码有效期是5天，5天过后需修改密码才可登录',
  `remind_changepass` int(2) NULL DEFAULT NULL COMMENT '启用定期改密后在密码有效期前提醒改密的时间，精确到天，默认0表示不提醒',
  `force_changepass` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '启用后用户首次登录必须修改密码 0：不启用 1：启用',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统设置表，无特殊原因勿做数据操作' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_system_setting
-- ----------------------------
INSERT INTO `sys_system_setting` VALUES (12345678, 'http://127.0.0.1:8087/zongheng-system/storage/download/1384524306897301505', '渝快政', '1', '1', 2, '1', '2034-04-21 20:05:49', '1', '1', 1, '1', 1, 1, '1', '2021-04-15 20:05:57', '2021-05-11 15:07:44');

-- ----------------------------
-- Table structure for sys_unit_extend_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_unit_extend_data`;
CREATE TABLE `sys_unit_extend_data`  (
  `id` bigint(19) NOT NULL COMMENT '数据字典数据id',
  `extend_id` bigint(19) NOT NULL COMMENT '数据字典id',
  `data_unit_id` bigint(19) NOT NULL COMMENT '机构id',
  `extend_key` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据字段名称',
  `extend_value` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据字段值',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '扩展属性组织机构数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_unitinfo
-- ----------------------------
DROP TABLE IF EXISTS `sys_unitinfo`;
CREATE TABLE `sys_unitinfo`  (
  `id` bigint(19) NOT NULL COMMENT '组织机构id',
  `actual` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '机构实体标识 1：实体机构 2：虚拟机构',
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织机构简称',
  `full_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '组织机构全称',
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '每个组织的一个识别编码',
  `parent_id` bigint(19) NOT NULL COMMENT '上级机构id\n            顶级机构的上级id为0',
  `level_code` varchar(96) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '层次编码：四位一级，每次新增时取本级最大号+1',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '机构类别 1：分类 2：单位 3：内部机构',
  `tel` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '即值班电话,办公电话',
  `order_no` int(11) NOT NULL COMMENT '每级重新从10开始增加,增加间隔为5；同级的排序号不能相同',
  `state` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '1:有效 0:无效',
  `unitnote` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `zwdd_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '政务钉钉id',
  `other_sys_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '第三方应用id，（后期扩展需要，暂保留）',
  `unit_address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '单位地址',
  `contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系人',
  `open_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  `is_delete` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `theme` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户首页主题类型',
  `credit_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '统一社会信用代码',
  `gov_division_code` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '机构添加行政区划',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uk_sys_unitinfo_levelcode`(`level_code`) USING BTREE,
  INDEX `uk_sys_unitinfo_parentid`(`parent_id`) USING BTREE,
  INDEX `uk_sys_unitinfo_del`(`is_delete`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '组织机构表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_unitinfo
-- ----------------------------
INSERT INTO `sys_unitinfo` VALUES (1425076084770668546, '1', '重邮', '重庆邮电大学', 'zqs', 0, '0001', '2', NULL, 1, '1', '', NULL, '', '', '', 'fccd0be03f82f6da990f2aee6d9ea114', '2021-10-06 19:41:55', '2021-10-09 15:29:46', '0', '1', NULL, NULL);
INSERT INTO `sys_unitinfo` VALUES (1445715941701320706, '1', '计算机科学与技术学院', '计算机科学与技术学院', NULL, 1425076084770668546, '00010001', '2', NULL, 1, '1', NULL, NULL, '', NULL, NULL, 'fccd0be03f82f6da990f2aee6d9ea114', '2021-10-06 19:41:55', '2021-10-09 15:48:33', '0', '1', NULL, NULL);
INSERT INTO `sys_unitinfo` VALUES (1445716015340716034, '1', '教务处', '教务处', NULL, 1425076084770668546, '00010002', '3', NULL, 6, '1', NULL, NULL, '', NULL, NULL, '323e709ab32507e78c6c9f8bd2f36a70', '2021-10-06 19:42:13', '2021-10-06 19:42:13', '0', '1', NULL, NULL);

-- ----------------------------
-- Table structure for sys_unituser
-- ----------------------------
DROP TABLE IF EXISTS `sys_unituser`;
CREATE TABLE `sys_unituser`  (
  `id` bigint(19) NOT NULL COMMENT '机构人员关系id',
  `dept_id` bigint(19) NOT NULL COMMENT '部门id:用户直接挂靠的处室，科室',
  `unit_id` bigint(19) NOT NULL COMMENT '单位id：用户的直属单位',
  `user_id` bigint(19) NOT NULL COMMENT '用户id',
  `is_main_job` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '主机构标识 1：主职部门  2：兼职部门',
  `join_time` datetime(0) NULL DEFAULT NULL,
  `remark` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `work_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工号',
  `state` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任职状态 1:在职 2:离职 3:转岗',
  `orderno` int(11) NOT NULL COMMENT '排序号：相隔5个号',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业邮箱',
  `tel` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '办公电话',
  `job_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `old_dept_id` bigint(19) NULL DEFAULT NULL COMMENT '转岗保存转岗前的部门id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '该表查询用户在系统中对应的单位组，可能存在多个组织下面\r\n\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_unituser
-- ----------------------------
INSERT INTO `sys_unituser` VALUES (1425076095965265922, 1425076084770668546, 1425076084770668546, 10086, '1', '2021-08-10 21:26:46', NULL, NULL, '1', 1, '2021-08-10 21:26:54', '2021-08-10 21:27:00', NULL, NULL, NULL, NULL);
INSERT INTO `sys_unituser` VALUES (1445716155493384195, 1445715941701320706, 1425076084770668546, 1445716155493384194, '1', '2021-10-06 19:42:25', NULL, NULL, '1', 1, '2021-10-06 19:42:46', '2021-10-06 19:42:46', NULL, NULL, NULL, NULL);
INSERT INTO `sys_unituser` VALUES (1445716318635032579, 1445715941701320706, 1425076084770668546, 1445716318635032578, '1', '2021-10-06 19:42:52', NULL, NULL, '1', 6, '2021-10-06 19:43:25', '2021-10-06 19:43:25', NULL, NULL, NULL, NULL);
INSERT INTO `sys_unituser` VALUES (1445717042676760578, 1445715941701320706, 1425076084770668546, 1445717042676760577, '1', '2021-10-06 19:45:53', NULL, NULL, '1', 11, '2021-10-06 19:46:18', '2021-10-06 19:46:18', NULL, NULL, NULL, NULL);
INSERT INTO `sys_unituser` VALUES (1445717149182722050, 1445716015340716034, 1425076084770668546, 1445717149115613186, '1', '2021-10-06 19:46:20', NULL, NULL, '1', 1, '2021-10-06 19:46:43', '2021-10-06 19:46:43', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_extend
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_extend`;
CREATE TABLE `sys_user_extend`  (
  `id` bigint(19) NOT NULL COMMENT '数据字典id',
  `columns_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段名称',
  `columns_value` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段值',
  `columns_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '字段类型1：文本框 2：下拉列表 3：单选框4：时间组件',
  `is_null` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否必填1：是  0：否 ',
  `is_update` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否可修改1：是  0：否 ',
  `is_unique` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否唯一1：是  0：否 ',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据源 下拉框、单选框等选项复制 例如   {1:男;2:女}',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '状态1：启用0：禁用',
  `remark` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户扩展属性基础表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_extend_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_extend_data`;
CREATE TABLE `sys_user_extend_data`  (
  `id` bigint(19) NOT NULL COMMENT '数据字典数据id',
  `extend_id` bigint(19) NOT NULL COMMENT '数据字典id',
  `data_user_id` bigint(19) NOT NULL COMMENT '数据id\n            dic_type=1时为机构id\n            dic_type=2时为用户id',
  `extend_key` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据字段名称',
  `extend_value` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据字段值',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息扩展属性数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `sys_userinfo`;
CREATE TABLE `sys_userinfo`  (
  `id` bigint(19) NOT NULL,
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '用户类型 1：实体用户（默认）2：虚拟用户',
  `fullname` varchar(54) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户姓名',
  `img` bigint(19) NULL DEFAULT NULL COMMENT '用户头像',
  `account` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `temp_pass_word` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '存取自己编写的可逆密码',
  `tel` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '联系电话',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '账号状态 1：启用（默认） 2：停用  3：过期 4：锁定',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户性别1：男 2：女 3：未知',
  `birthday` date NULL DEFAULT NULL COMMENT '出生日期',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱地址',
  `address` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '家庭地址',
  `remark` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `zwdd_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '钉钉id',
  `other_sys_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '第三方应用id(暂保留)',
  `open_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_card` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `unit_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仅用于返回用户所在部门id，不用于具体业务',
  `password_salt` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码加密key，预留',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  `expired_date` datetime(0) NOT NULL COMMENT '过期时间',
  `update_pass_time` datetime(0) NULL DEFAULT NULL,
  `last_login_time` datetime(0) NULL DEFAULT NULL,
  `is_delete` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `theme` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户首页主题类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_userinfo
-- ----------------------------
INSERT INTO `sys_userinfo` VALUES (10086, '1', '系统管理员', NULL, 'admin', '8da001972fc4f3aefeea717127b1a2c5', 'QWExMjM0NTYyMzY1NDU=', '15521321233', '1', '1', '2021-03-03', '', '', '', '764078', '0', '3', '', '0', '236545', '2021-03-16 15:04:46', '2021-03-16 15:04:49', '2099-07-31 15:05:33', '2021-03-16 15:05:49', '2021-10-09 16:40:40', '0', '1');
INSERT INTO `sys_userinfo` VALUES (1445716155493384194, '1', '项羽', NULL, 'xiangy', '8da001972fc4f3aefeea717127b1a2c5', 'QWExMjM0NTYxNjQ0ODg=', '', '1', '3', NULL, '', '', '', '', '', '84f023012f21eb968f6c9c3ca870076a', '', '', '164488', '2021-10-06 19:42:46', '2021-10-06 19:42:46', '2034-04-21 20:05:49', '2021-10-06 19:42:46', '2021-10-06 19:47:29', '0', '1');
INSERT INTO `sys_userinfo` VALUES (1445716318635032578, '1', '周瑜', NULL, 'zhouy', '8da001972fc4f3aefeea717127b1a2c5', 'QWExMjM0NTYyNzAxMDg=', '', '1', '3', NULL, '', '', '', '', '', '14ced34014bd42c7b7d1403e4c5f74cd', '', '', '270108', '2021-10-06 19:43:25', '2021-10-06 19:43:25', '2034-04-21 20:05:49', '2021-10-06 19:43:25', '2021-10-06 19:43:25', '0', '1');
INSERT INTO `sys_userinfo` VALUES (1445717042676760577, '1', '李白', NULL, 'lib', '8da001972fc4f3aefeea717127b1a2c5', 'QWExMjM0NTY4MTUwNzk=', '', '1', '3', NULL, '', '', '', '', '', '132205b6e90baf8c812b45a8a0093022', '', '', '815079', '2021-10-06 19:46:18', '2021-10-06 19:46:18', '2034-04-21 20:05:49', '2021-10-06 19:46:18', '2021-10-06 19:46:18', '0', '1');
INSERT INTO `sys_userinfo` VALUES (1445717149115613186, '1', '诸葛亮', NULL, 'zhugl', '8da001972fc4f3aefeea717127b1a2c5', 'QWExMjM0NTYzNDIyNTE=', '', '1', '3', NULL, '', '', '', '', '', 'dd0c665648178a75a60fcbb8036dded0', '', '', '342251', '2021-10-06 19:46:43', '2021-10-06 19:46:43', '2034-04-21 20:05:49', '2021-10-06 19:46:43', '2021-10-06 19:46:43', '0', '1');

-- ----------------------------
-- Table structure for sys_userrole
-- ----------------------------
DROP TABLE IF EXISTS `sys_userrole`;
CREATE TABLE `sys_userrole`  (
  `id` bigint(19) NOT NULL COMMENT '用户角色id',
  `unit_user_id` bigint(19) NOT NULL COMMENT '机构用户id',
  `role_id` bigint(19) NOT NULL COMMENT '角色id',
  `order_no` int(11) NOT NULL COMMENT '排序号',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_userrole
-- ----------------------------
INSERT INTO `sys_userrole` VALUES (1445716549250449409, 1445716155493384195, 1445716409093586945, 1, '2021-10-06 19:44:20', '2021-10-06 19:44:20');
INSERT INTO `sys_userrole` VALUES (1445716589830340610, 1445716318635032579, 1445716409093586945, 1, '2021-10-06 19:44:30', '2021-10-06 19:44:30');
INSERT INTO `sys_userrole` VALUES (1445717042676760579, 1445717042676760578, 1445716409093586945, 0, '2021-10-06 19:46:18', '2021-10-06 19:46:18');
INSERT INTO `sys_userrole` VALUES (1445717149182722051, 1445717149182722050, 1442688963272794113, 0, '2021-10-06 19:46:43', '2021-10-06 19:46:43');

-- ----------------------------
-- Table structure for tc_copy_scope
-- ----------------------------
DROP TABLE IF EXISTS `tc_copy_scope`;
CREATE TABLE `tc_copy_scope`  (
  `coyp_id` decimal(19, 0) NOT NULL,
  `task_id` decimal(19, 0) NULL DEFAULT NULL,
  `copy_user_id` decimal(19, 0) NULL DEFAULT NULL,
  `copy_user_name` varchar(54) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`coyp_id`) USING BTREE,
  INDEX `fk_copy_reference_scope`(`task_id`) USING BTREE,
  CONSTRAINT `tc_copy_scope_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tc_worktask` (`task_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '抄送一个人对一个工作任务\r\n如果抄送范围是角色，那么存储所有人信息到此表\r\n将抄送的范围对应的人员信息，记录到此表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tc_hasten_recode
-- ----------------------------
DROP TABLE IF EXISTS `tc_hasten_recode`;
CREATE TABLE `tc_hasten_recode`  (
  `hasten_recode_id` decimal(19, 0) NOT NULL,
  `task_id` decimal(19, 0) NOT NULL,
  `hasten_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1:及时；2:定时（满足corn表达式）',
  `quartz_id` decimal(19, 0) NULL DEFAULT NULL COMMENT '在催办时',
  `hastene_or` decimal(19, 0) NULL DEFAULT NULL,
  `assignee_or` decimal(19, 0) NULL DEFAULT NULL,
  `hasten_time` datetime(0) NULL DEFAULT NULL,
  `hasten_limit_time` datetime(0) NULL DEFAULT NULL,
  `comment_text` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '催办人的评论',
  PRIMARY KEY (`hasten_recode_id`) USING BTREE,
  INDEX `fk_haste_reference_quartz`(`quartz_id`) USING BTREE,
  INDEX `fk_haste_reference_task`(`task_id`) USING BTREE,
  CONSTRAINT `tc_hasten_recode_ibfk_1` FOREIGN KEY (`quartz_id`) REFERENCES `tc_quartz` (`quartz_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '催办记录: 发起催办时将催办信息记录起来' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tc_quartz
-- ----------------------------
DROP TABLE IF EXISTS `tc_quartz`;
CREATE TABLE `tc_quartz`  (
  `quartz_id` decimal(19, 0) NOT NULL,
  `class_name` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `params` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `delflag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`quartz_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'tc_quartz\r\n催办执行定时任务提醒' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tc_worktask
-- ----------------------------
DROP TABLE IF EXISTS `tc_worktask`;
CREATE TABLE `tc_worktask`  (
  `task_id` decimal(19, 0) NOT NULL,
  `task_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务类型，实际中无法指定类型',
  `app_id` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用系统id 对应应用code',
  `app_name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用系统名称',
  `subject` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `task_uuid` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `biz_task_id` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `biz_task_json` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '梳理标准 提供给app传输标准',
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'pc端跳转处理界面url',
  `mobile_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'app端跳转处理界面url',
  `assignee_id` decimal(19, 0) NULL DEFAULT NULL COMMENT '可以是多人[{\"userid\",\"name\"},]',
  `assignee_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assignee_imgid` decimal(19, 0) NULL DEFAULT NULL,
  `creator_id` decimal(19, 0) NULL DEFAULT NULL,
  `creator_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator_imgid` decimal(19, 0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `limit_time` datetime(0) NULL DEFAULT NULL,
  `finish_time` datetime(0) NULL DEFAULT NULL,
  `ponderance_id` decimal(19, 0) NULL DEFAULT NULL COMMENT '1：全部 2：特急 3：加急 4：急件 5：催办件 6：已超期',
  `is_important` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '1：重要 0：不重要\r\n',
  `is_hasten` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1：是 0：否',
  `is_copy` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1：是 0：否',
  `copy_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1、用户 2、单位 3、用户组 4、角色 5、群组',
  `copy_obj_id` decimal(19, 0) NULL DEFAULT NULL,
  `copy_obj_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1：办结、2：未办结、3：撤销(只有未办结)',
  `ext1` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ext3` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ext2` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tc_worktask_his
-- ----------------------------
DROP TABLE IF EXISTS `tc_worktask_his`;
CREATE TABLE `tc_worktask_his`  (
  `task_id` decimal(19, 0) NOT NULL,
  `task_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务类型，实际中无法指定类型',
  `app_id` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用系统id 对应租户id',
  `app_name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用系统名称',
  `subject` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `task_uuid` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `biz_task_id` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `biz_task_json` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '梳理标准 提供给app传输标准',
  `url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'pc端跳转处理界面url',
  `mobile_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'app端跳转处理界面url',
  `assignee_id` decimal(19, 0) NULL DEFAULT NULL COMMENT '可以是多人[{\"userid\",\"name\"},]',
  `assignee_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `assignee_imgid` decimal(19, 0) NULL DEFAULT NULL,
  `creator_id` decimal(19, 0) NULL DEFAULT NULL,
  `creator_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator_imgid` decimal(19, 0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `limit_time` datetime(0) NULL DEFAULT NULL,
  `finish_time` datetime(0) NULL DEFAULT NULL,
  `ponderance_id` decimal(19, 0) NULL DEFAULT NULL COMMENT '1：全部 2：特急 3：加急 4：急件 5：催办件 6：已超期',
  `is_important` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '1：重要 0：不重要\r\n',
  `is_hasten` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1：是 0：否',
  `is_copy` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1：是 0：否',
  `copy_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1、用户 2、单位 3、用户组 4、角色 5、群组',
  `copy_obj_id` decimal(19, 0) NULL DEFAULT NULL,
  `copy_obj_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1：办结、2：未办结、3：撤销(只有未办结)',
  `ext1` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ext3` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ext2` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '保存已办结工作任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for tc_worktask_recode
-- ----------------------------
DROP TABLE IF EXISTS `tc_worktask_recode`;
CREATE TABLE `tc_worktask_recode`  (
  `task_recode_id` decimal(19, 0) NOT NULL,
  `task_id` decimal(19, 0) NULL DEFAULT NULL,
  `subject` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `app_id` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用系统id 对应租户id',
  `app_name` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用系统名称',
  `biz_task_id` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `biz_task_json` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '根据传输字段记录',
  `handle_user_id` decimal(19, 0) NULL DEFAULT NULL,
  `handle_user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `task_state` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '1：办结、2：未办结、3：撤销',
  PRIMARY KEY (`task_recode_id`) USING BTREE,
  INDEX `fk_recode_reference_task`(`task_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '待办任务记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ty_dbrw
-- ----------------------------
DROP TABLE IF EXISTS `ty_dbrw`;
CREATE TABLE `ty_dbrw`  (
  `lngdbrwid` decimal(19, 0) NOT NULL,
  `chrtypeno` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chrtypename` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lngywid` decimal(36, 0) NOT NULL,
  `lngflowinfoid` decimal(19, 0) NOT NULL,
  `chrflowname` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chrworktaskname` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chrbt` varchar(720) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chrgjzd` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chrgqbz` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `dtmfssj` datetime(0) NOT NULL,
  `lngfsrid` decimal(19, 0) NOT NULL,
  `chrfsrxm` varchar(54) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lngfsdwid` decimal(19, 0) NOT NULL,
  `chrfsdwmc` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chrzrlx` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `lngzrid` decimal(19, 0) NOT NULL,
  `chrzrmc` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `chrhtbz` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `lngmjid` decimal(19, 0) NULL DEFAULT NULL,
  `lnghjcdid` decimal(19, 0) NULL DEFAULT NULL,
  `dtmblsx` datetime(0) NULL DEFAULT NULL,
  `dtmywdjsj` datetime(0) NULL DEFAULT NULL,
  `chrzyxbz` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `chrurl` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dtmcksj` datetime(0) NULL DEFAULT NULL,
  `lngtybzjlid` decimal(19, 0) NULL DEFAULT NULL,
  `chrckbz` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0',
  `chrfcbz` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `lngzrcsunitid` decimal(19, 0) NULL DEFAULT NULL,
  `lngzrunitid` decimal(19, 0) NULL DEFAULT NULL,
  `chriscb` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `chrybjbz` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lngworktaskid` bigint(19) NULL DEFAULT NULL,
  `chrsjlwbz` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `lngfsrcsunitid` decimal(19, 0) NULL DEFAULT NULL,
  `chrfsrcsunitname` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lngdqclrid` bigint(19) NULL DEFAULT NULL,
  `chrsjdbbz` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `chrlwdwmc` varchar(90) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `lxtbz` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`lngdbrwid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
