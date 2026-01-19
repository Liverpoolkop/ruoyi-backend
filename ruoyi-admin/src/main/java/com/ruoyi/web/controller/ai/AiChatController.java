package com.ruoyi.web.controller.ai;

import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.web.controller.ai.domain.ChatRequest;
import com.ruoyi.web.controller.ai.domain.ChatResponse;
import com.ruoyi.web.controller.ai.domain.SysAiHistory;
import com.ruoyi.web.controller.ai.mapper.SysAiHistoryMapper;
import com.volcengine.ark.runtime.model.responses.constant.ResponsesConstants;
import com.volcengine.ark.runtime.model.responses.content.InputContentItemText;
import com.volcengine.ark.runtime.model.responses.content.OutputContentItemText;
import com.volcengine.ark.runtime.model.responses.item.ItemEasyMessage;
import com.volcengine.ark.runtime.model.responses.item.ItemOutputMessage;
import com.volcengine.ark.runtime.model.responses.item.MessageContent;
import com.volcengine.ark.runtime.model.responses.request.CreateResponsesRequest;
import com.volcengine.ark.runtime.model.responses.request.ResponsesInput;
import com.volcengine.ark.runtime.model.responses.response.ResponseObject;
import com.volcengine.ark.runtime.service.ArkService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * AI 智能问答控制器
 */
@RestController
@RequestMapping("/api/ai")
public class AiChatController {

    private static final Logger log = LoggerFactory.getLogger(AiChatController.class);

    // 注入 Mapper 用于数据库操作
    @Autowired
    private SysAiHistoryMapper historyMapper;

    // ⚠️ 你的配置
    private static final String API_KEY = "9b681730-e1d9-4105-a34b-3f201efb75a8";
    private static final String BASE_URL = "https://ark.cn-beijing.volces.com/api/v3";
    private static final String MODEL_ID = "kimi-k2-thinking-251104";

    /**
     * 获取当前用户的历史对话记录
     */
    @GetMapping("/history")
    public AjaxResult getHistory() {
        Long userId = SecurityUtils.getUserId();
        // 查询数据库，按时间排序
        List<SysAiHistory> list = historyMapper.selectAiHistoryList(userId);
        return AjaxResult.success(list);
    }

    /**
     * AI 对话接口 (已移除 @Anonymous，必须登录)
     */
    @PostMapping("/chat")
    public AjaxResult chat(@RequestBody ChatRequest request) {
        log.info("========== [AI] 收到前端请求 ==========");
        log.info("用户提问内容: {}", request.getMessage());
        
        if (request.getMessage() == null || request.getMessage().trim().isEmpty()) {
            return AjaxResult.error("请输入问题");
        }

        // 1. 获取当前登录用户ID
        Long userId = SecurityUtils.getUserId();

        // 2. 【核心】保存【用户】的消息到数据库
        SysAiHistory userMsg = new SysAiHistory();
        userMsg.setUserId(userId);
        userMsg.setRole("user");
        userMsg.setContent(request.getMessage());
        userMsg.setCreateTime(new Date());
        historyMapper.insertSysAiHistory(userMsg);

        long startTime = System.currentTimeMillis();
        ArkService arkService = null;

        try {
            log.info("1. 正在初始化 ArkService...");
            arkService = ArkService.builder()
                    .apiKey(API_KEY)
                    .baseUrl(BASE_URL)
                    .build();

            log.info("2. 正在构建请求参数，模型ID: {}", MODEL_ID);
            // 定义你的提示词（人设）
            String systemPrompt = "你是一个专业的AI智能教学助手，名字叫'智能教学小助手'。\n" +
                                  "你的职责是解答学生的学习疑问，提供学习路线和建议。\n" +
                                  "回答要求：\n" +
                                  "1. 语气亲切、积极、富有鼓励性。\n" +
                                  "2. 对复杂的概念要用通俗易懂的例子解释。\n" +
                                  "3. 使用Markdown格式清晰排版。\n" +
                                  "4. 严禁回答由于政治、色情等违法违规内容。";

            CreateResponsesRequest req = CreateResponsesRequest.builder()
                    .model(MODEL_ID)
                    .input(ResponsesInput.builder()
                            // 👇👇👇 【新增】第一步：添加系统人设 (System Message) 👇👇👇
                            .addListItem(
                                    ItemEasyMessage.builder()
                                            .role(ResponsesConstants.MESSAGE_ROLE_SYSTEM) // 角色是 SYSTEM
                                            .content(MessageContent.builder()
                                                    .addListItem(InputContentItemText.builder().text(systemPrompt).build())
                                                    .build()
                                            ).build()
                            )
                            // 【新增结束】 

                            // 第二步：添加用户的提问 (User Message)
                            .addListItem(
                                    ItemEasyMessage.builder()
                                            .role(ResponsesConstants.MESSAGE_ROLE_USER) // 角色是 USER
                                            .content(MessageContent.builder()
                                                    .addListItem(InputContentItemText.builder().text(request.getMessage()).build())
                                                    .build()
                                            ).build()
                            )
                    .build())
                    // .tools(...) // 保持注释
                    .build();

            log.info("3. 开始调用火山引擎 API...");
            ResponseObject resp = arkService.createResponse(req);
            
            long duration = System.currentTimeMillis() - startTime;
            log.info("4. 火山引擎返回响应！耗时: {} ms", duration);

            // 解析结果
            String cleanReply = extractContent(resp);
            log.info("6. 解析后的最终回复: {}", cleanReply);

            // 3. 【核心】保存【AI】的消息到数据库
            SysAiHistory aiMsg = new SysAiHistory();
            aiMsg.setUserId(userId);
            aiMsg.setRole("ai");
            aiMsg.setContent(cleanReply);
            aiMsg.setCreateTime(new Date());
            historyMapper.insertSysAiHistory(aiMsg);

            return AjaxResult.success(new ChatResponse(cleanReply));

        } catch (Exception e) {
            long duration = System.currentTimeMillis() - startTime;
            log.error("!!! AI 服务调用异常 !!! 耗时: {} ms", duration, e);
            // 即使报错，也返回成功状态码并带有错误提示，避免前端报“网络错误”
            return AjaxResult.success(new ChatResponse("AI 思考超时或出错，请稍后再试。"));
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