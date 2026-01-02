package com.ruoyi.web.controller.edu;

import java.util.List;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.beans.factory.annotation.Autowired;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.edu.domain.EduClassStudent;
import com.ruoyi.edu.mapper.EduClassStudentMapper;

import org.springframework.security.access.prepost.PreAuthorize;

class StudentImportRow {
    private String username;
    private String nickName;
    public String getUsername() { return username; }
    public void setUsername(String u) { this.username = u; }
    public String getNickName() { return nickName; }
    public void setNickName(String n) { this.nickName = n; }
}

@RestController
@RequestMapping("/edu/import")
public class EduImportController {
    @Autowired
    private EduClassStudentMapper classStudentMapper;
    @Autowired
    private com.ruoyi.system.service.ISysUserService userService;

    @PreAuthorize("@ss.hasAnyRoles('admin,teacher')")
    @PostMapping("/class/{id}/students")
    public AjaxResult importStudents(@PathVariable Long id, @RequestParam("file") MultipartFile file) throws Exception {
        ExcelUtil<StudentImportRow> util = new ExcelUtil<>(StudentImportRow.class);
        List<StudentImportRow> rows = util.importExcel(file.getInputStream());
        int count = 0;
        for (StudentImportRow row : rows) {
            if (row.getUsername() == null || row.getUsername().trim().isEmpty()) continue;
            String userName = row.getUsername().trim();
            com.ruoyi.common.core.domain.entity.SysUser u = userService.selectUserByUserName(userName);
            if (u == null) {
                com.ruoyi.common.core.domain.entity.SysUser nu = new com.ruoyi.common.core.domain.entity.SysUser();
                nu.setUserName(userName);
                nu.setNickName(row.getNickName() != null ? row.getNickName() : userName);
                nu.setPassword(com.ruoyi.common.utils.SecurityUtils.encryptPassword(userName));
                nu.setStatus("0");
                nu.setCreateBy("import");
                userService.insertUser(nu);
                u = nu;
            }
            EduClassStudent rel = new EduClassStudent();
            rel.setClassId(id);
            rel.setStudentId(u.getUserId());
            count += classStudentMapper.insert(rel);
        }
        return AjaxResult.success("imported:" + count);
    }
}
