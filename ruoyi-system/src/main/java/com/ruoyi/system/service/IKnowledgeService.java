package com.ruoyi.system.service;

import com.ruoyi.system.domain.Knowledge;
import com.ruoyi.system.domain.vo.KnowledgeGraphVO;

import java.util.List;

public interface IKnowledgeService {

    /**
     * 查询知识点
     */
    Knowledge selectKnowledgeById(Long knowledgeId);

    /**
     * 查询知识点列表
     */
    List<Knowledge> selectKnowledgeList(Knowledge knowledge);

    /**
     * 新增知识点
     */
    int insertKnowledge(Knowledge knowledge);

    /**
     * 修改知识点
     */
    int updateKnowledge(Knowledge knowledge);

    /**
     * 批量删除知识点
     */
    int deleteKnowledgeByIds(Long[] knowledgeIds);

    /**
     * 搜索知识点
     */
    List<Knowledge> searchKnowledge(String keyword);

    /**
     * 获取知识图谱数据
     */
    KnowledgeGraphVO getKnowledgeGraphDataByCourseId(Long courseId);

    /**
     * 获取关联的知识点
     */
    List<Knowledge> getRelatedKnowledge(String resourceType, Long resourceId);

    /**
     * 关联知识点到教学资源
     */
    int associateKnowledge(String resourceType, Long resourceId, List<Long> knowledgeIds);
}