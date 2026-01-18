package com.ruoyi.edu.service;

import java.util.List;
import com.ruoyi.edu.domain.EduExamRecord;

/**
 * 测验记录Service接口
 * 
 * @author ruoyi
 * @date 2024-05-20
 */
public interface IEduExamRecordService 
{
    /**
     * 查询测验记录
     * 
     * @param recordId 测验记录主键
     * @return 测验记录
     */
    public EduExamRecord selectEduExamRecordByRecordId(Long recordId);

    /**
     * 查询测验记录列表
     * 
     * @param eduExamRecord 测验记录
     * @return 测验记录集合
     */
    public List<EduExamRecord> selectEduExamRecordList(EduExamRecord eduExamRecord);

    /**
     * 新增测验记录
     * 
     * @param eduExamRecord 测验记录
     * @return 结果
     */
    public int insertEduExamRecord(EduExamRecord eduExamRecord);

    /**
     * 修改测验记录
     * 
     * @param eduExamRecord 测验记录
     * @return 结果
     */
    public int updateEduExamRecord(EduExamRecord eduExamRecord);

    /**
     * 批量删除测验记录
     * 
     * @param recordIds 需要删除的测验记录主键集合
     * @return 结果
     */
    public int deleteEduExamRecordByRecordIds(Long[] recordIds);

    /**
     * 删除测验记录信息
     * 
     * @param recordId 测验记录主键
     * @return 结果
     */
    public int deleteEduExamRecordByRecordId(Long recordId);
}
