package com.ruoyi.edu.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.edu.mapper.EduResourceMapper;
import com.ruoyi.edu.domain.EduResource;
import com.ruoyi.edu.service.IEduResourceService;
import com.ruoyi.common.utils.DateUtils;

@Service
public class EduResourceServiceImpl implements IEduResourceService {
    @Autowired
    private EduResourceMapper eduResourceMapper;

    @Override
    public EduResource selectResourceById(Long resourceId) {
        return eduResourceMapper.selectById(resourceId);
    }

    @Override
    public List<EduResource> selectResourceList(EduResource resource) {
        if (resource.getChapterId() != null) {
            return eduResourceMapper.selectByChapterId(resource.getChapterId());
        }
        if (resource.getCourseId() != null) {
            return eduResourceMapper.selectByCourseId(resource.getCourseId());
        }
        return null;
    }

    @Override
    public int insertResource(EduResource resource) {
        resource.setCreateTime(DateUtils.getNowDate());
        return eduResourceMapper.insert(resource);
    }

    @Override
    public int updateResource(EduResource resource) {
        return eduResourceMapper.update(resource);
    }

    @Override
    public int deleteResourceByIds(Long[] resourceIds) {
        int count = 0;
        for (Long id : resourceIds) {
            count += eduResourceMapper.deleteById(id);
        }
        return count;
    }
}
