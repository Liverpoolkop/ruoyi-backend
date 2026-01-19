package com.ruoyi.web.controller.edu;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.edu.domain.CourseExam;
import com.ruoyi.edu.domain.CourseExamRecord;
import com.ruoyi.edu.service.ICourseExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;
// ... 之前的 import ...
import com.ruoyi.edu.domain.CourseExamSubmitBody; // 引入刚才建的 DTO
import java.util.Date;

@RestController
@RequestMapping("/edu/course/exam")
public class CourseExamController extends BaseController {

    @Autowired
    private ICourseExamService courseExamService;

    /**
     * 查询考试列表
     */
    @PreAuthorize("@ss.hasPermi('edu:exam:list') or @ss.hasRole('student')")
    @GetMapping("/list")
    public TableDataInfo list(CourseExam courseExam) {
        startPage();
        List<CourseExam> list = courseExamService.selectCourseExamList(courseExam);
        return getDataTable(list);
    }

    /**
     * 获取考试详细信息
     */
    @PreAuthorize("@ss.hasPermi('edu:exam:query') or @ss.hasRole('student')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(courseExamService.selectCourseExamById(id));
    }

    /**
     * 新增考试 (组卷)
     */
    @PreAuthorize("@ss.hasPermi('edu:exam:add')")
    @Log(title = "课程考试", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CourseExam courseExam) {
        courseExam.setCreateBy(SecurityUtils.getUsername());
        courseExam.setTeacherId(SecurityUtils.getUserId());
        return toAjax(courseExamService.insertCourseExam(courseExam));
    }

    /**
     * 修改考试
     */
    @PreAuthorize("@ss.hasPermi('edu:exam:edit')")
    @Log(title = "课程考试", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CourseExam courseExam) {
        courseExam.setUpdateBy(SecurityUtils.getUsername());
        return toAjax(courseExamService.updateCourseExam(courseExam));
    }
    
    /**
     * 发布考试
     */
    @PreAuthorize("@ss.hasPermi('edu:exam:edit')")
    @Log(title = "课程考试", businessType = BusinessType.UPDATE)
    @PutMapping("/publish/{id}")
    public AjaxResult publish(@PathVariable Long id) {
        return toAjax(courseExamService.publishExam(id));
    }

    /**
     * 1. 开始考试
     */
    @GetMapping("/start/{examId}")
    public AjaxResult startExam(@PathVariable Long examId) {
        // 调用 Service 获取 map (包含 exam, record, questions)
        java.util.Map<String, Object> data = courseExamService.startExam(examId, SecurityUtils.getUserId());
        
        // 【核心修改】不要直接 success(data)，那样会多一层 "data"
        AjaxResult ajax = AjaxResult.success();
        
        // 使用 putAll 把 map 里的 key 全部“摊平”放到最外层
        // 这样前端 res.exam 就能直接取到了
        if (data != null) {
            ajax.putAll(data);
        }
        
        // 放入服务器时间
        ajax.put("serverTime", new Date()); 
        return ajax;
    }

    /**
     * 2. 提交试卷
     */
    @Log(title = "课程考试", businessType = BusinessType.UPDATE)
    @PostMapping("/submit")
    public AjaxResult submitExam(@RequestBody CourseExamSubmitBody body) {
        courseExamService.submitExam(body);
        return success();
    }

    /**
     * 3. 记录作弊
     */
    //TODO
    // @PostMapping("/cheat")
    // public AjaxResult recordCheat(@RequestBody CourseExamSubmitBody body) {
    //     // 前端传 { id: recordId }，我们复用这个对象接一下 id 即可，或者新建一个简单的对象
    //     // 这里假设前端传的是 { id: 123 } 这种格式，需要适配一下
    //     // 如果前端 api 传的是 { id: recordId }，建议这里用 @RequestBody Map<String, Long> params
    //     // 为了对应之前 Service 接口，这里我们取 body 中的 recordId
    //     // 注意：前端 api 代码里 recordCheat 传的是 data，你需要确认前端传的是什么结构
    //     // 假设前端传 { id: 100 }
        
    //     // 简单起见，我们直接接收 Map
    //     // 请把方法签名改成下面的：
    //     return success();
    // }
    
    // 修正后的 recordCheat 方法
    @PostMapping("/cheat")
    public AjaxResult recordCheat(@RequestBody java.util.Map<String, Long> params) {
        Long id = params.get("id");
        courseExamService.recordCheat(id);
        return success();
    }

    /**
     * 查询考试提交记录列表 (阅卷列表)
     */
    @GetMapping("/record/list")
    public TableDataInfo listRecord(CourseExamRecord record) {
        startPage();
        List<CourseExamRecord> list = courseExamService.selectRecordList(record);
        return getDataTable(list);
    }

    /**
     * 获取学生答卷详情 (用于阅卷)
     */
    @GetMapping("/record/detail/{recordId}")
    public AjaxResult getRecordDetail(@PathVariable Long recordId) {
        return success(courseExamService.getRecordDetail(recordId));
    }

    /**
     * 提交阅卷/打分
     */
    @PostMapping("/grade")
    public AjaxResult gradeExam(@RequestBody CourseExamSubmitBody body) {
        // body.getAnswers() 里应该包含 {id: 答题ID, score: 给分}
        // 我们复用 CourseExamSubmitBody 这个类，或者用 Map 接收
        courseExamService.gradeExam(body.getRecordId(), body.getAnswers(), body.getTeacherComment());
        return success();
    }


    /**
     * 删除考试
     */
    @PreAuthorize("@ss.hasPermi('edu:exam:remove')")
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(courseExamService.deleteCourseExamByIds(ids));
    }
}