package com.ruoyi.edu.service;

import com.ruoyi.edu.domain.EduQuestionBank;

import java.util.List;

public interface IEduQuestionBankService {
    List<EduQuestionBank> list(EduQuestionBank query);
    EduQuestionBank get(Long questionId);
    int add(EduQuestionBank q);
    int edit(EduQuestionBank q);
    int remove(Long questionId);
}
