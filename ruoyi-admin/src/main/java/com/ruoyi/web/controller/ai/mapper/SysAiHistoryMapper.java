package com.ruoyi.web.controller.ai.mapper;

import com.ruoyi.web.controller.ai.domain.SysAiHistory;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface SysAiHistoryMapper {
    // 插入一条记录
    @Insert("INSERT INTO sys_ai_history(user_id, role, content, create_time) VALUES(#{userId}, #{role}, #{content}, #{createTime})")
    int insertSysAiHistory(SysAiHistory history);

    // 查询某个用户的聊天记录（按时间正序）
    @Select("SELECT * FROM sys_ai_history WHERE user_id = #{userId} ORDER BY create_time ASC")
    List<SysAiHistory> selectAiHistoryList(Long userId);
}