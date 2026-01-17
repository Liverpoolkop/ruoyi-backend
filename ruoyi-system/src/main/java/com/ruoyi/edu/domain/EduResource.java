package com.ruoyi.edu.domain;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 课程资源对象 edu_resource
 */
public class EduResource extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 资源ID */
    private Long resourceId;

    /** 章节ID */
    private Long chapterId;

    /** 课程ID */
    private Long courseId;

    /** 资源名称 */
    private String resourceName;

    /** 资源URL */
    private String url;

    /** 排序 */
    private Integer sort;

    /** 资源类型 (video, ppt, pdf, etc.) */
    private String type;

    public Long getResourceId() { return resourceId; }
    public void setResourceId(Long resourceId) { this.resourceId = resourceId; }

    public Long getChapterId() { return chapterId; }
    public void setChapterId(Long chapterId) { this.chapterId = chapterId; }

    public Long getCourseId() { return courseId; }
    public void setCourseId(Long courseId) { this.courseId = courseId; }

    public String getResourceName() { return resourceName; }
    public void setResourceName(String resourceName) { this.resourceName = resourceName; }

    public String getUrl() { return url; }
    public void setUrl(String url) { this.url = url; }

    public Integer getSort() { return sort; }
    public void setSort(Integer sort) { this.sort = sort; }

    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
}
