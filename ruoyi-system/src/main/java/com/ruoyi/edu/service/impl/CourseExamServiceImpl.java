package com.ruoyi.edu.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.edu.mapper.CourseExamMapper;
import com.ruoyi.edu.mapper.CourseExamQuestionMapper;
import com.ruoyi.edu.service.ICourseExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import com.ruoyi.edu.mapper.CourseExamRecordMapper;
import com.ruoyi.edu.domain.*;
import com.ruoyi.system.mapper.EduQuestionMapper;
import com.ruoyi.system.domain.EduQuestion;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;

@Service
public class CourseExamServiceImpl implements ICourseExamService {

    @Autowired
    private CourseExamMapper courseExamMapper; // 需要你自己生成Mapper

    @Autowired
    private CourseExamQuestionMapper courseExamQuestionMapper; // 需要你自己生成Mapper

    // 👇👇👇 新增的依赖，请确保 Autowired 进来 👇👇👇
    @Autowired
    private CourseExamRecordMapper recordMapper; 
    @Autowired
    private EduQuestionMapper eduQuestionMapper; // 用来查题目详情

    @Override
    public List<CourseExam> selectCourseExamList(CourseExam courseExam) {
        return courseExamMapper.selectCourseExamList(courseExam);
    }

    @Override
    public CourseExam selectCourseExamById(Long id) {
        CourseExam exam = courseExamMapper.selectCourseExamById(id);
        if (exam != null) {
            // 补充查询关联的题目列表
            List<CourseExamQuestion> questions = courseExamQuestionMapper.selectByExamId(id);
            exam.setQuestionList(questions);
        }
        return exam;
    }

    @Transactional
    @Override
    public int insertCourseExam(CourseExam courseExam) {
        courseExam.setCreateTime(DateUtils.getNowDate());
        courseExam.setStatus("0"); // 默认未发布
        
        // 1. 计算总分
        int totalScore = 0;
        if (courseExam.getQuestionList() != null) {
            totalScore = courseExam.getQuestionList().stream()
                .mapToInt(q -> q.getScore() == null ? 0 : q.getScore()).sum();
        }
        courseExam.setTotalScore(totalScore);

        // 2. 插入主表
        int rows = courseExamMapper.insertCourseExam(courseExam);

        // 3. 插入题目关联
        insertQuestions(courseExam);
        return rows;
    }

    @Transactional
    @Override
    public int updateCourseExam(CourseExam courseExam) {
        courseExam.setUpdateTime(DateUtils.getNowDate());
        
        // 重新计算总分
        if (courseExam.getQuestionList() != null) {
             int totalScore = courseExam.getQuestionList().stream()
                .mapToInt(q -> q.getScore() == null ? 0 : q.getScore()).sum();
             courseExam.setTotalScore(totalScore);
        }

        // 删除旧题目关联，插入新题目关联 (简单做法)
        courseExamQuestionMapper.deleteByExamId(courseExam.getId());
        insertQuestions(courseExam);
        
        return courseExamMapper.updateCourseExam(courseExam);
    }
    
    @Override
    public int publishExam(Long id) {
        CourseExam exam = new CourseExam();
        exam.setId(id);
        exam.setStatus("1"); // 发布
        return courseExamMapper.updateCourseExam(exam);
    }

    private void insertQuestions(CourseExam courseExam) {
        List<CourseExamQuestion> list = courseExam.getQuestionList();
        if (StringUtils.isNotEmpty(list)) {
            for (CourseExamQuestion q : list) {
                q.setExamId(courseExam.getId());
                courseExamQuestionMapper.insertCourseExamQuestion(q);
            }
        }
    }

    // ================== 新增的 3 个方法 ==================

