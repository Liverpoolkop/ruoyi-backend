package com.ruoyi.edu.domain;

import java.util.List;

/**
 * 考试提交/阅卷 DTO
 */
public class CourseExamSubmitBody {
    private Long recordId;
    private Long examId;
    private List<CourseExamAnswer> answers;
    
    // 👇👇👇 新增：老师评语 👇👇👇
    private String teacherComment;

    // Getter & Setter
    public Long getRecordId() {
        return recordId;
    }

    public void setRecordId(Long recordId) {
        this.recordId = recordId;
    }

    public Long getExamId() {
        return examId;
    }

    public void setExamId(Long examId) {
        this.examId = examId;
    }

    public List<CourseExamAnswer> getAnswers() {
        return answers;
    }

    public void setAnswers(List<CourseExamAnswer> answers) {
        this.answers = answers;
    }

    public String getTeacherComment() {
        return teacherComment;
    }

    public void setTeacherComment(String teacherComment) {
        this.teacherComment = teacherComment;
    }
}