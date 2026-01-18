-- ----------------------------
-- Table structure for edu_question_bank
-- ----------------------------
DROP TABLE IF EXISTS `edu_question_bank`;
CREATE TABLE `edu_question_bank` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(100) DEFAULT NULL COMMENT 'Question Bank Name',
  `description` varchar(500) DEFAULT NULL COMMENT 'Description',
  `teacher_id` bigint(20) DEFAULT NULL COMMENT 'Teacher ID (SysUser)',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Create By',
  `create_time` datetime DEFAULT NULL COMMENT 'Create Time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Update By',
  `update_time` datetime DEFAULT NULL COMMENT 'Update Time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'Remark',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_teacher` (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='Question Bank Table';

-- ----------------------------
-- Table structure for edu_question
-- ----------------------------
DROP TABLE IF EXISTS `edu_question`;
CREATE TABLE `edu_question` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bank_id` bigint(20) NOT NULL COMMENT 'Bank ID',
  `type` char(1) DEFAULT '1' COMMENT 'Type (1:Single, 2:Multi, 3:Bool, 4:Fill)',
  `content` text COMMENT 'Question Content',
  `options` text COMMENT 'Options JSON',
  `answer` varchar(500) DEFAULT NULL COMMENT 'Answer',
  `analysis` text COMMENT 'Analysis',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Create By',
  `create_time` datetime DEFAULT NULL COMMENT 'Create Time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Update By',
  `update_time` datetime DEFAULT NULL COMMENT 'Update Time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'Remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='Question Table';
