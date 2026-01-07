package com.ruoyi.edu.mapper;

import com.ruoyi.edu.domain.EduQuestionBank;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EduQuestionBankMapper {

    List<EduQuestionBank> selectList(EduQuestionBank query);

    EduQuestionBank selectById(@Param("questionId") Long questionId, @Param("userId") Long userId);

    int insert(EduQuestionBank q);

    int update(EduQuestionBank q);

    int deleteById(@Param("questionId") Long questionId, @Param("userId") Long userId);
}
