package com.ruoyi.edu.domain;

import com.ruoyi.common.core.domain.BaseEntity;

public class EduCourse extends BaseEntity {
    private Long courseId;
    private String courseName;
    private java.util.List<Long> teacherIds;
    private Long majorId;
    private String courseDesc;
    private String status;
    private String courseImg;
    private String teacherNames;
    private String majorName;
    private Integer lessonHours;
    private Integer studentCount;
    private Long teacherId;
    private Boolean approvalRequired;
    
    // Non-DB Field
    private boolean isTeacher;
    public boolean getIsTeacher() { return isTeacher; }
    public void setIsTeacher(boolean isTeacher) { this.isTeacher = isTeacher; }

    public Boolean getApprovalRequired() { return approvalRequired; }
    public void setApprovalRequired(Boolean approvalRequired) { this.approvalRequired = approvalRequired; }

    public Long getTeacherId() { return teacherId; }
    public void setTeacherId(Long teacherId) { this.teacherId = teacherId; }

    public Long getCourseId() { return courseId; }
    public void setCourseId(Long courseId) { this.courseId = courseId; }
    public String getCourseName() { return courseName; }
    public void setCourseName(String courseName) { this.courseName = courseName; }
    public java.util.List<Long> getTeacherIds() { return teacherIds; }
    public void setTeacherIds(java.util.List<Long> teacherIds) { this.teacherIds = teacherIds; }
    public Long getMajorId() { return majorId; }
    public void setMajorId(Long majorId) { this.majorId = majorId; }
    public String getCourseDesc() { return courseDesc; }
    public void setCourseDesc(String courseDesc) { this.courseDesc = courseDesc; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public String getCourseImg() { return courseImg; }
    public void setCourseImg(String courseImg) { this.courseImg = courseImg; }
    public String getTeacherNames() { return teacherNames; }
    public void setTeacherNames(String teacherNames) { this.teacherNames = teacherNames; }
    public String getMajorName() { return majorName; }
    public void setMajorName(String majorName) { this.majorName = majorName; }
    public Integer getLessonHours() { return lessonHours; }
    public void setLessonHours(Integer lessonHours) { this.lessonHours = lessonHours; }
    public Integer getStudentCount() { return studentCount; }
    public void setStudentCount(Integer studentCount) { this.studentCount = studentCount; }
}
