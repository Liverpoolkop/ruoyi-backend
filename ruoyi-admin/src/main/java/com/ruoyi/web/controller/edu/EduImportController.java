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

    @PreAuthorize("hasAnyRole('TEACHER','ADMIN')")
    @PostMapping("/class/{id}/students")
    public AjaxResult importStudents(@PathVariable Long id, @RequestParam("file") MultipartFile file) throws Exception {
        ExcelUtil<StudentImportRow> util = new ExcelUtil<>(StudentImportRow.class);
        List<StudentImportRow> rows = util.importExcel(file.getInputStream());
        int count = 0;
        for (StudentImportRow row : rows) {
            // 假设前端提供的是已存在的用户 username 对应的 userId；这里可扩展为查库创建
            // 目前先跳过创建用户逻辑，仅示例将 studentId 置为 0
            EduClassStudent rel = new EduClassStudent();
            rel.setClassId(id);
            rel.setStudentId(0L);
            count += classStudentMapper.insert(rel);
        }
        return AjaxResult.success("imported:" + count);
    }
}
