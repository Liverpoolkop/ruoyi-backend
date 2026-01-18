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
import com.ruoyi.system.domain.EduQuestionBank;
import com.ruoyi.system.service.IEduQuestionBankService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import com.ruoyi.common.utils.SecurityUtils;

/**
 * Question Bank Controller
 */
@RestController
@RequestMapping("/system/bank")
public class EduQuestionBankController extends BaseController {
    @Autowired
    private IEduQuestionBankService eduQuestionBankService;

    /**
     * Query Question Bank List
     */
    @PreAuthorize("@ss.hasPermi('system:bank:list') or @ss.hasRole('teacher')")
    @GetMapping("/list")
    public TableDataInfo list(EduQuestionBank eduQuestionBank) {
        startPage();
        if (!SecurityUtils.isAdmin(getUserId())) {
            eduQuestionBank.setTeacherId(getUserId());
        }
        List<EduQuestionBank> list = eduQuestionBankService.selectEduQuestionBankList(eduQuestionBank);
        return getDataTable(list);
    }

    /**
     * Export Question Bank List
     */
    @PreAuthorize("@ss.hasPermi('system:bank:export') or @ss.hasRole('teacher')")
    @Log(title = "Question Bank", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public AjaxResult export(EduQuestionBank eduQuestionBank) {
        if (!SecurityUtils.isAdmin(getUserId())) {
            eduQuestionBank.setTeacherId(getUserId());
        }
        List<EduQuestionBank> list = eduQuestionBankService.selectEduQuestionBankList(eduQuestionBank);
        ExcelUtil<EduQuestionBank> util = new ExcelUtil<EduQuestionBank>(EduQuestionBank.class);
        return util.exportExcel(list, "Question_Bank_Data");
    }

    /**
     * Get Question Bank Detailed Info
     */
    @PreAuthorize("@ss.hasPermi('system:bank:query') or @ss.hasRole('teacher')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(eduQuestionBankService.selectEduQuestionBankById(id));
    }

    /**
     * Add Question Bank
     */
    @PreAuthorize("@ss.hasPermi('system:bank:add') or @ss.hasRole('teacher')")
    @Log(title = "Question Bank", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EduQuestionBank eduQuestionBank) {
        eduQuestionBank.setCreateBy(getUsername());
        eduQuestionBank.setTeacherId(getUserId());
        return toAjax(eduQuestionBankService.insertEduQuestionBank(eduQuestionBank));
    }

    /**
     * Update Question Bank
     */
    @PreAuthorize("@ss.hasPermi('system:bank:edit') or @ss.hasRole('teacher')")
    @Log(title = "Question Bank", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EduQuestionBank eduQuestionBank) {
        eduQuestionBank.setUpdateBy(getUsername());
        return toAjax(eduQuestionBankService.updateEduQuestionBank(eduQuestionBank));
    }

    /**
     * Delete Question Bank
     */
    @PreAuthorize("@ss.hasPermi('system:bank:remove') or @ss.hasRole('teacher')")
    @Log(title = "Question Bank", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(eduQuestionBankService.deleteEduQuestionBankByIds(ids));
    }
}
