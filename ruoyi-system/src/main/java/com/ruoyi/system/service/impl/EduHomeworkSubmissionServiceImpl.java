package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.EduHomeworkSubmissionMapper;
import com.ruoyi.system.domain.EduHomeworkSubmission;
import com.ruoyi.system.service.IEduHomeworkSubmissionService;

/**
 * Homework Submission Service Implementation
 */
@Service
public class EduHomeworkSubmissionServiceImpl implements IEduHomeworkSubmissionService {
    @Autowired
    private EduHomeworkSubmissionMapper eduHomeworkSubmissionMapper;

    /**
     * Query Homework Submission
     * 
     * @param id Homework Submission ID
     * @return Homework Submission
     */
    @Override
    public EduHomeworkSubmission selectEduHomeworkSubmissionById(Long id) {
        return eduHomeworkSubmissionMapper.selectEduHomeworkSubmissionById(id);
    }

    /**
     * Query Homework Submission List
     * 
     * @param eduHomeworkSubmission Homework Submission
     * @return Homework Submission Collection
     */
    @Override
    public List<EduHomeworkSubmission> selectEduHomeworkSubmissionList(EduHomeworkSubmission eduHomeworkSubmission) {
        return eduHomeworkSubmissionMapper.selectEduHomeworkSubmissionList(eduHomeworkSubmission);
    }

    /**
     * Insert Homework Submission
     * 
     * @param eduHomeworkSubmission Homework Submission
     * @return Result
     */
    @Override
    public int insertEduHomeworkSubmission(EduHomeworkSubmission eduHomeworkSubmission) {
        eduHomeworkSubmission.setCreateTime(DateUtils.getNowDate());
        return eduHomeworkSubmissionMapper.insertEduHomeworkSubmission(eduHomeworkSubmission);
    }

    /**
     * Update Homework Submission
     * 
     * @param eduHomeworkSubmission Homework Submission
     * @return Result
     */
    @Override
    public int updateEduHomeworkSubmission(EduHomeworkSubmission eduHomeworkSubmission) {
        eduHomeworkSubmission.setUpdateTime(DateUtils.getNowDate());
        return eduHomeworkSubmissionMapper.updateEduHomeworkSubmission(eduHomeworkSubmission);
    }

    /**
     * Batch Delete Homework Submission
     * 
     * @param ids IDs to delete
     * @return Result
     */
    @Override
    public int deleteEduHomeworkSubmissionByIds(Long[] ids) {
        return eduHomeworkSubmissionMapper.deleteEduHomeworkSubmissionByIds(ids);
    }

    /**
     * Delete Homework Submission
     * 
     * @param id Homework Submission ID
     * @return Result
     */
    @Override
    public int deleteEduHomeworkSubmissionById(Long id) {
        return eduHomeworkSubmissionMapper.deleteEduHomeworkSubmissionById(id);
    }
}
