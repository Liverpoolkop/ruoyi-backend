package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.EduQuestionBank;

/**
 * Question Bank Service Interface
 */
public interface IEduQuestionBankService {
    /**
     * Query Question Bank ID
     * 
     * @param id Question Bank ID
     * @return Question Bank
     */
    public EduQuestionBank selectEduQuestionBankById(Long id);

    /**
     * Query Question Bank List
     * 
     * @param eduQuestionBank Question Bank
     * @return Question Bank Collection
     */
    public List<EduQuestionBank> selectEduQuestionBankList(EduQuestionBank eduQuestionBank);

    /**
     * Insert Question Bank
     * 
     * @param eduQuestionBank Question Bank
     * @return Result
     */
    public int insertEduQuestionBank(EduQuestionBank eduQuestionBank);

    /**
     * Update Question Bank
     * 
     * @param eduQuestionBank Question Bank
     * @return Result
     */
    public int updateEduQuestionBank(EduQuestionBank eduQuestionBank);

    /**
     * Batch Delete Question Bank
     * 
     * @param ids IDs to delete
     * @return Result
     */
    public int deleteEduQuestionBankByIds(Long[] ids);

    /**
     * Delete Question Bank
     * 
     * @param id Question Bank ID
     * @return Result
     */
    public int deleteEduQuestionBankById(Long id);
}
