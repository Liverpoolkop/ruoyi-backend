package com.ruoyi.web.controller.ai.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import java.util.Date;

public class SysAiHistory extends BaseEntity {
    private Long historyId;
    private Long userId;
    private String role; // "user" 或 "ai"
    private String content;
    private Date createTime;

    // 构造函数
    public SysAiHistory() {}
    public SysAiHistory(Long userId, String role, String content) {
        this.userId = userId;
        this.role = role;
        this.content = content;
        this.createTime = new Date();
    }

    // Getter & Setter
    public Long getHistoryId() { return historyId; }
    public void setHistoryId(Long historyId) { this.historyId = historyId; }
    public Long getUserId() { return userId; }
    public void setUserId(Long userId) { this.userId = userId; }
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }
    public Date getCreateTime() { return createTime; }
    public void setCreateTime(Date createTime) { this.createTime = createTime; }
}