package com.ruoyi.edu.mapper;

import java.util.List;
import com.ruoyi.edu.domain.CourseExamQuestion;

/**
 * 考试题目关联表 Mapper 接口
 */
public interface CourseExamQuestionMapper {
    /**
     * 根据考试ID查询题目关联列表
     */
    public List<CourseExamQuestion> selectByExamId(Long examId);

    /**
     * 批量新增关联
     */
    public int insertCourseExamQuestion(CourseExamQuestion courseExamQuestion);

    /**
     * 根据考试ID删除所有关联题目（用于更新时先删后加）
     */
    public int deleteByExamId(Long examId);
}