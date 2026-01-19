package com.ruoyi.system.mapper;


import com.ruoyi.system.domain.TeachingResourceKnowledge;
import com.ruoyi.system.domain.Knowledge;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 教学资源知识点关联Mapper接口
 *
 * @author ruoyi
 * @date 2024-01-15
 */
public interface TeachingResourceKnowledgeMapper
{
    /**
     * 查询关联关系
     *
     * @param id 关联ID
     * @return 关联关系
     */
    public TeachingResourceKnowledge selectTeachingResourceKnowledgeById(Long id);

    /**
     * 查询关联关系列表
     *
     * @param teachingResourceKnowledge 关联关系
     * @return 关联关系集合
     */
    public List<TeachingResourceKnowledge> selectTeachingResourceKnowledgeList(TeachingResourceKnowledge teachingResourceKnowledge);

    /**
     * 新增关联关系
     *
     * @param teachingResourceKnowledge 关联关系
     * @return 结果
     */
    public int insertTeachingResourceKnowledge(TeachingResourceKnowledge teachingResourceKnowledge);

    /**
     * 修改关联关系
     *
     * @param teachingResourceKnowledge 关联关系
     * @return 结果
     */
    public int updateTeachingResourceKnowledge(TeachingResourceKnowledge teachingResourceKnowledge);

    /**
     * 删除关联关系
     *
     * @param id 关联ID
     * @return 结果
     */
    public int deleteTeachingResourceKnowledgeById(Long id);

    /**
     * 批量删除关联关系
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteTeachingResourceKnowledgeByIds(Long[] ids);

    /**
     * 根据资源信息删除关联
     *
     * @param resourceType 资源类型
     * @param resourceId 资源ID
     * @return 结果
     */
    public int deleteByResource(@Param("resourceType") String resourceType, @Param("resourceId") Long resourceId);

    /**
     * 根据知识点ID删除关联
     *
     * @param knowledgeId 知识点ID
     * @return 结果
     */
    public int deleteByKnowledgeId(@Param("knowledgeId") Long knowledgeId);

    /**
     * 查询资源关联的知识点
     *
     * @param resourceType 资源类型
     * @param resourceId 资源ID
     * @return 知识点列表
     */
    public List<Knowledge> selectKnowledgeByResource(@Param("resourceType") String resourceType, @Param("resourceId") Long resourceId);

    /**
     * 查询知识点关联的资源
     *
     * @param knowledgeId 知识点ID
     * @return 资源列表
     */
    public List<TeachingResourceKnowledge> selectResourcesByKnowledgeId(@Param("knowledgeId") Long knowledgeId);

    /**
     * 插入关联关系（简化版）
     *
     * @param resourceType 资源类型
     * @param resourceId 资源ID
     * @param knowledgeId 知识点ID
     * @return 结果
     */
    public int insertAssociation(@Param("resourceType") String resourceType,
                                 @Param("resourceId") Long resourceId,
                                 @Param("knowledgeId") Long knowledgeId);

    /**
     * 批量插入关联关系
     *
     * @param list 关联关系列表
     * @return 结果
     */
    public int batchInsertAssociation(List<TeachingResourceKnowledge> list);

    /**
     * 统计资源关联的知识点数量
     *
     * @param resourceType 资源类型
     * @param resourceId 资源ID
     * @return 数量
     */
    public int countKnowledgeByResource(@Param("resourceType") String resourceType, @Param("resourceId") Long resourceId);

    /**
     * 统计知识点关联的资源数量
     *
     * @param knowledgeId 知识点ID
     * @return 数量
     */
    public int countResourcesByKnowledgeId(@Param("knowledgeId") Long knowledgeId);
}
