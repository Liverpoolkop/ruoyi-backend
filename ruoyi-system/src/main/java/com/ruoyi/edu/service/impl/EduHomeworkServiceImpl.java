package com.ruoyi.edu.service.impl;

import com.ruoyi.common.utils.DateUtils;
import com.ruoyi.common.utils.SecurityUtils;
import com.ruoyi.edu.domain.EduHomework;
import com.ruoyi.edu.mapper.EduHomeworkMapper;
import com.ruoyi.edu.service.IEduHomeworkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EduHomeworkServiceImpl implements IEduHomeworkService {

    @Autowired
    private EduHomeworkMapper eduHomeworkMapper;

    @Override
    public int insertEduHomework(EduHomework homework) {
        if (homework.getStatus() == null) {
            homework.setStatus("0");
        }
        // 关键：写入创建人/创建时间
        homework.setCreateBy(SecurityUtils.getUsername());
        homework.setCreateTime(DateUtils.getNowDate());
        return eduHomeworkMapper.insertEduHomework(homework);
    }

    @Override
    public List<EduHomework> selectHomeworkListByCourseId(Long courseId) {
        return eduHomeworkMapper.selectHomeworkListByCourseId(courseId);
    }
}
