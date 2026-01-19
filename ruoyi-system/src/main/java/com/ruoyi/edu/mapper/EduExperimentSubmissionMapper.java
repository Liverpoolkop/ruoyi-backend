package com.ruoyi.edu.mapper;

import java.util.List;
import com.ruoyi.edu.domain.EduExperimentSubmission;

/**
 * 实验提交记录Mapper接口
 */
public interface EduExperimentSubmissionMapper {

    /**
     * 查询提交记录列表
     */
    List<EduExperimentSubmission> selectList(EduExperimentSubmission submission);

    /**
     * 根据ID查询提交记录
     */
    EduExperimentSubmission selectById(Long submissionId);

    /**
     * 新增提交记录
     */
    int insert(EduExperimentSubmission submission);

    /**
     * 修改提交记录
     */
    int update(EduExperimentSubmission submission);
}
