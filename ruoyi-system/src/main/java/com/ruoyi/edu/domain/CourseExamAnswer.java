package com.ruoyi.edu.domain;

import com.ruoyi.common.core.domain.BaseEntity;

public class CourseExamAnswer extends BaseEntity {
    private Long id;
    private Long recordId;
    private Long questionId;
    private String studentAnswer;
    private Integer score;
    private String status; // 0:待判, 1:对, 2:错

    // 👇👇👇【新增】这 4 个字段用于显示，必须加在这里！👇👇👇
    private String questionContent; // 题目内容
    private String questionType;    // 题目类型
    private Integer maxScore;       // 满分
    private String refAnswer;       // 参考答案

    // 👇👇👇【新增】Getter & Setter 方法 👇👇👇
    public String getQuestionContent() { return questionContent; }
    public void setQuestionContent(String questionContent) { this.questionContent = questionContent; }
    
    public String getQuestionType() { return questionType; }
    public void setQuestionType(String questionType) { this.questionType = questionType; }
    
    public Integer getMaxScore() { return maxScore; }
    public void setMaxScore(Integer maxScore) { this.maxScore = maxScore; }
    
    public String getRefAnswer() { return refAnswer; }
    public void setRefAnswer(String refAnswer) { this.refAnswer = refAnswer; }
    // Getter & Setter
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getRecordId() { return recordId; }
    public void setRecordId(Long recordId) { this.recordId = recordId; }
    public Long getQuestionId() { return questionId; }
    public void setQuestionId(Long questionId) { this.questionId = questionId; }
    public String getStudentAnswer() { return studentAnswer; }
    public void setStudentAnswer(String studentAnswer) { this.studentAnswer = studentAnswer; }
    public Integer getScore() { return score; }
    public void setScore(Integer score) { this.score = score; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}