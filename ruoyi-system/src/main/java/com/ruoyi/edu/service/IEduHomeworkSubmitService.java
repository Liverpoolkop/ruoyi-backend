package com.ruoyi.edu.service;

import com.ruoyi.edu.domain.EduHomeworkSubmit;

import java.util.List;

public interface IEduHomeworkSubmitService {

    int submit(Long courseId, Long homeworkId, String submitContent);

    List<EduHomeworkSubmit> selectByCourseIdAndUserId(Long courseId, Long userId);
    List<EduHomeworkSubmit> selectSubmitsByHomeworkId(Long homeworkId);

    int grade(Long submitId, Integer score, String teacherComment);

}

