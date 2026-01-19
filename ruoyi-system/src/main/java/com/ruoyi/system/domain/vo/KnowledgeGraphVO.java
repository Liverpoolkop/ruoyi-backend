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

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getGraphName() {
        return graphName;
    }

    public void setGraphName(String graphName) {
        this.graphName = graphName;
    }

    public List<KnowledgeNodeVO> getNodes() {
        return nodes;
    }

    public void setNodes(List<KnowledgeNodeVO> nodes) {
        this.nodes = nodes;
    }

    public List<KnowledgeRelationVO> getLinks() {
        return links;
    }

    public void setLinks(List<KnowledgeRelationVO> links) {
        this.links = links;
    }

    public List<GraphCategoryVO> getCategories() {
        return categories;
    }

    public void setCategories(List<GraphCategoryVO> categories) {
        this.categories = categories;
    }

    public GraphStatsVO getStats() {
        return stats;
    }

    public void setStats(GraphStatsVO stats) {
        this.stats = stats;
    }

    public GraphLayoutVO getLayout() {
        return layout;
    }

    public void setLayout(GraphLayoutVO layout) {
        this.layout = layout;
    }
}
