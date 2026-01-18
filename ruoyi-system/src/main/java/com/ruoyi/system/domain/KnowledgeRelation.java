package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 知识点关系对象 sys_knowledge_relation
 *
 * @author ruoyi
 * @date 2024-01-15
 */
public class KnowledgeRelation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 关系ID */
    private Long relationId;

    /** 源知识点ID */
    @Excel(name = "源知识点ID")
    private Long sourceId;

    /** 目标知识点ID */
    @Excel(name = "目标知识点ID")
    private Long targetId;

    /** 关系类型 */
    @Excel(name = "关系类型")
    private String relationType;

    /** 关系强度 */
    @Excel(name = "关系强度")
    private Double relationStrength;

    /** 关系描述 */
    @Excel(name = "关系描述")
    private String description;

    /** 源知识点名称（关联查询用） */
    private String sourceName;

    /** 目标知识点名称（关联查询用） */
    private String targetName;

    /** 课程ID（用于查询） */
    private Long courseId;

    public void setRelationId(Long relationId)
    {
        this.relationId = relationId;
    }

    public Long getRelationId()
    {
        return relationId;
    }
    public void setSourceId(Long sourceId)
    {
        this.sourceId = sourceId;
    }

    public Long getSourceId()
    {
        return sourceId;
    }
    public void setTargetId(Long targetId)
    {
        this.targetId = targetId;
    }

    public Long getTargetId()
    {
        return targetId;
    }
    public void setRelationType(String relationType)
    {
        this.relationType = relationType;
    }

    public String getRelationType()
    {
        return relationType;
    }
    public void setRelationStrength(Double relationStrength)
    {
        this.relationStrength = relationStrength;
    }

    public Double getRelationStrength()
    {
        return relationStrength;
    }
    public void setDescription(String description)
    {
        this.description = description;
    }

    public String getDescription()
    {
        return description;
    }

    public String getSourceName() {
        return sourceName;
    }

    public void setSourceName(String sourceName) {
        this.sourceName = sourceName;
    }

    public String getTargetName() {
        return targetName;
    }

    public void setTargetName(String targetName) {
        this.targetName = targetName;
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
                .append("relationId", getRelationId())
                .append("sourceId", getSourceId())
                .append("targetId", getTargetId())
                .append("relationType", getRelationType())
                .append("relationStrength", getRelationStrength())
                .append("description", getDescription())
                .append("createTime", getCreateTime())
                .append("sourceName", getSourceName())
                .append("targetName", getTargetName())
                .toString();
    }
}
