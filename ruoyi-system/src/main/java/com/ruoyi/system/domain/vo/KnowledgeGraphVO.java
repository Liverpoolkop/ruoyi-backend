package com.ruoyi.system.domain.vo;

import lombok.Data;
import java.io.Serializable;
import java.util.List;

/**
 * 知识图谱数据VO
 * 包含所有节点和边的完整图谱数据
 */
@Data
public class KnowledgeGraphVO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 课程ID
     */
    private Long courseId;

    /**
     * 课程名称
     */
    private String courseName;

    /**
     * 图谱名称
     */
    private String graphName;

    /**
     * 节点列表
     */
    private List<KnowledgeNodeVO> nodes;

    /**
     * 边（关系）列表
     */
    private List<KnowledgeRelationVO> links;

    /**
     * 分类列表（用于图例）
     */
    private List<GraphCategoryVO> categories;

    /**
     * 统计信息
     */
    private GraphStatsVO stats;

    /**
     * 布局配置
     */
    private GraphLayoutVO layout;
}
