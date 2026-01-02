package com.ruoyi.edu.mapper;

import java.util.List;

import com.ruoyi.edu.domain.EduClassStudent;

import org.apache.ibatis.annotations.Param;

public interface EduClassStudentMapper {
    List<EduClassStudent> selectByClassId(Long classId);
    int insert(EduClassStudent rel);
    int delete(@Param("classId") Long classId, @Param("studentId") Long studentId);
    List<Long> selectJoinedClassIds(Long studentId);
}
