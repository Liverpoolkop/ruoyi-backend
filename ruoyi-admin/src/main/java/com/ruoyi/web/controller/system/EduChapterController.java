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
import com.ruoyi.system.domain.EduChapter;
import com.ruoyi.system.service.IEduChapterService;
import com.ruoyi.common.utils.poi.ExcelUtil;

/**
 * 课程章节Controller
 */
@RestController
@RequestMapping("/system/chapter")
public class EduChapterController extends BaseController
{
    @Autowired
    private IEduChapterService eduChapterService;

    /**
     * 查询课程章节列表（树形）
     */
    // @PreAuthorize("@ss.hasPermi('system:course:list')")
    @GetMapping("/tree/{courseId}")
    public AjaxResult tree(@PathVariable("courseId") Long courseId)
    {
        return AjaxResult.success(eduChapterService.buildChapterTree(courseId));
    }

    /**
     * 查询课程章节列表（平铺，用于管理）
     */
    @PreAuthorize("@ss.hasPermi('system:course:list')")
    @GetMapping("/list")
    public AjaxResult list(EduChapter eduChapter)
    {
        List<EduChapter> list = eduChapterService.selectEduChapterList(eduChapter);
        return AjaxResult.success(list);
    }

    /**
     * 获取课程章节详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:course:query')")
    @GetMapping(value = "/{chapterId}")
    public AjaxResult getInfo(@PathVariable("chapterId") Long chapterId)
    {
        return AjaxResult.success(eduChapterService.selectEduChapterByChapterId(chapterId));
    }

    /**
     * 新增课程章节
     */
    @PreAuthorize("@ss.hasPermi('system:course:add')")
    @Log(title = "课程章节", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EduChapter eduChapter)
    {
        return toAjax(eduChapterService.insertEduChapter(eduChapter));
    }

    /**
     * 修改课程章节
     */
    @PreAuthorize("@ss.hasPermi('system:course:edit')")
    @Log(title = "课程章节", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EduChapter eduChapter)
    {
        return toAjax(eduChapterService.updateEduChapter(eduChapter));
    }

    /**
     * 删除课程章节
     */
    @PreAuthorize("@ss.hasPermi('system:course:remove')")
    @Log(title = "课程章节", businessType = BusinessType.DELETE)
	@DeleteMapping("/{chapterIds}")
    public AjaxResult remove(@PathVariable Long[] chapterIds)
    {
        return toAjax(eduChapterService.deleteEduChapterByChapterIds(chapterIds));
    }
}
