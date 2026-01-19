package com.ruoyi.web.controller.edu;

import java.util.List;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;

import org.springframework.security.access.prepost.PreAuthorize;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.utils.uuid.IdUtils;
import com.ruoyi.edu.domain.EduCourseStudent;
import com.ruoyi.edu.mapper.EduCourseStudentMapper;
import com.ruoyi.system.service.ISysUserService;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.service.ISysNoticeService;
import com.ruoyi.system.domain.SysNotice;

import com.ruoyi.edu.domain.EduClassStudent;
import com.ruoyi.edu.domain.EduCourse;
import com.ruoyi.edu.mapper.EduClassStudentMapper;
import com.ruoyi.edu.mapper.EduCourseMapper;

import org.springframework.web.multipart.MultipartFile;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.utils.StringUtils;

@RestController
@RequestMapping("/edu/course")
public class EduCourseController extends BaseController {
    @Autowired
    private EduCourseMapper courseMapper;
    @Autowired
    private EduCourseStudentMapper courseStudentMapper;
    @Autowired
    private EduClassStudentMapper classStudentMapper;
    @Autowired
    private RedisCache redisCache;
    @Autowired
    private ISysUserService userService;
    @Autowired
    private ISysNoticeService noticeService;

    @PostMapping
    public AjaxResult create(@Validated @RequestBody EduCourse c) {
        if (c.getTeacherIds() == null || c.getTeacherIds().isEmpty()) {
            c.setTeacherIds(java.util.Collections.singletonList(SecurityUtils.getUserId()));
        }
        if (c.getStatus() == null || c.getStatus().isEmpty()) {
            c.setStatus("0");
        }
        c.setCreateTime(DateUtils.getNowDate());
        int rows = courseMapper.insert(c);
        if (rows > 0 && c.getTeacherIds() != null && !c.getTeacherIds().isEmpty()) {
            courseMapper.batchInsertCourseTeacher(c.getCourseId(), c.getTeacherIds());
        }
        return toAjax(rows);
    }

    @GetMapping("/list")
    public TableDataInfo list(EduCourse query) {
        startPage();
        List<EduCourse> list = courseMapper.selectList(query);
        return getDataTable(list);
    }

    // @PreAuthorize("@ss.hasPermi('system:course:query')")
    @GetMapping("/{id}")
    public AjaxResult getInfo(@PathVariable Long id) {
        EduCourse c = courseMapper.selectById(id);
        List<SysUser> teachers = new java.util.ArrayList<>();
        if (c != null) {
            List<Long> teacherIds = courseMapper.selectTeacherIdsByCourseId(id);
            c.setTeacherIds(teacherIds);
            if (teacherIds != null && !teacherIds.isEmpty()) {
                for (Long tid : teacherIds) {
                    SysUser u = userService.selectUserById(tid);
                    if (u != null) teachers.add(u);
                }
            }
        }
        AjaxResult r = AjaxResult.success(c);
        r.put("teachers", teachers);
        r.put("students", courseStudentMapper.selectByCourseId(id));
        return r;
    }

    @GetMapping("/joined")
    public AjaxResult joined() {
        Long userId = SecurityUtils.getUserId();
        return AjaxResult.success(courseStudentMapper.selectJoinedCourseIds(userId));
    }

    @GetMapping("/mine")
    public AjaxResult mine() {
        Long userId = SecurityUtils.getUserId();
        // Managed by me (as teacher)
        List<EduCourse> managed = courseMapper.selectManagedCourses(userId);
        
        // Joined by me (as student)
        List<EduCourse> joined = courseMapper.selectJoinedCourses(userId);
        
        AjaxResult r = AjaxResult.success();
        r.put("managed", managed);
        r.put("joined", joined);
        return r;
    }

    @GetMapping("/my")
    public TableDataInfo myCourses() {
        startPage();
        Long userId = SecurityUtils.getUserId();
        List<EduCourse> list = courseMapper.selectJoinedCourses(userId);
        return getDataTable(list);
    }

