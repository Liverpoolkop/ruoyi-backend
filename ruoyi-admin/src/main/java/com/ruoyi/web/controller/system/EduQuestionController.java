package com.ruoyi.web.controller.system;

import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.EduQuestion;
import com.ruoyi.system.service.IEduQuestionService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

import com.ruoyi.common.utils.SecurityUtils;

/**
 * Question Controller
 */
@RestController
@RequestMapping("/system/question")
public class EduQuestionController extends BaseController {
    @Autowired
    private IEduQuestionService eduQuestionService;

    /**
     * Query Question List
     */
    @PreAuthorize("@ss.hasPermi('system:question:list') or @ss.hasRole('teacher')")
    @GetMapping("/list")
    public TableDataInfo list(EduQuestion eduQuestion) {
        startPage();
        if (!SecurityUtils.isAdmin(getUserId())) {
            eduQuestion.setTeacherId(getUserId());
        }
        List<EduQuestion> list = eduQuestionService.selectEduQuestionList(eduQuestion);
        return getDataTable(list);
    }

    /**
     * Export Question List
     */
    @PreAuthorize("@ss.hasPermi('system:question:export') or @ss.hasRole('teacher')")
    @Log(title = "Question", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, EduQuestion eduQuestion) {
        if (!SecurityUtils.isAdmin(getUserId())) {
            eduQuestion.setTeacherId(getUserId());
        }
        List<EduQuestion> list = eduQuestionService.selectEduQuestionList(eduQuestion);
        ExcelUtil<EduQuestion> util = new ExcelUtil<EduQuestion>(EduQuestion.class);
        util.exportExcel(response, list, "Question_Data");
    }

    /**
     * Import Question Data
     */
    @Log(title = "Question", businessType = BusinessType.IMPORT)
    @PreAuthorize("@ss.hasPermi('system:question:import') or @ss.hasRole('teacher')")
    @PostMapping("/importData")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception {
        ExcelUtil<EduQuestion> util = new ExcelUtil<EduQuestion>(EduQuestion.class);
        List<EduQuestion> questionList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        Long teacherId = getUserId();
        for (EduQuestion question : questionList) {
            question.setCreateBy(operName);
            question.setTeacherId(teacherId);
            eduQuestionService.insertEduQuestion(question);
        }
        return AjaxResult.success("Import Successful. Total: " + questionList.size());
    }

    @PostMapping("/importTemplate")
    public void importTemplate(HttpServletResponse response) {
        ExcelUtil<EduQuestion> util = new ExcelUtil<EduQuestion>(EduQuestion.class);
        List<EduQuestion> list = new ArrayList<>();
        
        // Sample 1: Single Choice
        EduQuestion q1 = new EduQuestion();
        q1.setType("1");
        q1.setContent("What is the capital of France?");
        q1.setOptions("[{\"key\":\"A\",\"value\":\"London\"},{\"key\":\"B\",\"value\":\"Paris\"},{\"key\":\"C\",\"value\":\"Berlin\"},{\"key\":\"D\",\"value\":\"Madrid\"}]");
        q1.setAnswer("B");
        q1.setAnalysis("Paris is the capital of France.");
        q1.setTags("Geography,Europe");
        list.add(q1);

        // Sample 2: Multiple Choice
        EduQuestion q2 = new EduQuestion();
        q2.setType("2");
        q2.setContent("Select primary colors.");
        q2.setOptions("[{\"key\":\"A\",\"value\":\"Red\"},{\"key\":\"B\",\"value\":\"Green\"},{\"key\":\"C\",\"value\":\"Blue\"},{\"key\":\"D\",\"value\":\"Yellow\"}]");
        q2.setAnswer("A,C,D"); // Assuming RGB or RYB model context, but for sample just showing comma separation
        q2.setAnalysis("Red, Blue, and Yellow are primary colors in art.");
        q2.setTags("Art,Color");
        list.add(q2);

        // Sample 3: True/False
        EduQuestion q3 = new EduQuestion();
        q3.setType("3");
        q3.setContent("The earth is flat.");
        q3.setOptions(null); // No options needed for T/F usually, or can be implied
        q3.setAnswer("B"); // A=True, B=False
        q3.setAnalysis("The earth is an oblate spheroid.");
        q3.setTags("Science,Astronomy");
        list.add(q3);

        util.exportExcel(response, list, "Question_Template");
    }

    /**
     * Get Question Detailed Info
     */
    @PreAuthorize("@ss.hasPermi('system:question:query') or @ss.hasRole('teacher')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(eduQuestionService.selectEduQuestionById(id));
    }

    /**
     * Add Question
     */
    @PreAuthorize("@ss.hasPermi('system:question:add') or @ss.hasRole('teacher')")
    @Log(title = "Question", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EduQuestion eduQuestion) {
        eduQuestion.setCreateBy(getUsername());
        eduQuestion.setTeacherId(getUserId());
        return toAjax(eduQuestionService.insertEduQuestion(eduQuestion));
    }

    /**
     * Update Question
     */
    @PreAuthorize("@ss.hasPermi('system:question:edit') or @ss.hasRole('teacher')")
    @Log(title = "Question", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EduQuestion eduQuestion) {
        eduQuestion.setUpdateBy(getUsername());
        return toAjax(eduQuestionService.updateEduQuestion(eduQuestion));
    }

    /**
     * Delete Question
     */
    @PreAuthorize("@ss.hasPermi('system:question:remove') or @ss.hasRole('teacher')")
    @Log(title = "Question", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(eduQuestionService.deleteEduQuestionByIds(ids));
    }
}
