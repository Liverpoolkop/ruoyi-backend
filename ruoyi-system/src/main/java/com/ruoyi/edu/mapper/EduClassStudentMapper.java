package com.ruoyi.edu.mapper;

import java.util.List;
import com.ruoyi.edu.domain.EduClassStudent;

public interface EduClassStudentMapper {
    List<EduClassStudent> selectByClassId(Long classId);
    int insert(EduClassStudent rel);
    int delete(Long classId, Long studentId);
}
