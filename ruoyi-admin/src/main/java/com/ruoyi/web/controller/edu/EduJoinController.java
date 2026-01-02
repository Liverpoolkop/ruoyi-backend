package com.ruoyi.web.controller.edu;

import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.core.redis.RedisCache;
import org.springframework.security.access.prepost.PreAuthorize;

import com.ruoyi.edu.domain.EduClassStudent;
import com.ruoyi.edu.domain.EduCourseStudent;
import com.ruoyi.edu.mapper.EduClassStudentMapper;
import com.ruoyi.edu.mapper.EduCourseStudentMapper;

@RestController
@RequestMapping("/edu")
public class EduJoinController extends BaseController {
    @Autowired
    private RedisCache redisCache;
    @Autowired
    private EduClassStudentMapper classStudentMapper;
    @Autowired
    private EduCourseStudentMapper courseStudentMapper;

    @PreAuthorize("@ss.hasRole('student')")
    @PostMapping("/join/by-code")
    public AjaxResult joinByCode(@RequestParam String code) {
        String val = redisCache.getCacheObject("edu:invite:code:" + code);
        if (val == null) return AjaxResult.error("邀请码无效或已过期");
        Long userId = SecurityUtils.getUserId();
        if (val.startsWith("class:")) {
            Long id = Long.valueOf(val.substring(6));
            java.util.List<EduClassStudent> exists = classStudentMapper.selectByClassId(id);
            boolean has = exists.stream().anyMatch(s -> s.getStudentId().equals(userId));
            if (has) return AjaxResult.success();
            EduClassStudent rel = new EduClassStudent();
            rel.setClassId(id);
            rel.setStudentId(userId);
            rel.setCreateTime(DateUtils.getNowDate());
            return toAjax(classStudentMapper.insert(rel));
        } else if (val.startsWith("course:")) {
            Long id = Long.valueOf(val.substring(7));
            java.util.List<EduCourseStudent> exists = courseStudentMapper.selectByCourseId(id);
            boolean has = exists.stream().anyMatch(s -> s.getStudentId().equals(userId));
            if (has) return AjaxResult.success();
            EduCourseStudent rel = new EduCourseStudent();
            rel.setCourseId(id);
            rel.setStudentId(userId);
            rel.setCreateBy(SecurityUtils.getUsername());
            rel.setCreateTime(DateUtils.getNowDate());
            return toAjax(courseStudentMapper.insert(rel));
        }
        return AjaxResult.error("类型错误");
    }
}