    @PutMapping
    public AjaxResult update(@Validated @RequestBody EduCourse c) {
        c.setUpdateTime(DateUtils.getNowDate());
        int rows = courseMapper.update(c);
        if (rows > 0) {
            courseMapper.deleteCourseTeacherByCourseId(c.getCourseId());
            if (c.getTeacherIds() != null && !c.getTeacherIds().isEmpty()) {
                courseMapper.batchInsertCourseTeacher(c.getCourseId(), c.getTeacherIds());
            }
        }
        return toAjax(rows);
    }

    @DeleteMapping("/{id}")
    public AjaxResult delete(@PathVariable Long id) {
        courseMapper.deleteCourseTeacherByCourseId(id);
        return toAjax(courseMapper.deleteById(id));
    }

    // @PreAuthorize("@ss.hasPermi('edu:course:invite')")
    @PostMapping("/{id}/invite")
    public AjaxResult invite(@PathVariable Long id, @RequestParam(defaultValue = "24") Integer hours) {
        Long userId = SecurityUtils.getUserId();
        List<Long> teacherIds = courseMapper.selectTeacherIdsByCourseId(id);
        if (!teacherIds.contains(userId) && !SecurityUtils.isAdmin(userId) && !SecurityUtils.hasRole("admin")) {
             return AjaxResult.error("只有本课程讲师可以生成邀请码");
        }
        
        String code = IdUtils.fastSimpleUUID().substring(0, 8);
        String key = "edu:invite:course:" + id;
        String codeKey = "edu:invite:code:" + code;
        int h = (hours == null || hours <= 0) ? 24 : hours;
        redisCache.setCacheObject(key, code, h, java.util.concurrent.TimeUnit.HOURS);
        redisCache.setCacheObject(codeKey, "course:" + id, h, java.util.concurrent.TimeUnit.HOURS);
        java.util.Map<String, Object> data = new java.util.HashMap<>();
        data.put("inviteCode", code);
        data.put("expireHours", h);
        return AjaxResult.success(data);
    }

    // @PreAuthorize("@ss.hasPermi('system:course:join')")
    @PostMapping("/{id}/join")
    public AjaxResult join(@PathVariable Long id) {
        Long userId = SecurityUtils.getUserId();
        java.util.List<EduCourseStudent> exists = courseStudentMapper.selectByCourseId(id);
        boolean has = exists.stream().anyMatch(s -> s.getStudentId().equals(userId));
        if (has) return AjaxResult.error("您已加入该课程，无需重复加入");
        EduCourseStudent rel = new EduCourseStudent();
        rel.setCourseId(id);
        rel.setStudentId(userId);
        rel.setCreateBy(SecurityUtils.getUsername());
        rel.setCreateTime(DateUtils.getNowDate());
        return toAjax(courseStudentMapper.insert(rel));
    }

    @PreAuthorize("isAuthenticated()")
    @PostMapping("/join/by-code")
    public AjaxResult joinByCode(@RequestParam String code) {
        String codeKey = "edu:invite:code:" + code;
        String val = redisCache.getCacheObject(codeKey);
        if (val == null) return AjaxResult.error("邀请码无效或已过期");
        if (val.startsWith("course:")) {
            Long id = Long.valueOf(val.substring(7));
            return join(id);
        }
        return AjaxResult.error("类型错误");
    }

    @PreAuthorize("isAuthenticated()")
    @PostMapping("/{id}/quit")
    public AjaxResult quit(@PathVariable Long id) {
        Long userId = SecurityUtils.getUserId();
        return toAjax(courseStudentMapper.delete(id, userId));
    }

    @GetMapping("/{id}/notices")
    public AjaxResult getNotices(@PathVariable Long id) {
        SysNotice notice = new SysNotice();
        notice.setRemark("course:" + id);
        return AjaxResult.success(noticeService.selectNoticeList(notice));
    }

