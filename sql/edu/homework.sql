-- ----------------------------
-- Table structure for sys_edu_homework
-- ----------------------------
DROP TABLE IF EXISTS `sys_edu_homework`;
CREATE TABLE `sys_edu_homework` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `content` text DEFAULT NULL COMMENT 'Content',
  `create_by` varchar(64) DEFAULT '' COMMENT 'Create By',
  `create_time` datetime DEFAULT NULL COMMENT 'Create Time',
  `update_by` varchar(64) DEFAULT '' COMMENT 'Update By',
  `update_time` datetime DEFAULT NULL COMMENT 'Update Time',
  `remark` varchar(500) DEFAULT NULL COMMENT 'Remark',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='Homework Table';

-- ----------------------------
-- Table structure for sys_edu_homework_submission
-- ----------------------------
DROP TABLE IF EXISTS `sys_edu_homework_submission`;
CREATE TABLE `sys_edu_homework_submission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `homework_id` bigint(20) NOT NULL COMMENT 'Homework ID',
  `student_id` bigint(20) NOT NULL COMMENT 'Student User ID',
  `student_name` varchar(64) DEFAULT NULL COMMENT 'Student Name',
  `content` text DEFAULT NULL COMMENT 'Submission Content',
  `file_url` varchar(512) DEFAULT NULL COMMENT 'Attachment URL',
  `grade` varchar(10) DEFAULT NULL COMMENT 'Grade',
  `grade_comment` varchar(500) DEFAULT NULL COMMENT 'Grade Comment',
  `status` char(1) DEFAULT '0' COMMENT 'Status (0=Draft, 1=Submitted, 2=Graded)',
  `create_time` datetime DEFAULT NULL COMMENT 'Create Time',
  `update_time` datetime DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='Homework Submission Table';
