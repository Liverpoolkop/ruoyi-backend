package com.ruoyi.web.controller.ai;

import com.ruoyi.common.annotation.Anonymous;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.web.controller.ai.domain.ChatRequest;
import com.ruoyi.web.controller.ai.domain.ChatResponse;
import com.volcengine.ark.runtime.model.responses.constant.ResponsesConstants;
import com.volcengine.ark.runtime.model.responses.content.InputContentItemText;
import com.volcengine.ark.runtime.model.responses.content.OutputContentItemText;
import com.volcengine.ark.runtime.model.responses.item.ItemEasyMessage;
import com.volcengine.ark.runtime.model.responses.item.ItemOutputMessage;
import com.volcengine.ark.runtime.model.responses.item.MessageContent;
import com.volcengine.ark.runtime.model.responses.request.CreateResponsesRequest;
import com.volcengine.ark.runtime.model.responses.request.ResponsesInput;
import com.volcengine.ark.runtime.model.responses.response.ResponseObject;
import com.volcengine.ark.runtime.model.responses.tool.ToolWebSearch;
import com.volcengine.ark.runtime.service.ArkService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.List;

/**
 * AI 智能问答控制器
 */
@RestController
@RequestMapping("/api/ai")
public class AiChatController {

    // 1. 定义日志对象
    private static final Logger log = LoggerFactory.getLogger(AiChatController.class);

    // ⚠️ 记得检查这里是不是你的最新 Key 和 Endpoint ID
    private static final String API_KEY = "9b681730-e1d9-4105-a34b-3f201efb75a8";
    private static final String BASE_URL = "https://ark.cn-beijing.volces.com/api/v3";
    private static final String MODEL_ID = "kimi-k2-thinking-251104"; 

    @Anonymous
    @PostMapping("/chat")
    public AjaxResult chat(@RequestBody ChatRequest request) {
        // --- 日志埋点 1：请求进入 ---
        log.info("========== [AI] 收到前端请求 ==========");
        log.info("用户提问内容: {}", request.getMessage());
        
        if (request.getMessage() == null || request.getMessage().trim().isEmpty()) {
            return AjaxResult.error("请输入问题");
        }

        // 开始计时
        long startTime = System.currentTimeMillis();
        ArkService arkService = null;

        try {
            log.info("1. 正在初始化 ArkService...");
            arkService = ArkService.builder()
                    .apiKey(API_KEY)
                    .baseUrl(BASE_URL)
                    .build();

            log.info("2. 正在构建请求参数，模型ID: {}", MODEL_ID);
            CreateResponsesRequest req = CreateResponsesRequest.builder()
                    .model(MODEL_ID)
                    .input(ResponsesInput.builder().addListItem(
                            ItemEasyMessage.builder()
                                    .role(ResponsesConstants.MESSAGE_ROLE_USER)
                                    .content(MessageContent.builder()
                                            .addListItem(InputContentItemText.builder().text(request.getMessage()).build())
                                            .build()
                                    ).build()
                    ).build())
                    //.tools(Arrays.asList(ToolWebSearch.builder().build()))
                    .build();

            log.info("3. 开始调用火山引擎 API (此时可能会卡住等待)...");
            
            // --- 这里是最耗时的一步 ---
            ResponseObject resp = arkService.createResponse(req);
            
            long duration = System.currentTimeMillis() - startTime;
            log.info("4. 火山引擎返回响应！耗时: {} ms", duration);
            log.info("5. 原始响应对象: {}", resp); // 打印整个对象，看看是不是 null

            // 解析结果
            String cleanReply = extractContent(resp);
            log.info("6. 解析后的最终回复: {}", cleanReply);

            return AjaxResult.success(new ChatResponse(cleanReply));

        } catch (Exception e) {
            long duration = System.currentTimeMillis() - startTime;
            log.error("!!! AI 服务调用异常 !!! 耗时: {} ms", duration, e);
            return AjaxResult.error("AI 服务暂时不可用：" + e.getMessage());
        } finally {
            if (arkService != null) {
                arkService.shutdownExecutor();
            }
            log.info("========== [AI] 请求处理结束 ==========");
        }
    }

    private String extractContent(ResponseObject resp) {
        if (resp == null || resp.getOutput() == null) {
            log.warn("解析警告: 响应对象为空或Output为空");
            return "AI 未返回任何内容";
        }

        List<?> items = resp.getOutput();
        for (Object item : items) {
            if (item instanceof ItemOutputMessage) {
                ItemOutputMessage msgItem = (ItemOutputMessage) item;
                if (msgItem.getContent() != null && !msgItem.getContent().isEmpty()) {
                    Object contentItem = msgItem.getContent().get(0);
                    if (contentItem instanceof OutputContentItemText) {
                        return ((OutputContentItemText) contentItem).getText();
                    }
                }
            }
        }
        log.warn("解析警告: 未能匹配到文本内容，items结构: {}", items);
        return "无法解析 AI 回复的内容";
    }
}