package com.ruoyi.system.domain.vo;


import lombok.Data;
import java.io.Serializable;

/**
 * 知识图谱节点VO
 * 用于ECharts等可视化图表的数据格式
 */
@Data
public class KnowledgeNodeVO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 节点ID（对应knowledge_id）
     */
    private Long id;

    /**
     * 节点名称（对应knowledge_name）
     */
    private String name;

    /**
     * 节点分类（对应difficulty_level）
     * 用于ECharts的categories
     */
    private String category;

    /**
     * 节点大小
     */
    private Integer symbolSize = 30;

    /**
     * 节点值（可用于设置大小或颜色）
     */
    private Double value;

    /**
     * 节点坐标x（前端计算）
     */
    private Double x;

    /**
     * 节点坐标y（前端计算）
     */
    private Double y;

    /**
     * 是否固定
     */
    private Boolean fixed = false;

    /**
     * 节点样式
     */
    private NodeStyleVO itemStyle;

    /**
     * 标签样式
     */
    private LabelVO label;

    /**
     * 扩展属性（存储原始数据）
     */
    private Object extra;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Integer getSymbolSize() {
        return symbolSize;
    }

    public void setSymbolSize(Integer symbolSize) {
        this.symbolSize = symbolSize;
    }

    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }

    public Double getX() {
        return x;
    }

    public void setX(Double x) {
        this.x = x;
    }

    public Double getY() {
        return y;
    }

    public void setY(Double y) {
        this.y = y;
    }

    public Boolean getFixed() {
        return fixed;
    }

    public void setFixed(Boolean fixed) {
        this.fixed = fixed;
    }

    public NodeStyleVO getItemStyle() {
        return itemStyle;
    }

    public void setItemStyle(NodeStyleVO itemStyle) {
        this.itemStyle = itemStyle;
    }

    public LabelVO getLabel() {
        return label;
    }

    public void setLabel(LabelVO label) {
        this.label = label;
    }

    public Object getExtra() {
        return extra;
    }

    public void setExtra(Object extra) {
        this.extra = extra;
    }
}