    @PostMapping("/{id}/notice")
    public AjaxResult addNotice(@PathVariable Long id, @RequestBody SysNotice notice) {
        Long userId = SecurityUtils.getUserId();
        List<Long> teacherIds = courseMapper.selectTeacherIdsByCourseId(id);
        if (!teacherIds.contains(userId) && !SecurityUtils.isAdmin(userId) && !SecurityUtils.hasRole("admin")) {
             return AjaxResult.error("只有讲师可以发布公告");
        }
        notice.setRemark("course:" + id);
        notice.setNoticeType("2");
        notice.setStatus("0");
        notice.setCreateBy(SecurityUtils.getUsername());
        return toAjax(noticeService.insertNotice(notice));
    }

    @DeleteMapping("/{id}/notice/{noticeId}")
    public AjaxResult deleteNotice(@PathVariable Long id, @PathVariable Long noticeId) {
        Long userId = SecurityUtils.getUserId();
        List<Long> teacherIds = courseMapper.selectTeacherIdsByCourseId(id);
        if (!teacherIds.contains(userId) && !SecurityUtils.isAdmin(userId) && !SecurityUtils.hasRole("admin")) {
             return AjaxResult.error("只有讲师可以删除公告");
        }
        SysNotice existing = noticeService.selectNoticeById(noticeId);
        if (existing == null || !("course:" + id).equals(existing.getRemark())) {
             return AjaxResult.error("公告不存在或不属于该课程");
        }
        return toAjax(noticeService.deleteNoticeById(noticeId));
    }

    /**
     * Get Course Students
     */
    @GetMapping("/{id}/students")
    public TableDataInfo getStudents(@PathVariable Long id) {
        Long userId = SecurityUtils.getUserId();
        List<Long> teacherIds = courseMapper.selectTeacherIdsByCourseId(id);
        if (!teacherIds.contains(userId) && !SecurityUtils.isAdmin(userId) && !SecurityUtils.hasRole("admin")) {
             throw new com.ruoyi.common.exception.ServiceException("只有讲师可以查看学生");
        }

        startPage();
        List<SysUser> list = courseStudentMapper.selectStudentsByCourseId(id);
        return getDataTable(list);
    }

    /**
     * Add Student to Course (Batch)
     */
    @PostMapping("/{id}/students")
    public AjaxResult addStudents(@PathVariable Long id, @RequestBody List<Long> studentIds) {
        if (studentIds == null || studentIds.isEmpty()) return AjaxResult.success();
        
        Long userId = SecurityUtils.getUserId();
        List<Long> teacherIds = courseMapper.selectTeacherIdsByCourseId(id);
        boolean isTeacher = teacherIds.stream().anyMatch(tid -> tid != null && tid.equals(userId));
        if (!isTeacher && !SecurityUtils.isAdmin(userId) && !SecurityUtils.hasRole("admin")) {
             return AjaxResult.error("只有讲师可以添加学生 (uid=" + userId + ", cid=" + id + ", teachers=" + teacherIds + ")");
        }

        List<EduCourseStudent> existing = courseStudentMapper.selectByCourseId(id);
        List<Long> existingIds = existing.stream().map(EduCourseStudent::getStudentId).collect(java.util.stream.Collectors.toList());
        
        List<EduCourseStudent> toAdd = new java.util.ArrayList<>();
        for (Long sid : studentIds) {
            if (!existingIds.contains(sid)) {
                EduCourseStudent s = new EduCourseStudent();
                s.setCourseId(id);
                s.setStudentId(sid);
                s.setCreateBy(SecurityUtils.getUsername());
                s.setCreateTime(DateUtils.getNowDate());
                toAdd.add(s);
            }
        }
        
        if (!toAdd.isEmpty()) {
            courseStudentMapper.batchInsert(toAdd);
        }
        return AjaxResult.success();
    }

    /**
     * Remove Student from Course
     */
    @DeleteMapping("/{id}/students/{studentId}")
    public AjaxResult removeStudent(@PathVariable Long id, @PathVariable Long studentId) {
        Long userId = SecurityUtils.getUserId();
        List<Long> teacherIds = courseMapper.selectTeacherIdsByCourseId(id);
        if (!teacherIds.contains(userId) && !SecurityUtils.isAdmin(userId) && !SecurityUtils.hasRole("admin")) {
             return AjaxResult.error("只有讲师可以移除学生");
        }
        return toAjax(courseStudentMapper.delete(id, studentId));
    }

