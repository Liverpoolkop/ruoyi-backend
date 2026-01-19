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
import com.ruoyi.edu.domain.EduExam;
import com.ruoyi.edu.service.IEduExamService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 测验Controller
 * 
 * @author ruoyi
 * @date 2024-05-20
 */
@RestController
@RequestMapping("/system/exam")
public class EduExamController extends BaseController
{
    @Autowired
    private IEduExamService eduExamService;

    /**
     * 查询测验列表
     */
    @PreAuthorize("@ss.hasPermi('edu:exam:list')")
    @GetMapping("/list")
    public TableDataInfo list(EduExam eduExam)
    {
        startPage();
        List<EduExam> list = eduExamService.selectEduExamList(eduExam);
        return getDataTable(list);
    }

    /**
     * 导出测验列表
     */
    @PreAuthorize("@ss.hasPermi('edu:exam:export')")
    @Log(title = "测验", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, EduExam eduExam)
    {
        List<EduExam> list = eduExamService.selectEduExamList(eduExam);
        ExcelUtil<EduExam> util = new ExcelUtil<EduExam>(EduExam.class);
        util.exportExcel(response, list, "测验数据");
    }

    /**
     * 获取测验详细信息
     */
    @PreAuthorize("@ss.hasPermi('edu:exam:query')")
    @GetMapping(value = "/{examId}")
    public AjaxResult getInfo(@PathVariable("examId") Long examId)
    {
        return success(eduExamService.selectEduExamByExamId(examId));
    }

    /**
     * 新增测验
     */
    @PreAuthorize("@ss.hasPermi('edu:exam:add')")
    @Log(title = "测验", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EduExam eduExam)
    {
        return toAjax(eduExamService.insertEduExam(eduExam));
    }

    /**
     * 修改测验
     */
    @PreAuthorize("@ss.hasPermi('edu:exam:edit')")
    @Log(title = "测验", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EduExam eduExam)
    {
        return toAjax(eduExamService.updateEduExam(eduExam));
    }

    /**
     * 删除测验
     */
    @PreAuthorize("@ss.hasPermi('edu:exam:remove')")
    @Log(title = "测验", businessType = BusinessType.DELETE)
	@DeleteMapping(value = "/{examIds}")
    public AjaxResult remove(@PathVariable Long[] examIds)
    {
        return toAjax(eduExamService.deleteEduExamByExamIds(examIds));
    }
}
