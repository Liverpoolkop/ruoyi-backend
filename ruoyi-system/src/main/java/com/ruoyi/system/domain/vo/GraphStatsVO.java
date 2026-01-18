package com.ruoyi.system.domain.vo;

import lombok.Data;
import java.io.Serializable;

/**
 * 图谱统计信息VO
 */
@Data
public class GraphStatsVO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 总节点数
     */
    private Integer totalNodes;

    /**
     * 总边数
     */
    private Integer totalEdges;

    /**
     * 平均连接度
     */
    private Double averageDegree;

    /**
     * 图密度
     */
    private Double graphDensity;

    /**
     * 按难度的节点分布
     */
    private java.util.Map<String, Integer> difficultyDistribution;

    /**
     * 按层级的节点分布
     */
    private java.util.Map<Integer, Integer> levelDistribution;
}
