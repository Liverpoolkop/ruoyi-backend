package com.ruoyi.edu.service;

import com.ruoyi.edu.domain.CourseExam;
import com.ruoyi.edu.domain.CourseExamAnswer;
import com.ruoyi.edu.domain.CourseExamRecord;

import java.util.List;

/**
 * 课程考试Service接口 (完全独立)
 */
public interface ICourseExamService {
    /**
     * 查询考试列表
     */
    List<CourseExam> selectCourseExamList(CourseExam courseExam);

    /**
     * 根据ID查询考试详情
     */
    CourseExam selectCourseExamById(Long id);

    /**
     * 创建考试 (组卷)
     */
    int insertCourseExam(CourseExam courseExam);

    /**
     * 修改考试
     */
    int updateCourseExam(CourseExam courseExam);

    /**
     * 发布考试
     */
    int publishExam(Long id);

    /**
     * 开始考试
     * @return 返回 map 包含：试卷信息、考试记录、题目列表(已脱敏)
     */
    java.util.Map<String, Object> startExam(Long examId, Long userId);

    /**
     * 提交试卷
     */
    void submitExam(com.ruoyi.edu.domain.CourseExamSubmitBody body);

    /**
     * 记录作弊
     */
    void recordCheat(Long recordId);

    /**
     * 查询考试记录列表 (阅卷用)
     */
    List<CourseExamRecord> selectRecordList(CourseExamRecord record);

    /**
     * 获取阅卷详情
     */
    List<CourseExamAnswer> getRecordDetail(Long recordId);

    /**
     * 提交阅卷结果
     */
    void gradeExam(Long recordId, List<CourseExamAnswer> answers, String comment);

    /**
     * 批量删除考试
     */
    int deleteCourseExamByIds(Long[] ids);

}