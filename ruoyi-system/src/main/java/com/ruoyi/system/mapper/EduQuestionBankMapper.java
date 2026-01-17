package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.EduQuestionBank;

/**
 * Question Bank Mapper Interface
 */
public interface EduQuestionBankMapper {
    /**
     * Query Question Bank
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
     * Delete Question Bank
     * 
     * @param id Question Bank ID
     * @return Result
     */
    public int deleteEduQuestionBankById(Long id);

    /**
     * Batch Delete Question Bank
     * 
     * @param ids IDs to delete
     * @return Result
     */
    public int deleteEduQuestionBankByIds(Long[] ids);
}
