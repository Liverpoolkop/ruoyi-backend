-- 班级信息表
CREATE TABLE IF NOT EXISTS edu_class (
    class_id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '班级ID',
    class_name VARCHAR(50) NOT NULL COMMENT '班级名称（如：2024级计算机1班）',
    grade VARCHAR(20) NOT NULL COMMENT '年级（如：2024级）',
    major VARCHAR(50) NOT NULL COMMENT '专业（如：计算机科学与技术）',
    teacher_id BIGINT(20) NOT NULL COMMENT '班主任ID（关联sys_user.user_id）',
    class_desc VARCHAR(500) DEFAULT '' COMMENT '班级描述',
    status CHAR(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
    create_by VARCHAR(64) DEFAULT '' COMMENT '创建人',
    create_time DATETIME COMMENT '创建时间',
    update_by VARCHAR(64) DEFAULT '' COMMENT '更新人',
    update_time DATETIME COMMENT '更新时间',
    PRIMARY KEY (class_id),
    KEY idx_class_grade_major (grade, major)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='班级信息表';

-- 班级学生表
CREATE TABLE IF NOT EXISTS edu_class_student (
    id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '关联ID',
    class_id BIGINT(20) NOT NULL COMMENT '班级ID（关联edu_class.class_id）',
    student_id BIGINT(20) NOT NULL COMMENT '学生ID（关联sys_user.user_id）',
    join_time DATETIME COMMENT '加入班级时间',
    create_by VARCHAR(64) DEFAULT '' COMMENT '添加人（教师账号）',
    create_time DATETIME COMMENT '添加时间',
    PRIMARY KEY (id),
    UNIQUE KEY uk_class_student (class_id, student_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='班级-学生关联表';

-- 课程表
CREATE TABLE IF NOT EXISTS edu_course (
    course_id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '课程ID',
    course_name VARCHAR(50) NOT NULL COMMENT '课程名称（如：Java程序设计）',
    teacher_id BIGINT(20) NOT NULL COMMENT '授课教师ID（关联sys_user.user_id）',
    grade VARCHAR(20) NOT NULL COMMENT '适用年级',
    major VARCHAR(50) NOT NULL COMMENT '适用专业',
    course_desc VARCHAR(500) DEFAULT '' COMMENT '课程描述',
    status CHAR(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
    create_time DATETIME COMMENT '创建时间',
    update_time DATETIME COMMENT '更新时间',
    PRIMARY KEY (course_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程信息表';

-- 班级课程表
CREATE TABLE IF NOT EXISTS edu_class_course (
    id BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '关联ID',
    class_id BIGINT(20) NOT NULL COMMENT '班级ID（关联edu_class.class_id）',
    course_id BIGINT(20) NOT NULL COMMENT '课程ID（关联edu_course.course_id）',
    create_time DATETIME COMMENT '关联时间',
    PRIMARY KEY (id),
    UNIQUE KEY uk_class_course (class_id, course_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='班级-课程关联表';
