package com.ruoyi.edu.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import java.util.Date;
import java.util.List;

/**
 * 课程考试对象 edu_course_exam
 */
public class CourseExam extends BaseEntity {
    private static final long serialVersionUID = 1L;

    private Long id;
    private Long courseId;
    private String title;
    private String description;
    private Integer duration; // 分钟

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    private String status; // 0:未发布, 1:已发布
    private Integer totalScore;
    private Long teacherId;

    // --- 业务扩展字段 (非数据库字段) ---
    // 用于接收前端传来的题目列表
    private List<CourseExamQuestion> questionList;

    // Getter & Setter
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getCourseId() { return courseId; }
    public void setCourseId(Long courseId) { this.courseId = courseId; }
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public Integer getDuration() { return duration; }
    public void setDuration(Integer duration) { this.duration = duration; }
    public Date getStartTime() { return startTime; }
    public void setStartTime(Date startTime) { this.startTime = startTime; }
    public Date getEndTime() { return endTime; }
    public void setEndTime(Date endTime) { this.endTime = endTime; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public Integer getTotalScore() { return totalScore; }
    public void setTotalScore(Integer totalScore) { this.totalScore = totalScore; }
    public Long getTeacherId() { return teacherId; }
    public void setTeacherId(Long teacherId) { this.teacherId = teacherId; }
    public List<CourseExamQuestion> getQuestionList() { return questionList; }
    public void setQuestionList(List<CourseExamQuestion> questionList) { this.questionList = questionList; }
}