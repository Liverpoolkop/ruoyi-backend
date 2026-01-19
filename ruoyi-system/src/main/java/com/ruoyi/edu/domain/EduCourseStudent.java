package com.ruoyi.edu.domain;

public class EduCourseStudent {
    private Long courseId;
    private Long studentId;
    private String status; // 0: pending, 1: approved, 2: rejected
    private String createBy;
    private java.util.Date createTime;

    // Non-DB Field
    private com.ruoyi.common.core.domain.entity.SysUser student;
    public com.ruoyi.common.core.domain.entity.SysUser getStudent() { return student; }
    public void setStudent(com.ruoyi.common.core.domain.entity.SysUser student) { this.student = student; }

    public Long getCourseId() { return courseId; }
    public void setCourseId(Long courseId) { this.courseId = courseId; }
    public Long getStudentId() { return studentId; }
    public void setStudentId(Long studentId) { this.studentId = studentId; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getCreateBy() { return createBy; }
    public void setCreateBy(String createBy) { this.createBy = createBy; }
    public java.util.Date getCreateTime() { return createTime; }
    public void setCreateTime(java.util.Date createTime) { this.createTime = createTime; }
}
