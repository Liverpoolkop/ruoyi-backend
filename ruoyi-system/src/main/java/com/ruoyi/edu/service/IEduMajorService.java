package com.ruoyi.edu.service;

import java.util.List;
import com.ruoyi.edu.domain.EduMajor;

/**
 * 专业信息Service接口
 * 
 * @author moon
 * @date 2025-12-31
 */
public interface IEduMajorService 
{
    /**
     * 查询专业信息
     * 
     * @param majorId 专业信息主键
     * @return 专业信息
     */
    public EduMajor selectEduMajorByMajorId(Long majorId);

    /**
     * 查询专业信息列表
     * 
     * @param eduMajor 专业信息
     * @return 专业信息集合
     */
    public List<EduMajor> selectEduMajorList(EduMajor eduMajor);

    /**
     * 新增专业信息
     * 
     * @param eduMajor 专业信息
     * @return 结果
     */
    public int insertEduMajor(EduMajor eduMajor);

    /**
     * 修改专业信息
     * 
     * @param eduMajor 专业信息
     * @return 结果
     */
    public int updateEduMajor(EduMajor eduMajor);

    /**
     * 批量删除专业信息
     * 
     * @param majorIds 需要删除的专业信息主键集合
     * @return 结果
     */
    public int deleteEduMajorByMajorIds(Long[] majorIds);

    /**
     * 删除专业信息信息
     * 
     * @param majorId 专业信息主键
     * @return 结果
     */
    public int deleteEduMajorByMajorId(Long majorId);
}
