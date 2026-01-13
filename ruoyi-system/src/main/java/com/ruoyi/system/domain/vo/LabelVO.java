package com.ruoyi.system.domain.vo;

import lombok.Data;
import java.io.Serializable;

/**
 * 标签样式VO
 */
@Data
public class LabelVO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 是否显示标签
     */
    private Boolean show = true;

    /**
     * 标签位置
     */
    private String position;

    /**
     * 标签字体大小
     */
    private Integer fontSize = 12;

    /**
     * 标签字体颜色
     */
    private String color;

    /**
     * 标签字体粗细
     */
    private String fontWeight = "normal";

    /**
     * 标签背景颜色
     */
    private String backgroundColor;

    /**
     * 标签边框颜色
     */
    private String borderColor;

    /**
     * 标签边框宽度
     */
    private Integer borderWidth = 0;

    /**
     * 标签边框圆角
     */
    private Integer borderRadius = 0;

    /**
     * 标签内边距
     */
    private Integer padding = 5;
}
