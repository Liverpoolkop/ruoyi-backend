package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.Knowledge;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface KnowledgeMapper {

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
     * 删除知识点
     */
    int deleteKnowledgeById(Long knowledgeId);

    /**
     * 批量删除知识点
     */
    int deleteKnowledgeByIds(Long[] knowledgeIds);

    /**
     * 搜索知识点
     */
    List<Knowledge> searchKnowledge(@Param("keyword") String keyword);

    /**
     * 根据课程ID查询知识点
     */
    List<Knowledge> selectKnowledgeByCourseId(@Param("courseId") Long courseId);

    /**
     * 查询树形结构知识点
     */
    List<Knowledge> selectKnowledgeTree(Knowledge knowledge);
}
