package com.ruoyi.edu.mapper;

import java.util.List;

import com.ruoyi.edu.domain.EduCourseStudent;

public interface EduCourseStudentMapper {
    int insert(EduCourseStudent rel);
    int delete(@org.apache.ibatis.annotations.Param("courseId") Long courseId, @org.apache.ibatis.annotations.Param("studentId") Long studentId);
    List<EduCourseStudent> selectByCourseId(Long courseId);
    List<Long> selectJoinedCourseIds(Long studentId);
    int batchInsert(List<EduCourseStudent> list);
    List<com.ruoyi.common.core.domain.entity.SysUser> selectStudentsByCourseId(Long courseId);
}
