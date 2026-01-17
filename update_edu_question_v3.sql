-- Add teacher_id to edu_question table
ALTER TABLE edu_question ADD COLUMN teacher_id bigint(20) DEFAULT NULL COMMENT 'Teacher ID';
