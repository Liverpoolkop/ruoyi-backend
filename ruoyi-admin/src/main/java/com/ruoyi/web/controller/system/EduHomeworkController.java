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
import com.ruoyi.system.domain.EduHomework;
import com.ruoyi.system.service.IEduHomeworkService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * Homework Controller
 */
@RestController
@RequestMapping("/system/homework")
public class EduHomeworkController extends BaseController {
    @Autowired
    private IEduHomeworkService eduHomeworkService;

    /**
     * Query Homework List
     */
    @PreAuthorize("@ss.hasPermi('system:homework:list') or @ss.hasRole('teacher') or @ss.hasRole('student')")
    @GetMapping("/list")
    public TableDataInfo list(EduHomework eduHomework) {
        startPage();
        List<EduHomework> list = eduHomeworkService.selectEduHomeworkList(eduHomework);
        return getDataTable(list);
    }

    /**
     * Export Homework List
     */
    @PreAuthorize("@ss.hasPermi('system:homework:export') or @ss.hasRole('teacher')")
    @Log(title = "Homework", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, EduHomework eduHomework) {
        List<EduHomework> list = eduHomeworkService.selectEduHomeworkList(eduHomework);
        ExcelUtil<EduHomework> util = new ExcelUtil<EduHomework>(EduHomework.class);
        util.exportExcel(response, list, "Homework Data");
    }

    /**
     * Get Homework Detailed Info
     */
    @PreAuthorize("@ss.hasPermi('system:homework:query') or @ss.hasRole('teacher') or @ss.hasRole('student')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(eduHomeworkService.selectEduHomeworkById(id));
    }

    /**
     * Add Homework
     */
    @PreAuthorize("@ss.hasPermi('system:homework:add') or @ss.hasRole('teacher')")
    @Log(title = "Homework", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EduHomework eduHomework) {
        eduHomework.setCreateBy(getUsername());
        return toAjax(eduHomeworkService.insertEduHomework(eduHomework));
    }

    /**
     * Update Homework
     */
    @PreAuthorize("@ss.hasPermi('system:homework:edit') or @ss.hasRole('teacher')")
    @Log(title = "Homework", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EduHomework eduHomework) {
        eduHomework.setUpdateBy(getUsername());
        return toAjax(eduHomeworkService.updateEduHomework(eduHomework));
    }

    /**
     * Delete Homework
     */
    @PreAuthorize("@ss.hasPermi('system:homework:remove') or @ss.hasRole('teacher')")
    @Log(title = "Homework", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(eduHomeworkService.deleteEduHomeworkByIds(ids));
    }
}
