package com.ruoyi.edu.domain;

import com.ruoyi.common.core.domain.BaseEntity;

public class EduClassStudent extends BaseEntity {
    private Long id;
    private Long classId;
    private Long studentId;
    private String studentName;
    private String nickName;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getClassId() { return classId; }
    public void setClassId(Long classId) { this.classId = classId; }
    public Long getStudentId() { return studentId; }
    public void setStudentId(Long studentId) { this.studentId = studentId; }
    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }
    public String getNickName() { return nickName; }
    public void setNickName(String nickName) { this.nickName = nickName; }
}
