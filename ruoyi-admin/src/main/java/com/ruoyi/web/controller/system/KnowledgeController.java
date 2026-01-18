package com.ruoyi.web.controller.system;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.Knowledge;
import com.ruoyi.system.service.IKnowledgeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RestController
@RequestMapping("/edu/knowledge")
public class KnowledgeController extends BaseController {

    @Autowired
    private IKnowledgeService knowledgeService;

    /**
     * 查询知识点列表
     */
    @PreAuthorize("@ss.hasPermi('edu:knowledge:list')")
    @GetMapping("/list")
    public TableDataInfo list(Knowledge knowledge) {
        startPage();
        List<Knowledge> list = knowledgeService.selectKnowledgeList(knowledge);
        return getDataTable(list);
    }

    /**
     * 导出知识点列表
     */
    @PreAuthorize("@ss.hasPermi('edu:knowledge:export')")
    @Log(title = "知识点", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Knowledge knowledge) {
        List<Knowledge> list = knowledgeService.selectKnowledgeList(knowledge);
        ExcelUtil<Knowledge> util = new ExcelUtil<>(Knowledge.class);
        util.exportExcel(response, list, "知识点数据");
    }

    /**
     * 获取知识点详细信息
     */
    @PreAuthorize("@ss.hasPermi('edu:knowledge:query')")
    @GetMapping(value = "/{knowledgeId}")
    public AjaxResult getInfo(@PathVariable("knowledgeId") Long knowledgeId) {
        return success(knowledgeService.selectKnowledgeById(knowledgeId));
    }

    /**
     * 新增知识点
     */
    @PreAuthorize("@ss.hasPermi('edu:knowledge:add')")
    @Log(title = "知识点", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Knowledge knowledge) {
        return toAjax(knowledgeService.insertKnowledge(knowledge));
    }

    /**
     * 修改知识点
     */
    @PreAuthorize("@ss.hasPermi('edu:knowledge:edit')")
    @Log(title = "知识点", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Knowledge knowledge) {
        return toAjax(knowledgeService.updateKnowledge(knowledge));
    }

    /**
     * 删除知识点
     */
    @PreAuthorize("@ss.hasPermi('edu:knowledge:remove')")
    @Log(title = "知识点", businessType = BusinessType.DELETE)
    @DeleteMapping("/{knowledgeIds}")
    public AjaxResult remove(@PathVariable Long[] knowledgeIds) {
        return toAjax(knowledgeService.deleteKnowledgeByIds(knowledgeIds));
    }

    /**
     * 搜索知识点
     */
    @GetMapping("/search")
    public AjaxResult search(@RequestParam String keyword) {
        List<Knowledge> list = knowledgeService.searchKnowledge(keyword);
        return success(list);
    }

    /**
     * 获取知识图谱数据
     */
//    @GetMapping("/knowledgeGraphByHomeworkId")
//    public AjaxResult getKnowledgeGraphByHomeworkId(@RequestParam Long homeworkId) {
//        return success(knowledgeService.getKnowledgeGraphDataByHomeworkId(homeworkId));
//    }
//    @GetMapping("/knowledgeGraphByQuestionId")
//    public AjaxResult getKnowledgeGraphByQuestionId(@RequestParam Long questionId) {
//        return success(knowledgeService.getKnowledgeGraphDataByQuestionId(questionId));
//    }
    @GetMapping("/knowledgeGraphByCourseId")
    public AjaxResult getKnowledgeGraphByCourseId(@RequestParam Long courseId) {
        return success(knowledgeService.getKnowledgeGraphDataByCourseId(courseId));
    }
}