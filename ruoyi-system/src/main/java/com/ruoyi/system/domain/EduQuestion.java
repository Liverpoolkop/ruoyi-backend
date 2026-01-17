package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * Question Object edu_question
 */
public class EduQuestion extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** ID */
    private Long id;

    /** Teacher ID */
    private Long teacherId;

    /** Type (1:Single, 2:Multi, 3:Bool, 4:Fill) */
    @Excel(name = "Type", readConverterExp = "1=Single,2=Multi,3=Bool,4=Fill")
    private String type;

    /** content */
    @Excel(name = "Content")
    private String content;

    /** Options JSON */
    @Excel(name = "Options")
    private String options;

    /** Answer */
    @Excel(name = "Answer")
    private String answer;

    /** Analysis */
    @Excel(name = "Analysis")
    private String analysis;

    /** Tags */
    @Excel(name = "Tags")
    private String tags;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setTeacherId(Long teacherId) {
        this.teacherId = teacherId;
    }

    public Long getTeacherId() {
        return teacherId;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    public void setOptions(String options) {
        this.options = options;
    }

    public String getOptions() {
        return options;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnalysis(String analysis) {
        this.analysis = analysis;
    }

    public String getAnalysis() {
        return analysis;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getTags() {
        return tags;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("teacherId", getTeacherId())
                .append("type", getType())
                .append("content", getContent())
                .append("options", getOptions())
                .append("answer", getAnswer())
                .append("analysis", getAnalysis())
                .append("createBy", getCreateBy())
                .append("createTime", getCreateTime())
                .append("updateBy", getUpdateBy())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}
