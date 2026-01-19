package com.ruoyi.edu.domain;

import com.ruoyi.common.core.domain.BaseEntity;

public class EduClass extends BaseEntity {
    private Long classId;
    private String className;
    private String grade;
    private Long majorId;
    private Long teacherId;
    private String status;
    private String teacherName;
    private String nickName;
    private String majorName;
    private Long studentCount;

    public Long getClassId() { return classId; }
    public void setClassId(Long classId) { this.classId = classId; }
    public String getClassName() { return className; }
    public void setClassName(String className) { this.className = className; }
    public String getGrade() { return grade; }
    public void setGrade(String grade) { this.grade = grade; }
    public Long getMajorId() { return majorId; }
    public void setMajorId(Long majorId) { this.majorId = majorId; }
    public Long getTeacherId() { return teacherId; }
    public void setTeacherId(Long teacherId) { this.teacherId = teacherId; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getTeacherName() { return teacherName; }
    public void setTeacherName(String teacherName) { this.teacherName = teacherName; }
    public String getNickName() { return nickName; }
    public void setNickName(String nickName) { this.nickName = nickName; }
    public String getMajorName() { return majorName; }
    public void setMajorName(String majorName) { this.majorName = majorName; }
    public Long getStudentCount() { return studentCount; }
    public void setStudentCount(Long studentCount) { this.studentCount = studentCount; }
}
