-- 实验表
CREATE TABLE IF NOT EXISTS edu_experiment (
    experiment_id   BIGINT(20)    NOT NULL AUTO_INCREMENT COMMENT '实验ID',
    course_id       BIGINT(20)    NOT NULL COMMENT '关联课程ID',
    experiment_name VARCHAR(100)  NOT NULL COMMENT '实验名称',
    description     TEXT          COMMENT '实验描述/要求',
    test_input      TEXT          COMMENT '测试输入',
    test_output     TEXT          COMMENT '期望输出',
    status          CHAR(1)       DEFAULT '0' COMMENT '状态: 0=草稿, 1=已发布',
    create_by       VARCHAR(64)   COMMENT '创建者',
    create_time     DATETIME      COMMENT '创建时间',
    update_time     DATETIME      COMMENT '更新时间',
    PRIMARY KEY (experiment_id),
    KEY idx_experiment_course (course_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='实验表';

-- 学生提交记录表
CREATE TABLE IF NOT EXISTS edu_experiment_submission (
    submission_id   BIGINT(20)    NOT NULL AUTO_INCREMENT COMMENT '提交ID',
    experiment_id   BIGINT(20)    NOT NULL COMMENT '实验ID',
    student_id      BIGINT(20)    NOT NULL COMMENT '学生ID',
    code            TEXT          NOT NULL COMMENT '提交的代码',
    result          VARCHAR(50)   COMMENT '评测结果',
    stdout          TEXT          COMMENT '输出结果',
    stderr          TEXT          COMMENT '错误信息',
    compile_output  TEXT          COMMENT '编译输出',
    run_time        VARCHAR(20)   COMMENT '运行时间',
    memory_used     VARCHAR(20)   COMMENT '内存使用',
    submit_time     DATETIME      COMMENT '提交时间',
    PRIMARY KEY (submission_id),
    KEY idx_submission_exp (experiment_id),
    KEY idx_submission_stu (student_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='实验提交记录表';
