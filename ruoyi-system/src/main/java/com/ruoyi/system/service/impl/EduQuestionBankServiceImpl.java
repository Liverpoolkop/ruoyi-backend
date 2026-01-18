package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.EduQuestionBankMapper;
import com.ruoyi.system.domain.EduQuestionBank;
import com.ruoyi.system.service.IEduQuestionBankService;

/**
 * Question Bank Service Implementation
 */
@Service
public class EduQuestionBankServiceImpl implements IEduQuestionBankService {
    @Autowired
    private EduQuestionBankMapper eduQuestionBankMapper;

    /**
     * Query Question Bank
     * 
     * @param id Question Bank ID
     * @return Question Bank
     */
    @Override
    public EduQuestionBank selectEduQuestionBankById(Long id) {
        return eduQuestionBankMapper.selectEduQuestionBankById(id);
    }

    /**
     * Query Question Bank List
     * 
     * @param eduQuestionBank Question Bank
     * @return Question Bank
     */
    @Override
    public List<EduQuestionBank> selectEduQuestionBankList(EduQuestionBank eduQuestionBank) {
        return eduQuestionBankMapper.selectEduQuestionBankList(eduQuestionBank);
    }

    /**
     * Insert Question Bank
     * 
     * @param eduQuestionBank Question Bank
     * @return Result
     */
    @Override
    public int insertEduQuestionBank(EduQuestionBank eduQuestionBank) {
        eduQuestionBank.setCreateTime(DateUtils.getNowDate());
        return eduQuestionBankMapper.insertEduQuestionBank(eduQuestionBank);
    }

    /**
     * Update Question Bank
     * 
     * @param eduQuestionBank Question Bank
     * @return Result
     */
    @Override
    public int updateEduQuestionBank(EduQuestionBank eduQuestionBank) {
        eduQuestionBank.setUpdateTime(DateUtils.getNowDate());
        return eduQuestionBankMapper.updateEduQuestionBank(eduQuestionBank);
    }

    /**
     * Batch Delete Question Bank
     * 
     * @param ids IDs to delete
     * @return Result
     */
    @Override
    public int deleteEduQuestionBankByIds(Long[] ids) {
        return eduQuestionBankMapper.deleteEduQuestionBankByIds(ids);
    }

    /**
     * Delete Question Bank
     * 
     * @param id Question Bank ID
     * @return Result
     */
    @Override
    public int deleteEduQuestionBankById(Long id) {
        return eduQuestionBankMapper.deleteEduQuestionBankById(id);
    }
}
