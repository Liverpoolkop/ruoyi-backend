package com.ruoyi.web.controller.system;

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
import com.ruoyi.system.domain.EduMessage;
import com.ruoyi.system.service.IEduMessageService;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 站内消息Controller
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/system/message")
public class EduMessageController extends BaseController
{
    @Autowired
    private IEduMessageService eduMessageService;

    /**
     * 查询站内消息列表
     */
    @GetMapping("/list")
    public TableDataInfo list(EduMessage eduMessage)
    {
        // Only list messages for current user
        eduMessage.setReceiverId(SecurityUtils.getUserId());
        startPage();
        List<EduMessage> list = eduMessageService.selectEduMessageList(eduMessage);
        return getDataTable(list);
    }
    
    /**
     * Get unread count
     */
    @GetMapping("/unread")
    public AjaxResult unread()
    {
        return AjaxResult.success(eduMessageService.selectUnreadCount(SecurityUtils.getUserId()));
    }

    /**
     * 获取站内消息详细信息
     */
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(eduMessageService.selectEduMessageById(id));
    }

    /**
     * 新增站内消息
     */
    @Log(title = "站内消息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody EduMessage eduMessage)
    {
        eduMessage.setSenderId(SecurityUtils.getUserId());
        return toAjax(eduMessageService.insertEduMessage(eduMessage));
    }

    /**
     * 修改站内消息
     */
    @Log(title = "站内消息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody EduMessage eduMessage)
    {
        return toAjax(eduMessageService.updateEduMessage(eduMessage));
    }
    
    /**
     * Mark as read
     */
    @PutMapping("/read/{id}")
    public AjaxResult read(@PathVariable Long id) {
        return toAjax(eduMessageService.readMessage(id));
    }

    /**
     * 删除站内消息
     */
    @Log(title = "站内消息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(eduMessageService.deleteEduMessageByIds(ids));
    }
}
