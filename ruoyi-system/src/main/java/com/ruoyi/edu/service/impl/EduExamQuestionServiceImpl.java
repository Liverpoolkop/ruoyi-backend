package com.ruoyi.edu.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.edu.mapper.EduExamQuestionMapper;
import com.ruoyi.edu.domain.EduExamQuestion;
import com.ruoyi.edu.service.IEduExamQuestionService;

/**
 * 测验题目关联Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-05-20
 */
@Service
public class EduExamQuestionServiceImpl implements IEduExamQuestionService 
{
    @Autowired
    private EduExamQuestionMapper eduExamQuestionMapper;

    /**
     * 查询测验题目关联
     * 
     * @param examId 测验题目关联主键
     * @return 测验题目关联
     */
    @Override
    public EduExamQuestion selectEduExamQuestionByExamId(Long examId)
    {
        return eduExamQuestionMapper.selectEduExamQuestionByExamId(examId);
    }

    /**
     * 查询测验题目关联列表
     * 
     * @param eduExamQuestion 测验题目关联
     * @return 测验题目关联
     */
    @Override
    public List<EduExamQuestion> selectEduExamQuestionList(EduExamQuestion eduExamQuestion)
    {
        return eduExamQuestionMapper.selectEduExamQuestionList(eduExamQuestion);
    }

    /**
     * 新增测验题目关联
     * 
     * @param eduExamQuestion 测验题目关联
     * @return 结果
     */
    @Override
    public int insertEduExamQuestion(EduExamQuestion eduExamQuestion)
    {
        return eduExamQuestionMapper.insertEduExamQuestion(eduExamQuestion);
    }

    /**
     * 修改测验题目关联
     * 
     * @param eduExamQuestion 测验题目关联
     * @return 结果
     */
    @Override
    public int updateEduExamQuestion(EduExamQuestion eduExamQuestion)
    {
        return eduExamQuestionMapper.updateEduExamQuestion(eduExamQuestion);
    }

    /**
     * 批量删除测验题目关联
     * 
     * @param examIds 需要删除的测验题目关联主键
     * @return 结果
     */
    @Override
    public int deleteEduExamQuestionByExamIds(Long[] examIds)
    {
        return eduExamQuestionMapper.deleteEduExamQuestionByExamIds(examIds);
    }

    /**
     * 删除测验题目关联信息
     * 
     * @param examId 测验题目关联主键
     * @return 结果
     */
    @Override
    public int deleteEduExamQuestionByExamId(Long examId)
    {
        return eduExamQuestionMapper.deleteEduExamQuestionByExamId(examId);
    }
}
