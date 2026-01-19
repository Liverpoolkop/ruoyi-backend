package com.ruoyi.edu.domain;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 考试题目关联对象
 */
public class CourseExamQuestion extends BaseEntity {
    private Long id;
    private Long examId;
    private Long questionId;
    private Integer score;
    private Integer sortOrder;
    
    // 扩展字段：用于前端显示题目详情
    private String content; 
    private String type; 

    // Getter & Setter 省略... (请使用IDEA自动生成)
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public Long getExamId() { return examId; }
    public void setExamId(Long examId) { this.examId = examId; }
    public Long getQuestionId() { return questionId; }
    public void setQuestionId(Long questionId) { this.questionId = questionId; }
    public Integer getScore() { return score; }
    public void setScore(Integer score) { this.score = score; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
}