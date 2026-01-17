package com.ruoyi.edu.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 教学资源对象 teaching_resource
 */
public class TeachingResource extends BaseEntity {
    private static final long serialVersionUID = 1L;

    private Long resourceId;

    @Excel(name = "关联课程ID")
    private Long courseId;

    @Excel(name = "资源标题")
    private String resourceName;

    @Excel(name = "资源分类")
    private String category; // video, audio, image, doc, other

    @Excel(name = "文件路径")
    private String filePath;

    @Excel(name = "文件大小")
    private String fileSize;

    @Excel(name = "原始文件名")
    private String originName;

    @Excel(name = "下载次数")
    private Long downloadCount;

    @Excel(name = "状态")
    private String status; // 0正常 1停用

    // Getter & Setter
    public Long getResourceId() { return resourceId; }
    public void setResourceId(Long resourceId) { this.resourceId = resourceId; }
    public Long getCourseId() { return courseId; }
    public void setCourseId(Long courseId) { this.courseId = courseId; }
    public String getResourceName() { return resourceName; }
    public void setResourceName(String resourceName) { this.resourceName = resourceName; }
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
    public String getFilePath() { return filePath; }
    public void setFilePath(String filePath) { this.filePath = filePath; }
    public String getFileSize() { return fileSize; }
    public void setFileSize(String fileSize) { this.fileSize = fileSize; }
    public String getOriginName() { return originName; }
    public void setOriginName(String originName) { this.originName = originName; }
    public Long getDownloadCount() { return downloadCount; }
    public void setDownloadCount(Long downloadCount) { this.downloadCount = downloadCount; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("resourceId", getResourceId())
            .append("courseId", getCourseId())
            .append("resourceName", getResourceName())
            .append("filePath", getFilePath())
            .toString();
    }
}