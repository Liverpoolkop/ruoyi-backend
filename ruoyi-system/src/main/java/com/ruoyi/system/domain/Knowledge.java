package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import javax.validation.constraints.NotBlank;

public class Knowledge extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /** 知识点ID */
    private Long knowledgeId;

    /** 知识点名称 */
    @NotBlank(message = "知识点名称不能为空")
    @Excel(name = "知识点名称")
    private String knowledgeName;

    /** 知识点编码 */
    @Excel(name = "知识点编码")
    private String knowledgeCode;

    /** 章节ID */
    private Long chapterId;

    /** 课程ID */
    private Long courseId;

    /** 知识点内容 */
    @Excel(name = "知识点内容")
    private String content;

    /** 难度等级 */
    @Excel(name = "难度等级")
    private String difficultyLevel;

    /** 关键词 */
    @Excel(name = "关键词")
    private String keywords;

    /** 父知识点ID */
    private Long parentId;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 章节名称 */
    @Excel(name = "所属章节")
    private String chapterName;

    /** 课程名称 */
    @Excel(name = "所属课程")
    private String courseName;

    /** 父知识点名称 */
    @Excel(name = "父知识点")
    private String parentName;

    // ============== 补全所有 getter 和 setter 方法 ==============

    public Long getKnowledgeId() {
        return knowledgeId;
    }

    public void setKnowledgeId(Long knowledgeId) {
        this.knowledgeId = knowledgeId;
    }

    public String getKnowledgeName() {
        return knowledgeName;
    }

    public void setKnowledgeName(String knowledgeName) {
        this.knowledgeName = knowledgeName;
    }

    public String getKnowledgeCode() {
        return knowledgeCode;
    }

    public void setKnowledgeCode(String knowledgeCode) {
        this.knowledgeCode = knowledgeCode;
    }

    public Long getChapterId() {
        return chapterId;
    }

    public void setChapterId(Long chapterId) {
        this.chapterId = chapterId;
    }

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDifficultyLevel() {
        return difficultyLevel;
    }

    public void setDifficultyLevel(String difficultyLevel) {
        this.difficultyLevel = difficultyLevel;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getChapterName() {
        return chapterName;
    }

    public void setChapterName(String chapterName) {
        this.chapterName = chapterName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getParentName() {
        return parentName;
    }

    public void setParentName(String parentName) {
        this.parentName = parentName;
    }

    // 更新 toString 方法，包含所有重要字段
    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("knowledgeId", getKnowledgeId())
                .append("knowledgeName", getKnowledgeName())
                .append("knowledgeCode", getKnowledgeCode())
                .append("chapterId", getChapterId())
                .append("courseId", getCourseId())
                .append("difficultyLevel", getDifficultyLevel())
                .append("parentId", getParentId())
                .append("status", getStatus())
                .append("chapterName", getChapterName())
                .append("courseName", getCourseName())
                .append("parentName", getParentName())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .append("remark", getRemark())
                .toString();
    }
}