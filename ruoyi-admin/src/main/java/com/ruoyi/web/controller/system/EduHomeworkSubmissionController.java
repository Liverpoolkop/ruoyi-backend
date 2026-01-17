package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.EduHomeworkSubmission;
import com.ruoyi.system.service.IEduHomeworkSubmissionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.SecurityUtils;

/**
 * Homework Submission Controller
 */
@RestController
@RequestMapping("/system/submission")
public class EduHomeworkSubmissionController extends BaseController {
    @Autowired
    private IEduHomeworkSubmissionService eduHomeworkSubmissionService;

    /**
     * Query Homework Submission List
     */
    @PreAuthorize("@ss.hasPermi('system:submission:list') or @ss.hasRole('teacher') or @ss.hasRole('student')")
    @GetMapping("/list")
    public TableDataInfo list(EduHomeworkSubmission eduHomeworkSubmission) {
        // If student, only show own submissions. Teachers and Admins can see all.
        try {
            if (SecurityUtils.hasRole("student") && !SecurityUtils.hasRole("teacher") && !SecurityUtils.hasRole("admin")) {
                eduHomeworkSubmission.setStudentId(getUserId());
            }
        } catch (Exception e) {
            // Ignore if security context issue
        }

        startPage();
        List<EduHomeworkSubmission> list = eduHomeworkSubmissionService
                .selectEduHomeworkSubmissionList(eduHomeworkSubmission);
        return getDataTable(list);
    }

    /**
     * Export Homework Submission List
     */
    @PreAuthorize("@ss.hasPermi('system:submission:export') or @ss.hasRole('teacher')")
    @Log(title = "Homework Submission", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, EduHomeworkSubmission eduHomeworkSubmission) {
        List<EduHomeworkSubmission> list = eduHomeworkSubmissionService
                .selectEduHomeworkSubmissionList(eduHomeworkSubmission);
        for (EduHomeworkSubmission sub : list) {
            sub.setSubmitTime(sub.getCreateTime());
        }
        ExcelUtil<EduHomeworkSubmission> util = new ExcelUtil<EduHomeworkSubmission>(EduHomeworkSubmission.class);
        util.exportExcel(response, list, "Homework Submission Data");
    }

    /**
     * Get Homework Submission Detailed Info
     */
    @PreAuthorize("@ss.hasPermi('system:submission:query') or @ss.hasRole('teacher') or @ss.hasRole('student')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(eduHomeworkSubmissionService.selectEduHomeworkSubmissionById(id));
    }

    /**
     * Add Homework Submission (Student Submit)
     */
    @PreAuthorize("@ss.hasPermi('system:submission:add') or @ss.hasRole('student')")
    @Log(title = "Homework Submission", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EduHomeworkSubmission eduHomeworkSubmission) {
        eduHomeworkSubmission.setStudentId(getUserId());
        eduHomeworkSubmission.setStudentName(getUsername());
        eduHomeworkSubmission.setStatus("1"); // Submitted
        return toAjax(eduHomeworkSubmissionService.insertEduHomeworkSubmission(eduHomeworkSubmission));
    }

    /**
     * Update Homework Submission (Grade or Resubmit)
     */
    @PreAuthorize("@ss.hasPermi('system:submission:edit') or @ss.hasRole('teacher') or @ss.hasRole('student')")
    @Log(title = "Homework Submission", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EduHomeworkSubmission eduHomeworkSubmission) {
        // Validation could be added here (e.g. students can't grade)
        return toAjax(eduHomeworkSubmissionService.updateEduHomeworkSubmission(eduHomeworkSubmission));
    }

    /**
     * Delete Homework Submission
     */
    @PreAuthorize("@ss.hasPermi('system:submission:remove') or @ss.hasRole('teacher')")
    @Log(title = "Homework Submission", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(eduHomeworkSubmissionService.deleteEduHomeworkSubmissionByIds(ids));
    }
}
