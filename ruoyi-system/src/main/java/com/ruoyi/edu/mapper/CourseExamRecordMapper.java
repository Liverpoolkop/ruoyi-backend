package com.ruoyi.edu.mapper;

import com.ruoyi.edu.domain.CourseExamRecord;
import com.ruoyi.edu.domain.CourseExamAnswer;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface CourseExamRecordMapper {
    // 根据考试ID和学生ID查记录
    CourseExamRecord selectByExamAndStudent(@Param("examId") Long examId, @Param("studentId") Long studentId);
    
    // 根据ID查
    CourseExamRecord selectById(Long id);
    
    // 插入
    int insertRecord(CourseExamRecord record);
    
    // 更新
    int updateRecord(CourseExamRecord record);

    // 插入答题详情
    int insertAnswer(CourseExamAnswer answer);

    // 新增查询列表方法
    List<CourseExamRecord> selectRecordList(CourseExamRecord record);

    // 查询某次考试的所有答题详情
    List<CourseExamAnswer> selectAnswerList(Long recordId);

    /**
     * 更新答题分数
     */
    int updateAnswerScore(CourseExamAnswer answer);

    // 计算总分
    int selectTotalScoreByRecordId(Long recordId);

    /**
     * 根据考试ID批量删除学生答案
     */
    int deleteAnswersByExamIds(Long[] examIds);

    /**
     * 根据考试ID批量删除考试记录
     */
    int deleteRecordsByExamIds(Long[] examIds);

    /**
     * 根据题目ID，将关联的已阅卷记录退回待阅卷状态
     */
    int revertFinishedStatusByQuestionId(Long questionId);
}