    @Override
    @Transactional
    public Map<String, Object> startExam(Long examId, Long userId) {
        // 1. 获取考试信息
        CourseExam exam = courseExamMapper.selectCourseExamById(examId);
        if (exam == null) throw new RuntimeException("考试不存在");
        
        // 2. 获取或创建考试记录
        CourseExamRecord record = recordMapper.selectByExamAndStudent(examId, userId);
        if (record == null) {
            record = new CourseExamRecord();
            record.setExamId(examId);
            record.setStudentId(userId);
            record.setStatus("1"); // 进行中
            record.setStartTime(DateUtils.getNowDate());
            record.setCheatCount(0);
            recordMapper.insertRecord(record);
        }

        // 3. 获取题目列表 (这里要非常注意：不能把标准答案返回给学生！)
        List<CourseExamQuestion> relations = courseExamQuestionMapper.selectByExamId(examId);
        List<EduQuestion> safeQuestions = new ArrayList<>();
        
        for (CourseExamQuestion rel : relations) {
            EduQuestion q = eduQuestionMapper.selectEduQuestionById(rel.getQuestionId());
            if (q != null) {
                // *** 关键：脱敏处理，清空答案和解析 ***
                q.setAnswer(null);
                q.setAnalysis(null);
                
                // 将分值挂载到题目对象上方便前端显示 (非标准做法，但方便)
                // 或者前端通过 index 匹配
                // 这里我们假设前端通过 list 顺序匹配或者 rel 表匹配
                safeQuestions.add(q);
            }
        }
        // 我们需要把分值也传回去，这里构建一个简单的复合结构
        // 为了省事，直接修改 CourseExamQuestion 返回，前端已有 EduQuestion 数据
        // 建议前端调用 listQuestion 接口的逻辑复用，或者这里直接返回 relations 和 safeQuestions
        
        // 最终返回 Map
        Map<String, Object> result = new HashMap<>();
        result.put("exam", exam);
        result.put("record", record);
        
        // 这里做一个合并，返回带有分值的题目列表
        List<Map<String, Object>> finalQuestions = new ArrayList<>();
        for (int i = 0; i < relations.size(); i++) {
            CourseExamQuestion rel = relations.get(i);
            // 找到对应的详情
            EduQuestion detail = safeQuestions.stream().filter(q -> q.getId().equals(rel.getQuestionId())).findFirst().orElse(null);
            if (detail != null) {
                Map<String, Object> map = new HashMap<>();
                map.put("id", detail.getId()); // 题目ID
                map.put("type", detail.getType());
                map.put("content", detail.getContent());
                map.put("options", detail.getOptions());
                map.put("score", rel.getScore()); // 本次考试的分值
                finalQuestions.add(map);
            }
        }
        result.put("questions", finalQuestions);
        
        return result;
    }

    @Override
    @Transactional
    public void submitExam(CourseExamSubmitBody body) {
        CourseExamRecord record = recordMapper.selectById(body.getRecordId());
        if (record == null) throw new RuntimeException("记录不存在");
        
        // 获取题目配置（为了拿分值）
        List<CourseExamQuestion> examQuestions = courseExamQuestionMapper.selectByExamId(body.getExamId());
        
        int totalObjScore = 0;
        
        // 遍历学生答案进行保存和判分
        if (body.getAnswers() != null) {
            for (CourseExamAnswer ans : body.getAnswers()) {
                // 找到题目配置
                CourseExamQuestion config = examQuestions.stream()
                    .filter(eq -> eq.getQuestionId().equals(ans.getQuestionId()))
                    .findFirst().orElse(null);
                
                if (config == null) continue;

                // 找到标准答案
                EduQuestion qDTO = eduQuestionMapper.selectEduQuestionById(ans.getQuestionId());
                
                ans.setRecordId(record.getId());
                
                // 简单自动判分逻辑 (仅客观题)
                // 1=单选, 2=多选, 3=判断
                if ("1".equals(qDTO.getType()) || "2".equals(qDTO.getType()) || "3".equals(qDTO.getType())) {
                    // 对比答案 (忽略大小写和空格)
                    String standard = qDTO.getAnswer() == null ? "" : qDTO.getAnswer().trim();
                    String student = ans.getStudentAnswer() == null ? "" : ans.getStudentAnswer().trim();
                    
                    if (standard.equalsIgnoreCase(student)) {
                        ans.setScore(config.getScore()); // 满分
                        ans.setStatus("1"); // 对
                        totalObjScore += config.getScore();
                    } else {
                        ans.setScore(0);
                        ans.setStatus("2"); // 错
                    }
                } else {
                    // 简答题等，暂不判分
                    ans.setScore(0);
                    ans.setStatus("0"); // 待判
                }
                
                // 保存答题详情
                recordMapper.insertAnswer(ans);
            }
        }
        
        // 更新记录状态
        record.setObjectiveScore(totalObjScore);
        record.setTotalScore(totalObjScore); // 暂时总分=客观分
        record.setStatus("2"); // 已提交
        record.setSubmitTime(DateUtils.getNowDate());
        recordMapper.updateRecord(record);
    }

