package com.ruoyi.web.controller.edu;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.edu.domain.EduExperiment;
import com.ruoyi.edu.domain.EduExperimentSubmission;
import com.ruoyi.edu.mapper.EduExperimentMapper;
import com.ruoyi.edu.mapper.EduExperimentSubmissionMapper;

/**
 * 实验管理控制器
 */
@RestController
@RequestMapping("/edu/experiment")
public class EduExperimentController extends BaseController {

    @Autowired
    private EduExperimentMapper experimentMapper;

    @Autowired
    private EduExperimentSubmissionMapper submissionMapper;

    @Autowired
    private Judge0Service judge0Service;

    /**
     * 获取实验列表
     */
    @GetMapping("/list")
    public TableDataInfo list(EduExperiment experiment) {
        startPage();
        List<EduExperiment> list = experimentMapper.selectList(experiment);
        return getDataTable(list);
    }

    /**
     * 获取实验详情
     */
    @GetMapping("/{id}")
    public AjaxResult getInfo(@PathVariable Long id) {
        EduExperiment experiment = experimentMapper.selectById(id);
        return AjaxResult.success(experiment);
    }

    /**
     * 新增实验
     */
    @PostMapping
    public AjaxResult add(@RequestBody EduExperiment experiment) {
        experiment.setCreateBy(SecurityUtils.getUsername());
        experiment.setCreateTime(new Date());
        experimentMapper.insert(experiment);
        return AjaxResult.success();
    }

    /**
     * 修改实验
     */
    @PutMapping
    public AjaxResult edit(@RequestBody EduExperiment experiment) {
        experimentMapper.update(experiment);
        return AjaxResult.success();
    }

    /**
     * 删除实验
     */
    @DeleteMapping("/{id}")
    public AjaxResult remove(@PathVariable Long id) {
        experimentMapper.deleteById(id);
        return AjaxResult.success();
    }

    /**
     * 运行代码（不判题，仅执行）
     */
    @PostMapping("/{id}/run")
    public AjaxResult runCode(@PathVariable Long id, @RequestBody Map<String, String> body) {
        String code = body.get("code");
        String stdin = body.get("stdin");

        if (code == null || code.isEmpty()) {
            return AjaxResult.error("代码不能为空");
        }

        Map<String, Object> result = judge0Service.runCode(code, stdin);
        return AjaxResult.success(result);
    }

    /**
     * 提交代码（判题）
     */
    @PostMapping("/{id}/submit")
    public AjaxResult submitCode(@PathVariable Long id, @RequestBody Map<String, String> body) {
        String code = body.get("code");

        if (code == null || code.isEmpty()) {
            return AjaxResult.error("代码不能为空");
        }

        // 获取实验信息
        EduExperiment experiment = experimentMapper.selectById(id);
        if (experiment == null) {
            return AjaxResult.error("实验不存在");
        }

        // 检查截止时间
        if (experiment.getDeadline() != null && new Date().after(experiment.getDeadline())) {
            return AjaxResult.error("实验已截止，无法提交");
        }

        // 调用Judge0判题
        Map<String, Object> judgeResult = judge0Service.judgeCode(
                code,
                experiment.getTestInput(),
                experiment.getTestOutput());

        // 保存提交记录
        EduExperimentSubmission submission = new EduExperimentSubmission();
        submission.setExperimentId(id);
        submission.setStudentId(SecurityUtils.getUserId());
        submission.setCode(code);
        submission.setSubmitTime(new Date());

        // 解析结果
        String statusDesc = judge0Service.getStatusDescription(judgeResult);
        submission.setResult(statusDesc);

        if (judgeResult.containsKey("stdout")) {
            Object stdout = judgeResult.get("stdout");
            submission.setStdout(stdout != null ? stdout.toString() : null);
        }
        if (judgeResult.containsKey("stderr")) {
            Object stderr = judgeResult.get("stderr");
            submission.setStderr(stderr != null ? stderr.toString() : null);
        }
        if (judgeResult.containsKey("compile_output")) {
            Object compileOutput = judgeResult.get("compile_output");
            submission.setCompileOutput(compileOutput != null ? compileOutput.toString() : null);
        }
        if (judgeResult.containsKey("time")) {
            Object time = judgeResult.get("time");
            submission.setRunTime(time != null ? time.toString() : null);
        }
        if (judgeResult.containsKey("memory")) {
            Object memory = judgeResult.get("memory");
            submission.setMemoryUsed(memory != null ? memory.toString() : null);
        }

        submissionMapper.insert(submission);

        // 返回结果
        Map<String, Object> response = new HashMap<>();
        response.put("submission", submission);
        response.put("judgeResult", judgeResult);

        return AjaxResult.success(response);
    }

    /**
     * 获取学生的提交历史
     */
    @GetMapping("/{id}/submissions")
    public AjaxResult getSubmissions(@PathVariable Long id) {
        EduExperimentSubmission query = new EduExperimentSubmission();
        query.setExperimentId(id);
        query.setStudentId(SecurityUtils.getUserId());
        List<EduExperimentSubmission> list = submissionMapper.selectList(query);
        return AjaxResult.success(list);
    }

    /**
     * 教师查看所有学生提交记录
     */
    @GetMapping("/{id}/all-submissions")
    public AjaxResult getAllSubmissions(@PathVariable Long id) {
        EduExperimentSubmission query = new EduExperimentSubmission();
        query.setExperimentId(id);
        List<EduExperimentSubmission> list = submissionMapper.selectList(query);
        return AjaxResult.success(list);
    }
}
