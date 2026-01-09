package com.ruoyi.edu.mapper;

import java.util.List;
import com.ruoyi.edu.domain.TeachingResource;

public interface TeachingResourceMapper {
    // 查询资源详情
    public TeachingResource selectTeachingResourceById(Long resourceId);

    // 查询资源列表
    public List<TeachingResource> selectTeachingResourceList(TeachingResource teachingResource);

    // 新增资源
    public int insertTeachingResource(TeachingResource teachingResource);

    // 修改资源
    public int updateTeachingResource(TeachingResource teachingResource);

    // 删除资源
    public int deleteTeachingResourceById(Long resourceId);
    
    // 更新下载次数
    public int incrementDownloadCount(Long resourceId);
}