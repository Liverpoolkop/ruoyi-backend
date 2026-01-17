package com.ruoyi.web.controller.edu;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.edu.domain.EduResource;
import com.ruoyi.edu.service.IEduResourceService;

import com.ruoyi.edu.mapper.EduCourseMapper;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.framework.web.service.PermissionService;
import com.ruoyi.system.service.MinioService;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.RequestParam;

@RestController
@RequestMapping("/edu/resource")
public class EduResourceController extends BaseController {
    @Autowired
    private IEduResourceService eduResourceService;
    @Autowired
    private EduCourseMapper courseMapper;
    @Autowired
    private PermissionService permissionService;
    @Autowired
    private MinioService minioService;

    private boolean checkPerm(Long courseId) {
        if (permissionService.hasPermi("system:course:edit")) return true;
        if (courseId == null) return false;
        Long userId = SecurityUtils.getUserId();
        java.util.List<Long> teacherIds = courseMapper.selectTeacherIdsByCourseId(courseId);
        return teacherIds.contains(userId);
    }

    @GetMapping("/list")
    public AjaxResult list(EduResource eduResource) {
        List<EduResource> list = eduResourceService.selectResourceList(eduResource);
        return AjaxResult.success(list);
    }

    @GetMapping(value = "/{resourceId}")
    public AjaxResult getInfo(@PathVariable("resourceId") Long resourceId) {
        return AjaxResult.success(eduResourceService.selectResourceById(resourceId));
    }

    // @PreAuthorize("@ss.hasPermi('system:course:edit')")
    @Log(title = "课程资源", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EduResource eduResource) {
        if (!checkPerm(eduResource.getCourseId())) return AjaxResult.error("无权限");
        return toAjax(eduResourceService.insertResource(eduResource));
    }

    // @PreAuthorize("@ss.hasPermi('system:course:edit')")
    @Log(title = "课程资源", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EduResource eduResource) {
        EduResource existing = eduResourceService.selectResourceById(eduResource.getResourceId());
        if (existing == null) return AjaxResult.error("资源不存在");
        if (!checkPerm(existing.getCourseId())) return AjaxResult.error("无权限");
        return toAjax(eduResourceService.updateResource(eduResource));
    }

    // @PreAuthorize("@ss.hasPermi('system:course:edit')")
    @Log(title = "课程资源", businessType = BusinessType.DELETE)
    @DeleteMapping("/{resourceIds}")
    public AjaxResult remove(@PathVariable Long[] resourceIds) {
        if (resourceIds.length > 0) {
            EduResource r = eduResourceService.selectResourceById(resourceIds[0]);
            if (r != null && !checkPerm(r.getCourseId())) return AjaxResult.error("无权限");
        }
        return toAjax(eduResourceService.deleteResourceByIds(resourceIds));
    }

    @PostMapping("/upload")
    public AjaxResult uploadResource(@RequestParam("file") MultipartFile file) throws Exception
    {
        try
        {
            String url = minioService.uploadFile(file);
            AjaxResult ajax = AjaxResult.success();
            ajax.put("url", url);
            ajax.put("fileName", file.getOriginalFilename());
            return ajax;
        }
        catch (Exception e)
        {
            return AjaxResult.error(e.getMessage());
        }
    }
}
