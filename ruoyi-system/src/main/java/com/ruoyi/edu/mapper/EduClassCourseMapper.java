package com.ruoyi.edu.mapper;

import java.util.List;

import com.ruoyi.edu.domain.EduClassCourse;

public interface EduClassCourseMapper {
    List<EduClassCourse> selectByClassId(Long classId);
    int insert(EduClassCourse rel);
    int delete(Long classId, Long courseId);
}
