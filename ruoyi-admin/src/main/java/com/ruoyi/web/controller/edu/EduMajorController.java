package com.ruoyi.web.controller.edu;

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
import com.ruoyi.edu.domain.EduMajor;
import com.ruoyi.edu.service.IEduMajorService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 专业信息Controller
 * 
 * @author moon
 * @date 2025-12-31
 */
@RestController
@RequestMapping("/edu/major")
public class EduMajorController extends BaseController
{
    @Autowired
    private IEduMajorService eduMajorService;

    /**
     * 查询专业信息列表
     */
    @PreAuthorize("@ss.hasPermi('edu:major:list')")
    @GetMapping("/list")
    public TableDataInfo list(EduMajor eduMajor)
    {
        startPage();
        List<EduMajor> list = eduMajorService.selectEduMajorList(eduMajor);
        return getDataTable(list);
    }

    /**
     * 导出专业信息列表
     */
    @PreAuthorize("@ss.hasPermi('edu:major:export')")
    @Log(title = "专业信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, EduMajor eduMajor)
    {
        List<EduMajor> list = eduMajorService.selectEduMajorList(eduMajor);
        ExcelUtil<EduMajor> util = new ExcelUtil<EduMajor>(EduMajor.class);
        util.exportExcel(response, list, "专业信息数据");
    }

    /**
     * 获取专业信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('edu:major:query')")
    @GetMapping(value = "/{majorId}")
    public AjaxResult getInfo(@PathVariable("majorId") Long majorId)
    {
        return success(eduMajorService.selectEduMajorByMajorId(majorId));
    }

    /**
     * 新增专业信息
     */
    @PreAuthorize("@ss.hasPermi('edu:major:add')")
    @Log(title = "专业信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EduMajor eduMajor)
    {
        return toAjax(eduMajorService.insertEduMajor(eduMajor));
    }

    /**
     * 修改专业信息
     */
    @PreAuthorize("@ss.hasPermi('edu:major:edit')")
    @Log(title = "专业信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EduMajor eduMajor)
    {
        return toAjax(eduMajorService.updateEduMajor(eduMajor));
    }

    /**
     * 删除专业信息
     */
    @PreAuthorize("@ss.hasPermi('edu:major:remove')")
    @Log(title = "专业信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{majorIds}")
    public AjaxResult remove(@PathVariable Long[] majorIds)
    {
        return toAjax(eduMajorService.deleteEduMajorByMajorIds(majorIds));
    }
}
