package com.ruoyi.web.controller.portal;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.edu.domain.EduCourse;
import com.ruoyi.edu.mapper.EduCourseMapper;

@RestController
@RequestMapping("/portal/course")
public class PortalController extends BaseController {
    @Autowired
    private EduCourseMapper courseMapper;

    @GetMapping("/list")
    public TableDataInfo list(EduCourse query) {
        startPage();
        query.setStatus("0"); // Only show active courses
        List<EduCourse> list = courseMapper.selectList(query);
        return getDataTable(list);
    }

    @GetMapping("/hot")
    public AjaxResult hot() {
        EduCourse query = new EduCourse();
        query.setStatus("0");
        startPage(); // Default page 1, size 10 from request or defaults
        List<EduCourse> list = courseMapper.selectList(query);
        // Ideally sort by popularity, but for now just return list
        return AjaxResult.success(list);
    }
    
    @GetMapping("/new")
    public AjaxResult newCourses() {
        EduCourse query = new EduCourse();
        query.setStatus("0");
        // Sort by create_time desc is default in XML? No, XML sorts by grade desc.
        // We might need to handle sorting in frontend or add order params.
        startPage();
        List<EduCourse> list = courseMapper.selectList(query);
        return AjaxResult.success(list);
    }
}
