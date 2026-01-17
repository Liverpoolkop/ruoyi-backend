package com.ruoyi.web.controller.edu;

import java.io.FileInputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.validation.annotation.Validated;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.utils.file.FileUtils;
import com.ruoyi.edu.domain.TeachingResource;
import com.ruoyi.edu.service.ITeachingResourceService;
import com.ruoyi.edu.mapper.EduCourseMapper;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

@RestController
@RequestMapping("/education/resource")
public class TeachingResourceController extends BaseController {

    @Autowired
    private ITeachingResourceService resourceService;
    
    @Autowired
    private EduCourseMapper courseMapper; // 借用这个Mapper查权限，确保操作人是老师

    /**
     * 查询教学资源列表
     */
    // 改为：只要登录了就能调这个接口
    @PreAuthorize("isAuthenticated()") 
    @GetMapping("/list")
    public TableDataInfo list(TeachingResource teachingResource) {
        startPage();
        List<TeachingResource> list = resourceService.selectTeachingResourceList(teachingResource);
        return getDataTable(list);
    }

    /**
     * 新增教学资源
     */
    // 改为：只要登录了就能进，进去后再由内部逻辑判断是不是老师
    @PreAuthorize("isAuthenticated()") 
    @PostMapping
    @Log(title = "教学资源", businessType = BusinessType.INSERT)
    public AjaxResult add(@Validated @RequestBody TeachingResource resource) {
        if (resource.getCourseId() == null) {
            return AjaxResult.error("必须关联课程");
        }
        
        // 简单的权限校验：只有管理员或该课程的老师可以上传
        Long userId = SecurityUtils.getUserId();
        if (!SecurityUtils.isAdmin(userId)) {
            // 需要去 EduCourseMapper 确认 selectTeacherIdsByCourseId 方法存在
            List<Long> teacherIds = courseMapper.selectTeacherIdsByCourseId(resource.getCourseId());
            if (!teacherIds.contains(userId)) {
                return AjaxResult.error("只有本课程讲师可以上传资源");
            }
        }

        resource.setCreateBy(SecurityUtils.getUsername());
        return toAjax(resourceService.insertTeachingResource(resource));
    }

    /**
     * 删除教学资源
     */
    // 改为：只要登录了就能进
    @PreAuthorize("isAuthenticated()")
    @DeleteMapping("/{resourceIds}")
    @Log(title = "教学资源", businessType = BusinessType.DELETE)
    public AjaxResult remove(@PathVariable Long[] resourceIds) {
        // 简化处理，直接删除
        for (Long id : resourceIds) {
             resourceService.deleteTeachingResourceById(id);
        }
        return AjaxResult.success();
    }

    /**
     * 教学资源下载（自动增加下载次数）
     */
    @PreAuthorize("isAuthenticated()")
    @GetMapping("/download/{resourceId}")
    public void download(@PathVariable("resourceId") Long resourceId, HttpServletResponse response, HttpServletRequest request)
    {
        try {
            // 1. 查出资源信息
            TeachingResource resource = resourceService.selectTeachingResourceById(resourceId);
            if (resource == null) {
                throw new RuntimeException("资源不存在");
            }

            // 2. 拼接绝对路径
            String localPath = RuoYiConfig.getProfile() + resource.getFilePath().replace("/profile", "");
            File file = new File(localPath);
            
            // 3. 检查文件是否存在
            if (!file.exists()) {
                throw new RuntimeException("文件不存在: " + localPath);
            }

            // 4. 增加下载次数
            resourceService.incrementDownloadCount(resourceId);

            // 5. 准备文件名
            String downloadName = resource.getOriginName();
            if (downloadName == null || "".equals(downloadName)) {
                downloadName = resource.getResourceName(); 
            }

            // --- 核心修改：手写响应头和流传输（避开 FileUtils 的坑）---
            
            // A. 设置 Content-Type
            response.setContentType("application/octet-stream");
            
            // B. 设置文件大小（这样前端才有进度条）
            response.setContentLength((int) file.length());
            
            // C. 处理文件名编码（防止中文乱码）
            String encodedFileName = URLEncoder.encode(downloadName, "UTF-8").replaceAll("\\+", "%20");
            response.setHeader("Content-Disposition", "attachment; filename=" + encodedFileName);

            // D. 也就是原来 FileUtils.writeBytes 干的事，我们手动干
            try (InputStream inputStream = new FileInputStream(file);
                OutputStream outputStream = response.getOutputStream()) {
                
                byte[] buffer = new byte[4096]; // 每次读 4KB
                int length;
                while ((length = inputStream.read(buffer)) > 0) {
                    outputStream.write(buffer, 0, length);
                }
                outputStream.flush();
            }
            
            System.out.println("下载成功：流传输完成");

        } catch (Exception e) {
            System.err.println("下载失败：" + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * 修改教学资源状态
     */
    @PreAuthorize("isAuthenticated()")
    @Log(title = "教学资源", businessType = BusinessType.UPDATE)
    @PutMapping // 对应前端的 method: 'put'
    public AjaxResult edit(@RequestBody TeachingResource teachingResource)
    {
        // 这里的 teachingResource 会接收前端传来的 { resourceId: 101, status: "1" }
        return toAjax(resourceService.updateTeachingResource(teachingResource));
    }
}