package com.ruoyi.edu.service.impl;

import java.util.List;
import com.ruoyi.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.edu.mapper.EduMajorMapper;
import com.ruoyi.edu.domain.EduMajor;
import com.ruoyi.edu.service.IEduMajorService;

/**
 * 专业信息Service业务层处理
 * 
 * @author moon
 * @date 2025-12-31
 */
@Service
public class EduMajorServiceImpl implements IEduMajorService 
{
    @Autowired
    private EduMajorMapper eduMajorMapper;

    /**
     * 查询专业信息
     * 
     * @param majorId 专业信息主键
     * @return 专业信息
     */
    @Override
    public EduMajor selectEduMajorByMajorId(Long majorId)
    {
        return eduMajorMapper.selectEduMajorByMajorId(majorId);
    }

    /**
     * 查询专业信息列表
     * 
     * @param eduMajor 专业信息
     * @return 专业信息
     */
    @Override
    public List<EduMajor> selectEduMajorList(EduMajor eduMajor)
    {
        return eduMajorMapper.selectEduMajorList(eduMajor);
    }

    /**
     * 新增专业信息
     * 
     * @param eduMajor 专业信息
     * @return 结果
     */
    @Override
    public int insertEduMajor(EduMajor eduMajor)
    {
        eduMajor.setCreateTime(DateUtils.getNowDate());
        return eduMajorMapper.insertEduMajor(eduMajor);
    }

    /**
     * 修改专业信息
     * 
     * @param eduMajor 专业信息
     * @return 结果
     */
    @Override
    public int updateEduMajor(EduMajor eduMajor)
    {
        eduMajor.setUpdateTime(DateUtils.getNowDate());
        return eduMajorMapper.updateEduMajor(eduMajor);
    }

    /**
     * 批量删除专业信息
     * 
     * @param majorIds 需要删除的专业信息主键
     * @return 结果
     */
    @Override
    public int deleteEduMajorByMajorIds(Long[] majorIds)
    {
        return eduMajorMapper.deleteEduMajorByMajorIds(majorIds);
    }

    /**
     * 删除专业信息信息
     * 
     * @param majorId 专业信息主键
     * @return 结果
     */
    @Override
    public int deleteEduMajorByMajorId(Long majorId)
    {
        return eduMajorMapper.deleteEduMajorByMajorId(majorId);
    }
}
