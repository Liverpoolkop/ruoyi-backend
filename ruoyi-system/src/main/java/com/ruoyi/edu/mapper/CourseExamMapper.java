package com.ruoyi.edu.mapper;

import java.util.List;
import com.ruoyi.edu.domain.CourseExam;

/**
 * 课程考试主表 Mapper 接口
 */
public interface CourseExamMapper {
    /**
     * 查询课程考试列表
     */
    public List<CourseExam> selectCourseExamList(CourseExam courseExam);

    /**
     * 查询课程考试详细信息
     */
    public CourseExam selectCourseExamById(Long id);

    /**
     * 新增课程考试
     */
    public int insertCourseExam(CourseExam courseExam);

    /**
     * 修改课程考试
     */
    public int updateCourseExam(CourseExam courseExam);

    /**
     * 删除课程考试
     */
    public int deleteCourseExamById(Long id);

    /**
     * 批量删除课程考试
     */
    public int deleteCourseExamByIds(Long[] ids);

    /**
     * 根据考试ID批量删除试卷题目关联
     */
    int deleteExamQuestionsByExamIds(Long[] examIds);
}