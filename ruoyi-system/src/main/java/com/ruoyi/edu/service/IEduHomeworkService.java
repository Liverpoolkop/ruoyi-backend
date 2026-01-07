package com.ruoyi.edu.service;

import com.ruoyi.edu.domain.EduHomework;
import java.util.List;

public interface IEduHomeworkService {

    int insertEduHomework(EduHomework homework);

    List<EduHomework> selectHomeworkListByCourseId(Long courseId);
}
