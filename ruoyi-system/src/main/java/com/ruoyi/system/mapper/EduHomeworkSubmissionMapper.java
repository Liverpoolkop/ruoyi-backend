package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.EduHomeworkSubmission;

/**
 * Homework Submission Mapper Interface
 */
public interface EduHomeworkSubmissionMapper {
    /**
     * Query Homework Submission
     * 
     * @param id Homework Submission ID
     * @return Homework Submission
     */
    public EduHomeworkSubmission selectEduHomeworkSubmissionById(Long id);

    /**
     * Query Homework Submission List
     * 
     * @param eduHomeworkSubmission Homework Submission
     * @return Homework Submission Collection
     */
    public List<EduHomeworkSubmission> selectEduHomeworkSubmissionList(EduHomeworkSubmission eduHomeworkSubmission);

    /**
     * Insert Homework Submission
     * 
     * @param eduHomeworkSubmission Homework Submission
     * @return Result
     */
    public int insertEduHomeworkSubmission(EduHomeworkSubmission eduHomeworkSubmission);

    /**
     * Update Homework Submission
     * 
     * @param eduHomeworkSubmission Homework Submission
     * @return Result
     */
    public int updateEduHomeworkSubmission(EduHomeworkSubmission eduHomeworkSubmission);

    /**
     * Delete Homework Submission
     * 
     * @param id Homework Submission ID
     * @return Result
     */
    public int deleteEduHomeworkSubmissionById(Long id);

    /**
     * Batch Delete Homework Submission
     * 
     * @param ids IDs to delete
     * @return Result
     */
    public int deleteEduHomeworkSubmissionByIds(Long[] ids);
}
