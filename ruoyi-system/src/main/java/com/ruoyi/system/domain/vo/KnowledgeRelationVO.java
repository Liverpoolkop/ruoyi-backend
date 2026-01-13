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
}
