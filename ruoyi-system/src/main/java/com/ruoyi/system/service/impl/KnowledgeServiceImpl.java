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
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.mapper.EduChapterMapper;
import com.ruoyi.system.domain.EduChapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

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

    @Autowired
    private EduChapterMapper eduChapterMapper;

    private static final Logger log = LoggerFactory.getLogger(KnowledgeServiceImpl.class);

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

    @Override
    @Transactional
    public String importKnowledge(List<Knowledge> knowledgeList, Boolean isUpdateSupport, Long courseId)
    {
        if (StringUtils.isNull(knowledgeList) || knowledgeList.size() == 0)
        {
            throw new ServiceException("导入知识点数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();

        for (Knowledge knowledge : knowledgeList)
        {
            try
            {
                // 验证是否存在这个知识点
                Knowledge knowledgeQuery = new Knowledge();
                knowledgeQuery.setKnowledgeCode(knowledge.getKnowledgeCode());
                knowledgeQuery.setCourseId(courseId);
                List<Knowledge> existingList = knowledgeMapper.selectKnowledgeList(knowledgeQuery);
                Knowledge existingKnowledge = null;
                if (existingList != null && existingList.size() > 0) {
                    existingKnowledge = existingList.get(0);
                }

                // 处理章节ID
                if (knowledge.getChapterId() == null && StringUtils.isNotEmpty(knowledge.getChapterName())) {
                    EduChapter chapterQuery = new EduChapter();
                    chapterQuery.setCourseId(courseId);
                    chapterQuery.setChapterName(knowledge.getChapterName());
                    List<EduChapter> chapters = eduChapterMapper.selectEduChapterList(chapterQuery);
                    if (chapters != null && chapters.size() > 0) {
                        knowledge.setChapterId(chapters.get(0).getChapterId());
                    }
                }

                if (StringUtils.isNull(existingKnowledge))
                {
                    knowledge.setCourseId(courseId);
                    if (StringUtils.isEmpty(knowledge.getStatus())) {
                        knowledge.setStatus("0");
                    }
                    if (StringUtils.isEmpty(knowledge.getDifficultyLevel())) {
                        knowledge.setDifficultyLevel("medium");
                    }
                    this.insertKnowledge(knowledge);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、知识点 " + knowledge.getKnowledgeName() + " 导入成功");
                }
                else if (isUpdateSupport)
                {
                    knowledge.setKnowledgeId(existingKnowledge.getKnowledgeId());
                    knowledge.setCourseId(courseId);
                    this.updateKnowledge(knowledge);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "、知识点 " + knowledge.getKnowledgeName() + " 更新成功");
                }
                else
                {
                    failureNum++;
                    failureMsg.append("<br/>" + failureNum + "、知识点 " + knowledge.getKnowledgeName() + " 已存在");
                }
            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "、知识点 " + knowledge.getKnowledgeName() + " 导入失败：";
                failureMsg.append(msg + e.getMessage());
                log.error(msg, e);
            }
        }

        if (failureNum > 0)
        {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            return failureMsg.toString();
        }
        else
        {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }
}
