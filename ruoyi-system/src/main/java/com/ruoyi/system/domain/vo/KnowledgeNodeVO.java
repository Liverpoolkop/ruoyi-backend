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
}
