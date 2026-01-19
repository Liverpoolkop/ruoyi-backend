package com.ruoyi.system.domain.vo;

import lombok.Data;
import java.io.Serializable;

/**
 * 知识图谱关系边VO
 * 用于表示知识点之间的关联关系
 */
@Data
public class KnowledgeRelationVO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 关系源节点ID
     */
    private Long source;

    /**
     * 关系目标节点ID
     */
    private Long target;

    /**
     * 关系名称（对应relation_type）
     */
    private String name;

    /**
     * 关系强度（对应relation_strength）
     */
    private Double value = 1.0;

    /**
     * 边样式
     */
    private EdgeStyleVO lineStyle;

    /**
     * 标签样式
     */
    private LabelVO label;

    /**
     * 是否是有向边
     */
    private Boolean directed = true;

    public Long getSource() {
        return source;
    }

    public void setSource(Long source) {
        this.source = source;
    }

    public Long getTarget() {
        return target;
    }

    public void setTarget(Long target) {
        this.target = target;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    public EdgeStyleVO getLineStyle() {
        return lineStyle;
    }

    public void setLineStyle(EdgeStyleVO lineStyle) {
        this.lineStyle = lineStyle;
    }

    public LabelVO getLabel() {
        return label;
    }

    public void setLabel(LabelVO label) {
        this.label = label;
    }

    public Boolean getDirected() {
        return directed;
    }

    public void setDirected(Boolean directed) {
        this.directed = directed;
    }
}
