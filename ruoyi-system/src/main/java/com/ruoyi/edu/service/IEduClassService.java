package com.ruoyi.edu.service;

import java.util.List;

import com.ruoyi.edu.domain.EduClass;

public interface IEduClassService {
    EduClass selectById(Long id);
    List<EduClass> selectList(EduClass query);
    List<EduClass> selectJoinedClasses(Long studentId);
    int create(EduClass c);
    int update(EduClass c);
    int delete(Long id);
}
