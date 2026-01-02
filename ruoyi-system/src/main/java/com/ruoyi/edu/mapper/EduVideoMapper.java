package com.ruoyi.edu.mapper;

import java.util.List;
import com.ruoyi.edu.domain.EduVideo;

public interface EduVideoMapper {
    public List<EduVideo> selectByChapterId(Long chapterId);
    public List<EduVideo> selectByCourseId(Long courseId);
    public int insert(EduVideo video);
    public int update(EduVideo video);
    public int deleteById(Long videoId);
}
