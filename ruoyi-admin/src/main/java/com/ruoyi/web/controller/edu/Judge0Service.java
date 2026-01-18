package com.ruoyi.web.controller.edu;

import java.util.HashMap;
import java.util.Map;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 * Judge0 API服务 - 代码编译执行服务
 */
@Service
public class Judge0Service {

    private static final String API_URL = "https://judge0-ce.p.rapidapi.com";
    private static final String API_HOST = "judge0-ce.p.rapidapi.com";
    private static final String API_KEY = "ef2b6244f1mshf634226c156e3aep1a15e8jsn85349687e5be";

    /** Java语言ID (OpenJDK 13.0.1) */
    private static final int JAVA_LANGUAGE_ID = 62;

    private final RestTemplate restTemplate = new RestTemplate();

    /**
     * 创建HTTP请求头
     */
    private HttpHeaders createHeaders() {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("x-rapidapi-host", API_HOST);
        headers.set("x-rapidapi-key", API_KEY);
        return headers;
    }

    /**
     * 提交代码并获取执行结果（同步等待）
     * 
     * @param sourceCode     源代码
     * @param stdin          标准输入
     * @param expectedOutput 期望输出（用于判题）
     * @return 执行结果
     */
    public Map<String, Object> submitAndWait(String sourceCode, String stdin, String expectedOutput) {
        try {
            // 构建请求体
            Map<String, Object> requestBody = new HashMap<>();
            requestBody.put("source_code", sourceCode);
            requestBody.put("language_id", JAVA_LANGUAGE_ID);
            requestBody.put("stdin", stdin != null ? stdin : "");
            if (expectedOutput != null && !expectedOutput.isEmpty()) {
                requestBody.put("expected_output", expectedOutput);
            }

            HttpHeaders headers = createHeaders();
            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(requestBody, headers);

            // 提交代码并等待结果 (wait=true)
            String url = API_URL + "/submissions?base64_encoded=false&wait=true";
            ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.POST, entity, Map.class);

            if (response.getBody() != null) {
                return response.getBody();
            }

            Map<String, Object> errorResult = new HashMap<>();
            errorResult.put("error", "无法获取执行结果");
            return errorResult;

        } catch (Exception e) {
            Map<String, Object> errorResult = new HashMap<>();
            errorResult.put("error", "调用Judge0 API失败: " + e.getMessage());
            return errorResult;
        }
    }

    /**
     * 仅运行代码（不判题）
     */
    public Map<String, Object> runCode(String sourceCode, String stdin) {
        return submitAndWait(sourceCode, stdin, null);
    }

    /**
     * 运行并判题
     */
    public Map<String, Object> judgeCode(String sourceCode, String stdin, String expectedOutput) {
        return submitAndWait(sourceCode, stdin, expectedOutput);
    }

    /**
     * 解析状态描述
     */
    public String getStatusDescription(Map<String, Object> result) {
        if (result.containsKey("status")) {
            Map<String, Object> status = (Map<String, Object>) result.get("status");
            if (status != null && status.containsKey("description")) {
                return (String) status.get("description");
            }
        }
        return "Unknown";
    }
}
