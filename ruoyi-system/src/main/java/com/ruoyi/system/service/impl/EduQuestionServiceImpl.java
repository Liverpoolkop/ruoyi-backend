package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.edu.mapper.CourseExamRecordMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    @Autowired
    private CourseExamRecordMapper recordMapper; // 引入考试记录Mapper

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
     * 修改题目
     */
    @Override
    @Transactional // 建议加上事务，保证一致性
    public int updateEduQuestion(EduQuestion eduQuestion) {
        eduQuestion.setUpdateTime(DateUtils.getNowDate());
        
        // 1. 执行原有的题目更新
        int rows = eduQuestionMapper.updateEduQuestion(eduQuestion);
        
        // 2. 【核心新增逻辑】
        // 如果题目更新成功，则找到所有引用了该题目且已阅卷(status=3)的试卷，
        // 将它们的状态退回待阅卷(status=2)，强制老师重新确认分数。
        if (rows > 0) {
            recordMapper.revertFinishedStatusByQuestionId(eduQuestion.getId());
        }
        
        return rows;
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
