package com.ruoyi.web.controller.edu;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.edu.domain.EduHomeworkSubmit;
import com.ruoyi.edu.service.IEduHomeworkSubmitService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/edu/homeworkSubmit")
public class EduHomeworkSubmitController {

    @Autowired
    private IEduHomeworkSubmitService submitService;

    // 学生提交作业
    @PostMapping("/submit")
    public AjaxResult submit(@RequestBody EduHomeworkSubmit submit) {

        // 检查作业是否有课程ID和作业ID
        if (submit.getCourseId() == null || submit.getHomeworkId() == null) {
            return AjaxResult.error("courseId/homeworkId 不能为空");
        }

        // 检查提交内容是否为空
        if (submit.getSubmitContent() == null || submit.getSubmitContent().trim().isEmpty()) {
            return AjaxResult.error("作业内容不能为空");
        }

        // 提交作业
        int rows = submitService.submit(
                submit.getCourseId(),
                submit.getHomeworkId(),
                submit.getSubmitContent()
        );

        return AjaxResult.success(rows);
    }
}
