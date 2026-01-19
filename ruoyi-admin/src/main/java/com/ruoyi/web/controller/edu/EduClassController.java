package com.ruoyi.web.controller.edu;

import java.util.List;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.edu.service.IEduClassService;
import com.ruoyi.edu.domain.EduClass;
import com.ruoyi.edu.domain.EduClassStudent;
import com.ruoyi.edu.mapper.EduClassStudentMapper;

import org.springframework.security.access.prepost.PreAuthorize;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.utils.uuid.IdUtils;

import com.ruoyi.edu.domain.vo.EduClassStudentImportVo;
import com.ruoyi.common.utils.poi.ExcelUtil;
import org.springframework.web.multipart.MultipartFile;
import com.ruoyi.system.service.ISysUserService;

@RestController
@RequestMapping("/edu/class")
public class EduClassController extends BaseController {
    @Autowired
    private IEduClassService classService;
    @Autowired
    private EduClassStudentMapper classStudentMapper;
    @Autowired
    private RedisCache redisCache;
    @Autowired
    private ISysUserService userService;

    @PostMapping
    public AjaxResult create(@Validated @RequestBody EduClass c) {
        c.setCreateBy(getUsername());
        if (c.getTeacherId() == null) {
            c.setTeacherId(SecurityUtils.getUserId());
        }
        if (c.getStatus() == null || c.getStatus().isEmpty()) {
            c.setStatus("0");
        }
        c.setCreateTime(DateUtils.getNowDate());
        return toAjax(classService.create(c));
    }

    @PostMapping("/{id}/invite")
    public AjaxResult invite(@PathVariable Long id, @RequestParam(defaultValue = "24") Integer hours) {
        String code = IdUtils.fastSimpleUUID().substring(0, 8);
        String key = "edu:invite:class:" + id;
        String codeKey = "edu:invite:code:" + code;
        int h = (hours == null || hours <= 0) ? 24 : hours;
        redisCache.setCacheObject(key, code, h, java.util.concurrent.TimeUnit.HOURS);
        redisCache.setCacheObject(codeKey, "class:" + id, h, java.util.concurrent.TimeUnit.HOURS);
        java.util.Map<String, Object> data = new java.util.HashMap<>();
        data.put("inviteCode", code);
        data.put("expireHours", h);
        return AjaxResult.success(data);
    }

    @PostMapping("/{id}/join")
    public AjaxResult join(@PathVariable Long id) {
        Long userId = SecurityUtils.getUserId();
        List<EduClassStudent> exists = classStudentMapper.selectByClassId(id);
        boolean has = exists.stream().anyMatch(s -> s.getStudentId().equals(userId));
        if (has) return AjaxResult.success();
        EduClassStudent rel = new EduClassStudent();
        rel.setClassId(id);
        rel.setStudentId(userId);
        rel.setCreateBy(getUsername());
        return toAjax(classStudentMapper.insert(rel));
    }

   
    @PostMapping("/join/by-code")
    public AjaxResult joinByCode(@RequestParam String code) {
        String codeKey = "edu:invite:code:" + code;
        String val = redisCache.getCacheObject(codeKey);
        if (val == null) return AjaxResult.error("邀请码无效或已过期");
        if (val.startsWith("class:")) {
            Long id = Long.valueOf(val.substring(6));
            return join(id);
        }
        return AjaxResult.error("类型错误");
    }

    @GetMapping("/list")
    public TableDataInfo list(EduClass query) {
        startPage();
        List<EduClass> list = classService.selectList(query);
        return getDataTable(list);
    }

    @GetMapping("/joined")
    public AjaxResult joined() {
        Long userId = SecurityUtils.getUserId();
        return AjaxResult.success(classStudentMapper.selectJoinedClassIds(userId));
    }

    @GetMapping("/mine")
    public AjaxResult mine() {
        Long userId = SecurityUtils.getUserId();
        // Managed by me (as teacher)
        EduClass query = new EduClass();
        query.setTeacherId(userId);
        List<EduClass> managed = classService.selectList(query);
        
        // Joined by me (as student)
        List<EduClass> joined = classService.selectJoinedClasses(userId);
        
        AjaxResult r = AjaxResult.success();
        r.put("managed", managed);
        r.put("joined", joined);
        return r;
    }

    @GetMapping(value = "/{id}")
    public AjaxResult detail(@PathVariable Long id) {
        EduClass c = classService.selectById(id);
        if (c == null) {
            return AjaxResult.error("班级不存在");
        }
        AjaxResult r = AjaxResult.success(c);
        
        // Check if user is teacher/admin or a joined student
        Long userId = SecurityUtils.getUserId();
        boolean isTeacher = userId.equals(c.getTeacherId()) || SecurityUtils.isAdmin(userId);
        
        if (isTeacher) {
            // Teacher sees all students
            r.put("students", classStudentMapper.selectByClassId(id));
        } else {
            // Student: verify membership
            List<EduClassStudent> students = classStudentMapper.selectByClassId(id);
            boolean isMember = students.stream().anyMatch(s -> s.getStudentId().equals(userId));
            if (!isMember) {
                 // return AjaxResult.error("无权访问该班级"); // Or just return basic info without student list
                 // Let's allow viewing basic info, but hide student list or return empty list
                 r.put("students", java.util.Collections.emptyList());
            } else {
                 // Student sees themselves or classmates? Usually classmates are visible.
                 r.put("students", students);
            }
        }
        return r;
    }

