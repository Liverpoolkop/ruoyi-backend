package com.ruoyi.edu.mapper;

import java.util.List;
import com.ruoyi.edu.domain.EduResource;

public interface EduResourceMapper {
    public List<EduResource> selectByChapterId(Long chapterId);
    public List<EduResource> selectByCourseId(Long courseId);
    public EduResource selectById(Long resourceId);
    public int insert(EduResource resource);
    public int update(EduResource resource);
    public int deleteById(Long resourceId);
}
