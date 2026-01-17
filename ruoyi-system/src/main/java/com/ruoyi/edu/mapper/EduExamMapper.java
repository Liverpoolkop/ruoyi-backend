package com.ruoyi.edu.mapper;

import java.util.List;
import com.ruoyi.edu.domain.EduExam;

/**
 * 测验Mapper接口
 * 
 * @author ruoyi
 * @date 2024-05-20
 */
public interface EduExamMapper 
{
    /**
     * 查询测验
     * 
     * @param examId 测验主键
     * @return 测验
     */
    public EduExam selectEduExamByExamId(Long examId);

    /**
     * 查询测验列表
     * 
     * @param eduExam 测验
     * @return 测验集合
     */
    public List<EduExam> selectEduExamList(EduExam eduExam);

    /**
     * 新增测验
     * 
     * @param eduExam 测验
     * @return 结果
     */
    public int insertEduExam(EduExam eduExam);

    /**
     * 修改测验
     * 
     * @param eduExam 测验
     * @return 结果
     */
    public int updateEduExam(EduExam eduExam);

    /**
     * 删除测验
     * 
     * @param examId 测验主键
     * @return 结果
     */
    public int deleteEduExamByExamId(Long examId);

    /**
     * 批量删除测验
     * 
     * @param examIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteEduExamByExamIds(Long[] examIds);
}
