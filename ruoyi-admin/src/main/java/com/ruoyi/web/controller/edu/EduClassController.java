package com.ruoyi.web.controller.edu;

import java.util.List;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.edu.domain.EduClass;
import com.ruoyi.edu.domain.EduClassStudent;
import com.ruoyi.edu.domain.EduClassCourse;
import com.ruoyi.edu.mapper.EduClassStudentMapper;
import com.ruoyi.edu.mapper.EduClassCourseMapper;
import com.ruoyi.edu.service.IEduClassService;
import org.springframework.security.access.prepost.PreAuthorize;

@RestController
@RequestMapping("/edu/class")
public class EduClassController extends BaseController {
    @Autowired
    private IEduClassService classService;
    @Autowired
    private com.ruoyi.edu.mapper.EduClassMapper classMapper;
    @Autowired
    private EduClassStudentMapper classStudentMapper;
    @Autowired
    private EduClassCourseMapper classCourseMapper;

    @PreAuthorize("hasAnyRole('TEACHER','ADMIN')")
    @PostMapping
    public AjaxResult create(@Validated @RequestBody EduClass c) {
        c.setCreateBy(getUsername());
        return toAjax(classService.create(c));
    }

    @GetMapping
    public TableDataInfo list(EduClass query) {
        startPage();
        List<EduClass> list = classService.selectList(query);
        return getDataTable(list);
    }

    @GetMapping("/{id}")
    public AjaxResult detail(@PathVariable Long id) {
        AjaxResult r = AjaxResult.success(classService.selectById(id));
        r.put("students", classStudentMapper.selectByClassId(id));
        r.put("courses", classCourseMapper.selectByClassId(id));
        return r;
    }

    @PreAuthorize("hasAnyRole('TEACHER','ADMIN')")
    @PutMapping
    public AjaxResult update(@Validated @RequestBody EduClass c) {
        c.setUpdateBy(getUsername());
        return toAjax(classService.update(c));
    }

    @PreAuthorize("hasAnyRole('TEACHER','ADMIN')")
    @DeleteMapping("/{id}")
    public AjaxResult delete(@PathVariable Long id) {
        return toAjax(classService.delete(id));
    }

    @PreAuthorize("hasAnyRole('TEACHER','ADMIN')")
    @PostMapping("/{id}/students")
    public AjaxResult addStudent(@PathVariable Long id, @RequestBody EduClassStudent rel) {
        rel.setClassId(id);
        rel.setCreateBy(getUsername());
        return toAjax(classStudentMapper.insert(rel));
    }

    @PreAuthorize("hasAnyRole('TEACHER','ADMIN')")
    @DeleteMapping("/{id}/students/{studentId}")
    public AjaxResult removeStudent(@PathVariable Long id, @PathVariable Long studentId) {
        return toAjax(classStudentMapper.delete(id, studentId));
    }

    @PreAuthorize("hasAnyRole('TEACHER','ADMIN')")
    @PostMapping("/{id}/courses")
    public AjaxResult addCourse(@PathVariable Long id, @RequestBody EduClassCourse rel) {
        rel.setClassId(id);
        return toAjax(classCourseMapper.insert(rel));
    }

    @PreAuthorize("hasAnyRole('TEACHER','ADMIN')")
    @DeleteMapping("/{id}/courses/{courseId}")
    public AjaxResult removeCourse(@PathVariable Long id, @PathVariable Long courseId) {
        return toAjax(classCourseMapper.delete(id, courseId));
    }
}
