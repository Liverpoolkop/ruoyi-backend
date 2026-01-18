package com.ruoyi.system.domain.vo;

import lombok.Data;
import java.io.Serializable;

/**
 * 边样式VO
 */
@Data
public class EdgeStyleVO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 边颜色
     */
    private String color;

    /**
     * 边宽度
     */
    private Integer width = 2;

    /**
     * 边类型：'solid' | 'dashed' | 'dotted'
     */
    private String type = "solid";

    /**
     * 曲率（0-1）
     */
    private Double curveness = 0.0;

    /**
     * 透明度
     */
    private Double opacity = 0.8;
}
