package com.ruoyi.edu.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 专业信息对象 edu_major
 * 
 * @author moon
 * @date 2025-12-31
 */
public class EduMajor extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 专业ID */
    private Long majorId;

    /** 专业名称（如：计算机科学与技术） */
    @Excel(name = "专业名称", readConverterExp = "如=：计算机科学与技术")
    private String majorName;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    public void setMajorId(Long majorId) 
    {
        this.majorId = majorId;
    }

    public Long getMajorId() 
    {
        return majorId;
    }

    public void setMajorName(String majorName) 
    {
        this.majorName = majorName;
    }

    public String getMajorName() 
    {
        return majorName;
    }

    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("majorId", getMajorId())
            .append("majorName", getMajorName())
            .append("status", getStatus())
            .append("createTime", getCreateTime())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
