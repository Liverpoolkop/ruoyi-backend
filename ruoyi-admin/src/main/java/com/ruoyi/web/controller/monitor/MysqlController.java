package com.ruoyi.web.controller.monitor;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.StringUtils;

/**
 * MySQL监控
 * 
 * @author ruoyi
 */
@RestController
@RequestMapping("/monitor/mysql")
public class MysqlController
{
    @Autowired
    private JdbcTemplate jdbcTemplate;

    @PreAuthorize("@ss.hasPermi('monitor:mysql:list')")
    @GetMapping()
    public AjaxResult getInfo()
    {
        Map<String, Object> result = new HashMap<>();
        
        // 获取全局状态
        List<Map<String, Object>> statusList = jdbcTemplate.queryForList("SHOW GLOBAL STATUS");
        Map<String, String> statusMap = new HashMap<>();
        for (Map<String, Object> row : statusList) {
            statusMap.put((String) row.get("Variable_name"), String.valueOf(row.get("Value")));
        }

        // 获取全局变量
        List<Map<String, Object>> variableList = jdbcTemplate.queryForList("SHOW GLOBAL VARIABLES");
        Map<String, String> variableMap = new HashMap<>();
        for (Map<String, Object> row : variableList) {
            variableMap.put((String) row.get("Variable_name"), String.valueOf(row.get("Value")));
        }

        Map<String, Object> info = new HashMap<>();
        info.put("version", variableMap.get("version"));
        info.put("uptime", statusMap.get("Uptime"));
        info.put("threads_connected", statusMap.get("Threads_connected"));
        info.put("max_connections", variableMap.get("max_connections"));
        info.put("qps", statusMap.get("Questions")); // 简单近似
        info.put("tps", String.valueOf(Long.parseLong(statusMap.get("Com_commit")) + Long.parseLong(statusMap.get("Com_rollback"))));
        info.put("bytes_received", statusMap.get("Bytes_received"));
        info.put("bytes_sent", statusMap.get("Bytes_sent"));
        info.put("buffer_pool_size", variableMap.get("innodb_buffer_pool_size"));
        info.put("threads_running", statusMap.get("Threads_running"));
        info.put("slow_queries", statusMap.get("Slow_queries"));
        info.put("innodb_buffer_pool_pages_total", statusMap.get("Innodb_buffer_pool_pages_total"));
        info.put("innodb_buffer_pool_pages_free", statusMap.get("Innodb_buffer_pool_pages_free"));
        info.put("innodb_row_lock_waits", statusMap.get("Innodb_row_lock_waits"));
        info.put("aborted_connects", statusMap.get("Aborted_connects"));
        
        result.put("info", info);
        result.put("dbSize", 0); // MySQL db size calculation is complex, skip for now or use query

        // Command Stats
        List<Map<String, String>> pieList = new ArrayList<>();
        String[] cmds = {"Com_select", "Com_insert", "Com_update", "Com_delete", "Com_commit", "Com_rollback"};
        for (String cmd : cmds) {
            Map<String, String> data = new HashMap<>(2);
            data.put("name", StringUtils.removeStart(cmd, "Com_"));
            data.put("value", statusMap.getOrDefault(cmd, "0"));
            pieList.add(data);
        }
        result.put("commandStats", pieList);

        return AjaxResult.success(result);
    }
}
