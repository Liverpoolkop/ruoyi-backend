package com.ruoyi.system.domain.vo;

import lombok.Data;
import java.io.Serializable;

/**
 * 图谱布局配置VO
 */
@Data
public class GraphLayoutVO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 布局类型：'force' | 'circular' | 'grid' | 'none'
     */
    private String type = "force";

    /**
     * 斥力
     */
    private Integer repulsion = 1000;

    /**
     * 引力
     */
    private Double gravity = 0.1;

    /**
     * 边长度
     */
    private Integer edgeLength = 100;

    /**
     * 是否允许拖拽
     */
    private Boolean draggable = true;

    /**
     * 是否允许缩放
     */
    private Boolean zoomable = true;

    /**
     * 是否允许平移
     */
    private Boolean roam = true;
}
