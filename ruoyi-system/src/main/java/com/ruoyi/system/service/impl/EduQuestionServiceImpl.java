package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.EduQuestionMapper;
import com.ruoyi.system.domain.EduQuestion;
import com.ruoyi.system.service.IEduQuestionService;

/**
 * Question Service Implementation
 */
@Service
public class EduQuestionServiceImpl implements IEduQuestionService {
    @Autowired
    private EduQuestionMapper eduQuestionMapper;

    /**
     * Query Question
     * 
     * @param id Question ID
     * @return Question
     */
    @Override
    public EduQuestion selectEduQuestionById(Long id) {
        return eduQuestionMapper.selectEduQuestionById(id);
    }

    /**
     * Query Question List
     * 
     * @param eduQuestion Question
     * @return Question
     */
    @Override
    public List<EduQuestion> selectEduQuestionList(EduQuestion eduQuestion) {
        return eduQuestionMapper.selectEduQuestionList(eduQuestion);
    }

    /**
     * Insert Question
     * 
     * @param eduQuestion Question
     * @return Result
     */
    @Override
    public int insertEduQuestion(EduQuestion eduQuestion) {
        eduQuestion.setCreateTime(DateUtils.getNowDate());
        return eduQuestionMapper.insertEduQuestion(eduQuestion);
    }

    /**
     * Update Question
     * 
     * @param eduQuestion Question
     * @return Result
     */
    @Override
    public int updateEduQuestion(EduQuestion eduQuestion) {
        eduQuestion.setUpdateTime(DateUtils.getNowDate());
        return eduQuestionMapper.updateEduQuestion(eduQuestion);
    }

    /**
     * Batch Delete Question
     * 
     * @param ids IDs to delete
     * @return Result
     */
    @Override
    public int deleteEduQuestionByIds(Long[] ids) {
        return eduQuestionMapper.deleteEduQuestionByIds(ids);
    }

    /**
     * Delete Question
     * 
     * @param id Question ID
     * @return Result
     */
    @Override
    public int deleteEduQuestionById(Long id) {
        return eduQuestionMapper.deleteEduQuestionById(id);
    }
}
