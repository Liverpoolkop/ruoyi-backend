-- 实验功能增强：添加截止时间字段
ALTER TABLE edu_experiment ADD COLUMN deadline DATETIME COMMENT '截止时间' AFTER status;
