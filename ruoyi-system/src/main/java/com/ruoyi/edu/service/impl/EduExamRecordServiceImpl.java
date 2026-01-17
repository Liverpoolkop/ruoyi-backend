package com.ruoyi.edu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.edu.mapper.EduExamRecordMapper;
import com.ruoyi.edu.domain.EduExamRecord;
import com.ruoyi.edu.service.IEduExamRecordService;

/**
 * 测验记录Service业务层处理
 * 
 * @author ruoyi
 * @date 2024-05-20
 */
@Service
public class EduExamRecordServiceImpl implements IEduExamRecordService 
{
    @Autowired
    private EduExamRecordMapper eduExamRecordMapper;

    /**
     * 查询测验记录
     * 
     * @param recordId 测验记录主键
     * @return 测验记录
     */
    @Override
    public EduExamRecord selectEduExamRecordByRecordId(Long recordId)
    {
        return eduExamRecordMapper.selectEduExamRecordByRecordId(recordId);
    }

    /**
     * 查询测验记录列表
     * 
     * @param eduExamRecord 测验记录
     * @return 测验记录
     */
    @Override
    public List<EduExamRecord> selectEduExamRecordList(EduExamRecord eduExamRecord)
    {
        return eduExamRecordMapper.selectEduExamRecordList(eduExamRecord);
    }

    /**
     * 新增测验记录
     * 
     * @param eduExamRecord 测验记录
     * @return 结果
     */
    @Override
    public int insertEduExamRecord(EduExamRecord eduExamRecord)
    {
        eduExamRecord.setCreateTime(DateUtils.getNowDate());
        return eduExamRecordMapper.insertEduExamRecord(eduExamRecord);
    }

    /**
     * 修改测验记录
     * 
     * @param eduExamRecord 测验记录
     * @return 结果
     */
    @Override
    public int updateEduExamRecord(EduExamRecord eduExamRecord)
    {
        return eduExamRecordMapper.updateEduExamRecord(eduExamRecord);
    }

    /**
     * 批量删除测验记录
     * 
     * @param recordIds 需要删除的测验记录主键
     * @return 结果
     */
    @Override
    public int deleteEduExamRecordByRecordIds(Long[] recordIds)
    {
        return eduExamRecordMapper.deleteEduExamRecordByRecordIds(recordIds);
    }

    /**
     * 删除测验记录信息
     * 
     * @param recordId 测验记录主键
     * @return 结果
     */
    @Override
    public int deleteEduExamRecordByRecordId(Long recordId)
    {
        return eduExamRecordMapper.deleteEduExamRecordByRecordId(recordId);
    }
}
