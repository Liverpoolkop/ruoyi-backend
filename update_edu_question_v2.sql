-- Add tags column to edu_question table
ALTER TABLE edu_question ADD COLUMN tags VARCHAR(500) COMMENT 'Tags (comma separated)';
