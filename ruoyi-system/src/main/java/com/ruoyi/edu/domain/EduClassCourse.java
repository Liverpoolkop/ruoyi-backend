package com.ruoyi.edu.domain;

import com.ruoyi.common.core.domain.BaseEntity;

public class EduClassCourse extends BaseEntity {
    private Long id;
    private Long classId;
    private Long courseId;

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getClassId() { return classId; }
    public void setClassId(Long classId) { this.classId = classId; }
    public Long getCourseId() { return courseId; }
    public void setCourseId(Long courseId) { this.courseId = courseId; }
}
