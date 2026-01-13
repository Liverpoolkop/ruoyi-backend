package com.ruoyi.system.service.impl;


import com.ruoyi.system.domain.Knowledge;
import com.ruoyi.system.domain.KnowledgeRelation;
import com.ruoyi.system.mapper.KnowledgeMapper;
import com.ruoyi.system.mapper.KnowledgeRelationMapper;
import com.ruoyi.system.mapper.TeachingResourceKnowledgeMapper;
import com.ruoyi.system.service.IKnowledgeService;
import com.ruoyi.system.domain.vo.KnowledgeGraphVO;
import com.ruoyi.system.domain.vo.KnowledgeNodeVO;
import com.ruoyi.system.domain.vo.KnowledgeRelationVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class KnowledgeServiceImpl implements IKnowledgeService {

    @Autowired
    private KnowledgeMapper knowledgeMapper;

    @Autowired
    private KnowledgeRelationMapper knowledgeRelationMapper;

    @Autowired
    private TeachingResourceKnowledgeMapper teachingResourceKnowledgeMapper;

    @Override
    public Knowledge selectKnowledgeById(Long knowledgeId) {
        return knowledgeMapper.selectKnowledgeById(knowledgeId);
    }

    @Override
    public List<Knowledge> selectKnowledgeList(Knowledge knowledge) {
        return knowledgeMapper.selectKnowledgeList(knowledge);
    }

    @Override
    @Transactional
    public int insertKnowledge(Knowledge knowledge) {
        // 设置层级
        if (knowledge.getParentId() != null && knowledge.getParentId() != 0L) {
            Knowledge parent = knowledgeMapper.selectKnowledgeById(knowledge.getParentId());
        } else {
            knowledge.setParentId(0L);
        }
        return knowledgeMapper.insertKnowledge(knowledge);
    }

    @Override
    @Transactional
    public int updateKnowledge(Knowledge knowledge) {
        return knowledgeMapper.updateKnowledge(knowledge);
    }

    @Override
    @Transactional
    public int deleteKnowledgeByIds(Long[] knowledgeIds) {
        for (Long knowledgeId : knowledgeIds) {
            // 删除关联关系
            knowledgeRelationMapper.deleteRelationsByKnowledgeId(knowledgeId);
            // 删除教学资源关联
            teachingResourceKnowledgeMapper.deleteByKnowledgeId(knowledgeId);
        }
        return knowledgeMapper.deleteKnowledgeByIds(knowledgeIds);
    }

    @Override
    public List<Knowledge> searchKnowledge(String keyword) {
        return knowledgeMapper.searchKnowledge("%" + keyword + "%");
    }

    @Override
    public KnowledgeGraphVO getKnowledgeGraphDataByCourseId(Long courseId) {
        KnowledgeGraphVO graph = new KnowledgeGraphVO();

        // 获取节点数据
        List<Knowledge> knowledgeList = knowledgeMapper.selectKnowledgeByCourseId(courseId);
        List<KnowledgeNodeVO> nodes = new ArrayList<>();
        for (Knowledge knowledge : knowledgeList) {
            KnowledgeNodeVO node = new KnowledgeNodeVO();
            node.setId(knowledge.getKnowledgeId());
            node.setName(knowledge.getKnowledgeName());
            node.setCategory(knowledge.getDifficultyLevel());
            node.setSymbolSize(30);
            nodes.add(node);
        }
        graph.setNodes(nodes);

        // 获取关系数据
        List<KnowledgeRelation> relations = knowledgeRelationMapper.selectRelationsByCourseId(courseId);
        List<KnowledgeRelationVO> links = new ArrayList<>();
        for (KnowledgeRelation relation : relations) {
            KnowledgeRelationVO link = new KnowledgeRelationVO();
            link.setSource(relation.getSourceId());
            link.setTarget(relation.getTargetId());
            link.setName(relation.getRelationType());
            link.setValue(relation.getRelationStrength());
            links.add(link);
        }
        graph.setLinks(links);

        return graph;
    }

    @Override
    public List<Knowledge> getRelatedKnowledge(String resourceType, Long resourceId) {
        return teachingResourceKnowledgeMapper.selectKnowledgeByResource(resourceType, resourceId);
    }

    @Override
    @Transactional
    public int associateKnowledge(String resourceType, Long resourceId, List<Long> knowledgeIds) {
        // 先删除原有关联
        teachingResourceKnowledgeMapper.deleteByResource(resourceType, resourceId);

        // 添加新关联
        int count = 0;
        for (Long knowledgeId : knowledgeIds) {
            count += teachingResourceKnowledgeMapper.insertAssociation(resourceType, resourceId, knowledgeId);
        }
        return count;
    }
}
