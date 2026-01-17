package com.ruoyi.edu.service;

import java.util.List;
import com.ruoyi.edu.domain.EduExamQuestion;

/**
 * 测验题目关联Service接口
 * 
 * @author ruoyi
 * @date 2024-05-20
 */
public interface IEduExamQuestionService 
{
    /**
     * 查询测验题目关联
     * 
     * @param examId 测验题目关联主键
     * @return 测验题目关联
     */
    public EduExamQuestion selectEduExamQuestionByExamId(Long examId);

    /**
     * 查询测验题目关联列表
     * 
     * @param eduExamQuestion 测验题目关联
     * @return 测验题目关联集合
     */
    public List<EduExamQuestion> selectEduExamQuestionList(EduExamQuestion eduExamQuestion);

    /**
     * 新增测验题目关联
     * 
     * @param eduExamQuestion 测验题目关联
     * @return 结果
     */
    public int insertEduExamQuestion(EduExamQuestion eduExamQuestion);

    /**
     * 修改测验题目关联
     * 
     * @param eduExamQuestion 测验题目关联
     * @return 结果
     */
    public int updateEduExamQuestion(EduExamQuestion eduExamQuestion);

    /**
     * 批量删除测验题目关联
     * 
     * @param examIds 需要删除的测验题目关联主键集合
     * @return 结果
     */
    public int deleteEduExamQuestionByExamIds(Long[] examIds);

    /**
     * 删除测验题目关联信息
     * 
     * @param examId 测验题目关联主键
     * @return 结果
     */
    public int deleteEduExamQuestionByExamId(Long examId);
}
