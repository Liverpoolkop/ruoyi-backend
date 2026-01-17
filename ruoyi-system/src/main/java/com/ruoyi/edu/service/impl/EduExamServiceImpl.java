package com.ruoyi.edu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.edu.mapper.EduExamMapper;
import com.ruoyi.edu.domain.EduExam;
import com.ruoyi.edu.service.IEduExamService;

/**
 * 测验Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-05-20
 */
@Service
public class EduExamServiceImpl implements IEduExamService 
{
    @Autowired
    private EduExamMapper eduExamMapper;

    /**
     * 查询测验
     * 
     * @param examId 测验主键
     * @return 测验
     */
    @Override
    public EduExam selectEduExamByExamId(Long examId)
    {
        return eduExamMapper.selectEduExamByExamId(examId);
    }

    /**
     * 查询测验列表
     * 
     * @param eduExam 测验
     * @return 测验
     */
    @Override
    public List<EduExam> selectEduExamList(EduExam eduExam)
    {
        return eduExamMapper.selectEduExamList(eduExam);
    }

    /**
     * 新增测验
     * 
     * @param eduExam 测验
     * @return 结果
     */
    @Override
    public int insertEduExam(EduExam eduExam)
    {
        eduExam.setCreateTime(DateUtils.getNowDate());
        return eduExamMapper.insertEduExam(eduExam);
    }

    /**
     * 修改测验
     * 
     * @param eduExam 测验
     * @return 结果
     */
    @Override
    public int updateEduExam(EduExam eduExam)
    {
        eduExam.setUpdateTime(DateUtils.getNowDate());
        return eduExamMapper.updateEduExam(eduExam);
    }

    /**
     * 批量删除测验
     * 
     * @param examIds 需要删除的测验主键
     * @return 结果
     */
    @Override
    public int deleteEduExamByExamIds(Long[] examIds)
    {
        return eduExamMapper.deleteEduExamByExamIds(examIds);
    }

    /**
     * 删除测验信息
     * 
     * @param examId 测验主键
     * @return 结果
     */
    @Override
    public int deleteEduExamByExamId(Long examId)
    {
        return eduExamMapper.deleteEduExamByExamId(examId);
    }
}
