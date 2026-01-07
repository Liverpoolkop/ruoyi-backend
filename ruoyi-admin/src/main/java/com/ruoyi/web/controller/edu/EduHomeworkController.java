package com.ruoyi.web.controller.edu;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.edu.domain.EduHomework;
import com.ruoyi.edu.domain.EduHomeworkSubmit;
import com.ruoyi.edu.service.IEduHomeworkService;
import com.ruoyi.edu.service.IEduHomeworkSubmitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/edu/homework")
public class EduHomeworkController {

    @Autowired
    private IEduHomeworkService homeworkService;

    @Autowired
    private IEduHomeworkSubmitService homeworkSubmitService; // 这个已经是注入的服务

    @GetMapping("/list")
    public AjaxResult list(@RequestParam Long courseId) {
        return AjaxResult.success(
                homeworkService.selectHomeworkListByCourseId(courseId)
        );
    }

    @PostMapping
    public AjaxResult add(@RequestBody EduHomework homework) {
        return AjaxResult.success(
                homeworkService.insertEduHomework(homework)
        );
    }

    @PostMapping("/submit")
    public AjaxResult submit(@RequestBody EduHomeworkSubmit body) {
        int rows = homeworkSubmitService.submit(
                body.getCourseId(),
                body.getHomeworkId(),
                body.getSubmitContent()
        );
        return AjaxResult.success(rows);
    }

    @GetMapping("/mySubmits")
    public AjaxResult mySubmits(@RequestParam Long courseId) {
        Long userId = SecurityUtils.getUserId();
        List<EduHomeworkSubmit> list =
                homeworkSubmitService.selectByCourseIdAndUserId(courseId, userId);
        return AjaxResult.success(list);
    }

    // 教师：查看某个作业的全部提交
    @GetMapping("/submits")
    public AjaxResult submits(@RequestParam Long homeworkId) {
        return AjaxResult.success(homeworkSubmitService.selectSubmitsByHomeworkId(homeworkId)); // 这里改成 homeworkSubmitService
    }

    // 教师评分接口
    @PostMapping("/grade")
    public AjaxResult grade(@RequestBody EduHomeworkSubmit body) {

        // 校验 submitId 和 score
        if (body.getSubmitId() == null) return AjaxResult.error("submitId 不能为空");
        if (body.getScore() == null) return AjaxResult.error("score 不能为空");

        // 调用作业提交服务进行评分
        int rows = homeworkSubmitService.grade(body.getSubmitId(), body.getScore(), body.getTeacherComment());

        // 返回操作结果
        return AjaxResult.success(rows);
    }
}
