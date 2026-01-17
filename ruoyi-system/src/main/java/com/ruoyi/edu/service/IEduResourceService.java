package com.ruoyi.edu.service;

import java.util.List;
import com.ruoyi.edu.domain.EduResource;

public interface IEduResourceService {
    public EduResource selectResourceById(Long resourceId);
    public List<EduResource> selectResourceList(EduResource resource);
    public int insertResource(EduResource resource);
    public int updateResource(EduResource resource);
    public int deleteResourceByIds(Long[] resourceIds);
}
