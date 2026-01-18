package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * Homework Submission Object sys_edu_homework_submission
 */
public class EduHomeworkSubmission extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** Homework ID */
    private Long homeworkId;

    /** Student ID */
    @Excel(name = "学号")
    private Long studentId;

    /** Student Nickname */
    @Excel(name = "姓名")
    private String nickName;

    /** Student Name */
    private String studentName;

    @Excel(name = "提交时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date submitTime;

    /** Grade */
    @Excel(name = "成绩")
    private String grade;

    /** Grade Comment */
    @Excel(name = "评语")
    private String gradeComment;

    /** Content */
    private String content;

    /** Image URL */
    private String imageUrl;

    /** File URL */
    private String fileUrl;

    /** Status (0=Draft, 1=Submitted, 2=Graded) */
    private String status;

    public Date getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(Date submitTime) {
        this.submitTime = submitTime;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setHomeworkId(Long homeworkId) {
        this.homeworkId = homeworkId;
    }

    public Long getHomeworkId() {
        return homeworkId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setFileUrl(String fileUrl) {
        this.fileUrl = fileUrl;
    }

    public String getFileUrl() {
        return fileUrl;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getGrade() {
        return grade;
    }

    public void setGradeComment(String gradeComment) {
        this.gradeComment = gradeComment;
    }

    public String getGradeComment() {
        return gradeComment;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getNickName() {
        return nickName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("homeworkId", getHomeworkId())
                .append("studentId", getStudentId())
                .append("studentName", getStudentName())
                .append("nickName", getNickName())
                .append("content", getContent())
                .append("imageUrl", getImageUrl())
                .append("fileUrl", getFileUrl())
                .append("grade", getGrade())
                .append("gradeComment", getGradeComment())
                .append("status", getStatus())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
