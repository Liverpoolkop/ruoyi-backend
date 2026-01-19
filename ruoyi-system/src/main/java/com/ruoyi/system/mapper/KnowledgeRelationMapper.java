package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.KnowledgeRelation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 知识点关系Mapper接口
 *
 * @author ruoyi
 * @date 2024-01-15
 */
public interface KnowledgeRelationMapper
{
    /**
     * 查询知识点关系
     *
     * @param relationId 知识点关系ID
     * @return 知识点关系
     */
    public KnowledgeRelation selectKnowledgeRelationById(Long relationId);

    /**
     * 查询知识点关系列表
     *
     * @param knowledgeRelation 知识点关系
     * @return 知识点关系集合
     */
    public List<KnowledgeRelation> selectKnowledgeRelationList(KnowledgeRelation knowledgeRelation);

    /**
     * 新增知识点关系
     *
     * @param knowledgeRelation 知识点关系
     * @return 结果
     */
    public int insertKnowledgeRelation(KnowledgeRelation knowledgeRelation);

    /**
     * 修改知识点关系
     *
     * @param knowledgeRelation 知识点关系
     * @return 结果
     */
    public int updateKnowledgeRelation(KnowledgeRelation knowledgeRelation);

    /**
     * 删除知识点关系
     *
     * @param relationId 知识点关系ID
     * @return 结果
     */
    public int deleteKnowledgeRelationById(Long relationId);

    /**
     * 批量删除知识点关系
     *
     * @param relationIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteKnowledgeRelationByIds(Long[] relationIds);

    /**
     * 根据知识点ID删除关系
     *
     * @param knowledgeId 知识点ID
     * @return 结果
     */
    public int deleteRelationsByKnowledgeId(@Param("knowledgeId") Long knowledgeId);

    /**
     * 根据课程ID查询关系
     *
     * @param courseId 课程ID
     * @return 结果
     */
    public List<KnowledgeRelation> selectRelationsByCourseId(@Param("courseId") Long courseId);

    /**
     * 查询知识点的所有关联关系
     *
     * @param knowledgeId 知识点ID
     * @return 结果
     */
    public List<KnowledgeRelation> selectRelationsByKnowledgeId(@Param("knowledgeId") Long knowledgeId);

    /**
     * 检查关系是否存在
     *
     * @param sourceId 源知识点ID
     * @param targetId 目标知识点ID
     * @return 结果
     */
    public int checkRelationExists(@Param("sourceId") Long sourceId, @Param("targetId") Long targetId);

    /**
     * 获取知识点的度（关联数量）
     *
     * @param knowledgeId 知识点ID
     * @return 度
     */
    public int getDegreeByKnowledgeId(@Param("knowledgeId") Long knowledgeId);
}
