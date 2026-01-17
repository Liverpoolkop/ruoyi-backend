package com.ruoyi.edu.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 测验题目关联对象 edu_exam_question
 * 
 * @author ruoyi
 * @date 2024-05-20
 */
public class EduExamQuestion extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 测验ID */
    private Long examId;

    /** 题目ID */
    private Long questionId;

    /** 题目分值 */
    @Excel(name = "题目分值")
    private Integer score;

    /** 排序 */
    @Excel(name = "排序")
    private Integer sort;

    /** 题目内容 */
    private String content;

    /** 题目类型 */
    private String questionType;

    /** 选项 */
    private String options;

    /** 答案 */
    private String answer;

    public void setContent(String content) 
    {
        this.content = content;
    }

    public String getContent() 
    {
        return content;
    }

    public void setQuestionType(String questionType) 
    {
        this.questionType = questionType;
    }

    public String getQuestionType() 
    {
        return questionType;
    }

    public void setOptions(String options) 
    {
        this.options = options;
    }

    public String getOptions() 
    {
        return options;
    }

    public void setAnswer(String answer) 
    {
        this.answer = answer;
    }

    public String getAnswer() 
    {
        return answer;
    }

    public void setExamId(Long examId) 
    {
        this.examId = examId;
    }

    public Long getExamId() 
    {
        return examId;
    }
    public void setQuestionId(Long questionId) 
    {
        this.questionId = questionId;
    }

    public Long getQuestionId() 
    {
        return questionId;
    }
    public void setScore(Integer score) 
    {
        this.score = score;
    }

    public Integer getScore() 
    {
        return score;
    }
    public void setSort(Integer sort) 
    {
        this.sort = sort;
    }

    public Integer getSort() 
    {
        return sort;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("examId", getExamId())
            .append("questionId", getQuestionId())
            .append("score", getScore())
            .append("sort", getSort())
            .toString();
    }
}
