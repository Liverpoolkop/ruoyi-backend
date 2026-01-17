package com.ruoyi.web.controller.system;

import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.edu.domain.EduExam;
import com.ruoyi.edu.domain.EduExamRecord;
import com.ruoyi.edu.domain.EduExamQuestion;
import com.ruoyi.edu.service.IEduExamService;
import com.ruoyi.edu.service.IEduExamRecordService;
import com.ruoyi.edu.service.IEduExamQuestionService;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.alibaba.fastjson2.JSONArray;

/**
 * 门户测验Controller
 */
@RestController
@RequestMapping("/edu/portal/exam")
public class EduPortalExamController extends BaseController
{
    @Autowired
    private IEduExamService eduExamService;
    
    @Autowired
    private IEduExamRecordService eduExamRecordService;

    @Autowired
    private IEduExamQuestionService eduExamQuestionService;

    /**
     * Get exam list for current user (simplified: get all published exams)
     */
    @GetMapping("/list")
    public AjaxResult list(EduExam eduExam)
    {
        eduExam.setStatus("1"); // Published
        List<EduExam> list = eduExamService.selectEduExamList(eduExam);
        return AjaxResult.success(list);
    }

    /**
     * Get exam detail
     */
    @GetMapping("/{examId}")
    public AjaxResult getInfo(@PathVariable("examId") Long examId)
    {
        EduExam exam = eduExamService.selectEduExamByExamId(examId);
        if (exam != null && exam.getQuestions() != null) {
            for (EduExamQuestion q : exam.getQuestions()) {
                q.setAnswer(null); // Hide answer
            }
        }
        return AjaxResult.success(exam);
    }

    /**
     * Submit exam
     */
    @PostMapping("/submit")
    public AjaxResult submit(@RequestBody EduExamRecord record)
    {
        record.setUserId(SecurityUtils.getUserId());
        record.setSubmitTime(new Date());
        
        // Calculate score
        int totalScore = 0;
        try {
            EduExamQuestion query = new EduExamQuestion();
            query.setExamId(record.getExamId());
            List<EduExamQuestion> questions = eduExamQuestionService.selectEduExamQuestionList(query);
            
            JSONObject userAnswers = JSON.parseObject(record.getAnswers());
            
            for (EduExamQuestion q : questions) {
                String correct = q.getAnswer();
                if (correct == null) continue;
                
                Object userAnsObj = userAnswers.get(q.getQuestionId().toString());
                if (userAnsObj == null) continue;
                
                String userAns = "";
                if (userAnsObj instanceof JSONArray) {
                    // Sort array for comparison (e.g. ["A","B"] vs ["B","A"])
                    List<String> list = ((JSONArray) userAnsObj).toJavaList(String.class);
                    list.sort(String::compareTo);
                    userAns = String.join(",", list);
                } else {
                    userAns = userAnsObj.toString();
                }
                
                // Simple comparison (ignoring case usually, but strict for now)
                if (correct.equalsIgnoreCase(userAns)) {
                    totalScore += (q.getScore() == null ? 0 : q.getScore());
                }
            }
        } catch (Exception e) {
            logger.error("Error calculating score", e);
        }

        record.setScore(totalScore);
        return toAjax(eduExamRecordService.insertEduExamRecord(record));
    }
}
