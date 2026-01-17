package com.ruoyi.edu.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 测验记录对象 edu_exam_record
 * 
 * @author ruoyi
 * @date 2024-05-20
 */
public class EduExamRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 记录ID */
    private Long recordId;

    /** 测验ID */
    @Excel(name = "测验ID")
    private Long examId;

    /** 学生ID */
    @Excel(name = "学生ID")
    private Long userId;

    /** 得分 */
    @Excel(name = "得分")
    private Integer score;

    /** 提交时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "提交时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date submitTime;

    /** 答题详情JSON */
    @Excel(name = "答题详情JSON")
    private String answers;

    public void setRecordId(Long recordId) 
    {
        this.recordId = recordId;
    }

    public Long getRecordId() 
    {
        return recordId;
    }
    public void setExamId(Long examId) 
    {
        this.examId = examId;
    }

    public Long getExamId() 
    {
        return examId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setScore(Integer score) 
    {
        this.score = score;
    }

    public Integer getScore() 
    {
        return score;
    }
    public void setSubmitTime(Date submitTime) 
    {
        this.submitTime = submitTime;
    }

    public Date getSubmitTime() 
    {
        return submitTime;
    }
    public void setAnswers(String answers) 
    {
        this.answers = answers;
    }

    public String getAnswers() 
    {
        return answers;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("recordId", getRecordId())
            .append("examId", getExamId())
            .append("userId", getUserId())
            .append("score", getScore())
            .append("submitTime", getSubmitTime())
            .append("answers", getAnswers())
            .append("createTime", getCreateTime())
            .toString();
    }
}
