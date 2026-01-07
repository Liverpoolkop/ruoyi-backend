package com.ruoyi.edu.service.impl;

import com.ruoyi.edu.domain.EduHomeworkSubmit;
import com.ruoyi.edu.mapper.EduHomeworkSubmitMapper;
import com.ruoyi.edu.service.IEduHomeworkSubmitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import com.ruoyi.common.utils.SecurityUtils;



@Service
public class EduHomeworkSubmitServiceImpl implements IEduHomeworkSubmitService {

    @Resource
    private EduHomeworkSubmitMapper submitMapper;

    @Override
    public int submit(Long courseId, Long homeworkId, String submitContent) {
        Long userId = SecurityUtils.getUserId();
        String studentName = SecurityUtils.getLoginUser().getUser().getNickName();

        // 查是否已提交（按 homeworkId + userId）
        EduHomeworkSubmit exist = submitMapper.selectByHomeworkAndUser(homeworkId, userId);

        if (exist == null) {
            EduHomeworkSubmit submit = new EduHomeworkSubmit();
            submit.setCourseId(courseId);
            submit.setHomeworkId(homeworkId);

            // 关键：表 user_id NOT NULL
            submit.setUserId(userId);

            // 你没有学生体系的话，先让 student_id = userId（最稳）
            submit.setStudentId(userId);
            submit.setStudentName(studentName);

            submit.setSubmitContent(submitContent);
            submit.setSubmitStatus("1"); // 已提交

            return submitMapper.insertEduHomeworkSubmit(submit);
        } else {
            exist.setSubmitContent(submitContent);
            exist.setStudentName(studentName);
            exist.setSubmitStatus("1");
            return submitMapper.updateEduHomeworkSubmit(exist);
        }
    }

    @Override
    public List<EduHomeworkSubmit> selectByCourseIdAndUserId(Long courseId, Long userId) {
        return submitMapper.selectByCourseIdAndUserId(courseId, userId);
    }
    @Override
    public List<EduHomeworkSubmit> selectSubmitsByHomeworkId(Long homeworkId) {
        return submitMapper.selectSubmitsByHomeworkId(homeworkId);
    }

    @Override
    public int grade(Long submitId, Integer score, String teacherComment) {
        Long graderId = SecurityUtils.getUserId();

        EduHomeworkSubmit s = new EduHomeworkSubmit();
        s.setSubmitId(submitId);
        s.setScore(score);
        s.setTeacherComment(teacherComment);
        s.setGraderId(graderId);

        return submitMapper.gradeSubmit(s);
    }

}
