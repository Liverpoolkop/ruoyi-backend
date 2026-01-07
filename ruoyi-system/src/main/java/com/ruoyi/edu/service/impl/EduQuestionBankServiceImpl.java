package com.ruoyi.edu.service.impl;

import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.edu.domain.EduQuestionBank;
import com.ruoyi.edu.mapper.EduQuestionBankMapper;
import com.ruoyi.edu.service.IEduQuestionBankService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EduQuestionBankServiceImpl implements IEduQuestionBankService {

    @Resource
    private EduQuestionBankMapper mapper;

    @Override
    public List<EduQuestionBank> list(EduQuestionBank query) {
        query.setUserId(SecurityUtils.getUserId());
        return mapper.selectList(query);
    }

    @Override
    public EduQuestionBank get(Long questionId) {
        Long uid = SecurityUtils.getUserId();
        return mapper.selectById(questionId, uid);
    }

    @Override
    public int add(EduQuestionBank q) {
        q.setUserId(SecurityUtils.getUserId());
        if (q.getStatus() == null) q.setStatus("0");
        return mapper.insert(q);
    }

    @Override
    public int edit(EduQuestionBank q) {
        q.setUserId(SecurityUtils.getUserId());
        return mapper.update(q);
    }

    @Override
    public int remove(Long questionId) {
        Long uid = SecurityUtils.getUserId();
        return mapper.deleteById(questionId, uid);
    }
}
