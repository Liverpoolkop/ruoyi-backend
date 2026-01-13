package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 教学资源知识点关联对象 sys_teaching_resource_knowledge
 *
 * @author ruoyi
 * @date 2024-01-15
 */
public class TeachingResourceKnowledge extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 关联ID */
    private Long id;

    /** 资源类型（homework,question,experiment） */
    @Excel(name = "资源类型")
    private String resourceType;

    /** 资源ID */
    @Excel(name = "资源ID")
    private Long resourceId;

    /** 知识点ID */
    @Excel(name = "知识点ID")
    private Long knowledgeId;

    /** 资源名称（关联查询用） */
    private String resourceName;

    /** 知识点名称（关联查询用） */
    private String knowledgeName;

    /** 课程ID（用于查询） */
    private Long courseId;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setResourceType(String resourceType)
    {
        this.resourceType = resourceType;
    }

    public String getResourceType()
    {
        return resourceType;
    }
    public void setResourceId(Long resourceId)
    {
        this.resourceId = resourceId;
    }

    public Long getResourceId()
    {
        return resourceId;
    }
    public void setKnowledgeId(Long knowledgeId)
    {
        this.knowledgeId = knowledgeId;
    }

    public Long getKnowledgeId()
    {
        return knowledgeId;
    }

    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }

    public String getKnowledgeName() {
        return knowledgeName;
    }

    public void setKnowledgeName(String knowledgeName) {
        this.knowledgeName = knowledgeName;
    }

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("resourceType", getResourceType())
                .append("resourceId", getResourceId())
                .append("knowledgeId", getKnowledgeId())
                .append("createTime", getCreateTime())
                .append("resourceName", getResourceName())
                .append("knowledgeName", getKnowledgeName())
                .toString();
    }
}