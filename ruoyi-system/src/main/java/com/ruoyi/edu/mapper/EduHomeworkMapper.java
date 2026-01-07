package com.ruoyi.edu.mapper;

import com.ruoyi.edu.domain.EduHomework;
import java.util.List;

public interface EduHomeworkMapper {

    int insertEduHomework(EduHomework homework);

    List<EduHomework> selectHomeworkListByCourseId(Long courseId);
}
