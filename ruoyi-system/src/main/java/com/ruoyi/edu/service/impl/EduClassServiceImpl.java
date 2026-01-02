package com.ruoyi.edu.service.impl;

import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;

import com.ruoyi.edu.service.IEduClassService;
import com.ruoyi.edu.domain.EduClass;
import com.ruoyi.edu.mapper.EduClassMapper;

@Service
public class EduClassServiceImpl implements IEduClassService {
    @Resource
    private EduClassMapper mapper;

    @Override
    public EduClass selectById(Long id) { return mapper.selectById(id); }

    @Override
    public List<EduClass> selectList(EduClass query) { return mapper.selectList(query); }

    @Override
    public List<EduClass> selectJoinedClasses(Long studentId) { return mapper.selectByStudentId(studentId); }

    @Override
    @Transactional
    public int create(EduClass c) { return mapper.insert(c); }

    @Override
    @Transactional
    public int update(EduClass c) { return mapper.update(c); }

    @Override
    @Transactional
    public int delete(Long id) { return mapper.deleteById(id); }
}
