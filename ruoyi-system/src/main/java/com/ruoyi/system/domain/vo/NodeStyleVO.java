package com.ruoyi.system.domain.vo;

import lombok.Data;
import java.io.Serializable;

/**
 * 节点样式VO
 */
@Data
public class NodeStyleVO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 填充颜色
     */
    private String color;

    /**
     * 边框颜色
     */
    private String borderColor;

    /**
     * 边框宽度
     */
    private Integer borderWidth = 1;

    /**
     * 边框类型：'solid' | 'dashed' | 'dotted'
     */
    private String borderType = "solid";

    /**
     * 阴影颜色
     */
    private String shadowColor;

    /**
     * 阴影模糊大小
     */
    private Integer shadowBlur = 0;

    /**
     * 阴影X偏移
     */
    private Integer shadowOffsetX = 0;

    /**
     * 阴影Y偏移
     */
    private Integer shadowOffsetY = 0;

    /**
     * 透明度
     */
    private Double opacity = 1.0;
}
