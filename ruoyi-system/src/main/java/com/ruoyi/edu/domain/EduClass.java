package com.ruoyi.edu.domain;

import com.ruoyi.common.core.domain.BaseEntity;

public class EduClass extends BaseEntity {
    private Long classId;
    private String className;
    private String grade;
    private String major;
    private Long teacherId;
    private String classDesc;
    private String status;

    public Long getClassId() { return classId; }
    public void setClassId(Long classId) { this.classId = classId; }
    public String getClassName() { return className; }
    public void setClassName(String className) { this.className = className; }
    public String getGrade() { return grade; }
    public void setGrade(String grade) { this.grade = grade; }
    public String getMajor() { return major; }
    public void setMajor(String major) { this.major = major; }
    public Long getTeacherId() { return teacherId; }
    public void setTeacherId(Long teacherId) { this.teacherId = teacherId; }
    public String getClassDesc() { return classDesc; }
    public void setClassDesc(String classDesc) { this.classDesc = classDesc; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
