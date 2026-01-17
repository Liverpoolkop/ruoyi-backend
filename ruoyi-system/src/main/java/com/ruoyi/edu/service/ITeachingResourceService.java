package com.ruoyi.edu.service;

import java.util.List;
import com.ruoyi.edu.domain.TeachingResource;

public interface ITeachingResourceService {
    public TeachingResource selectTeachingResourceById(Long resourceId);
    public List<TeachingResource> selectTeachingResourceList(TeachingResource teachingResource);
    public int insertTeachingResource(TeachingResource teachingResource);
    public int deleteTeachingResourceById(Long resourceId);
    public int incrementDownloadCount(Long resourceId);
    public int updateTeachingResource(TeachingResource teachingResource);
}