    @Override
    public void recordCheat(Long recordId) {
        CourseExamRecord record = recordMapper.selectById(recordId);
        if (record != null) {
            // 1. 安全判空：如果是 null 则默认为 0
            int currentCount = record.getCheatCount() == null ? 0 : record.getCheatCount();
            
            // 2. 计数 +1
            record.setCheatCount(currentCount + 1);
            
            // 3. 更新数据库
            recordMapper.updateRecord(record);
        }
    }

    // 👇👇👇 请把这段代码加到 CourseExamServiceImpl 类里面 👇👇👇
    
    @Override
    public List<CourseExamRecord> selectRecordList(CourseExamRecord record) {
        return recordMapper.selectRecordList(record);
    }

    /**
     * 获取阅卷详情
     */
    public List<CourseExamAnswer> getRecordDetail(Long recordId) {
        return recordMapper.selectAnswerList(recordId);
    }

    /**
     * 提交阅卷结果
     */
    @Override
    @Transactional
    public void gradeExam(Long recordId, List<CourseExamAnswer> answers, String comment) {
        CourseExamRecord record = recordMapper.selectById(recordId);
        if (record == null) throw new RuntimeException("记录不存在");

        // 1. 保存老师打的分数
        if (answers != null) {
            for (CourseExamAnswer ans : answers) {
                if (ans.getId() != null && ans.getScore() != null) {
                    ans.setStatus("1"); // 标记为已阅
                    recordMapper.updateAnswerScore(ans);
                }
            }
        }

        // 2. 【核心修复】调用统计方法，分别计算并设置：总分、客观分、主观分
        // 这一步是你之前漏掉的！
        updateRecordStats(recordId);
        
        // 3. 再次获取最新记录(因为上面 updateRecordStats 已经更新了分数)
        // 这里的目的是更新状态和评语
        CourseExamRecord latestRecord = recordMapper.selectById(recordId);
        latestRecord.setStatus("3"); // 3=已阅卷
        latestRecord.setTeacherComment(comment);
        
        recordMapper.updateRecord(latestRecord);
    }

    /**
     * 【新增辅助方法】重新计算并更新某次考试记录的所有分数
     * 解决：只更新总分，不更新主观分的问题
     */
    private void updateRecordStats(Long recordId) {
        // 1. 查出所有答题详情
        List<CourseExamAnswer> answers = recordMapper.selectAnswerList(recordId);
        
        int totalScore = 0;
        int objectiveScore = 0;
        int subjectiveScore = 0;

        for (CourseExamAnswer ans : answers) {
            int score = (ans.getScore() == null) ? 0 : ans.getScore();
            totalScore += score;
            
            // 根据题目类型分类统计
            // 假设 1=单选, 2=多选, 3=判断 是客观题；4=简答 是主观题
            String type = ans.getQuestionType();
            if ("1".equals(type) || "2".equals(type) || "3".equals(type)) {
                objectiveScore += score;
            } else {
                subjectiveScore += score;
            }
        }

        // 2. 将计算好的三个分数更新到记录表
        CourseExamRecord record = new CourseExamRecord();
        record.setId(recordId);
        record.setTotalScore(totalScore);
        record.setObjectiveScore(objectiveScore);
        record.setSubjectiveScore(subjectiveScore); // 👈 关键：这里设置了主观分
        
        recordMapper.updateRecord(record);
    }

    /**
     * 批量删除考试
     */
    // @Override
    // public int deleteCourseExamByIds(Long[] ids) {
    //     // 可以在这里加一个判断：如果考试已经有人做过了(有记录)，则不允许删除
    //     // if (recordMapper.countByExamIds(ids) > 0) {
    //     //     throw new ServiceException("存在已提交的考试记录，无法删除");
    //     // }
        
    //     // 删除考试本身
    //     return courseExamMapper.deleteCourseExamByIds(ids);
    // }

    /**
     * 批量删除考试 (级联删除所有相关数据)
     */
    @Override
    @Transactional // 👈 必须加这个事务注解
    public int deleteCourseExamByIds(Long[] ids) {
        // 1. 先删最底层的：学生具体的【答题内容】
        recordMapper.deleteAnswersByExamIds(ids);
        
        // 2. 再删中间层的：学生的【考试记录】
        recordMapper.deleteRecordsByExamIds(ids);
        
        // 3. 再删配置层的：试卷与【题目关联】(注意：不删题库原题)
        courseExamMapper.deleteExamQuestionsByExamIds(ids);
        
        // 4. 最后删顶层的：【考试本身】
        return courseExamMapper.deleteCourseExamByIds(ids);
    }
}