package com.ruoyi.edu.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 测验对象 edu_exam
 * 
 * @author ruoyi
 * @date 2024-05-20
 */
public class EduExam extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 测验ID */
    private Long examId;

    /** 所属课程ID */
    @Excel(name = "所属课程ID")
    private Long courseId;

    /** 测验标题 */
    @Excel(name = "测验标题")
    private String title;

    /** 考试时长(分钟) */
    @Excel(name = "考试时长(分钟)")
    private Integer duration;

    /** 开始时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "开始时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /** 结束时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "结束时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /** 总分 */
    @Excel(name = "总分")
    private Integer totalScore;

    /** 状态（0未发布 1已发布 2已结束） */
    @Excel(name = "状态", readConverterExp = "0=未发布,1=已发布,2=已结束")
    private String status;

    /** 题目列表 */
    private java.util.List<EduExamQuestion> questions;

    public void setQuestions(java.util.List<EduExamQuestion> questions)
    {
        this.questions = questions;
    }

    public java.util.List<EduExamQuestion> getQuestions()
    {
        return questions;
    }

    public void setExamId(Long examId) 
    {
        this.examId = examId;
    }

    public Long getExamId() 
    {
        return examId;
    }
    public void setCourseId(Long courseId) 
    {
        this.courseId = courseId;
    }

    public Long getCourseId() 
    {
        return courseId;
    }
    public void setTitle(String title) 
    {
        this.title = title;
    }

    public String getTitle() 
    {
        return title;
    }
    public void setDuration(Integer duration) 
    {
        this.duration = duration;
    }

    public Integer getDuration() 
    {
        return duration;
    }
    public void setStartTime(Date startTime) 
    {
        this.startTime = startTime;
    }

    public Date getStartTime() 
    {
        return startTime;
    }
    public void setEndTime(Date endTime) 
    {
        this.endTime = endTime;
    }

    public Date getEndTime() 
    {
        return endTime;
    }
    public void setTotalScore(Integer totalScore) 
    {
        this.totalScore = totalScore;
    }

    public Integer getTotalScore() 
    {
        return totalScore;
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
            .append("examId", getExamId())
            .append("courseId", getCourseId())
            .append("title", getTitle())
            .append("duration", getDuration())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("totalScore", getTotalScore())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
