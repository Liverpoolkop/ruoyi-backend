/*
SQLyog Professional v13.1.1 (64 bit)
MySQL - 8.0.40 : Database - ry-vue
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ry-vue` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ry-vue`;

/*Table structure for table `edu_chapter` */

DROP TABLE IF EXISTS `edu_chapter`;

CREATE TABLE `edu_chapter` (
  `chapter_id` bigint NOT NULL AUTO_INCREMENT COMMENT '章节ID',
  `course_id` bigint NOT NULL COMMENT '课程ID',
  `parent_id` bigint DEFAULT '0' COMMENT '父章节ID(0为一级目录)',
  `chapter_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名称',
  `sort` int DEFAULT '0' COMMENT '显示顺序',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`chapter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程章节表';

/*Data for the table `edu_chapter` */

insert  into `edu_chapter`(`chapter_id`,`course_id`,`parent_id`,`chapter_name`,`sort`,`create_time`,`update_time`) values 
(101,10,0,'第一章：函数与极限',1,'2026-01-01 15:33:32',NULL),
(102,10,0,'第二章：导数与微分',2,'2026-01-01 15:33:32',NULL),
(103,10,0,'第三章：微分中值定理',3,'2026-01-01 15:33:32',NULL),
(201,11,0,'第一章：Java 语言概述',1,'2026-01-01 15:23:30',NULL),
(202,11,0,'第二章：基本数据类型与运算符',2,'2026-01-01 15:23:30',NULL),
(203,11,0,'第三章：面向对象编程基础',3,'2026-01-01 15:23:30',NULL),
(204,11,0,'第四章：数组与集合',4,'2026-01-01 15:37:21',NULL),
(205,11,0,'第五章：异常处理',5,'2026-01-01 15:37:21',NULL),
(301,13,0,'第一章：Spring Boot 入门',1,'2026-01-01 15:23:30',NULL),
(302,13,0,'第二章：Web 开发基础',2,'2026-01-01 15:23:30',NULL),
(401,12,0,'Unit 1: College Life',1,'2026-01-01 15:33:32',NULL),
(402,12,0,'Unit 2: Friendship',2,'2026-01-01 15:33:32',NULL),
(501,14,0,'第一章：行列式',1,'2026-01-01 15:33:32',NULL),
(502,14,0,'第二章：矩阵及其运算',2,'2026-01-01 15:33:32',NULL),
(503,10,101,'第一节：函数是什么',1,NULL,NULL),
(504,10,102,'第一节：导数概念',1,'2026-01-01 15:50:57',NULL);

/*Table structure for table `edu_class` */

DROP TABLE IF EXISTS `edu_class`;

CREATE TABLE `edu_class` (
  `class_id` bigint NOT NULL AUTO_INCREMENT COMMENT '班级ID',
  `class_name` varchar(50) NOT NULL COMMENT '班级名称（如：2024级计算机1班）',
  `grade` varchar(20) NOT NULL COMMENT '年级（如：2024级）',
  `major_id` bigint NOT NULL,
  `teacher_id` bigint NOT NULL COMMENT '班主任ID（关联sys_user.user_id）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`class_id`),
  KEY `idx_class_grade_major_id` (`grade`,`major_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='班级信息表';

/*Data for the table `edu_class` */

insert  into `edu_class`(`class_id`,`class_name`,`grade`,`major_id`,`teacher_id`,`status`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(1,'计算机222','22',1,123,NULL,'admin','2025-12-30 15:15:31','admin',NULL),
(3,'计算机11','22',1,2,NULL,'admin','2025-12-30 15:46:11','admin',NULL),
(4,'计算机221','22',1,100,'0','teacher1','2025-12-30 16:27:32','',NULL),
(5,'22计科1班','2022',4,100,'0','teacher1','2025-12-30 16:48:28','',NULL),
(6,'22计科2班','2022',4,100,'0','teacher1','2025-12-30 16:48:28','',NULL),
(7,'22计科01班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(8,'22计科02班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(9,'22计科03班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(10,'22计科04班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(11,'22计科05班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(12,'22计科06班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(13,'22计科07班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(14,'22计科08班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(15,'22计科09班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(16,'22计科10班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(17,'22计科11班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(18,'22计科12班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(19,'22计科13班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(20,'22计科14班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(21,'22计科15班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(22,'22计科16班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(23,'22计科17班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(24,'22计科18班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(25,'22计科19班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(26,'22计科20班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(38,'22计科21班','2022',4,100,'0','teacher1','2025-12-31 10:22:24','',NULL),
(39,'21计算机','21',1,123,'0','admin','2026-01-01 13:26:02','',NULL);

/*Table structure for table `edu_class_course` */

DROP TABLE IF EXISTS `edu_class_course`;

CREATE TABLE `edu_class_course` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '关联ID',
  `class_id` bigint NOT NULL COMMENT '班级ID（关联edu_class.class_id）',
  `course_id` bigint NOT NULL COMMENT '课程ID（关联edu_course.course_id）',
  `create_time` datetime DEFAULT NULL COMMENT '关联时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_class_course` (`class_id`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='班级-课程关联表';

/*Data for the table `edu_class_course` */

/*Table structure for table `edu_class_student` */

DROP TABLE IF EXISTS `edu_class_student`;

CREATE TABLE `edu_class_student` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '关联ID',
  `class_id` bigint NOT NULL COMMENT '班级ID（关联edu_class.class_id）',
  `student_id` bigint NOT NULL COMMENT '学生ID（关联sys_user.user_id）',
  `join_time` datetime DEFAULT NULL COMMENT '加入班级时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '添加人（教师账号）',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_class_student` (`class_id`,`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='班级-学生关联表';

/*Data for the table `edu_class_student` */

insert  into `edu_class_student`(`id`,`class_id`,`student_id`,`join_time`,`create_by`,`create_time`) values 
(1,3,1,NULL,'',NULL),
(3,1,1,NULL,'',NULL),
(4,10,102,NULL,'',NULL),
(5,10,103,NULL,'',NULL),
(6,10,104,NULL,'',NULL),
(7,10,105,NULL,'',NULL),
(8,10,106,NULL,'',NULL),
(9,10,107,NULL,'',NULL),
(10,10,108,NULL,'',NULL),
(11,10,109,NULL,'',NULL),
(12,10,110,NULL,'',NULL),
(13,10,111,NULL,'',NULL),
(14,10,112,NULL,'',NULL),
(15,10,113,NULL,'',NULL),
(16,10,114,NULL,'',NULL),
(17,10,115,NULL,'',NULL),
(18,10,116,NULL,'',NULL),
(19,10,117,NULL,'',NULL),
(20,10,118,NULL,'',NULL),
(21,10,119,NULL,'',NULL),
(22,10,120,NULL,'',NULL),
(23,10,121,NULL,'',NULL),
(24,10,2,NULL,'',NULL),
(25,10,1,NULL,'',NULL),
(26,4,1,NULL,'',NULL),
(27,7,1,NULL,'',NULL),
(28,7,2,NULL,'',NULL),
(29,7,100,NULL,'',NULL),
(30,7,101,NULL,'',NULL),
(31,7,123,NULL,'',NULL);

/*Table structure for table `edu_course` */

DROP TABLE IF EXISTS `edu_course`;

CREATE TABLE `edu_course` (
  `course_id` bigint NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `course_name` varchar(50) NOT NULL COMMENT '课程名称（如：Java程序设计）',
  `major_id` bigint DEFAULT NULL COMMENT '适用专业ID',
  `course_desc` varchar(500) DEFAULT '' COMMENT '课程描述',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `course_img` varchar(500) DEFAULT NULL,
  `lesson_hours` int DEFAULT '0' COMMENT '课时',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='课程信息表';

/*Data for the table `edu_course` */

insert  into `edu_course`(`course_id`,`course_name`,`major_id`,`course_desc`,`status`,`create_time`,`update_time`,`course_img`,`lesson_hours`) values 
(2,'数据结构',NULL,'22','2','2025-12-30 16:16:51','2026-01-01 21:09:27','https://images.unsplash.com/photo-1555066931-4365d14bab8c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',32),
(3,'数据结构2',4,'基础课程','0','2025-12-30 16:48:28','2026-01-01 23:28:24','http://localhost:8080/profile/upload/2026/01/01/2_20260101232812A001.png',32),
(4,'操作系统',4,'核心课程','0','2025-12-30 16:48:28',NULL,'https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',32),
(10,'高等数学 (上)',1,'本课程涵盖微积分基础，适合理工科学生入门。','0','2026-01-01 15:23:30',NULL,'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',64),
(11,'Java 程序设计基础',2,'零基础学习 Java，掌握面向对象编程思想。','0','2026-01-01 15:23:30',NULL,'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',48),
(12,'大学英语视听说',3,'提升英语听说能力，包含丰富视听素材。','0','2026-01-01 15:23:30',NULL,'https://images.unsplash.com/photo-1543269865-cbf427effbad?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',32),
(13,'Spring Boot 实战开发',2,'企业级开发框架，快速构建微服务应用。','0','2026-01-01 15:23:30',NULL,'https://images.unsplash.com/photo-1605379399642-870262d3d051?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',56),
(14,'线性代数',1,'矩阵与向量空间，机器学习必备数学基础。','0','2026-01-01 15:23:30',NULL,'https://images.unsplash.com/photo-1509228468518-180dd4864904?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80',48),
(16,'测试2',NULL,'测试2','0','2026-01-01 20:51:01','2026-01-01 23:28:40','http://localhost:8080/profile/upload/2026/01/01/1_20260101205039A002.png',32),
(17,'测试3',NULL,'','2','2026-01-01 20:58:57','2026-01-01 23:28:33','http://localhost:8080/profile/upload/2026/01/01/screenshot-20251128-135040_20260101205856A001.png',32),
(18,'测试3',NULL,'11','0','2026-01-01 23:33:18',NULL,'http://localhost:8080/profile/upload/2026/01/01/1_20260101233316A002.png',32);

/*Table structure for table `edu_course_student` */

DROP TABLE IF EXISTS `edu_course_student`;

CREATE TABLE `edu_course_student` (
  `course_id` bigint NOT NULL,
  `student_id` bigint NOT NULL,
  `create_by` varchar(64) DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`course_id`,`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `edu_course_student` */

insert  into `edu_course_student`(`course_id`,`student_id`,`create_by`,`create_time`) values 
(2,1,'admin','2026-01-01 20:41:36'),
(2,101,'student1','2025-12-30 16:29:06'),
(3,1,'admin','2026-01-01 14:37:37'),
(4,1,'admin','2026-01-01 13:55:49'),
(10,1,'admin','2026-01-01 16:27:31'),
(10,2,'admin','2026-01-01 19:01:10'),
(10,101,'student1','2026-01-09 10:06:07'),
(10,102,'stu01','2026-01-01 21:41:05'),
(10,103,'stu02','2026-01-09 13:42:48'),
(10,122,'2584054150@qq.com','2026-01-01 16:30:37'),
(10,123,'admin','2026-01-01 19:02:21'),
(10,303,'','2026-01-01 15:23:30'),
(11,1,'admin','2026-01-01 16:41:17'),
(11,102,'stu01','2026-01-01 21:49:08'),
(11,122,'2584054150@qq.com','2026-01-01 16:30:30'),
(11,301,'','2026-01-01 15:23:30'),
(11,302,'','2026-01-01 15:23:30'),
(12,1,'admin','2026-01-01 20:40:36'),
(13,1,'admin','2026-01-01 17:52:13'),
(13,301,'','2026-01-01 15:23:30'),
(14,1,'admin','2026-01-01 17:52:19'),
(16,1,'admin','2026-01-01 21:33:08'),
(16,102,'stu01','2026-01-01 21:34:31'),
(17,1,'admin','2026-01-01 23:32:30');

/*Table structure for table `edu_course_teacher` */

DROP TABLE IF EXISTS `edu_course_teacher`;

CREATE TABLE `edu_course_teacher` (
  `course_id` bigint NOT NULL COMMENT '课程ID',
  `teacher_id` bigint NOT NULL COMMENT '教师ID(sys_user.user_id)',
  PRIMARY KEY (`course_id`,`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程-教师关联表';

/*Data for the table `edu_course_teacher` */

insert  into `edu_course_teacher`(`course_id`,`teacher_id`) values 
(3,2),
(3,100),
(10,1),
(10,100),
(10,201),
(10,202),
(11,201),
(11,202),
(12,203),
(13,202),
(13,203),
(14,201),
(16,123),
(17,1),
(17,2),
(17,100),
(18,100);

/*Table structure for table `edu_major` */

DROP TABLE IF EXISTS `edu_major`;

CREATE TABLE `edu_major` (
  `major_id` bigint NOT NULL AUTO_INCREMENT COMMENT '专业ID',
  `major_name` varchar(50) NOT NULL COMMENT '专业名称（如：计算机科学与技术）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`major_id`),
  UNIQUE KEY `uk_major_name` (`major_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='专业信息表';

/*Data for the table `edu_major` */

insert  into `edu_major`(`major_id`,`major_name`,`status`,`create_time`,`update_time`) values 
(1,'计算机','0','2025-12-30 15:38:15','2026-01-01 13:10:03'),
(2,'网络工程','0','2025-12-30 15:49:40',NULL),
(3,'信息管理','0','2025-12-30 15:49:45','2025-12-30 16:50:08'),
(4,'计算机科学','0','2025-12-30 16:48:11',NULL),
(5,'软件工程','0','2025-12-30 16:48:11',NULL),
(6,'数字媒体艺术','0','2025-12-31 18:00:46',NULL);

/*Table structure for table `edu_video` */

DROP TABLE IF EXISTS `edu_video`;

CREATE TABLE `edu_video` (
  `video_id` bigint NOT NULL AUTO_INCREMENT COMMENT '视频ID',
  `chapter_id` bigint NOT NULL COMMENT '章节ID',
  `course_id` bigint NOT NULL COMMENT '课程ID',
  `video_name` varchar(50) NOT NULL COMMENT '视频名称',
  `video_source_id` varchar(100) DEFAULT NULL COMMENT '云端视频资源',
  `sort` int DEFAULT '0' COMMENT '显示排序',
  `is_free` tinyint(1) DEFAULT '0' COMMENT '是否免费',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='课程视频表';

/*Data for the table `edu_video` */

insert  into `edu_video`(`video_id`,`chapter_id`,`course_id`,`video_name`,`video_source_id`,`sort`,`is_free`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(100,100,2,'1.1 课程介绍',NULL,1,1,'','2026-01-01 14:42:14','',NULL),
(101,100,2,'1.2 环境搭建',NULL,2,0,'','2026-01-01 14:42:14','',NULL),
(102,101,2,'2.1 核心组件',NULL,1,0,'','2026-01-01 14:42:14','',NULL),
(1001,201,11,'1.1 Java 历史与发展',NULL,1,1,'','2026-01-01 15:23:30','',NULL),
(1002,201,11,'1.2 开发环境搭建 (JDK + IDEA)',NULL,2,1,'','2026-01-01 15:23:30','',NULL),
(1003,201,11,'1.3 第一个 Java 程序',NULL,3,0,'','2026-01-01 15:23:30','',NULL),
(1004,202,11,'2.1 变量与常量',NULL,1,0,'','2026-01-01 15:23:30','',NULL),
(1005,202,11,'2.2 基本数据类型',NULL,2,0,'','2026-01-01 15:23:30','',NULL),
(1006,203,11,'3.1 类与对象',NULL,1,0,'','2026-01-01 15:23:30','',NULL),
(1007,204,11,'4.1 数组的定义与使用',NULL,1,0,'','2026-01-01 15:37:21','',NULL),
(1008,204,11,'4.2 ArrayList 集合',NULL,2,0,'','2026-01-01 15:37:21','',NULL),
(1009,205,11,'5.1 try-catch 异常捕获',NULL,1,0,'','2026-01-01 15:37:21','',NULL),
(1010,205,11,'5.2 自定义异常',NULL,2,0,'','2026-01-01 15:37:21','',NULL),
(2001,301,13,'1.1 Spring Boot 简介',NULL,1,1,'','2026-01-01 15:23:30','',NULL),
(2002,301,13,'1.2 快速构建 Spring Boot 项目',NULL,2,1,'','2026-01-01 15:23:30','',NULL),
(2003,302,13,'2.1 RESTful API 设计',NULL,1,0,'','2026-01-01 15:23:30','',NULL),
(10001,503,10,'1.1 映射与函数',NULL,1,1,'','2026-01-01 15:33:32','',NULL),
(10002,503,10,'1.2 数列的极限',NULL,2,0,'','2026-01-01 15:33:32','',NULL),
(10003,504,10,'2.1 导数概念',NULL,1,0,'','2026-01-01 15:33:32','',NULL),
(10004,504,10,'2.2 求导法则',NULL,2,0,'','2026-01-01 15:33:32','',NULL),
(40001,401,12,'Listening: First Day at School',NULL,1,1,'','2026-01-01 15:33:32','',NULL),
(40002,401,12,'Speaking: Introducing Yourself',NULL,2,1,'','2026-01-01 15:33:32','',NULL),
(40003,402,12,'Listening: True Friends',NULL,1,0,'','2026-01-01 15:33:32','',NULL),
(50001,501,14,'1.1 二阶与三阶行列式',NULL,1,1,'','2026-01-01 15:33:32','',NULL),
(50002,501,14,'1.2 全排列与对换',NULL,2,0,'','2026-01-01 15:33:32','',NULL),
(50003,502,14,'2.1 矩阵的概念',NULL,1,0,'','2026-01-01 15:33:32','',NULL);

/*Table structure for table `gen_table` */

DROP TABLE IF EXISTS `gen_table`;

CREATE TABLE `gen_table` (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表';

/*Data for the table `gen_table` */

insert  into `gen_table`(`table_id`,`table_name`,`table_comment`,`sub_table_name`,`sub_table_fk_name`,`class_name`,`tpl_category`,`tpl_web_type`,`package_name`,`module_name`,`business_name`,`function_name`,`function_author`,`gen_type`,`gen_path`,`options`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'edu_course','课程信息表',NULL,NULL,'EduCourse','crud','','com.ruoyi.system','system','course','课程信息','ruoyi','0','/',NULL,'admin','2025-12-31 10:29:08','',NULL,NULL),
(2,'edu_major','专业信息表',NULL,NULL,'EduMajor','crud','element-plus','com.ruoyi.system','system','major','专业信息','moon','0','/','{\"parentMenuId\":\"\"}','admin','2025-12-31 16:27:09','','2025-12-31 16:28:08',NULL),
(3,'edu_class','班级信息表',NULL,NULL,'EduClass','crud','','com.ruoyi.system','system','class','班级信息','ruoyi','0','/',NULL,'admin','2026-01-01 13:29:23','',NULL,NULL);

/*Table structure for table `gen_table_column` */

DROP TABLE IF EXISTS `gen_table_column`;

CREATE TABLE `gen_table_column` (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `sort` int DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表字段';

/*Data for the table `gen_table_column` */

insert  into `gen_table_column`(`column_id`,`table_id`,`column_name`,`column_comment`,`column_type`,`java_type`,`java_field`,`is_pk`,`is_increment`,`is_required`,`is_insert`,`is_edit`,`is_list`,`is_query`,`query_type`,`html_type`,`dict_type`,`sort`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(1,1,'course_id','课程ID','bigint','Long','courseId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-12-31 10:29:08','',NULL),
(2,1,'course_name','课程名称（如：Java程序设计）','varchar(50)','String','courseName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-12-31 10:29:08','',NULL),
(3,1,'teacher_id','授课教师ID（关联sys_user.user_id）','bigint','Long','teacherId','0','0','1','1','1','1','1','EQ','input','',3,'admin','2025-12-31 10:29:08','',NULL),
(4,1,'grade','适用年级','varchar(20)','String','grade','0','0','1','1','1','1','1','EQ','input','',4,'admin','2025-12-31 10:29:08','',NULL),
(5,1,'major_id',NULL,'bigint','Long','majorId','0','0','0','1','1','1','1','EQ','input','',5,'admin','2025-12-31 10:29:08','',NULL),
(6,1,'course_desc','课程描述','varchar(500)','String','courseDesc','0','0','0','1','1','1','1','EQ','textarea','',6,'admin','2025-12-31 10:29:08','',NULL),
(7,1,'status','状态（0正常 1停用）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',7,'admin','2025-12-31 10:29:08','',NULL),
(8,1,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',8,'admin','2025-12-31 10:29:08','',NULL),
(9,1,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',9,'admin','2025-12-31 10:29:08','',NULL),
(10,2,'major_id','专业ID','bigint','Long','majorId','1','1','0','0',NULL,NULL,NULL,'EQ','input','',1,'admin','2025-12-31 16:27:09','','2025-12-31 16:28:08'),
(11,2,'major_name','专业名称（如：计算机科学与技术）','varchar(50)','String','majorName','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2025-12-31 16:27:09','','2025-12-31 16:28:08'),
(12,2,'status','状态（0正常 1停用）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',3,'admin','2025-12-31 16:27:09','','2025-12-31 16:28:08'),
(13,2,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',4,'admin','2025-12-31 16:27:09','','2025-12-31 16:28:08'),
(14,2,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',5,'admin','2025-12-31 16:27:09','','2025-12-31 16:28:08'),
(15,3,'class_id','班级ID','bigint','Long','classId','1','1','0','1',NULL,NULL,NULL,'EQ','input','',1,'admin','2026-01-01 13:29:23','',NULL),
(16,3,'class_name','班级名称（如：2024级计算机1班）','varchar(50)','String','className','0','0','1','1','1','1','1','LIKE','input','',2,'admin','2026-01-01 13:29:23','',NULL),
(17,3,'grade','年级（如：2024级）','varchar(20)','String','grade','0','0','1','1','1','1','1','EQ','input','',3,'admin','2026-01-01 13:29:23','',NULL),
(18,3,'major_id',NULL,'bigint','Long','majorId','0','0','1','1','1','1','1','EQ','input','',4,'admin','2026-01-01 13:29:23','',NULL),
(19,3,'teacher_id','班主任ID（关联sys_user.user_id）','bigint','Long','teacherId','0','0','1','1','1','1','1','EQ','input','',5,'admin','2026-01-01 13:29:23','',NULL),
(20,3,'status','状态（0正常 1停用）','char(1)','String','status','0','0','0','1','1','1','1','EQ','radio','',6,'admin','2026-01-01 13:29:23','',NULL),
(21,3,'create_by','创建人','varchar(64)','String','createBy','0','0','0','1',NULL,NULL,NULL,'EQ','input','',7,'admin','2026-01-01 13:29:23','',NULL),
(22,3,'create_time','创建时间','datetime','Date','createTime','0','0','0','1',NULL,NULL,NULL,'EQ','datetime','',8,'admin','2026-01-01 13:29:23','',NULL),
(23,3,'update_by','更新人','varchar(64)','String','updateBy','0','0','0','1','1',NULL,NULL,'EQ','input','',9,'admin','2026-01-01 13:29:23','',NULL),
(24,3,'update_time','更新时间','datetime','Date','updateTime','0','0','0','1','1',NULL,NULL,'EQ','datetime','',10,'admin','2026-01-01 13:29:23','',NULL);

/*Table structure for table `qrtz_blob_triggers` */

DROP TABLE IF EXISTS `qrtz_blob_triggers`;

CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Blob类型的触发器表';

/*Data for the table `qrtz_blob_triggers` */

/*Table structure for table `qrtz_calendars` */

DROP TABLE IF EXISTS `qrtz_calendars`;

CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='日历信息表';

/*Data for the table `qrtz_calendars` */

/*Table structure for table `qrtz_cron_triggers` */

DROP TABLE IF EXISTS `qrtz_cron_triggers`;

CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Cron类型的触发器表';

/*Data for the table `qrtz_cron_triggers` */

/*Table structure for table `qrtz_fired_triggers` */

DROP TABLE IF EXISTS `qrtz_fired_triggers`;

CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='已触发的触发器表';

/*Data for the table `qrtz_fired_triggers` */

/*Table structure for table `qrtz_job_details` */

DROP TABLE IF EXISTS `qrtz_job_details`;

CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='任务详细信息表';

/*Data for the table `qrtz_job_details` */

/*Table structure for table `qrtz_locks` */

DROP TABLE IF EXISTS `qrtz_locks`;

CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='存储的悲观锁信息表';

/*Data for the table `qrtz_locks` */

/*Table structure for table `qrtz_paused_trigger_grps` */

DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='暂停的触发器表';

/*Data for the table `qrtz_paused_trigger_grps` */

/*Table structure for table `qrtz_scheduler_state` */

DROP TABLE IF EXISTS `qrtz_scheduler_state`;

CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='调度器状态表';

/*Data for the table `qrtz_scheduler_state` */

/*Table structure for table `qrtz_simple_triggers` */

DROP TABLE IF EXISTS `qrtz_simple_triggers`;

CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='简单触发器的信息表';

/*Data for the table `qrtz_simple_triggers` */

/*Table structure for table `qrtz_simprop_triggers` */

DROP TABLE IF EXISTS `qrtz_simprop_triggers`;

CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='同步机制的行锁表';

/*Data for the table `qrtz_simprop_triggers` */

/*Table structure for table `qrtz_triggers` */

DROP TABLE IF EXISTS `qrtz_triggers`;

CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='触发器详细信息表';

/*Data for the table `qrtz_triggers` */

/*Table structure for table `sys_config` */

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='参数配置表';

/*Data for the table `sys_config` */

insert  into `sys_config`(`config_id`,`config_name`,`config_key`,`config_value`,`config_type`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-blue','Y','admin','2025-12-30 13:49:21','',NULL,'蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow'),
(2,'用户管理-账号初始密码','sys.user.initPassword','123456','Y','admin','2025-12-30 13:49:21','',NULL,'初始化密码 123456'),
(3,'主框架页-侧边栏主题','sys.index.sideTheme','theme-dark','Y','admin','2025-12-30 13:49:21','',NULL,'深色主题theme-dark，浅色主题theme-light'),
(4,'账号自助-验证码开关','sys.account.captchaEnabled','true','Y','admin','2025-12-30 13:49:21','',NULL,'是否开启验证码功能（true开启，false关闭）'),
(5,'账号自助-是否开启用户注册功能','sys.account.registerUser','false','Y','admin','2025-12-30 13:49:21','',NULL,'是否开启注册用户功能（true开启，false关闭）'),
(6,'用户登录-黑名单列表','sys.login.blackIPList','','Y','admin','2025-12-30 13:49:21','',NULL,'设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）'),
(7,'用户管理-初始密码修改策略','sys.account.initPasswordModify','1','Y','admin','2025-12-30 13:49:21','',NULL,'0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框'),
(8,'用户管理-账号密码更新周期','sys.account.passwordValidateDays','0','Y','admin','2025-12-30 13:49:21','',NULL,'密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');

/*Table structure for table `sys_dept` */

DROP TABLE IF EXISTS `sys_dept`;

CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门表';

/*Data for the table `sys_dept` */

insert  into `sys_dept`(`dept_id`,`parent_id`,`ancestors`,`dept_name`,`order_num`,`leader`,`phone`,`email`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`) values 
(100,0,'0','若依科技',0,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-30 13:49:21','',NULL),
(101,100,'0,100','深圳总公司',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-30 13:49:21','',NULL),
(102,100,'0,100','长沙分公司',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-30 13:49:21','',NULL),
(103,101,'0,100,101','研发部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-30 13:49:21','',NULL),
(104,101,'0,100,101','市场部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-30 13:49:21','',NULL),
(105,101,'0,100,101','测试部门',3,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-30 13:49:21','',NULL),
(106,101,'0,100,101','财务部门',4,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-30 13:49:21','',NULL),
(107,101,'0,100,101','运维部门',5,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-30 13:49:21','',NULL),
(108,102,'0,100,102','市场部门',1,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-30 13:49:21','',NULL),
(109,102,'0,100,102','财务部门',2,'若依','15888888888','ry@qq.com','0','0','admin','2025-12-30 13:49:21','',NULL);

/*Table structure for table `sys_dict_data` */

DROP TABLE IF EXISTS `sys_dict_data`;

CREATE TABLE `sys_dict_data` (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典数据表';

/*Data for the table `sys_dict_data` */

insert  into `sys_dict_data`(`dict_code`,`dict_sort`,`dict_label`,`dict_value`,`dict_type`,`css_class`,`list_class`,`is_default`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,1,'男','0','sys_user_sex','','','Y','0','admin','2025-12-30 13:49:21','',NULL,'性别男'),
(2,2,'女','1','sys_user_sex','','','N','0','admin','2025-12-30 13:49:21','',NULL,'性别女'),
(3,3,'未知','2','sys_user_sex','','','N','0','admin','2025-12-30 13:49:21','',NULL,'性别未知'),
(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2025-12-30 13:49:21','',NULL,'显示菜单'),
(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2025-12-30 13:49:21','',NULL,'隐藏菜单'),
(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2025-12-30 13:49:21','',NULL,'正常状态'),
(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2025-12-30 13:49:21','',NULL,'停用状态'),
(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2025-12-30 13:49:21','',NULL,'正常状态'),
(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2025-12-30 13:49:21','',NULL,'停用状态'),
(10,1,'默认','DEFAULT','sys_job_group','','','Y','0','admin','2025-12-30 13:49:21','',NULL,'默认分组'),
(11,2,'系统','SYSTEM','sys_job_group','','','N','0','admin','2025-12-30 13:49:21','',NULL,'系统分组'),
(12,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2025-12-30 13:49:21','',NULL,'系统默认是'),
(13,2,'否','N','sys_yes_no','','danger','N','0','admin','2025-12-30 13:49:21','',NULL,'系统默认否'),
(14,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2025-12-30 13:49:21','',NULL,'通知'),
(15,2,'公告','2','sys_notice_type','','success','N','0','admin','2025-12-30 13:49:21','',NULL,'公告'),
(16,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2025-12-30 13:49:21','',NULL,'正常状态'),
(17,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2025-12-30 13:49:21','',NULL,'关闭状态'),
(18,99,'其他','0','sys_oper_type','','info','N','0','admin','2025-12-30 13:49:21','',NULL,'其他操作'),
(19,1,'新增','1','sys_oper_type','','info','N','0','admin','2025-12-30 13:49:21','',NULL,'新增操作'),
(20,2,'修改','2','sys_oper_type','','info','N','0','admin','2025-12-30 13:49:21','',NULL,'修改操作'),
(21,3,'删除','3','sys_oper_type','','danger','N','0','admin','2025-12-30 13:49:21','',NULL,'删除操作'),
(22,4,'授权','4','sys_oper_type','','primary','N','0','admin','2025-12-30 13:49:21','',NULL,'授权操作'),
(23,5,'导出','5','sys_oper_type','','warning','N','0','admin','2025-12-30 13:49:21','',NULL,'导出操作'),
(24,6,'导入','6','sys_oper_type','','warning','N','0','admin','2025-12-30 13:49:21','',NULL,'导入操作'),
(25,7,'强退','7','sys_oper_type','','danger','N','0','admin','2025-12-30 13:49:21','',NULL,'强退操作'),
(26,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2025-12-30 13:49:21','',NULL,'生成操作'),
(27,9,'清空数据','9','sys_oper_type','','danger','N','0','admin','2025-12-30 13:49:21','',NULL,'清空操作'),
(28,1,'成功','0','sys_common_status','','primary','N','0','admin','2025-12-30 13:49:21','',NULL,'正常状态'),
(29,2,'失败','1','sys_common_status','','danger','N','0','admin','2025-12-30 13:49:21','',NULL,'停用状态');

/*Table structure for table `sys_dict_type` */

DROP TABLE IF EXISTS `sys_dict_type`;

CREATE TABLE `sys_dict_type` (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典类型表';

/*Data for the table `sys_dict_type` */

insert  into `sys_dict_type`(`dict_id`,`dict_name`,`dict_type`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'用户性别','sys_user_sex','0','admin','2025-12-30 13:49:21','',NULL,'用户性别列表'),
(2,'菜单状态','sys_show_hide','0','admin','2025-12-30 13:49:21','',NULL,'菜单状态列表'),
(3,'系统开关','sys_normal_disable','0','admin','2025-12-30 13:49:21','',NULL,'系统开关列表'),
(4,'任务状态','sys_job_status','0','admin','2025-12-30 13:49:21','',NULL,'任务状态列表'),
(5,'任务分组','sys_job_group','0','admin','2025-12-30 13:49:21','',NULL,'任务分组列表'),
(6,'系统是否','sys_yes_no','0','admin','2025-12-30 13:49:21','',NULL,'系统是否列表'),
(7,'通知类型','sys_notice_type','0','admin','2025-12-30 13:49:21','',NULL,'通知类型列表'),
(8,'通知状态','sys_notice_status','0','admin','2025-12-30 13:49:21','',NULL,'通知状态列表'),
(9,'操作类型','sys_oper_type','0','admin','2025-12-30 13:49:21','',NULL,'操作类型列表'),
(10,'系统状态','sys_common_status','0','admin','2025-12-30 13:49:21','',NULL,'登录状态列表');

/*Table structure for table `sys_job` */

DROP TABLE IF EXISTS `sys_job`;

CREATE TABLE `sys_job` (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='定时任务调度表';

/*Data for the table `sys_job` */

insert  into `sys_job`(`job_id`,`job_name`,`job_group`,`invoke_target`,`cron_expression`,`misfire_policy`,`concurrent`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'系统默认（无参）','DEFAULT','ryTask.ryNoParams','0/10 * * * * ?','3','1','1','admin','2025-12-30 13:49:21','',NULL,''),
(2,'系统默认（有参）','DEFAULT','ryTask.ryParams(\'ry\')','0/15 * * * * ?','3','1','1','admin','2025-12-30 13:49:21','',NULL,''),
(3,'系统默认（多参）','DEFAULT','ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)','0/20 * * * * ?','3','1','1','admin','2025-12-30 13:49:21','',NULL,'');

/*Table structure for table `sys_job_log` */

DROP TABLE IF EXISTS `sys_job_log`;

CREATE TABLE `sys_job_log` (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='定时任务调度日志表';

/*Data for the table `sys_job_log` */

/*Table structure for table `sys_logininfor` */

DROP TABLE IF EXISTS `sys_logininfor`;

CREATE TABLE `sys_logininfor` (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`),
  KEY `idx_sys_logininfor_s` (`status`),
  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统访问记录';

/*Data for the table `sys_logininfor` */

insert  into `sys_logininfor`(`info_id`,`user_name`,`ipaddr`,`login_location`,`browser`,`os`,`status`,`msg`,`login_time`) values 
(100,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2025-12-30 13:52:32'),
(101,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2025-12-30 14:28:03'),
(102,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2025-12-30 14:28:16'),
(103,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2025-12-30 14:45:08'),
(104,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2025-12-30 14:45:11'),
(105,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2025-12-30 15:02:18'),
(106,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2025-12-30 15:02:21'),
(107,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2025-12-30 16:24:49'),
(108,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2025-12-30 16:24:55'),
(109,'teacher1','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2025-12-30 16:25:06'),
(110,'teacher1','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2025-12-30 16:27:49'),
(111,'student1','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','1','用户不存在/密码错误','2025-12-30 16:28:04'),
(112,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2025-12-30 16:28:12'),
(113,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2025-12-30 16:28:27'),
(114,'student1','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2025-12-30 16:28:40'),
(115,'student1','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2025-12-30 16:46:41'),
(116,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2025-12-30 16:46:43'),
(117,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2025-12-30 16:50:45'),
(118,'student1','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2025-12-30 16:50:57'),
(119,'student1','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2025-12-30 16:52:18'),
(120,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2025-12-30 16:52:22'),
(121,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2025-12-31 10:09:16'),
(122,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2025-12-31 13:16:51'),
(123,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2025-12-31 16:24:32'),
(124,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2025-12-31 17:27:26'),
(125,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 10:00:35'),
(126,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 10:10:30'),
(127,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 10:12:39'),
(128,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 10:20:43'),
(129,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 10:23:40'),
(130,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','1','验证码错误','2026-01-01 10:24:42'),
(131,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 10:24:49'),
(132,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 10:24:58'),
(133,'2584054150@qq.com','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','注册成功','2026-01-01 11:25:52'),
(134,'moon','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','1','用户不存在/密码错误','2026-01-01 11:26:06'),
(135,'2584054150@qq.com','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 11:26:20'),
(136,'2584054150@qq.com','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 11:29:11'),
(137,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 11:30:59'),
(138,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 11:32:24'),
(139,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 11:35:01'),
(140,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 13:07:02'),
(141,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 14:10:57'),
(142,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 14:18:40'),
(143,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 14:35:49'),
(144,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 14:35:58'),
(145,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 14:36:06'),
(146,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 14:37:36'),
(147,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 14:51:51'),
(148,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 15:13:57'),
(149,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 15:22:03'),
(150,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 15:22:47'),
(151,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 15:23:42'),
(152,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 15:24:27'),
(153,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 15:25:46'),
(154,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','1','验证码错误','2026-01-01 15:25:51'),
(155,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 15:25:53'),
(156,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 15:26:29'),
(157,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 15:29:45'),
(158,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 15:30:41'),
(159,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 15:32:02'),
(160,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 15:53:35'),
(161,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 15:56:18'),
(162,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 15:57:56'),
(163,'teacher_li','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','1','用户不存在/密码错误','2026-01-01 15:58:05'),
(164,'teacher_li','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','1','验证码错误','2026-01-01 15:58:10'),
(165,'teacher_li','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','1','用户不存在/密码错误','2026-01-01 15:58:13'),
(166,'teacher_li','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','1','验证码错误','2026-01-01 15:58:46'),
(167,'teacher_li','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','1','用户不存在/密码错误','2026-01-01 15:58:49'),
(168,'李华老师','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','1','验证码错误','2026-01-01 15:59:27'),
(169,'李华老师','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','1','用户不存在/密码错误','2026-01-01 15:59:30'),
(170,'teacher1','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 16:00:50'),
(171,'teacher1','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 16:27:19'),
(172,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 16:27:29'),
(173,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 16:28:16'),
(174,'2584054150@qq.com','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 16:28:23'),
(175,'2584054150@qq.com','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 16:30:49'),
(176,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 16:30:55'),
(177,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 16:44:08'),
(178,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 16:44:12'),
(179,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 18:45:40'),
(180,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 18:45:56'),
(181,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 20:37:40'),
(182,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 20:39:05'),
(183,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 20:39:07'),
(184,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 20:39:16'),
(185,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 20:39:20'),
(186,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 21:25:29'),
(187,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 21:25:32'),
(188,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 21:26:49'),
(189,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 21:26:52'),
(190,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 21:29:10'),
(191,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 21:29:14'),
(192,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 21:29:47'),
(193,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','1','验证码错误','2026-01-01 21:29:50'),
(194,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 21:29:53'),
(195,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 21:33:34'),
(196,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','1','验证码错误','2026-01-01 21:33:39'),
(197,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 21:33:43'),
(198,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 21:34:05'),
(199,'stu01','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 21:34:14'),
(200,'stu01','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 21:37:16'),
(201,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 21:37:19'),
(202,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 21:40:50'),
(203,'stu01','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 21:41:01'),
(204,'stu01','127.0.0.1','内网IP','Edge 143','Mac OS 10.15.7','0','登录成功','2026-01-01 21:42:46'),
(205,'stu01','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 21:43:14'),
(206,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 21:43:18'),
(207,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 22:38:19'),
(208,'admin','127.0.0.1','内网IP','Edge 143','Mac OS 10.15.7','0','登录成功','2026-01-01 22:41:25'),
(209,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 22:44:39'),
(210,'stu01','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 22:44:50'),
(211,'admin','127.0.0.1','内网IP','Edge 143','Mac OS 10.15.7','0','退出成功','2026-01-01 23:11:08'),
(212,'stu01','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 23:11:25'),
(213,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 23:13:28'),
(214,'stu01','127.0.0.1','内网IP','Edge 143','Mac OS 10.15.7','0','登录成功','2026-01-01 23:39:26'),
(215,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 23:40:47'),
(216,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 23:41:14'),
(217,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','退出成功','2026-01-01 23:41:19'),
(218,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','1','用户不存在/密码错误','2026-01-01 23:41:40'),
(219,'admin','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','1','用户不存在/密码错误','2026-01-01 23:41:45'),
(220,'stu01','127.0.0.1','内网IP','Chrome 139','Mac OS >=10.15.7','0','登录成功','2026-01-01 23:41:57'),
(221,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-05 20:41:35'),
(222,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-08 09:51:22'),
(223,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-08 10:45:08'),
(224,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-08 12:29:10'),
(225,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-08 12:29:14'),
(226,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-08 12:29:18'),
(227,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','1','验证码错误','2026-01-08 12:29:21'),
(228,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-08 12:29:24'),
(229,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-08 12:29:25'),
(230,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-08 12:29:27'),
(231,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-08 12:29:29'),
(232,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-08 15:53:04'),
(233,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-08 15:57:33'),
(234,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-08 15:57:43'),
(235,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-08 16:12:53'),
(236,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-08 16:12:59'),
(237,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-08 22:08:22'),
(238,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 09:18:48'),
(239,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 10:05:47'),
(240,'student1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 10:06:00'),
(241,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 10:37:20'),
(242,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 11:06:15'),
(243,'student1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 11:06:23'),
(244,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 12:00:16'),
(245,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 12:02:53'),
(246,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','1','验证码错误','2026-01-09 12:03:01'),
(247,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 12:03:03'),
(248,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 12:13:23'),
(249,'student1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 12:13:34'),
(250,'student1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 12:16:50'),
(251,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 12:16:59'),
(252,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 12:25:38'),
(253,'student1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 12:25:45'),
(254,'student1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 12:26:10'),
(255,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 12:26:21'),
(256,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 12:26:31'),
(257,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 12:26:49'),
(258,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 12:27:22'),
(259,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 12:27:27'),
(260,'student1','127.0.0.1','内网IP','Edge 143','Windows >=10','1','验证码错误','2026-01-09 12:27:48'),
(261,'student1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 12:27:51'),
(262,'student1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 12:28:30'),
(263,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 12:28:42'),
(264,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 12:28:49'),
(265,'stu01','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 12:29:23'),
(266,'stu01','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 12:29:34'),
(267,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 12:29:46'),
(268,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 12:31:04'),
(269,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 12:31:12'),
(270,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 13:36:37'),
(271,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 13:42:31'),
(272,'stu02','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 13:42:40'),
(273,'stu02','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 13:42:58'),
(274,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 13:43:09'),
(275,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 15:57:16'),
(276,'stu01','127.0.0.1','内网IP','Edge 143','Windows >=10','1','验证码错误','2026-01-09 15:57:28'),
(277,'stu01','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 15:57:30'),
(278,'stu01','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 15:59:08'),
(279,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 15:59:20'),
(280,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 16:01:24'),
(281,'stu01','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 16:01:31'),
(282,'stu01','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 16:07:16'),
(283,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 16:07:23'),
(284,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 16:18:36'),
(285,'stu01','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 16:18:43'),
(286,'stu01','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 16:19:48'),
(287,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','1','用户不存在/密码错误','2026-01-09 16:19:58'),
(288,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','1','验证码错误','2026-01-09 16:20:07'),
(289,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 16:20:10'),
(290,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 16:41:02'),
(291,'stu01','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 16:41:10'),
(292,'stu01','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 16:42:06'),
(293,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 16:42:14'),
(294,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 16:55:56'),
(295,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 16:56:03'),
(296,'admin','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 17:05:03'),
(297,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 17:05:09'),
(298,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 17:14:32'),
(299,'stu01','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 17:14:37'),
(300,'stu01','127.0.0.1','内网IP','Edge 143','Windows >=10','0','退出成功','2026-01-09 17:18:26'),
(301,'teacher1','127.0.0.1','内网IP','Edge 143','Windows >=10','0','登录成功','2026-01-09 17:18:36');

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由名称',
  `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2035 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单权限表';

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`menu_id`,`menu_name`,`parent_id`,`order_num`,`path`,`component`,`query`,`route_name`,`is_frame`,`is_cache`,`menu_type`,`visible`,`status`,`perms`,`icon`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'系统管理',0,7,'system',NULL,'','',1,0,'M','0','0','','system','admin','2025-12-30 13:49:21','admin','2026-01-01 17:20:30','系统管理目录'),
(2,'系统监控',0,8,'monitor',NULL,'','',1,0,'M','0','0','','monitor','admin','2025-12-30 13:49:21','admin','2026-01-01 17:20:07','系统监控目录'),
(3,'系统工具',0,8,'tool',NULL,'','',1,0,'M','0','0','','tool','admin','2025-12-30 13:49:21','admin','2026-01-01 17:29:28','系统工具目录'),
(4,'若依官网',0,7,'http://ruoyi.vip',NULL,'','',0,0,'M','0','0','','guide','admin','2025-12-30 13:49:21','admin','2026-01-01 17:20:41','若依官网地址'),
(100,'用户管理',0,1,'sys-user','system/user/index','','',1,0,'C','0','0','system:user:list','user','admin','2025-12-30 13:49:21','admin','2026-01-01 17:21:10','用户管理菜单'),
(101,'角色管理',0,2,'sys-role','system/role/index','','',1,0,'C','0','0','system:role:list','peoples','admin','2025-12-30 13:49:21','admin','2026-01-01 17:17:28','角色管理菜单'),
(102,'菜单管理',1,3,'menu','system/menu/index','','',1,0,'C','0','0','system:menu:list','tree-table','admin','2025-12-30 13:49:21','',NULL,'菜单管理菜单'),
(103,'部门管理',1,4,'dept','system/dept/index','','',1,0,'C','0','0','system:dept:list','tree','admin','2025-12-30 13:49:21','',NULL,'部门管理菜单'),
(104,'岗位管理',1,5,'post','system/post/index','','',1,0,'C','0','0','system:post:list','post','admin','2025-12-30 13:49:21','',NULL,'岗位管理菜单'),
(105,'字典管理',1,6,'dict','system/dict/index','','',1,0,'C','0','0','system:dict:list','dict','admin','2025-12-30 13:49:21','',NULL,'字典管理菜单'),
(106,'参数设置',1,7,'config','system/config/index','','',1,0,'C','0','0','system:config:list','edit','admin','2025-12-30 13:49:21','',NULL,'参数设置菜单'),
(107,'通知公告',1,8,'notice','system/notice/index','','',1,0,'C','0','0','system:notice:list','message','admin','2025-12-30 13:49:21','',NULL,'通知公告菜单'),
(108,'日志管理',1,9,'log','','','',1,0,'M','0','0','','log','admin','2025-12-30 13:49:21','',NULL,'日志管理菜单'),
(109,'在线用户',2,1,'online','monitor/online/index','','',1,0,'C','0','0','monitor:online:list','online','admin','2025-12-30 13:49:21','',NULL,'在线用户菜单'),
(110,'定时任务',2,2,'job','monitor/job/index','','',1,0,'C','0','0','monitor:job:list','job','admin','2025-12-30 13:49:21','',NULL,'定时任务菜单'),
(111,'数据监控',2,3,'druid','monitor/druid/index','','',1,0,'C','0','0','monitor:druid:list','druid','admin','2025-12-30 13:49:21','',NULL,'数据监控菜单'),
(112,'服务监控',2,4,'server','monitor/server/index','','',1,0,'C','0','0','monitor:server:list','server','admin','2025-12-30 13:49:21','',NULL,'服务监控菜单'),
(113,'缓存监控',2,5,'cache','monitor/cache/index','','',1,0,'C','0','0','monitor:cache:list','redis','admin','2025-12-30 13:49:21','',NULL,'缓存监控菜单'),
(114,'缓存列表',2,6,'cacheList','monitor/cache/list','','',1,0,'C','0','0','monitor:cache:list','redis-list','admin','2025-12-30 13:49:21','',NULL,'缓存列表菜单'),
(115,'表单构建',3,1,'build','tool/build/index','','',1,0,'C','0','0','tool:build:list','build','admin','2025-12-30 13:49:21','',NULL,'表单构建菜单'),
(116,'代码生成',3,2,'gen','tool/gen/index','','',1,0,'C','0','0','tool:gen:list','code','admin','2025-12-30 13:49:21','',NULL,'代码生成菜单'),
(117,'系统接口',3,3,'swagger','tool/swagger/index','','',1,0,'C','0','0','tool:swagger:list','swagger','admin','2025-12-30 13:49:21','',NULL,'系统接口菜单'),
(500,'操作日志',108,1,'operlog','monitor/operlog/index','','',1,0,'C','0','0','monitor:operlog:list','form','admin','2025-12-30 13:49:21','',NULL,'操作日志菜单'),
(501,'登录日志',108,2,'logininfor','monitor/logininfor/index','','',1,0,'C','0','0','monitor:logininfor:list','logininfor','admin','2025-12-30 13:49:21','',NULL,'登录日志菜单'),
(1000,'用户查询',100,1,'','','','',1,0,'F','0','0','system:user:query','#','admin','2025-12-30 13:49:21','',NULL,''),
(1001,'用户新增',100,2,'','','','',1,0,'F','0','0','system:user:add','#','admin','2025-12-30 13:49:21','',NULL,''),
(1002,'用户修改',100,3,'','','','',1,0,'F','0','0','system:user:edit','#','admin','2025-12-30 13:49:21','',NULL,''),
(1003,'用户删除',100,4,'','','','',1,0,'F','0','0','system:user:remove','#','admin','2025-12-30 13:49:21','',NULL,''),
(1004,'用户导出',100,5,'','','','',1,0,'F','0','0','system:user:export','#','admin','2025-12-30 13:49:21','',NULL,''),
(1005,'用户导入',100,6,'','','','',1,0,'F','0','0','system:user:import','#','admin','2025-12-30 13:49:21','',NULL,''),
(1006,'重置密码',100,7,'','','','',1,0,'F','0','0','system:user:resetPwd','#','admin','2025-12-30 13:49:21','',NULL,''),
(1007,'角色查询',101,1,'','','','',1,0,'F','0','0','system:role:query','#','admin','2025-12-30 13:49:21','',NULL,''),
(1008,'角色新增',101,2,'','','','',1,0,'F','0','0','system:role:add','#','admin','2025-12-30 13:49:21','',NULL,''),
(1009,'角色修改',101,3,'','','','',1,0,'F','0','0','system:role:edit','#','admin','2025-12-30 13:49:21','',NULL,''),
(1010,'角色删除',101,4,'','','','',1,0,'F','0','0','system:role:remove','#','admin','2025-12-30 13:49:21','',NULL,''),
(1011,'角色导出',101,5,'','','','',1,0,'F','0','0','system:role:export','#','admin','2025-12-30 13:49:21','',NULL,''),
(1012,'菜单查询',102,1,'','','','',1,0,'F','0','0','system:menu:query','#','admin','2025-12-30 13:49:21','',NULL,''),
(1013,'菜单新增',102,2,'','','','',1,0,'F','0','0','system:menu:add','#','admin','2025-12-30 13:49:21','',NULL,''),
(1014,'菜单修改',102,3,'','','','',1,0,'F','0','0','system:menu:edit','#','admin','2025-12-30 13:49:21','',NULL,''),
(1015,'菜单删除',102,4,'','','','',1,0,'F','0','0','system:menu:remove','#','admin','2025-12-30 13:49:21','',NULL,''),
(1016,'部门查询',103,1,'','','','',1,0,'F','0','0','system:dept:query','#','admin','2025-12-30 13:49:21','',NULL,''),
(1017,'部门新增',103,2,'','','','',1,0,'F','0','0','system:dept:add','#','admin','2025-12-30 13:49:21','',NULL,''),
(1018,'部门修改',103,3,'','','','',1,0,'F','0','0','system:dept:edit','#','admin','2025-12-30 13:49:21','',NULL,''),
(1019,'部门删除',103,4,'','','','',1,0,'F','0','0','system:dept:remove','#','admin','2025-12-30 13:49:21','',NULL,''),
(1020,'岗位查询',104,1,'','','','',1,0,'F','0','0','system:post:query','#','admin','2025-12-30 13:49:21','',NULL,''),
(1021,'岗位新增',104,2,'','','','',1,0,'F','0','0','system:post:add','#','admin','2025-12-30 13:49:21','',NULL,''),
(1022,'岗位修改',104,3,'','','','',1,0,'F','0','0','system:post:edit','#','admin','2025-12-30 13:49:21','',NULL,''),
(1023,'岗位删除',104,4,'','','','',1,0,'F','0','0','system:post:remove','#','admin','2025-12-30 13:49:21','',NULL,''),
(1024,'岗位导出',104,5,'','','','',1,0,'F','0','0','system:post:export','#','admin','2025-12-30 13:49:21','',NULL,''),
(1025,'字典查询',105,1,'#','','','',1,0,'F','0','0','system:dict:query','#','admin','2025-12-30 13:49:21','',NULL,''),
(1026,'字典新增',105,2,'#','','','',1,0,'F','0','0','system:dict:add','#','admin','2025-12-30 13:49:21','',NULL,''),
(1027,'字典修改',105,3,'#','','','',1,0,'F','0','0','system:dict:edit','#','admin','2025-12-30 13:49:21','',NULL,''),
(1028,'字典删除',105,4,'#','','','',1,0,'F','0','0','system:dict:remove','#','admin','2025-12-30 13:49:21','',NULL,''),
(1029,'字典导出',105,5,'#','','','',1,0,'F','0','0','system:dict:export','#','admin','2025-12-30 13:49:21','',NULL,''),
(1030,'参数查询',106,1,'#','','','',1,0,'F','0','0','system:config:query','#','admin','2025-12-30 13:49:21','',NULL,''),
(1031,'参数新增',106,2,'#','','','',1,0,'F','0','0','system:config:add','#','admin','2025-12-30 13:49:21','',NULL,''),
(1032,'参数修改',106,3,'#','','','',1,0,'F','0','0','system:config:edit','#','admin','2025-12-30 13:49:21','',NULL,''),
(1033,'参数删除',106,4,'#','','','',1,0,'F','0','0','system:config:remove','#','admin','2025-12-30 13:49:21','',NULL,''),
(1034,'参数导出',106,5,'#','','','',1,0,'F','0','0','system:config:export','#','admin','2025-12-30 13:49:21','',NULL,''),
(1035,'公告查询',107,1,'#','','','',1,0,'F','0','0','system:notice:query','#','admin','2025-12-30 13:49:21','',NULL,''),
(1036,'公告新增',107,2,'#','','','',1,0,'F','0','0','system:notice:add','#','admin','2025-12-30 13:49:21','',NULL,''),
(1037,'公告修改',107,3,'#','','','',1,0,'F','0','0','system:notice:edit','#','admin','2025-12-30 13:49:21','',NULL,''),
(1038,'公告删除',107,4,'#','','','',1,0,'F','0','0','system:notice:remove','#','admin','2025-12-30 13:49:21','',NULL,''),
(1039,'操作查询',500,1,'#','','','',1,0,'F','0','0','monitor:operlog:query','#','admin','2025-12-30 13:49:21','',NULL,''),
(1040,'操作删除',500,2,'#','','','',1,0,'F','0','0','monitor:operlog:remove','#','admin','2025-12-30 13:49:21','',NULL,''),
(1041,'日志导出',500,3,'#','','','',1,0,'F','0','0','monitor:operlog:export','#','admin','2025-12-30 13:49:21','',NULL,''),
(1042,'登录查询',501,1,'#','','','',1,0,'F','0','0','monitor:logininfor:query','#','admin','2025-12-30 13:49:21','',NULL,''),
(1043,'登录删除',501,2,'#','','','',1,0,'F','0','0','monitor:logininfor:remove','#','admin','2025-12-30 13:49:21','',NULL,''),
(1044,'日志导出',501,3,'#','','','',1,0,'F','0','0','monitor:logininfor:export','#','admin','2025-12-30 13:49:21','',NULL,''),
(1045,'账户解锁',501,4,'#','','','',1,0,'F','0','0','monitor:logininfor:unlock','#','admin','2025-12-30 13:49:21','',NULL,''),
(1046,'在线查询',109,1,'#','','','',1,0,'F','0','0','monitor:online:query','#','admin','2025-12-30 13:49:21','',NULL,''),
(1047,'批量强退',109,2,'#','','','',1,0,'F','0','0','monitor:online:batchLogout','#','admin','2025-12-30 13:49:21','',NULL,''),
(1048,'单条强退',109,3,'#','','','',1,0,'F','0','0','monitor:online:forceLogout','#','admin','2025-12-30 13:49:21','',NULL,''),
(1049,'任务查询',110,1,'#','','','',1,0,'F','0','0','monitor:job:query','#','admin','2025-12-30 13:49:21','',NULL,''),
(1050,'任务新增',110,2,'#','','','',1,0,'F','0','0','monitor:job:add','#','admin','2025-12-30 13:49:21','',NULL,''),
(1051,'任务修改',110,3,'#','','','',1,0,'F','0','0','monitor:job:edit','#','admin','2025-12-30 13:49:21','',NULL,''),
(1052,'任务删除',110,4,'#','','','',1,0,'F','0','0','monitor:job:remove','#','admin','2025-12-30 13:49:21','',NULL,''),
(1053,'状态修改',110,5,'#','','','',1,0,'F','0','0','monitor:job:changeStatus','#','admin','2025-12-30 13:49:21','',NULL,''),
(1054,'任务导出',110,6,'#','','','',1,0,'F','0','0','monitor:job:export','#','admin','2025-12-30 13:49:21','',NULL,''),
(1055,'生成查询',116,1,'#','','','',1,0,'F','0','0','tool:gen:query','#','admin','2025-12-30 13:49:21','',NULL,''),
(1056,'生成修改',116,2,'#','','','',1,0,'F','0','0','tool:gen:edit','#','admin','2025-12-30 13:49:21','',NULL,''),
(1057,'生成删除',116,3,'#','','','',1,0,'F','0','0','tool:gen:remove','#','admin','2025-12-30 13:49:21','',NULL,''),
(1058,'导入代码',116,4,'#','','','',1,0,'F','0','0','tool:gen:import','#','admin','2025-12-30 13:49:21','',NULL,''),
(1059,'预览代码',116,5,'#','','','',1,0,'F','0','0','tool:gen:preview','#','admin','2025-12-30 13:49:21','',NULL,''),
(1060,'生成代码',116,6,'#','','','',1,0,'F','0','0','tool:gen:code','#','admin','2025-12-30 13:49:21','',NULL,''),
(2019,'专业信息',0,3,'major','edu/major/index',NULL,'',1,0,'C','0','0','edu:major:list','build','admin','2025-12-31 16:36:57','admin','2026-01-01 17:23:45','专业信息菜单'),
(2020,'专业信息查询',2019,1,'#','',NULL,'',1,0,'F','0','0','edu:major:query','#','admin','2025-12-31 16:36:58','',NULL,''),
(2021,'专业信息新增',2019,2,'#','',NULL,'',1,0,'F','0','0','edu:major:add','#','admin','2025-12-31 16:36:58','',NULL,''),
(2022,'专业信息修改',2019,3,'#','',NULL,'',1,0,'F','0','0','edu:major:edit','#','admin','2025-12-31 16:36:58','',NULL,''),
(2023,'专业信息删除',2019,4,'#','',NULL,'',1,0,'F','0','0','edu:major:remove','#','admin','2025-12-31 16:36:58','',NULL,''),
(2024,'专业信息导出',2019,5,'#','',NULL,'',1,0,'F','0','0','edu:major:export','#','admin','2025-12-31 16:36:58','',NULL,''),
(2025,'班级管理',0,4,'class','edu/class/index',NULL,'',1,0,'C','0','0','edu:class:list','peoples','admin','2025-12-31 17:05:15','admin','2026-01-01 17:23:57','班级管理菜单'),
(2026,'班级查询',2025,1,'#','',NULL,'',1,0,'F','0','0','edu:class:query','#','admin','2025-12-31 17:05:15','',NULL,''),
(2027,'班级新增',2025,2,'#','',NULL,'',1,0,'F','0','0','edu:class:add','#','admin','2025-12-31 17:05:15','',NULL,''),
(2028,'班级修改',2025,3,'#','',NULL,'',1,0,'F','0','0','edu:class:edit','#','admin','2025-12-31 17:05:15','',NULL,''),
(2029,'班级删除',2025,4,'#','',NULL,'',1,0,'F','0','0','edu:class:remove','#','admin','2025-12-31 17:05:15','',NULL,''),
(2030,'班级导出',2025,5,'#','',NULL,'',1,0,'F','0','0','edu:class:export','#','admin','2025-12-31 17:05:15','',NULL,''),
(2031,'班级邀请',2025,6,'#','',NULL,'',1,0,'F','0','0','edu:class:invite','#','admin','2025-12-31 17:05:15','',NULL,''),
(2032,'班级加入',2025,7,'#','',NULL,'',1,0,'F','0','0','edu:class:join','#','admin','2025-12-31 17:05:15','',NULL,''),
(2033,'课程管理',0,5,'course','edu/course/index',NULL,'',1,0,'C','0','0','edu:course:list','tree','admin','2025-12-31 17:05:15','admin','2026-01-01 17:24:09','课程管理菜单');

/*Table structure for table `sys_notice` */

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='通知公告表';

/*Data for the table `sys_notice` */

insert  into `sys_notice`(`notice_id`,`notice_title`,`notice_type`,`notice_content`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'温馨提醒：2018-07-01 若依新版本发布啦','2','新版本内容','0','admin','2025-12-30 13:49:21','',NULL,'管理员'),
(2,'维护通知：2018-07-01 若依系统凌晨维护','1','维护内容','0','admin','2025-12-30 13:49:21','',NULL,'管理员'),
(10,'期末考试时间','2','12月31号期末考试','0','teacher1','2026-01-01 16:26:57','',NULL,'course:10');

/*Table structure for table `sys_oper_log` */

DROP TABLE IF EXISTS `sys_oper_log`;

CREATE TABLE `sys_oper_log` (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
  `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
  `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
  `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`),
  KEY `idx_sys_oper_log_bt` (`business_type`),
  KEY `idx_sys_oper_log_s` (`status`),
  KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志记录';

/*Data for the table `sys_oper_log` */

insert  into `sys_oper_log`(`oper_id`,`title`,`business_type`,`method`,`request_method`,`operator_type`,`oper_name`,`dept_name`,`oper_url`,`oper_ip`,`oper_location`,`oper_param`,`json_result`,`status`,`error_msg`,`oper_time`,`cost_time`) values 
(100,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/4','127.0.0.1','内网IP','4 ','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2025-12-30 15:55:13',8),
(101,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.resetPwd()','PUT',1,'admin','研发部门','/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-30 16:28:24',70),
(102,'用户管理',5,'com.ruoyi.web.controller.system.SysUserController.export()','POST',1,'admin','研发部门','/system/user/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2025-12-31 10:46:59',475),
(103,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"edu_major\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-31 16:27:09',49),
(104,'代码生成',2,'com.ruoyi.generator.controller.GenController.editSave()','PUT',1,'admin','研发部门','/tool/gen','127.0.0.1','内网IP','{\"businessName\":\"major\",\"className\":\"EduMajor\",\"columns\":[{\"capJavaField\":\"MajorId\",\"columnComment\":\"专业ID\",\"columnId\":10,\"columnName\":\"major_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-31 16:27:09\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"majorId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MajorName\",\"columnComment\":\"专业名称（如：计算机科学与技术）\",\"columnId\":11,\"columnName\":\"major_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-31 16:27:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"majorName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"状态（0正常 1停用）\",\"columnId\":12,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-31 16:27:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"status\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":13,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2025-12-31 16:27:09\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"cr','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-31 16:28:08',23),
(105,'代码生成',8,'com.ruoyi.generator.controller.GenController.batchGenCode()','GET',1,'admin','研发部门','/tool/gen/batchGenCode','127.0.0.1','内网IP','{\"tables\":\"edu_major\"}',NULL,0,NULL,'2025-12-31 16:28:11',100),
(106,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/major/index\",\"createTime\":\"2025-12-31 16:36:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"专业信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"major\",\"perms\":\"system:major:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-31 16:58:48',17),
(107,'菜单管理',1,'com.ruoyi.web.controller.system.SysMenuController.add()','POST',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"教育管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"edu\",\"status\":\"0\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-31 17:46:17',18),
(108,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/major/index\",\"createTime\":\"2025-12-31 16:36:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"专业信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2034,\"path\":\"major\",\"perms\":\"system:major:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-31 17:46:26',17),
(109,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/class/index\",\"createTime\":\"2025-12-31 17:05:15\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"班级管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2034,\"path\":\"class\",\"perms\":\"system:class:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-31 17:46:37',11),
(110,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/course/index\",\"createTime\":\"2025-12-31 17:05:15\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2034,\"path\":\"course\",\"perms\":\"system:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-31 17:46:48',14),
(111,'专业信息',1,'com.ruoyi.web.controller.edu.EduMajorController.add()','POST',1,'admin','研发部门','/edu/major','127.0.0.1','内网IP','{\"createTime\":\"2025-12-31 18:00:46\",\"majorId\":6,\"majorName\":\"数字媒体艺术\",\"params\":{}} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-31 18:00:46',17),
(112,'专业信息',2,'com.ruoyi.web.controller.edu.EduMajorController.edit()','PUT',1,'admin','研发部门','/edu/major','127.0.0.1','内网IP','{\"majorId\":1,\"params\":{},\"status\":\"1\",\"updateTime\":\"2025-12-31 18:02:28\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-31 18:02:28',9),
(113,'专业信息',2,'com.ruoyi.web.controller.edu.EduMajorController.edit()','PUT',1,'admin','研发部门','/edu/major','127.0.0.1','内网IP','{\"majorId\":1,\"params\":{},\"status\":\"0\",\"updateTime\":\"2025-12-31 18:02:31\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-31 18:02:32',8),
(114,'专业信息',2,'com.ruoyi.web.controller.edu.EduMajorController.edit()','PUT',1,'admin','研发部门','/edu/major','127.0.0.1','内网IP','{\"majorId\":1,\"params\":{},\"status\":\"1\",\"updateTime\":\"2025-12-31 18:03:26\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-31 18:03:26',5),
(115,'专业信息',2,'com.ruoyi.web.controller.edu.EduMajorController.edit()','PUT',1,'admin','研发部门','/edu/major','127.0.0.1','内网IP','{\"majorId\":1,\"params\":{},\"status\":\"0\",\"updateTime\":\"2025-12-31 18:03:28\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2025-12-31 18:03:28',7),
(116,'专业信息',2,'com.ruoyi.web.controller.edu.EduMajorController.edit()','PUT',1,'admin','研发部门','/edu/major','127.0.0.1','内网IP','{\"majorId\":1,\"params\":{},\"status\":\"1\",\"updateTime\":\"2026-01-01 10:00:50\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 10:00:50',6),
(117,'专业信息',2,'com.ruoyi.web.controller.edu.EduMajorController.edit()','PUT',1,'admin','研发部门','/edu/major','127.0.0.1','内网IP','{\"majorId\":1,\"params\":{},\"status\":\"0\",\"updateTime\":\"2026-01-01 10:00:54\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 10:00:54',7),
(118,'用户管理',5,'com.ruoyi.web.controller.system.SysUserController.export()','POST',1,'admin','研发部门','/system/user/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2026-01-01 10:04:16',210),
(119,'专业信息',2,'com.ruoyi.web.controller.edu.EduMajorController.edit()','PUT',1,'admin','研发部门','/edu/major','127.0.0.1','内网IP','{\"majorId\":1,\"params\":{},\"status\":\"1\",\"updateTime\":\"2026-01-01 13:09:56\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 13:09:56',13),
(120,'专业信息',2,'com.ruoyi.web.controller.edu.EduMajorController.edit()','PUT',1,'admin','研发部门','/edu/major','127.0.0.1','内网IP','{\"majorId\":1,\"params\":{},\"status\":\"0\",\"updateTime\":\"2026-01-01 13:10:03\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 13:10:03',4),
(121,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.changeStatus()','PUT',1,'admin','研发部门','/system/user/changeStatus','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":100} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 13:23:38',10),
(122,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.changeStatus()','PUT',1,'admin','研发部门','/system/user/changeStatus','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 13:23:49',6),
(123,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"陈老师\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"status\":\"1\",\"userId\":123,\"userName\":\"陈老师\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 13:25:16',78),
(124,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.changeStatus()','PUT',1,'admin','研发部门','/system/user/changeStatus','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":123} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 13:25:27',5),
(125,'代码生成',6,'com.ruoyi.generator.controller.GenController.importTableSave()','POST',1,'admin','研发部门','/tool/gen/importTable','127.0.0.1','内网IP','{\"tables\":\"edu_class\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 13:29:23',42),
(126,'用户头像',2,'com.ruoyi.web.controller.system.SysProfileController.avatar()','POST',1,'admin','研发部门','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/ca7c1aa4f4ee46ceb45c635b726b1fc8.png\",\"code\":200}',0,NULL,'2026-01-01 16:39:12',43),
(127,'用户头像',2,'com.ruoyi.web.controller.system.SysProfileController.avatar()','POST',1,'admin','研发部门','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/9d2e52759c66460fb6f7f958ef7fa30b.png\",\"code\":200}',0,NULL,'2026-01-01 16:44:21',9),
(128,'用户头像',2,'com.ruoyi.web.controller.system.SysProfileController.avatar()','POST',1,'admin','研发部门','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/de74060280c74195b1a0398fc3eff7e6.png\",\"code\":200}',0,NULL,'2026-01-01 16:48:36',20),
(129,'用户头像',2,'com.ruoyi.web.controller.system.SysProfileController.avatar()','POST',1,'admin','研发部门','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/9d9d5fd96b2b495ab8f8f1bcf42bee09.png\",\"code\":200}',0,NULL,'2026-01-01 16:49:56',35),
(130,'用户头像',2,'com.ruoyi.web.controller.system.SysProfileController.avatar()','POST',1,'admin','研发部门','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/3d6f329902cb4d638e49eb398b78acd2.png\",\"code\":200}',0,NULL,'2026-01-01 16:51:02',30),
(131,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'admin','研发部门','/system/user/profile','127.0.0.1','内网IP','{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"0\"} ','{\"msg\":\"请输入密码以确认修改\",\"code\":500}',0,NULL,'2026-01-01 16:52:06',7),
(132,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'admin','研发部门','/system/user/profile','127.0.0.1','内网IP','{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"} ','{\"msg\":\"请输入密码以确认修改\",\"code\":500}',0,NULL,'2026-01-01 16:52:14',1),
(133,'用户头像',2,'com.ruoyi.web.controller.system.SysProfileController.avatar()','POST',1,'admin','研发部门','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/e104de6d7e6e4ecf8f00b113cef34bc5.png\",\"code\":200}',0,NULL,'2026-01-01 16:53:56',27),
(134,'用户头像',2,'com.ruoyi.web.controller.system.SysProfileController.avatar()','POST',1,'admin','研发部门','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/7302791d42d3429289cc8d809ade9c1e.png\",\"code\":200}',0,NULL,'2026-01-01 16:55:31',6),
(135,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'admin','研发部门','/system/user/profile','127.0.0.1','内网IP','{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"} ','{\"msg\":\"修改个人信息失败，密码错误\",\"code\":500}',0,NULL,'2026-01-01 16:55:48',0),
(136,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'admin','研发部门','/system/user/profile','127.0.0.1','内网IP','{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"} ','{\"msg\":\"修改个人信息失败，密码错误\",\"code\":500}',0,NULL,'2026-01-01 16:55:53',1),
(137,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'admin','研发部门','/system/user/profile','127.0.0.1','内网IP','{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"} ','{\"msg\":\"修改个人信息失败，密码错误\",\"code\":500}',0,NULL,'2026-01-01 16:56:02',0),
(138,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'admin','研发部门','/system/user/profile','127.0.0.1','内网IP','{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"} ','{\"msg\":\"修改个人信息失败，密码错误\",\"code\":500}',0,NULL,'2026-01-01 16:56:05',0),
(139,'用户头像',2,'com.ruoyi.web.controller.system.SysProfileController.avatar()','POST',1,'admin','研发部门','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/d9580affa840497c855c473a0fa9e51c.png\",\"code\":200}',0,NULL,'2026-01-01 16:57:49',24),
(140,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'admin','研发部门','/system/user/profile','127.0.0.1','内网IP','{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 16:59:01',88),
(141,'用户头像',2,'com.ruoyi.web.controller.system.SysProfileController.avatar()','POST',1,'admin','研发部门','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/494fdee3ee9944e3a225e387635749f1.png\",\"code\":200}',0,NULL,'2026-01-01 17:00:28',24),
(142,'用户管理',5,'com.ruoyi.web.controller.system.SysUserController.export()','POST',1,'admin','研发部门','/system/user/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2026-01-01 17:09:26',1014),
(143,'用户管理',5,'com.ruoyi.web.controller.system.SysUserController.export()','POST',1,'admin','研发部门','/system/user/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2026-01-01 17:13:07',481),
(144,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:17:24',12),
(145,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:17:28',6),
(146,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:17:38',9),
(147,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:17:48',10),
(148,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:17:55',7),
(149,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/major/index\",\"createTime\":\"2025-12-31 16:36:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"专业信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"major\",\"perms\":\"edu:major:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:19:16',11),
(150,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/class/index\",\"createTime\":\"2025-12-31 17:05:15\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"班级管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"class\",\"perms\":\"edu:class:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:19:32',8),
(151,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/course/index\",\"createTime\":\"2025-12-31 17:05:15\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"course\",\"perms\":\"edu:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:19:49',6),
(152,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/major/index\",\"createTime\":\"2025-12-31 16:36:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"专业信息\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"major\",\"perms\":\"edu:major:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:20:03',10),
(153,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:20:07',10),
(154,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/class/index\",\"createTime\":\"2025-12-31 17:05:15\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"班级管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"class\",\"perms\":\"edu:class:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:20:17',7),
(155,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-12-31 17:46:17\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2034,\"menuName\":\"教育管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"edu\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:20:21',11),
(156,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/course/index\",\"createTime\":\"2025-12-31 17:05:15\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"course\",\"perms\":\"edu:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:20:26',7),
(157,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:20:30',6),
(158,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/4','127.0.0.1','内网IP','4 ','{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}',0,NULL,'2026-01-01 17:20:36',7),
(159,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:20:41',9),
(160,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:21:10',5),
(161,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/major/index\",\"createTime\":\"2025-12-31 16:36:57\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"专业信息\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"major\",\"perms\":\"edu:major:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:23:45',8),
(162,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/class/index\",\"createTime\":\"2025-12-31 17:05:15\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"班级管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"class\",\"perms\":\"edu:class:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:23:57',9),
(163,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"component\":\"edu/course/index\",\"createTime\":\"2025-12-31 17:05:15\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"course\",\"perms\":\"edu:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:24:09',8),
(164,'用户管理',1,'com.ruoyi.web.controller.system.SysUserController.add()','POST',1,'admin','研发部门','/system/user','127.0.0.1','内网IP','{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"221002206\",\"params\":{},\"postIds\":[],\"roleIds\":[101],\"status\":\"0\",\"userId\":304,\"userName\":\"221002206\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:27:18',89),
(165,'菜单管理',2,'com.ruoyi.web.controller.system.SysMenuController.edit()','PUT',1,'admin','研发部门','/system/menu','127.0.0.1','内网IP','{\"children\":[],\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:29:28',10),
(166,'菜单管理',3,'com.ruoyi.web.controller.system.SysMenuController.remove()','DELETE',1,'admin','研发部门','/system/menu/2034','127.0.0.1','内网IP','2034 ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:30:06',8),
(167,'用户管理',4,'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()','PUT',1,'admin','研发部门','/system/user/authRole','127.0.0.1','内网IP','{\"roleIds\":\"2,100\",\"userId\":\"2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:31:42',7),
(168,'用户管理',4,'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()','PUT',1,'admin','研发部门','/system/user/authRole','127.0.0.1','内网IP','{\"roleIds\":\"2,100,101\",\"userId\":\"2\"}','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 17:31:54',9),
(169,'用户头像',2,'com.ruoyi.web.controller.system.SysProfileController.avatar()','POST',1,'admin','研发部门','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/acd7b01b8ead4a6f9b8b52b41f183ece.png\",\"code\":200}',0,NULL,'2026-01-01 21:20:32',22),
(170,'用户头像',2,'com.ruoyi.web.controller.system.SysProfileController.avatar()','POST',1,'admin','研发部门','/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/c9945d3d13bf4d0bb80fd95a7c318795.png\",\"code\":200}',0,NULL,'2026-01-01 21:22:33',5),
(171,'用户管理',2,'com.ruoyi.web.controller.system.SysUserController.resetPwd()','PUT',1,'admin','研发部门','/system/user/resetPwd','127.0.0.1','内网IP','{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":102} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 21:34:01',72),
(172,'用户头像',2,'com.ruoyi.web.controller.system.SysProfileController.avatar()','POST',1,'stu01',NULL,'/system/user/profile/avatar','127.0.0.1','内网IP','','{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/27c93afb66cb441d95b718f6f67a0346.png\",\"code\":200}',0,NULL,'2026-01-01 21:34:46',7),
(173,'个人信息',2,'com.ruoyi.web.controller.system.SysProfileController.updateProfile()','PUT',1,'stu01',NULL,'/system/user/profile','127.0.0.1','内网IP','{\"admin\":false,\"email\":\"1231234123@qq.com\",\"nickName\":\"stu01\",\"params\":{},\"phonenumber\":\"13684843434\",\"sex\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 21:35:21',75),
(174,'角色管理',3,'com.ruoyi.web.controller.system.SysRoleController.remove()','DELETE',1,'admin','研发部门','/system/role/2','127.0.0.1','内网IP','[2] ',NULL,1,'普通角色已分配,不能删除','2026-01-01 21:52:44',16),
(175,'角色管理',4,'com.ruoyi.web.controller.system.SysRoleController.cancelAuthUser()','PUT',1,'admin','研发部门','/system/role/authUser/cancel','127.0.0.1','内网IP','{\"roleId\":2,\"userId\":2} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 21:52:49',9),
(176,'角色管理',3,'com.ruoyi.web.controller.system.SysRoleController.remove()','DELETE',1,'admin','研发部门','/system/role/2','127.0.0.1','内网IP','[2] ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-01 21:52:55',18),
(177,'用户管理',5,'com.ruoyi.web.controller.system.SysUserController.export()','POST',1,'admin','研发部门','/system/user/export','127.0.0.1','内网IP','{\"pageSize\":\"10\",\"pageNum\":\"1\"}',NULL,0,NULL,'2026-01-01 22:46:04',34),
(178,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"category\":\"other\",\"courseId\":18,\"createBy\":\"teacher1\",\"createTime\":\"2026-01-09 12:21:55\",\"filePath\":\"/profile/upload/2026/01/09/google密码_20260109122151A001.txt\",\"fileSize\":\"36.00B\",\"originName\":\"google密码_20260109122151A001.txt\",\"params\":{},\"resourceName\":\"6\",\"status\":\"0\"} ',NULL,1,'\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'category\' in \'field list\'\r\n### The error may exist in file [E:\\Tools\\Trae CN\\xm\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\edu\\TeachingResourceMapper.xml]\r\n### The error may involve com.ruoyi.edu.mapper.TeachingResourceMapper.insertTeachingResource-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into teaching_resource          ( course_id,             resource_name,             category,             file_path,             file_size,             origin_name,             status,             create_by,             create_time )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'category\' in \'field list\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'category\' in \'field list\'','2026-01-09 12:21:56',373),
(179,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"category\":\"other\",\"courseId\":18,\"createBy\":\"teacher1\",\"createTime\":\"2026-01-09 12:25:22\",\"filePath\":\"/profile/upload/2026/01/09/google密码_20260109122151A001.txt\",\"fileSize\":\"36.00B\",\"originName\":\"google密码_20260109122151A001.txt\",\"params\":{},\"resourceId\":100,\"resourceName\":\"6\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 12:25:22',34),
(180,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"category\":\"other\",\"courseId\":10,\"createBy\":\"teacher1\",\"createTime\":\"2026-01-09 12:27:02\",\"filePath\":\"/profile/upload/2026/01/09/google密码_20260109122659A002.txt\",\"fileSize\":\"36.00B\",\"originName\":\"google密码_20260109122659A002.txt\",\"params\":{},\"resourceId\":101,\"resourceName\":\"5\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 12:27:02',25),
(181,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'admin','研发部门','/education/resource','127.0.0.1','内网IP','{\"category\":\"image\",\"courseId\":10,\"createBy\":\"admin\",\"createTime\":\"2026-01-09 13:49:58\",\"filePath\":\"/profile/upload/2026/01/09/bjfu_20260109134955A003.png\",\"fileSize\":\"78.87KB\",\"originName\":\"bjfu_20260109134955A003.png\",\"params\":{},\"resourceId\":102,\"resourceName\":\"123\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 13:49:58',26),
(182,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'admin','研发部门','/education/resource','127.0.0.1','内网IP','{\"category\":\"video\",\"courseId\":10,\"createBy\":\"admin\",\"createTime\":\"2026-01-09 14:15:52\",\"filePath\":\"/profile/upload/2026/01/09/魔方_20260109141549A001.mp4\",\"fileSize\":\"8.42MB\",\"originName\":\"魔方_20260109141549A001.mp4\",\"params\":{},\"resourceId\":103,\"resourceName\":\"1\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 14:15:52',248),
(183,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'admin','研发部门','/education/resource','127.0.0.1','内网IP','{\"category\":\"video\",\"courseId\":10,\"createBy\":\"admin\",\"createTime\":\"2026-01-09 14:16:05\",\"filePath\":\"/profile/upload/2026/01/09/还原_20260109141600A002.mp4\",\"fileSize\":\"25.92MB\",\"originName\":\"还原_20260109141600A002.mp4\",\"params\":{},\"resourceId\":104,\"resourceName\":\"2312\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 14:16:05',8),
(184,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'admin','研发部门','/education/resource','127.0.0.1','内网IP','{\"category\":\"image\",\"courseId\":10,\"createBy\":\"admin\",\"createTime\":\"2026-01-09 15:21:27\",\"filePath\":\"/profile/upload/2026/01/09/bjfu_20260109152125A001.png\",\"fileSize\":\"78.87KB\",\"originName\":\"bjfu_20260109152125A001.png\",\"params\":{},\"resourceId\":105,\"resourceName\":\"321312\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 15:21:27',200),
(185,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'admin','研发部门','/education/resource','127.0.0.1','内网IP','{\"category\":\"other\",\"courseId\":10,\"createBy\":\"admin\",\"createTime\":\"2026-01-09 15:24:55\",\"filePath\":\"/profile/upload/2026/01/09/google密码_20260109152453A002.txt\",\"fileSize\":\"36.00B\",\"originName\":\"google密码_20260109152453A002.txt\",\"params\":{},\"resourceId\":106,\"resourceName\":\"32131231\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 15:24:55',20),
(186,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"category\":\"video\",\"courseId\":10,\"createBy\":\"teacher1\",\"createTime\":\"2026-01-09 16:00:58\",\"filePath\":\"/profile/upload/2026/01/09/20.基础篇-二次开发-口味改造_20260109160051A001.mp4\",\"fileSize\":\"111.20MB\",\"originName\":\"20.基础篇-二次开发-口味改造_20260109160051A001.mp4\",\"params\":{},\"resourceId\":107,\"resourceName\":\"sb\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 16:00:58',27),
(187,'教学资源',3,'com.ruoyi.web.controller.edu.TeachingResourceController.remove()','DELETE',1,'teacher1','若依科技','/education/resource/106','127.0.0.1','内网IP','[106] ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 16:01:01',10),
(188,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"category\":\"video\",\"courseId\":10,\"createBy\":\"teacher1\",\"createTime\":\"2026-01-09 16:07:37\",\"filePath\":\"/profile/upload/2026/01/09/07.基础篇-功能详解-监控相关_20260109160735A002.mp4\",\"fileSize\":\"15.69MB\",\"originName\":\"07.基础篇-功能详解-监控相关_20260109160735A002.mp4\",\"params\":{},\"resourceId\":108,\"resourceName\":\"31312\",\"status\":\"1\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 16:07:37',27),
(189,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"category\":\"video\",\"courseId\":10,\"createBy\":\"teacher1\",\"createTime\":\"2026-01-09 16:07:55\",\"filePath\":\"/profile/upload/2026/01/09/07.基础篇-功能详解-监控相关_20260109160753A003.mp4\",\"fileSize\":\"15.69MB\",\"originName\":\"07.基础篇-功能详解-监控相关_20260109160753A003.mp4\",\"params\":{},\"resourceId\":109,\"resourceName\":\"123\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 16:07:55',12),
(190,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"category\":\"video\",\"courseId\":10,\"createBy\":\"teacher1\",\"createTime\":\"2026-01-09 16:08:04\",\"filePath\":\"/profile/upload/2026/01/09/10.基础篇-功能详解-代码生成_20260109160803A004.mp4\",\"fileSize\":\"22.29MB\",\"originName\":\"10.基础篇-功能详解-代码生成_20260109160803A004.mp4\",\"params\":{},\"resourceId\":110,\"resourceName\":\"123\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 16:08:04',12),
(191,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"category\":\"doc\",\"courseId\":10,\"createBy\":\"teacher1\",\"createTime\":\"2026-01-09 16:40:17\",\"filePath\":\"/profile/upload/2026/01/09/基础应用篇_20260109164015A005.pptx\",\"fileSize\":\"9.62MB\",\"originName\":\"基础应用篇_20260109164015A005.pptx\",\"params\":{},\"resourceId\":111,\"resourceName\":\"20260109164015A005\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 16:40:17',25),
(192,'教学资源',3,'com.ruoyi.web.controller.edu.TeachingResourceController.remove()','DELETE',1,'teacher1','若依科技','/education/resource/110','127.0.0.1','内网IP','[110] ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 16:40:49',17),
(193,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'admin','研发部门','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":109,\"status\":\"0\",\"updateTime\":\"2026-01-09 16:56:07\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 16:56:07',23),
(194,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'admin','研发部门','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":108,\"status\":\"0\",\"updateTime\":\"2026-01-09 16:56:08\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 16:56:08',11),
(195,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'admin','研发部门','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":111,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:04:52\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:04:52',41),
(196,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":109,\"status\":\"1\"} ','{\"msg\":\"您没有权限修改该资源\",\"code\":500}',0,NULL,'2026-01-09 17:05:13',0),
(197,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":109,\"status\":\"1\"} ','{\"msg\":\"您没有权限修改该资源\",\"code\":500}',0,NULL,'2026-01-09 17:05:15',1),
(198,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":111,\"status\":\"0\",\"updateTime\":\"2026-01-09 17:07:28\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:07:28',31),
(199,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":109,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:07:29\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:07:29',7),
(200,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":111,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:07:30\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:07:30',21),
(201,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":108,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:07:31\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:07:31',20),
(202,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":111,\"status\":\"0\",\"updateTime\":\"2026-01-09 17:07:50\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:07:50',20),
(203,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":109,\"status\":\"0\",\"updateTime\":\"2026-01-09 17:07:51\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:07:51',10),
(204,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":108,\"status\":\"0\",\"updateTime\":\"2026-01-09 17:07:52\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:07:52',19),
(205,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":111,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:07:53\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:07:53',21),
(206,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":109,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:07:53\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:07:53',23),
(207,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":109,\"status\":\"0\",\"updateTime\":\"2026-01-09 17:07:53\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:07:53',7),
(208,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":109,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:07:54\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:07:54',9),
(209,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":108,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:07:54\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:07:54',19),
(210,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":107,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:07:55\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:07:55',14),
(211,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":105,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:07:55\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:07:56',28),
(212,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":104,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:07:56\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:07:56',20),
(213,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":103,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:07:56\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:07:56',11),
(214,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":102,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:07:57\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:07:57',19),
(215,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"category\":\"doc\",\"courseId\":10,\"createBy\":\"teacher1\",\"createTime\":\"2026-01-09 17:09:05\",\"filePath\":\"/profile/upload/2026/01/09/基础应用篇_20260109170903A002.pptx\",\"fileSize\":\"9.62MB\",\"originName\":\"基础应用篇_20260109170903A002.pptx\",\"params\":{},\"resourceId\":112,\"resourceName\":\"20260109170903A002\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:09:05',21),
(216,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"category\":\"doc\",\"courseId\":10,\"createBy\":\"teacher1\",\"createTime\":\"2026-01-09 17:12:20\",\"filePath\":\"/profile/upload/2026/01/09/基础应用篇_20260109171218A003.pptx\",\"fileSize\":\"9.62MB\",\"originName\":\"基础应用篇_20260109171218A003.pptx\",\"params\":{},\"resourceId\":113,\"resourceName\":\"基础应用篇\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:12:20',28),
(217,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"category\":\"other\",\"courseId\":10,\"createBy\":\"teacher1\",\"createTime\":\"2026-01-09 17:12:32\",\"filePath\":\"/profile/upload/2026/01/09/AI+若依框架在线笔记_20260109171231A004.txt\",\"fileSize\":\"343.00B\",\"originName\":\"AI+若依框架在线笔记_20260109171231A004.txt\",\"params\":{},\"resourceId\":114,\"resourceName\":\"AI+若依框架在线笔记\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:12:32',13),
(218,'教学资源',3,'com.ruoyi.web.controller.edu.TeachingResourceController.remove()','DELETE',1,'teacher1','若依科技','/education/resource/112','127.0.0.1','内网IP','[112] ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:12:36',11),
(219,'教学资源',3,'com.ruoyi.web.controller.edu.TeachingResourceController.remove()','DELETE',1,'teacher1','若依科技','/education/resource/111','127.0.0.1','内网IP','[111] ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:12:38',7),
(220,'教学资源',3,'com.ruoyi.web.controller.edu.TeachingResourceController.remove()','DELETE',1,'teacher1','若依科技','/education/resource/109','127.0.0.1','内网IP','[109] ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:12:40',17),
(221,'教学资源',3,'com.ruoyi.web.controller.edu.TeachingResourceController.remove()','DELETE',1,'teacher1','若依科技','/education/resource/108','127.0.0.1','内网IP','[108] ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:12:42',7),
(222,'教学资源',3,'com.ruoyi.web.controller.edu.TeachingResourceController.remove()','DELETE',1,'teacher1','若依科技','/education/resource/107','127.0.0.1','内网IP','[107] ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:12:43',6),
(223,'教学资源',3,'com.ruoyi.web.controller.edu.TeachingResourceController.remove()','DELETE',1,'teacher1','若依科技','/education/resource/105','127.0.0.1','内网IP','[105] ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:12:44',19),
(224,'教学资源',3,'com.ruoyi.web.controller.edu.TeachingResourceController.remove()','DELETE',1,'teacher1','若依科技','/education/resource/101','127.0.0.1','内网IP','[101] ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:12:46',18),
(225,'教学资源',3,'com.ruoyi.web.controller.edu.TeachingResourceController.remove()','DELETE',1,'teacher1','若依科技','/education/resource/104','127.0.0.1','内网IP','[104] ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:12:47',8),
(226,'教学资源',3,'com.ruoyi.web.controller.edu.TeachingResourceController.remove()','DELETE',1,'teacher1','若依科技','/education/resource/103','127.0.0.1','内网IP','[103] ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:12:48',18),
(227,'教学资源',3,'com.ruoyi.web.controller.edu.TeachingResourceController.remove()','DELETE',1,'teacher1','若依科技','/education/resource/102','127.0.0.1','内网IP','[102] ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:12:50',19),
(228,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"category\":\"video\",\"courseId\":10,\"createBy\":\"teacher1\",\"createTime\":\"2026-01-09 17:13:10\",\"filePath\":\"/profile/upload/2026/01/09/10.基础篇-功能详解-代码生成_20260109171309A005.mp4\",\"fileSize\":\"22.29MB\",\"originName\":\"10.基础篇-功能详解-代码生成_20260109171309A005.mp4\",\"params\":{},\"resourceId\":115,\"resourceName\":\"10.基础篇-功能详解-代码生成\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:13:10',13),
(229,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":115,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:13:56\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:13:56',25),
(230,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":115,\"status\":\"0\",\"updateTime\":\"2026-01-09 17:13:58\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:13:58',18),
(231,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":114,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:13:58\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:13:58',18),
(232,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":114,\"status\":\"0\",\"updateTime\":\"2026-01-09 17:13:59\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:13:59',19),
(233,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"category\":\"video\",\"courseId\":10,\"createBy\":\"teacher1\",\"createTime\":\"2026-01-09 17:14:17\",\"filePath\":\"/profile/upload/2026/01/09/20.基础篇-二次开发-口味改造_20260109171415A006.mp4\",\"fileSize\":\"111.20MB\",\"originName\":\"20.基础篇-二次开发-口味改造_20260109171415A006.mp4\",\"params\":{},\"resourceId\":116,\"resourceName\":\"20.基础篇-二次开发-口味改造\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:14:17',18),
(234,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":115,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:14:19\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:14:19',8),
(235,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":114,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:14:19\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:14:19',19),
(236,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":113,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:14:20\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:14:20',23),
(237,'教学资源',1,'com.ruoyi.web.controller.edu.TeachingResourceController.add()','POST',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"category\":\"image\",\"courseId\":10,\"createBy\":\"teacher1\",\"createTime\":\"2026-01-09 17:18:45\",\"filePath\":\"/profile/upload/2026/01/09/Nitro_Wallpaper_5000x2813_20260109171844A007.jpg\",\"fileSize\":\"3.44MB\",\"originName\":\"Nitro_Wallpaper_5000x2813_20260109171844A007.jpg\",\"params\":{},\"resourceId\":117,\"resourceName\":\"Nitro_Wallpaper_5000x2813\",\"status\":\"0\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:18:45',16),
(238,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":115,\"status\":\"0\",\"updateTime\":\"2026-01-09 17:20:17\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:20:17',29),
(239,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":114,\"status\":\"0\",\"updateTime\":\"2026-01-09 17:20:18\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:20:18',17),
(240,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":113,\"status\":\"0\",\"updateTime\":\"2026-01-09 17:20:18\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:20:18',8),
(241,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":113,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:20:19\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:20:19',17),
(242,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":114,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:20:19\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:20:19',7),
(243,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":115,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:20:19\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:20:19',8),
(244,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":116,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:20:20\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:20:20',7),
(245,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":116,\"status\":\"0\",\"updateTime\":\"2026-01-09 17:20:20\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:20:20',8),
(246,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":117,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:20:20\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:20:20',7),
(247,'教学资源',2,'com.ruoyi.web.controller.edu.TeachingResourceController.edit()','PUT',1,'teacher1','若依科技','/education/resource','127.0.0.1','内网IP','{\"params\":{},\"resourceId\":116,\"status\":\"1\",\"updateTime\":\"2026-01-09 17:20:21\"} ','{\"msg\":\"操作成功\",\"code\":200}',0,NULL,'2026-01-09 17:20:21',11);

/*Table structure for table `sys_post` */

DROP TABLE IF EXISTS `sys_post`;

CREATE TABLE `sys_post` (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='岗位信息表';

/*Data for the table `sys_post` */

insert  into `sys_post`(`post_id`,`post_code`,`post_name`,`post_sort`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'ceo','董事长',1,'0','admin','2025-12-30 13:49:21','',NULL,''),
(2,'se','项目经理',2,'0','admin','2025-12-30 13:49:21','',NULL,''),
(3,'hr','人力资源',3,'0','admin','2025-12-30 13:49:21','',NULL,''),
(4,'user','普通员工',4,'0','admin','2025-12-30 13:49:21','',NULL,'');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色信息表';

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_key`,`role_sort`,`data_scope`,`menu_check_strictly`,`dept_check_strictly`,`status`,`del_flag`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,'超级管理员','admin',1,'1',1,1,'0','0','admin','2025-12-30 13:49:21','',NULL,'超级管理员'),
(2,'普通角色','common',2,'2',1,1,'0','2','admin','2025-12-30 13:49:21','',NULL,'普通角色'),
(100,'教师','teacher',3,'1',1,1,'0','0','','2025-12-30 16:13:48','',NULL,NULL),
(101,'学生','student',4,'1',1,1,'0','0','','2025-12-30 16:13:48','',NULL,NULL);

/*Table structure for table `sys_role_dept` */

DROP TABLE IF EXISTS `sys_role_dept`;

CREATE TABLE `sys_role_dept` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和部门关联表';

/*Data for the table `sys_role_dept` */

/*Table structure for table `sys_role_menu` */

DROP TABLE IF EXISTS `sys_role_menu`;

CREATE TABLE `sys_role_menu` (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和菜单关联表';

/*Data for the table `sys_role_menu` */

insert  into `sys_role_menu`(`role_id`,`menu_id`) values 
(1,2000),
(1,2001),
(1,2002),
(1,2003),
(1,2004),
(1,2005),
(1,2010),
(1,2011),
(1,2012),
(1,2013),
(1,2014),
(1,2015),
(1,2016),
(1,2017),
(1,2018),
(100,2000),
(100,2001),
(100,2002),
(100,2004),
(100,2005),
(100,2010),
(100,2011),
(100,2012),
(100,2013),
(100,2014),
(100,2015),
(100,2016),
(100,2017),
(101,2000),
(101,2001),
(101,2004),
(101,2010),
(101,2018);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户信息表';

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`dept_id`,`user_name`,`nick_name`,`user_type`,`email`,`phonenumber`,`sex`,`avatar`,`password`,`status`,`del_flag`,`login_ip`,`login_date`,`pwd_update_date`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(1,103,'admin','若依','00','ry@163.com','15888888888','1','/profile/avatar/2026/01/01/c9945d3d13bf4d0bb80fd95a7c318795.png','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-09 16:56:03','2025-12-30 13:49:21','admin','2025-12-30 13:49:21','','2026-01-01 21:22:33','管理员'),
(2,105,'ry','若依','00','ry@qq.com','15666666666','1','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2025-12-30 13:49:21','2025-12-30 13:49:21','admin','2025-12-30 13:49:21','',NULL,'测试员'),
(100,100,'teacher1','教师一','00','','','0','https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-09 17:18:36','2025-12-30 16:20:17','','2025-12-30 16:14:05','','2026-01-01 13:23:49',NULL),
(101,100,'student1','学生一','00','','','0','','$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2','0','0','127.0.0.1','2026-01-09 12:27:51','2025-12-30 16:28:24','','2025-12-30 16:14:05','','2025-12-30 16:28:24',NULL),
(102,NULL,'stu01','stu01','00','1231234123@qq.com','13684843434','1','/profile/avatar/2026/01/01/27c93afb66cb441d95b718f6f67a0346.png','$2a$10$7.oA./Zf0//hMlP2H3h7AuF3sn7HYSwE2V1KyWbUVJ3nLfnQ2ctRu','0','0','127.0.0.1','2026-01-09 17:14:38','2026-01-01 21:34:01','seed','2025-12-31 10:45:23','','2026-01-01 21:35:21',NULL),
(103,NULL,'stu02','stu02','00','','','0','','$2a$10$kFZBZeqlRmek6uLBHOCGLuiJOf8dVf2aOYa9d3mMPIVBLUFtQCqQe','0','0','127.0.0.1','2026-01-09 13:42:40',NULL,'seed','2025-12-31 10:45:23','',NULL,NULL),
(104,NULL,'stu03','stu03','00','','','0','','$2a$10$bRfiacMSly0SY4jEdYo9Heffm6zA7Af0TDCNCW9euwb0e7ahlSvry','0','0','',NULL,NULL,'seed','2025-12-31 10:45:23','',NULL,NULL),
(105,NULL,'stu04','stu04','00','','','0','','$2a$10$8UpY1GAMv3jTXIxPxgGQMeh5oeFMKemgng6A3nKXMZtV77wNMIKdW','0','0','',NULL,NULL,'seed','2025-12-31 10:45:23','',NULL,NULL),
(106,NULL,'stu05','stu05','00','','','0','','$2a$10$v90E5KyAmEHIh/6HOBoUKOxDgXVQtEa46eO1ypNxgXY3XxUIDKf/O','0','0','',NULL,NULL,'seed','2025-12-31 10:45:23','',NULL,NULL),
(107,NULL,'stu06','stu06','00','','','0','','$2a$10$apBdTILcSCXkeIgkqlzxfubBoUCUsT/0gW0GcQSgrrgdZGC0v7Dey','0','0','',NULL,NULL,'seed','2025-12-31 10:45:23','',NULL,NULL),
(108,NULL,'stu07','stu07','00','','','0','','$2a$10$jViT97d3vgHjEXEKhiM8AeCfW9uhHl0vaz3KSvAwINV8.DjmpbJdi','0','0','',NULL,NULL,'seed','2025-12-31 10:45:23','',NULL,NULL),
(109,NULL,'stu08','stu08','00','','','0','','$2a$10$DapaH4D6dnhDbE9bVyT1regl9B.OjIdB9dyalKGVnq.yiFTPLnRYW','0','0','',NULL,NULL,'seed','2025-12-31 10:45:23','',NULL,NULL),
(110,NULL,'stu09','stu09','00','','','0','','$2a$10$6VsoRfb7zP2VcL.xeEupjOkLPBz2awmVcq7s.BEcXIkTv4WG8pFxS','0','0','',NULL,NULL,'seed','2025-12-31 10:45:23','',NULL,NULL),
(111,NULL,'stu10','stu10','00','','','0','','$2a$10$UhE6kiiaObPpH8GTsNsU2OqKz7gpkhOFBNdIsUNuweBL0pgKUVmGu','0','0','',NULL,NULL,'seed','2025-12-31 10:45:23','',NULL,NULL),
(112,NULL,'stu11','stu11','00','','','0','','$2a$10$UTN9fRmuXYG2IymjE78nXOZXCg4.4ke8zVa8Mhl.J4f2lXa5ADIva','0','0','',NULL,NULL,'seed','2025-12-31 10:45:23','',NULL,NULL),
(113,NULL,'stu12','stu12','00','','','0','','$2a$10$ps9Ua1Iqacvgi2jM0TFNn.5UBn4W909la11IUeGnsoD2aA2GsgliO','0','0','',NULL,NULL,'seed','2025-12-31 10:45:23','',NULL,NULL),
(114,NULL,'stu13','stu13','00','','','0','','$2a$10$BZ87Rf3jInFu17fLj2BWy.lQpZazHvnxmSyj1O46w45Do6txV88HO','0','0','',NULL,NULL,'seed','2025-12-31 10:45:23','',NULL,NULL),
(115,NULL,'stu14','stu14','00','','','0','','$2a$10$FfwN8pgP24dduNU3WrhjM.So9l3FjvGEV4uTqB5saQYD2nNHzJgPa','0','0','',NULL,NULL,'seed','2025-12-31 10:45:24','',NULL,NULL),
(116,NULL,'stu15','stu15','00','','','0','','$2a$10$K.ncbpsm0qyDzM7r8scOxOAWl7QT/tXVWTex9kIkfNwSFfM4UHsjO','0','0','',NULL,NULL,'seed','2025-12-31 10:45:24','',NULL,NULL),
(117,NULL,'stu16','stu16','00','','','0','','$2a$10$Bncgllsk2cwYuQuKYiKdqe2S3/RwFJP6OQ.PM9YoHrpTbpy6VHhsy','0','0','',NULL,NULL,'seed','2025-12-31 10:45:24','',NULL,NULL),
(118,NULL,'stu17','stu17','00','','','0','','$2a$10$5r7hTjCllieaLDGsMaGGju4S8y98Z86ndvvvH/iMMpIP.I05WyxCu','0','0','',NULL,NULL,'seed','2025-12-31 10:45:24','',NULL,NULL),
(119,NULL,'stu18','stu18','00','','','0','','$2a$10$2JBsHVTPYO58MmS1zvvAce2dsFd5JCYA.kKTodH0zpMfYUGmVNWxC','0','0','',NULL,NULL,'seed','2025-12-31 10:45:24','',NULL,NULL),
(120,NULL,'stu19','stu19','00','','','0','','$2a$10$x3Iqg.kwxPqRELZLxxmkv.D6xCrKwvrajjkN4kac.CJZv0col.nLm','0','0','',NULL,NULL,'seed','2025-12-31 10:45:24','',NULL,NULL),
(121,NULL,'stu20','stu20','00','','','0','','$2a$10$jiBpblEQ.DjAVFp/KBdpdeM3Z4LlKCwGQK7SXj2vZOvDa2.Q3ddmi','0','0','',NULL,NULL,'seed','2025-12-31 10:45:24','',NULL,NULL),
(122,NULL,'2584054150@qq.com','moon','00','2584054150@qq.com','','0','','$2a$10$dLH4tdosQ8HJRrIVCb5D.usBpzf.CBGNwZ4L2A/R64Lx.w6bb4vvW','0','0','127.0.0.1','2026-01-01 16:28:23','2026-01-01 11:25:51','','2026-01-01 11:25:51','',NULL,NULL),
(123,NULL,'陈老师','陈老师','00','','','0','https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80','$2a$10$dLH4tdosQ8HJRrIVCb5D.usBpzf.CBGNwZ4L2A/R64Lx.w6bb4vvW','0','0','',NULL,NULL,'admin','2026-01-01 13:25:15','','2026-01-01 13:25:27',NULL),
(201,103,'teacher_li','李华老师','00','lihua@edu.com','13800138001','0','https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80','$2a$10$7JB720yubVSZv5W8vNGkarOu8wHg06/jiWfij90z8t.97.J.W','0','0','127.0.0.1','2026-01-01 15:23:30',NULL,'admin','2026-01-01 15:23:30','',NULL,'资深数学教师'),
(202,103,'teacher_zhang','张伟教授','00','zhangwei@edu.com','13900139002','0','https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80','$2a$10$7JB720yubVSZv5W8vNGkarOu8wHg06/jiWfij90z8t.97.J.W','0','0','127.0.0.1','2026-01-01 15:23:30',NULL,'admin','2026-01-01 15:23:30','',NULL,'计算机科学专家'),
(203,103,'teacher_wang','王芳讲师','00','wangfang@edu.com','13700137003','1','https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80','$2a$10$7JB720yubVSZv5W8vNGkarOu8wHg06/jiWfij90z8t.97.J.W','0','0','127.0.0.1','2026-01-01 15:23:30',NULL,'admin','2026-01-01 15:23:30','',NULL,'英语高级讲师'),
(301,103,'student_chen','陈明','00','chenming@stu.edu.com','15000150001','0','','$2a$10$7JB720yubVSZv5W8vNGkarOu8wHg06/jiWfij90z8t.97.J.W','0','0','127.0.0.1','2026-01-01 15:23:30',NULL,'admin','2026-01-01 15:23:30','',NULL,'2023级学生'),
(302,103,'student_lin','林晓','00','linxiao@stu.edu.com','15100151002','1','','$2a$10$7JB720yubVSZv5W8vNGkarOu8wHg06/jiWfij90z8t.97.J.W','0','0','127.0.0.1','2026-01-01 15:23:30',NULL,'admin','2026-01-01 15:23:30','',NULL,'2023级学生'),
(303,103,'student_zhao','赵强','00','zhaoqiang@stu.edu.com','15200152003','0','','$2a$10$7JB720yubVSZv5W8vNGkarOu8wHg06/jiWfij90z8t.97.J.W','0','0','127.0.0.1','2026-01-01 15:23:30',NULL,'admin','2026-01-01 15:23:30','',NULL,'2022级学生'),
(304,NULL,'221002206','221002206','00','','','0',NULL,'$2a$10$uHIo3nEuL.NwZYidvJ8yv.hntGL2nIpdXDjYbIML.s0QvL./4QFGa','0','0','',NULL,NULL,'admin','2026-01-01 17:27:18','',NULL,NULL);

/*Table structure for table `sys_user_post` */

DROP TABLE IF EXISTS `sys_user_post`;

CREATE TABLE `sys_user_post` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户与岗位关联表';

/*Data for the table `sys_user_post` */

insert  into `sys_user_post`(`user_id`,`post_id`) values 
(1,1),
(2,2);

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户和角色关联表';

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`user_id`,`role_id`) values 
(1,1),
(2,100),
(2,101),
(100,100),
(101,101),
(102,101),
(103,101),
(104,101),
(105,101),
(106,101),
(107,101),
(108,101),
(109,101),
(110,101),
(111,101),
(112,101),
(113,101),
(114,101),
(115,101),
(116,101),
(117,101),
(118,101),
(119,101),
(120,101),
(121,101),
(122,101),
(123,100),
(201,101),
(202,101),
(203,101),
(301,101),
(302,101),
(303,101),
(304,101);

/*Table structure for table `teaching_resource` */

DROP TABLE IF EXISTS `teaching_resource`;

CREATE TABLE `teaching_resource` (
  `resource_id` bigint NOT NULL AUTO_INCREMENT COMMENT '资源ID',
  `course_id` bigint NOT NULL COMMENT '关联课程ID',
  `resource_name` varchar(200) NOT NULL COMMENT '资源标题',
  `category` varchar(50) DEFAULT 'other' COMMENT '资源分类(video/audio/image/doc/other)',
  `file_path` varchar(500) NOT NULL COMMENT '文件路径',
  `file_size` varchar(50) DEFAULT '' COMMENT '文件大小',
  `origin_name` varchar(200) DEFAULT '' COMMENT '原始文件名',
  `download_count` int DEFAULT '0' COMMENT '下载次数',
  `status` char(1) DEFAULT '0' COMMENT '状态(0正常 1停用/隐藏)',
  `create_by` varchar(64) DEFAULT '' COMMENT '上传者',
  `create_time` datetime DEFAULT NULL COMMENT '上传时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`resource_id`),
  KEY `idx_course_id` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='教学资源表';

/*Data for the table `teaching_resource` */

insert  into `teaching_resource`(`resource_id`,`course_id`,`resource_name`,`category`,`file_path`,`file_size`,`origin_name`,`download_count`,`status`,`create_by`,`create_time`,`update_by`,`update_time`,`remark`) values 
(100,18,'6','other','/profile/upload/2026/01/09/google密码_20260109122151A001.txt','36.00B','google密码_20260109122151A001.txt',0,'0','teacher1','2026-01-09 12:25:23','',NULL,NULL),
(113,10,'基础应用篇','doc','/profile/upload/2026/01/09/基础应用篇_20260109171218A003.pptx','9.62MB','基础应用篇_20260109171218A003.pptx',1,'1','teacher1','2026-01-09 17:12:20','','2026-01-09 17:20:19',NULL),
(114,10,'AI+若依框架在线笔记','other','/profile/upload/2026/01/09/AI+若依框架在线笔记_20260109171231A004.txt','343.00B','AI+若依框架在线笔记_20260109171231A004.txt',0,'1','teacher1','2026-01-09 17:12:33','','2026-01-09 17:20:20',NULL),
(115,10,'10.基础篇-功能详解-代码生成','video','/profile/upload/2026/01/09/10.基础篇-功能详解-代码生成_20260109171309A005.mp4','22.29MB','10.基础篇-功能详解-代码生成_20260109171309A005.mp4',0,'1','teacher1','2026-01-09 17:13:11','','2026-01-09 17:20:20',NULL),
(116,10,'20.基础篇-二次开发-口味改造','video','/profile/upload/2026/01/09/20.基础篇-二次开发-口味改造_20260109171415A006.mp4','111.20MB','20.基础篇-二次开发-口味改造_20260109171415A006.mp4',1,'1','teacher1','2026-01-09 17:14:17','','2026-01-09 17:20:22',NULL),
(117,10,'Nitro_Wallpaper_5000x2813','image','/profile/upload/2026/01/09/Nitro_Wallpaper_5000x2813_20260109171844A007.jpg','3.44MB','Nitro_Wallpaper_5000x2813_20260109171844A007.jpg',0,'1','teacher1','2026-01-09 17:18:46','','2026-01-09 17:20:21',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
