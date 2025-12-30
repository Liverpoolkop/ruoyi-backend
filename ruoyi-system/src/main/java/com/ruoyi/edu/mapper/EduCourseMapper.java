package com.ruoyi.edu.mapper;

import java.util.List;
import com.ruoyi.edu.domain.EduCourse;

public interface EduCourseMapper {
    EduCourse selectById(Long courseId);
    List<EduCourse> selectList(EduCourse query);
    int insert(EduCourse c);
    int update(EduCourse c);
    int deleteById(Long courseId);
}
