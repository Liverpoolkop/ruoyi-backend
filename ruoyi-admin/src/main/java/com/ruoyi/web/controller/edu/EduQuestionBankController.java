package com.ruoyi.web.controller.edu;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.edu.domain.EduQuestionBank;
import com.ruoyi.edu.service.IEduQuestionBankService;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/edu/question")
public class EduQuestionBankController extends BaseController {

    @Resource
    private IEduQuestionBankService service;

    // 列表（筛选：questionType difficulty tags）
    @GetMapping("/list")
    public AjaxResult list(EduQuestionBank query) {
        List<EduQuestionBank> list = service.list(query);
        return AjaxResult.success(list);
    }

    @GetMapping("/{questionId}")
    public AjaxResult get(@PathVariable Long questionId) {
        return AjaxResult.success(service.get(questionId));
    }

    @PostMapping
    public AjaxResult add(@RequestBody EduQuestionBank q) {
        return toAjax(service.add(q));
    }

    @PutMapping
    public AjaxResult edit(@RequestBody EduQuestionBank q) {
        return toAjax(service.edit(q));
    }

    @DeleteMapping("/{questionId}")
    public AjaxResult remove(@PathVariable Long questionId) {
        return toAjax(service.remove(questionId));
    }
}
