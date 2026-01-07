package com.ruoyi.edu.domain;

import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;

public class EduHomeworkSubmit {
    private Long submitId;
    private Long homeworkId;
    private Long courseId;
    private Long classId;
    private Long userId;
    private Integer score;
    private String teacherComment;
    private Date gradeTime;
    private Long graderId;

    public Integer getScore() { return score; }
    public void setScore(Integer score) { this.score = score; }

    public String getTeacherComment() { return teacherComment; }
    public void setTeacherComment(String teacherComment) { this.teacherComment = teacherComment; }

    public Date getGradeTime() { return gradeTime; }
    public void setGradeTime(Date gradeTime) { this.gradeTime = gradeTime; }

    public Long getGraderId() { return graderId; }
    public void setGraderId(Long graderId) { this.graderId = graderId; }


    public Long getSubmitId() {
        return submitId;
    }
    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public void setSubmitId(Long submitId) {
        this.submitId = submitId;
    }

    public Long getHomeworkId() {
        return homeworkId;
    }

    public void setHomeworkId(Long homeworkId) {
        this.homeworkId = homeworkId;
    }

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    public Long getClassId() {
        return classId;
    }

    public void setClassId(Long classId) {
        this.classId = classId;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getSubmitContent() {
        return submitContent;
    }

    public void setSubmitContent(String submitContent) {
        this.submitContent = submitContent;
    }

    public Date getSubmitTime() {
        return submitTime;
    }

    public void setSubmitTime(Date submitTime) {
        this.submitTime = submitTime;
    }

    public String getSubmitStatus() {
        return submitStatus;
    }

    public void setSubmitStatus(String submitStatus) {
        this.submitStatus = submitStatus;
    }

    private Long studentId;
    private String studentName;

    private String submitContent;
    private Date submitTime;
    private String submitStatus;

    // 生成对应 getter/setter：setStudentId、setSubmitTime ... 不能有 setUserId
}

