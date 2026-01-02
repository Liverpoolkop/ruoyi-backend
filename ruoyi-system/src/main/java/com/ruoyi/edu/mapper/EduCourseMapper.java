package com.ruoyi.edu.mapper;

import java.util.List;

import com.ruoyi.edu.domain.EduCourse;

public interface EduCourseMapper {
    EduCourse selectById(Long courseId);
    List<EduCourse> selectList(EduCourse query);
    int insert(EduCourse c);
    int update(EduCourse c);
    int deleteById(Long courseId);

    int batchInsertCourseTeacher(@org.apache.ibatis.annotations.Param("courseId") Long courseId, @org.apache.ibatis.annotations.Param("list") List<Long> list);
    int deleteCourseTeacherByCourseId(Long courseId);
    List<Long> selectTeacherIdsByCourseId(Long courseId);
    List<EduCourse> selectManagedCourses(Long teacherId);
    List<EduCourse> selectJoinedCourses(Long userId);
}
