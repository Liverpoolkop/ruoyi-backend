/*
 Navicat MySQL Dump SQL

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 90500 (9.5.0)
 Source Host           : localhost:3306
 Source Schema         : ry-vue

 Target Server Type    : MySQL
 Target Server Version : 90500 (9.5.0)
 File Encoding         : 65001

 Date: 02/01/2026 14:11:10
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for edu_chapter
-- ----------------------------
DROP TABLE IF EXISTS `edu_chapter`;
CREATE TABLE `edu_chapter` (
                               `chapter_id` bigint NOT NULL AUTO_INCREMENT COMMENT '章节ID',
                               `course_id` bigint NOT NULL COMMENT '课程ID',
                               `parent_id` bigint DEFAULT '0' COMMENT '父章节ID(0为一级目录)',
                               `chapter_name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '章节名称',
                               `sort` int DEFAULT '0' COMMENT '显示顺序',
                               `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                               `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                               PRIMARY KEY (`chapter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=505 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程章节表';

-- ----------------------------
-- Records of edu_chapter
-- ----------------------------
BEGIN;
INSERT INTO `edu_chapter` (`chapter_id`, `course_id`, `parent_id`, `chapter_name`, `sort`, `create_time`, `update_time`) VALUES (101, 10, 0, '第一章：函数与极限', 1, '2026-01-01 15:33:32', NULL);
INSERT INTO `edu_chapter` (`chapter_id`, `course_id`, `parent_id`, `chapter_name`, `sort`, `create_time`, `update_time`) VALUES (102, 10, 0, '第二章：导数与微分', 2, '2026-01-01 15:33:32', NULL);
INSERT INTO `edu_chapter` (`chapter_id`, `course_id`, `parent_id`, `chapter_name`, `sort`, `create_time`, `update_time`) VALUES (103, 10, 0, '第三章：微分中值定理', 3, '2026-01-01 15:33:32', NULL);
INSERT INTO `edu_chapter` (`chapter_id`, `course_id`, `parent_id`, `chapter_name`, `sort`, `create_time`, `update_time`) VALUES (201, 11, 0, '第一章：Java 语言概述', 1, '2026-01-01 15:23:30', NULL);
INSERT INTO `edu_chapter` (`chapter_id`, `course_id`, `parent_id`, `chapter_name`, `sort`, `create_time`, `update_time`) VALUES (202, 11, 0, '第二章：基本数据类型与运算符', 2, '2026-01-01 15:23:30', NULL);
INSERT INTO `edu_chapter` (`chapter_id`, `course_id`, `parent_id`, `chapter_name`, `sort`, `create_time`, `update_time`) VALUES (203, 11, 0, '第三章：面向对象编程基础', 3, '2026-01-01 15:23:30', NULL);
INSERT INTO `edu_chapter` (`chapter_id`, `course_id`, `parent_id`, `chapter_name`, `sort`, `create_time`, `update_time`) VALUES (204, 11, 0, '第四章：数组与集合', 4, '2026-01-01 15:37:21', NULL);
INSERT INTO `edu_chapter` (`chapter_id`, `course_id`, `parent_id`, `chapter_name`, `sort`, `create_time`, `update_time`) VALUES (205, 11, 0, '第五章：异常处理', 5, '2026-01-01 15:37:21', NULL);
INSERT INTO `edu_chapter` (`chapter_id`, `course_id`, `parent_id`, `chapter_name`, `sort`, `create_time`, `update_time`) VALUES (301, 13, 0, '第一章：Spring Boot 入门', 1, '2026-01-01 15:23:30', NULL);
INSERT INTO `edu_chapter` (`chapter_id`, `course_id`, `parent_id`, `chapter_name`, `sort`, `create_time`, `update_time`) VALUES (302, 13, 0, '第二章：Web 开发基础', 2, '2026-01-01 15:23:30', NULL);
INSERT INTO `edu_chapter` (`chapter_id`, `course_id`, `parent_id`, `chapter_name`, `sort`, `create_time`, `update_time`) VALUES (401, 12, 0, 'Unit 1: College Life', 1, '2026-01-01 15:33:32', NULL);
INSERT INTO `edu_chapter` (`chapter_id`, `course_id`, `parent_id`, `chapter_name`, `sort`, `create_time`, `update_time`) VALUES (402, 12, 0, 'Unit 2: Friendship', 2, '2026-01-01 15:33:32', NULL);
INSERT INTO `edu_chapter` (`chapter_id`, `course_id`, `parent_id`, `chapter_name`, `sort`, `create_time`, `update_time`) VALUES (501, 14, 0, '第一章：行列式', 1, '2026-01-01 15:33:32', NULL);
INSERT INTO `edu_chapter` (`chapter_id`, `course_id`, `parent_id`, `chapter_name`, `sort`, `create_time`, `update_time`) VALUES (502, 14, 0, '第二章：矩阵及其运算', 2, '2026-01-01 15:33:32', NULL);
INSERT INTO `edu_chapter` (`chapter_id`, `course_id`, `parent_id`, `chapter_name`, `sort`, `create_time`, `update_time`) VALUES (503, 10, 101, '第一节：函数是什么', 1, NULL, NULL);
INSERT INTO `edu_chapter` (`chapter_id`, `course_id`, `parent_id`, `chapter_name`, `sort`, `create_time`, `update_time`) VALUES (504, 10, 102, '第一节：导数概念', 1, '2026-01-01 15:50:57', NULL);
COMMIT;




-- ----------------------------
-- Table structure for 知识图谱相关
-- ----------------------------



-- 1. 知识点表
DROP TABLE IF EXISTS `edu_knowledge`;
CREATE TABLE `edu_knowledge` (
                                 `knowledge_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '知识点ID',
                                 `knowledge_name` varchar(200) NOT NULL COMMENT '知识点名称',
                                 `knowledge_code` varchar(100) DEFAULT NULL COMMENT '知识点编码',
                                 `chapter_id` bigint(20) NOT NULL COMMENT '章节ID',
                                 `course_id` bigint(20) NOT NULL COMMENT '课程ID',
                                 `content` text COMMENT '知识点内容',
                                 `difficulty_level` varchar(20) DEFAULT 'medium' COMMENT '难度等级（easy,medium,hard）',
                                 `keywords` varchar(500) DEFAULT NULL COMMENT '关键词',
                                 `parent_id` bigint(20) DEFAULT '0' COMMENT '父知识点ID',
                                 `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 `remark` varchar(500) DEFAULT NULL COMMENT '备注',
                                 PRIMARY KEY (`knowledge_id`),
                                 KEY `idx_chapter_id` (`chapter_id`),
                                 KEY `idx_course_id` (`course_id`),
                                 KEY `idx_knowledge_name` (`knowledge_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='知识点表';

-- 2. 知识点关系表（构建知识图谱）
DROP TABLE IF EXISTS `edu_knowledge_relation`;
CREATE TABLE `edu_knowledge_relation` (
                                          `relation_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关系ID',
                                          `source_id` bigint(20) NOT NULL COMMENT '源知识点ID',
                                          `target_id` bigint(20) NOT NULL COMMENT '目标知识点ID',
                                          `relation_type` varchar(50) DEFAULT NULL COMMENT '关系类型（prerequisite,related,similar等）',
                                          `description` varchar(500) DEFAULT NULL COMMENT '关系描述',
                                          `relation_strength` decimal(5,2) DEFAULT '0.00' COMMENT '分值',
                                          `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                          PRIMARY KEY (`relation_id`),
                                          KEY `idx_source_id` (`source_id`),
                                          KEY `idx_target_id` (`target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='知识点关系表';

-- 3. 作业表
DROP TABLE IF EXISTS `edu_homework`;
CREATE TABLE `edu_homework` (
                                `homework_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '作业ID',
                                `homework_name` varchar(200) NOT NULL COMMENT '作业名称',
                                `course_id` bigint(20) NOT NULL COMMENT '课程ID',
                                `description` text COMMENT '作业描述',
                                `start_time` datetime DEFAULT NULL COMMENT '开始时间',
                                `end_time` datetime DEFAULT NULL COMMENT '结束时间',
                                `status` char(1) DEFAULT '0' COMMENT '状态（0未开始 1进行中 2已结束）',
                                `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                PRIMARY KEY (`homework_id`),
                                KEY `idx_course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='作业表';

-- 4. 题目表
DROP TABLE IF EXISTS `edu_question`;
CREATE TABLE `edu_question` (
                                `question_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '题目ID',
                                `question_title` varchar(500) NOT NULL COMMENT '题目标题',
                                `question_type` varchar(20) DEFAULT NULL COMMENT '题目类型（single,multiple,judgment,essay）',
                                `content` text COMMENT '题目内容',
                                `options` text COMMENT '选项（JSON格式）',
                                `answer` text COMMENT '答案',
                                `analysis` text COMMENT '答案解析',
                                `difficulty_level` varchar(20) DEFAULT 'medium' COMMENT '难度等级',
                                `score` decimal(5,2) DEFAULT '0.00' COMMENT '分值',
                                `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                PRIMARY KEY (`question_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='题目表';

-- 5. 实验表
DROP TABLE IF EXISTS `edu_experiment`;
CREATE TABLE `edu_experiment` (
                                  `experiment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '实验ID',
                                  `experiment_name` varchar(200) NOT NULL COMMENT '实验名称',
                                  `course_id` bigint(20) NOT NULL COMMENT '课程ID',
                                  `description` text COMMENT '实验描述',
                                  `requirements` text COMMENT '实验要求',
                                  `attachment` varchar(500) DEFAULT NULL COMMENT '附件路径',
                                  `status` char(1) DEFAULT '0' COMMENT '状态（0未开始 1进行中 2已结束）',
                                  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
                                  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                  PRIMARY KEY (`experiment_id`),
                                  KEY `idx_course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='实验表';

-- 6. 教学资源关联表（作业/题目/实验 关联 知识点）
DROP TABLE IF EXISTS `edu_teaching_resource_knowledge`;
CREATE TABLE `edu_teaching_resource_knowledge` (
                                                   `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '关联ID',
                                                   `resource_type` varchar(20) NOT NULL COMMENT '资源类型（homework,question,experiment）',
                                                   `resource_id` bigint(20) NOT NULL COMMENT '资源ID',
                                                   `knowledge_id` bigint(20) NOT NULL COMMENT '知识点ID',
                                                   `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                                   PRIMARY KEY (`id`),
                                                   KEY `idx_resource` (`resource_type`,`resource_id`),
                                                   KEY `idx_knowledge_id` (`knowledge_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='教学资源知识点关联表';


-- 模拟数据

-- 1. 首先插入知识点数据（假设有课程ID为1001的课程，包含3个章节）
INSERT INTO `edu_knowledge` (`knowledge_id`, `knowledge_name`, `knowledge_code`, `chapter_id`, `course_id`, `content`, `difficulty_level`, `keywords`, `parent_id`, `status`, `create_time`, `update_time`, `remark`) VALUES
-- 第1章: 数据库基础
(1, '数据库基本概念', 'DB_001', 101, 10, '数据库是存储、管理和维护数据的系统，包括数据、数据库管理系统（DBMS）和应用程序。', 'easy', '数据库,DBMS,数据管理', 0, '0', '2024-01-10 09:00:00', '2024-01-10 09:00:00', '基础知识点'),
(2, 'SQL语言介绍', 'DB_002', 101, 10, 'SQL（Structured Query Language）是用于管理关系型数据库的标准编程语言。', 'easy', 'SQL,DDL,DML,DQL', 1, '0', '2024-01-10 09:00:00', '2024-01-10 09:00:00', NULL),
(3, '数据模型', 'DB_003', 101, 10, '数据模型是描述数据、数据关系、数据语义以及一致性约束的概念工具的集合。', 'medium', '概念模型,逻辑模型,物理模型', 1, '0', '2024-01-10 09:00:00', '2024-01-10 09:00:00', NULL),

-- 第2章: SQL查询
(4, 'SELECT语句基础', 'SQL_001', 102, 10, 'SELECT语句用于从数据库中选取数据，基本语法：SELECT column1, column2 FROM table_name。', 'easy', 'SELECT,FROM,WHERE', 0, '0', '2024-01-11 10:00:00', '2024-01-11 10:00:00', NULL),
(5, 'WHERE子句与条件筛选', 'SQL_002', 102, 10, 'WHERE子句用于过滤记录，只返回满足指定条件的记录。', 'easy', 'WHERE,条件,运算符', 4, '0', '2024-01-11 10:00:00', '2024-01-11 10:00:00', NULL),
(6, 'JOIN连接查询', 'SQL_003', 102, 10, 'JOIN用于基于两个或多个表之间的相关列组合行。包括INNER JOIN、LEFT JOIN、RIGHT JOIN等。', 'medium', 'JOIN,INNER JOIN,LEFT JOIN', 4, '0', '2024-01-11 10:00:00', '2024-01-11 10:00:00', '重要知识点'),
(7, '聚合函数与GROUP BY', 'SQL_004', 102, 10, '聚合函数对一组值执行计算并返回单个值，常与GROUP BY子句一起使用。', 'medium', 'COUNT,SUM,AVG,GROUP BY', 4, '0', '2024-01-11 10:00:00', '2024-01-11 10:00:00', NULL),

-- 第3章: 数据库设计
(8, '关系数据库范式', 'DBD_001', 103, 10, '范式是数据库设计中的规范化原则，包括第一范式（1NF）、第二范式（2NF）、第三范式（3NF）等。', 'hard', '范式,规范化,1NF,2NF,3NF', 0, '0', '2024-01-12 14:00:00', '2024-01-12 14:00:00', '难点知识点'),
(9, '实体关系模型', 'DBD_002', 103, 10, '实体关系模型（ER模型）是描述现实世界概念结构的数据模型。', 'medium', 'ER模型,实体,属性,关系', 8, '0', '2024-01-12 14:00:00', '2024-01-12 14:00:00', NULL),
(10, '数据库索引原理', 'DBD_003', 103, 10, '索引是数据库中用于快速查找数据的数据结构，如B树、哈希索引等。', 'hard', '索引,B树,哈希索引,查询优化', 8, '0', '2024-01-12 14:00:00', '2024-01-12 14:00:00', NULL);

-- 2. 插入知识点关系数据
INSERT INTO `edu_knowledge_relation` (`relation_id`, `source_id`, `target_id`, `relation_type`, `description`, `create_time`) VALUES
-- 前置关系
(1, 2, 1, 'prerequisite', '学习SQL前需要了解数据库基本概念', '2024-01-10 10:00:00'),
(2, 3, 1, 'prerequisite', '理解数据模型需要数据库基础', '2024-01-10 10:00:00'),
(3, 5, 4, 'prerequisite', 'WHERE子句是SELECT语句的一部分', '2024-01-11 11:00:00'),
(4, 6, 5, 'prerequisite', '学习连接查询前需掌握基本查询', '2024-01-11 11:00:00'),
(5, 7, 6, 'prerequisite', '聚合查询通常在连接查询后学习', '2024-01-11 11:00:00'),
(6, 9, 8, 'prerequisite', 'ER模型是理解范式的基础', '2024-01-12 15:00:00'),
(7, 10, 8, 'prerequisite', '索引设计需要范式知识', '2024-01-12 15:00:00'),

-- 相关关系
(8, 1, 4, 'related', '数据库概念与SQL查询密切相关', '2024-01-11 12:00:00'),
(9, 6, 10, 'related', '连接查询性能与索引设计相关', '2024-01-12 16:00:00'),
(10, 3, 8, 'related', '数据模型与数据库设计相关', '2024-01-12 16:00:00');

-- 3. 插入作业数据
INSERT INTO `edu_homework` (`homework_id`, `homework_name`, `course_id`, `description`, `start_time`, `end_time`, `status`, `create_by`, `create_time`, `update_time`) VALUES
                                                                                                                                                                           (1, '数据库基础作业', 10, '完成数据库基本概念和SQL基础的相关练习', '2024-01-15 00:00:00', '2024-01-20 23:59:59', '2', 'teacher_zhang', '2024-01-14 09:00:00', '2024-01-14 09:00:00'),
                                                                                                                                                                           (2, 'SQL查询进阶作业', 10, '重点练习JOIN连接和聚合查询', '2024-01-22 00:00:00', '2024-01-27 23:59:59', '1', 'teacher_zhang', '2024-01-21 10:00:00', '2024-01-21 10:00:00'),
                                                                                                                                                                           (3, '数据库设计作业', 10, '完成数据库范式分析和ER图设计', '2024-01-29 00:00:00', '2024-02-03 23:59:59', '0', 'teacher_li', '2024-01-28 14:00:00', '2024-01-28 14:00:00');

-- 4. 插入题目数据
INSERT INTO `edu_question` (`question_id`, `question_title`, `question_type`, `content`, `options`, `answer`, `analysis`, `difficulty_level`, `score`, `create_by`, `create_time`, `update_time`) VALUES
-- 单选题
(1, '数据库管理系统的英文缩写是？', 'single', '请选择正确的数据库管理系统英文缩写', '["DB", "DBS", "DBMS", "DATA"]', 'DBMS', '数据库管理系统（Database Management System）的英文缩写是DBMS', 'easy', 5.00, 'teacher_zhang', '2024-01-10 08:00:00', '2024-01-10 08:00:00'),
(2, 'SQL中用于查询数据的关键字是？', 'single', '在SQL语言中，用于从数据库查询数据的关键字是？', '["GET", "SELECT", "QUERY", "FIND"]', 'SELECT', 'SELECT是SQL中用于查询数据的关键字', 'easy', 5.00, 'teacher_zhang', '2024-01-10 08:00:00', '2024-01-10 08:00:00'),
(3, '以下哪个不是SQL的DML语句？', 'single', '请选择不属于SQL数据操纵语言（DML）的语句', '["SELECT", "INSERT", "UPDATE", "CREATE TABLE"]', 'CREATE TABLE', 'CREATE TABLE属于DDL（数据定义语言），不是DML', 'medium', 8.00, 'teacher_zhang', '2024-01-11 09:00:00', '2024-01-11 09:00:00'),
(4, '内连接(INNER JOIN)返回的结果是？', 'single', '关于SQL中的INNER JOIN，以下描述正确的是？', '["左表和右表的所有行", "仅左表中存在的行", "仅右表中存在的行", "两个表中匹配的行"]', '两个表中匹配的行', 'INNER JOIN只返回两个表中匹配的行', 'medium', 8.00, 'teacher_zhang', '2024-01-11 09:00:00', '2024-01-11 09:00:00'),
(5, '第三范式(3NF)要求消除？', 'single', '数据库第三范式(3NF)主要消除哪种依赖？', '["部分依赖", "传递依赖", "函数依赖", "多值依赖"]', '传递依赖', '第三范式(3NF)要求消除非主属性对主键的传递依赖', 'hard', 10.00, 'teacher_li', '2024-01-12 10:00:00', '2024-01-12 10:00:00'),

-- 多选题
(6, '以下哪些是关系型数据库的特点？', 'multiple', '请选择关系型数据库的特点', '["以表格形式存储数据", "支持ACID事务", "支持SQL查询语言", "适合存储非结构化数据"]', '["以表格形式存储数据", "支持ACID事务", "支持SQL查询语言"]', '关系型数据库以表格形式存储数据，支持ACID事务和SQL查询语言，但不适合存储非结构化数据', 'medium', 10.00, 'teacher_zhang', '2024-01-10 09:00:00', '2024-01-10 09:00:00'),
(7, '以下哪些是聚合函数？', 'multiple', '请选择SQL中的聚合函数', '["COUNT", "SUM", "UPPER", "AVG", "MAX"]', '["COUNT", "SUM", "AVG", "MAX"]', 'COUNT、SUM、AVG、MAX是聚合函数，UPPER是字符串函数', 'medium', 10.00, 'teacher_zhang', '2024-01-11 10:00:00', '2024-01-11 10:00:00'),

-- 判断题
(8, '主键的值可以为NULL。', 'judgment', '判断关于数据库主键的说法是否正确', NULL, 'false', '主键的值不能为NULL，这是主键的基本约束', 'easy', 5.00, 'teacher_zhang', '2024-01-10 08:00:00', '2024-01-10 08:00:00'),
(9, '外键用于建立表与表之间的关系。', 'judgment', '判断关于数据库外键的说法是否正确', NULL, 'true', '外键用于建立表与表之间的关系，确保数据的一致性', 'easy', 5.00, 'teacher_zhang', '2024-01-10 08:00:00', '2024-01-10 08:00:00'),

-- 简答题
(10, '简述数据库索引的作用和优缺点。', 'essay', '请简要说明数据库索引的作用以及使用索引的优缺点', NULL, '索引的作用：1. 加快数据检索速度；2. 保证数据的唯一性；3. 加速表与表之间的连接。优点：提高查询效率。缺点：占用存储空间，降低数据插入、更新、删除的速度。', '索引是数据库优化的重要手段，需要根据实际情况合理使用', 'hard', 20.00, 'teacher_li', '2024-01-12 11:00:00', '2024-01-12 11:00:00');

-- 5. 插入实验数据
INSERT INTO `edu_experiment` (`experiment_id`, `experiment_name`, `course_id`, `description`, `requirements`, `attachment`, `status`, `create_by`, `create_time`, `update_time`) VALUES
                                                                                                                                                                                     (1, '学生选课系统数据库设计', 10, '设计一个学生选课系统的数据库，包括学生、课程、教师、选课等实体', '1. 分析需求，确定实体和属性\n2. 设计ER图\n3. 将ER图转换为关系模式\n4. 规范化到3NF\n5. 创建数据库表结构', '/attachments/experiment1_requirements.pdf', '1', 'teacher_li', '2024-01-13 14:00:00', '2024-01-13 14:00:00'),
                                                                                                                                                                                     (2, 'SQL查询优化实验', 10, '通过实际查询操作，学习SQL查询优化技巧', '1. 创建测试数据表\n2. 编写复杂查询语句\n3. 使用EXPLAIN分析查询计划\n4. 添加索引优化查询性能\n5. 比较优化前后的性能差异', '/attachments/experiment2_guide.docx', '0', 'teacher_zhang', '2024-01-20 09:00:00', '2024-01-20 09:00:00');

-- 6. 插入教学资源知识点关联数据
INSERT INTO `edu_teaching_resource_knowledge` (`id`, `resource_type`, `resource_id`, `knowledge_id`, `create_time`) VALUES
-- 作业关联知识点
(1, 'homework', 1, 1, '2024-01-14 09:00:00'),
(2, 'homework', 1, 2, '2024-01-14 09:00:00'),
(3, 'homework', 1, 4, '2024-01-14 09:00:00'),
(4, 'homework', 2, 5, '2024-01-21 10:00:00'),
(5, 'homework', 2, 6, '2024-01-21 10:00:00'),
(6, 'homework', 2, 7, '2024-01-21 10:00:00'),
(7, 'homework', 3, 8, '2024-01-28 14:00:00'),
(8, 'homework', 3, 9, '2024-01-28 14:00:00'),
(9, 'homework', 3, 10, '2024-01-28 14:00:00'),

-- 题目关联知识点
(10, 'question', 1, 1, '2024-01-10 08:00:00'),
(11, 'question', 2, 2, '2024-01-10 08:00:00'),
(12, 'question', 3, 2, '2024-01-11 09:00:00'),
(13, 'question', 4, 6, '2024-01-11 09:00:00'),
(14, 'question', 5, 8, '2024-01-12 10:00:00'),
(15, 'question', 6, 1, '2024-01-10 09:00:00'),
(16, 'question', 7, 7, '2024-01-11 10:00:00'),
(17, 'question', 8, 1, '2024-01-10 08:00:00'),
(18, 'question', 9, 1, '2024-01-10 08:00:00'),
(19, 'question', 10, 10, '2024-01-12 11:00:00'),

-- 实验关联知识点
(20, 'experiment', 1, 3, '2024-01-13 14:00:00'),
(21, 'experiment', 1, 8, '2024-01-13 14:00:00'),
(22, 'experiment', 1, 9, '2024-01-13 14:00:00'),
(23, 'experiment', 2, 4, '2024-01-20 09:00:00'),
(24, 'experiment', 2, 6, '2024-01-20 09:00:00'),
(25, 'experiment', 2, 10, '2024-01-20 09:00:00');

-- ----------------------------
-- Table structure for edu_class
-- ----------------------------
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

-- ----------------------------
-- Records of edu_class
-- ----------------------------
BEGIN;
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1, '计算机222', '22', 1, 123, NULL, 'admin', '2025-12-30 15:15:31', 'admin', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (3, '计算机11', '22', 1, 2, NULL, 'admin', '2025-12-30 15:46:11', 'admin', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (4, '计算机221', '22', 1, 100, '0', 'teacher1', '2025-12-30 16:27:32', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (5, '22计科1班', '2022', 4, 100, '0', 'teacher1', '2025-12-30 16:48:28', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (6, '22计科2班', '2022', 4, 100, '0', 'teacher1', '2025-12-30 16:48:28', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (7, '22计科01班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (8, '22计科02班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (9, '22计科03班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (10, '22计科04班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (11, '22计科05班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (12, '22计科06班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (13, '22计科07班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (14, '22计科08班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (15, '22计科09班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (16, '22计科10班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (17, '22计科11班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (18, '22计科12班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (19, '22计科13班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (20, '22计科14班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (21, '22计科15班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (22, '22计科16班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (23, '22计科17班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (24, '22计科18班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (25, '22计科19班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (26, '22计科20班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (38, '22计科21班', '2022', 4, 100, '0', 'teacher1', '2025-12-31 10:22:24', '', NULL);
INSERT INTO `edu_class` (`class_id`, `class_name`, `grade`, `major_id`, `teacher_id`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (39, '21计算机', '21', 1, 123, '0', 'admin', '2026-01-01 13:26:02', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for edu_class_course
-- ----------------------------
DROP TABLE IF EXISTS `edu_class_course`;
CREATE TABLE `edu_class_course` (
                                    `id` bigint NOT NULL AUTO_INCREMENT COMMENT '关联ID',
                                    `class_id` bigint NOT NULL COMMENT '班级ID（关联edu_class.class_id）',
                                    `course_id` bigint NOT NULL COMMENT '课程ID（关联edu_course.course_id）',
                                    `create_time` datetime DEFAULT NULL COMMENT '关联时间',
                                    PRIMARY KEY (`id`),
                                    UNIQUE KEY `uk_class_course` (`class_id`,`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='班级-课程关联表';

-- ----------------------------
-- Records of edu_class_course
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for edu_class_student
-- ----------------------------
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

-- ----------------------------
-- Records of edu_class_student
-- ----------------------------
BEGIN;
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (1, 3, 1, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (3, 1, 1, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (4, 10, 102, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (5, 10, 103, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (6, 10, 104, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (7, 10, 105, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (8, 10, 106, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (9, 10, 107, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (10, 10, 108, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (11, 10, 109, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (12, 10, 110, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (13, 10, 111, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (14, 10, 112, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (15, 10, 113, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (16, 10, 114, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (17, 10, 115, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (18, 10, 116, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (19, 10, 117, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (20, 10, 118, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (21, 10, 119, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (22, 10, 120, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (23, 10, 121, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (24, 10, 2, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (25, 10, 1, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (26, 4, 1, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (27, 7, 1, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (28, 7, 2, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (29, 7, 100, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (30, 7, 101, NULL, '', NULL);
INSERT INTO `edu_class_student` (`id`, `class_id`, `student_id`, `join_time`, `create_by`, `create_time`) VALUES (31, 7, 123, NULL, '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for edu_course
-- ----------------------------
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

-- ----------------------------
-- Records of edu_course
-- ----------------------------
BEGIN;
INSERT INTO `edu_course` (`course_id`, `course_name`, `major_id`, `course_desc`, `status`, `create_time`, `update_time`, `course_img`, `lesson_hours`) VALUES (2, '数据结构', NULL, '22', '2', '2025-12-30 16:16:51', '2026-01-01 21:09:27', 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', 32);
INSERT INTO `edu_course` (`course_id`, `course_name`, `major_id`, `course_desc`, `status`, `create_time`, `update_time`, `course_img`, `lesson_hours`) VALUES (3, '数据结构2', 4, '基础课程', '0', '2025-12-30 16:48:28', '2026-01-01 23:28:24', 'http://localhost:8080/profile/upload/2026/01/01/2_20260101232812A001.png', 32);
INSERT INTO `edu_course` (`course_id`, `course_name`, `major_id`, `course_desc`, `status`, `create_time`, `update_time`, `course_img`, `lesson_hours`) VALUES (4, '操作系统', 4, '核心课程', '0', '2025-12-30 16:48:28', NULL, 'https://images.unsplash.com/photo-1518770660439-4636190af475?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', 32);
INSERT INTO `edu_course` (`course_id`, `course_name`, `major_id`, `course_desc`, `status`, `create_time`, `update_time`, `course_img`, `lesson_hours`) VALUES (10, '高等数学 (上)', 1, '本课程涵盖微积分基础，适合理工科学生入门。', '0', '2026-01-01 15:23:30', NULL, 'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', 64);
INSERT INTO `edu_course` (`course_id`, `course_name`, `major_id`, `course_desc`, `status`, `create_time`, `update_time`, `course_img`, `lesson_hours`) VALUES (11, 'Java 程序设计基础', 2, '零基础学习 Java，掌握面向对象编程思想。', '0', '2026-01-01 15:23:30', NULL, 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', 48);
INSERT INTO `edu_course` (`course_id`, `course_name`, `major_id`, `course_desc`, `status`, `create_time`, `update_time`, `course_img`, `lesson_hours`) VALUES (12, '大学英语视听说', 3, '提升英语听说能力，包含丰富视听素材。', '0', '2026-01-01 15:23:30', NULL, 'https://images.unsplash.com/photo-1543269865-cbf427effbad?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', 32);
INSERT INTO `edu_course` (`course_id`, `course_name`, `major_id`, `course_desc`, `status`, `create_time`, `update_time`, `course_img`, `lesson_hours`) VALUES (13, 'Spring Boot 实战开发', 2, '企业级开发框架，快速构建微服务应用。', '0', '2026-01-01 15:23:30', NULL, 'https://images.unsplash.com/photo-1605379399642-870262d3d051?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', 56);
INSERT INTO `edu_course` (`course_id`, `course_name`, `major_id`, `course_desc`, `status`, `create_time`, `update_time`, `course_img`, `lesson_hours`) VALUES (14, '线性代数', 1, '矩阵与向量空间，机器学习必备数学基础。', '0', '2026-01-01 15:23:30', NULL, 'https://images.unsplash.com/photo-1509228468518-180dd4864904?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80', 48);
INSERT INTO `edu_course` (`course_id`, `course_name`, `major_id`, `course_desc`, `status`, `create_time`, `update_time`, `course_img`, `lesson_hours`) VALUES (16, '测试2', NULL, '测试2', '0', '2026-01-01 20:51:01', '2026-01-01 23:28:40', 'http://localhost:8080/profile/upload/2026/01/01/1_20260101205039A002.png', 32);
INSERT INTO `edu_course` (`course_id`, `course_name`, `major_id`, `course_desc`, `status`, `create_time`, `update_time`, `course_img`, `lesson_hours`) VALUES (17, '测试3', NULL, '', '2', '2026-01-01 20:58:57', '2026-01-01 23:28:33', 'http://localhost:8080/profile/upload/2026/01/01/screenshot-20251128-135040_20260101205856A001.png', 32);
INSERT INTO `edu_course` (`course_id`, `course_name`, `major_id`, `course_desc`, `status`, `create_time`, `update_time`, `course_img`, `lesson_hours`) VALUES (18, '测试3', NULL, '11', '0', '2026-01-01 23:33:18', NULL, 'http://localhost:8080/profile/upload/2026/01/01/1_20260101233316A002.png', 32);
COMMIT;

-- ----------------------------
-- Table structure for edu_course_student
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_student`;
CREATE TABLE `edu_course_student` (
                                      `course_id` bigint NOT NULL,
                                      `student_id` bigint NOT NULL,
                                      `create_by` varchar(64) DEFAULT '',
                                      `create_time` datetime DEFAULT NULL,
                                      PRIMARY KEY (`course_id`,`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of edu_course_student
-- ----------------------------
BEGIN;
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (2, 1, 'admin', '2026-01-01 20:41:36');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (2, 101, 'student1', '2025-12-30 16:29:06');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (3, 1, 'admin', '2026-01-01 14:37:37');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (4, 1, 'admin', '2026-01-01 13:55:49');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (10, 1, 'admin', '2026-01-01 16:27:31');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (10, 2, 'admin', '2026-01-01 19:01:10');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (10, 102, 'stu01', '2026-01-01 21:41:05');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (10, 122, '2584054150@qq.com', '2026-01-01 16:30:37');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (10, 123, 'admin', '2026-01-01 19:02:21');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (10, 303, '', '2026-01-01 15:23:30');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (11, 1, 'admin', '2026-01-01 16:41:17');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (11, 102, 'stu01', '2026-01-01 21:49:08');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (11, 122, '2584054150@qq.com', '2026-01-01 16:30:30');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (11, 301, '', '2026-01-01 15:23:30');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (11, 302, '', '2026-01-01 15:23:30');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (12, 1, 'admin', '2026-01-01 20:40:36');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (13, 1, 'admin', '2026-01-01 17:52:13');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (13, 301, '', '2026-01-01 15:23:30');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (14, 1, 'admin', '2026-01-01 17:52:19');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (16, 1, 'admin', '2026-01-01 21:33:08');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (16, 102, 'stu01', '2026-01-01 21:34:31');
INSERT INTO `edu_course_student` (`course_id`, `student_id`, `create_by`, `create_time`) VALUES (17, 1, 'admin', '2026-01-01 23:32:30');
COMMIT;

-- ----------------------------
-- Table structure for edu_course_teacher
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_teacher`;
CREATE TABLE `edu_course_teacher` (
                                      `course_id` bigint NOT NULL COMMENT '课程ID',
                                      `teacher_id` bigint NOT NULL COMMENT '教师ID(sys_user.user_id)',
                                      PRIMARY KEY (`course_id`,`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='课程-教师关联表';

-- ----------------------------
-- Records of edu_course_teacher
-- ----------------------------
BEGIN;
INSERT INTO `edu_course_teacher` (`course_id`, `teacher_id`) VALUES (3, 2);
INSERT INTO `edu_course_teacher` (`course_id`, `teacher_id`) VALUES (3, 100);
INSERT INTO `edu_course_teacher` (`course_id`, `teacher_id`) VALUES (10, 1);
INSERT INTO `edu_course_teacher` (`course_id`, `teacher_id`) VALUES (10, 100);
INSERT INTO `edu_course_teacher` (`course_id`, `teacher_id`) VALUES (10, 201);
INSERT INTO `edu_course_teacher` (`course_id`, `teacher_id`) VALUES (10, 202);
INSERT INTO `edu_course_teacher` (`course_id`, `teacher_id`) VALUES (11, 201);
INSERT INTO `edu_course_teacher` (`course_id`, `teacher_id`) VALUES (11, 202);
INSERT INTO `edu_course_teacher` (`course_id`, `teacher_id`) VALUES (12, 203);
INSERT INTO `edu_course_teacher` (`course_id`, `teacher_id`) VALUES (13, 202);
INSERT INTO `edu_course_teacher` (`course_id`, `teacher_id`) VALUES (13, 203);
INSERT INTO `edu_course_teacher` (`course_id`, `teacher_id`) VALUES (14, 201);
INSERT INTO `edu_course_teacher` (`course_id`, `teacher_id`) VALUES (16, 123);
INSERT INTO `edu_course_teacher` (`course_id`, `teacher_id`) VALUES (17, 1);
INSERT INTO `edu_course_teacher` (`course_id`, `teacher_id`) VALUES (17, 2);
INSERT INTO `edu_course_teacher` (`course_id`, `teacher_id`) VALUES (17, 100);
INSERT INTO `edu_course_teacher` (`course_id`, `teacher_id`) VALUES (18, 100);
COMMIT;

-- ----------------------------
-- Table structure for edu_major
-- ----------------------------
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

-- ----------------------------
-- Records of edu_major
-- ----------------------------
BEGIN;
INSERT INTO `edu_major` (`major_id`, `major_name`, `status`, `create_time`, `update_time`) VALUES (1, '计算机', '0', '2025-12-30 15:38:15', '2026-01-01 13:10:03');
INSERT INTO `edu_major` (`major_id`, `major_name`, `status`, `create_time`, `update_time`) VALUES (2, '网络工程', '0', '2025-12-30 15:49:40', NULL);
INSERT INTO `edu_major` (`major_id`, `major_name`, `status`, `create_time`, `update_time`) VALUES (3, '信息管理', '0', '2025-12-30 15:49:45', '2025-12-30 16:50:08');
INSERT INTO `edu_major` (`major_id`, `major_name`, `status`, `create_time`, `update_time`) VALUES (4, '计算机科学', '0', '2025-12-30 16:48:11', NULL);
INSERT INTO `edu_major` (`major_id`, `major_name`, `status`, `create_time`, `update_time`) VALUES (5, '软件工程', '0', '2025-12-30 16:48:11', NULL);
INSERT INTO `edu_major` (`major_id`, `major_name`, `status`, `create_time`, `update_time`) VALUES (6, '数字媒体艺术', '0', '2025-12-31 18:00:46', NULL);
COMMIT;

-- ----------------------------
-- Table structure for edu_video
-- ----------------------------
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

-- ----------------------------
-- Records of edu_video
-- ----------------------------
BEGIN;
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (100, 100, 2, '1.1 课程介绍', NULL, 1, 1, '', '2026-01-01 14:42:14', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (101, 100, 2, '1.2 环境搭建', NULL, 2, 0, '', '2026-01-01 14:42:14', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (102, 101, 2, '2.1 核心组件', NULL, 1, 0, '', '2026-01-01 14:42:14', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1001, 201, 11, '1.1 Java 历史与发展', NULL, 1, 1, '', '2026-01-01 15:23:30', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1002, 201, 11, '1.2 开发环境搭建 (JDK + IDEA)', NULL, 2, 1, '', '2026-01-01 15:23:30', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1003, 201, 11, '1.3 第一个 Java 程序', NULL, 3, 0, '', '2026-01-01 15:23:30', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1004, 202, 11, '2.1 变量与常量', NULL, 1, 0, '', '2026-01-01 15:23:30', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1005, 202, 11, '2.2 基本数据类型', NULL, 2, 0, '', '2026-01-01 15:23:30', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1006, 203, 11, '3.1 类与对象', NULL, 1, 0, '', '2026-01-01 15:23:30', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1007, 204, 11, '4.1 数组的定义与使用', NULL, 1, 0, '', '2026-01-01 15:37:21', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1008, 204, 11, '4.2 ArrayList 集合', NULL, 2, 0, '', '2026-01-01 15:37:21', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1009, 205, 11, '5.1 try-catch 异常捕获', NULL, 1, 0, '', '2026-01-01 15:37:21', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1010, 205, 11, '5.2 自定义异常', NULL, 2, 0, '', '2026-01-01 15:37:21', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (2001, 301, 13, '1.1 Spring Boot 简介', NULL, 1, 1, '', '2026-01-01 15:23:30', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (2002, 301, 13, '1.2 快速构建 Spring Boot 项目', NULL, 2, 1, '', '2026-01-01 15:23:30', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (2003, 302, 13, '2.1 RESTful API 设计', NULL, 1, 0, '', '2026-01-01 15:23:30', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (10001, 503, 10, '1.1 映射与函数', NULL, 1, 1, '', '2026-01-01 15:33:32', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (10002, 503, 10, '1.2 数列的极限', NULL, 2, 0, '', '2026-01-01 15:33:32', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (10003, 504, 10, '2.1 导数概念', NULL, 1, 0, '', '2026-01-01 15:33:32', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (10004, 504, 10, '2.2 求导法则', NULL, 2, 0, '', '2026-01-01 15:33:32', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (40001, 401, 12, 'Listening: First Day at School', NULL, 1, 1, '', '2026-01-01 15:33:32', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (40002, 401, 12, 'Speaking: Introducing Yourself', NULL, 2, 1, '', '2026-01-01 15:33:32', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (40003, 402, 12, 'Listening: True Friends', NULL, 1, 0, '', '2026-01-01 15:33:32', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (50001, 501, 14, '1.1 二阶与三阶行列式', NULL, 1, 1, '', '2026-01-01 15:33:32', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (50002, 501, 14, '1.2 全排列与对换', NULL, 2, 0, '', '2026-01-01 15:33:32', '', NULL);
INSERT INTO `edu_video` (`video_id`, `chapter_id`, `course_id`, `video_name`, `video_source_id`, `sort`, `is_free`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (50003, 502, 14, '2.1 矩阵的概念', NULL, 1, 0, '', '2026-01-01 15:33:32', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
                             `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                             `table_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表名称',
                             `table_comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '表描述',
                             `sub_table_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '关联子表的表名',
                             `sub_table_fk_name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '子表关联的外键名',
                             `class_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '实体类名称',
                             `tpl_category` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
                             `tpl_web_type` varchar(30) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
                             `package_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成包路径',
                             `module_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成模块名',
                             `business_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成业务名',
                             `function_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能名',
                             `function_author` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '生成功能作者',
                             `gen_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
                             `gen_path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
                             `options` varchar(1000) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '其它生成选项',
                             `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
                             `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                             `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
                             `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                             `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                             PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `tpl_web_type`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 'edu_course', '课程信息表', NULL, NULL, 'EduCourse', 'crud', '', 'com.ruoyi.system', 'system', 'course', '课程信息', 'ruoyi', '0', '/', NULL, 'admin', '2025-12-31 10:29:08', '', NULL, NULL);
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `tpl_web_type`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 'edu_major', '专业信息表', NULL, NULL, 'EduMajor', 'crud', 'element-plus', 'com.ruoyi.system', 'system', 'major', '专业信息', 'moon', '0', '/', '{\"parentMenuId\":\"\"}', 'admin', '2025-12-31 16:27:09', '', '2025-12-31 16:28:08', NULL);
INSERT INTO `gen_table` (`table_id`, `table_name`, `table_comment`, `sub_table_name`, `sub_table_fk_name`, `class_name`, `tpl_category`, `tpl_web_type`, `package_name`, `module_name`, `business_name`, `function_name`, `function_author`, `gen_type`, `gen_path`, `options`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 'edu_class', '班级信息表', NULL, NULL, 'EduClass', 'crud', '', 'com.ruoyi.system', 'system', 'class', '班级信息', 'ruoyi', '0', '/', NULL, 'admin', '2026-01-01 13:29:23', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
                                    `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
                                    `table_id` bigint DEFAULT NULL COMMENT '归属表编号',
                                    `column_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列名称',
                                    `column_comment` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列描述',
                                    `column_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '列类型',
                                    `java_type` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA类型',
                                    `java_field` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'JAVA字段名',
                                    `is_pk` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否主键（1是）',
                                    `is_increment` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否自增（1是）',
                                    `is_required` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否必填（1是）',
                                    `is_insert` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否为插入字段（1是）',
                                    `is_edit` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否编辑字段（1是）',
                                    `is_list` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否列表字段（1是）',
                                    `is_query` char(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否查询字段（1是）',
                                    `query_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
                                    `html_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
                                    `dict_type` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
                                    `sort` int DEFAULT NULL COMMENT '排序',
                                    `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
                                    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                    `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
                                    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                    PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (1, 1, 'course_id', '课程ID', 'bigint', 'Long', 'courseId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-12-31 10:29:08', '', NULL);
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (2, 1, 'course_name', '课程名称（如：Java程序设计）', 'varchar(50)', 'String', 'courseName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-12-31 10:29:08', '', NULL);
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (3, 1, 'teacher_id', '授课教师ID（关联sys_user.user_id）', 'bigint', 'Long', 'teacherId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2025-12-31 10:29:08', '', NULL);
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (4, 1, 'grade', '适用年级', 'varchar(20)', 'String', 'grade', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2025-12-31 10:29:08', '', NULL);
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (5, 1, 'major_id', NULL, 'bigint', 'Long', 'majorId', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2025-12-31 10:29:08', '', NULL);
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (6, 1, 'course_desc', '课程描述', 'varchar(500)', 'String', 'courseDesc', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 6, 'admin', '2025-12-31 10:29:08', '', NULL);
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (7, 1, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2025-12-31 10:29:08', '', NULL);
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (8, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2025-12-31 10:29:08', '', NULL);
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (9, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2025-12-31 10:29:08', '', NULL);
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (10, 2, 'major_id', '专业ID', 'bigint', 'Long', 'majorId', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2025-12-31 16:27:09', '', '2025-12-31 16:28:08');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (11, 2, 'major_name', '专业名称（如：计算机科学与技术）', 'varchar(50)', 'String', 'majorName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2025-12-31 16:27:09', '', '2025-12-31 16:28:08');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (12, 2, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 3, 'admin', '2025-12-31 16:27:09', '', '2025-12-31 16:28:08');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (13, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 4, 'admin', '2025-12-31 16:27:09', '', '2025-12-31 16:28:08');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (14, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2025-12-31 16:27:09', '', '2025-12-31 16:28:08');
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (15, 3, 'class_id', '班级ID', 'bigint', 'Long', 'classId', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-01-01 13:29:23', '', NULL);
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (16, 3, 'class_name', '班级名称（如：2024级计算机1班）', 'varchar(50)', 'String', 'className', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2026-01-01 13:29:23', '', NULL);
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (17, 3, 'grade', '年级（如：2024级）', 'varchar(20)', 'String', 'grade', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2026-01-01 13:29:23', '', NULL);
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (18, 3, 'major_id', NULL, 'bigint', 'Long', 'majorId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2026-01-01 13:29:23', '', NULL);
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (19, 3, 'teacher_id', '班主任ID（关联sys_user.user_id）', 'bigint', 'Long', 'teacherId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2026-01-01 13:29:23', '', NULL);
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (20, 3, 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 6, 'admin', '2026-01-01 13:29:23', '', NULL);
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (21, 3, 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2026-01-01 13:29:23', '', NULL);
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (22, 3, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2026-01-01 13:29:23', '', NULL);
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (23, 3, 'update_by', '更新人', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2026-01-01 13:29:23', '', NULL);
INSERT INTO `gen_table_column` (`column_id`, `table_id`, `column_name`, `column_comment`, `column_type`, `java_type`, `java_field`, `is_pk`, `is_increment`, `is_required`, `is_insert`, `is_edit`, `is_list`, `is_query`, `query_type`, `html_type`, `dict_type`, `sort`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (24, 3, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2026-01-01 13:29:23', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
                                      `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                      `trigger_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                      `trigger_group` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                      `blob_data` blob COMMENT '存放持久化Trigger对象',
                                      PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
                                      CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
                                  `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                  `calendar_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
                                  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
                                  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='日历信息表';

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
                                      `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                      `trigger_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                      `trigger_group` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                      `cron_expression` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
                                      `time_zone_id` varchar(80) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '时区',
                                      PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
                                      CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
                                       `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                       `entry_id` varchar(95) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
                                       `trigger_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                       `trigger_group` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                       `instance_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
                                       `fired_time` bigint NOT NULL COMMENT '触发的时间',
                                       `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
                                       `priority` int NOT NULL COMMENT '优先级',
                                       `state` varchar(16) COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
                                       `job_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务名称',
                                       `job_group` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '任务组名',
                                       `is_nonconcurrent` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否并发',
                                       `requests_recovery` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否接受恢复执行',
                                       PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
                                    `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                    `job_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
                                    `job_group` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
                                    `description` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '相关介绍',
                                    `job_class_name` varchar(250) COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
                                    `is_durable` varchar(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
                                    `is_nonconcurrent` varchar(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
                                    `is_update_data` varchar(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
                                    `requests_recovery` varchar(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
                                    `job_data` blob COMMENT '存放持久化job对象',
                                    PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='任务详细信息表';

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
                              `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                              `lock_name` varchar(40) COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
                              PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
                                            `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                            `trigger_group` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                            PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
                                        `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                        `instance_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
                                        `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
                                        `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
                                        PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='调度器状态表';

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
                                        `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                        `trigger_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                        `trigger_group` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                        `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
                                        `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
                                        `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
                                        PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
                                        CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
                                         `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                         `trigger_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
                                         `trigger_group` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
                                         `str_prop_1` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
                                         `str_prop_2` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
                                         `str_prop_3` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
                                         `int_prop_1` int DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
                                         `int_prop_2` int DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
                                         `long_prop_1` bigint DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
                                         `long_prop_2` bigint DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
                                         `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
                                         `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
                                         `bool_prop_1` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
                                         `bool_prop_2` varchar(1) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
                                         PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
                                         CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
                                 `sched_name` varchar(120) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
                                 `trigger_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
                                 `trigger_group` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
                                 `job_name` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
                                 `job_group` varchar(200) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
                                 `description` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '相关介绍',
                                 `next_fire_time` bigint DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
                                 `prev_fire_time` bigint DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
                                 `priority` int DEFAULT NULL COMMENT '优先级',
                                 `trigger_state` varchar(16) COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
                                 `trigger_type` varchar(8) COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
                                 `start_time` bigint NOT NULL COMMENT '开始时间',
                                 `end_time` bigint DEFAULT NULL COMMENT '结束时间',
                                 `calendar_name` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日程表名称',
                                 `misfire_instr` smallint DEFAULT NULL COMMENT '补偿执行的策略',
                                 `job_data` blob COMMENT '存放持久化job对象',
                                 PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
                                 KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
                                 CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
                              `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
                              `config_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数名称',
                              `config_key` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键名',
                              `config_value` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '参数键值',
                              `config_type` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
                              `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
                              `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2025-12-30 13:49:21', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2025-12-30 13:49:21', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2025-12-30 13:49:21', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2025-12-30 13:49:21', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2025-12-30 13:49:21', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2025-12-30 13:49:21', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2025-12-30 13:49:21', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2025-12-30 13:49:21', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
                            `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
                            `parent_id` bigint DEFAULT '0' COMMENT '父部门id',
                            `ancestors` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '祖级列表',
                            `dept_name` varchar(30) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
                            `order_num` int DEFAULT '0' COMMENT '显示顺序',
                            `leader` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '负责人',
                            `phone` varchar(11) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '联系电话',
                            `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
                            `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
                            `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-30 13:49:21', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-30 13:49:21', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-30 13:49:21', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-30 13:49:21', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-30 13:49:21', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-30 13:49:21', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-30 13:49:21', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-30 13:49:21', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-30 13:49:21', '', NULL);
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2025-12-30 13:49:21', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
                                 `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
                                 `dict_sort` int DEFAULT '0' COMMENT '字典排序',
                                 `dict_label` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典标签',
                                 `dict_value` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典键值',
                                 `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
                                 `css_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
                                 `list_class` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '表格回显样式',
                                 `is_default` char(1) COLLATE utf8mb4_general_ci DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
                                 `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                 `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                                 PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '性别男');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '性别女');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '通知');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '公告');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '停用状态');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
                                 `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
                                 `dict_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典名称',
                                 `dict_type` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '字典类型',
                                 `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1停用）',
                                 `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
                                 `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                                 `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
                                 `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                                 `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                                 PRIMARY KEY (`dict_id`),
                                 UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '登录状态列表');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
                           `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
                           `job_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
                           `job_group` varchar(64) COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
                           `invoke_target` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
                           `cron_expression` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT 'cron执行表达式',
                           `misfire_policy` varchar(20) COLLATE utf8mb4_general_ci DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
                           `concurrent` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
                           `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '状态（0正常 1暂停）',
                           `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
                           `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                           `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
                           `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                           `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注信息',
                           PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `invoke_target`, `cron_expression`, `misfire_policy`, `concurrent`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2025-12-30 13:49:21', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
                               `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
                               `job_name` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
                               `job_group` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
                               `invoke_target` varchar(500) COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
                               `job_message` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '日志信息',
                               `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
                               `exception_info` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '异常信息',
                               `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                               PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
                                  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
                                  `user_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户账号',
                                  `ipaddr` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录IP地址',
                                  `login_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '登录地点',
                                  `browser` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '浏览器类型',
                                  `os` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作系统',
                                  `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
                                  `msg` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '提示消息',
                                  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
                                  PRIMARY KEY (`info_id`),
                                  KEY `idx_sys_logininfor_s` (`status`),
                                  KEY `idx_sys_logininfor_lt` (`login_time`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2025-12-30 13:52:32');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2025-12-30 14:28:03');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2025-12-30 14:28:16');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2025-12-30 14:45:08');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2025-12-30 14:45:11');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2025-12-30 15:02:18');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2025-12-30 15:02:21');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2025-12-30 16:24:49');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2025-12-30 16:24:55');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (109, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2025-12-30 16:25:06');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (110, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2025-12-30 16:27:49');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (111, 'student1', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '1', '用户不存在/密码错误', '2025-12-30 16:28:04');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2025-12-30 16:28:12');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2025-12-30 16:28:27');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (114, 'student1', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2025-12-30 16:28:40');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (115, 'student1', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2025-12-30 16:46:41');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2025-12-30 16:46:43');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2025-12-30 16:50:45');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (118, 'student1', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2025-12-30 16:50:57');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (119, 'student1', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2025-12-30 16:52:18');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2025-12-30 16:52:22');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2025-12-31 10:09:16');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2025-12-31 13:16:51');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2025-12-31 16:24:32');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2025-12-31 17:27:26');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 10:00:35');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 10:10:30');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 10:12:39');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 10:20:43');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 10:23:40');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '1', '验证码错误', '2026-01-01 10:24:42');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 10:24:49');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 10:24:58');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (133, '2584054150@qq.com', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '注册成功', '2026-01-01 11:25:52');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (134, 'moon', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '1', '用户不存在/密码错误', '2026-01-01 11:26:06');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (135, '2584054150@qq.com', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 11:26:20');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (136, '2584054150@qq.com', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 11:29:11');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 11:30:59');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 11:32:24');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 11:35:01');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 13:07:02');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 14:10:57');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 14:18:40');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 14:35:49');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 14:35:58');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 14:36:06');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 14:37:36');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 14:51:51');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 15:13:57');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 15:22:03');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 15:22:47');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 15:23:42');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 15:24:27');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 15:25:46');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '1', '验证码错误', '2026-01-01 15:25:51');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 15:25:53');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 15:26:29');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 15:29:45');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 15:30:41');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 15:32:02');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 15:53:35');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 15:56:18');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 15:57:56');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (163, 'teacher_li', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '1', '用户不存在/密码错误', '2026-01-01 15:58:05');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (164, 'teacher_li', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '1', '验证码错误', '2026-01-01 15:58:10');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (165, 'teacher_li', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '1', '用户不存在/密码错误', '2026-01-01 15:58:13');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (166, 'teacher_li', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '1', '验证码错误', '2026-01-01 15:58:46');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (167, 'teacher_li', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '1', '用户不存在/密码错误', '2026-01-01 15:58:49');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (168, '李华老师', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '1', '验证码错误', '2026-01-01 15:59:27');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (169, '李华老师', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '1', '用户不存在/密码错误', '2026-01-01 15:59:30');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (170, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 16:00:50');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (171, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 16:27:19');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 16:27:29');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 16:28:16');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (174, '2584054150@qq.com', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 16:28:23');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (175, '2584054150@qq.com', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 16:30:49');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 16:30:55');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 16:44:08');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 16:44:12');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 18:45:40');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 18:45:56');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 20:37:40');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 20:39:05');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 20:39:07');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 20:39:16');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 20:39:20');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 21:25:29');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 21:25:32');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 21:26:49');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 21:26:52');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 21:29:10');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 21:29:14');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 21:29:47');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '1', '验证码错误', '2026-01-01 21:29:50');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 21:29:53');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 21:33:34');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '1', '验证码错误', '2026-01-01 21:33:39');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 21:33:43');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 21:34:05');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (199, 'stu01', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 21:34:14');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (200, 'stu01', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 21:37:16');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 21:37:19');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 21:40:50');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (203, 'stu01', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 21:41:01');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (204, 'stu01', '127.0.0.1', '内网IP', 'Edge 143', 'Mac OS 10.15.7', '0', '登录成功', '2026-01-01 21:42:46');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (205, 'stu01', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 21:43:14');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 21:43:18');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 22:38:19');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Mac OS 10.15.7', '0', '登录成功', '2026-01-01 22:41:25');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 22:44:39');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (210, 'stu01', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 22:44:50');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Edge 143', 'Mac OS 10.15.7', '0', '退出成功', '2026-01-01 23:11:08');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (212, 'stu01', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 23:11:25');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 23:13:28');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (214, 'stu01', '127.0.0.1', '内网IP', 'Edge 143', 'Mac OS 10.15.7', '0', '登录成功', '2026-01-01 23:39:26');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (215, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 23:40:47');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 23:41:14');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (217, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '退出成功', '2026-01-01 23:41:19');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '1', '用户不存在/密码错误', '2026-01-01 23:41:40');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '1', '用户不存在/密码错误', '2026-01-01 23:41:45');
INSERT INTO `sys_logininfor` (`info_id`, `user_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES (220, 'stu01', '127.0.0.1', '内网IP', 'Chrome 139', 'Mac OS >=10.15.7', '0', '登录成功', '2026-01-01 23:41:57');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
                            `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
                            `menu_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
                            `parent_id` bigint DEFAULT '0' COMMENT '父菜单ID',
                            `order_num` int DEFAULT '0' COMMENT '显示顺序',
                            `path` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由地址',
                            `component` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '组件路径',
                            `query` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '路由参数',
                            `route_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '路由名称',
                            `is_frame` int DEFAULT '1' COMMENT '是否为外链（0是 1否）',
                            `is_cache` int DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
                            `menu_type` char(1) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
                            `visible` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
                            `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
                            `perms` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '权限标识',
                            `icon` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '#' COMMENT '菜单图标',
                            `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '备注',
                            PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2035 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '系统管理', 0, 7, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2025-12-30 13:49:21', 'admin', '2026-01-01 17:20:30', '系统管理目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '系统监控', 0, 8, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2025-12-30 13:49:21', 'admin', '2026-01-01 17:20:07', '系统监控目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, '系统工具', 0, 8, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2025-12-30 13:49:21', 'admin', '2026-01-01 17:29:28', '系统工具目录');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, '若依官网', 0, 7, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2025-12-30 13:49:21', 'admin', '2026-01-01 17:20:41', '若依官网地址');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, '用户管理', 0, 1, 'sys-user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2025-12-30 13:49:21', 'admin', '2026-01-01 17:21:10', '用户管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, '角色管理', 0, 2, 'sys-role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2025-12-30 13:49:21', 'admin', '2026-01-01 17:17:28', '角色管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2025-12-30 13:49:21', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2025-12-30 13:49:21', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2025-12-30 13:49:21', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2025-12-30 13:49:21', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2025-12-30 13:49:21', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2025-12-30 13:49:21', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2025-12-30 13:49:21', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2025-12-30 13:49:21', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2025-12-30 13:49:21', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2025-12-30 13:49:21', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2025-12-30 13:49:21', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2025-12-30 13:49:21', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2025-12-30 13:49:21', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2025-12-30 13:49:21', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2025-12-30 13:49:21', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2025-12-30 13:49:21', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2025-12-30 13:49:21', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2025-12-30 13:49:21', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2019, '专业信息', 0, 3, 'major', 'edu/major/index', NULL, '', 1, 0, 'C', '0', '0', 'edu:major:list', 'build', 'admin', '2025-12-31 16:36:57', 'admin', '2026-01-01 17:23:45', '专业信息菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2020, '专业信息查询', 2019, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'edu:major:query', '#', 'admin', '2025-12-31 16:36:58', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2021, '专业信息新增', 2019, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'edu:major:add', '#', 'admin', '2025-12-31 16:36:58', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2022, '专业信息修改', 2019, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'edu:major:edit', '#', 'admin', '2025-12-31 16:36:58', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2023, '专业信息删除', 2019, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'edu:major:remove', '#', 'admin', '2025-12-31 16:36:58', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2024, '专业信息导出', 2019, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'edu:major:export', '#', 'admin', '2025-12-31 16:36:58', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2025, '班级管理', 0, 4, 'class', 'edu/class/index', NULL, '', 1, 0, 'C', '0', '0', 'edu:class:list', 'peoples', 'admin', '2025-12-31 17:05:15', 'admin', '2026-01-01 17:23:57', '班级管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2026, '班级查询', 2025, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'edu:class:query', '#', 'admin', '2025-12-31 17:05:15', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2027, '班级新增', 2025, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'edu:class:add', '#', 'admin', '2025-12-31 17:05:15', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2028, '班级修改', 2025, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'edu:class:edit', '#', 'admin', '2025-12-31 17:05:15', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2029, '班级删除', 2025, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'edu:class:remove', '#', 'admin', '2025-12-31 17:05:15', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2030, '班级导出', 2025, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'edu:class:export', '#', 'admin', '2025-12-31 17:05:15', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2031, '班级邀请', 2025, 6, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'edu:class:invite', '#', 'admin', '2025-12-31 17:05:15', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2032, '班级加入', 2025, 7, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'edu:class:join', '#', 'admin', '2025-12-31 17:05:15', '', NULL, '');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2033, '课程管理', 0, 5, 'course', 'edu/course/index', NULL, '', 1, 0, 'C', '0', '0', 'edu:course:list', 'education', 'admin', '2025-12-31 17:05:15', 'admin', '2026-01-01 17:24:09', '课程管理菜单');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8000,'知识图谱', 0, 6, 'knowledge','edu/knowledge/index','' , '', 1,0,'C','0','0', 'edu:knowledge:list', 'tree', 'admin', '2025-12-31 17:05:15', 'admin', '2026-01-01 17:24:09', '知识图谱');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8001,'知识点查询', 8000, 1, '','','' , '', 1,0,'F','0','0', 'edu:knowledge:query', '#', 'admin', '2025-12-31 17:05:15', 'admin', NULL, '知识图谱');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8002,'知识点新增', 8000, 2, '','','' , '', 1,0,'F','0','0', 'edu:knowledge:add', '#', 'admin', '2025-12-31 17:05:15', 'admin', NULL, '知识图谱');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8003,'知识点修改', 8000, 3, '','','' , '', 1,0,'F','0','0', 'edu:knowledge:edit', '#', 'admin', '2025-12-31 17:05:15', 'admin', NULL, '知识图谱');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8004,'知识点删除', 8000, 4, '','','' , '', 1,0,'F','0','0', 'edu:knowledge:remove', '#', 'admin', '2025-12-31 17:05:15', 'admin', NULL, '知识图谱');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8005,'知识点导出', 8000, 5, '','','' , '', 1,0,'F','0','0', 'edu:knowledge:export', '#', 'admin', '2025-12-31 17:05:15', 'admin', NULL, '知识图谱');
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `path`, `component`, `query`, `route_name`, `is_frame`, `is_cache`, `menu_type`, `visible`, `status`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (8006,'知识图谱展示', 8000, 6, '','','' , '', 1,0,'F','0','0', 'edu:knowledge:show', '#', 'admin', '2025-12-31 17:05:15', 'admin', NULL, '知识图谱');

COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
                              `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
                              `notice_title` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
                              `notice_type` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
                              `notice_content` longblob COMMENT '公告内容',
                              `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
                              `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
                              `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                              `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
                              `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                              `remark` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                              PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2025-12-30 13:49:21', '', NULL, '管理员');
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2025-12-30 13:49:21', '', NULL, '管理员');
INSERT INTO `sys_notice` (`notice_id`, `notice_title`, `notice_type`, `notice_content`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (10, '期末考试时间', '2', 0x3132E69C883331E58FB7E69C9FE69CABE88083E8AF95, '0', 'teacher1', '2026-01-01 16:26:57', '', NULL, 'course:10');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
                                `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
                                `title` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '模块标题',
                                `business_type` int DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
                                `method` varchar(200) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '方法名称',
                                `request_method` varchar(10) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求方式',
                                `operator_type` int DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
                                `oper_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作人员',
                                `dept_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '部门名称',
                                `oper_url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求URL',
                                `oper_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '主机地址',
                                `oper_location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '操作地点',
                                `oper_param` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '请求参数',
                                `json_result` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '返回参数',
                                `status` int DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
                                `error_msg` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '错误消息',
                                `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
                                `cost_time` bigint DEFAULT '0' COMMENT '消耗时间',
                                PRIMARY KEY (`oper_id`),
                                KEY `idx_sys_oper_log_bt` (`business_type`),
                                KEY `idx_sys_oper_log_s` (`status`),
                                KEY `idx_sys_oper_log_ot` (`oper_time`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (100, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4 ', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2025-12-30 15:55:13', 8);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (101, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":101} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-30 16:28:24', 70);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (102, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2025-12-31 10:46:59', 475);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (103, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"edu_major\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 16:27:09', 49);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (104, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"major\",\"className\":\"EduMajor\",\"columns\":[{\"capJavaField\":\"MajorId\",\"columnComment\":\"专业ID\",\"columnId\":10,\"columnName\":\"major_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2025-12-31 16:27:09\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"majorId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MajorName\",\"columnComment\":\"专业名称（如：计算机科学与技术）\",\"columnId\":11,\"columnName\":\"major_name\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-31 16:27:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"majorName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"状态（0正常 1停用）\",\"columnId\":12,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2025-12-31 16:27:09\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"status\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":13,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2025-12-31 16:27:09\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"0\",\"isRequired\":\"0\",\"javaField\":\"cr', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 16:28:08', 23);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (105, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"edu_major\"}', NULL, 0, NULL, '2025-12-31 16:28:11', 100);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (106, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/major/index\",\"createTime\":\"2025-12-31 16:36:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"专业信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"major\",\"perms\":\"system:major:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 16:58:48', 17);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (107, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"教育管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"edu\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 17:46:17', 18);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (108, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"edu/major/index\",\"createTime\":\"2025-12-31 16:36:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"专业信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2034,\"path\":\"major\",\"perms\":\"system:major:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 17:46:26', 17);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (109, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"edu/class/index\",\"createTime\":\"2025-12-31 17:05:15\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"班级管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2034,\"path\":\"class\",\"perms\":\"system:class:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 17:46:37', 11);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (110, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"edu/course/index\",\"createTime\":\"2025-12-31 17:05:15\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2034,\"path\":\"course\",\"perms\":\"system:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 17:46:48', 14);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (111, '专业信息', 1, 'com.ruoyi.web.controller.edu.EduMajorController.add()', 'POST', 1, 'admin', '研发部门', '/edu/major', '127.0.0.1', '内网IP', '{\"createTime\":\"2025-12-31 18:00:46\",\"majorId\":6,\"majorName\":\"数字媒体艺术\",\"params\":{}} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 18:00:46', 17);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (112, '专业信息', 2, 'com.ruoyi.web.controller.edu.EduMajorController.edit()', 'PUT', 1, 'admin', '研发部门', '/edu/major', '127.0.0.1', '内网IP', '{\"majorId\":1,\"params\":{},\"status\":\"1\",\"updateTime\":\"2025-12-31 18:02:28\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 18:02:28', 9);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (113, '专业信息', 2, 'com.ruoyi.web.controller.edu.EduMajorController.edit()', 'PUT', 1, 'admin', '研发部门', '/edu/major', '127.0.0.1', '内网IP', '{\"majorId\":1,\"params\":{},\"status\":\"0\",\"updateTime\":\"2025-12-31 18:02:31\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 18:02:32', 8);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (114, '专业信息', 2, 'com.ruoyi.web.controller.edu.EduMajorController.edit()', 'PUT', 1, 'admin', '研发部门', '/edu/major', '127.0.0.1', '内网IP', '{\"majorId\":1,\"params\":{},\"status\":\"1\",\"updateTime\":\"2025-12-31 18:03:26\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 18:03:26', 5);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (115, '专业信息', 2, 'com.ruoyi.web.controller.edu.EduMajorController.edit()', 'PUT', 1, 'admin', '研发部门', '/edu/major', '127.0.0.1', '内网IP', '{\"majorId\":1,\"params\":{},\"status\":\"0\",\"updateTime\":\"2025-12-31 18:03:28\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2025-12-31 18:03:28', 7);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (116, '专业信息', 2, 'com.ruoyi.web.controller.edu.EduMajorController.edit()', 'PUT', 1, 'admin', '研发部门', '/edu/major', '127.0.0.1', '内网IP', '{\"majorId\":1,\"params\":{},\"status\":\"1\",\"updateTime\":\"2026-01-01 10:00:50\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 10:00:50', 6);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (117, '专业信息', 2, 'com.ruoyi.web.controller.edu.EduMajorController.edit()', 'PUT', 1, 'admin', '研发部门', '/edu/major', '127.0.0.1', '内网IP', '{\"majorId\":1,\"params\":{},\"status\":\"0\",\"updateTime\":\"2026-01-01 10:00:54\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 10:00:54', 7);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (118, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2026-01-01 10:04:16', 210);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (119, '专业信息', 2, 'com.ruoyi.web.controller.edu.EduMajorController.edit()', 'PUT', 1, 'admin', '研发部门', '/edu/major', '127.0.0.1', '内网IP', '{\"majorId\":1,\"params\":{},\"status\":\"1\",\"updateTime\":\"2026-01-01 13:09:56\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 13:09:56', 13);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (120, '专业信息', 2, 'com.ruoyi.web.controller.edu.EduMajorController.edit()', 'PUT', 1, 'admin', '研发部门', '/edu/major', '127.0.0.1', '内网IP', '{\"majorId\":1,\"params\":{},\"status\":\"0\",\"updateTime\":\"2026-01-01 13:10:03\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 13:10:03', 4);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (121, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":100} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 13:23:38', 10);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (122, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 13:23:49', 6);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (123, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"陈老师\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"status\":\"1\",\"userId\":123,\"userName\":\"陈老师\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 13:25:16', 78);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (124, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":123} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 13:25:27', 5);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (125, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"edu_class\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 13:29:23', 42);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (126, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/ca7c1aa4f4ee46ceb45c635b726b1fc8.png\",\"code\":200}', 0, NULL, '2026-01-01 16:39:12', 43);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (127, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/9d2e52759c66460fb6f7f958ef7fa30b.png\",\"code\":200}', 0, NULL, '2026-01-01 16:44:21', 9);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (128, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/de74060280c74195b1a0398fc3eff7e6.png\",\"code\":200}', 0, NULL, '2026-01-01 16:48:36', 20);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (129, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/9d9d5fd96b2b495ab8f8f1bcf42bee09.png\",\"code\":200}', 0, NULL, '2026-01-01 16:49:56', 35);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (130, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/3d6f329902cb4d638e49eb398b78acd2.png\",\"code\":200}', 0, NULL, '2026-01-01 16:51:02', 30);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (131, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"0\"} ', '{\"msg\":\"请输入密码以确认修改\",\"code\":500}', 0, NULL, '2026-01-01 16:52:06', 7);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (132, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"} ', '{\"msg\":\"请输入密码以确认修改\",\"code\":500}', 0, NULL, '2026-01-01 16:52:14', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (133, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/e104de6d7e6e4ecf8f00b113cef34bc5.png\",\"code\":200}', 0, NULL, '2026-01-01 16:53:56', 27);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (134, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/7302791d42d3429289cc8d809ade9c1e.png\",\"code\":200}', 0, NULL, '2026-01-01 16:55:31', 6);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (135, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"} ', '{\"msg\":\"修改个人信息失败，密码错误\",\"code\":500}', 0, NULL, '2026-01-01 16:55:48', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (136, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"} ', '{\"msg\":\"修改个人信息失败，密码错误\",\"code\":500}', 0, NULL, '2026-01-01 16:55:53', 1);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (137, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"} ', '{\"msg\":\"修改个人信息失败，密码错误\",\"code\":500}', 0, NULL, '2026-01-01 16:56:02', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (138, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"} ', '{\"msg\":\"修改个人信息失败，密码错误\",\"code\":500}', 0, NULL, '2026-01-01 16:56:05', 0);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (139, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/d9580affa840497c855c473a0fa9e51c.png\",\"code\":200}', 0, NULL, '2026-01-01 16:57:49', 24);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (140, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"sex\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 16:59:01', 88);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (141, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/494fdee3ee9944e3a225e387635749f1.png\",\"code\":200}', 0, NULL, '2026-01-01 17:00:28', 24);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (142, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2026-01-01 17:09:26', 1014);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (143, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2026-01-01 17:13:07', 481);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (144, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:17:24', 12);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (145, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:17:28', 6);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (146, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:17:38', 9);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (147, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:17:48', 10);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (148, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:17:55', 7);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (149, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"edu/major/index\",\"createTime\":\"2025-12-31 16:36:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"专业信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"major\",\"perms\":\"edu:major:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:19:16', 11);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (150, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"edu/class/index\",\"createTime\":\"2025-12-31 17:05:15\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"班级管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"class\",\"perms\":\"edu:class:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:19:32', 8);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (151, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"edu/course/index\",\"createTime\":\"2025-12-31 17:05:15\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"course\",\"perms\":\"edu:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:19:49', 6);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (152, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"edu/major/index\",\"createTime\":\"2025-12-31 16:36:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"专业信息\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"major\",\"perms\":\"edu:major:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:20:03', 10);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (153, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:20:07', 10);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (154, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"edu/class/index\",\"createTime\":\"2025-12-31 17:05:15\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"班级管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"class\",\"perms\":\"edu:class:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:20:17', 7);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (155, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-31 17:46:17\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2034,\"menuName\":\"教育管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"edu\",\"perms\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:20:21', 11);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (156, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"edu/course/index\",\"createTime\":\"2025-12-31 17:05:15\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"course\",\"perms\":\"edu:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:20:26', 7);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (157, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:20:30', 6);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (158, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '4 ', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2026-01-01 17:20:36', 7);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (159, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:20:41', 9);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (160, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/user/index\",\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"user\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":100,\"menuName\":\"用户管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"user\",\"perms\":\"system:user:list\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:21:10', 5);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (161, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"edu/major/index\",\"createTime\":\"2025-12-31 16:36:57\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"专业信息\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"major\",\"perms\":\"edu:major:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:23:45', 8);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (162, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"edu/class/index\",\"createTime\":\"2025-12-31 17:05:15\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"班级管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"class\",\"perms\":\"edu:class:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:23:57', 9);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (163, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"edu/course/index\",\"createTime\":\"2025-12-31 17:05:15\",\"icon\":\"tree\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"课程管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"course\",\"perms\":\"edu:course:list\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:24:09', 8);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (164, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"nickName\":\"221002206\",\"params\":{},\"postIds\":[],\"roleIds\":[101],\"status\":\"0\",\"userId\":304,\"userName\":\"221002206\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:27:18', 89);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (165, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2025-12-30 13:49:21\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"routeName\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:29:28', 10);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (166, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/2034', '127.0.0.1', '内网IP', '2034 ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:30:06', 8);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (167, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '研发部门', '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"2,100\",\"userId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:31:42', 7);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (168, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '研发部门', '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"2,100,101\",\"userId\":\"2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 17:31:54', 9);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (169, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/acd7b01b8ead4a6f9b8b52b41f183ece.png\",\"code\":200}', 0, NULL, '2026-01-01 21:20:32', 22);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (170, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/c9945d3d13bf4d0bb80fd95a7c318795.png\",\"code\":200}', 0, NULL, '2026-01-01 21:22:33', 5);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (171, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":102} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 21:34:01', 72);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (172, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'stu01', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2026/01/01/27c93afb66cb441d95b718f6f67a0346.png\",\"code\":200}', 0, NULL, '2026-01-01 21:34:46', 7);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (173, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'stu01', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":false,\"email\":\"1231234123@qq.com\",\"nickName\":\"stu01\",\"params\":{},\"phonenumber\":\"13684843434\",\"sex\":\"1\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 21:35:21', 75);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (174, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/role/2', '127.0.0.1', '内网IP', '[2] ', NULL, 1, '普通角色已分配,不能删除', '2026-01-01 21:52:44', 16);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (175, '角色管理', 4, 'com.ruoyi.web.controller.system.SysRoleController.cancelAuthUser()', 'PUT', 1, 'admin', '研发部门', '/system/role/authUser/cancel', '127.0.0.1', '内网IP', '{\"roleId\":2,\"userId\":2} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 21:52:49', 9);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (176, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/role/2', '127.0.0.1', '内网IP', '[2] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-01-01 21:52:55', 18);
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `request_method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `json_result`, `status`, `error_msg`, `oper_time`, `cost_time`) VALUES (177, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '研发部门', '/system/user/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2026-01-01 22:46:04', 34);
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
                            `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
                            `post_code` varchar(64) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
                            `post_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
                            `post_sort` int NOT NULL COMMENT '显示顺序',
                            `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
                            `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2025-12-30 13:49:21', '', NULL, '');
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2025-12-30 13:49:21', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
                            `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
                            `role_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
                            `role_key` varchar(100) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
                            `role_sort` int NOT NULL COMMENT '显示顺序',
                            `data_scope` char(1) COLLATE utf8mb4_general_ci DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
                            `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
                            `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
                            `status` char(1) COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
                            `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2025-12-30 13:49:21', '', NULL, '超级管理员');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '2', 'admin', '2025-12-30 13:49:21', '', NULL, '普通角色');
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, '教师', 'teacher', 3, '1', 1, 1, '0', '0', '', '2025-12-30 16:13:48', '', NULL, NULL);
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `menu_check_strictly`, `dept_check_strictly`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, '学生', 'student', 4, '1', 1, 1, '0', '0', '', '2025-12-30 16:13:48', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
                                 `role_id` bigint NOT NULL COMMENT '角色ID',
                                 `dept_id` bigint NOT NULL COMMENT '部门ID',
                                 PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
                                 `role_id` bigint NOT NULL COMMENT '角色ID',
                                 `menu_id` bigint NOT NULL COMMENT '菜单ID',
                                 PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2003);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2017);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (1, 2018);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2002);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2005);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2011);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2012);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2013);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2014);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2015);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2016);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (100, 2017);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 2000);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 2001);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 2004);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 2010);
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES (101, 2018);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
                            `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
                            `dept_id` bigint DEFAULT NULL COMMENT '部门ID',
                            `user_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
                            `nick_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
                            `user_type` varchar(2) COLLATE utf8mb4_general_ci DEFAULT '00' COMMENT '用户类型（00系统用户）',
                            `email` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '用户邮箱',
                            `phonenumber` varchar(11) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '手机号码',
                            `sex` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
                            `avatar` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
                            `password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '密码',
                            `status` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
                            `del_flag` char(1) COLLATE utf8mb4_general_ci DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
                            `login_ip` varchar(128) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '最后登录IP',
                            `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
                            `pwd_update_date` datetime DEFAULT NULL COMMENT '密码最后更新时间',
                            `create_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '创建者',
                            `create_time` datetime DEFAULT NULL COMMENT '创建时间',
                            `update_by` varchar(64) COLLATE utf8mb4_general_ci DEFAULT '' COMMENT '更新者',
                            `update_time` datetime DEFAULT NULL COMMENT '更新时间',
                            `remark` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
                            PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2026/01/01/c9945d3d13bf4d0bb80fd95a7c318795.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-01-01 23:41:15', '2025-12-30 13:49:21', 'admin', '2025-12-30 13:49:21', '', '2026-01-01 21:22:33', '管理员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2025-12-30 13:49:21', '2025-12-30 13:49:21', 'admin', '2025-12-30 13:49:21', '', NULL, '测试员');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (100, 100, 'teacher1', '教师一', '00', '', '', '0', 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80', '$2a$10$5NgjCXJOqNSg7I6LwdFPf.jr5ESrVz8v7QpME0IKZBHSYL6WoFhUW', '0', '0', '127.0.0.1', '2026-01-01 16:00:51', '2025-12-30 16:20:17', '', '2025-12-30 16:14:05', '', '2026-01-01 13:23:49', NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (101, 100, 'student1', '学生一', '00', '', '', '0', '', '$2a$10$CJPhFYE.6hqSDSyrHi36OOuggcQ9O4fn/MT1Xs.yaEUMtsFs5vYl6', '0', '0', '127.0.0.1', '2025-12-30 16:50:58', '2025-12-30 16:28:24', '', '2025-12-30 16:14:05', '', '2025-12-30 16:28:24', NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (102, NULL, 'stu01', 'stu01', '00', '1231234123@qq.com', '13684843434', '1', '/profile/avatar/2026/01/01/27c93afb66cb441d95b718f6f67a0346.png', '$2a$10$7.oA./Zf0//hMlP2H3h7AuF3sn7HYSwE2V1KyWbUVJ3nLfnQ2ctRu', '0', '0', '127.0.0.1', '2026-01-01 23:41:58', '2026-01-01 21:34:01', 'seed', '2025-12-31 10:45:23', '', '2026-01-01 21:35:21', NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (103, NULL, 'stu02', 'stu02', '00', '', '', '0', '', '$2a$10$kFZBZeqlRmek6uLBHOCGLuiJOf8dVf2aOYa9d3mMPIVBLUFtQCqQe', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:23', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (104, NULL, 'stu03', 'stu03', '00', '', '', '0', '', '$2a$10$bRfiacMSly0SY4jEdYo9Heffm6zA7Af0TDCNCW9euwb0e7ahlSvry', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:23', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (105, NULL, 'stu04', 'stu04', '00', '', '', '0', '', '$2a$10$8UpY1GAMv3jTXIxPxgGQMeh5oeFMKemgng6A3nKXMZtV77wNMIKdW', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:23', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (106, NULL, 'stu05', 'stu05', '00', '', '', '0', '', '$2a$10$v90E5KyAmEHIh/6HOBoUKOxDgXVQtEa46eO1ypNxgXY3XxUIDKf/O', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:23', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (107, NULL, 'stu06', 'stu06', '00', '', '', '0', '', '$2a$10$apBdTILcSCXkeIgkqlzxfubBoUCUsT/0gW0GcQSgrrgdZGC0v7Dey', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:23', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (108, NULL, 'stu07', 'stu07', '00', '', '', '0', '', '$2a$10$jViT97d3vgHjEXEKhiM8AeCfW9uhHl0vaz3KSvAwINV8.DjmpbJdi', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:23', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (109, NULL, 'stu08', 'stu08', '00', '', '', '0', '', '$2a$10$DapaH4D6dnhDbE9bVyT1regl9B.OjIdB9dyalKGVnq.yiFTPLnRYW', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:23', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (110, NULL, 'stu09', 'stu09', '00', '', '', '0', '', '$2a$10$6VsoRfb7zP2VcL.xeEupjOkLPBz2awmVcq7s.BEcXIkTv4WG8pFxS', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:23', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (111, NULL, 'stu10', 'stu10', '00', '', '', '0', '', '$2a$10$UhE6kiiaObPpH8GTsNsU2OqKz7gpkhOFBNdIsUNuweBL0pgKUVmGu', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:23', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (112, NULL, 'stu11', 'stu11', '00', '', '', '0', '', '$2a$10$UTN9fRmuXYG2IymjE78nXOZXCg4.4ke8zVa8Mhl.J4f2lXa5ADIva', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:23', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (113, NULL, 'stu12', 'stu12', '00', '', '', '0', '', '$2a$10$ps9Ua1Iqacvgi2jM0TFNn.5UBn4W909la11IUeGnsoD2aA2GsgliO', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:23', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (114, NULL, 'stu13', 'stu13', '00', '', '', '0', '', '$2a$10$BZ87Rf3jInFu17fLj2BWy.lQpZazHvnxmSyj1O46w45Do6txV88HO', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:23', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (115, NULL, 'stu14', 'stu14', '00', '', '', '0', '', '$2a$10$FfwN8pgP24dduNU3WrhjM.So9l3FjvGEV4uTqB5saQYD2nNHzJgPa', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:24', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (116, NULL, 'stu15', 'stu15', '00', '', '', '0', '', '$2a$10$K.ncbpsm0qyDzM7r8scOxOAWl7QT/tXVWTex9kIkfNwSFfM4UHsjO', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:24', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (117, NULL, 'stu16', 'stu16', '00', '', '', '0', '', '$2a$10$Bncgllsk2cwYuQuKYiKdqe2S3/RwFJP6OQ.PM9YoHrpTbpy6VHhsy', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:24', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (118, NULL, 'stu17', 'stu17', '00', '', '', '0', '', '$2a$10$5r7hTjCllieaLDGsMaGGju4S8y98Z86ndvvvH/iMMpIP.I05WyxCu', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:24', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (119, NULL, 'stu18', 'stu18', '00', '', '', '0', '', '$2a$10$2JBsHVTPYO58MmS1zvvAce2dsFd5JCYA.kKTodH0zpMfYUGmVNWxC', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:24', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (120, NULL, 'stu19', 'stu19', '00', '', '', '0', '', '$2a$10$x3Iqg.kwxPqRELZLxxmkv.D6xCrKwvrajjkN4kac.CJZv0col.nLm', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:24', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (121, NULL, 'stu20', 'stu20', '00', '', '', '0', '', '$2a$10$jiBpblEQ.DjAVFp/KBdpdeM3Z4LlKCwGQK7SXj2vZOvDa2.Q3ddmi', '0', '0', '', NULL, NULL, 'seed', '2025-12-31 10:45:24', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (122, NULL, '2584054150@qq.com', 'moon', '00', '2584054150@qq.com', '', '0', '', '$2a$10$dLH4tdosQ8HJRrIVCb5D.usBpzf.CBGNwZ4L2A/R64Lx.w6bb4vvW', '0', '0', '127.0.0.1', '2026-01-01 16:28:23', '2026-01-01 11:25:51', '', '2026-01-01 11:25:51', '', NULL, NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (123, NULL, '陈老师', '陈老师', '00', '', '', '0', 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80', '$2a$10$dLH4tdosQ8HJRrIVCb5D.usBpzf.CBGNwZ4L2A/R64Lx.w6bb4vvW', '0', '0', '', NULL, NULL, 'admin', '2026-01-01 13:25:15', '', '2026-01-01 13:25:27', NULL);
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (201, 103, 'teacher_li', '李华老师', '00', 'lihua@edu.com', '13800138001', '0', 'https://images.unsplash.com/photo-1568602471122-7832951cc4c5?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80', '$2a$10$7JB720yubVSZv5W8vNGkarOu8wHg06/jiWfij90z8t.97.J.W', '0', '0', '127.0.0.1', '2026-01-01 15:23:30', NULL, 'admin', '2026-01-01 15:23:30', '', NULL, '资深数学教师');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (202, 103, 'teacher_zhang', '张伟教授', '00', 'zhangwei@edu.com', '13900139002', '0', 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80', '$2a$10$7JB720yubVSZv5W8vNGkarOu8wHg06/jiWfij90z8t.97.J.W', '0', '0', '127.0.0.1', '2026-01-01 15:23:30', NULL, 'admin', '2026-01-01 15:23:30', '', NULL, '计算机科学专家');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (203, 103, 'teacher_wang', '王芳讲师', '00', 'wangfang@edu.com', '13700137003', '1', 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-4.0.3&auto=format&fit=crop&w=200&h=200&q=80', '$2a$10$7JB720yubVSZv5W8vNGkarOu8wHg06/jiWfij90z8t.97.J.W', '0', '0', '127.0.0.1', '2026-01-01 15:23:30', NULL, 'admin', '2026-01-01 15:23:30', '', NULL, '英语高级讲师');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (301, 103, 'student_chen', '陈明', '00', 'chenming@stu.edu.com', '15000150001', '0', '', '$2a$10$7JB720yubVSZv5W8vNGkarOu8wHg06/jiWfij90z8t.97.J.W', '0', '0', '127.0.0.1', '2026-01-01 15:23:30', NULL, 'admin', '2026-01-01 15:23:30', '', NULL, '2023级学生');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (302, 103, 'student_lin', '林晓', '00', 'linxiao@stu.edu.com', '15100151002', '1', '', '$2a$10$7JB720yubVSZv5W8vNGkarOu8wHg06/jiWfij90z8t.97.J.W', '0', '0', '127.0.0.1', '2026-01-01 15:23:30', NULL, 'admin', '2026-01-01 15:23:30', '', NULL, '2023级学生');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (303, 103, 'student_zhao', '赵强', '00', 'zhaoqiang@stu.edu.com', '15200152003', '0', '', '$2a$10$7JB720yubVSZv5W8vNGkarOu8wHg06/jiWfij90z8t.97.J.W', '0', '0', '127.0.0.1', '2026-01-01 15:23:30', NULL, 'admin', '2026-01-01 15:23:30', '', NULL, '2022级学生');
INSERT INTO `sys_user` (`user_id`, `dept_id`, `user_name`, `nick_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `status`, `del_flag`, `login_ip`, `login_date`, `pwd_update_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES (304, NULL, '221002206', '221002206', '00', '', '', '0', NULL, '$2a$10$uHIo3nEuL.NwZYidvJ8yv.hntGL2nIpdXDjYbIML.s0QvL./4QFGa', '0', '0', '', NULL, NULL, 'admin', '2026-01-01 17:27:18', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
                                 `user_id` bigint NOT NULL COMMENT '用户ID',
                                 `post_id` bigint NOT NULL COMMENT '岗位ID',
                                 PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (1, 1);
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
                                 `user_id` bigint NOT NULL COMMENT '用户ID',
                                 `role_id` bigint NOT NULL COMMENT '角色ID',
                                 PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (1, 1);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (2, 100);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (2, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (100, 100);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (101, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (102, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (103, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (104, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (105, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (106, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (107, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (108, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (109, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (110, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (111, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (112, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (113, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (114, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (115, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (116, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (117, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (118, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (119, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (120, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (121, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (122, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (123, 100);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (201, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (202, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (203, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (301, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (302, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (303, 101);
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES (304, 101);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
