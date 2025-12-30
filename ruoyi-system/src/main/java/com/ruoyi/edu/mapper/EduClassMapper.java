package com.ruoyi.edu.mapper;

import java.util.List;
import com.ruoyi.edu.domain.EduClass;

public interface EduClassMapper {
    EduClass selectById(Long classId);
    List<EduClass> selectList(EduClass query);
    int insert(EduClass c);
    int update(EduClass c);
    int deleteById(Long classId);
}
