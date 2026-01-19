package com.ruoyi.edu.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

public class CourseExamRecord extends BaseEntity {
    private Long id;
    private Long examId;
    private Long studentId;
    private String status; // 0:未开始, 1:进行中, 2:已提交, 3:已阅卷
    private Date startTime;
    private Date submitTime;
    private Integer cheatCount;
    private Integer objectiveScore;
    private Integer subjectiveScore;
    private Integer totalScore;
    private String teacherComment;
    // 👇👇👇 新增这个字段 (用于展示学生姓名) 👇👇👇
    private String studentName;

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }
    // Getter & Setter (你可以用 IDEA 自动生成，或者使用 Lombok @Data)
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getExamId() { return examId; }
    public void setExamId(Long examId) { this.examId = examId; }
    public Long getStudentId() { return studentId; }
    public void setStudentId(Long studentId) { this.studentId = studentId; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public Date getStartTime() { return startTime; }
    public void setStartTime(Date startTime) { this.startTime = startTime; }
    public Date getSubmitTime() { return submitTime; }
    public void setSubmitTime(Date submitTime) { this.submitTime = submitTime; }
    public Integer getCheatCount() { return cheatCount; }
    public void setCheatCount(Integer cheatCount) { this.cheatCount = cheatCount; }
    public Integer getObjectiveScore() { return objectiveScore; }
    public void setObjectiveScore(Integer objectiveScore) { this.objectiveScore = objectiveScore; }
    public Integer getSubjectiveScore() { return subjectiveScore; }
    public void setSubjectiveScore(Integer subjectiveScore) { this.subjectiveScore = subjectiveScore; }
    public Integer getTotalScore() { return totalScore; }
    public void setTotalScore(Integer totalScore) { this.totalScore = totalScore; }
    public String getTeacherComment() { return teacherComment; }
    public void setTeacherComment(String teacherComment) { this.teacherComment = teacherComment; }
}