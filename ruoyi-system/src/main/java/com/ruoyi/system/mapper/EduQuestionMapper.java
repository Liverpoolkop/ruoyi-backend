package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.EduQuestion;

/**
 * Question Mapper Interface
 */
public interface EduQuestionMapper {
    /**
     * Query Question
     * 
     * @param id Question ID
     * @return Question
     */
    public EduQuestion selectEduQuestionById(Long id);

    /**
     * Query Question List
     * 
     * @param eduQuestion Question
     * @return Question Collection
     */
    public List<EduQuestion> selectEduQuestionList(EduQuestion eduQuestion);

    /**
     * Insert Question
     * 
     * @param eduQuestion Question
     * @return Result
     */
    public int insertEduQuestion(EduQuestion eduQuestion);

    /**
     * Update Question
     * 
     * @param eduQuestion Question
     * @return Result
     */
    public int updateEduQuestion(EduQuestion eduQuestion);

    /**
     * Delete Question
     * 
     * @param id Question ID
     * @return Result
     */
    public int deleteEduQuestionById(Long id);

    /**
     * Batch Delete Question
     * 
     * @param ids IDs to delete
     * @return Result
     */
    public int deleteEduQuestionByIds(Long[] ids);
}