    /**
     * Add Students from Class
     */
    @PostMapping("/{id}/students/class/{classId}")
    public AjaxResult addStudentsFromClass(@PathVariable Long id, @PathVariable Long classId) {
        Long userId = SecurityUtils.getUserId();
        List<Long> teacherIds = courseMapper.selectTeacherIdsByCourseId(id);
        boolean isTeacher = teacherIds.stream().anyMatch(tid -> tid != null && tid.equals(userId));
        if (!isTeacher && !SecurityUtils.isAdmin(userId) && !SecurityUtils.hasRole("admin")) {
             return AjaxResult.error("只有讲师可以添加学生 (uid=" + userId + ", cid=" + id + ", teachers=" + teacherIds + ")");
        }

        List<EduClassStudent> classStudents = classStudentMapper.selectByClassId(classId);
        if (classStudents == null || classStudents.isEmpty()) return AjaxResult.success();

        List<EduCourseStudent> existing = courseStudentMapper.selectByCourseId(id);
        List<Long> existingIds = existing.stream().map(EduCourseStudent::getStudentId).collect(java.util.stream.Collectors.toList());

        List<EduCourseStudent> toAdd = new java.util.ArrayList<>();
        for (EduClassStudent cs : classStudents) {
            if (!existingIds.contains(cs.getStudentId())) {
                EduCourseStudent s = new EduCourseStudent();
                s.setCourseId(id);
                s.setStudentId(cs.getStudentId());
                s.setCreateBy(SecurityUtils.getUsername());
                s.setCreateTime(DateUtils.getNowDate());
                toAdd.add(s);
            }
        }

        if (!toAdd.isEmpty()) {
            courseStudentMapper.batchInsert(toAdd);
        }
        return AjaxResult.success("成功添加 " + toAdd.size() + " 名学生");
    }

    /**
     * Import Students from Excel
     */
    @PostMapping("/{id}/students/import")
    public AjaxResult importStudents(@PathVariable Long id, MultipartFile file) throws Exception {
        Long userId = SecurityUtils.getUserId();
        List<Long> teacherIds = courseMapper.selectTeacherIdsByCourseId(id);
        if (!teacherIds.contains(userId) && !SecurityUtils.isAdmin(userId) && !SecurityUtils.hasRole("admin")) {
             return AjaxResult.error("只有讲师可以导入学生");
        }

        ExcelUtil<SysUser> util = new ExcelUtil<SysUser>(SysUser.class);
        List<SysUser> userList = util.importExcel(file.getInputStream());
        
        if (userList == null || userList.isEmpty()) {
            return AjaxResult.error("导入数据为空");
        }

        List<EduCourseStudent> existing = courseStudentMapper.selectByCourseId(id);
        List<Long> existingIds = existing.stream().map(EduCourseStudent::getStudentId).collect(java.util.stream.Collectors.toList());
        
        List<EduCourseStudent> toAdd = new java.util.ArrayList<>();
        int successCount = 0;
        
        for (SysUser userVo : userList) {
            SysUser user = null;
            // Match by User ID first, then User Name
            if (userVo.getUserId() != null) {
                user = userService.selectUserById(userVo.getUserId());
            } else if (StringUtils.isNotEmpty(userVo.getUserName())) {
                user = userService.selectUserByUserName(userVo.getUserName());
            }
            
            if (user != null && !existingIds.contains(user.getUserId())) {
                EduCourseStudent s = new EduCourseStudent();
                s.setCourseId(id);
                s.setStudentId(user.getUserId());
                s.setCreateBy(SecurityUtils.getUsername());
                s.setCreateTime(DateUtils.getNowDate());
                toAdd.add(s);
                existingIds.add(user.getUserId()); // Prevent duplicates within the file
                successCount++;
            }
        }
        
        if (!toAdd.isEmpty()) {
            courseStudentMapper.batchInsert(toAdd);
        }
        return AjaxResult.success("导入成功，新增 " + successCount + " 名学生");
    }
}
