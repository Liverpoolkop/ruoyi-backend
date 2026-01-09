package com.ruoyi.edu.service.impl;

import java.io.File;
import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.common.config.RuoYiConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.edu.mapper.TeachingResourceMapper;
import com.ruoyi.edu.domain.TeachingResource;
import com.ruoyi.edu.service.ITeachingResourceService;
import org.apache.commons.io.FilenameUtils;

@Service
public class TeachingResourceServiceImpl implements ITeachingResourceService {
    @Autowired
    private TeachingResourceMapper resourceMapper;

    @Override
    public TeachingResource selectTeachingResourceById(Long resourceId) {
        return resourceMapper.selectTeachingResourceById(resourceId);
    }

    @Override
    public List<TeachingResource> selectTeachingResourceList(TeachingResource teachingResource) {
        return resourceMapper.selectTeachingResourceList(teachingResource);
    }

    @Override
    public int incrementDownloadCount(Long resourceId) {
        return resourceMapper.incrementDownloadCount(resourceId);
    }

    @Override
    public int insertTeachingResource(TeachingResource resource) {
        resource.setCreateTime(DateUtils.getNowDate());
        
        // 1. 自动识别分类
        String ext = FilenameUtils.getExtension(resource.getFilePath());
        resource.setCategory(getCategoryByExt(ext));
        
        // 2. 自动计算文件大小 (简单逻辑：尝试从本地磁盘读)
        if (StringUtils.isEmpty(resource.getFileSize())) {
            String localPath = RuoYiConfig.getProfile() + StringUtils.substringAfter(resource.getFilePath(), "/profile");
            File file = new File(localPath);
            if (file.exists()) {
                resource.setFileSize(formatFileSize(file.length()));
            }
        }
        
        // 3. 原始文件名
        if (StringUtils.isEmpty(resource.getOriginName())) {
            resource.setOriginName(new File(resource.getFilePath()).getName());
        }

        return resourceMapper.insertTeachingResource(resource);
    }

    @Override
    public int deleteTeachingResourceById(Long resourceId) {
        return resourceMapper.deleteTeachingResourceById(resourceId);
    }
    
    @Override
    public int updateTeachingResource(TeachingResource teachingResource)
    {
        // 可以在这里加更新时间的逻辑
        teachingResource.setUpdateTime(DateUtils.getNowDate());
        return resourceMapper.updateTeachingResource(teachingResource);
    }

    // 辅助方法：根据后缀判断分类
    private String getCategoryByExt(String ext) {
        if (StringUtils.isEmpty(ext)) return "other";
        ext = ext.toLowerCase();
        if (StringUtils.equalsAny(ext, "mp4", "avi", "mov", "flv")) return "video";
        if (StringUtils.equalsAny(ext, "mp3", "wav", "wma")) return "audio";
        if (StringUtils.equalsAny(ext, "jpg", "jpeg", "png", "gif")) return "image";
        if (StringUtils.equalsAny(ext, "doc", "docx", "pdf", "ppt", "pptx", "xls", "xlsx")) return "doc";
        return "other";
    }

    // 辅助方法：格式化大小
    private String formatFileSize(long fileS) {
        java.text.DecimalFormat df = new java.text.DecimalFormat("#.00");
        if (fileS < 1024) return df.format((double) fileS) + "B";
        if (fileS < 1048576) return df.format((double) fileS / 1024) + "KB";
        if (fileS < 1073741824) return df.format((double) fileS / 1048576) + "MB";
        return df.format((double) fileS / 1073741824) + "GB";
    }

    
}