-- Menu SQL for Homework Feature

-- 1. Find Parent Menu ID (Education)
-- Using a variable to store parent ID. If 'Education' doesn't exist, you may need to create it.
SET @parentId = (SELECT menu_id FROM sys_menu WHERE menu_name = 'Education' OR menu_name = '教育管理' LIMIT 1);

-- If parent not found, insert one (Optional, depends on your setup)
-- INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
-- SELECT 'Education', 0, 1, 'edu', NULL, 1, 0, 'M', '0', '0', '', 'education', 'admin', SYSDATE(), '', NULL, 'Education Directory'
-- FROM DUAL WHERE @parentId IS NULL;
-- SET @parentId = (SELECT menu_id FROM sys_menu WHERE menu_name = 'Education' LIMIT 1);


-- 2. Insert Homework Menu
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('Homework', @parentId, 2, 'homework', 'edu/homework/index', 1, 0, 'C', '0', '0', 'system:homework:list', 'form', 'admin', SYSDATE(), '', NULL, 'Homework Menu');

SET @homeworkMenuId = LAST_INSERT_ID();

-- 3. Insert Buttons for Homework
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES 
('Homework Query', @homeworkMenuId, 1, '#', '', 1, 0, 'F', '0', '0', 'system:homework:query', '#', 'admin', SYSDATE(), '', NULL, ''),
('Homework Add', @homeworkMenuId, 2, '#', '', 1, 0, 'F', '0', '0', 'system:homework:add', '#', 'admin', SYSDATE(), '', NULL, ''),
('Homework Edit', @homeworkMenuId, 3, '#', '', 1, 0, 'F', '0', '0', 'system:homework:edit', '#', 'admin', SYSDATE(), '', NULL, ''),
('Homework Remove', @homeworkMenuId, 4, '#', '', 1, 0, 'F', '0', '0', 'system:homework:remove', '#', 'admin', SYSDATE(), '', NULL, ''),
('Homework Export', @homeworkMenuId, 5, '#', '', 1, 0, 'F', '0', '0', 'system:homework:export', '#', 'admin', SYSDATE(), '', NULL, '');


-- 4. Insert Submission Menu (Hidden, or separate?)
-- If we want a separate menu for Submissions (Grading):
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES ('Homework Submission', @parentId, 3, 'submission', 'edu/homework/submission', 1, 0, 'C', '0', '0', 'system:submission:list', 'list', 'admin', SYSDATE(), '', NULL, 'Submission Menu');

SET @submissionMenuId = LAST_INSERT_ID();

-- 5. Insert Buttons for Submission
INSERT INTO sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
VALUES 
('Submission Query', @submissionMenuId, 1, '#', '', 1, 0, 'F', '0', '0', 'system:submission:query', '#', 'admin', SYSDATE(), '', NULL, ''),
('Submission Grade', @submissionMenuId, 2, '#', '', 1, 0, 'F', '0', '0', 'system:submission:edit', '#', 'admin', SYSDATE(), '', NULL, ''),
('Submission Submit', @submissionMenuId, 3, '#', '', 1, 0, 'F', '0', '0', 'system:submission:add', '#', 'admin', SYSDATE(), '', NULL, ''),
('Submission Remove', @submissionMenuId, 4, '#', '', 1, 0, 'F', '0', '0', 'system:submission:remove', '#', 'admin', SYSDATE(), '', NULL, ''),
('Submission Export', @submissionMenuId, 5, '#', '', 1, 0, 'F', '0', '0', 'system:submission:export', '#', 'admin', SYSDATE(), '', NULL, '');
