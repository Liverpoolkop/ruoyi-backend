package com.ruoyi.web.controller.edu;

import java.util.List;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.edu.domain.EduCourse;
import com.ruoyi.edu.mapper.EduCourseMapper;
import org.springframework.security.access.prepost.PreAuthorize;

@RestController
@RequestMapping("/edu/course")
public class EduCourseController extends BaseController {
    @Autowired
    private EduCourseMapper courseMapper;

    @PreAuthorize("hasAnyRole('TEACHER','ADMIN')")
    @PostMapping
    public AjaxResult create(@Validated @RequestBody EduCourse c) {
        return toAjax(courseMapper.insert(c));
    }

    @GetMapping
    public TableDataInfo list(EduCourse query) {
        startPage();
        List<EduCourse> list = courseMapper.selectList(query);
        return getDataTable(list);
    }

    @GetMapping("/{id}")
    public AjaxResult detail(@PathVariable Long id) {
        return AjaxResult.success(courseMapper.selectById(id));
    }

    @PreAuthorize("hasAnyRole('TEACHER','ADMIN')")
    @PutMapping
    public AjaxResult update(@Validated @RequestBody EduCourse c) {
        return toAjax(courseMapper.update(c));
    }

    @PreAuthorize("hasAnyRole('TEACHER','ADMIN')")
    @DeleteMapping("/{id}")
    public AjaxResult delete(@PathVariable Long id) {
        return toAjax(courseMapper.deleteById(id));
    }
}