    @PutMapping
    public AjaxResult update(@Validated @RequestBody EduClass c) {
        c.setUpdateBy(getUsername());
        return toAjax(classService.update(c));
    }


    @DeleteMapping("/{id}")
    public AjaxResult delete(@PathVariable Long id) {
        return toAjax(classService.delete(id));
    }


    @PostMapping("/{id}/students")
    public AjaxResult addStudent(@PathVariable Long id, @RequestBody EduClassStudent rel) {
        rel.setClassId(id);
        rel.setCreateBy(getUsername());
        return toAjax(classStudentMapper.insert(rel));
    }


    @DeleteMapping("/{id}/students/{studentId}")
    public AjaxResult removeStudent(@PathVariable Long id, @PathVariable Long studentId) {
        return toAjax(classStudentMapper.delete(id, studentId));
    }

    @PostMapping("/{id}/students/batch")
    public AjaxResult addStudentBatch(@PathVariable Long id, @RequestBody java.util.List<Long> studentIds) {
        java.util.List<EduClassStudent> exists = classStudentMapper.selectByClassId(id);
        java.util.Set<Long> set = new java.util.HashSet<>();
        for (EduClassStudent e : exists) set.add(e.getStudentId());
        int count = 0;
        for (Long sid : studentIds) {
            if (set.contains(sid)) continue;
            EduClassStudent rel = new EduClassStudent();
            rel.setClassId(id);
            rel.setStudentId(sid);
            rel.setCreateBy(getUsername());
            count += classStudentMapper.insert(rel);
        }
        return AjaxResult.success(count);
    }

    @PostMapping("/{id}/students/import")
    public AjaxResult importData(MultipartFile file, @PathVariable Long id) throws Exception {
        ExcelUtil<EduClassStudentImportVo> util = new ExcelUtil<>(EduClassStudentImportVo.class);
        List<EduClassStudentImportVo> list = util.importExcel(file.getInputStream());
        
        java.util.List<EduClassStudent> exists = classStudentMapper.selectByClassId(id);
        java.util.Set<Long> existingIds = new java.util.HashSet<>();
        for (EduClassStudent e : exists) existingIds.add(e.getStudentId());

        int successNum = 0;
        int failureNum = 0;
        StringBuilder failureMsg = new StringBuilder();

        for (EduClassStudentImportVo vo : list) {
            String studentNo = vo.getStudentNo();
            if (studentNo == null || studentNo.isEmpty()) {
                failureNum++;
                failureMsg.append("<br/>学号为空");
                continue;
            }
            
            com.ruoyi.common.core.domain.entity.SysUser user = userService.selectUserByUserName(studentNo);
            
            // Try to find by User ID if username lookup failed (assuming studentNo could be an ID)
            if (user == null) {
                try {
                    // Use Mapper directly or add service method if needed. Here we use a new mapper method for flexibility
                    // Or reuse existing selectUserById if input is Long.
                    // Since studentNo is String in VO, we parse it.
                    Long uid = Long.parseLong(studentNo);
                    user = userService.selectUserById(uid);
                } catch (NumberFormatException e) {
                    // Ignore, it's not a valid ID format
                }
            }

            if (user == null) {
                failureNum++;
                failureMsg.append("<br/>学号 " + studentNo + " 不存在");
                continue;
            }
            
            if (existingIds.contains(user.getUserId())) {
                failureNum++;
                failureMsg.append("<br/>学号 " + studentNo + " 已存在");
                continue;
            }
            
            EduClassStudent rel = new EduClassStudent();
            rel.setClassId(id);
            rel.setStudentId(user.getUserId());
            rel.setCreateBy(getUsername());
            classStudentMapper.insert(rel);
            existingIds.add(user.getUserId());
            successNum++;
        }
        
        if (failureNum > 0) {
            failureMsg.insert(0, "很抱歉，导入出现错误！共 " + failureNum + " 条数据格式不正确，错误如下：");
            return AjaxResult.error(failureMsg.toString());
        } else {
            return AjaxResult.success("恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
    }

    @PostMapping("/students/importTemplate")
    public void importTemplate(javax.servlet.http.HttpServletResponse response) {
        ExcelUtil<EduClassStudentImportVo> util = new ExcelUtil<>(EduClassStudentImportVo.class);
        util.importTemplateExcel(response, "学生名单");
    }
}
