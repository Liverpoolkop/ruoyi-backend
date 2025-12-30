package com.ruoyi.edu.domain;

import com.ruoyi.common.core.domain.BaseEntity;

public class EduCourse extends BaseEntity {
    private Long courseId;
    private String courseName;
    private Long teacherId;
    private String grade;
    private String major;
    private String courseDesc;
    private String status;

    public Long getCourseId() { return courseId; }
    public void setCourseId(Long courseId) { this.courseId = courseId; }
    public String getCourseName() { return courseName; }
    public void setCourseName(String courseName) { this.courseName = courseName; }
    public Long getTeacherId() { return teacherId; }
    public void setTeacherId(Long teacherId) { this.teacherId = teacherId; }
    public String getGrade() { return grade; }
    public void setGrade(String grade) { this.grade = grade; }
    public String getMajor() { return major; }
    public void setMajor(String major) { this.major = major; }
    public String getCourseDesc() { return courseDesc; }
    public void setCourseDesc(String courseDesc) { this.courseDesc = courseDesc; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
