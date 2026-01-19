package com.ruoyi.system.domain.vo;

import lombok.Data;
import java.io.Serializable;

/**
 * 图谱分类VO（用于图例）
 */
@Data
public class GraphCategoryVO implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 分类名称
     */
    private String name;

    /**
     * 分类显示名称
     */
    private String displayName;

    /**
     * 分类颜色
     */
    private String color;

    /**
     * 分类图标
     */
    private String symbol;
}