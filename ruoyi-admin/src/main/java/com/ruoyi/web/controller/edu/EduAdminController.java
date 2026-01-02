package com.ruoyi.web.controller.edu;

import java.util.ArrayList;
import java.util.List;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.Autowired;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.edu.domain.EduClass;
import com.ruoyi.edu.domain.EduClassStudent;
import com.ruoyi.edu.mapper.EduClassMapper;
import com.ruoyi.edu.mapper.EduClassStudentMapper;
import com.ruoyi.system.service.ISysUserService;

@RestController
@RequestMapping("/edu/admin")
public class EduAdminController extends BaseController {
    @Autowired
    private ISysUserService userService;
    @Autowired
    private EduClassMapper classMapper;
    @Autowired
    private EduClassStudentMapper classStudentMapper;

    private Long findStudentRoleId() { return 101L; }

    @PostMapping("/students/seed")
    public AjaxResult seedStudents(@RequestParam(defaultValue = "stu") String prefix,
                                   @RequestParam(defaultValue = "20") int count,
                                   @RequestParam(defaultValue = "1") int startIndex) {
        Long roleId = findStudentRoleId();
        List<Long> createdIds = new ArrayList<>();
        for (int i = 0; i < count; i++) {
            int n = startIndex + i;
            String userName = String.format("%s%02d", prefix, n);
            SysUser u = userService.selectUserByUserName(userName);
            if (u != null) { createdIds.add(u.getUserId()); continue; }
            u = new SysUser();
            u.setUserName(userName);
            u.setNickName(userName);
            u.setPassword(SecurityUtils.encryptPassword(userName));
            u.setStatus("0");
            if (roleId != null) u.setRoleIds(new Long[]{roleId});
            u.setCreateBy("seed");
            userService.insertUser(u);
            createdIds.add(u.getUserId());
        }
        return AjaxResult.success(createdIds);
    }

    @PostMapping("/class/assignByName")
    public AjaxResult assignByName(@RequestParam String className,
                                   @RequestParam(defaultValue = "stu") String prefix,
                                   @RequestParam(defaultValue = "20") int count,
                                   @RequestParam(defaultValue = "1") int startIndex) {
        EduClass q = new EduClass();
        q.setClassName(className);
        List<EduClass> list = classMapper.selectList(q);
        if (list == null || list.isEmpty()) return AjaxResult.error("class not found");
        Long classId = list.get(0).getClassId();
        int added = 0;
        for (int i = 0; i < count; i++) {
            int n = startIndex + i;
            String userName = String.format("%s%02d", prefix, n);
            SysUser u = userService.selectUserByUserName(userName);
            if (u == null) continue;
            EduClassStudent rel = new EduClassStudent();
            rel.setClassId(classId);
            rel.setStudentId(u.getUserId());
            rel.setCreateBy("seed");
            added += classStudentMapper.insert(rel);
        }
        return AjaxResult.success(added);
    }

    @GetMapping("/user/{id}")
    public AjaxResult userBrief(@PathVariable Long id) {
        SysUser u = userService.selectUserById(id);
        if (u == null) return AjaxResult.error("not found");
        java.util.Map<String, Object> m = new java.util.HashMap<>();
        m.put("userId", u.getUserId());
        m.put("userName", u.getUserName());
        m.put("nickName", u.getNickName());
        return AjaxResult.success(m);
    }
}
